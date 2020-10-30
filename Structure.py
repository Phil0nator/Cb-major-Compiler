from Classes.Variable import Variable
from Classes.DType import DType
from Classes.Constexpr import determineConstexpr
from Classes.Error import *
from Classes.Token import *
from Function import Function
from globals import VOID

####################################
#
#   The Structure class is used to parse
#       structure definition into DType
#       objects with the correct configuration.
#
#
#####################################


class Structure:
    def __init__(self, compiler):
        self.compiler = compiler
        self.current_token = self.compiler.current_token

    def advance(self):
        self.compiler.advance()
        self.current_token = self.compiler.current_token

    def update(self):
        self.current_token = self.compiler.current_token

    def construct(self):
        self.advance()
        if(self.current_token.tok != T_ID):
            throw(ExpectedIdentifier(self.current_token))

        # get name
        id = self.current_token.value
        self.advance()
        if(self.current_token.tok != T_OPENSCOPE):
            throw(ExpectedToken(self.current_token, "{"))
        # build prototype DType as placeholder
        prototypeType = DType(id, 0, [], 0, True)

        self.compiler.types.append(prototypeType)

        emptyfn = Function("empty", [], VOID.copy(), self.compiler, [])

        size = 0
        members = []

        postadders = []

        destructor = None
        constructor = None
        nested = False

        # find properties:
        #   -members
        #   -member functions
        #   -constructor
        #   -destructor
        while(self.current_token.tok != T_CLSSCOPE):
            self.advance()

            # member variable
            if(self.current_token.tok == T_ID):

                t = self.compiler.checkType()
                self.update()
                if(self.current_token.tok != T_ID):
                    throw(ExpectedIdentifier(self.current_token))
                if(t.name == id):
                    nested = True
                    if(t.ptrdepth == 0):
                        throw(UseOfIncompleteType(self.current_token, t))
                    ptrhint = t.ptrdepth
                    t = prototypeType
                else:
                    ptrhint = None

                name = self.current_token.value

                exists = next(
                    (v for v in prototypeType.members if v.name == name),
                    None) is not None

                var = Variable(t, name, glob=False, offset=size,
                               isptr=t.ptrdepth > 0, signed=t.signed)

                if(exists):
                    throw(VariableRedeclaration(self.current_token, var))

                var.ptrhint = ptrhint
                prototypeType.members.append(var)
                prototypeType.s += var.t.csize() if not var.isptr else 8
                self.compiler.possible_members.append(name)
                size += t.csize()
                self.advance()

                if(self.current_token.tok == T_ENDL):
                    continue

                if(self.current_token.tok != T_EQUALS):
                    throw(ExpectedToken(self.current_token, '; or ='))

                self.advance()
                st = self.compiler.ctidx
                while(self.current_token.tok != T_ENDL):
                    self.advance()

                end = self.compiler.ctidx

                value = determineConstexpr(
                    t.isflt(), self.compiler.currentTokens[st:end], emptyfn)

                var.initializer = value.accessor

        # remove prototype to apply actual properties
        # self.types.remove(prototypeType)

        # fill in new info

        # finalize
        self.compiler.types.pop()
        self.compiler.types.append(prototypeType)

        self.advance()
        if(self.current_token.tok != T_ENDL):
            throw(ExpectedToken(self.current_token, T_ENDL))
        self.advance()
