from Variable import *
from globals import *
from token import *
from Error import *
class Postfixer:
    def __init__(self, tokens):
        self.tokens = tokens
    
    def isOperator(self, t):
        return t.tok in OPERATORS
    
    def createPostfix(self):

        pfix = []
        stack = []

        for t in self.tokens:

            if t.tok == "(":
                stack.append(t)
            elif t.tok == ")":
                while True:
                    if(len(stack)<=0):break
                    v = stack.pop()
                    if(v.tok == "("): break
                    pfix.append(v)

                    
            elif self.isOperator(t):
                while True:
                    if(len(stack)<=0):break
                    v = stack.pop()
                    if (PRIORITY[v.tok] >= PRIORITY[t.tok]):
                        if(v.tok != "("): pfix.append(v)
                    else:
                        stack.append(v)
                        break
                stack.append(t)


            else:
                if (t.tok != T_ID and t.tok != T_FUNCTIONCALL and t.tok != T_INT and t.tok != T_BOOL and t.tok != T_CHAR and t.tok != T_REGISTER): throw(UnexpectedToken(t))
                pfix.append(t)
        while len(stack)>0:
            pfix.append(stack.pop())
        return pfix
