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
import Classes.ExpressionComponent as EC
from Classes.DType import DType, type_precedence
from Classes.Error import *
from Classes.Location import Location
from Classes.Token import *
from Classes.Token import Token
from Classes.Variable import Variable
from Function import Function
from globals import BOOL, CHAR, DOUBLE, INT, INTRINSICS, LONG, SHORT, VOID, OPERATORS
from Lexer import Lexer
from Structure import Structure


_asm_extern_indicator = "extern"


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
        self.globals: list = []               # all global variables
        self.constants: str = ""             # raw assembly for constant definitions
        # raw assembly for heap definitions (.bss)
        self.heap: str = ""
        # raw assembly for initialization of heap definitions
        self.initializers: str = ""
        # raw assembly to call the given entrypoint (usually main)
        self.entry: str = ""
        self.text: str = ""                  # raw .text assembly
        self.currentfname: str = ""          # current filename
        self.currentTokens: list = []         # current tokens: Token

        self.currentfunction: Function = None     # for fn compiletime

        self.current_token: Token = None       # current token
        self.ctidx: int = 0                  # index of current_token in self.currentTokens
        self.prevtok: Token = Token(T_AMBIGUOUS, T_AMBIGUOUS, None, None)

        self.functions: list = []             # all Function objects
        self.template_functions: list = []    # function templates
        self.templatefunction_cache: list = []  # already created function templates

        self.types: list = []                 # all datatypes: DType
        self.template_types: list = []        # templated types
        self.template_cache: list = []        # already filled templates for speed

        # Store enums:
        # format: {
        #
        #   "<Enum Item Name>" : (DType, value: int)
        #
        # }
        self.enums: dict = {}              # all enums

        # typedefs listed as (old, new):(DType,DType)
        self.tdefs: list = []
        # a hash table for faster access to typedefs
        self.tdef_hash = {}

        for i in INTRINSICS:            # fill types with primitives
            self.types.append(i.copy())

        self.possible_members: list = []

        self.heap_unnamed: int = 0           # int counter for unnamed heap variables

        # panicmode means continue compiling, but there has already been an
        # error
        self.panicmode: bool = False

    # ensure a semicolon was used, and move on
    def checkSemi(self) -> None:
        if(self.current_token.tok != T_ENDL):
            throw(ExpectedSemicolon(self.current_token))
        self.advance()

    def isType(self, q: str) -> bool:                # return: if q is type
        return self.getType(
            q) is not None or self.getTemplateType(q) is not None

    def isIntrinsic(self, q: str) -> DType:           # return: if q is primitive
        return next((t for t in INTRINSICS if self.Tequals(t.name, q)), None)

    def ismember(self, q: str) -> bool:
        return q in self.possible_members

    def getGlob(self, q: str) -> Variable:               # get global variable of name q

        # find a variable based on name
        out: Variable = next((g for g in self.globals if g.name == q), None)
        # return out if found
        if(out is not None):
            return out
        # check for functions of that name
        fn: Function = self.getFunction(q)
        # return None if none found
        if(fn is None):
            return None
        # if function is found, find it's corresponding global variable:
        return self.getGlob(fn.getCallingLabel()
                            ) if not fn.extern else self.getGlob(fn.name)

    def getTemplateType(self, q: str) -> DType:
        return next((t for t in self.template_types if t[0].name == q), None)

    def getFunction(self, q: str) -> Function:           # get first function of name q
        return next((f for f in self.functions if f.name == q), None)

    def advance(self):                  # move to next token
        # increment index
        self.ctidx += 1
        # set previous token
        self.prevtok = self.current_token
        try:
            self.current_token = self.currentTokens[self.ctidx]
        except BaseException:
            throw(UnexepectedEOFError(self.current_token))

    def skipBody(self):
        self.advance()
        opens = 1
        while(opens != 0):
            self.advance()
            if(self.current_token.tok == T_OPENSCOPE):
                opens += 1
            elif(self.current_token.tok == T_CLSSCOPE):
                opens -= 1

    # determine DType equality (including typedefs)
    def Tequals(self, ta: str, tb: str) -> bool:
        # if given names are equal, the types must be
        if(ta == tb):
            return True

        if ta in self.tdef_hash:
            return tb in self.tdef_hash[ta]
        elif tb in self.tdef_hash:
            return ta in self.tdef_hash[tb]

        return False

        # find a typedef pair in the list which equates the two types
        # return next((True for tdef in self.tdefs if (
        #    (tdef[0].name == ta and tdef[1].name == tb) or (tdef[0].name == tb and tdef[1].name == ta))), False)

    def getType(self, qu: str) -> DType:               # get type of name q
        q: str = f"{qu}"  # copy of querry
        pd = q.count(".")   # pointer depth
        q = q.replace(".", "")            # remove points from name for search

        # search types for a datatype that shares a name with the querry
        out: DType = next((t for t in self.types if t.name == q), None)
        # if none exists, return
        if(out is None):
            return None
        # return safe copy of the type with the restored pointer depth
        out = out.copy()
        out.ptrdepth = pd
        return out

    def parseTemplate(self) -> list:
        types = []
        # loop through layer of decorator (' <int, double ... > '  )
        while self.current_token.tok != ">":
            self.advance()
            t: DType = self.checkType()
            types.append(t)
        return types

    # check the next tokens for a type, and return it
    def checkType(self, err=True):

        signed = True
        # check for sign specification
        if(self.current_token.tok == T_KEYWORD):
            if(self.current_token.value == "unsigned"):
                signed = False
                self.advance()
            elif(self.current_token.value == "signed"):
                self.advance()
        # check for correct token Type
        if(self.current_token.tok != T_ID):
            # if instructed to error out, throw error.
            # else, return None
            if err:
                throw(ExpectedIdentifier(self.current_token))
            else:
                return None
        # check if the current token represents a type
        if(not self.isType(self.current_token.value)):
            # if instructed to error out, throw error.
            # else, return None
            if err:
                throw(ExpectedType(self.current_token))
            else:
                return None
        # check for decorator (template types)
        if (self.currentTokens[self.ctidx + 1].tok == "<"):
            # construct template type:
            template: str = self.current_token.value
            ttok: Token = self.current_token
            self.advance()
            types: list = self.parseTemplate()
            t: DType = self.buildTemplateType(template, types, ttok).copy()
        else:
            # get existing type
            t: DType = self.getType(self.current_token.value).copy()

        self.advance()
        ptrdepth = 0    # track pointer depth specified by '*' token
        while self.current_token.tok == "*":
            # loop through the '*' tokens
            ptrdepth += 1
            self.advance()
        # return final datatype
        t.ptrdepth = ptrdepth
        t.signed = signed
        return t

    def checkId(self) -> str:
        if self.current_token.tok != T_ID:
            throw(ExpectedIdentifier(self.current_token))
        out = self.current_token.value
        self.advance()
        return out

    # create a constant string value in self.constants
    def createStringConstant(self, content) -> None:

        # d = (.data instructions, varname)
        d: tuple = createStringConstant(content)
        name: str = d[1]
        cnst: str = d[0]
        # add constant info
        self.constants += cnst
        # add new Variable
        v = Variable(CHAR.copy(), name, glob=True)
        self.globals.append(v)

    # create an arbitrary constant in self.constants
    def createConstant(self, extern=False) -> None:
        # track start
        startidx = self.ctidx
        # check for a datatype
        intr = self.checkType()
        # check for an identifier
        name = self.checkId()



        # check for simple C style function declarations
        if(self.current_token.tok == T_OPENP or self.current_token.tok == T_NAMESPACE):
            # update indexes, and pass control onto the buildFunction function
            self.ctidx = startidx - 1
            self.advance()
            self.buildFunction()
            return

        # check for multiple declarations
        if self.getGlob(name) is not None:
            fatalThrow(VariableRedeclaration(self.currentTokens[self.ctidx-1], name))

        dtok = self.currentTokens[self.ctidx-1]


        # variables declared with extern are not placed in the data section, and are simply
        # recorded for use by the compiler.
        if(extern):
            # cannot assign values declared with extern
            if(self.current_token.tok == T_EQUALS):
                throw(AssigningExternedValue(self.current_token))
            # add new variable
            self.globals.append(Variable(intr.copy(), name, glob=True))
            self.globals[-1].dtok = dtok
            # close
            self.checkSemi()
            return

        # test for early endline
        if (self.current_token.tok != T_EQUALS):

            # if there is no assignment, these variables can be moved to the bss section because they
            # are uninitialized.
            if(self.current_token.tok == T_ENDL):
                # create uninilitialized var
                self.globals.append(
                    Variable(
                        intr.copy(),
                        name,
                        glob=True,
                        initializer=0))
                self.globals[-1].dtok = dtok
                # since the var has no initializer, it is stored in the .bss
                # section
                self.heap += f"{name}: resb {intr.csize()}\n"
                # close
                self.advance()
                return
            else:
                # if there is no initializer, there must be a semicolon
                throw(ExpectedValue(self.current_token))

        self.advance()

        # Tokens need to be collected to be passed through the constexpr evaluator.
        # \see Classes.Constexpr

        # tokens representing an expression:
        exprtokens = []
        # determine if the expression is a set literal: (e.g {1,2,3})
        isSet = False
        if(self.current_token.tok == T_OPENSCOPE):
            isSet = True

        # loop through expression tokens until a semicolon
        while(self.current_token.tok != T_ENDL):

            exprtokens.append(self.current_token)
            self.advance()

        # use the constexpr evaluator to find the value for the global
        value: EC.ExpressionComponent = determineConstexpr(intr.isflt(), exprtokens, Function(
            "CMAININIT", [], LONG.copy(), self, exprtokens), True) if not isSet else buildConstantSet(intr.isflt(), exprtokens, Function(
                "CMAININIT", [], LONG.copy(), self, exprtokens))

        isptr = False
        # if the final value is a variable, the initializer to that variable is
        # taken
        if(isinstance(value.accessor, Variable)):
            value.accessor = value.accessor.name if intr.ptrdepth == value.accessor.t.ptrdepth + \
                1 else value.accessor.initializer
            isptr = True

        # add new Variable
        self.globals.append(Variable(intr.copy(), name,
                                     glob=True, initializer=value.accessor, isptr=isptr))
        self.globals[-1].dtok = dtok

        # add .data instructions to self.constants
        self.constants += createIntrinsicConstant(self.globals[-1])
        # close
        self.checkSemi()

    # isolate a function and build a Function object
    def buildFunction(self, thisp=False, thispt=None,
                      constructor=False, destructor=False) -> None:
        # track if the function is explicitly inline

        inline = False
        autodecl = False
        operator = False

        # constructor and destructor as special flags set by the Structure class
        # for compiling constructors and destructors
        if not constructor and not destructor:
            # under normal conditions:

            # check for extra info specifier
            if(self.current_token.tok == T_KEYWORD):
                # inline specifier
                if(self.current_token.value == "inline"):
                    inline = True

            # Check for auto specifier
            if self.current_token.tok == T_KEYWORD and self.current_token.value == "auto":
                # handle a function defined with auto
                autodecl = True
                rettype = DType("auto", 8)
                self.advance()

            # normal returntype:
            else:
                # check for a returntype
                rettype = self.checkType()

        # if this is a destructor or constructor:
        else:
            assert thisp
            rettype = VOID.copy()

        # parent structure
        struct = None

        # for external definitions of member functions:
        # (The '::' token will be in place of an '(')
        if(self.currentTokens[self.ctidx + 1].tok == T_NAMESPACE):
            # if(self.current_token.tok != T_ID):
            #    throw(ExpectedIdentifier(self.current_token))
            sname = self.checkId()

            # get parent
            struct = self.getType(sname)

            if(struct is None):
                throw(UnkownType(self.prevtok))

            # setup function for a 'this' value
            thisp = True
            thispt = struct
            # self.advance()
            self.advance()

        # operator specifier
        if(self.current_token.value == "operator"):
            #inline = True
            operator = True
            self.advance()
        # record token that declared the function
        dtok = self.current_token
        if not operator:
            # get fnname
            name = self.checkId()

        else:

            name = self.current_token.value
            if name not in OPERATORS:
                throw(UnkownOperator(name))
            self.advance()

        # ensure syntax
        if(self.current_token.tok != T_OPENP):
            throw(ExpectedParethesis(self.current_token))

        self.advance()

        # construct parameters:
        parameters = []
        # thisp means that this function is a member, and should have 'this' as
        # it's first parameter
        if(thisp):
            parameters.append(Variable(thispt, "this", isptr=True))
        # denoted by '...'
        variardic = False

        # count of each type of parameter
        ssecount = 0
        normcount = 0

        # load parameters until end of fn header at ')'
        while self.current_token.tok != T_CLSP:
            # check for variardic
            if(self.current_token.tok == T_ELIPSES):
                variardic = True
                self.advance()
                break
            # get parameter type
            t = self.checkType()
            # increment param types
            ssecount += t.isflt()
            normcount += not t.isflt()
            # get parameter name
            varname = self.checkId()

            # add new variable
            parameters.append(Variable(t, varname, isptr=t.ptrdepth > 0))
            parameters[-1].dtok = self.currentTokens[self.ctidx - 1]

            # loop handle:
            if (self.current_token.tok == T_CLSP):

                break
            # ensure syntax
            if(self.current_token.tok != T_COMMA):
                throw(ExpectedComma(self.current_token))

            self.advance()

        self.advance()

        # check for early end (just declaration, no assignment)
        if(self.current_token.tok == T_ENDL):
            self.advance()
            # create empty function for assignment later
            f = Function(
                name,
                parameters,
                rettype,
                self,
                [],
                return_auto=autodecl,
                declare_token=dtok)
            self.globals.append(
                Variable(
                    f.returntype.up(),
                    f.getCallingLabel(),
                    glob=True,
                    isptr=True,
                    mutable=False,
                    signed=f.returntype.signed))

            self.functions.append(f)

            return
        # if not declaration, it must be an assignment
        if(self.current_token.tok != T_OPENSCOPE):
            throw(ExpectedToken(self.current_token, T_OPENSCOPE))

        self.advance()
        # isolate the body of the function
        # (keep track of scope open / scope close)
        opens = 1
        start = self.ctidx
        # loop through one layer of { ... } scope to
        # catch range of tokens used as function body
        while opens > 0:
            if(self.current_token.tok == T_OPENSCOPE):
                opens += 1
            if(self.current_token.tok == T_CLSSCOPE):
                opens -= 1
            self.advance()

        # construct final object
        f = Function(name, parameters, rettype, self,
                     self.currentTokens[start:self.ctidx], return_auto=autodecl, inline=inline, declare_token=dtok)

        f.unassigned = False

        # pre-compile f to determine it's returntype
        if f.return_auto:
            # track warning settings
            ogwarn = config.__nowarn__
            config.__nowarn__ = True
            # compile f before other functions
            f.compile()
            # restore warning settings
            config.__nowarn__ = ogwarn
            # check if there was a return,
            if f.returntype.name == "auto":
                # if not, the default type is void
                f.returntype = VOID.copy()
            f.isCompiled = False

            rettype = f.returntype

        # setup member fn
        if thisp:
            f.memberfn = True
            f.parentstruct = thispt
        # variardic
        f.variardic = variardic

        # handle additional parameters...
        # the extra parameters needed are any parameters not able to be stored in the
        # SSE registers and the regular registers

        # extra params from sse
        extra_params = (ssecount - len(sse_parameter_registers))
        if extra_params < 0:
            extra_params = 0
        # extra params from regular
        extra_params += (normcount - len(norm_parameter_registers))

        # load info to f
        f.extra_params = extra_params
        f.ssepcount = ssecount
        f.normpcount = normcount
        

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

    # isolate and build a structure
    def buildStruct(self, thisp=False, thispt=None) -> None:
        # \see Structure
        # structure wrapper
        parser = Structure(self)

        try:
            parser.construct()
        except Error as e:
            print(e.__repr__())
            self.skipBody()
            self.advance()
            self.checkSemi()
            self.types.pop()

    def buildEnum(self, thisp=False, thispt=None) -> None:
        pass

    def compile(self, ftup: list) -> None:            # main function to perform Compiler tasks
        self.currentTokens = ftup

        # The first step in compilation is finding all string constants (except inline asm blocks) and float constants
        #   in order to transfer them to the .data section as global variables.

        c = 0
        for t in self.currentTokens:

            # convert string constants to global variables
            if t.tok == T_STRING:
                # preserve assembly blocks
                if(self.currentTokens[c - 2].tok != T_KEYWORD and self.currentTokens[c - 2].value != "__asm"):
                    # construct a string constant
                    data: tuple = createStringConstant(t.value)
                    name: str = data[1]
                    instruct: str = data[0]
                    # get datatype for string
                    tp = CHAR.copy()
                    tp.ptrdepth = 1
                    # build Variable
                    v = Variable(tp, name, glob=True,
                                 isptr=True, initializer=f"`{t.value}`")
                    self.globals.append(v)
                    # update token for later use
                    t.tok = T_ID
                    t.value = name
                    # add allocator to constants
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
            # check for typename
            tname = self.checkId()
            tns.append(tname)
        self.advance()

        # keep track of the current number of types to restore back to after
        # the template has been created
        restore_types = len(self.types)
        for t in tns:
            self.types.append(DType(t, 0))

        # structs are a simpler process that can be streamlined:
        if(self.current_token.value == "struct"):
            restorefn = len(self.functions)
            self.buildStruct()
            self.functions = self.functions[:restorefn]
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
            fnt = self.functions.pop()
            # update the created function as a template
            fnt.isTemplate = True
            fnt.template_types = tns
            self.template_functions.append(fnt)

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

                fulleq = ''.join([ty.name for ty in t[1]]) == ''.join(
                    [ty.name for ty in types])

                if fulleq:
                    return t[2].copy()

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
        struct.name += ''.join([t.name for t in types])

        if struct.constructor is not None:
            struct.constructor = self.buildTemplateFunction(
                struct.constructor, tns, types)
        if struct.destructor is not None:
            struct.destructor = self.buildTemplateFunction(
                struct.destructor, tns, types)

        for member in struct.members:

            # if template has effect:
            if(member.t.name in tns):
                # update type, but maintain pointer depth
                pd = member.t.ptrdepth
                member.t = assosiation[member.t.name].copy()
                member.t.ptrdepth = pd

            if(isinstance(member.initializer, Function)):

                member.initializer.parameters[0].t = struct.up()

                member.initializer = self.buildTemplateFunction(
                    member.initializer, tns, types)

            # apply offset, and overall size
            member.offset = struct.s
            struct.s += member.t.csize()

        for op in struct.operators:
            for i in range(len(struct.operators[op])):
                struct.operators[op][i].parameters[0].t = struct.up()
                struct.operators[op][i] = self.buildTemplateFunction(
                    struct.operators[op][i], tns, types
                )

        self.template_cache.append([template, types, struct])
        return struct.copy()

    # build / get a template function based on template parameters
    def buildTemplateFunction(self, templatefn, tns, types):
        # restore the types if necessary
        restore_types = len(self.types)
        restore_tdefs = len(self.tdefs)
        restore_tdefhash = self.tdef_hash.copy()

        # create semi-copy function
        fn = Function(
            templatefn.name,
            templatefn.parameters,
            templatefn.returntype,
            self,
            templatefn.tokens,
            templatefn.inline,
            templatefn.extern,
            0,
            templatefn.memberfn,
            templatefn.parentstruct)

        # update returntype standin if necessary
        if fn.returntype.name in tns:
            fn.returntype = types[tns.index(fn.returntype.name)]

        # replace parameter types with their new values if specified in the
        # template
        for i in range(len(fn.parameters)):
            p = fn.parameters[i]
            if p.t.name in tns:
                fn.parameters[i] = fn.parameters[i].copy()
                pd = fn.parameters[i].t.ptrdepth
                fn.parameters[i].t = types[tns.index(p.t.name)]
                fn.parameters[i].t.ptrdepth = pd

        # check if the function has already been built before
        fnexist = templatefn.getFunction(
            fn.name, [p.t for p in fn.parameters], fn.returntype, loose=False)

        # if it has been built, just use the existing build
        if(fnexist is not None):
            fn = fnexist
        else:
            # if it's not been built, the new temporary types need to be added
            # to compile the template function.
            for i in range(len(tns)):
                temptype = types[i].copy()
                temptype.name = tns[i]
                self.types.append(temptype)
                self.tdefs.append((types[i], temptype))
                if types[i].name in self.tdef_hash:
                    self.tdef_hash[types[i].name].append(temptype.name)
                else:
                    self.tdef_hash[types[i].name] = [temptype.name]

        # if it is not already built, it needs to be compiled
        if not fn.isCompiled:

            # compile
            fn.compile()
            # save
            self.functions.append(fn)
            # update
            fn.isCompiled = True
            fn.isTemplate = True
            if not fn.inline:
                self.text = f"{fn.asm}{self.text}"

        # restore types if necessary
        self.types = self.types[:restore_types]
        self.tdefs = self.tdefs[:restore_tdefs]
        self.tdef_hash = restore_tdefhash

        return fn

    # unsigned keyword is always followed by a normal variable
    # declaration.
    def buildUnsigned(self, thisp=False, thispt=None) -> None:
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
    def buildTypedef(self, thisp=False, thispt=None) -> None:

        # start token
        s = self.current_token

        self.advance()

        # type a
        ta = self.checkType()
        if(self.current_token.tok != T_ID):
            throw(ExpectedIdentifier(self.current_token))

        # check for layered typedefs
        if ta.name in self.tdef_hash:
            ogt = self.tdef_hash[ta.name][0]
            if ogt in ['char', 'short',
                       'int', "long", "float",
                       "double", "void"]:
                ta.name = ogt

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

        # setup hash table for fast access
        if ta.name in self.tdef_hash:
            self.tdef_hash[ta.name].append(newtype.name)
        else:
            self.tdef_hash[ta.name] = [newtype.name]

        if newtype.name in self.tdef_hash:
            self.tdef_hash[newtype.name].append(ta.name)
        else:
            self.tdef_hash[newtype.name] = [ta.name]

        if(self.isIntrinsic(ntn)):
            INTRINSICS.append(newtype.copy())
        self.advance()
        if(self.current_token.tok != T_ENDL):
            throw(ExpectedSemicolon(self.current_token))
        self.advance()

    def determineFunctionOrVar(self) -> None:
        self.advance()
        # record location to jump back to
        backto = self.ctidx - 1
        self.checkType()
        # account for operator overloads
        if self.current_token.tok == T_KEYWORD and self.current_token.value == 'operator':
            self.advance()

        self.advance()

        # function determinant:
        #   for function delcarations fndp.tok will always be a '(', and for variables
        #   it will always be something else.
        fndp = self.current_token

        # with the determinant, jump back to the begining to
        # perform the compilation
        self.ctidx = backto
        self.advance()

        return fndp

    # extern is followed by either a function declaration or a
    # variable declaration
    def buildExtern(self, thisp=False, thispt=None) -> None:
        # function determinant
        fndp = self.determineFunctionOrVar()

        if(fndp.tok == "(" or fndp.tok == T_NAMESPACE):  # if is function

            self.buildFunction(thisp=thisp, thispt=thispt)
            fn = self.functions[-1]
            config.__CEXTERNS__ += f"{_asm_extern_indicator} " + \
                functionlabel(fn)[:-1] + "\n"
            glob = self.globals[-1]
            glob.name = fn.getCallingLabel()

        else:  # if is variable

            self.createConstant(True)

            config.__CEXTERNS__ += f"{_asm_extern_indicator} " + \
                self.globals[-1].name + "\n"

    # same code as extern, with slight modification for cextern
    def buildCextern(self, thisp=False, thispt=None) -> None:
        fndp = self.determineFunctionOrVar()

        if(fndp.tok == "(" or fndp.tok == T_NAMESPACE):

            self.buildFunction(thisp=thisp, thispt=thispt)
            fn = self.functions[-1]
            fn.extern = True
            config.__CEXTERNS__ += f"{_asm_extern_indicator} " + \
                functionlabel(fn)[:-1] + "\n"
            glob = self.globals[-1]
            glob.name = fn.getCallingLabel()

        else:

            self.createConstant(True)
            config.__CEXTERNS__ += f"{_asm_extern_indicator} " + \
                self.globals[-1].name + "\n"
    # __cdecl is always followed by a function declaration

    def buildCdecl(self, thisp=False, thispt=None) -> None:
        self.advance()

        self.buildFunction(thisp=thisp, thispt=thispt)
        fn = self.functions[-1]
        fn.extern = True
        # apply new properties to generated function:
        config.__CEXTERNS__ += "global " + \
            functionlabel(fn)[:-1] + "\n"
        glob = self.globals[-1]
        glob.name = fn.getCallingLabel()
    # global is always followed by a function declaration

    def buildGlobalfn(self, thisp=False, thispt=None) -> None:
        self.advance()

        self.buildFunction(thisp=thisp, thispt=thispt)
        # apply global properties
        fn = self.functions[-1]
        config.__CEXTERNS__ += "global " + \
            functionlabel(fn)[:-1] + "\n"
        glob = self.globals[-1]
        glob.name = fn.getCallingLabel()

    # inline is always followed by a function declaration
    def buildInlinefn(self, thisp=False, thispt=None) -> None:
        self.advance()
        self.buildFunction(thisp=thisp, thispt=thispt)
        # apply new properties
        if(not config.__Osize__):
            self.functions[-1].inline = True
            self.globals.pop()
        else:
            self.functions[-1].wouldbe_inline = True

    def buildNormalfn(self, thisp=False, thispt=None) -> None:
        self.advance()
        self.buildFunction(thisp=thisp, thispt=thispt)

    def buildWinextern(self, thisp=False, thispt=None) -> None:
        self.buildCextern(thisp, thispt)
        self.functions[-1].winextern = True

    def buildAutofn(self, thisp=False, thispt=None) -> None:
        self.buildFunction(thisp=thisp, thispt=thispt)

    def beginTemplate(self, thisp=False, thispt=None) -> None:
        self.advance()
        self.buildTemplate()

    # compileLine is responsible for determining the categorie of a general unscoped statement.
    # e.g: unsigned int i = 0;
    # e.g: int main(int argc) {}
    # And then either compiling the line if its just a global variable, or sectioning it off to
    # be handled by the Structure element or the Function element for more
    # complex statements.
    def compileLine(self, thisp=False, thispt=None):
        # lines begining with an ID will be a global variable
        # (Or function, but that is handled in createConstant())
        if (self.current_token.tok == T_ID):
            self.createConstant()
        elif (self.current_token.tok == T_KEYWORD):

            # check if a response exists for given keyword
            if self.current_token.value in keyword_responses:
                # execute respnse
                keyword_responses[self.current_token.value](
                    self, thisp, thispt)
            else:
                # if not, throw error
                throw(UnexpectedToken(self.current_token))

        else:
            throw(UnexpectedToken(self.current_token))

    def verify_entrypoint(self, f):
        # check returntype
        if f.returntype.isflt():
            print(InvalidMainReturn(f.declare_token).__repr__())
            self.panicmode = True

        # check valid parameters
        if len(f.parameters) > 0:
            # check parameter 1
            if not (f.parameters[0].t.__eq__(INT)
                    or f.parameters[0].t.__eq__(LONG)):
                warn(InvalidMainParameters(f.parameters[0].dtok))
            # check for parameter 2
            if len(f.parameters) > 1:
                # check the parameter 2 type
                if not (f.parameters[1].t.__eq__(CHAR.up().up())):
                    warn(InvalidMainParameters(f.parameters[1].dtok))

    # compile all functions and fill in raw assembly info

    def finalize(self):

        # the Compiler needs to find the best suitable entrypoint.
        # The first function called main will be used, reguardless of
        # returntype, or parameters.
        for f in self.functions:
            if f.name == "main":

                self.verify_entrypoint(f)

                self.entry = f

                f.extern = True
                f.winextern = True

                self.globals.append(
                    Variable(
                        INT.up(),
                        "main",
                        glob=True,
                        initializer=f,
                        isptr=True)
                )

        # at this point all functions exist as Function objects, but have not
        # been compiled into asm.
        for f in reversed(self.functions):

            #   TODO: Set up some size optimizations
            # if(config.__Osize__):
            #    if f.wouldbe_inline and f.references == 0:
            #        f.inline = True

            if not f.inline and not f.isTemplate:

                self.currentfunction = f

                # catch errors to continue compilation
                try:

                    f.compile()

                except Error as e:
                    # assuming the error is non fatal:
                    print(e.__repr__())
                    rfreeAll()
                    continue

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


# Keyword responses outlines the functions that the compiler will use for a given
# keyword.

keyword_responses = {
    "unsigned": Compiler.buildUnsigned,
    "typedef": Compiler.buildTypedef,
    "extern": Compiler.buildExtern,
    "cextern": Compiler.buildCextern,
    "__cdecl": Compiler.buildCdecl,
    "global": Compiler.buildGlobalfn,
    "struct": Compiler.buildStruct,
    "inline": Compiler.buildInlinefn,
    "function": Compiler.buildNormalfn,
    "winextern": Compiler.buildWinextern,
    "template": Compiler.beginTemplate,
    "auto": Compiler.buildAutofn,
    "enum": Compiler.buildEnum,
    "class": Compiler.buildStruct
}
