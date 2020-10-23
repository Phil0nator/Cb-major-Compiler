from Classes.Variable import Variable
from Function import Function
from Classes.DType import DType
from Classes.DType import type_precedence
import Classes.DType as Type
from Classes.Token import Token
from Classes.Token import *
from Classes.Location import Location
from Classes.Constexpr import determineConstexpr
from Lexer import Lexer
from Classes.Error import *
import config

from globals import INTRINSICS, INT, CHAR, BOOL, VOID, SMALL, SHORT, DOUBLE

from Assembly.Registers import sse_parameter_registers
from Assembly.Registers import norm_scratch_registers
from Assembly.Registers import sse_scratch_registers
from Assembly.Registers import norm_parameter_registers
from Assembly.Registers import ralloc, rfree, rfreeAll
from Assembly.Registers import sse_scratch_registers_inuse, norm_scratch_registers_inuse


from Assembly.CodeBlocks import createIntrinsicConstant, functionlabel
from Assembly.CodeBlocks import createFloatConstant
from Assembly.CodeBlocks import createStringConstant

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
        return self.getType(q) is not None

    def isIntrinsic(self, q):           # return: if q is primitive
        return next((t for t in INTRINSICS if self.Tequals(t.name, q)), None)

    def ismember(self, q):
        return q in self.possible_members

    def getGlob(self, q):               # get global variable of name q
        return next((g for g in self.globals if g.name == q), None)

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
    def createConstant(self):
        # dtype
        intr = self.checkType()
        if (self.current_token.tok != T_ID):
            throw(ExpectedIdentifier(self.current_token))
        name = self.current_token.value

        self.advance()

        if (self.current_token.tok != T_EQUALS):
            throw(ExpectedValue(self.current_token))

        self.advance()

        exprtokens = []

        while(self.current_token.tok != T_ENDL):
            exprtokens.append(self.current_token)
            self.advance()

        # use the constexpr evaluator to find the value for the global
        value = determineConstexpr(intr.isflt(), exprtokens, Function(
            "CMAININIT", [], VOID.copy(), self, exprtokens))

        self.globals.append(Variable(value.type.copy(), name,
                                     glob=True, initializer=value.accessor))

        # add .data instructions to self.constants
        self.constants += createIntrinsicConstant(self.globals[-1])

        if(self.current_token.tok != T_ENDL):
            throw(ExpectedSemicolon(self.current_token))
        self.advance()

    # isolate a function and build a Function object
    def createFunction(self):
        inline = False
        if(self.current_token.tok == T_KEYWORD):
            if(self.current_token.value == "inline"):
                inline = True

        rettype = self.checkType()

        if(self.current_token.tok != T_ID):
            throw(ExpectedIdentifier(self.current_token))

        name = self.current_token.value

        self.advance()

        if(self.current_token.tok != T_OPENP):
            throw(ExpectedParethesis(self.current_token))

        self.advance()

        parameters = []

        # load parameters until end of fn header at ')'
        while self.current_token.tok != T_CLSP:

            t = self.checkType()

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
                    f.returntype.copy(),
                    f.name,
                    glob=True))

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
        self.functions.append(f)
        # add as a variable for fn pointers
        self.globals.append(Variable(f.returntype.copy(), f.name, glob=True))

    def buildStruct(self):                  # isolate and build a structure
        self.advance()
        if(self.current_token.tok != T_ID):
            throw(ExpectedIdentifier(self.current_token))

        # get name
        id = self.current_token.value
        self.advance()
        if(self.current_token.tok != T_OPENSCOPE):
            throw(ExpectedToken(self.current_token, "{"))

        # build prototype DType as placeholder
        prototypeType = DType(id, 8, [], 0, True)
        self.types.append(prototypeType)

        size = 0
        members = []

        postadders = []

        destructor = None
        constructor = None

        # find properties:
        #   -members
        #   -member functions
        #   -constructor
        #   -destructor
        while(self.current_token.tok != T_CLSSCOPE):
            self.advance()

            # member variable
            if(self.current_token.tok == T_ID):

                t = self.checkType()
                if(self.current_token.tok != T_ID):
                    throw(ExpectedIdentifier(self.current_token))
                name = self.current_token.value
                var = Variable(t, name, glob=False, offset=size,
                               isptr=t.ptrdepth > 0, signed=t.signed)
                members.append(var)
                self.possible_members.append(name)
                size += t.csize()
                self.advance()
                if(self.current_token.tok != T_ENDL):
                    throw(ExpectedSemicolon(self.current_token))

            # either member function, constructor or destructor
            elif(self.current_token.tok == T_KEYWORD):

                # member function
                if(self.current_token.value == "function"):
                    self.advance()
                    self.createFunction()
                    f = self.functions.pop()
                    gv = self.globals.pop()
                    members.append(f)
                    gv.name = f"{id}_{gv.name}"
                    #f.name = f"{id}_{gv.name}"
                    # self.globals.append(gv)
                    # self.functions.append(f)

                # destructor
                elif(self.current_token.value == "destructor"):
                    self.advance()
                    if(self.current_token.tok != "{"):
                        throw(ExpectedToken(self.current_token, "{"))
                    self.advance()
                    name = f"x{id}"
                    parameters = [Variable(prototypeType, "this", isptr=True)]
                    fntks = []
                    while(self.current_token.tok != "}"):
                        fntks.append(self.current_token)
                        self.advance()
                    fntks.append(self.current_token)
                    fn = Function(name, parameters, VOID.copy(), self, fntks)
                    destructor = fn
                    self.advance()
                    self.functions.append(fn)
                    self.globals.append(Variable(VOID.copy(), name, glob=True))
                    if(self.current_token.tok != T_ENDL):
                        throw(ExpectedToken(self.current_token, T_ENDL))

                # constructor
                elif(self.current_token.value == "constructor"):
                    self.advance()
                    if(self.current_token.tok != "("):
                        throw(ExpectedToken(self.current_token, "("))
                    name = f"i{id}"
                    parameters = [Variable(prototypeType, "this", isptr=True)]
                    fntks = []
                    while self.current_token.tok != ")":
                        self.advance()
                        t = self.checkType()
                        if(t is None):
                            throw(UnkownType(self.current_token))
                        if(self.current_token.tok != T_ID):
                            throw(ExpectedIdentifier(self.current_token))
                        pname = self.current_token.value
                        parameters.append(Variable(t, pname))
                        self.advance()
                    self.advance()
                    if(self.current_token.tok != "{"):
                        throw(ExpectedToken(self.current_token, "{"))
                    self.advance()
                    while(self.current_token.tok != "}"):
                        fntks.append(self.current_token)
                        self.advance()
                    fntks.append(self.current_token)

                    fn = Function(name, parameters, VOID.copy(), self, fntks)
                    constructor = fn
                    self.functions.append(fn)
                    self.globals.append(Variable(VOID.copy(), name, glob=True))
                    self.advance()
                    if(self.current_token.tok != T_ENDL):
                        throw(ExpectedToken(self.current_token, T_ENDL))

        # remove prototype to apply actual properties
        self.types.remove(prototypeType)

        # fill in new info
        actualType = DType(id, size, members, 0, True,
                           destructor=destructor, constructor=constructor)
        actualTypeptr = DType(id, size)
        actualTypeptr.load(actualType)
        actualTypeptr.ptrdepth += 1
        if(destructor is not None):
            actualType.destructor.parameters[0].t.load(actualTypeptr)
        if(constructor is not None):
            actualType.constructor.parameters[0].t.load(actualTypeptr)

        # finalize
        self.types.append(actualType)

        self.advance()
        if(self.current_token.tok != T_ENDL):
            throw(ExpectedToken(self.current_token, T_ENDL))
        self.advance()

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
                                 isptr=True, initializer=t.value)
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

            if (self.current_token.tok == T_ID):
                self.createConstant()
            elif (self.current_token.tok == T_KEYWORD):

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
                elif(self.current_token.value == "typedef"):
                    s = self.current_token
                    self.advance()
                    ta = self.checkType()
                    if(self.current_token.tok != T_ID):
                        throw(ExpectedIdentifier(self.current_token))
                    ntn = self.current_token.value
                    newtype = ta.copy()
                    newtype.name = ntn
                    type_precedence[ntn] = type_precedence[ta.name]
                    self.types.append(newtype.copy())
                    self.tdefs.append((ta, newtype))
                    if(self.isIntrinsic(ntn)):
                        INTRINSICS.append(newtype.copy())
                    self.advance()
                    if(self.current_token.tok != T_ENDL):
                        throw(ExpectedSemicolon(self.current_token))
                    self.advance()

                elif(self.current_token.value == "extern"):
                    self.advance()
                    self.createFunction()
                    fn = self.functions[-1]
                    config.__CEXTERNS__ += "extern " + \
                        functionlabel(fn)[:-2] + "\n"

                elif(self.current_token.value == "cextern"):
                    self.advance()
                    self.createFunction()
                    fn = self.functions[-1]
                    fn.extern = True
                    config.__CEXTERNS__ += "extern " + \
                        functionlabel(fn)[:-2] + "\n"

                elif(self.current_token.value == "__cdecl"):
                    self.advance()
                    self.createFunction()
                    fn = self.functions[-1]
                    config.__CEXTERNS__ += "global " + \
                        functionlabel(fn)[:-2] + "\n"
                    fn.extern = True

                elif(self.current_token.value == "global"):
                    self.advance()
                    self.createFunction()
                    fn = self.functions[-1]
                    config.__CEXTERNS__ += "global " + \
                        functionlabel(fn)[:-2] + "\n"

                elif(self.current_token.value == "struct"):
                    self.buildStruct()

                elif (self.current_token.value == "function"):
                    self.advance()
                    self.createFunction()

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
        for f in self.functions:
            self.currentfunction = f
            f.compile()
            if(True in norm_scratch_registers_inuse or True in sse_scratch_registers_inuse):
                print(
                    f"Warning:\n\tRegister leak of degree {norm_scratch_registers_inuse.count(True)+sse_scratch_registers_inuse.count(True)} found in function:\n\t {f}\n\t called from: {config.LAST_RALLOC}\n")
            rfreeAll()  # make sure there are no register leaks between functions

            # add comment
            if(config.DO_DEBUG):
                f.asm = f"\n\n\n;{f.__repr__()}\n\n\n\n\n{f.asm}"

            self.text = f"{self.text}{f.asm}"
