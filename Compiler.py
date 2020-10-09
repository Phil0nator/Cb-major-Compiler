from Classes.Variable import Variable
from Function import Function
from Classes.DType import DType
from Classes.DType import type_precedence
import Classes.DType as Type
from Classes.Token import Token
from Classes.Token import *
from Classes.Location import Location
from Lexer import Lexer
from Classes.Error import *
from globals import *
import config

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
        self.heap = ""                  # raw assembly for heap definitions (.bss)
        self.initializers = ""          # raw assembly for initialization of heap definitions
        self.entry = ""                 # raw assembly to call the given entrypoint (usually main)
        self.text = ""                  # raw .text assembly
        self.currentfname = ""          # current filename
        self.currentTokens = []         # current tokens: Token

        
        self.current_token = None       # current token
        self.ctidx = 0                  # index of current_token in self.currentTokens


        self.functions = []             # all Function objects
         
        self.types = []                 # all datatypes: DType
        self.tdefs = []                 # typedefs listed as (old, new):(DType,DType)
        
        
        for i in INTRINSICS:            # fill types with primitives
            self.types.append(i.copy())
    

        self.heap_unnamed = 0           # int counter for unnamed heap variables

        self.panicmode = False          # panicmode means continue compiling, but there has already been an error

    def isType(self, q):                # return: if q is type
        return self.getType(q) != None

    def isIntrinsic(self, q):           # return: if q is primitive
        for t in INTRINSICS:
            if self.Tequals(t.name,q):
                return t
        return None

    def isGlob(self, q):                # return: if q is global variable
        for g in self.globals:
            if g.name == q:
                return True
        return False

    def getGlob(self, q):               # get global variable of name q
        for g in self.globals:
            if g.name == q:
                return g
        return None

    def getFunction(self, q):           # get first function of name q
        for f in self.functions:
            if f.name == q:
                return f
        return None

    def advance(self):                  # move to next token
        self.ctidx+=1
        try:
            self.current_token = self.currentTokens[self.ctidx]
        except:
            throw(UnexepectedEOFError(self.current_token))


    def Tequals(self, ta, tb):          # determine DType equality (including typedefs)
        if(ta == tb):return True
        for tdef in self.tdefs:
            if(tdef[0].name == ta and tdef[1].name == tb) or tdef[0].name == tb and tdef[1].name == ta: return True
        return False
    def getType(self, q):               # get type of name q
        pd = 0
        if "." in q:
            pd = q.count(".")
            q = q.replace(".","")
        for t in self.types:
            if t.name == q:
                out = t.copy()
                out.ptrdepth = pd
                return out
        return None

    def checkType(self):                # check the next tokens for a type, and return it
        signed=True
        if(self.current_token.tok == T_KEYWORD):
            if(self.current_token.value == "unsigned"):
                signed = False
                self.advance()

        if(self.current_token.tok != T_ID): throw(ExpectedIdentifier(self.current_token))
        
        if(not self.isType(self.current_token.value)): throw(ExpectedType(self.current_token))

        t = self.getType(self.current_token.value)
        if(t == None): throw(UnkownType(self.current_token))
        t = t.copy()
        
        self.advance()
        ptrdepth = 0
        while self.current_token.tok == "*":
            ptrdepth+=1
            self.advance()
        t.ptrdepth=ptrdepth
        t.signed=signed
        return t



    def buildIDInitiatedStatement(self):    # build a statement that starts with an id token
        
        value = self.current_token.value
        if(self.isType(value)):
            intr = self.isIntrinsic(value)
            
            if(intr == None):

                # the variable is not of an intrinsic type
                pass
            

            else: # the variable is of an intrinsic type
                
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

                    if(not self.isIntrinsic(self.current_token.tok)): throw(ExpectedValue(self.current_token))

                    if (intr!=None and self.current_token.tok != T_ID):

                        v = Variable(t,name,glob=True,initializer=self.current_token.value,isptr=isptr)


                        if(not isptr):
                            self.initializers += "mov QWORD[%s], %s\n"%(name,self.current_token.value)
                        else:
                            tmpvar =Variable(t,"HvptrDest_%s"%self.heap_unnamed,glob=True,initializer=v.initializer,isptr=False)
                            self.heap+=createIntrinsicHeap(tmpvar)
                            self.initializers += "mov QWORD[%s], %s\n"%(tmpvar.name,v.initializer)
                            self.initializers += "mov QWORD[%s], %s\n"%(name, tmpvar.name)
                            self.globals.append(tmpvar)
                            self.heap_unnamed+=1

                    elif (self.current_token.tok == T_ID):
                        v = Variable(t,name,glob=True,initializer=self.current_token.value,isptr=isptr)
                        if self.isGlob(self.current_token.value):
                            if (isptr):

                                self.initializers += "mov QWORD[%s], %s\n"%(name,self.current_token.value)

                            else:

                                self.initializers += movVarHeap(v,self.getGlob(self.current_token.value))

                        else:
                            throw(UnexpectedIdentifier(self.current_token))



                    else:
                        throw(UnexpectedIdentifier(self.current_token))

                
                    self.advance()
                else:
                    v = Variable(t,name,glob=True,initializer=None,isptr=isptr)
                
                
                self.globals.append(v)
                self.heap+=createIntrinsicHeap(v)

                if(self.current_token.tok != T_ENDL): throw(ExpectedSemicolon(self.current_token))



        else:
            throw(UnexpectedIdentifier(self.current_token))




    def createStringConstant(self, content):        # create a constant string value in self.constants
        
        d = createStringConstant(content)
        name = d[1]
        cnst = d[0]
        self.constants += cnst
        v = Variable(CHAR.copy(),name,glob=True)
        self.globals.append(v)




    def createConstant(self):                   # create an arbitrary constant in self.constants
        self.advance()
        value = self.current_token.value
        if(self.isType(value)):
            intr = self.isIntrinsic(value)

            if ( intr == None):
                throw(IntrinsicRequired(self.current_token))

            self.advance()
            isptr = False
            if(self.current_token.tok == "*"):
                isptr=True
                self.advance()
                throw(InvalidConstant(self.current_token))

            if (self.current_token.tok != T_ID): throw(ExpectedIdentifier(self.current_token))
            name = self.current_token.value

            self.advance()

            if (self.current_token.tok != T_EQUALS): throw(ExpectedValue(self.current_token))

            self.advance()

            if(self.current_token.tok == T_ID):

                v = Variable(intr,name,mutable=False,glob=True,isptr=isptr,initializer=self.getGlob(self.current_token.value).initializer)
                self.constants += createIntrinsicConstant(v)

            else:
                v = Variable(intr,name,mutable=False,glob=True,isptr=isptr,initializer=self.current_token.value)
                self.constants += createIntrinsicConstant(v)

            self.globals.append(v)



        else:
            throw(UnexpectedToken(self.current_token))

        self.advance()




    def createFunction(self):                   # isolate a function and build a Function object
        self.advance()

        rettype = self.checkType()

        if(self.current_token.tok != T_ID): throw(ExpectedIdentifier(self.current_token))

        name = self.current_token.value

        self.advance()

        if(self.current_token.tok != T_OPENP): throw(ExpectedParethesis(self.current_token))

        self.advance()

        parameters = []


        while self.current_token.tok != T_CLSP:

            t = self.checkType()

            if(self.current_token.tok != T_ID): throw(ExpectedIdentifier(self.current_token))

            varname = self.current_token.value

            self.advance()

            parameters.append(Variable(t,varname,isptr=t.ptrdepth>0))
            if (self.current_token.tok == T_CLSP): 

                break

            if(self.current_token.tok != T_COMMA): throw(ExpectedComma(self.current_token))



            self.advance()

        self.advance()

        if(self.current_token.tok == T_ENDL): 
            self.advance()
            return

        if(self.current_token.tok != T_OPENSCOPE): throw(ExpectedToken(self.current_token,T_OPENSCOPE))

        self.advance()

        opens = 1
        start = self.ctidx
        while opens > 0:
            if(self.current_token.tok == T_OPENSCOPE):
                opens+=1
            if(self.current_token.tok == T_CLSSCOPE):
                opens-=1
            self.advance()



        f = Function(name,parameters,rettype,self, self.currentTokens[start:self.ctidx])
        self.functions.append(f)        
        self.globals.append(Variable( f.returntype.copy(), f.name, glob=True))

    def buildStruct(self):                  # isolate and build a structure
        self.advance()
        if(self.current_token.tok != T_ID): throw(ExpectedIdentifier(self.current_token))
        id = self.current_token.value
        self.advance()
        if(self.current_token.tok != T_OPENSCOPE): throw(ExpectedToken(self.current_token, "{"))

        prototypeType = DType(id,8,[],0,True)
        self.types.append(prototypeType)

        size = 0
        members = []


        while(self.current_token.tok != T_CLSSCOPE):
            self.advance()
            if(self.current_token.tok == T_ID):

                t = self.checkType()
                if(self.current_token.tok != T_ID): throw(ExpectedIdentifier(self.current_token))
                name = self.current_token.value
                var = Variable(t,name,glob=False,offset=size,isptr=t.ptrdepth>0,signed=t.signed)
                members.append(var)
                size+=t.size(0)
                self.advance()
                if(self.current_token.tok != T_ENDL): throw(ExpectedSemicolon(self.current_token))

            elif(self.current_token.tok == T_KEYWORD):
                if(self.current_token.value == "function"):
                    self.createFunction()
                    f = self.functions.pop()
                    gv = self.globals.pop()
                    members.append(f)
                    gv.name = f"{id}_{gv.name}"
                    self.globals.append(gv)

        self.types.remove(prototypeType)
        actualType = DType(id,size,members,0,True)
        self.types.append(actualType)


    def compile(self, ftup):            # main function to perform Compiler tasks
        self.currentfname = ftup[1]
        raw = ftup[0]
        lex = Lexer(self.currentfname,raw)
        self.currentTokens = lex.getTokens()
        c = 0
        for t in self.currentTokens:
            if t.tok == T_STRING:
                if(self.currentTokens[c-2].tok != T_KEYWORD and self.currentTokens[c-2].value != "__asm"): # preserve assembly blocks
                    data = createStringConstant(t.value)
                    name = data[1]
                    instruct = data[0]
                    tp = CHAR.copy()
                    tp.ptrdepth = 1
                    v = Variable(tp,name,glob=True,isptr=True,initializer=t.value)
                    self.globals.append(v)
                    t.tok = T_ID
                    t.value = name

                    self.constants+=instruct

            elif t.tok == T_DOUBLE:

                data = createFloatConstant(t.value)
                name = data[1]
                instruct = data[0]
                v = Variable(DOUBLE, name, glob=True, initializer=t.value)
                self.globals.append(v)
                t.tok = T_ID
                t.value = name

                self.constants+=instruct
            c+=1


        self.current_token = self.currentTokens[0]
        self.ctidx = 0
        while self.current_token.tok != T_EOF:

            if (self.current_token.tok == T_ID):
                self.buildIDInitiatedStatement()
            elif (self.current_token.tok == T_KEYWORD):
                if(self.current_token.value == "const"):
                    self.createConstant()
                elif(self.current_token.value == "unsigned"):
                    s = self.current_token
                    self.advance()
                    self.buildIDInitiatedStatement()
                    v = self.globals[len(self.globals)-1]
                    if(v.isflt()):
                        throw(InvalidSignSpecifier(s))
                    
                    v.signed = False
                    v.t = v.t.copy()
                    v.t.signed=False
                    v.glob = True
                elif(self.current_token.value == "typedef"):
                    s = self.current_token
                    self.advance()
                    ta = self.checkType()
                    if(self.current_token.tok != T_ID): throw(ExpectedIdentifier(self.current_token))
                    ntn = self.current_token.value
                    newtype = ta.copy()
                    newtype.name=ntn
                    type_precedence[ntn] = type_precedence[ta.name]
                    self.types.append(newtype.copy())
                    self.tdefs.append((ta,newtype))
                    if(self.isIntrinsic(ntn)):
                        INTRINSICS.append(newtype.copy())
                    self.advance()
                    if(self.current_token.tok != T_ENDL):
                        throw(ExpectedSemicolon(self.current_token))

                elif(self.current_token.value == "struct"):
                    self.buildStruct()



                elif (self.current_token.value == "function"):
                    self.createFunction()


            else:
                self.advance()
            

    def finalize(self):                                 # compile all functions and fill in raw assembly info
        for f in self.functions:
            f.compile()
            rfreeAll() # make sure there are no register leaks between functions 

            
            if(config.DO_DEBUG):
                f.asm=f"\n\n\n;{f.__repr__()}\n\n\n\n\n{f.asm}"

            self.text=f"{f.asm}{self.text}"


        
        for f in self.functions:
            if f.name == "main":
                self.entry = "call %s"%functionlabel(f).replace(":","")

