import time
import random
import Assembly.AVX as AVX
import Assembly.CodeBlocks as CodeBlocks
import Assembly.TypeSizes as TypeSizes
import Classes.ExpressionComponent as EC
import Classes.Optimizer
import config
from Assembly.AVX import (avx_correctSize, avx_doToReg, avx_dropToAddress,
                          avx_loadToReg, avx_ralloc, avx_rfree)
from Assembly.CodeBlocks import (doFloatOperation,
                                 doIntOperation, fncall, function_allocator,
                                 function_closer, functionlabel, getLogicLabel,
                                 loadToPtr, loadToReg, maskset, movRegToVar,
                                 movVarToReg, spop, spush, valueOf, raw_regmov, checkTrue,
                                 allocate_readonly, createIntrinsicHeap, movMemVar, extra_parameterlabel)
from Assembly.Instructions import Instruction, Peephole, floatTo64h
from Assembly.Registers import *
from Assembly.TypeSizes import isfloat, INTMAX
from Classes.Constexpr import determineConstexpr, buildConstantSet
from Classes.DType import DType
from Classes.Error import *
from Classes.Token import *
from Classes.Variable import *
from ExpressionEvaluator import (LeftSideEvaluator, RightSideEvaluator, ExpressionEvaluator,
                                 optloadRegs)
from globals import (BOOL, CHAR, DOUBLE, INT, LONG, SHORT, VOID, TsCompatible,
                     isIntrinsic, OPERATORS)
from Postfixer import Postfixer

# multiply all items in an array


def product(arr):
    total = arr[0]
    for i in arr[1:]:
        total *= i
    return total


