import Classes.DType as Type
import config
from Assembly.CodeBlocks import (createFloatConstant, createIntrinsicConstant,
                                 createStringConstant, extra_parameterlabel,
                                 functionlabel)
from Assembly.Registers import (norm_parameter_registers,
                                norm_scratch_registers,
                                norm_scratch_registers_inuse, ralloc, rfree,
                                rfreeAll, sse_parameter_registers,
                                sse_scratch_registers,
                                sse_scratch_registers_inuse)
from Classes.Constexpr import buildConstantSet, determineConstexpr
from Classes.DType import DType, type_precedence
from Classes.Error import *
from Classes.Location import Location
from Classes.Token import *
from Classes.Token import Token
from Classes.Variable import Variable
from Function import Function
from globals import BOOL, CHAR, DOUBLE, INT, INTRINSICS, LONG, SHORT, VOID
from Lexer import Lexer
from Structure import Structure

#####################################
#
#   The Compiler class is used to compile global variables,
#       isolate structures, and isolate functions.
#   Functions are compiled in the Function class.
#
#   \see Token
#   \see Variable
#   \see Function
#   \see compile.py
#   \see globals
#
######################################


class Compiler:

    def __init__(self):
        self.globals = []               # all global variables
        self.constants = ""             # raw assembly for constant definitions
        # raw assembly for heap definitions (.bss)
        self.heap = ""
        self.initializers = ""          # raw assembly for initialization of heap definitions
        # raw assembly to call the given entrypoint (usually main)
        self.entry = ""
        self.text = ""                  # raw .text assembly
        self.currentfname = ""          # current filename
        self.currentTokens = []         # current tokens: Token

        self.currentfunction = None     # for fn compiletime

        self.current_token = None       # current token
        self.ctidx = 0                  # index of current_token in self.currentTokens
        self.prevtok = Token(T_AMBIGUOUS, T_AMBIGUOUS, None, None)

        self.functions = []             # all Function objects

        self.types = []                 # all datatypes: DType
        self.template_types = []        # templated types
        self.template_cache = []        # already filled templates for speed

        # typedefs listed as (old, new):(DType,DType)
        self.tdefs = []

        for i in INTRINSICS:            # fill types with primitives
            self.types.append(i.copy())

        self.possible_members = []

        self.heap_unnamed = 0           # int counter for unnamed heap variables

        # panicmode means continue compiling, but there has already been an
        # error
        self.panicmode = False

    def isType(self, q):                # return: if q is type
        return self.getType(
            q) is not None or self.getTemplateType(q) is not None

    def isIntrinsic(self, q):           # return: if q is primitive
        return next((t for t in INTRINSICS if self.Tequals(t.name, q)), None)

    def ismember(self, q):
        return q in self.possible_members

    def getGlob(self, q):               # get global variable of name q
        out = next((g for g in self.globals if g.name == q), None)
        if(out is not None):
            return out

        fn = self.getFunction(q)
        if(fn is None):
            return None

        return self.getGlob(fn.getCallingLabel())

    def getTemplateType(self, q):
        return next((t for t in self.template_types if t[0].name == q), None)

    def getFunction(self, q):           # get first function of name q
        return next((f for f in self.functions if f.name == q), None)

    def advance(self):                  # move to next token
        self.ctidx += 1
        self.prevtok = self.current_token
        try:
            self.current_token = self.currentTokens[self.ctidx]
        except BaseException:
            throw(UnexepectedEOFError(self.current_token))

    def Tequals(self, ta, tb):          # determine DType equality (including typedefs)
        if(ta == tb):
            return True
        return next((True for tdef in self.tdefs if (
            (tdef[0].name == ta and tdef[1].name == tb) or tdef[0].name == tb and tdef[1].name == ta)), False)

    def getType(self, qu):               # get type of name q
        pd = 0
        q = f"{qu}"
        pd = q.count(".")
        q = q.replace(".", "")

        out = next((t for t in self.types if t.name == q), None)
        if(out is None):
            return None
        out = out.copy()
        out.ptrdepth = pd
        return out

    def checkType(self):                # check the next tokens for a type, and return it

        # account for sign of type
        signed = True
        if(self.current_token.tok == T_KEYWORD):
            if(self.current_token.value == "unsigned"):
                signed = False
                self.advance()

        if(self.current_token.tok != T_ID):
            throw(ExpectedIdentifier(self.current_token))

        if(not self.isType(self.current_token.value)):
            throw(ExpectedType(self.current_token))
        # get raw type
        t = self.getType(self.current_token.value)
        if(t is None):
            throw(UnkownType(self.current_token))
        t = t.copy()

        # apply pointer depth, and sign
        self.advance()
        ptrdepth = 0
        while self.current_token.tok == "*":
            ptrdepth += 1
            self.advance()
        t.ptrdepth = ptrdepth
        t.signed = signed
        return t

    # create a constant string value in self.constants
    def createStringConstant(self, content):

        # d = (.data instructions, varname)
        d = createStringConstant(content)
        name = d[1]
        cnst = d[0]
        self.constants += cnst
        v = Variable(CHAR.copy(), name, glob=True)
        self.globals.append(v)

    # create an arbitrary constant in self.constants
    def createConstant(self, extern=False):
        # dtype
        startidx = self.ctidx
        intr = self.checkType()
        if (self.current_token.tok != T_ID):
            throw(ExpectedIdentifier(self.current_token))
        name = self.current_token.value

        self.advance()

        # check for simple C style function declarations
        if(self.current_token.tok == T_OPENP or self.current_token.tok == T_NAMESPACE):
            self.ctidx = startidx - 1
            self.advance()
            self.createFunction()
            return

        # variables declared with extern are not placed in the data section, and are simply
        # recorded for use by the compiler.
        if(extern):
            if(self.current_token.tok == T_EQUALS):
                throw(AssigningExternedValue(self.current_token))
            self.globals.append(Variable(intr.copy(), name, glob=True))
            if(self.current_token.tok != T_ENDL):
                throw(ExpectedSemicolon(self.current_token))
            self.advance()
            return

        # test for early endline
        if (self.current_token.tok != T_EQUALS):

            # if there is no assignment, these variables can be moved to the bss section because they
            # are uninitialized.
            if(self.current_token.tok == T_ENDL):
                self.globals.append(
                    Variable(
                        intr.copy(),
                        name,
                        glob=True,
                        initializer=0))
                self.heap += f"{name}: resb {intr.csize()}\n"
                self.advance()
                return
            else:
                throw(ExpectedValue(self.current_token))

        self.advance()

        # Tokens need to be collected to be passed through the constexpr evaluator.
        # \see Classes.Constexpr

        exprtokens = []
        isSet = False
        if(self.current_token.tok == T_OPENSCOPE):
            isSet = True

        while(self.current_token.tok != T_ENDL):
            exprtokens.append(self.current_token)
            self.advance()

        # use the constexpr evaluator to find the value for the global
        value = determineConstexpr(intr.isflt(), exprtokens, Function(
            "CMAININIT", [], LONG.copy(), self, exprtokens)) if not isSet else buildConstantSet(intr.isflt(), exprtokens, Function(
                "CMAININIT", [], LONG.copy(), self, exprtokens))

        isptr = False
        # if the final value is a variable, the initializer to that variable is
        # taken
        if(isinstance(value.accessor, Variable)):
            value.accessor = value.accessor.name if intr.ptrdepth == value.accessor.t.ptrdepth + \
                1 else value.accessor.initializer
            isptr = True

        self.globals.append(Variable(intr.copy(), name,
                                     glob=True, initializer=value.accessor, isptr=isptr))

        # add .data instructions to self.constants
        self.constants += createIntrinsicConstant(self.globals[-1])

        if(self.current_token.tok != T_ENDL):
            throw(ExpectedSemicolon(self.current_token))
        self.advance()

    # isolate a function and build a Function object
    def createFunction(self, thisp=False, thispt=None):
        inline = False
        if(self.current_token.tok == T_KEYWORD):
            if(self.current_token.value == "inline"):
                inline = True

        rettype = self.checkType()

        struct = None

        # for external definitions of member functions:
        # (The '::' token will be in place of an '(')
        if(self.currentTokens[self.ctidx + 1].tok == T_NAMESPACE):
            if(self.current_token.tok != T_ID):
                throw(ExpectedIdentifier(self.current_token))

            # get parent
            struct = self.getType(self.current_token.value)

            if(struct is None):
                throw(UnkownType(self.current_token))

            # setup function for a 'this' value
            thisp = True
            thispt = struct
            self.advance()
            self.advance()

        if(self.current_token.tok != T_ID):
            throw(ExpectedIdentifier(self.current_token))

        name = self.current_token.value

        self.advance()

        if(self.current_token.tok != T_OPENP):
            throw(ExpectedParethesis(self.current_token))

        self.advance()

        parameters = []
        if(thisp):
            parameters.append(Variable(thispt, "this", isptr=True))

        variardic = False

        # count of each type of parameter
        ssecount = 0
        normcount = 0

        # load parameters until end of fn header at ')'
        while self.current_token.tok != T_CLSP:

            if(self.current_token.tok == T_ELIPSES):
                variardic = True
                self.advance()
                break

            t = self.checkType()
            # increment param types
            ssecount += t.isflt()
            normcount += not t.isflt()

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

        # check for early end (just declaration, no assignment)
        if(self.current_token.tok == T_ENDL):
            self.advance()

            f = Function(name, parameters, rettype, self, [])
            self.globals.append(
                Variable(
                    f.returntype.up(),
                    f.getCallingLabel(),
                    glob=True,
                    isptr=True,
                    mutable=False,
                    signed=f.returntype.signed))

            # self.globals.append(
            #    Variable(
            #        f.returntype.copy(),
            #        f.name,
            #        glob=True))

            self.functions.append(f)

            return

        if(self.current_token.tok != T_OPENSCOPE):
            throw(ExpectedToken(self.current_token, T_OPENSCOPE))

        self.advance()
        # isolate the body of the function
        # (keep track of scope open / scope close)
        opens = 1
        start = self.ctidx
        while opens > 0:
            if(self.current_token.tok == T_OPENSCOPE):
                opens += 1
            if(self.current_token.tok == T_CLSSCOPE):
                opens -= 1
            self.advance()

        # construct final object
        f = Function(name, parameters, rettype, self,
                     self.currentTokens[start:self.ctidx])
        f.variardic = variardic

        # handle additional parameters...
        extra_params = (ssecount - len(sse_parameter_registers))
        if extra_params < 0:
            extra_params = 0
        extra_params += (normcount - len(norm_parameter_registers))

        f.extra_params = extra_params
        f.ssepcount = ssecount
        f.normpcount = normcount
        while extra_params > 0:
            self.heap += f"{extra_parameterlabel(f, extra_params)} resb 8\n"
            extra_params -= 1

        self.functions.append(f)
        # add as a variable for fn pointers
        self.globals.append(
            Variable(
                f.returntype.up(),
                f.getCallingLabel(),
                glob=True,
                isptr=True,
                mutable=False,
                signed=f.returntype.signed))

    def buildStruct(self):                  # isolate and build a structure
        # \see Structure
        parser = Structure(self)
        parser.construct()

    def compile(self, ftup):            # main function to perform Compiler tasks
        self.currentTokens = ftup

        # The first step in compilation is finding all string constants (except inline asm blocks) and float constants
        #   in order to transfer them to the .data section as global variables.

        c = 0
        for t in self.currentTokens:

            # convert string constants to global variables
            if t.tok == T_STRING:
                # preserve assembly blocks
                if(self.currentTokens[c - 2].tok != T_KEYWORD and self.currentTokens[c - 2].value != "__asm"):
                    data = createStringConstant(t.value)
                    name = data[1]
                    instruct = data[0]
                    tp = CHAR.copy()
                    tp.ptrdepth = 1
                    v = Variable(tp, name, glob=True,
                                 isptr=True, initializer=f"\"{t.value}\"")
                    self.globals.append(v)
                    t.tok = T_ID
                    t.value = name

                    self.constants += instruct
            # convert float constants to global variables
            elif t.tok == T_DOUBLE:

                data = createFloatConstant(t.value)
                name = data[1]
                instruct = data[0]
                v = Variable(DOUBLE, name, glob=True, initializer=t.value)
                self.globals.append(v)
                t.tok = T_ID
                t.value = name

                self.constants += instruct
            c += 1

        # reset
        self.current_token = self.currentTokens[0]
        self.ctidx = 0

        # actual compilation step
        while self.current_token.tok != T_EOF:

            self.compileLine()

    def buildTemplate(self):
        # keep track of first token for errors
        first = self.currentTokens[self.ctidx - 1]
        # ensure syntax
        if(self.current_token.tok != "<"):
            throw(ExpectedToken(self.current_token, "<"))

        # collect standin typenames from the template list
        tns = []
        while self.current_token.tok != ">":
            self.advance()
            # expecting a 'struct', 'class', or 'typename'
            if(self.current_token.tok != T_KEYWORD):
                throw(ExpectedToken(self.current_token, "type-specifier"))
            self.advance()
            if(self.current_token.tok != T_ID):
                throw(ExpectedIdentifier(self.current_token))
            # collect name
            tns.append(self.current_token.value)
            self.advance()
        self.advance()

        # keep track of the current number of types to restore back to after
        # the template has been created
        restore_types = len(self.types)
        for t in tns:
            self.types.append(DType(t, 0))

        # structs are a simpler process that can be streamlined:
        if(self.current_token.value == "struct"):
            self.buildStruct()
            newt = self.types.pop()
            # templated types have their own special list
            self.template_types.append([newt, tns])

        # functions:
        else:

            # tracker is used to ensure that a function is actually created
            # as this line is compiled
            tracker = len(self.functions)
            self.compileLine()
            if(tracker == len(self.functions)):
                throw(VariableTemplate(first))
            fnt = self.functions[-1]
            # update the created function as a template
            fnt.isTemplate = True
            fnt.template_types = tns

        # delete standin types, and return to original state
        self.types = self.types[:restore_types]

    def buildTemplateType(self, template, types, tok):

        # check for existing templates:
        for t in self.template_cache:
            # they share a name
            if t[0] == template:
                # they have the same number of types
                if len(t[1]) != len(types):
                    break

                # their types are equal
                for i in range(len(t[1])):
                    if t[1][i].name != types[i].name:
                        break
                # return existing structure
                return t[2]

        # get the template structure from the list:
        tstruct = self.getTemplateType(template)
        if(tstruct is None):
            throw(UnkownIdentifier(tok))

        # the template structure needs a deep copy of properties and members
        # so that it can be used to instantiate multiple different template
        # structure types
        struct = tstruct[0].copy()

        # deep copy
        for i in range(len(tstruct[0].members)):
            struct.members[i] = tstruct[0].members[i].copy()

        # the second item is an array of typenames used in place of actual types in the
        # structure's definition
        tns = tstruct[1]

        # assosiation is a dictionary that associates the typenames of the template with their
        # actual types given in this declaration
        assosiation = {}
        for i in range(len(tns)):
            assosiation[tns[i]] = types[i].copy()

        # all the members of the new templated type need to be given their new
        # types, and offsets
        struct.s = 0
        for member in struct.members:

            # if template has effect:
            if(member.t.name in tns):
                # update type, but maintain pointer depth
                pd = member.t.ptrdepth
                member.t = assosiation[member.t.name]
                member.t.ptrdepth = pd

            if(isinstance(member.initializer, Function)):
                print(member)

            # apply offset, and overall size
            member.offset = struct.s
            struct.s += member.t.s

        self.template_cache.append([template, types, struct])
        return struct

    def buildTemplateFunction(self, templatefn, tns, types):
        fn = Function(
            templatefn.name,
            templatefn.parameters,
            templatefn.returntype,
            self,
            templatefn.tokens,
            templatefn.inline,
            templatefn.extern)

        restore_types = len(self.types)-1

        



    def compileLine(self, thisp=False, thispt=None):

        if (self.current_token.tok == T_ID):
            self.createConstant()
        elif (self.current_token.tok == T_KEYWORD):

            # unsigned keyword is always followed by a normal variable
            # declaration.
            if(self.current_token.value == "unsigned"):

                s = self.current_token
                self.advance()
                self.createConstant()
                v = self.globals[-1]
                if(v.isflt()):
                    throw(InvalidSignSpecifier(s))

                v.signed = False
                v.t = v.t.copy()
                v.t.signed = False
                v.glob = True

            # typedef is always followed by two types and an endline:
            elif(self.current_token.value == "typedef"):

                # start token
                s = self.current_token

                self.advance()

                # type a
                ta = self.checkType()
                if(self.current_token.tok != T_ID):
                    throw(ExpectedIdentifier(self.current_token))

                # new type name
                ntn = self.current_token.value
                newtype = ta.copy()
                newtype.name = ntn

                # add new typename to precedence list, if applicable
                if ta.name in type_precedence:
                    type_precedence[ntn] = type_precedence[ta.name]

                # add new type to types and tdefs
                self.types.append(newtype.copy())
                self.tdefs.append((ta, newtype))
                if(self.isIntrinsic(ntn)):
                    INTRINSICS.append(newtype.copy())
                self.advance()
                if(self.current_token.tok != T_ENDL):
                    throw(ExpectedSemicolon(self.current_token))
                self.advance()

            # extern is followed by either a function declaration or a
            # variable declaration
            elif(self.current_token.value == "extern"):
                self.advance()
                # record location to jump back to
                backto = self.ctidx - 1
                self.checkType()
                self.advance()

                # function determinant:
                #   for function delcarations fndp.tok will always be a '(', and for variables
                #   it will always be something else.
                fndp = self.current_token

                # with the determinant, jump back to the begining to
                # perform the compilation
                self.ctidx = backto
                self.advance()

                if(fndp.tok == "(" or fndp.tok == T_NAMESPACE):  # if is function

                    self.createFunction(thisp=thisp, thispt=thispt)
                    fn = self.functions[-1]
                    config.__CEXTERNS__ += "extern " + \
                        functionlabel(fn)[:-1] + "\n"
                    glob = self.globals[-1]
                    glob.name = fn.getCallingLabel()

                else:  # if is variable

                    self.createConstant(True)

                    config.__CEXTERNS__ += "extern " + \
                        self.globals[-1].name + "\n"
            # same code as extern, with slight modification for cextern
            elif(self.current_token.value == "cextern"):
                self.advance()
                backto = self.ctidx - 1
                self.checkType()
                self.advance()

                fndp = self.current_token
                self.ctidx = backto
                self.advance()
                if(fndp.tok == "(" or fndp.tok == T_NAMESPACE):

                    self.createFunction(thisp=thisp, thispt=thispt)
                    fn = self.functions[-1]
                    fn.extern = True
                    config.__CEXTERNS__ += "extern " + \
                        functionlabel(fn)[:-1] + "\n"
                    glob = self.globals[-1]
                    glob.name = fn.getCallingLabel()

                else:

                    self.createConstant(True)
                    config.__CEXTERNS__ += "extern " + \
                        self.globals[-1].name + "\n"

            # __cdecl is always followed by a function declaration
            elif(self.current_token.value == "__cdecl"):
                self.advance()

                self.createFunction(thisp=thisp, thispt=thispt)
                fn = self.functions[-1]
                fn.extern = True
                # apply new properties to generated function:
                config.__CEXTERNS__ += "global " + \
                    functionlabel(fn)[:-1] + "\n"
                glob = self.globals[-1]
                glob.name = fn.getCallingLabel()

            # global is always followed by a function declaration
            elif(self.current_token.value == "global"):
                self.advance()

                self.createFunction(thisp=thisp, thispt=thispt)
                # apply global properties
                fn = self.functions[-1]
                config.__CEXTERNS__ += "global " + \
                    functionlabel(fn)[:-1] + "\n"
                glob = self.globals[-1]
                glob.name = fn.getCallingLabel()

            elif(self.current_token.value == "struct"):
                self.buildStruct()
            # inline is always followed by a function declaration
            elif(self.current_token.value == "inline"):
                self.advance()
                self.createFunction(thisp=thisp, thispt=thispt)
                # apply new properties
                if(not config.__Osize__):
                    self.functions[-1].inline = True
                    self.globals.pop()
                else:
                    self.functions[-1].wouldbe_inline = True

            elif (self.current_token.value == "function"):
                self.advance()
                self.createFunction(thisp=thisp, thispt=thispt)

            elif(self.current_token.value == "template"):
                self.advance()
                self.buildTemplate()

        else:
            throw(UnexpectedToken(self.current_token))

    # compile all functions and fill in raw assembly info

    def finalize(self):

        # the Compiler needs to find the best suitable entrypoint.
        # The first function called main will be used, reguardless of
        # returntype, or parameters.
        for f in self.functions:
            if f.name == "main":
                self.entry = f
                f.extern = True

        # at this point all functions exist as Function objects, but have not
        # been compiled into asm.
        for f in reversed(self.functions):

            #   TODO: Set up some size optimizations
            # if(config.__Osize__):
            #    if f.wouldbe_inline and f.references == 0:
            #        f.inline = True

            if not f.inline and not f.isTemplate:

                self.currentfunction = f
                f.compile()
                if(True in norm_scratch_registers_inuse or True in sse_scratch_registers_inuse):
                    print(
                        f"Warning:\n\tRegister leak of degree {norm_scratch_registers_inuse.count(True)+sse_scratch_registers_inuse.count(True)} found in function:\n\t {f}\n\t called from: {config.LAST_RALLOC}\n")
                rfreeAll()  # make sure there are no register leaks between functions

                # add comment
                if(config.DO_DEBUG):
                    f.asm = f"\n\n\n;{f.__repr__()}\n\n\n\n\n{f.asm}"

                self.text = f"{f.asm}{self.text}"

                # garbage collection
                f.GC()
