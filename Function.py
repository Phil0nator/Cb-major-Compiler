from globals import *
from Variable import *
from DType import *
from Token import *

class Function:
    def __init__(self, name, parameters, returntype, compiler, tokens):
        self.name = name
        self.parameters = parameters
        self.returntype=returntype
        self.compiler = compiler
        self.tokens = tokens
        self.asm = "\n"

        self.stackCounter = 8
        self.variables = []


        self.current_token = self.tokens[0]
        self.ctidx = 0

    def advance(self):
        self.ctidx+=1
        self.current_token = self.tokens[self.ctidx]

    def getCallingLabel(self):
        return functionlabel(self).replace(":","").replace("\n","")


    def getClosingLabel(self):
        return function_closer(self.getCallingLabel()).replace("\n","")



    def addVariable(self, v):

        v.offset = self.stackCounter
        self.stackCounter += v.t.size(0)
        self.variables.append(v)


    def addline(self, l):
        self.asm+=l+"\n"


    def loadParameters(self):
        count = 0
        for p in self.parameters:
            self.addVariable(p)
            if(p.isflt()):
                self.addline(movRegToVar(p.offset,sse_parameter_registers[count]))
            else:
                self.addline(movRegToVar(p.offset,norm_parameter_registers[count]))
            count+=1


    

    def createClosing(self):

        self.addline(function_closer(self.getCallingLabel()))



    def beginRecursiveCompile(self):
        opens = 1
        while opens > 0 and self.current_token.tok != T_EOF:

            if(self.current_token.tok == T_KEYWORD):
                pass # keyword statement
            elif (self.current_token.tok == T_ID):
                pass # ID initiated statement
            else:
                pass # ambiguous statement



    def compile(self):
        
        self.addline(functionlabel(self))
        self.addline("/*%%ALLOCATOR%%*/")
        self.loadParameters()



        self.beginRecursiveCompile()



        self.asm = self.asm.replace("/*%%ALLOCATOR%%*/", function_allocator(self.stackCounter))
        self.createClosing()


    def __repr__(self):
        return f"[ function {self.returntype} {self.name}( {self.parameters} ) ]"