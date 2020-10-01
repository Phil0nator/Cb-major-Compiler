from Variable import *
from Function import *
from DType import *
from Token import *
from Location import *
from Lexer import *
from Error import *
class Compiler:

    def __init__(self):
        self.globals = []
        self.constants = ""
        self.heap = ""
        self.initializers = ""
        self.entry = ""
        self.text = ""
        self.currentfname = ""
        self.currentTokens = []


        self.current_token = None
        self.ctidx = 0


        self.functions = []
        self.globals = []
        self.types = [INT,BOOL,DOUBLE,CHAR,BOOL]
    

    def isType(self, q):
        for t in self.types:
            if t.name == q:
                return True
        return False

    def isIntrinsic(self, q):
        for t in INTRINSICS:
            if q == t.name:
                return t
        return None

    def isGlob(self, q):
        for g in self.globals:
            if g.name == q:
                return True
        return False


    def advance(self):
        self.ctidx+=1
        try:
            self.current_token = self.currentTokens[self.ctidx]
        except:
            throw(UnexepectedEOFError(self.current_token))



    def buildIDInitiatedStatement(self):
        
        value = self.current_token.value
        if(self.isType(value)):
            intr = self.isIntrinsic(value)
            
            if(intr == None):

            
                pass
            

            else:
                
                t = intr
                self.advance()
                isptr = False
                if(self.current_token.tok == "*"):
                    isptr=True
                    self.advance()

                if (self.current_token.tok != T_ID): throw(ExpectedIdentifier(self.current_token))
                name = self.current_token.value

                self.advance()
                if (self.current_token.tok == T_EQUALS):
                
                    self.advance()

                    if ( self.current_token.tok in  T_BOOL+T_INT+T_DOUBLE+T_CHAR):

                        v = Variable(t,name,glob=True,initializer=self.current_token.value,isptr=isptr)

                        self.initializers += "mov QWORD[%s], %s\n"%(name,self.current_token.value)

                    elif (self.current_token.tok == T_ID):
                        v = Variable(t,name,glob=True,initializer=self.current_token.value,isptr=isptr)
                        if self.isGlob(self.current_token.value):
                            if (isptr):

                                self.initializers += "mov QWORD[%s], %s"%(name,self.current_token.value)

                            else:

                                self.initializers += ("mov rax, [%s]\nmov [%s], rax\n"%(self.current_token.value,name))

                        else:
                            throw(UnexpectedIdentifier(self.current_token))



                    else:
                        throw(UnexpectedIdentifier(self.current_token))

                
                else:
                    v = Variable(t,name,glob=True,initializer=None,isptr=isptr)
                self.globals.append(v)
                self.heap+=createIntrinsicHeap(v)
                self.advance()



        else:
            throw(UnexpectedIdentifier(self.current_token))

    def createStringConstant(self, content):
        
        d = createStringConstant(content)
        name = d[1]
        cnst = d[0]
        self.constants += cnst
        v = Variable(CHAR,name,glob=True)
        self.globals.append(v)


    def compile(self, ftup):
        self.currentfname = ftup[1]
        raw = ftup[0]
        lex = Lexer(self.currentfname,raw)
        self.currentTokens = lex.getTokens()
        
        for t in self.currentTokens:
            if t.tok == T_STRING:
                
                data = createStringConstant(t.value)
                name = data[1]
                instruct = data[0]
                v = Variable(CHAR,name,glob=True,isptr=True)
                self.globals.append(v)
                t.tok = T_ID
                t.value = name

                self.constants+=instruct

            elif t.tok == T_DOUBLE:

                data = createFloatConstant(t.value)
                name = data[1]
                instruct = data[0]
                v = Variable(DOUBLE, name, glob=True)
                self.globals.append(v)
                t.tok = T_ID
                t.value = name

                self.constants+=instruct


        self.current_token = self.currentTokens[0]
        self.ctidx = 0
        while self.current_token.tok != T_EOF:
            
            if (self.current_token.tok == T_ID):
                self.buildIDInitiatedStatement()
            else:
                self.advance()

        