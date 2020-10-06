from Classes.Variable import *
from globals import *
from Classes.Token import *
from Classes.Error import *

import Classes.ExpressionComponent as EC
class Postfixer:
    def __init__(self, tokens, fn):
        self.tokens = tokens
        self.pfix = []
        self.stack = []
        self.fn = fn
    
    def isOperator(self, t):
        return t.tok in OPERATORS
    
    def addtok(self, t):
        
        if self.isOperator(t):
            ec = EC.ExpressionComponent(t.tok,t.value,isoperation=True)
        else:
            if(t.tok == T_INT):
                ec = EC.ExpressionComponent(t.value,INT.copy(),constint=True)
            elif(t.tok == T_ID):
                v:Variable = self.fn.getVariable(t.value)
                ec = EC.ExpressionComponent(v,v.t)
            elif(t.tok == T_FUNCTIONCALL):
                ec = EC.ExpressionComponent("pop",t.fn.returntype)
        ec.token = t
        self.pfix.append(ec)

    def createPostfix(self):


        for t in self.tokens:

            if t.tok == "(":
                self.stack.append(t)
            elif t.tok == ")":
                while True:
                    if(len(self.stack)<=0):break
                    v = self.stack.pop()
                    if(v.tok == "("): break
                    self.addtok(v)

                    
            elif self.isOperator(t):
                while True:
                    if(len(self.stack)<=0):break
                    v = self.stack.pop()
                    if (PRIORITY[v.tok] >= PRIORITY[t.tok]):
                        if(v.tok != "("): self.addtok(v)
                    else:
                        self.stack.append(v)
                        break
                self.stack.append(t)


            else:
                if (t.tok == T_KEYWORD or t.tok in r"{}"): throw(UnexpectedToken(t))
                self.addtok(t)
        while len(self.stack)>0:
            self.addtok(self.stack.pop())
        return self.pfix
