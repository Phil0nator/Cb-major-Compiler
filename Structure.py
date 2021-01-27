from Classes.Variable import Variable
from Classes.DType import DType
from Classes.Constexpr import determineConstexpr
from Classes.Error import *
from Classes.Token import *
from Function import Function
from Assembly.TypeSizes import valueTypeClass
from globals import VOID, OPERATORS

####################################
#
#   The Structure class is used to parse
#       structure definition into DType
#       objects with the correct configuration.
#       (Including assigning initialization values
#       to member variables.)
#
#####################################


class Structure:
    def __init__(self, compiler, templated, tns):
        self.compiler = compiler
        self.templated = templated
        self.tns = tns
        self.current_token = self.compiler.current_token
        self.size = 0
        self.prototypeType = DType("", 0, [], 0, True, constructors=[])
        self.emptyfn = Function("empty", [], VOID.copy(), self.compiler, [])
        self.doAlign = False

    # wrapper function

    def advance(self):
        self.compiler.advance()
        self.current_token = self.compiler.current_token
    # wrapper function

    def update(self):
        self.current_token = self.compiler.current_token

    def buildMember(self):
        # member type
        t = self.compiler.checkType()
        self.update()
        if(self.current_token.tok != T_ID):
            throw(ExpectedIdentifier(self.current_token))

        # if member of the same type as this struct, it must be a pointer,
        # otherwise it is an incomplete type.
        if(t.name == id):
            nested = True
            if(t.ptrdepth == 0):
                throw(UseOfIncompleteType(self.current_token, t))
            ptrhint = t.ptrdepth
            t = self.prototypeType
        else:
            ptrhint = None

        # member variable name
        name = self.current_token.value

        # check if this member variable has already been initialized
        exists = next(
            (v for v in self.prototypeType.members if v.name == name),
            None) is not None

        var = Variable(t, name, glob=False, offset=self.size,
                       isptr=t.ptrdepth > 0, signed=t.signed)

        if(exists):
            throw(VariableRedeclaration(self.current_token, var))

        # finalize data
        var.ptrhint = ptrhint
        var.t.ptrdepth = ptrhint if ptrhint is not None else t.ptrdepth
        self.prototypeType.members.append(var)
        self.prototypeType.s += var.t.csize() if not var.isptr else 8
        self.compiler.possible_members.append(name)
        self.size += t.csize()
        self.advance()

        # uninitialized
        if(self.current_token.tok == T_ENDL):
            return

        if(self.current_token.tok == T_OPENIDX):
            self.advance()
            start = self.compiler.ctidx
            while(self.current_token.tok != T_CLSIDX):
                self.advance()
            exprtokens = self.compiler.currentTokens[start:self.compiler.ctidx]
            value = determineConstexpr(t.isflt(), exprtokens, self.emptyfn)
            self.size += t.csize() * value.accessor - 1
            self.advance()
            return

        # inititialized with constexpr
        if(self.current_token.tok != T_EQUALS):
            throw(ExpectedToken(self.current_token, '; or ='))

        self.advance()

        # determine bounds of constexpr by iterating until next endline
        st = self.compiler.ctidx
        while(self.current_token.tok != T_ENDL):
            self.advance()

        end = self.compiler.ctidx

        # evaluate the constexpr to assign to the member's initializer
        value = determineConstexpr(
            t.isflt(), self.compiler.currentTokens[st:end], self.emptyfn)

        var.initializer = value.accessor

    def buildConstructor(self):
        lf = len(self.compiler.functions)
        self.compiler.buildFunction(
            thisp=True,
            thispt=self.prototypeType,
            destructor=False,
            constructor=True)
        self.compiler.ctidx -= 1
        self.update()
        if(len(self.compiler.functions) - lf > 0):
            f = self.compiler.functions[-1]
            f.name = f"_C{f.name}"
            
            self.prototypeType.constructors.append(f)
            if(self.current_token.tok == T_CLSSCOPE):
                self.advance()
        else:
            pass
            # undefined behavior

    def buildDestructor(self):
        self.advance()
        lf = len(self.compiler.functions)
        self.compiler.buildFunction(
            thisp=True,
            thispt=self.prototypeType,
            destructor=True,
            constructor=False)
        self.compiler.ctidx -= 1
        self.update()
        if(len(self.compiler.functions) - lf > 0):
            f = self.compiler.functions[-1]
            f.name = f"_D{f.name}"
            self.prototypeType.destructor = f
            if(self.current_token.tok == T_CLSSCOPE):
                self.advance()
        else:
            pass
            # undefined behavior

    def buildOperator(self, f, t1):

        if len(f.parameters) > 2:
            throw(TooManyOperatorArgs(t1, f.name))
        if f.name not in self.prototypeType.operators:
            self.prototypeType.operators[f.name] = [f]
        else:
            self.prototypeType.operators[f.name].append(f)

    def buildMemberfn(self):
        tok = self.current_token
        lf = len(self.compiler.functions)
        self.compiler.compileLine(thisp=True, thispt=self.prototypeType)
        self.compiler.ctidx -= 1
        self.update()
        if(len(self.compiler.functions) - lf > 0):
            f = self.compiler.functions[-1]
            if f.name in OPERATORS:
                self.buildOperator(f, tok)

            else:
                self.compiler.possible_members.append(f.name)
                self.prototypeType.members.append(
                    Variable(DType(
                        f"function {f.createTypename()}",
                        8,
                        function_template=f
                    ), f.name, initializer=f))

            if(self.current_token.tok == T_CLSSCOPE):
                self.advance()


    def buildCastOverload(self):
        starttok = self.current_token
        self.advance()
        t = self.compiler.checkType()
        self.update()
        if self.current_token.tok != T_OPENP:
            throw(ExpectedToken(self.current_token, T_OPENP))
        self.advance()
        if self.current_token.tok != T_CLSP:
            throw(ExpectedToken(self.current_token, T_CLSP))
        self.advance()
        if self.current_token.tok != T_OPENSCOPE:
            throw(ExpectedToken(self.current_token, T_CLSP))
        self.advance()
        start = self.compiler.ctidx
        self.compiler.skipBody()
        end = self.compiler.ctidx

        body =self.compiler.currentTokens[start:end+1]

        fun = Function(
            f"operator@{t}",
            [],
            t,
            self.compiler,
            body,
            memberfn=True,
            parentstruct=self.prototypeType,
            declare_token=starttok,
        )
        self.compiler.functions.append(fun)
        self.prototypeType.operators[t.name] = fun
        self.current_token = self.compiler.currentTokens[end+1]
        #self.update()
        #if(self.current_token.tok == T_CLSSCOPE):
        #   self.advance()

    # main function

    def construct(self):
        self.advance()
        if(self.current_token.tok != T_ID):
            throw(ExpectedIdentifier(self.current_token))

        # get name
        id = self.current_token.value
        self.advance()

        if self.current_token.tok == T_KEYWORD:
            if self.current_token.value == '__vectorize':
                self.doAlign=True
                self.advance()


        if(self.current_token.tok != T_OPENSCOPE):
            if self.current_token.tok == T_ENDL:
                self.compiler.types.append(DType(id, 0, [], 0, True))
                self.advance()
                return
            else:
                throw(ExpectedToken(self.current_token, "{"))
        # build prototype DType as placeholder
        self.prototypeType = DType(id, 0, [], 0, True, constructors=[])

        if self.templated:
            self.compiler.template_types.append([self.prototypeType, self.tns])
        else:
            self.compiler.types.append(self.prototypeType)

        # empty function used in the constexpr postfixer

        self.size = 0

        # find properties:
        #   -members
        #   -member functions
        #   -constructor
        #   -destructor
        while(self.current_token.tok != T_CLSSCOPE):
            self.advance()

            # member variable
            if(self.current_token.tok == T_ID):

                if self.current_token.value == id and \
                        self.compiler.currentTokens[self.compiler.ctidx + 1].tok == T_OPENP:

                    self.buildConstructor()
                else:
                    self.buildMember()

            elif (self.current_token.tok == T_KEYWORD):
                if self.current_token.value == 'operator':
                    self.buildCastOverload()
                else:
                    self.buildMemberfn()

            elif (self.current_token.tok == "~"):

                self.buildDestructor()

        # do alignment
        sizes = [8,16,32]
        if self.size != 0 and self.doAlign:
            if self.size <= 32:
                self.size = sizes[valueTypeClass(self.size)]
                self.prototypeType.s = self.size


        # finalize
        # self.compiler.types.pop()
        # self.compiler.types.append(self.prototypeType)

        self.advance()
        self.compiler.checkSemi()