predefs = [
    "typeof"
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
                 tokens, inline=False, extern=False):
        self.name = name                        # fn name
        self.parameters = parameters            # list:Variable parameters
        self.returntype = returntype              # DType: return type
        self.compiler = compiler                # Parent
        self.tokens = tokens                    # All Tokens
        self.asm = "\n"                         # raw assembly output

        self.stackCounter = 8                   # counter to keep track of stacksize
        self.variables = []                     # all local variables
        # inline functions behave like macros, and are not called
        self.inline = inline
        # stack containing labels to jump to if the "continue" keyword is used
        self.continues = []
        # stack containing labels to jump to if the "break" keyword is used
        self.breaks = []

        self.current_token = self.tokens[0] if len(
            self.tokens) > 0 else None     # current token
        self.ctidx = 0                          # corrent token index
        self.maxtokens = len(self.tokens)   # one len call

        # extern is in reference to c-standard names vs .k names
        self.extern = extern

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

        # Parameter information:
        #   number of sse parameter registers used
        self.ssepcount = 0
        #   number of normal parameter registers used
        self.normpcount = 0
        #   number of extra memory-stored registers are used
        self.extra_params = 0
        # the above information is set externally by the compiler class

        # monitoring:

        # hasReturned keeps track of if a function has made a guarenteed return.
        # A guarenteed return is one not inside any other control structure, and that
        # will always happen.
        self.hasReturned = False

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

        # Features

        ## Size optimization:
        
        # When size optimization is being ran, functions are not inlined. This
        # flag stores weather or not this function would have been inline otherwise
        self.wouldbe_inline = False
        # Count the number of times this function is called
        self.references = 0



    def advance(self):                              # advance token
        self.ctidx += 1
        if(self.ctidx == self.maxtokens):
            throw(UnexepectedEOFError(self.tokens[-1]))

        self.current_token = self.tokens[self.ctidx]
        return self.current_token

    # get the raw asm label used to call this function

    def getCallingLabel(self):
        return functionlabel(self).replace(":", "").replace("\n", "")

    def checkSemi(self):                            # check current token for semicolon
        if(self.current_token.tok != T_ENDL):
            throw(ExpectedSemicolon(self.current_token))
        self.advance()

    def getUserlabel(self, name):
        return self.userlabels[name] if name in self.userlabels else None

    def checkTok(self, tok):                        # check current token for given token
        if(self.current_token.tok != tok):
            throw(ExpectedToken(self.current_token, tok))
        out = self.current_token.value
        self.advance()
        return out

    # get raw asm label used to denote the end of this function
    def getClosingLabel(self):
        return function_closer(self.getCallingLabel(), None).split(
            "\n")[0] if not self.inline else getLogicLabel("INLINERETURN") + ":"

    # get a variable of name q from first local then global scope if necessary

    def getVariable(self, q):

        return next((v for v in self.variables if (v.name if not v.static else self.staticnameref[v.name]) == q),
                    self.compiler.getGlob(q))

    # add a given variable, and set its stack offset

    def addVariable(self, v):

        v.offset = self.stackCounter
        v.dtok = self.current_token
        # self.stackCounter += v.t.size(0)

        if(v.register is None):
            if v.t.size(0) <= 8:
                self.stackCounter += 8
            else:
                self.stackCounter += v.t.csize() + 8
                v.stackarrsize = v.t.csize()
        self.variables.append(v)

    # skip a open and close scope body. Example:
    # if ( ... ) { ... }
    #            ^-----^
    #
    # This is used when the compiler can determine that
    # a control structure will never be executed, so its
    # body is skipped.
    #
    def skipBody(self):
        self.advance()
        opens = 1
        while(opens != 0):
            self.advance()
            if(self.current_token.tok == T_OPENSCOPE):
                opens += 1
            elif(self.current_token.tok == T_CLSSCOPE):
                opens -= 1

    def addline(self, l):                           # add a line of assembly to raw
        if(config.__oplevel__ > 1):
            self.peephole.addline(l)
            self.asm = f"{self.asm}{self.peephole.get()}\n"
            self.peephole.flush()
        else:
            self.asm = f"{self.asm}{l}\n"

    def addcomment(self, c):                        # add a comment to the assembly
        self.asm += ";" + c + "\n"

    # get function with name fn and datatypes types, or a suitable replacement
    # (casting)

    def getFunction(self, fn, types):

        for f in self.compiler.functions:  # first seach exact matches
            if f.name == fn:
                if(len(f.parameters) != len(types) and not f.variardic):
                    continue
                types = types[:len(f.parameters)] if f.variardic else types
                valid = True
                for i in range(len(types)):
                    if(not f.parameters[i].t.__eq__(types[i])):

                        valid = False
                        break
                if(valid):
                    return f

        for f in self.compiler.functions:  # seach others for valid casts
            if f.name == fn:
                lt = len(types)
                if(len(f.parameters) != lt):
                    continue
                valid = True
                for i in range(lt):
                    # if f.parameters[i].t.__repr__() != types[i].__repr__():
                    if (not TsCompatible(f.parameters[i].t, types[i], self)):
                        valid = False
                        break

                if(valid):
                    return f

    def checkForId(self):               # check next tokens for ID

        if(self.current_token.tok != T_ID):
            throw(ExpectedIdentifier(self.current_token))

        id = self.current_token.value
        self.advance()
        return id

    def checkForType(self):             # check next tokens for Type, and return it as a DType
        signed = True
        if(self.current_token.tok == T_KEYWORD):
            if(self.current_token.value == "unsigned"):
                signed = False
                self.advance()

        if(self.current_token.tok != T_ID):
            throw(ExpectedIdentifier(self.current_token))

        if(not self.compiler.isType(self.current_token.value)):
            throw(ExpectedType(self.current_token))

        t = self.compiler.getType(self.current_token.value).copy()

        self.advance()
        ptrdepth = 0
        while self.current_token.tok == "*":
            ptrdepth += 1
            self.advance()
        t.ptrdepth = ptrdepth
        t.signed = signed
        return t

    def buildPredef(self):
        p = self.current_token.value
        stp = self.current_token
        assert p in predefs

        self.advance()

        if(p == "typeof"):

            final = self.evaluateLeftsideExpression()[1]
            pend = self.current_token
            rfree(final.accessor)
            if(final.isconstint()):
                return Token(T_INT, final.accessor,
                             stp.start, stp.end)
            if(not final.isRegister()):
                return Token(T_INT, final.type.csize(),
                             stp.start, stp.end)
            return Token(T_INT, final.type.csize(),
                         stp.start, stp.end)

    # load parameters into memory (first instructions)

    def loadParameters(self):
        countn = 0
        counts = 0

        for p in self.parameters:

            if(self.parameters.index(p) >= len(self.parameters) - self.extra_params):
                break

            if (self.inline):
                if(p.isflt()):
                    p.register = sse_parameter_registers[counts]
                    counts += 1
                else:
                    p.register = norm_parameter_registers[countn]
                    countn += 1
                self.regdecls.append(
                    EC.ExpressionComponent(
                        p.register, p.t, token=self.tokens[0]))

            self.addVariable(p)
            p.referenced = True

            if (not self.inline):
                if(config.DO_DEBUG):
                    self.addcomment(f"Load Parameter: {p}")
                if(p.isflt()):
                    self.addline(movRegToVar(
                        p.offset, sse_parameter_registers[counts]))

                    counts += 1
                else:
                    self.addline(movRegToVar(
                        p.offset, norm_parameter_registers[countn]))
                    countn += 1
        # load extra parameters (those that could not be assigned registers)
        epcounter = self.extra_params
        while epcounter > 0:
            # extra parameters are loaded from their BSS memory locations
            self.addVariable(self.parameters[-epcounter])
            self.addline(movMemVar(
                (self.variables[-1]), f"[{extra_parameterlabel(self, epcounter)[:-1]}]"))
            epcounter -= 1

    def createClosing(self):                    # create end of the function

        self.addline(function_closer(
            self.getCallingLabel(), self.destructor_text))

    def buildReturnStatement(self):             # build a return statement
        self.advance()
        if(self.current_token.tok != T_ENDL):

            instr = self.evaluateRightsideExpression(
                EC.ExpressionComponent(
                    sse_return_register if self.returntype.isflt() else setSize(
                        norm_return_register,
                        self.returntype.csize()),
                    self.returntype,
                    token=self.current_token))

            self.addline(instr)
        self.addline(Instruction('jmp', [self.closinglabel[:-1]]))
        self.checkSemi()
        if self.recursive_depth == 1:
            self.hasReturned = True

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

        # check if the resultant will always evaluate to false
        if(resultant.isconstint() and resultant.accessor != 0) or not resultant.isconstint():

            preInstructions += f"{checkTrue(resultant)}jz {postlabel}\n"

            self.addline(preInstructions)
            self.checkTok(T_OPENSCOPE)

            # compile the body
            self.beginRecursiveCompile()
            self.addline(f"jmp {jmpafter}")
            self.advance()

            # check for else
            if(self.current_token.tok == T_KEYWORD):

                if(self.current_token.value == "else"):

                    self.addline(postlabel + ":\n")
                    self.advance()
                    if(self.current_token.tok == T_KEYWORD and self.current_token.value == "if"):
                        self.buildIfStatement()
                    elif(self.current_token.tok == T_OPENSCOPE):
                        self.advance()
                        self.beginRecursiveCompile()
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

        else:
            # the following is executed in an instance like this:
            # if(false) { ... }
            self.skipBody()

        self.continues.pop()

    def buildForloop(self):
        self.advance()
        self.checkTok(T_OPENP)

        # pre determine jumping labels:
        toplabel = getLogicLabel("FORTOP")
        comparisonlabel = getLogicLabel("FORCMP")
        updatelabel = getLogicLabel("FORUPDATE")
        endlabel = getLogicLabel("FOREND")

        self.continues.append(comparisonlabel)
        self.breaks.append(endlabel)

        # build the declaration a for example : for ( a; ... ;...) { ... }
        self.buildDeclaration()
        # var is the variable declared above
        var = self.variables[-1]

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
        elif(resultant.accessor != 0):
            self.addline(f"jmp {toplabel}\n")
        else:
            pass

        self.addline(f"{endlabel}:")
        self.advance()

        self.continues.pop()
        self.breaks.pop()

    def buildWhileloop(self):
        self.advance()
        self.checkTok(T_OPENP)

        # pre-determined jump labels
        startlabel = getLogicLabel("WHILESTART")
        comparisonlabel = getLogicLabel("WHILECMP")
        endlabel = getLogicLabel("WHILEEND")
        self.continues.append(comparisonlabel)
        self.breaks.append(endlabel)

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
        self.continues.pop()
        self.breaks.pop()

    def buildSIMD(self):
        self.advance()

        # check for opsize
        if(self.current_token.tok != T_INT):
            throw(ExpectedToken(self.current_token, "SIMD opsize"))

        op = self.current_token.value
        self.advance()

        # check for dtype
        if(self.current_token.tok != T_ID):
            throw(ExpectedType(self.current_token))
        t = self.compiler.getType(self.current_token.value)
        vsize = t.csize()
        flt = t.isflt()
        if(t is None):
            throw(UnkownIdentifier(self.current_token))
        self.advance()

        self.checkTok(T_OPENP)

        # check for the first array
        arr1 = self.getVariable(self.current_token.value)
        if(arr1 is None):
            throw(UnkownIdentifier(self.current_token))
        self.advance()
        idx1 = ralloc(False)

        self.checkTok(T_COMMA)

        # build instructions to evaluate for the first given index
        determine_index1 = self.evaluateRightsideExpression(
            EC.ExpressionComponent(idx1, LONG.copy(), token=self.current_token))

        self.checkTok(T_CLSP)
        self.checkTok(T_OPENSCOPE)

        avx1 = avx_ralloc()
        avx1 = avx_correctSize(avx1, op)
        self.addline(determine_index1)
        self.addline(avx_loadToReg(op, avx1, arr1, idx1))

        # evaluate the inner operations
        while self.current_token.tok != T_CLSSCOPE:

            self.checkTok(T_OPENP)

            # check for operator
            opn = self.current_token.tok
            if(not Postfixer.isOperator(None, self.current_token)):
                throw(ExpectedToken(self.current_token, "operator"))
            if(opn not in ["+", "-", "*"] and not flt):
                throw(InvalidSimdOperation(self.current_token, opn))
            self.advance()
            self.checkTok(T_COMMA)

            # check for array
            arrn = self.getVariable(self.current_token.value)
            if(arrn is None):
                throw(UnkownIdentifier(self.current_token))
            self.advance()
            self.checkTok(T_COMMA)

            # build evaluation for the index
            idxn = ralloc(False)
            determine_idxn = self.evaluateRightsideExpression(
                EC.ExpressionComponent(idxn, LONG.copy(), token=self.current_token))
            self.advance()
            avxn = avx_ralloc()

            # fill in instruction blocks
            avxn = avx_correctSize(avxn, opn)
            self.addline(determine_idxn)
            self.addline(avx_loadToReg(opn, avxn, arrn, idxn))
            self.addline(avx_doToReg(opn, op, vsize, avx1, avxn, flt))

            avx_rfree(avxn)
            rfree(idxn)

        self.advance()
        self.checkTok(T_OPENP)
        # check destination array
        destarr = self.getVariable(self.current_token.value)
        if(destarr is None):
            throw(UnkownIdentifier(self.current_token))
        self.advance()
        self.checkTok(T_COMMA)

        # evaluate destination index
        determineidxf = self.evaluateRightsideExpression(
            EC.ExpressionComponent(idx1, LONG.copy(), token=self.current_token))
        self.checkTok(T_CLSP)

        self.checkSemi()

        # fill in instruction blocks
        self.addline(determineidxf)
        self.addline(avx_dropToAddress(op, avx1, destarr, idx1))

        rfree(idx1)
        avx_rfree(avx1)

    def buildASMBlock(self):  # build inline assembly block
        self.advance()
        self.checkTok(T_OPENSCOPE)

        # assembly instructions are stored as a string token
        if(self.current_token.tok != T_STRING):
            throw(ExpectedToken(self.current_token, "Assembly String"))

        # copy value so as not to change it
        content = f"{self.current_token.value}"
        content = content.replace("\\", "")
        lnum = getLogicLabel("")
        content = content.replace("%L", lnum)

        self.addline(content)

        self.advance()

        self.checkTok(T_CLSSCOPE)
        if self.recursive_depth == 1:
            self.hasReturned = True

    def buildSwitch(self):
        self.advance()
        o = LONG.copy()

        # determine datatype
        retrace = self.ctidx
        voider = self.evaluateRightsideExpression("AMB", o)
        self.ctidx = retrace - 1
        self.advance()

        # create label marking end of structure
        endlabel = getLogicLabel("SWITCHEND")

        self.breaks.append(endlabel)

        # evaluate the lvalue to compare
        loadinstr, cmpvalue = self.evaluateExpression()

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

            self.buildDeclaration(register=True)

            v = self.variables[-1]
            self.regdecls.append(
                EC.ExpressionComponent(
                    v.register, v.t, token=s))

            if(v.t.isflt()):
                self.regdeclremain_sse -= 1
            else:
                self.regdeclremain_norm -= 1

    def buildDoWhile(self):
        self.advance()
        self.checkTok(T_OPENSCOPE)

        # determine label to mark begining of loop
        startlabel = getLogicLabel("DOWHILE")
        self.addline(f"{startlabel}:")

        # compile body
        self.beginRecursiveCompile()
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
        name = self.checkTok(T_ID)
        label = name + getLogicLabel(name)
        var = Variable(t, name, True, signed=t.signed, static=True)

        if (self.getVariable(name)
                is not None or self.compiler.getType(name) is not None):
            throw(VariableRedeclaration(self.tokens[self.ctidx - 1], var))

        var.name = label
        self.staticnameref[label] = name

        self.compiler.heap += createIntrinsicHeap(var)
        self.variables.append(var)

        self.ctidx -= 2
        self.advance()

    def buildInlineFunction(self):
        self.advance()
        rettype = self.checkForType()
        parameters = []
        self.checkTok(T_OPENP)

        while self.current_token.tok != T_CLSP:

            t = self.checkForType()

            if(self.current_token.tok != T_ID):
                throw(ExpectedIdentifier(self.current_token))

            varname = self.current_token.value

            self.advance()

            parameters.append(Variable(t, varname, isptr=t.ptrdepth > 0))
            if (self.current_token.tok == T_CLSP):

                break

            if(self.current_token.tok != T_COMMA):
                throw(ExpectedComma(self.current_token))

            self.advance()

        self.advance()
        firsttok = self.ctidx + 1

        self.skipBody()
        end = self.ctidx + 1
        tokens = (self.tokens[firsttok:end])
        label = getLogicLabel("FORWARD")[1:]
        fun = Function(
            label,
            parameters,
            rettype,
            self.compiler,
            tokens,
            extern=True)
        self.compiler.functions.append(fun)

        self.compiler.globals.append(
            Variable(
                rettype.up(),
                label,
                glob=True,
                isptr=True,
                mutable=False,
                signed=rettype.signed
            )
        )

        return label

    # build a statement that starts with a keyword

    def buildKeywordStatement(self):
        word = self.current_token.value

        # inline assembly:
        if(word == "__asm"):
            self.buildASMBlock()
        elif(word == "return"):
            self.buildReturnStatement()

        elif (word == "function"):
            self.buildInlineFunction()

        # wrapper for declaration with unsigned type
        elif(word == "unsigned"):
            s = self.current_token
            self.advance()
            self.buildDeclaration()
            v = self.variables[-1]
            if(v.isflt()):
                throw(InvalidSignSpecifier(s))
            v.signed = False
            v.t.signed = False

        # register declaration
        elif(word == "register"):

            self.buildRegdecl()

        elif (word == "static"):

            self.buildStaticdecl()

        elif(word == "if"):
            self.buildIfStatement()

        elif(word == "while"):
            self.buildWhileloop()

        elif(word == "for"):
            self.buildForloop()

        elif(word == "break"):
            if(len(self.breaks) == 0):
                throw(UnmatchedBreak(self.current_token))
            l = self.breaks[-1]
            self.addline(f"jmp {l}\n")
            self.advance()
            self.checkSemi()

        elif(word == "continue"):
            l = self.continues[-1]
            self.addline(f"jmp {l}\n")
            self.advance()
            self.checkSemi()

        elif(word == "__simd"):
            self.buildSIMD()

        elif(word == "switch"):
            self.buildSwitch()

        elif(word == "del"):
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
            rfree(v.register)

            if("xmm" in v.register):
                self.regdeclremain_sse -= 1
            else:
                self.regdeclremain_norm -= 1
            self.advance()

        elif (word == "goto"):
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

        elif(word == "do"):
            self.buildDoWhile()

        else:
            throw(UnexpectedToken(self.current_token))

    # push all register declarations before function call
    # to preserve their state.
    def pushregs(self):
        out = ""
        for r in self.regdecls:
            out += spush(r)
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

    def rawFNParameterLoad(self, fn, sseused, normused, pcount, offset=False):
        paraminst = ""

        rng = range(1, pcount) if offset else range(pcount)

        # for each parameter
        for i in rng:

            # check for extra parameters
            if(i >= pcount - fn.extra_params):

                break

            # if the parameter is a float, load to SSE register
            if(fn.parameters[i].isflt()):

                inst = (self.evaluateRightsideExpression(EC.ExpressionComponent(
                    sse_parameter_registers[sseused], fn.parameters[i].t.copy(), token=self.current_token))
                )
                sseused += 1
            # else, load to normal register of the correct size
            else:
                # determine size:

                result = setSize(
                    norm_parameter_registers[normused],
                    fn.parameters[i].t.csize())

                ec = EC.ExpressionComponent(
                    result, fn.parameters[i].t.copy(), token=self.current_token)
                # build main instructions
                inst = f"{self.evaluateRightsideExpression(ec)}"
                # finalize with mov of correct size

                # if(fn.parameters[i].t.csize() != 8):

                #    inst += (Instruction("mov", [setSize(norm_parameter_registers[normused],
                # fn.parameters[i].t.csize()), setSize(result,
                # fn.parameters[i].t.csize())]))

                # inst += (maskset(
                #    norm_parameter_registers[normused],
                #    fn.parameters[i].t.csize()))
                #    rfree(result)
                normused += 1
            paraminst = f"{inst}{paraminst}"

            if(self.current_token.tok == ","):
                self.advance()

        # load the function's extra params
        epcounter = fn.extra_params

        while epcounter > 0:
            # extra parameters are loaded into rax, and then into their BSS
            # memory location
            paraminst += (self.evaluateRightsideExpression(EC.ExpressionComponent(
                "rax", fn.parameters[-epcounter].t.copy(), token=self.current_token))
            )
            paraminst += loadToReg(
                f"[{extra_parameterlabel(fn,epcounter)[:-1]}]", "rax")
            if(self.current_token.tok == ","):
                self.advance()
            epcounter -= 1

        return paraminst

    def buildFunctionCallClosing(self, fn, varcall, var):
        instructions = ""

        # actual 'call' instruction

        instructions += (fncall(fn)
                         ) if not varcall else (Instruction("call", [valueOf(var)]))

        # save return value for register restores
        if(len(self.regdecls) > 0):
            tmp = ralloc(False)
            instructions += raw_regmov(
                tmp, sse_return_register if fn.returntype.isflt() else norm_return_register)

        instructions += (self.restoreregs())

        # restore return value after register restores
        if(len(self.regdecls) > 0):
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

        self.advance()
        self.checkTok(T_OPENP)

        types = []

        start = self.ctidx
        # build parameters, without storing instructions in order to determine
        # the datatypes, and place them in types[]
        while self.current_token.tok != ")" and self.current_token.tok != T_ENDL:
            o = LONG.copy()
            tmp = self.evaluateRightsideExpression("AMB", o)

            if(self.current_token.tok == ","):
                self.advance()
            types.append(o)

        # using the fn name, and the parameter types find the actual function
        # object best suited for this call
        fn = self.getFunction(fid, types)

        if(fn is self and self.inline):
            throw(RecursiveInlineCall(self.current_token))

        self.ctidx = start - 1
        self.advance()
        if(fn is None and self.compiler.getFunction(fid) is None):
            pcount = len(types)
            var = self.getVariable(fid)
            if(var is None):
                throw(UnkownIdentifier(fnstartt))
            params = [Variable(t, "parameter") for t in types]
            fn = Function(fid, params, var.t, self.compiler, [])
            varcall = True
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

        instructions += (self.pushregs())

        paraminst = self.rawFNParameterLoad(fn, sseused, normused, pcount)

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

        # save regdecls
        self.addline(self.pushregs())
        # load 'this'
        self.addline(f"lea rdi, [rbp-{this.offset+this.t.s}]\n")

        # remaining parameters:
        normused = 1
        sseused = 0
        pcount = len(fn.parameters)
        self.advance()
        self.advance()
        self.addline(
            self.rawFNParameterLoad(
                fn,
                sseused,
                normused,
                pcount,
                True))

        # actual function call, and restore
        self.addline(self.buildFunctionCallClosing(fn, False, None))
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
            elif(self.current_token.tok == T_ID):
                if(self.tokens[self.ctidx + 1].tok == "("):
                    wasfunc = True

                    if(self.current_token.value in predefs):
                        exprtokens.append(self.buildPredef())
                        # ensure correct closing
                        exprtokens.append(
                            self.current_token) if self.current_token.tok == T_CLSP else None
                        continue
                    else:

                        token, inst = self.wrapExpressionFunctionCall()
                        exprtokens.append(token)
                        instructions += inst

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

            elif (self.current_token.tok == T_KEYWORD):

                # forward function declarations are detected and parsed here. The label used
                # to declare the function is returned by self.buildInineFunction() and used
                # as a global variable in the context of this expression.
                if(self.current_token.value == "function"):
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

    # evaluate the next tokens and return the asm instructions
    def evaluateRightsideExpression(self, destination, otyperef=None):
        instructions = ""
        comment = ""
        exprtokens = []

        # get tokens, and instructions
        exprtokens, instructions = self.buildExpressionComponents()

        # using __repr__()
        comment = exprtokens

        # \see Postfixer
        pf = Postfixer(exprtokens, self)

        if(config.DO_DEBUG):
            instructions += f";{comment}\n\n"

        # \see RightSideEvaluator
        ev = RightSideEvaluator(self)

        # get instructions, and returntype of the now postifixed equation
        ins, ot = ev.evaluate(destination, pf.createPostfix())
        instructions += ins

        # load returntype properties to the given reference
        if(otyperef is not None):
            otyperef.load(ot)

        return instructions

    # evaluate the destination for a rightside expression.
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
        instructions += ins

        # for general expressions, the 'pop' exception needs to be cought:
        if(isinstance(output.accessor, str) and output.accessor == "pop"):

            # for instances that require an output, the value on the stack needs to be preserved
            # in a new ralloc'd register for some other use.
            if(destination):
                newout = ralloc(output.type.isflt())
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
                instructions += spop(
                    EC.ExpressionComponent(
                        norm_return_register, LONG))

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

    def buildStackStructure(self, var, starter=""):
        if(not var.isptr) and (var.t.ptrdepth == 0 and var.t.members is not None):
            for v in var.t.members:
                if(isinstance(v, Variable) and not isinstance(v.initializer, Function)):

                    self.variables.append(Variable(v.t.copy(
                    ), f"{starter}{var.name}.{v.name}", offset=var.offset + var.t.csize() - v.offset, isptr=v.isptr, signed=v.signed))
                    # initialize to null

                    self.addline(Instruction(
                        "mov", [valueOf(self.variables[-1], exactSize=True), valueOf(v.initializer, exactSize=True)]))

                    # recursivly fill in nested structures
                    self.buildStackStructure(
                        v, starter=f"{starter}{var.name}.")

    def buildDeclaration(self, register=False):                     # declare new var
        if(self.current_token.tok == T_KEYWORD and self.current_token.value == "register"):
            self.buildRegdecl()
            return

        t = self.checkForType()

        if(not isIntrinsic(t.name) and register):
            throw(RegsiterStructure(self.current_token))

        name = self.checkForId()

        # check if variable exists already
        if(self.getVariable(name) is not None and not self.getVariable(name).glob):
            throw(VariableRedeclaration(self.tokens[self.ctidx - 1], name))

        # check if varname is a datatype
        if(self.compiler.getType(name) is not None):
            throw(UsingTypenameAsVariable(self.tokens[self.ctidx - 1]))

        # create prototype variable
        vprot = Variable(t, name)

        # set the variable's register if one is given
        vprot.register = ralloc(
            t.isflt()) if register != False else None

        # add variable correctly to get extra properties added to it
        self.addVariable(vprot)

        # pull variable back out from the array in order to determine its offset
        # which is set by self.addVariable
        var = self.variables[-1]
        var.isptr = t.ptrdepth > 0

        # if the variable is a stack-based structure,
        #   add its member variables too.
        if(not var.isptr and var.t.members is not None):
            self.buildStackStructure(var)

        sizes = [1]
        isarr = False

        # if it is a stack-based structure, and it has a destructor
        #      add it's destructor to the end of the function
        if(not isIntrinsic(var.t.name) and var.t.destructor is not None):

            self.destructor_text += self.createDestructor(var)

        # check for stack based array declaration
        while self.current_token.tok == "[":
            isarr = True
            self.advance()
            exprtokens = [self.current_token]
            self.advance()
            while self.current_token.tok != T_CLSIDX:
                exprtokens.append(self.current_token)
                self.advance()

            size = determineConstexpr(False, exprtokens, self)
            if isinstance(size.accessor, Variable):
                throw(ExpectedToken(self.current_token, "constexpr"))
            sizes.append(size.accessor)
            self.checkTok(T_CLSIDX)

        if(isarr):
            totalsize = product(sizes) * t.csize()
            var.stackarrsize = totalsize
            var.isStackarr = True
            var.stacksizes = sizes
            var.t.stackarr = True
            self.stackCounter += totalsize

        # check for same-line assignment, or not
        if(self.current_token.tok == T_ENDL):
            self.advance()
            return

        if(self.current_token.tok != T_EQUALS):
            throw(ExpectedToken(self.current_token, " = or ; "))

        self.advance()

        # normal inline assignment
        if(not isarr):

            self.addline(self.evaluateRightsideExpression(
                EC.ExpressionComponent(var, var.t, token=self.current_token)))

        # array assignment
        else:

            # itervar is used to iterate over the contents of the array
            # in order to place values in indexes.
            itervar = Variable(var.t, var.name, isStackarr=True)
            itervar.offset = var.offset
            itervar.stackarrsize = var.stackarrsize

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
                if(len(setval.accessor) != sizes[1]):
                    throw(SetLiteralSizeMismatch(self.tokens[startok]))

                # load values
                self.advance()
                for value in setval.accessor:
                    if isinstance(value.accessor, int):
                        if(var.t.isfltarr()):
                            self.addline(
                                loadToReg(
                                    itervar, floatTo64h(
                                        value.accessor)))
                        else:
                            self.addline(loadToReg(itervar, value.accessor))

                    else:
                        self.addline(
                            loadToReg(
                                itervar, floatTo64h(
                                    value.accessor.initializer)))
                    itervar.offset -= var.t.csize()

            # single value to fill accross
            else:

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
        # ensure that this label does not already exist
        if(name in self.userlabels):
            throw(VariableRedeclaration(self.current_token, name))

        # get an asm label to correspond with this label
        asmname = getLogicLabel(f"USERDEF.{name}")

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

    def beginRecursiveCompile(self):            # recursive main
        opens = 1  # maintain track of open and close scopes ("{, }")
        self.recursive_depth += 1
        while opens > 0 and self.current_token.tok != T_EOF:

            if(self.current_token.tok == T_CLSSCOPE):
                opens -= 1

            elif(self.current_token.tok == T_KEYWORD):
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

            self.closeFeatures()
            self.createClosing()

        self.asm += self.suffix           # readonly memory

        # warning checking:
        if(not self.returntype.__eq__(VOID.copy()) and not self.hasReturned):
            warn(NoReturnStatement(self.tokens[0], self))

        for v in self.variables:
            if(not v.referenced):
                warn(UnusedVariable(v.dtok, v, self))

        if self.regdeclremain_norm != 2 or self.regdeclremain_sse != 4:
            for v in self.variables:
                rfree(v.register)

        # extra optimization:

        if(config.__oplevel__ == 3):

            pfinal = Peephole()
            pfinal.addline(self.asm)

            self.asm = pfinal.get()

        self.isCompiled = True

    def __repr__(self):     # pretty print
        return f"[ function {self.returntype} {self.name}( {self.parameters} ) ]"

    def reset(self):

        return Function(self.name, self.parameters, self.returntype,
                        self.compiler, self.tokens, extern=self.extern, inline=self.inline)

    def GC(self):
        self.asm = ""
        del self.peephole
