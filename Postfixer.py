from Classes.Variable import *
from globals import *
from Classes.Token import *
from Classes.Error import *

import Classes.ExpressionComponent as EC


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
    def __init__(self, tokens, fn):
        self.tokens = tokens            # a list of Token objects
        self.pfix = []                  # the output
        self.stack = []                 # utility stack
        self.fn = fn                    # caller
    
    def isOperator(self, t):            # determine if a given Token object represents an operator
        return t.tok in OPERATORS
    
    def addtok(self, t):                # add a given token to the final output as an ExpressionComponent object
        ec = None
        if self.isOperator(t):
            ec = EC.ExpressionComponent(t.tok,t.value,isoperation=True)
        else:
            if(t.tok == T_INT):
                ec = EC.ExpressionComponent(t.value,INT.copy(),constint=True)
            elif(t.tok == T_ID):
                v:Variable = self.fn.getVariable(t.value)
                if(v == None): 
                    
                    

                    v = self.fn.compiler.getType(t.value)
                    if(v == None):  
                        ec = EC.ExpressionComponent(t.value,VOID.copy(),token = t)
                    else:

                        ec = EC.ExpressionComponent(v.size(0),INT.copy(),constint=True,token=t)
                        ec.memory_location = valueOf(v)
                else:
                
                    ec = EC.ExpressionComponent(v,v.t)
            elif(t.tok == T_FUNCTIONCALL):
                ec = EC.ExpressionComponent("pop",t.fn.returntype)
            elif(t.tok == T_IDXER):
                ec = EC.ExpressionComponent("pop", t.value)
            elif(t.tok == T_CHAR):
                ec = EC.ExpressionComponent(t.value,CHAR.copy(),constint=True)
            elif(t.tok == T_AMBIGUOUS):
                ec = EC.ExpressionComponent(t.value, T_AMBIGUOUS)

        if(ec == None): print(t.start)        
        ec.token = t
        self.pfix.append(ec)

    def createPostfix(self):        # main function


        for t in self.tokens:

            if t.tok == "(" or t.tok == "[":
                self.stack.append(t)
            elif t.tok == ")" or t.tok == "]":
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
