import random
import time

import Assembly.AVX as AVX
import Assembly.CodeBlocks as CodeBlocks
import Assembly.TypeSizes as TypeSizes
import Classes.ExpressionComponent as EC
import Classes.Optimizer
import config
from Assembly.AVX import (avx_correctSize, avx_doToReg, avx_dropToAddress,
                          avx_loadToReg, avx_ralloc, avx_rfree)
from Assembly.CodeBlocks import (allocate_readonly, checkTrue,
                                 createIntrinsicHeap, createStringConstant,
                                 deregisterizeValueType, doFloatOperation,
                                 doIntOperation, extra_parameterlabel, fncall,
                                 function_allocator, function_closer,
                                 functionlabel, getLogicLabel, loadToPtr,
                                 loadToReg, maskset, movMemVar, movRegToVar,
                                 movVarToReg, pack_string, raw_regmov,
                                 registerizeValueType, spop, spush, syscall,
                                 valueOf, win_align_stack, win_unalign_stack,
                                 zeroize)
from Assembly.Instructions import Instruction, floatTo32h, floatTo64h
from Assembly.Registers import *
from Assembly.TypeSizes import INTMAX, dwordImmediate, isfloat
from Classes.Constexpr import buildConstantSet, determineConstexpr
from Classes.DType import DType, typematch
from Classes.Error import *
from Classes.Token import *
from Classes.Variable import *
from ExpressionEvaluator import (ExpressionEvaluator, LeftSideEvaluator,
                                 depositFinal, optloadRegs)
from globals import (BOOL, CHAR, DOUBLE, INT, LONG, OPERATORS, SHORT, VOID,
                     TsCompatible, isIntrinsic)
from Optimizers.Intraprocedural import IntraproceduralOptimizer
from Optimizers.LoopOptimizer import LoopOptimizer
from Optimizers.Peephole import Peephole
from Postfixer import Postfixer

# multiply all items in an array


def product(arr):
    total = arr[0]
    for i in arr[1:]:
        total *= i
    return total


# pre-defined builtin functions
predefs = [
    "typeof",
    "sizeof",
    "typeid",
    "__isflt",
    "__syscall",
    "static_assert"
]


