from globals import *
from Variable import *
from DType import *
from Token import *
from Error import *
from Postfixer import *
import config


def product(arr):
    total = arr[0]
    for i in arr[1:]:
        total*=i
    return total









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
        return function_closer(self.getCallingLabel()).split("\n")[0]

    def getVariable(self, q):

        for v in self.variables:
            if (v.name == q):
                return v
        
        globq = self.compiler.getGlob(q)
        if(globq!=None): return globq
        return None

    def addVariable(self, v):

        v.offset = self.stackCounter
        self.stackCounter += v.t.size(0)
        self.variables.append(v)


    def addline(self, l):
        self.asm+=l+"\n"
    
    def addcomment(self, c):
        self.asm+=";"+c+"\n"


    def getFunction(self, fn, types):
        for f in self.compiler.functions:
            if f.name == fn:
                lt = len(types)
                if(len(f.parameters) != lt): continue
                valid = True
                for i in range(lt):
                    #if f.parameters[i].t.__repr__() != types[i].__repr__():
                    if (not TsCompatible(f.parameters[i].t, types[i],self)):
                        valid = False
                        break
                
                if(valid):
                    return f
                




    def checkForId(self):

        if(self.current_token.tok != T_ID): throw(ExpectedIdentifier(self.current_token))

        id= self.current_token.value
        self.advance()
        return id



    def checkForType(self):
        signed=True
        if(self.current_token.tok == T_KEYWORD):
            if(self.current_token.value == "unsigned"):
                signed = False
                self.advance()

        if(self.current_token.tok != T_ID): throw(ExpectedIdentifier(self.current_token))
        
        if(not self.compiler.isType(self.current_token.value)): throw(ExpectedType(self.current_token))

        t = self.compiler.getType(self.current_token.value).copy()

        self.advance()
        ptrdepth = 0
        while self.current_token.tok == "*":
            ptrdepth+=1
            self.advance()
        t.ptrdepth=ptrdepth
        t.signed = signed
        return t





    def loadParameters(self):
        countn = 0
        counts = 0
        for p in self.parameters:
            self.addVariable(p)
            if(config.DO_DEBUG):
                self.addcomment(f"Load Parameter: {p}")
            if(p.isflt()):
                self.addline(movRegToVar(p.offset,sse_parameter_registers[counts]))
                
                counts += 1
            else:
                self.addline(movRegToVar(p.offset,norm_parameter_registers[countn]))
                countn += 1

    

    def createClosing(self):

        self.addline(function_closer(self.getCallingLabel()))

    def buildReturnStatement(self):
        self.advance()
        if(self.returntype.isflt()):
            instr = self.evaluateRightsideExpression(sse_return_register)
        else:
            instr = self.evaluateRightsideExpression(norm_return_register)
        self.addline(instr)
        self.addline(f"jmp {self.getClosingLabel().replace(':','')}")

    def buildIfStatement(self):
        self.advance()
        if(self.current_token.tok != T_OPENP): throw(ExpectedToken(self.current_token,"("))
        self.advance()
        ot = BOOL.copy()
        preInstructions = self.evaluateRightsideExpression("rax",ot)

        self.ctidx-=2
        self.advance()
        if(self.current_token.tok == T_CLSP): 
            self.advance()
            return
        postlabel = getLogicLabel("IFPOST")
        jmpafter = getLogicLabel("IFELSE")
        preInstructions+= f"{check_fortrue}jne {postlabel}\n"
        self.addline(preInstructions)
        if(self.current_token.tok != T_OPENSCOPE): throw(ExpectedToken(self.current_token, "{"))
        self.advance()
        self.beginRecursiveCompile()
        self.addline(f"jmp {jmpafter}")
        self.advance()
        if(self.current_token.tok == T_KEYWORD):

            if(self.current_token.value == "else"):
                
                self.addline(postlabel+":\n")

                self.advance()
                if(self.current_token.tok == T_KEYWORD and self.current_token.value == "if"):
                    self.buildIfStatement()
                elif(self.current_token.tok == T_OPENSCOPE):
                    self.advance()
                    self.beginRecursiveCompile()
                else:
                    throw(ExpectedToken(self.current_token,"{"))

                self.addline(jmpafter+":\n")

            else:
                self.addline(postlabel+":\n")
                self.addline(jmpafter+":\n")
        else:
            self.addline(postlabel+":\n")
            self.addline(jmpafter+":\n")




    def buildForloop(self):
        pass
    
    
    def buildWhileloop(self):
        self.advance()
        if(self.current_token.tok != T_OPENP): throw(ExpectedToken(self.current_token, "("))
        self.advance()
        
        startlabel = getLogicLabel("WHILESTART")
        comparisonlabel = getLogicLabel("WHILECMP")
        
        
        self.addline(f"jmp {comparisonlabel}")
        self.addline(f"{startlabel}:")
        cmpinst = self.evaluateRightsideExpression("rax")
        cmpinst += f"{check_fortrue}je {startlabel}\n"
        self.ctidx-=2
        self.advance()
        if(self.current_token.tok != T_OPENSCOPE): throw(ExpectedToken(self.current_token, "{"))
        self.advance()
        self.beginRecursiveCompile()
        self.addline(f"{comparisonlabel}:")
        self.addline(cmpinst)



    def buildKeywordStatement(self):
        word = self.current_token.value
        
        if(word == "__asm"):
            
            self.advance()
            if(self.current_token.tok != T_OPENSCOPE): throw(ExpectedToken(self.current_token, "{"))
            self.advance()
            if(self.current_token.tok != T_STRING): throw(ExpectedToken(self.current_token, "Assembly String"))

            content = self.current_token.value
            content = content.replace("\t", "").strip()

            self.addline(content)

            self.advance()

            if(self.current_token.tok != T_CLSSCOPE): throw(ExpectedToken(self.current_token, "}"))

        elif(word == "return"):
            self.buildReturnStatement()
        elif(word == "unsigned"):
            s = self.current_token
            self.advance()
            self.buildDeclaration()
            v = self.variables[len(self.variables)-1]
            if(v.isflt()):
                throw(InvalidSignSpecifier(s))
            v.signed = False
            v.t.signed = False
        
        elif(word == "if"):
            self.buildIfStatement()

        elif(word == "while"):
            self.buildWhileloop()

        else:
            self.advance()


    def buildFunctionCall(self):
        fid = self.current_token.value
        self.advance()

        instructions = "xor rax, rax\n"
        startrec = self.ctidx
        opens = 1
        
        while opens > 0:
            self.advance()
            if(self.current_token.tok == T_OPENP): opens+=1
            elif(self.current_token.tok == T_CLSP): opens-=1
        endrec = self.ctidx
        lastone = self.current_token
        lastone.tracker = endrec
        
        self.ctidx =startrec - 1
        self.advance()


        """ for i in range(pcount):
            if(fn.parameters[i].isflt()):
                instructions += self.evaluateRightsideExpression("STACKF")+"\n"
            else:
                instructions += self.evaluateRightsideExpression("STACKI")+"\n"

        for i in range(pcount, 0, -1):
            if(fn.parameters[i-1].isflt()):
                instructions += "pop %s\n"%r15
                instructions += "movq %s, %s\n"%(sse_parameter_registers[i-1], r15)
            else:
                instructions += "pop  %s\n"%norm_parameter_registers[i-1] """
        self.advance()

        types = []
        ot = DType("",0)

        while self.ctidx < lastone.tracker:
            instructions += self.evaluateRightsideExpression("STACK", ot)+"\n"
            types.append(ot)
            ot = VOID.copy()
        fn = self.getFunction(fid,types)

        if fn == None:
            throw(UnkownFunction(self.current_token,fid,types))


        pcount = len(fn.parameters)


        normsused = 0
        sseused = 0

        for p in types:
            if p.isflt():
                sseused+=1
            else:
                normsused+=1
        ssevarsforrax = sseused
        

        for i in range(pcount, 0, -1):
            if(fn.parameters[i-1].isflt()):
                instructions += "pop %s\n"%r15
                instructions += "movq %s, %s\n"%(sse_parameter_registers[sseused-1], r15)
                sseused-=1
            else:
                instructions += "pop  %s\n"%norm_parameter_registers[normsused-1]
                normsused-=1





        instructions += f"mov {rax}, {ssevarsforrax}\n"

        instructions+=fncall(fn)
        return instructions, fn




    def evaluatePostfix(self, dest, pfix, otype):

        instr = ""
        stack = []

        sses = 0
        norms= 0
        o = DType("int", 8)

        for t in pfix:
            if(t.tok in OPERATORS):

                if(t.tok == T_NOT):
                    b = stack.pop()
                    a = Token(T_REGISTER, "", None, None)
                else:
                    b = stack.pop()
                    a = stack.pop()

                bq = self.getVariable(b.value)
                if(bq == None):

                    
                    if(b.tok !=T_FUNCTIONCALL):
                        bq = b.value
                    else:
                        f = b.fn
                        instr+=b.value+"\n"
                        if(f.returntype.isflt()):
                            bq = f"{sse_return_register}"
                        else:
                            bq = f"{norm_return_register}"
                else:
                    o = bq.t.copy()

                aq = self.getVariable(a.value)
                if(aq == None):
                    
                    if(a.tok != T_FUNCTIONCALL):
                        aq = a.value
                    else:
                        f = a.fn
                        instr+=a.value+"\n"
                        if(f.returntype.isflt()):
                            aq = f"{sse_return_register}"
                        else:
                            aq = f"{norm_return_register}"
                else:
                    o = aq.t.copy()


                if(t.tok in ["==","!=",">","<","<=",">="]):
                    o = BOOL.copy()
                

                
                if (isfloat(aq) or isfloat(bq) ):
                    d = sse_scratch_registers[sses]
                    stack.append(Token(T_REGISTER, d, None, None))
                    sses+=1

                else:
                    d = nrom_scratch_registers[norms]
                    stack.append(Token(T_REGISTER, d, None, None))
                    norms+=1
                if(bq in sse_scratch_registers):
                    sses-=2
                if(bq in nrom_scratch_registers):
                    norms-=2

                instr+= doOperation(aq,bq,t.tok,d)







            else:
                stack.append(t)
        
        
        
        final = stack.pop()
        if(final.tok == T_ID):
            finalq = self.getVariable(final.value)
            if(finalq == None):
                throw(UnkownIdentifier(final))
            final = finalq
            

        elif(final.tok == T_FUNCTIONCALL):
            instr += final.value+"\n"
            f = final.fn
            if(f.returntype.isflt()):

                final = Token(T_REGISTER, sse_return_register,None,None)
            else:
                final = Token(T_REGISTER, norm_return_register,None,None)

        if(isinstance(final, Variable)):

            o = final.t.copy()
            if(final.isflt()):
                instr += movVarToReg("xmm9", final)
                final = Token(T_REGISTER, "xmm9", None, None)
                
            else:
                instr += movVarToReg("r10", final)
                final = Token(T_REGISTER, "r10", None, None)

        if(isinstance(final, Token) and isinstance(final.value, int)):
            o = INT.copy()
            instr += f"mov {rax}, {final.value}\n"
            final = Token(T_REGISTER, "rax",None,None)

        

        if(dest == "STACKI"):
            if(isfloat(final)):
                instr += f"cvttsd2si {rax}, {final.value}\npush {rax}\n"
            else:
                instr += f"push {final.value}\n"
            return instr
        elif(dest == "STACKF"):
            if(isfloat(final)):
                instr += f"xor rax, rax\nmovq rax, {final.value}\npush {rax}\n"
            else:
                instr += f"cvtsi2sd {xmm7}, {final.value}\nmovq rax, {xmm7}\npush {rax}"
            return instr
        elif(dest == "STACK"):
            if(isfloat(final)):
                instr += f"movq rax, {final.value}\npush {rax}\n"
                if(otype!=None):
                    if(o.name == "AMB"):
                        otype.name = "double"
                    else:
                        otype.name = o.name
                        otype.ptrdepth = o.ptrdepth
                        otype.signed = o.signed
                        otype.s = o.s
            else:
                instr += f"push {final.value}\n"
                if(otype!=None):
                    if(o.name == "AMB"):
                        otype.name = "int"
                    else:
                        otype.name = o.name
                        otype.ptrdepth = o.ptrdepth
                        otype.signed = o.signed
                        otype.s = o.s
            return instr
        if(isfloat(dest)):
            if(isfloat(final)):
                instr += f"movsd {valueOf(dest)}, {final.value}\n"
                o = DOUBLE.copy()
            else:
                instr += f"cvtsi2sd {xmm7}, {final.value}\nmovsd {valueOf(dest)}, {xmm7}\n"
                o = INT.copy()
        else:
            if(isfloat(final)):
                instr += f"cvttsd2si {rax}, {final.value}\nmov {valueOf(dest)}, {rax}\n"
                o = DOUBLE.copy()
            else:
                instr += f"mov {valueOf(dest)}, {final.value}\n"
                o = INT.copy()
        
        
        if(otype!=None):
            if(o.name == "AMB"):
                otype.name = "norm"
            else:
                otype.name = o.name
                otype.ptrdepth = o.ptrdepth
                otype.signed = o.signed
                otype.s = o.s
        return instr





    def evaluateRightsideExpression(self, destination, otype=None):
        instructions = ""
        start = self.ctidx
        opens = 1
        comment = ""
        while self.current_token.tok != T_ENDL and self.current_token.tok != T_COMMA and self.current_token.tok != T_EQUALS and self.current_token.tok != T_CLSIDX and opens > 0:
            comment+= self.current_token.__repr__()
            if( self.current_token.tok == T_ID):
                if(self.compiler.getFunction( self.current_token.value) != None):
                    fnstart = self.ctidx
                    fnstartloc = self.current_token.start
                    fnstartloc1 = self.current_token.end
                    self.advance()
                    if(self.current_token.tok == "("):
                        #is call 
                        popen = 1
                        while popen > 0 :
                            self.advance()
                            if(self.current_token.tok == "("): popen+=1
                            if(self.current_token.tok == ")"): popen-=1
                        fnend = self.ctidx

                        self.ctidx = fnstart-1
                        self.advance()

                        fnisntr, fn = self.buildFunctionCall()
                        fnisntr+="\n"
                        self.ctidx = fnend-1
                        self.advance()


                        for t in self.tokens[fnstart:fnend]:
                            self.ctidx-=1
                            self.tokens.remove(t)
                        
                        fntoken = Token(T_FUNCTIONCALL, fnisntr, fnstartloc, fnstartloc1)
                        fntoken.fn = fn
                        self.tokens.insert(self.ctidx, fntoken)


                    


                    else:
                        self.ctidx-=2
                        self.advance()                        

            elif (self.current_token.tok == T_OPENP): opens+=1
            elif (self.current_token.tok == T_CLSP) : opens-=1

            if(opens>0):
                self.advance()

        
        exprtokens = self.tokens[start:self.ctidx]
        if(self.current_token.tok == T_CLSP):
            self.advance()

                    




        pf = Postfixer(exprtokens)

        instructions=""
        if(config.DO_DEBUG):
            instructions+=f";{comment}\n"
        instructions += self.evaluatePostfix(destination, pf.createPostfix(), otype)



        self.advance()
        

        return instructions




    def buildDeclaration(self):
        t = self.checkForType()
        name = self.checkForId()
        self.addVariable(Variable(t,name))
        var = self.variables[len(self.variables)-1]
        sizes = []
        isarr = False


        while self.current_token.tok == "[":
            isarr=True
            self.advance()
            if self.current_token.tok != T_INT: throw(ExpectedToken(self.current_token, "constexpr"))
            size = self.current_token.value
            sizes.append(size)
            self.advance()
            if(self.current_token.tok != T_CLSIDX): throw(ExpectedToken(self.current_token, "]"))
            self.advance()

        if(isarr):
            totalsize = product(sizes)
            
            var.stackarrsize = totalsize
            var.isStackarr = True
            self.stackCounter+=totalsize
            if(self.current_token.tok != T_ENDL): throw(ExpectedToken(self.current_token, ";"))



        

        if(self.current_token.tok == T_ENDL): return

        if(self.current_token.tok != T_EQUALS): throw(ExpectedToken(self.current_token, " = or ; "))

        self.advance()

        self.addline(self.evaluateRightsideExpression(var))
        

    def buildBlankfnCall(self):
        instructions, fn = self.buildFunctionCall()
        self.ctidx-=2
        self.advance()
        if(self.current_token.tok != T_ENDL): throw(ExpectedSemicolon(self.current_token))
        self.addline(instructions)
        self.advance()

    def buildAssignment(self):
        v = self.getVariable(self.current_token.value)
        self.advance()
        offset = v.offset
        inst = ""
        if(self.current_token.tok == T_OPENIDX):
            inst = self.evaluateRightsideExpression("rbx")
            inst+=(f"mov {rax}, {(offset)}\n")
            inst+=(f"sub {rax}, {rbx}\n")
            offset = "rax"
        
        self.advance()
        ev = self.evaluateRightsideExpression(Variable(v.t,v.name,offset=offset))
        self.addline(inst)
        self.addline(ev)



    def buildIDStatement(self):
        
        id = self.current_token.value

        if (self.compiler.isType(id)):
            self.buildDeclaration() # declaration
        elif (self.getVariable(id)!=None):
            # assignment or blank call

            if (self.compiler.getFunction(id)!=None):
                #fn call
                self.buildBlankfnCall()
            
            
            else:
        
                self.buildAssignment()
        


        else:
            throw(UnkownIdentifier(self.current_token))
        



    def beginRecursiveCompile(self):
        opens = 1
        while opens > 0 and self.current_token.tok != T_EOF:

            if(self.current_token.tok == T_CLSSCOPE): opens-=1




            elif(self.current_token.tok == T_KEYWORD):
                # keyword statement
                self.buildKeywordStatement()


            elif (self.current_token.tok == T_ID):
                # ID initiated statement
                self.buildIDStatement()

            else:
                pass # ambiguous statement
                self.advance()



    def compile(self):
        
        self.addline(functionlabel(self))
        self.addline("/*%%ALLOCATOR%%*/")
        self.loadParameters()


        self.beginRecursiveCompile()



        self.asm = self.asm.replace("/*%%ALLOCATOR%%*/", function_allocator(self.stackCounter))
        self.createClosing()


    def __repr__(self):
        return f"[ function {self.returntype} {self.name}( {self.parameters} ) ]"