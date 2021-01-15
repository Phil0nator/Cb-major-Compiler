import Classes.ExpressionComponent as EC
from Assembly.CodeBlocks import createFloatConstant, valueOf, setSize
from Classes.Error import *
from Classes.Token import *
from Classes.Variable import *
from globals import (BOOL, CHAR, DOUBLE, FLOAT, INT, INTRINSICS, LITERAL, LONG,
                     OPERATORS, PRIORITY, SHORT, VOID, isIntrinsic,
                     operatorISO)

########################################
#
#   The Postfixer class is used to take a series of Token objects
#       in the form of an infix equation and turn them into a
#       series of ExpressionComponent objects in postfix form.
#   \see Function
#   \see DType
#   \see Variable
#   \see Token
#   \see ExpressionComponent
#
########################################


class Postfixer:
    def __init__(self, tokens, fn, globalScope=False):
        self.tokens = tokens            # a list of Token objects
        self.pfix = []                  # the output
        self.stack = []                 # utility stack
        self.fn = fn                    # caller
        # scope specifier (compiler vs function)
        self.globalScope = globalScope

    def isOperator(self, t):            # determine if a given Token object represents an operator
        return t.tok in OPERATORS

    # add a given token to the final output as an ExpressionComponent object
    def addtok(self, t):
        ec = None

        # operators are passed directly into ExpressionComponents
        if self.isOperator(t):
            ec = EC.ExpressionComponent(t.tok, t.value, isoperation=True)
        else:

            # Int literals are given type void, and constint flag
            if(t.tok == T_INT):
                ec = EC.ExpressionComponent(
                    t.value, LITERAL.copy(), constint=True)

            # an ID could be a local variable, global variable, function
            # pointer, member variable
            elif(t.tok == T_ID):

                if(t.thint is not None and t.thint == "m"):
                    ec = EC.ExpressionComponent(
                        t.value, LITERAL.copy(), token=t)

                else:
                    v: Variable = self.fn.getVariable(t.value)
                    if(v is None):

                        v = self.fn.compiler.getType(t.value)
                        if(v is None):
                            if(self.fn.compiler.ismember(t.value)):  # the variable is a member
                                ec = EC.ExpressionComponent(
                                    t.value, LITERAL.copy(), token=t)
                            else:  # the ID does not exist
                                throw(UnkownIdentifier(t))
                        else:  # variable is type, so it is replace by its size

                            # ec = EC.ExpressionComponent(
                            #    v.csize(), LITERAL.copy(), constint=True, token=t)
                            #ec.memory_location = valueOf(v)
                            print("ERR")
                            ec = EC.ExpressionComponent(
                                T_TYPECAST, v, isoperation=True, token=t)

                    else:  # variable is local or global or function pointer
                        v.referenced = True
                        if v.parent is not None:
                            v.parent.referenced = True
                        v.refcount += 1
                        if self.fn.isReturning == False or v.register is None:
                            ec = EC.ExpressionComponent(v, v.t)
                        else:
                            ec = EC.ExpressionComponent(
                                setSize(v.register, v.t.csize()), v.t)
            # function calls are replaced by a pop because their return values are already pushed.
            # the Peephole optimizer will remove redundant push-pops and replace them with mov's
            # when possible, and with a high enough Optimization flag (set by
            # -O2, -O3)
            elif(t.tok == T_FUNCTIONCALL):
                ec = EC.ExpressionComponent("pop", t.fn.returntype)

            # char literals can be replaced by their value, and given type char
            elif(t.tok == T_CHAR):
                ec = EC.ExpressionComponent(
                    t.value, CHAR.copy(), constint=True)

            # unkown tokens are simply added for later
            elif(t.tok == T_AMBIGUOUS):
                ec = EC.ExpressionComponent(t.value, T_AMBIGUOUS)

            # check for floating point literals
            elif (t.tok == T_DOUBLE) or (t.tok == T_FLOAT):
                flt32 = t.tok == T_FLOAT
                newt = DOUBLE if not flt32 else FLOAT
                data: tuple = createFloatConstant(t.value, flt32)
                name: str = data[1]
                instruct: str = data[0]
                # build Variable
                v = Variable(
                    newt.copy(),
                    name,
                    glob=True,
                    initializer=t.value,
                    mutable=False)

                self.fn.compiler.globals.append(v)

                if self.globalScope:
                    # add allocator to constants
                    self.fn.compiler.constants += instruct

                ec = EC.ExpressionComponent(v, newt.copy())

        if(ec is None):
            throw(InvalidExpressionComponent(t))
        ec.token = t

        self.pfix.append(ec)

    def createPostfix(self):        # main function

        # standard infix to postfix algorithm
        for t in self.tokens:

            if t.tok == "(" or t.tok == "[":
                self.stack.append(t)
            elif t.tok == ")" or t.tok == "]":
                while True:
                    if(len(self.stack) <= 0):
                        break
                    v = self.stack.pop()
                    if(v.tok == "("):
                        break
                    self.addtok(v)

            elif self.isOperator(t):
                while True:
                    if(len(self.stack) <= 0):
                        break
                    v = self.stack.pop()
                    if (PRIORITY[v.tok] >= PRIORITY[t.tok]):
                        if(v.tok != "("):
                            self.addtok(v)
                    else:
                        self.stack.append(v)
                        break
                self.stack.append(t)

            else:
                if (t.tok == T_KEYWORD or t.tok in r"{}"):
                    throw(UnexpectedToken(t))
                self.addtok(t)
        while len(self.stack) > 0:
            self.addtok(self.stack.pop())

        return self.pfix