###################################################
#
#   The Function class is where the bulk of compilation occurs.
#   Function objects are isolated and created by compiler objects.
#
#
#
#####################################################
class Function:
    def __init__(self, name, parameters, returntype, compiler,
                 tokens, inline=False, extern=False, compileCount=0, memberfn=False,
                 parentstruct=None, return_auto=False, declare_token=None, winextern=False,
                 lambdas=[]):
        self.name = name                        # fn name
        self.parameters = parameters            # list:Variable parameters
        self.returntype = returntype              # DType: return type
        self.compiler = compiler                # Parent
        self.tokens = tokens                    # All Tokens
        self.asm = "\n"                         # raw assembly output

        # determine if function is member, and if so what is
        # its parent.
        self.memberfn = memberfn
        self.parentstruct = parentstruct

        self.stackCounter = 8                   # counter to keep track of stacksize
        self.stackTotal = 8                     # maintain total count
        self.variables = []                     # all local variables

        self.declare_token = declare_token

        # a hash table of indexes in self.variables
        # for faster access during compiletime
        # fmt: "<name>": <idx>
        # idx being the index in self.variables
        self.variable_reference = {}

        # inline functions behave like macros, and are not called
        self.inline = inline
        # stack containing labels to jump to if the "continue" keyword is used
        self.continues = []
        # stack containing labels to jump to if the "break" keyword is used
        self.breaks = []

        self.lambdas = []
        self.lambdaCount = 0

        self.current_token = self.tokens[0] if len(
            self.tokens) > 0 else None     # current token
        self.ctidx = 0                          # corrent token index
        self.maxtokens = len(self.tokens)   # one len call

        # extern is in reference to c-standard names vs .k names
        self.extern = extern or winextern

        self.winextern = winextern

        # Variardic functions will behave slightly differently.
        # They are defined using the '...' token in their parameters,
        # because they take an arbitrary number of parameters.
        self.variardic = False

        # user labels are custom labels embedded in the code itself. EX:
        #   {
        #       mylabel:
        #       ...
        #       goto mylabel;
        #
        #  }
        #
        # in the array they take the form of dictionaries: userlables =      {"username":"assembly-name"}
        # each user-defined label will have a corresponding assembly label.
        self.userlabels = {}

        self.destructor_text = ""               # automatically called destructors

        # used for read-only values generated during compiletime that can be
        # stored in .text
        self.suffix = ""

        # number of times this function has been re-compiled in optimization
        self.compileCount = compileCount

        # \see Assembly.Instructions.Peephole
        self.peephole = Peephole()              # optimizer

        # remaining available register declarations (normal regs)
        self.regdeclremain_norm = 2
        # remaining available register declarations (sse)
        self.regdeclremain_sse = 4
        # ExpressionComponents to keep track of register declarations
        self.regdecls = []

        # Static variables will not inherit their actual name in the final assembly,
        # this is where their actual labels can be associated with their given
        # names.
        self.staticnameref = {

        }

        # The local state stack stores the state of the local scope in a stack,
        # so that temporary stack variables can be pushed and popped at will.
        # For example, any declarations defined inside an if statement will need to be
        # removed by pushing the stack state before the if statement, and
        # popping it after.
        self.localstate_stack = []

        # Parameter information:
        #   number of sse parameter registers used
        self.ssepcount = 0
        #   number of normal parameter registers used
        self.normpcount = 0
        #   number of extra memory-stored registers are used
        self.extra_params = 0
        # the above information is set externally by the compiler class

        # monitoring:

        # Functions declared with the auto keyword as their type will have to determine
        # their own returntype. This flag specifies that a function is declared
        # with auto.
        self.return_auto = return_auto

        # determine if a function is a placeholder or a properly assigned
        # function
        self.unassigned = True

        # hasReturned keeps track of if a function has made a guarenteed return.
        # A guarenteed return is one not inside any other control structure, and that
        # will always happen.
        self.hasReturned = False

        # containsReturn keeps track of if a function returns under any conditions at all
        # (other than just reaching then end).
        self.containsReturn = False

        # if the return value is a constexpr
        self.returnsConstexpr = False
        self.constexpr_returnvalue = 0

        # Set to true when there is inline assembly used in a function so that
        # return / parameter warnings and optimziations do not interfere with user
        # generated assembly.
        self.contains_rawasm = False

        # The isReturning flag is set when the function is compiling the return statement
        # in order to signifiy that certain extra optimizations can be made. For example,
        # register declarations do not need to be saved or restored during the return statement
        # because they will go out of scope anyway.
        self.isReturning = False

        # recursive_depth keeps track of how many control-structures deep the function is.
        # so, for example:
        #
        #   recursive_depth = 0;
        #   if(...){
        #       ...
        #       recursive_depth = 1;
        #       switch(...){
        #           case ... {
        #               recursive_depth = 2;
        #               break;
        #           }
        #
        #       }
        #       recursive_depth = 1;
        #
        #
        #   }
        #   recursive_depth = 0;
        #
        self.recursive_depth = 0
        self.max_depth = 0

        # canbeInline is used to determine if the compiler can safely make
        # a function inline without the user specifically defining it as such
        self.canbeInline = True

        # isCompiled is used to determine if the function has already been
        # compiled.
        self.isCompiled = False

        # closing label is the label placed right before the stack exit and return in the
        # assembly of a function. It will be different for an inline vs regular
        # function.
        self.closinglabel = self.getClosingLabel()

        # used to differentiate between template functions and regular
        # functions
        self.isTemplate = False
        self.template_types = []

        # Features

        # count the number of other functions called to enable, with high optimization level,
        # implicit parameter register declaration.
        self.fncalls = 0
        self.implicit_paramregdecl = False

        # track unused / removable variables that can be optimized out in
        # oplvl3
        self.unreferenced = []

        # Size optimization:

        # When size optimization is being ran, functions are not inlined. This
        # flag stores weather or not this function would have been inline
        # otherwise
        self.wouldbe_inline = False
        # Count the number of times this function is called
        self.references = 0
    # advance token

    def advance(self) -> Token:
        # increment
        self.ctidx += 1
        # ensure bounds
        if(self.ctidx == self.maxtokens):
            throw(UnexepectedEOFError(self.tokens[-1]))
        # update token
        self.current_token = self.tokens[self.ctidx]
        # return token
        return self.current_token

    # get the raw asm label used to call this function

    def getCallingLabel(self) -> str:
        return functionlabel(self).replace(":", "").replace("\n", "")

    # check current token for semicolon
    def checkSemi(self) -> None:
        if(self.current_token.tok != T_ENDL):
            throw(ExpectedSemicolon(self.current_token))
        self.advance()

    def getUserlabel(self, name) -> str:
        if name in self.userlabels:
            return self.userlabels[name]
        else:
            l = getLogicLabel(name)
            self.userlabels[name] = l
            return l

    def checkTok(self, tok):                        # check current token for given token
        if(self.current_token.tok != tok):
            throw(ExpectedToken(self.current_token, tok))
        out = self.current_token.value
        self.advance()
        return out

    # get raw asm label used to denote the end of this function
    def getClosingLabel(self):
        return function_closer(self.getCallingLabel(), None, self).split(
            "\n")[0] if not self.inline else (getLogicLabel("INLINERETURN") + ":")

    # get a variable of name q from first local then global scope if necessary

    def getVariable(self, q):
        if q in self.variable_reference:
            return self.variables[self.variable_reference[q]]
        elif q in self.staticnameref:
            return self.variables[self.variable_reference[self.staticnameref[q]]]
        else:
            return self.compiler.getGlob(q)

        # return next((v for v in self.variables if (v.name if not v.static else self.staticnameref[v.name]) == q),
        #            self.compiler.getGlob(q))

    def append_rawVariable(self, var):
        self.variables.append(var)
        self.variable_reference[var.name] = len(self.variables) - 1
        return var

    def popVar(self):
        v = self.variables.pop()
        del self.variable_reference[v.name]
        return v

    # add a given variable, and set its stack offset

    def addVariable(self, v, add_token=True):

        v.offset = self.stackCounter
        if add_token:
            v.dtok = self.tokens[self.ctidx + 1]
        # self.stackCounter += v.t.size(0)
        if(v.register is None):
            if v.t.csize() <= 8:
                self.stackCounter += 8
            else:
                self.stackCounter += v.t.csize()
                if not v.isStackarr:
                    v.stackarrsize = v.t.csize()
        self.append_rawVariable(v)

    # skip a open and close scope body. Example:
    # if ( ... ) { ... }
    #            ^-----^
    #
    # This is used when the compiler can determine that
    # a control structure will never be executed, so its
    # body is skipped.
    #
    def skipBody(self):
        # self.advance()
        #restore = len(self.asm)
        # self.compileBodyScope()
        #self.asm = self.asm[:restore]
        self.advance()
        opens = 1
        while(opens != 0):
            self.advance()
            if(self.current_token.tok == T_OPENSCOPE):
                opens += 1
            elif(self.current_token.tok == T_CLSSCOPE):
                opens -= 1

    def addline(self, l):                           # add a line of assembly to raw

        self.asm = f"{self.asm}{l}\n"

    def addcomment(self, c):                        # add a comment to the assembly
        self.asm += ";" + c + "\n"

    def qgettfn(self, fnname):
        return next(
            (fn for fn in self.compiler.template_functions if fn.name == fnname), None)

    def getTemplateFunction(self, fnname, ptypes, ttypes):

        template = next(
            (fn for fn in self.compiler.template_functions if fn.name == fnname and len(
                fn.parameters) == len(ptypes)), None)
        if(template is None):
            return template
        return self.compiler.buildTemplateFunction(
            template, template.template_types, ttypes)

    # get function with name fn and datatypes types, or a suitable replacement
    # (casting)

    def getFunction(self, fn, types, rettype=None,
                    searchlist=None, loose=True):

        # searchlist is by default the global function list
        if searchlist is None:
            searchlist = self.compiler.functions

        for f in searchlist:  # first seach exact matches
            if f.name == fn:
                # for functions with the same name:

                # if the two functions have a different number of parameters,
                # they are not compatible
                if(len(f.parameters) != len(types) and not f.variardic):
                    continue

                # handle variardic functions
                types = types[:len(f.parameters)] if f.variardic else types
                valid = True

                # ensure functions share types
                for i in range(len(types)):
                    # check for inequal parameter types
                    if(not f.parameters[i].t.__eq__(types[i])):

                        valid = False
                        break

                # check for equal returntypes (if specified by caller)
                if rettype is not None and not rettype.__eq__(f.returntype):
                    valid = False

                if(valid):
                    return f

        # 'loose' means search with loose typematching.
        # this would mean that the types specified in types could be implicitly
        # casted to the types outlined in the function's parameters.
        if loose:
            for f in searchlist:  # seach others for valid casts
                if f.name == fn:
                    # for function of the same name

                    lt = len(types)
                    if(len(f.parameters) != lt):
                        continue
                    valid = True
                    # check matching / compatible types
                    for i in range(lt):
                        # determine compatiblity
                        if (not TsCompatible(
                                f.parameters[i].t, types[i], self)):
                            valid = False
                            break
                    # check for valid returntype matching
                    if rettype is not None and not TsCompatible(
                            rettype, f.returntype, self):
                        valid = False

                    if(valid):
                        return f

        # if no function was found, return None
        return None

    def push_stackstate(self):

        self.localstate_stack.append((self.stackCounter, len(self.variables)))

    def pop_stackstate(self):
        if len(self.localstate_stack) < 2:
            return
        self.stackCounter, newidx = self.localstate_stack.pop()
        for i in range(len(self.variables) - newidx):
            oldvar = self.popVar()
            if(oldvar.register is not None):
                rfree(oldvar.register)

    def checkForId(self):               # check next tokens for ID

        if(self.current_token.tok != T_ID):
            throw(ExpectedIdentifier(self.current_token))

        id = self.current_token.value
        self.advance()
        return id

    def parseTemplate(self):
        types = []
        while self.current_token.tok != ">":
            self.advance()
            t = self.checkForType()
            types.append(t)
        return types

    def parseFnDeclParameters(self, checkvarnames=True):
        self.checkTok('(')
        parameters = []
        while self.current_token.tok != T_CLSP:

            t = self.checkForType()

            if checkvarnames:
                if(self.current_token.tok != T_ID):
                    throw(ExpectedIdentifier(self.current_token))

                varname = self.current_token.value

                self.advance()
            else:
                varname = "~"

            parameters.append(Variable(t, varname, isptr=t.ptrdepth > 0))
            if (self.current_token.tok == T_CLSP):

                break

            if(self.current_token.tok != T_COMMA):
                throw(ExpectedComma(self.current_token))

            self.advance()

        self.advance()
        return parameters

    def parseFunctionType(self):

        self.advance()
        rett = self.checkForType()
        parameters = self.parseFnDeclParameters(False)
        fnout = Function("", parameters, rett, self.compiler, [])

        typeout = DType(
            f"function {fnout.createTypename()}",
            8,
            function_template=fnout
        )

        return typeout

    # check next tokens for Type, and return it as a DType
    def checkForType(self, err=True):

        # within checkForType, if err is set to True,
        # an error can be thrown on bad syntax or undefined
        # types. When err is not set, None is returned in
        # cases where it would normally throw an error.

        signed = True
        # check for a sign specifier
        if(self.current_token.tok == T_KEYWORD):
            if(self.current_token.value == "unsigned"):
                signed = False
                self.advance()
            elif(self.current_token.value == "signed"):
                self.advance()
            elif (self.current_token.value == "function"):

                return self.parseFunctionType()

        # ensure syntax
        if(self.current_token.tok != T_ID):
            # respond to bad syntax based on err flag
            if err:
                throw(ExpectedIdentifier(self.current_token))
            else:
                return None

        # make sure that the type exists
        if(not self.compiler.isType(self.current_token.value)):
            # respond to bad type based on err flag
            if err:
                throw(ExpectedType(self.current_token))
            else:
                return None

        # check for a decorator (template types specifier)
        if (self.tokens[self.ctidx + 1].tok == "<"):
            # collect template info:
            template = self.current_token.value
            ttok = self.current_token
            self.advance()
            types = self.parseTemplate()
            # querry compiler for a new type based on template types
            t = self.compiler.buildTemplateType(template, types, ttok).copy()
        else:
            # otherwise, querry compiler for a type based on a typename
            t = self.compiler.getType(self.current_token.value).copy()

        self.advance()
        # get pointer depth:
        ptrdepth = 0
        while self.current_token.tok == "*":
            ptrdepth += 1
            self.advance()

        # update type properties
        t.ptrdepth = ptrdepth
        t.signed = signed
        return t

    def evaluateTypeof(self, starttok):
        # get type of expression
        dtype = self.determineExpressionType(False)
        # return as a token
        return Token(T_ID, dtype.name, starttok.start, starttok.end)

    def evaluateSizeof(self, starttok):
        startidx = self.ctidx
        self.advance()
        # check if argument is a type
        typeq = self.checkForType(False)
        # if not,
        if (typeq is None):
            self.ctidx = startidx - 1
            self.advance()
            # determine type of the argument
            dtype = self.determineExpressionType(False)
            # return as a token
            return Token(T_INT, dtype.csize(
            ), starttok.start, starttok.end)

        # if so,
        else:
            self.advance()
            # return as a token
            return Token(T_INT, typeq.csize(
            ), self.tokens[startidx].start, self.tokens[startidx].end)

    def evaluateTypeid(self, starttok):
        self.advance()
        startidx = self.ctidx - 2
        # check if argument is a type
        typeq = self.checkForType(False)
        # if so,
        if typeq is not None:
            # move on
            self.advance()
        # if not,
        else:
            self.ctidx = startidx
            self.advance()

            # determine argument type
            typeq = self.determineExpressionType(False)

        # fix literal
        if typeq.name == "&LITERAL&":
            typeq = INT.copy()

        # build a string constant based on the id
        constant = createStringConstant(typeq.__repr__())
        self.compiler.constants += constant[0]
        self.compiler.globals.append(
            Variable(
                CHAR.up(),
                constant[1],
                glob=True,
                isptr=True,
                initializer=typeq.__repr__()))
        # return the string as a token
        return Token(T_ID, constant[1], starttok.start, starttok.end)

    def evaluate__isflt(self, starttok):
        self.advance()
        typeq = self.checkForType()
        self.advance()
        return Token(T_INT, int(typeq.isflt()),
                     starttok.start, self.current_token.end)

    def evaluate__syscall(self, starttok):
        self.advance()
        expr_start = self.ctidx
        opens = 1
        while opens:
            if self.current_token.tok == T_OPENP:
                opens += 1
            elif self.current_token.tok == T_CLSP:
                opens -= 1
            self.advance()
        expr_end = self.ctidx

        expr = self.tokens[expr_start:expr_end]
        value = determineConstexpr(False, expr, self)
        if not isinstance(value.accessor, int):
            throw(RequiredIntegralType(value.token))
        self.contains_rawasm = True
        out = Token(
            T_FUNCTIONCALL,
            value,
            self.tokens[expr_start].start,
            self.current_token.end)
        out.fn = Function(
            f'syscall#{value.accessor}',
            [],
            VOID.copy(),
            self.compiler,
            [])

        self.addline(
            syscall(value.accessor)
        )
        self.addline(
            'push rax'
        )

        return out

    def evaluateStatic_assert(self, starttok):
        self.advance()

        exprtokens, _ = self.buildExpressionComponents()
        value = determineConstexpr(False, exprtokens, self)
        if not (isinstance(value.accessor, int)):
            throw(ExpectedConstexpr(starttok))

        message = "Static assertion failed: "
        if (self.current_token.tok == T_COMMA):
            self.advance()
            stringname = self.checkTok(T_ID)
            strvar = self.getVariable(stringname)
            if not (isinstance(strvar.initializer, str)):
                throw(ExpectedToken(
                    self.tokens[self.ctidx - 1], "String Literal"))
            message += strvar.initializer[1:-1]

        self.advance()

        if value.accessor != 0:
            return Token(T_INT, 0, starttok.start, self.current_token.end)

        throw(
            Error(starttok, message)
        )

    # construct a result for a builtin function

    def buildPredef(self) -> Token:

        # requested builtin
        predef = self.current_token.value

        # start token
        starttok = self.current_token

        self.advance()

        if predef in function_builtin_responses:
            return function_builtin_responses[predef](self, starttok)
        else:
            throw(UnkownIdentifier(starttok))

    def loadVariardicParameters(self, countn, counts):

        self.stackCounter = 8
        nosse = getLogicLabel('NOSSE')
        sseloadinst = f"test al, al\njz {nosse}\n"

        # for i in reversed(range(len(norm_parameter_registers[countn:]) + len(sse_parameter_registers[counts:]))):
        #
        #    if i < len(norm_parameter_registers[countn:]):
        for regn in reversed(norm_parameter_registers[countn:]):
            var = Variable(VOID.copy(), f'~variardic~{regn}')
            var.offset = self.stackCounter
            self.stackCounter += 8
            self.addline(movRegToVar(var.offset, regn))
        for regs in reversed(sse_parameter_registers[counts:]):
            var = Variable(VOID.copy(), f"~variardic~{regs}")
            var.offset = self.stackCounter
            self.stackCounter += 8
            sseloadinst += (movRegToVar(var.offset, regs) + "\n")
        self.addline(sseloadinst)
        self.addline(f"{nosse}:")

    # load parameters into memory (first instructions)

    def loadParameters(self):
        countn = 0
        counts = 0

        if self.variardic:
            self.stackCounter += (len(norm_parameter_registers) +
                                  len(sse_parameter_registers)) * 8

        # for member functions, the this parameter needs to be assigned a regdecl (rdi),
        # and the members of the parent structure need to be added as variables to this function
        # with a base pointer of rdi+ instead of rbp- for access.
        if self.memberfn:
            # load members:
            for member in self.parentstruct.members:
                # not member functions
                if not isinstance(member.initializer, Function):
                    # create a rdi+ based variable for each member
                    v = Variable(
                        member.t,
                        member.name,
                        glob=False,
                        offset=member.offset,
                        isptr=member.isptr,
                        signed=member.signed,
                        bpr="rdi+")
                    v.referenced = True
                    self.append_rawVariable(v)
            # build this regdecl
            self.regdecls.append(
                EC.ExpressionComponent('rdi', self.parentstruct)
            )
            self.regdecls[-1].supposed_value = "this"

        extra_params = []

        # This function's parameters now need to be loaded as variables.
        # The parameters may be given regdecls depending on the contents of this
        # function, and how much of an improvement that would give. (@see
        # Intraprocedural.py)
        for p in self.parameters:

            # if the next parameter is an extra parameter (more than 6)
            # if(self.parameters.index(p) >= len(self.parameters) - self.extra_params):
            #    break

            # if the compiler has already identified this parameter as dead,
            # add to the register counters and continue to next parameter.
            if self.compileCount and p.referenced == False:
                if p.t.isflt() or p.t.csize() > 8:
                    counts += 1
                else:
                    countn += 1
                continue

            # check for extra params
            if p.isflt() and counts >= len(sse_parameter_registers):
                extra_params.append(p)
                continue
            elif not p.isflt() and countn >= len(norm_parameter_registers):
                extra_params.append(p)
                continue

            makeParameterRegdecl = (
                # (1) inline functions will always use regdecls for parameters.
                #
                # (2) if the intraprocedural optimizer has determined it to be benificial,
                # the self.implicit_paramregdecl flag will imply that parameters for this function
                # should be made regdecls.
                #
                # (3) Certain registers are reserved for use in expressions, and cannot be used as
                # regdecls for parameters. (Specifically, 'rdx' and 'xmm0')
                #
                # (4) implicit parameter regdecls must be primitive types
                self.inline or self.implicit_paramregdecl and not (
                    (not p.isflt()) and countn == 2) and not(
                    p.isflt() and counts == 0) and (p.t.isintrinsic()))


            if makeParameterRegdecl:
                # construct a variable that uses a register value
                if(p.isflt()):
                    p.register = sse_parameter_registers[counts]
                    counts += 1
                else:
                    p.register = norm_parameter_registers[countn]
                    countn += 1
                self.regdecls.append(
                    EC.ExpressionComponent(
                        p.register, p.t, token=self.tokens[0]))
                self.regdecls[-1].supposed_value = p.name

            self.addVariable(p, False)
            #p.referenced = False

            if not makeParameterRegdecl:
                # construct a normal variable
                if(config.DO_DEBUG):
                    self.addcomment(f"Load Parameter: {p}")
                
                # primitive types
                if p.t.isintrinsic():
                
                    if(p.isflt()):
                        self.addline(movRegToVar(
                            p.offset, sse_parameter_registers[counts]))

                        counts += 1
                    else:
                        self.addline(movRegToVar(
                            p.offset, norm_parameter_registers[countn]))
                        countn += 1
                # const data structures
                else:
                    instr, countn, counts = deregisterizeValueType(p.t, self.variables[-1], countn, counts)
                    self.addline(instr)
                    self.buildStackStructure(self.variables[-1],  useDefaults=False)

        ptr = 16
        # load extra parameters (those that could not be assigned registers)
        for p in extra_params:
            self.addVariable(p)
            self.variables[-1].baseptr = "rbp+"
            self.variables[-1].offset = ptr
            ptr += 8

        if self.variardic:
            return self.loadVariardicParameters(countn, counts)

    def createClosing(self):                    # create end of the function

        if self.destructor_text != "":
            self.destructor_text = f"push rax\n{self.destructor_text}\npop rax\n"

        # for functions that contain a return statement, extra info is needed
        # at the end of the function.
        if self.containsReturn:
            self.addline(function_closer(
                self.getCallingLabel(), self.destructor_text, self))
        else:

            # for functions that do not contain a return, and have no
            # stack-based variables:
            if self.stackCounter <= 8 and self.extra_params <= 0:
                # the leave instruction can be ommitted
                self.addline("ret\n")
            else:
                self.addline("leave\nret\n")

    def buildReturnStatement(self):             # build a return statement
        first_tok = self.current_token
        self.advance()
        # set flag
        # see declarations
        if self.recursive_depth == 1:
            self.isReturning = True
        self.containsReturn = True
        og_fncalls = self.fncalls

        if(self.current_token.tok != T_ENDL):
            
            # expression
            instr, val = self.evaluateExpression(destination=False)

            # if auto type
            if self.return_auto:
                if self.returntype.name == "auto":
                    # setup type to match new type
                    self.returntype = val.type.copy()
                # check for typematch
                elif not typematch(self.returntype, val.type, False):
                    throw(
                        MultipleReturnTypes(
                            first_tok,
                            self.returntype,
                            val.type))

            # determine return register
            oreg = sse_return_register if self.returntype.isflt() or self.returntype.csize() > 8 else setSize(
                norm_return_register,
                self.returntype.csize()
            )

            # primitive returntypes
            if self.returntype.isintrinsic():
                ninstr = depositFinal(EC.ExpressionComponent(
                    oreg, self.returntype.copy()), val)
            # data structure returntypes
            else:
                ninstr, ___, _, __ = registerizeValueType(self.returntype, val.accessor, -1, 0)
            
            # final
            instr += ninstr
            rfree(val.accessor)
            self.returnsConstexpr = val.isconstint()
            if(self.returnsConstexpr):
                self.constexpr_returnvalue = val.accessor

            self.addline(instr)

        self.checkSemi()
        if self.recursive_depth == 1:
            self.hasReturned = True
            #self.fncalls = og_fncalls

        if self.recursive_depth > 1 or self.inline and self.current_token.tok != T_CLSSCOPE:
            self.addline(Instruction('jmp', [self.closinglabel[:-1]]))

        self.isReturning = False

    def buildIfStatement(self):
        self.advance()
        self.checkTok(T_OPENP)

        # Build instructions neccessary to evaluate the expression a for
        # example: if ( a ) { ... }

        preInstructions, resultant = self.evaluateExpression()
        # the resultant's register doesn't need to be reserved
        rfree(resultant.accessor)

        if(self.current_token.tok == T_CLSP):
            self.advance()

        # pre-determine jump labels:
        postlabel = getLogicLabel("IFPOST")
        jmpafter = getLogicLabel("IFELSE")

        self.continues.append(postlabel)

        guarentee_if = resultant.isconstint() and resultant.accessor != 0
        guarentee_else = resultant.isconstint() and resultant.accessor == 0
        if guarentee_if:

            self.checkTok(T_OPENSCOPE)
            self.compileBodyScope()
            guarentee_else = False

        # check if the resultant will always evaluate to false
        elif(resultant.isconstint() and resultant.accessor != 0) or not resultant.isconstint():

            preInstructions += f"{checkTrue(resultant)}jz {postlabel}\n"

            self.addline(preInstructions)
            self.checkTok(T_OPENSCOPE)

            # compile the body
            self.compileBodyScope()
            self.addline(f"jmp {jmpafter}")
            self.advance()

        else:
            # the following is executed in an instance like this:
            # if(false) { ... }
            self.skipBody()
            self.advance()

        # check for else
        if(self.current_token.tok == T_KEYWORD):

            if(self.current_token.value == "else"):

                self.addline(postlabel + ":\n")
                self.advance()
                if(self.current_token.tok == T_KEYWORD and self.current_token.value == "if"):

                    self.buildIfStatement()
                    guarentee_else = False
                elif(self.current_token.tok == T_OPENSCOPE):

                    self.advance()
                    self.compileBodyScope()

                    if(self.current_token.tok == T_CLSSCOPE):
                        self.advance()

                else:
                    throw(ExpectedToken(self.current_token, "{"))

                self.addline(jmpafter + ":\n")

            else:
                self.addline(postlabel + ":\n")
                self.addline(jmpafter + ":\n")
        else:
            self.addline(postlabel + ":\n")
            self.addline(jmpafter + ":\n")

        self.continues.pop()

    def buildForloop(self):
        self.advance()
        self.checkTok(T_OPENP)
        asmrestore = len(self.asm)
        # pre determine jumping labels:
        toplabel = getLogicLabel("FORTOP")
        comparisonlabel = getLogicLabel("FORCMP")
        updatelabel = getLogicLabel("FORUPDATE")
        endlabel = getLogicLabel("FOREND")

        self.continues.append(comparisonlabel)
        self.breaks.append(endlabel)

        # save varstate for loop declaration
        self.push_stackstate()

        # build the declaration a for example : for ( a; ... ;...) { ... }
        self.compileLine()

        # build the instructions neccessary to evaluate the expression b for
        # example: for (a; b; ...){ ... }
        getCondition, resultant = self.evaluateExpression()

        # since these instructions are out of order, the resultant does not
        # need to remain reserved through the body of the loop.
        rfree(resultant.accessor)
        self.checkSemi()

        self.addline(f"jmp {comparisonlabel}\n")
        self.addline(f"{toplabel}:")

        # build the instructions for the assignment c for example: for (a;b;
        # c){ ... }
        updatev, __ = self.evaluateExpression()

        # The resultant can be freed here because the instructions are not in
        # order yet.
        rfree(__.accessor)

        self.checkTok(T_CLSP)
        self.checkTok(T_OPENSCOPE)

        # compile the body of the flp
        self.beginRecursiveCompile()

        # add in the instruction blocks in the correct order
        self.addline(f"{updatelabel}:")
        self.addline(updatev)
        self.addline(f"{comparisonlabel}:\n")
        self.addline(getCondition)

        # check for constexpr
        if(not resultant.isconstint()):
            self.addline(f"{checkTrue(resultant)}\njnz {toplabel}\n")
            self.addline(f"{endlabel}:")

        elif(resultant.accessor != 0):
            self.addline(f"jmp {toplabel}\n")
            self.addline(f"{endlabel}:")

        else:
            self.asm = self.asm[:asmrestore]
            pass

        self.advance()

        self.continues.pop()
        self.breaks.pop()
        self.pop_stackstate()

    def buildWhileloop(self):
        self.advance()
        self.checkTok(T_OPENP)
        asmrestore = len(self.asm)
        # pre-determined jump labels
        startlabel = getLogicLabel("WHILESTART")
        comparisonlabel = getLogicLabel("WHILECMP")
        endlabel = getLogicLabel("WHILEEND")
        self.continues.append(comparisonlabel)
        self.breaks.append(endlabel)

        self.push_stackstate()

        self.addline(f"jmp {comparisonlabel}")
        self.addline(f"{startlabel}:")

        # build instructions to evaluate expression a for example: while( a ){
        # ... }
        cmpinst, resultant = self.evaluateExpression()

        # the value of resultant does not need to be reserved
        rfree(resultant.accessor)

        # if the expression inside the while loop header always evaluates to False,
        # the body of the loop is not compiled.
        dontGetBody = False
        if(not resultant.isconstint()):
            cmpinst += f"{checkTrue(resultant)}jnz {startlabel}\n"
        elif(resultant.accessor != 0):
            cmpinst += f"jmp {startlabel}\n"
        else:
            dontGetBody = True

        if(dontGetBody):
            self.skipBody()
            cmpinst = ""

        else:
            self.advance()
            self.checkTok(T_OPENSCOPE)
            # build instructions for the body
            self.beginRecursiveCompile()

        self.addline(f"{comparisonlabel}:")
        self.addline(cmpinst)
        self.addline(f"{endlabel}:")
        self.advance()
        # clean up var
        if dontGetBody:
            self.asm = self.asm[:asmrestore]
        self.continues.pop()
        self.breaks.pop()
        self.pop_stackstate()

    def buildSIMD(self):
        self.advance()
        print("SIMD is under development")
        exit(1)

    def buildASMBlock(self):  # build inline assembly block
        self.advance()
        content = ""
        defns = []
        if(self.current_token.tok == T_OPENP):
            while self.current_token.tok != T_CLSP:
                self.advance()
                if(self.current_token.tok == T_ID):
                    var = self.getVariable(self.checkForId())
                    if(var is None):
                        throw(UnkownIdentifier(self.current_token))

                    #content += f"%define {var.name} {valueOf(var)}\n"
                    defns.append((var.name, valueOf(var)))
                else:
                    self.advance()

            self.advance()

        self.checkTok(T_OPENSCOPE)

        rawbody = ""

        # assembly instructions are stored as a string token
        if(self.current_token.tok != T_STRING):

            # For in case the string is still a string_constant id
            vtest = self.getVariable(self.current_token.value)
            if(vtest is None):
                throw(ExpectedToken(self.current_token, "Assembly String"))

            if(not isinstance(vtest.initializer, str)):

                throw(ExpectedToken(self.current_token, "Assembly String"))

            rawbody = vtest.initializer[1:-
                                        1] if vtest.initializer != '""' else ""
        else:
            rawbody = self.current_token.value

        # copy value so as not to change it
        content += f"{rawbody}"
        content = content.replace("\\", "")

        for d in defns:
            content = content.replace(d[0], d[1])

        lnum = getLogicLabel("")
        content = content.replace("%L", lnum)

        self.addline(content)

        self.advance()

        self.checkTok(T_CLSSCOPE)
        self.contains_rawasm = True

    def buildSwitch(self):
        self.advance()

        endlabel = getLogicLabel("SWITCHEND")

        self.breaks.append(endlabel)

        self.push_stackstate()

        # evaluate the lvalue to compare
        loadinstr, cmpvalue = self.evaluateExpression()

        if isinstance(cmpvalue.accessor, Variable):
            reg = ralloc(False, size=cmpvalue.type.csize())
            loadinstr += loadToReg(reg, cmpvalue.accessor)
            cmpvalue.accessor = reg
        # ensure register hit
        reralloc(cmpvalue.accessor)

        # mark position for topcode
        topmarker = f"##SWITCHTOP##{len(self.asm)}"
        self.addline(topmarker)
        logictable = []

        self.checkTok(T_OPENSCOPE)

        # body of switch
        while self.current_token.tok != T_CLSSCOPE:

            # case
            if(self.current_token.tok == T_KEYWORD and self.current_token.value == "case"):
                self.advance()

                # evaluate constexpr
                tkstart = self.ctidx
                while self.current_token.tok != T_OPENSCOPE:
                    self.advance()
                tkend = self.ctidx

                rval = determineConstexpr(0, self.tokens[tkstart:tkend], self)

                # non-constexpr
                if(not isinstance(rval.accessor, int)):
                    throw(ExpectedToken(self.tokens[tkstart], "constexpr"))

                # fill logic table with (rvalue, jmp label)
                l = getLogicLabel("SWITCHCASE")
                self.addline(f"{l}:")
                self.checkTok(T_OPENSCOPE)
                self.beginRecursiveCompile()
                self.advance()

                logictable.append((rval.accessor, l))

            else:
                throw(UnexpectedToken(self.current_token))

        # first load lvalue
        topinstr = loadinstr

        # make comparisons
        for logic in logictable:
            topinstr += f"cmp {valueOf(cmpvalue.accessor)}, {logic[0]}\nje {logic[1]}\n"

        # else: jmp to end
        topinstr += f"jmp {endlabel}\n"

        # expensive optimizations
        if(config.__oplevel__ > 1):
            checker = Peephole()
            checker.addline(topinstr)
            topinstr = checker.get()

        # fill in new instructions
        self.asm = self.asm.replace(topmarker, topinstr)

        self.addline(f"{endlabel}:")
        self.advance()
        self.breaks.pop()
        self.pop_stackstate()

        rfree(cmpvalue.accessor)

    def buildRegdecl(self):
        if(self.regdeclremain_norm < 0 or self.regdeclremain_sse < 0):
            warn(RegisterDeclWarning(self.current_token))
            self.advance()
            self.buildDeclaration(register=False)
            return
        else:
            s = self.current_token
            self.advance()
            startvars = len(self.variables)
            if self.current_token.tok != T_KEYWORD:
                self.buildDeclaration(register=True)
            else:
                if self.current_token.value == "auto":
                    self.buildAutoDefine(register=True)
                else:
                    throw(UnexpectedToken(self.current_token))
            for v in self.variables[startvars:]:
                self.regdecls.append(
                    EC.ExpressionComponent(
                        v.register,
                        v.t,
                        token=s,
                    ))
                # supposed_value is used to denote the suggested original name
                # of the variable
                self.regdecls[-1].supposed_value = v.name

                if(v.t.isflt()):
                    self.regdeclremain_sse -= 1
                else:
                    self.regdeclremain_norm -= 1

                if(self.regdeclremain_norm < 0 or self.regdeclremain_sse < 0):
                    warn(RegisterDeclWarning(s))

    def buildDoWhile(self):
        self.advance()
        self.checkTok(T_OPENSCOPE)

        # determine label to mark begining of loop
        startlabel = getLogicLabel("DOWHILE")
        self.addline(f"{startlabel}:")

        # compile body
        self.push_stackstate()
        self.beginRecursiveCompile()
        self.pop_stackstate()
        self.advance()

        # ensure that body is followed by a while
        whileq = self.checkTok(T_KEYWORD)
        if(whileq != "while"):
            throw(ExpectedToken(self.tokens[self.ctidx - 1], "while"))

        # compile while comparison instructions
        footerinst, resultant = self.evaluateExpression()
        rfree(resultant.accessor)
        if(not resultant.isconstint()):

            footerinst = f"{footerinst}{checkTrue(resultant)}jnz {startlabel}\n"
        else:
            if(resultant.accessor == 0):
                footerinst = ""
            else:
                footerinst = f"jmp {startlabel}\n"

        # close up
        self.addline(footerinst)
        self.checkSemi()

    def buildStaticdecl(self):
        self.advance()

        t = self.checkForType()
        dtok = self.current_token
        name = self.checkTok(T_ID)
        label = name + getLogicLabel(name)
        var = Variable(t, name, True, signed=t.signed, static=True)

        if (self.getVariable(name)
                is not None or self.compiler.getType(name) is not None):
            throw(VariableRedeclaration(self.tokens[self.ctidx - 1], var))

        var.name = label
        self.staticnameref[label] = name
        var.dtok = dtok
        self.compiler.heap += createIntrinsicHeap(var)
        self.append_rawVariable(var)

        self.ctidx -= 2
        self.advance()

    # build forward functions or, inline function declarations.
    # e.g:
    #
    # int main(int argc, char** argv){
    #
    #   function bool(int) fn = lambda bool (int a) { return a == 5; };
    #   fn(5);
    #
    # }
    #
    def buildInlineFunction(self):
        self.advance()
        rettype = self.checkForType()

        parameters = self.parseFnDeclParameters(True)

        firsttok = self.ctidx + 1

        self.skipBody()
        end = self.ctidx + 1
        tokens = (self.tokens[firsttok:end])

        # check if this lambda is already compiled
        if self.lambdaCount < len(self.lambdas):
            label = self.lambdas[self.lambdaCount].name
        else:
            self.lambdaCount += 1
            label = getLogicLabel("LAMBDA")[1:]
            fun = Function(
                label,
                parameters,
                rettype,
                self.compiler,
                tokens,
                extern=True)
            self.compiler.functions.append(fun)

            self.lambdas.append(fun)

            self.compiler.globals.append(
                Variable(
                    DType(
                        f"function {fun.createTypename()}",
                        8,
                        function_template=fun
                    ),
                    label,
                    glob=True,
                    isptr=True,
                    mutable=False,
                    signed=rettype.signed
                )
            )

        return label

    def buildAutoDefine(self, register=False):
        self.advance()
        nametok = self.current_token
        name = self.checkForId()

        # check if variable exists already
        if(self.getVariable(name) is not None and not self.getVariable(name).glob):
            throw(VariableRedeclaration(self.tokens[self.ctidx - 1], name))

        # check if varname is a datatype
        if(self.compiler.getType(name) is not None):
            throw(UsingTypenameAsVariable(self.tokens[self.ctidx - 1]))

        self.checkTok(T_EQUALS)

        instr, value = self.evaluateExpression()

        if value.type.name == "&LITERAL&":
            value.type = INT.copy()

        # restore point for dead code elimination
        asmrestore = len(self.asm)

        # only emit symbols if the declaration is not dead code
        if name not in self.unreferenced:

            self.addline(instr)
            var = Variable(value.type, name)
            var.dtok = nametok
            if register:
                var.register = ralloc(value.type.isflt())

            self.addVariable(var, False)
            self.addline(
                depositFinal(
                    EC.ExpressionComponent(
                        var, var.t), value))
            var.referenced = False
        else:
            self.asm = self.asm[:asmrestore]

        rfree(value.accessor)
        self.checkSemi()

    def buildBreak(self):
        if(len(self.breaks) == 0):
            throw(UnmatchedBreak(self.current_token))
        l = self.breaks[-1]
        self.addline(f"jmp {l}\n")
        self.advance()
        self.checkSemi()

    def buildContinue(self):
        l = self.continues[-1]
        self.addline(f"jmp {l}\n")
        self.advance()
        self.checkSemi()

    def buildRegisterDel(self):
        self.advance()
        vname = self.checkTok(T_ID)
        v = self.getVariable(vname)
        if(v is None):
            throw(UnkownIdentifier(self.tokens[self.ctidx - 1]))
        if(v.glob):
            throw(GlobalDeletion(self.tokens[self.ctidx - 2]))
        if(v.register is None):
            throw(NonRegisterDeletion(self.tokens[self.ctidx - 2]))

        self.variables.remove(v)
        del self.variable_reference[v.name]
        rfree(v.register)

        if("xmm" in v.register):
            self.regdeclremain_sse -= 1
        else:
            self.regdeclremain_norm -= 1
        self.advance()

    def buildGoto(self):
        self.advance()
        # get label name
        lname = self.checkTok(T_ID)
        asmlabel = self.getUserlabel(lname)
        # ensure that this label exists
        if(asmlabel is None):
            throw(UnkownIdentifier(self.current_token))
        # jump to it
        self.addline(f"jmp {asmlabel}")
        self.checkSemi()

    # build a statement that starts with a keyword

    def buildKeywordStatement(self):
        word = self.current_token.value
        # check available response
        if word in function_keyword_responses:
            # execute response
            function_keyword_responses[word](self)
        else:
            # no response available, throw error
            throw(UnexpectedToken(self.current_token))

    # push all register declarations before function call
    # to preserve their state.
    def pushregs(self):

        out = ""
        for r in self.regdecls:

            # if a regdecl is not referenced again in the current function,
            # it does not need to be pushed, and can be discarded
            usedagain = r.supposed_value == "this" or next(
                (t for t in self.tokens[self.ctidx:] if t.tok == T_ID and t.value == r.supposed_value), None) is not None
            if usedagain:
                out += spush(r)
            else:
                self.regdecls.remove(r)
                rfree(r.accessor)

        return out
    # restore all register declarations after function call
    # to preserve their state.

    def restoreregs(self):

        out = ""
        for r in reversed(self.regdecls):
            out += spop(r)
        return out

    def buildAmbiguousFunctionCall(self, fid, types):
        pass

    # load the parameters to call a function
    def rawFNParameterLoad(self, fn, sseused, normused,
                           pcount, offset=False, types=None):
        paraminst = ""
        # when parameters are being loaded it signifies that a function has been called,
        # so the counter needs to be incremented
        self.fncalls += 1

        if fn.variardic:
            parameters = fn.parameters + \
                [Variable(t, "~empty~") for t in types[len(fn.parameters):]]
        else:
            parameters = fn.parameters
        pcount = len(parameters)
        rng = range(1, pcount) if offset else range(pcount)

        extra_params = []

        # for each parameter
        for i in rng:

            # check for extra parameters
            if parameters[i].isflt() or parameters[i].t.csize() > 8:
                if sseused >= len(sse_parameter_registers):
                    extra_params.append(parameters[i])
                    continue
            elif normused >= len(norm_parameter_registers):
                extra_params.append(parameters[i])
                continue

            # if the parameter is a float, load to SSE register
            if(parameters[i].isflt()):

                # determine calling convention situations
                # (Things need to be pushed on windows calls)
                needpush = (fn.winextern and sseused > 4)

                if needpush:
                    reg = norm_return_register
                else:
                    reg = sse_parameter_registers[sseused]

                result = EC.ExpressionComponent(
                    reg, parameters[i].t.copy(), token=self.current_token)

                inst, final = self.evaluateExpression()
                inst += depositFinal(result, final)
                rfree(final.accessor)

                # push registers when necessary
                if needpush:
                    inst += spush(reg)

                sseused += 1
            # load data structure
            elif not parameters[i].t.isintrinsic():
                
                # determine value
                inst, final = self.evaluateExpression()
                if not typematch(final.type, parameters[i].t, False):
                    throw(TypeMismatch(final.token, final.type, parameters[i].t))
                ninst, _,normused, sseused = registerizeValueType(parameters[i].t, final.accessor, normused, sseused)
                inst += ninst
                rfree(final.accessor)



            # else, load to normal register of the correct size
            else:
                # determine size:
                needpush = (fn.winextern and normused > 4)

                # handle calling conventions:
                if fn.winextern:

                    if not needpush:
                        reg = win_norm_parameter_registers[normused]
                    else:
                        reg = norm_return_register

                else:
                    reg = norm_parameter_registers[normused]

                result = setSize(
                    reg,
                    parameters[i].t.csize())

                ec = EC.ExpressionComponent(
                    result, parameters[i].t.copy(), token=self.current_token)
                # build main instructions
                inst, final = self.evaluateExpression()
                inst += depositFinal(ec, final)
                rfree(final.accessor)

                if needpush:
                    inst += spush(reg)

                normused += 1

            paraminst = f"{inst}{paraminst}"

            if(self.current_token.tok == ","):
                self.advance()

        # load the function's extra params

        for p in extra_params:
            # extra parameters are loaded into rax, and then into their BSS
            # memory location

            newinst, final = self.evaluateExpression()
            paraminst += newinst + spush(final)

            rfree(final.accessor)

            if(self.current_token.tok == ","):
                self.advance()

        if fn.winextern:
            paraminst += win_align_stack

        if fn.variardic:
            paraminst += f"mov al, {sseused}\n"

        return paraminst

    def doVarcall(self, var):

        out = self.pushregs()

        return out + (Instruction("call", [valueOf(var)]))

    # build the ending of a function call code block

    def buildFunctionCallClosing(self, fn, varcall, var):
        instructions = ""

        # actual 'call' instruction

        instructions += (fncall(fn) if not varcall else self.doVarcall(var))

        # handle windows functions
        if fn.winextern:
            instructions += win_unalign_stack

        # handle big functions
        if fn.extra_params > 0:
            instructions += f"add rsp, {fn.extra_params*8}\n"

        # determine if rax needs to be saved for xmm push/pop operations
        contains_sseregs = next(
            (True for r in self.regdecls if r.type.isflt()),
            None) is not None

        # save return value for register restores
        if(contains_sseregs):
            tmp = ralloc(False)
            instructions += raw_regmov(
                tmp, sse_return_register if fn.returntype.isflt() else norm_return_register)

        instructions += (self.restoreregs())

        # restore return value after register restores
        if(contains_sseregs):
            rfree(tmp)
            instructions += raw_regmov(
                sse_return_register if fn.returntype.isflt() else norm_return_register, tmp)

        return instructions

    def buildFunctionCall(self):

        # TODO:
        # Nested functions can sometimes overwrite eachother's parameters;

        # function name
        fid = self.current_token.value
        # token of function name
        fnstartt = self.current_token
        # placeholder
        fn = None
        instructions = ""
        template = False
        ttypes = []
        self.advance()
        if(self.current_token.tok == "<"):
            template = True
            ttypes = self.parseTemplate()
            self.advance()

        self.checkTok(T_OPENP)

        types = []

        start = self.ctidx
        # build parameters, without storing instructions in order to determine
        # the datatypes, and place them in types[]
        while self.current_token.tok != ")" and self.current_token.tok != T_ENDL:
            o = self.determineExpressionType(False)

            if(self.current_token.tok == ","):
                self.advance()
            types.append(o)

        # using the fn name, and the parameter types find the actual function
        # object best suited for this call

        # check for a template
        if template:
            fn = self.getTemplateFunction(fid, types, ttypes)
        # check for a normal function
        else:
            fn = self.getFunction(fid, types)

        # make sure there is no recursive inline
        if(fn is self and self.inline):
            throw(RecursiveInlineCall(self.current_token))

        self.ctidx = start - 1
        self.advance()
        # check for var function
        if(fn is None and self.compiler.getFunction(fid) is None):
            var = self.getVariable(fid)
            # unkown
            if(var is None):
                throw(UnkownIdentifier(fnstartt))

            # check for function type
            if var.t.function_template is not None:
                fn = var.t.function_template.reset()
                fn.name = var.name
                varcall = True
                params = fn.parameters
                pcount = len(params)
                var.referenced = True
                # verify match
                if len(types) != pcount:
                    throw(WrongParameterCount(fnstartt, fn))
                # verify type match
                for i in range(pcount):
                    if not typematch(params[i].t, types[i], False):
                        throw(TypeMismatch(fnstartt, params[i].t, types[i]))

            # unkown pointer being called as function
            else:

                params = [Variable(t, "parameter") for t in types]
                fn = Function(fid, params, var.t, self.compiler, [])
                varcall = True
                pcount = len(types)

        elif(fn is None):
            throw(UnkownFunction(fnstartt, fid, types))

        else:

            pcount = len(fn.parameters)
            varcall = False
        # build actual parameter-loading instructions using exact datatypes
        sseused = 0

        for p in types:
            if p.isflt():
                sseused += 1

        # track the number of normal, and sse registers used in parameter
        # loading
        ssevarsforrax = sseused
        sseused = 0
        normused = 0

        # load parameters
        paraminst = self.rawFNParameterLoad(
            fn, sseused, normused, pcount, types=types)
        # save regdecls
        reginst = (self.pushregs())
        # reverse order of instructions:
        instructions += reginst
        instructions += paraminst

        # follow c varargs standard:
        # (number of sse registers used is stored in RAX before a function call)
        # (Varargs turned off:)
        # instructions += (Instruction("mov", [rax, ssevarsforrax]))

        instructions += self.buildFunctionCallClosing(
            fn, varcall, var if varcall else None)

        return instructions, fn

    # wrap a function call as a part of an expression
    def wrapExpressionFunctionCall(self):
        instructions = ""
        # token start
        start = self.current_token.start.copy()
        # main instruction compilation
        fninstr, fn = self.buildFunctionCall()

        # token to add to expression token list containing fn information
        token = Token(T_FUNCTIONCALL, fninstr, start,
                      self.current_token.start.copy())
        token.fn = fn
        instructions += fninstr + "\n"

        # result saving
        if(fn.returntype.isflt()):
            instructions += Instruction("movq",
                                        [rax, sse_return_register])
        instructions += Instruction("push", [norm_return_register])
        return token, instructions

    # build a function call that takes a pointer to an object as the first parameter.
    # (Functions defined in a structure that need a definition of 'this')

    def memberCall(self, fn, this):
        # prevent warnings
        this.referenced = True

        # load 'this'
        paraminst = ""
        if(isinstance(this, Variable)):
            paraminst += (f"lea rdi, [rbp-{this.offset+this.t.s}]\n")
        elif(isinstance(this, EC.ExpressionComponent)):
            paraminst += (f"mov rdi, {valueOf(this.accessor)}\n")

        # remaining parameters:
        normused = 1
        sseused = 0
        pcount = len(fn.parameters)
        self.advance()
        self.advance()
        paraminst += self.rawFNParameterLoad(
            fn,
            sseused,
            normused,
            pcount,
            True,
            False)

        # save regdecls
        self.addline(self.pushregs())
        # add parameter loading instructions
        self.addline(paraminst)

        # actual function call, and restore
        callinst = self.buildFunctionCallClosing(fn, False, None)
        self.addline(callinst)

        if(fn.returntype.isflt()):
            self.addline(Instruction("movq",
                                     [rax, sse_return_register]))
        self.addline(Instruction("push", [norm_return_register]))
    # construct expression components from tokens

    def buildExpressionComponents(self):
        exprtokens = []
        opens = 1
        instructions = ""
        wasfunc = False
        # The tokens: ; , } ) etc... will mark the end of an
        # expression
        while opens > 0 and self.current_token.tok not in [
                T_COMMA, T_OPENSCOPE, T_CLSSCOPE, T_ENDL]:

            # maintain track of open/close parenthesis
            if(self.current_token.tok == T_CLSP):
                opens -= 1
            elif(self.current_token.tok == T_OPENP):
                opens += 1

            if(opens <= 0):
                break

            # since function calls have the highest precedence in an expression, they can be called
            #   before the rest of the expression is evaluated.
            #   Their return values will be pushed to the stack, and the ExpressionEvaluator will be able to pop
            #   these off later into the ralloc'd scratch registers.
            #
            # If the push and pop operations are adjacent, the peephole optimizer will replace them with a
            # faster mov operation, but it can be noted that with a good cache hit a push/pop will not be
            # too much slower than a mov.
            elif(self.current_token.tok == T_ID) or (self.current_token.tok == T_KEYWORD and self.current_token.value == 'unsigned'):
                starttok = self.current_token
                startidx = self.ctidx
                start = self.current_token.start
                if(self.tokens[self.ctidx + 1].tok in "(" or self.qgettfn(self.current_token.value) is not None):

                    if(self.current_token.value in predefs):
                        exprtokens.append(self.buildPredef())
                        # ensure correct closing
                        exprtokens.append(
                            self.current_token) if self.current_token.tok == T_CLSP else None
                        continue
                    else:
                        wasfunc = True

                        token, inst = self.wrapExpressionFunctionCall()
                        exprtokens.append(token)
                        instructions += inst

                elif(self.checkForType(False) is not None):
                    self.ctidx = startidx - 1
                    self.advance()
                    t = self.checkForType()
                    self.ctidx -= 1
                    exprtokens.append(
                        Token(
                            T_TYPECAST,
                            t,
                            start,
                            self.current_token.start))
                    wasfunc = True

                # Member variables accessed from stack based structures can be abstracted as Variable objects
                #   because they are effectively stored the same.
                elif(self.tokens[self.ctidx + 1].tok == T_DOT):
                    wasfunc = True

                    # begin tokens
                    start = self.current_token.start.copy()

                    # vname will compount each identifier with dots between them to form
                    # the string version of the identifiers together. e.g:
                    # object.member.member    =   "object.member.member"
                    vname = f"{self.current_token.value}"
                    var = self.getVariable(self.current_token.value)

                    # vstack keeps track of all the variable objects found in
                    # the chain
                    vstack = [var]
                    while(self.tokens[self.ctidx + 1].tok == T_DOT):
                        if(var is None):
                            throw(UnkownIdentifier(self.current_token))
                        self.advance()
                        self.advance()
                        member = self.current_token.value
                        memvar = var.t.getMember(member)
                        if(memvar is None):
                            throw(UnkownIdentifier(self.current_token))
                        vname += f".{memvar.name}"

                        var = memvar
                        vstack.append(var)

                    # for member access, the token can simply be added.
                    # for member function calls, a more complex function call
                    # must be built
                    if(self.tokens[self.ctidx + 1].tok != T_OPENP):
                        exprtokens.append(
                            Token(T_ID, vname, start, self.current_token.end))
                    # build function calls to member functions:
                    else:
                        # object, and member function
                        obj = vstack[-2]
                        fn = var.initializer

                        # build member function call, and add tokens
                        self.memberCall(fn, obj)
                        exprtokens.append(
                            Token(
                                T_FUNCTIONCALL,
                                "",
                                start,
                                self.current_token.end.copy()))
                        exprtokens[-1].fn = fn

                # member functions called through pointer member access need to be found
                # here before being passed into the expression evaluators
                elif(self.tokens[self.ctidx + 1].tok == T_PTRACCESS):

                    # record start token so that for non-function pointer accesses
                    # it can reset
                    start = self.ctidx - 1
                    # iterate through miniexpr (e.g : test->a->b->c ...)
                    while(self.tokens[self.ctidx + 1].tok == T_PTRACCESS):
                        self.advance()
                        self.advance()

                    # if the next token is an open parenthesis, it is a member
                    # function call
                    if(self.tokens[self.ctidx + 1].tok == T_OPENP):

                        # isolate miniexpr
                        miniexpr = self.tokens[start + 1:self.ctidx - 1]
                        # function name
                        fnname = self.current_token.value

                        # evaluation of miniexpr in order to determine the value for 'this',
                        # and also the data type of 'this'
                        pf = Postfixer(miniexpr, self)
                        evaluator = ExpressionEvaluator(self)
                        instr, value = evaluator.evaluatePostfix(
                            pf.createPostfix(), LeftSideEvaluator(self))
                        self.addline(instr)

                        # datatype
                        dt = value.type
                        # member function
                        fn = dt.getMember(fnname)
                        if(fn is None):
                            throw(UnkownIdentifier(self.current_token))
                        fn = fn.initializer

                        # perform function call, parameter loading, regdecl
                        # saving, etc...

                        self.memberCall(fn, value)

                        # cleanup
                        rfree(value.accessor)

                        # add new info to the expression
                        exprtokens.append(
                            Token(
                                T_FUNCTIONCALL,
                                "",
                                start,
                                self.current_token.end.copy()))
                        exprtokens[-1].fn = fn
                        wasfunc = True
                    # if it is not a member function call, the miniexpr can just be a part of the whole expression
                    # so the ctidx is reset
                    else:
                        self.ctidx = start
                        self.advance()

            elif (self.current_token.tok == T_KEYWORD):

                # lambda function declarations are detected and parsed here. The label used
                # to declare the function is returned by self.buildInineFunction() and used
                # as a global variable in the context of this expression.
                if(self.current_token.value == "lambda"):
                    start = self.current_token.start
                    label = self.buildInlineFunction()
                    wasfunc = True
                    exprtokens.append(
                        Token(
                            T_ID,
                            label,
                            start,
                            self.current_token.end))
                    self.advance()
                    break
                else:
                    throw(UnexpectedToken(self.current_token))

            elif(self.current_token.tok == T_PTRACCESS):
                exprtokens.append(self.current_token)
                self.advance()
                self.current_token.thint = "m"

            # if one of the above special conditions was true, there is no need to add the actual
            #   current token.
            if(not wasfunc):
                exprtokens.append(self.current_token)
            wasfunc = False

            self.advance()
        return exprtokens, instructions

    def determineExpressionType(self, restore_token) -> DType:

        restoreAsm = len(self.asm)
        restoreToken = self.ctidx - 1
        _, value = self.evaluateExpression(destination=False)

        rfree(value.accessor)
        self.asm = self.asm[:restoreAsm]
        if restore_token:
            self.ctidx = restoreToken
            self.advance()

        return value.type

    def evaluateLeftsideExpression(self):
        instructions = ""
        comment = ""
        exprtokens = []
        # basically the same as rightside evaluator, but uses LeftSideEvaluator class for the actual
        #   instruction building

        exprtokens, instructions = self.buildExpressionComponents()

        comment = exprtokens
        pf = Postfixer(exprtokens, self)

        if(config.DO_DEBUG):
            instructions += f";{comment}\n"

        ev = LeftSideEvaluator(self)
        ins, output = ev.evaluate(pf.createPostfix())
        instructions += ins

        return instructions, output

    def evaluateExpression(self, destination=True):
        instructions = ""
        comment = ""
        exprtokens = []
        # basically the same as rightside evaluator, but uses LeftSideEvaluator class for the actual
        #   instruction building

        exprtokens, instructions = self.buildExpressionComponents()

        comment = exprtokens
        pf = Postfixer(exprtokens, self)

        if(config.DO_DEBUG):
            instructions += f";{comment}\n"

        ev = ExpressionEvaluator(self)
        ins, output = ev.evaluatePostfix(
            pf.createPostfix(), LeftSideEvaluator(self))

        # check for an outputted float immediate
        if (isinstance(output.accessor, Variable) and output.type.isflt()
                and output.accessor.glob and not output.accessor.mutable):
            output, ninstr = ev.makeFloatImmediate(output)
            ins += ninstr

        instructions += ins

        # for general expressions, the 'pop' exception needs to be cought:
        if(isinstance(output.accessor, str) and output.accessor == "pop"):

            # for instances that require an output, the value on the stack needs to be preserved
            # in a new ralloc'd register for some other use.
            if(destination):
                newout = ralloc(output.type.isflt())
                rfree(output.accessor)
                output.accessor = newout
                instructions += spop(output)

            # in instances that do not require an output, the value on the stack can be popped into
            # RAX, which will eventually be omitted alltogether by the optimizer because the resulting code
            # would look like the following: e.g
            #
            #   push rax
            #   pop rax
            #
            # The peephole optimizer will remove any structures like this with optimization levels
            # -O2 or higher.
            else:
                out = norm_return_register if not output.type.isflt() else sse_return_register
                instructions += spop(
                    EC.ExpressionComponent(
                        norm_return_register, LONG))                
                output.accessor = out

        return instructions, output

    def createDestructor(self, var):
        # create automatic destructors before the return statement
        if(var.t.destructor is None):
            return ""
        call_label = functionlabel(var.t.destructor)
        if(var.t.ptrdepth > 0):
            params = Instruction("mov", [rdi, valueOf(var)])
        else:
            params = Instruction(
                "lea", [
                    rdi, f"[rbp-{var.offset+var.t.csize()}]"])
        instructions = f"{params}call {call_label[:-2]}\n"
        return instructions

    def buildStackStructure(self, var, starter="", startoffset=0, useDefaults=True):
        if(not var.isptr) and (var.t.ptrdepth == 0 and var.t.members is not None):
            for v in var.t.members:
                if(isinstance(v, Variable) and not isinstance(v.initializer, Function)):
                    newvar = Variable(v.t.copy(
                    ), f"{starter}{var.name}.{v.name}", offset=startoffset + var.offset + var.t.s - v.offset, isptr=v.isptr, signed=v.signed)
                    newvar.dtok = var.dtok
                    self.append_rawVariable(newvar)

                    # initialize to null, or default
                    if v.initializer is not None and useDefaults:

                        # check for float literals
                        if v.t.isflt():
                            if isinstance(
                                    v.initializer, Variable) and not v.initializer.mutable:
                                value = floatTo64h(float(v.initializer.initializer)) if v.t.csize() == 8 \
                                    else floatTo32h(float(v.initializer.initializer))
                            elif (isinstance(v.initializer, int)):
                                value = floatTo64h(float(v.initializer)) if v.t.csize() == 8 \
                                    else floatTo32h(float(v.initializer))
                        else:
                            value = v.initializer
                        
                        if not dwordImmediate(value):
                            self.addline(
                                loadToReg('rax', value)
                            )
                            value = "rax"

                        self.addline(loadToReg(
                            valueOf(
                                self.variables[-1], exactSize=True), valueOf(value, exactSize=True)
                        ))

                    else:
                        self.variables[-1].referenced = True

                    # recursivly fill in nested structures
                    self.buildStackStructure(
                        v, starter=f"{starter}{var.name}.", startoffset=var.offset, useDefaults=useDefaults)

    def constructVar(self, t, name, register):
        # create prototype variable
        vprot = Variable(t, name)

        # set the variable's register if one is given
        vprot.register = ralloc(
            t.isflt()) if register != False else None

        # add variable correctly to get extra properties added to it
        self.addVariable(vprot, False)

        # pull variable back out from the array in order to determine its offset
        # which is set by self.addVariable
        var = self.variables[-1]
        var.isptr = t.ptrdepth > 0

        return var

    def buildDeclaration(self, register=False):                     # declare new var

        if(self.current_token.tok == T_KEYWORD and self.current_token.value == "register"):
            self.buildRegdecl()
            return

        # keep track of the old stack counter for dead code elimination
        stackRestore = self.stackCounter

        # declaration datatype
        t = self.checkForType()

        # ensure that non-valuetype structures cannot be declared in registers
        if(not (isIntrinsic(t.name)) and t.ptrdepth == 0 and register):
            throw(RegsiterStructure(self.current_token))

        dtok = self.current_token
        # get either the name, or the first name
        name = self.checkForId()

        # check if variable exists already
        if(self.getVariable(name) is not None and not self.getVariable(name).glob):
            throw(VariableRedeclaration(self.tokens[self.ctidx - 1], name))

        # check if varname is a datatype
        if(self.compiler.getType(name) is not None):
            throw(UsingTypenameAsVariable(self.tokens[self.ctidx - 1]))

        # build a variable
        var = self.constructVar(t, name, register)
        var.dtok = dtok
        # if the variable is a stack-based structure,
        #   add its member variables too.
        if(not var.isptr and var.t.members is not None):
            self.buildStackStructure(var)
            self.stackCounter += 8

        sizes = [1]
        isarr = False

        # if it is a stack-based structure, and it has a destructor
        #      add it's destructor to the end of the function
        if(not isIntrinsic(var.t.name)):
            if (var.t.destructor is not None):
                self.destructor_text += self.createDestructor(var)

            if (self.current_token.tok == T_OPENP):

                if var.t.constructor is not None:
                    self.ctidx -= 2
                    self.memberCall(var.t.constructor, var)
                    self.addline("pop rax")
                else:
                    throw(UnkownConstructor(self.tokens[self.ctidx - 1]))

        autoArrsize = False

        # check for stack based array declaration
        while self.current_token.tok == "[":
            isarr = True
            self.advance()

            if self.current_token.tok == "]":
                autoArrsize = True
                self.advance()
                break

            # collect tokens for a constexpr that will be the size of the array
            exprtokens = [self.current_token]
            self.advance()

            while self.current_token.tok != T_CLSIDX:
                exprtokens.append(self.current_token)
                self.advance()

            # evaluate for size
            size = determineConstexpr(False, exprtokens, self)
            # ensure that the size is not a variable
            if isinstance(size.accessor, Variable):
                throw(ExpectedToken(self.current_token, "constexpr"))
            sizes.append(size.accessor)
            self.checkTok(T_CLSIDX)
        # stack arrays:
        if(isarr):
            # build properties:
            totalsize = (product(sizes) - 1) * t.csize()
            # stack size
            var.stackarrsize = totalsize
            var.isStackarr = True
            # sizes plural for multi-dimentional
            var.stacksizes = sizes
            # extra specification
            var.t.stackarr = True
            # update stackCounter
            self.stackCounter += totalsize

        # check for same-line assignment, or not
        if(self.current_token.tok == T_ENDL):
            self.advance()
            return

        # multidecl
        elif (self.current_token.tok == T_COMMA):
            dests = [var]
            # parse destinations
            while self.current_token.tok == T_COMMA:
                self.advance()
                xname = self.checkForId()
                xvar = self.constructVar(t, xname, register)
                # assignment is optimized out in oplvl3
                if xvar.name not in self.unreferenced:
                    dests.append(xvar)

            # declaration only
            if (self.current_token.tok == T_ENDL):
                self.advance()
                return

            # multi-assignment
            elif self.current_token.tok != T_EQUALS:
                throw(ExpectedToken(self.current_token, "="))

            self.advance()
            # get assignment value
            instr, value = self.evaluateExpression()
            # custom evaluator for multi-assignment
            evaluator = ExpressionEvaluator(self)
            # template postfix for assignment (Replace None with destination)
            pfix = [
                None, value, EC.ExpressionComponent(
                    "=", VOID, isoperation=True)]
            if (isinstance(value, Variable)
                    and value.register is None) or not value.isRegister():
                # load value to register if not already in one, for faster assignment to multiple
                # locations
                reg = ralloc(t.isflt())
                instr += loadToReg(reg, value.accessor)
                value.accessor = reg
                value.type = t

            # loop through destinations and perform assignment
            for v in dests:
                # fill in pfix template
                pfix[0] = EC.ExpressionComponent(v, v.t)
                # evaluate expression
                loadInstr, _ = evaluator.evaluatePostfix(pfix, evaluator)
                instr += loadInstr
                # cleanup
                rfree(_.accessor)
            # final cleanup
            rfree(value.accessor)
            self.addline(instr)
            self.checkSemi()
            return

        if(self.current_token.tok != T_EQUALS):
            throw(ExpectedToken(self.current_token, " = or ; "))

        self.advance()

        # normal inline assignment
        if(not isarr):
            # move back for complete expression
            self.ctidx -= 3
            self.advance()
            # record asm state in case this turns out to be dead code
            asmrestore = len(self.asm)

            instr, __ = self.evaluateExpression(destination=False)
            if var.name not in self.unreferenced:
                self.addline(instr)
            else:
                # if this is dead code, remove all the assembly and delete the
                # variable
                self.asm = self.asm[:asmrestore]
                self.popVar()
                self.stackCounter = stackRestore

            var.referenced = False
            var.refcount = 0

        # array assignment
        else:
            # itervar is used to iterate over the contents of the array
            # in order to place values in indexes.
            itervar = Variable(var.t, var.name, isStackarr=True)
            itervar.offset = var.offset
            itervar.stackarrsize = var.stackarrsize
            # track automatic length assignment
            autolen = 0

            # set literal is used
            if(self.current_token.tok == T_OPENSCOPE):

                # find the bounds of the literal
                startok = self.ctidx
                self.skipBody()
                endtok = self.ctidx + 1

                # load to a list
                setval = buildConstantSet(
                    var.t.isflt(), self.tokens[startok:endtok], self)

                # check for size mismatch
                if not autoArrsize and (len(setval.accessor) != sizes[1]):
                    throw(SetLiteralSizeMismatch(self.tokens[startok]))

                if autoArrsize:
                    itervar.offset += (len(setval.accessor) -
                                       1) * var.t.csize()
                    var.offset = itervar.offset

                # load values
                self.advance()
                for value in setval.accessor:

                    if not typematch(value.type, var.t, False):
                        throw(TypeMismatch(value.token, value.type, var.t))

                    if isinstance(value.accessor, int):
                        if(var.t.isfltarr()):
                            self.addline(
                                loadToReg(
                                    itervar, floatTo64h(
                                        value.accessor)))
                        else:
                            self.addline(loadToReg(itervar, value.accessor))

                    elif isinstance(value.accessor, Variable):

                        self.addline(
                            loadToReg(
                                itervar, value.accessor
                            )
                        )

                    else:
                        self.addline(
                            loadToReg(
                                itervar, floatTo64h(
                                    value.accessor.initializer)))
                    itervar.offset -= var.t.csize()

                autolen = (len(setval.accessor) - 1) * var.t.csize()

            elif self.current_token.tok == T_ID and \
                    "__LC.S" in self.current_token.value:

                # setup for string packing
                #   (Taking a char* and turning it into multiple big numbers)
                v = self.getVariable(self.current_token.value)
                if v is None:
                    throw(UnkownIdentifier(self.current_token))

                self.advance()
                content = v.initializer[1:-1]
                if not autoArrsize:
                    offset = var.offset + var.stackarrsize
                else:
                    offset = var.offset + len(content)
                    var.offset = offset

                longs, ints, shorts, chars = pack_string(var, content)
                for l in longs:
                    self.addline(
                        f"mov rax, {l}\nmov qword[rbp-{offset}], rax\n"
                    )
                    offset -= 8
                for i in ints:
                    self.addline(
                        f"mov dword[rbp-{offset}], {i}\n"
                    )
                    offset -= 4
                for s in shorts:
                    self.addline(
                        f"mov word[rbp-{offset}], {s}\n"
                    )
                    offset -= 2
                for c in chars:
                    self.addline(
                        f"mov byte[rbp-{offset}], {c}\n"
                    )
                    offset -= 1
                autolen = len(content)
            # single value to fill accross
            else:

                # check for redundant auto array declaration
                if autoArrsize:
                    throw(AutoArrsizeForSingle(self.current_token))

                # evaluate the new value
                evaluation, value = self.evaluateExpression()
                self.addline(evaluation)

                # determine value to load into memory
                loadval = value.accessor if isinstance(
                    value.accessor,
                    int) else (
                    floatTo64h(
                        value.accessor) if isinstance(
                        value.accessor,
                        float) else floatTo64h(
                        value.accessor.initializer))

                # load value into each index of the array
                for i in range(sizes[1]):

                    self.addline(loadToReg(itervar, loadval))
                    itervar.offset -= var.t.csize()

                autolen = 0

            if autoArrsize:
                var.t.stackarrsize = autolen
                self.stackCounter += autolen + 8

        self.checkSemi()

    # build function call not in an expression
    @DeprecationWarning
    def buildBlankfnCall(self):
        # \see self.buildFunctionCall()
        instructions, fn = self.buildFunctionCall()
        if(self.current_token.tok == ")"):
            self.advance()
        self.checkSemi()

        self.addline(instructions)

    # evaluate an ambiguous expression.
    # \see ExpressionEvaluator
    def buildAssignment(self):

        # buildAssignment is now just a wrapper for general expression evaluation
        # because assignment operators are now included in the normal expression
        # evaluation.
        # destination is false because the overall expression has no
        # destination
        insters, out = self.evaluateExpression(destination=False)
        self.addline(insters)
        self.advance()
        rfree(out.accessor)

    def buildLabel(self):
        name = self.current_token.value

        # get an asm label to correspond with this label
        asmname = getLogicLabel(
            f"USERDEF.{name}") if name not in self.userlabels else self.userlabels[name]

        # add the asm label to the current compilation location for jumping
        self.addline(f"{asmname}:")

        # record data in userlabels
        self.userlabels[name] = asmname

        # close up
        self.advance()

        # label declarations do not require a ';' because they are a simple
        # two token declaration, so the code after them can share a line or
        # not.
        self.checkTok(":")

    # build statement starting with an ambiguous ID token

    def buildIDStatement(self):

        id = self.current_token.value

        if (self.compiler.isType(id)
                and self.tokens[self.ctidx + 1].tok != T_OPENP):
            self.buildDeclaration()  # declaration
        elif (self.tokens[self.ctidx + 1].tok == ":"):
            self.buildLabel()
        else:
            # assignment or blank call

            self.buildAssignment()

        # else:
        # #   throw(UnkownIdentifier(self.current_token))

    # compile a single line
    def compileLine(self):
        if(self.current_token.tok == T_KEYWORD):
            # keyword statement
            self.buildKeywordStatement()

        elif (self.current_token.tok == T_ID):
            # ID initiated statement
            self.buildIDStatement()

        elif(self.current_token.tok in OPERATORS):
            self.buildAssignment()

        else:
            pass  # ambiguous statement
            throw(UnexpectedToken(self.current_token))
            self.advance()

    # compile the body of some control structures
    def compileBodyScope(self):
        self.max_depth += 1
        self.push_stackstate()
        self.beginRecursiveCompile()
        self.pop_stackstate()

    def beginRecursiveCompile(self):            # recursive main
        opens = 1  # maintain track of open and close scopes ("{, }")
        self.recursive_depth += 1
        while opens > 0 and self.current_token.tok != T_EOF:

            if(self.current_token.tok == T_CLSSCOPE):
                opens -= 1
            else:
                self.compileLine()
                if self.hasReturned and len(self.userlabels) == 0:
                    if self.current_token.tok != T_CLSSCOPE:
                        warn(UnreachableCode(self.current_token, self))
                    return

        self.recursive_depth -= 1

    # initialize properties at the time when self.compile is called

    def initializeProperties(self):
        # inline functions have no label
        if(not self.inline):
            self.addline(functionlabel(self))  # label

        else:
            self.stackCounter = 0  # inline functions require no overhead

        # closing label needs to be updated based on new properties
        self.closinglabel = self.getClosingLabel()

        # stack allocator (size undetermined at this point)
        self.addline("/*ALLOCATOR*/")

        # additional feature-specific operations
        if(config.ExtraFeatures["stack-protection"] and not self.inline):
            self.addline(self.doStackProtection())

    # setup stack protector

    def doStackProtection(self):

        # a variable is used to check if the stack has been changed in places
        # where it should not.
        protector = Variable(
            VOID.copy(), f"/*stack-protection-{self.name}*/")
        self.addVariable(protector)
        protector.referenced = True
        feature_instructions = Instruction(
            "pop", [valueOf(protector)]) + Instruction("push", [valueOf(protector)])

        return feature_instructions

    # perform closing check of the stack

    def closeStackProtection(self):
        # an error message is reserved in the .text read only section:
        errmsg = f"Stack protection failed in function '{self.getCallingLabel()}'."
        errmsgl = len(errmsg)
        errmsglabel = getLogicLabel("stackprotection")
        errmsgv = Variable(
            CHAR,
            errmsglabel,
            glob=True,
            isptr=True,
            initializer=f"\"{errmsg}\"")
        self.suffix += allocate_readonly(errmsgv)

        # the destructor text (or ending text) of the function must check the variable for damage by
        # comparing it to its original value stored in self.stackProtection_value.
        # If it is not the same, the program will jump to __stack_chk_fail, which is defined in an object
        # file that will be automatically linked with any programs compiled with the -Ustack-protection option
        # in config.py.
        self.destructor_text += (Instruction("mov", ["rdi", errmsglabel]))
        self.destructor_text += (Instruction("mov", ["rsi", str(errmsgl)]))
        self.destructor_text += (Instruction("pop", ["rax"]))
        self.destructor_text += (Instruction("push", ["rax"]))
        self.destructor_text += (Instruction("cmp",
                                             [valueOf(self.variables[0]),
                                              "rax"]))
        self.destructor_text += (Instruction("jne", ["__stack_chk_fail"]))

    # ending feature statements
    def closeFeatures(self):
        if(config.ExtraFeatures["stack-protection"] and not self.inline):
            self.closeStackProtection()

    def buildAllocator(self):

        # handle addition features
        feature_instructions = ""

        realValue = function_allocator(
            self.stackCounter) if self.stackCounter > 0 or not self.inline else ""
        realValue += feature_instructions

        # fill in allocator with real value
        self.asm = self.asm.replace(
            "/*ALLOCATOR*/", realValue)

    def finalWarningCheck(self):
        # warning checking:
        if(not self.returntype.__eq__(VOID.copy()) and not self.hasReturned and not self.contains_rawasm):
            warn(NoReturnStatement(self.tokens[0], self))
        if not self.contains_rawasm:
            for v in self.variables:
                if(not v.referenced and not v.name == "this"):
                    self.unreferenced.append(v.name)
                    warn(UnusedVariable(v.dtok, v, self))

    def finalCleanup(self):
        if self.regdeclremain_norm != 2 or self.regdeclremain_sse != 4:
            for v in self.variables:
                rfree(v.register)

    def optimize(self):
        # extra optimization:

        if(config.__oplevel__ == 3) and (self.compileCount == 0):

            intraprocedural = IntraproceduralOptimizer(self)
            intraprocedural.optimize()

        elif (config.__oplevel__ == 2):

            peephole = Peephole()
            peephole.addline(self.asm)
            self.asm = peephole.get()

    def compile(self):      # main
        if(self.current_token is None):
            return

        self.initializeProperties()

        self.loadParameters()             # parameters

        self.beginRecursiveCompile()      # body

        self.buildAllocator()

        # return, destructors, stack frame closing
        if(self.inline):
            self.addline(self.closinglabel)
            if(self.stackCounter):
                self.addline("leave")
        elif not self.inline:
            if not self.containsReturn and not self.contains_rawasm:
                if self.returntype.isflt():
                    self.addline("xorpd xmm0, xmm0")
                else:
                    self.addline(
                        zeroize(
                            setSize(
                                "rax",
                                self.returntype.csize())))
            self.closeFeatures()
            self.createClosing()

        self.asm += self.suffix           # readonly memory

        self.finalWarningCheck()

        self.finalCleanup()

        self.optimize()

        self.isCompiled = True

    # debug pretty print
    def __repr__(self):
        return f"[ function {self.returntype} {self.name}( {self.parameters} ) ]"

    # error message pretty print
    def pretty_print_err(self):
        return f"{self.returntype} {self.name}({', '.join((p.t.__repr__() for p in self.parameters))}{', ...' if self.variardic else ''})"

    def createTypename(self):
        return f"{self.returntype} ({', '.join((p.t.__repr__() for p in self.parameters))}{', ...' if self.variardic else ''})"

    def reset(self):

        return Function(self.name, self.parameters, self.returntype,
                        self.compiler, self.tokens, extern=self.extern, inline=self.inline, compileCount=self.compileCount, memberfn=self.memberfn, parentstruct=self.parentstruct,
                        lambdas=self.lambdas)

    def GC(self):
        self.asm = ""
        self.peephole = Peephole()


# function keyword responses outlines the responses that a Function
# object generates for different keywords.
function_keyword_responses = {
    "__asm": Function.buildASMBlock,
    "return": Function.buildReturnStatement,
    "function": Function.buildDeclaration,
    "auto": Function.buildAutoDefine,
    "unsigned": Function.buildDeclaration,
    "register": Function.buildRegdecl,
    "static": Function.buildStaticdecl,
    "if": Function.buildIfStatement,
    "while": Function.buildWhileloop,
    "for": Function.buildForloop,
    "break": Function.buildBreak,
    "continue": Function.buildContinue,
    "__simd": Function.buildSIMD,
    "switch": Function.buildSwitch,
    "del": Function.buildRegisterDel,
    "goto": Function.buildGoto,
    "do": Function.buildDoWhile

}

function_builtin_responses = {
    "sizeof": Function.evaluateSizeof,
    "typeof": Function.evaluateTypeof,
    "typeid": Function.evaluateTypeid,
    "__isflt": Function.evaluate__isflt,
    "__syscall": Function.evaluate__syscall,
    "static_assert": Function.evaluateStatic_assert
}
