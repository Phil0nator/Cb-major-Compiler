from globals import *
from Classes.Variable import *
from Classes.DType import *
from Classes.Token import *
from Classes.Error import *
from Postfixer import *
import Classes.Optimizer
import config
import time
import Classes.ExpressionComponent as EC


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

        self.continues = []
        self.breaks = []


        self.current_token = self.tokens[0]
        self.ctidx = 0

    def advance(self):
        self.ctidx+=1
        self.current_token = self.tokens[self.ctidx]

    def getCallingLabel(self):
        return functionlabel(self).replace(":","").replace("\n","")

    def checkSemi(self):
        if(self.current_token.tok != T_ENDL): throw(ExpectedSemicolon(self.current_token))
        self.advance()

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
        #self.stackCounter += v.t.size(0)
        if v.t.size(0) <= 8: self.stackCounter += 8
        else: self.stackCounter += v.t.size(0)
        self.variables.append(v)


    def addline(self, l):
        self.asm+=l+"\n"
    
    def addcomment(self, c):
        self.asm+=";"+c+"\n"

    def isbeforeTracker(self, value):
        for t in self.tokens[self.ctidx:]:
            if t.tracker == value:
                return True
        return False

    def getFunction(self, fn, types):

        for f in self.compiler.functions: # first seach exact matches
            if f.name == fn:
                if(len(f.parameters) != len(types)): continue
                valid = True
                for i in range(len(types)):
                    if(not f.parameters[i].t.__eq__(types[i])):
                        
                        valid=False
                        break
                if(valid):
                    return f
        
        for f in self.compiler.functions: #seach others for valid casts
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
            instr = self.evaluateRightsideExpression(EC.ExpressionComponent(sse_return_register, DOUBLE.copy(), token=self.current_token))
        else:
            instr = self.evaluateRightsideExpression(EC.ExpressionComponent(norm_return_register,INT.copy(),token=self.current_token))
        self.addline(instr)
        self.addline(f"jmp {self.getClosingLabel().replace(':','')}")
        self.checkSemi()

    def buildIfStatement(self):
        self.advance()
        if(self.current_token.tok != T_OPENP): throw(ExpectedToken(self.current_token,"("))
        self.advance()

        preInstructions = self.evaluateRightsideExpression(EC.ExpressionComponent(rax, BOOL.copy(),token=self.current_token))
        if(self.current_token.tok == T_CLSP): 
            self.advance()
            
        postlabel = getLogicLabel("IFPOST")
        jmpafter = getLogicLabel("IFELSE")

        self.continues.append(postlabel)


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


                #clean up var
        if(len(self.continues)>0):
            if(self.continues[len(self.continues)-1] == postlabel): self.continues.pop()




    def buildForloop(self):
        self.advance()
        if(self.current_token.tok != T_OPENP): throw(ExpectedToken(self.current_token, "("))
        self.advance()

        toplabel = getLogicLabel("FORTOP")
        comparisonlabel = getLogicLabel("FORCMP")
        updatelabel = getLogicLabel("FORUPDATE")
        endlabel = getLogicLabel("FOREND")
        self.continues.append(comparisonlabel)
        self.breaks.append(endlabel)
        self.buildDeclaration()
        var = self.variables[len(self.variables)-1]

        getCondition = self.evaluateRightsideExpression(EC.ExpressionComponent(rax,BOOL.copy(),token=self.current_token))

        if(self.current_token.tok != T_ENDL): throw(ExpectedSemicolon(self.current_token))
        self.advance()
        
        self.addline(f"jmp {comparisonlabel}\n")
        self.addline(f"{toplabel}:")
        
        self.addline(f"##FLPCONTENT##")
        
        
        self.buildAssignment()
        
        updatev = self.asm[self.asm.find("##FLPCONTENT##"):len(self.asm)-1]
        self.asm = self.asm.replace(updatev,"")
        updatev = updatev.replace("##FLPCONTENT##","")


        if(self.current_token.tok != T_CLSP): throw(ExpectedToken(self.current_token, ")"))
        self.advance()
        if(self.current_token.tok != T_OPENSCOPE): throw(ExpectedToken(self.current_token, "{"))
        self.advance()
        self.beginRecursiveCompile()
        self.addline(f"{updatelabel}:")
        self.addline(updatev)
        self.addline(f"{comparisonlabel}:\n")
        self.addline(getCondition)
        self.addline(f"{check_fortrue}\nje {toplabel}\n")
        self.addline(f"{endlabel}:")
        self.advance()




        #clean up var
        if(len(self.continues)>0):
            if(self.continues[len(self.continues)-1] == comparisonlabel): self.continues.pop()
        if(len(self.breaks)>0):
            if(self.breaks[len(self.breaks)-1] == endlabel): self.breaks.pop()

        self.variables.remove(var)

        
        

    
    
    def buildWhileloop(self):
        self.advance()
        if(self.current_token.tok != T_OPENP): throw(ExpectedToken(self.current_token, "("))
        self.advance()
        
        startlabel = getLogicLabel("WHILESTART")
        comparisonlabel = getLogicLabel("WHILECMP")
        endlabel = getLogicLabel("WHILEEND")
        self.continues.append(comparisonlabel)
        self.breaks.append(endlabel)
        
        self.addline(f"jmp {comparisonlabel}")
        self.addline(f"{startlabel}:")
        cmpinst = self.evaluateRightsideExpression(EC.ExpressionComponent(rax, BOOL.copy(),token=self.current_token))
        cmpinst += f"{check_fortrue}je {startlabel}\n"

        if(self.current_token.tok != T_OPENSCOPE): throw(ExpectedToken(self.current_token, "{"))
        self.advance()
        self.beginRecursiveCompile()
        self.addline(f"{comparisonlabel}:")
        self.addline(cmpinst)
        self.addline(f"{endlabel}:")
        self.advance()

        #clean up var
        if(len(self.continues)>0):
            if(self.continues[len(self.continues)-1] == comparisonlabel): self.continues.pop()
        if(len(self.breaks)>0):
            if(self.breaks[len(self.breaks)-1] == endlabel): self.breaks.pop()




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

        elif(word == "for"):
            self.buildForloop()

        elif(word == "break"):
            l = self.breaks.pop()
            self.addline(f"jmp {l}\n")
            self.advance()
            self.checkSemi()


        elif(word == "continue"):
            l = self.continues.pop()
            self.addline(f"jmp {l}\n")
            self.advance()
            self.checkSemi()

        else:
            self.advance()


    def buildFunctionCall(self):
        fid = self.current_token.value
        fnstartt = self.current_token
        fn = None
        instructions = ""

        self.advance()
        if(self.current_token.tok != "("): throw(ExpectedToken(self.current_token,"("))
        self.advance()

        types = []

        start = self.ctidx
        while self.current_token.tok != ")" and self.current_token.tok != T_ENDL:
            o = VOID.copy()
            tmp = self.evaluateRightsideExpression("AMB", o)
            
            if(self.current_token.tok == ","):
                self.advance()
            types.append(o)
        if(self.current_token.tok != T_ENDL):
            #self.advance()
            pass

        fn = self.getFunction(fid,types)
        self.ctidx = start-1
        self.advance()
        if(fn == None):
            throw(UnkownFunction(fnstartt,fid,types))
        pcount = len(fn.parameters)


        sseused = 0
        
        for p in types:
            if p.isflt():
                sseused+=1

        ssevarsforrax = sseused
        sseused = 0
        normused = 0

        for i in range(pcount):
            if(fn.parameters[i].isflt()):
                
                instructions+=self.evaluateRightsideExpression(EC.ExpressionComponent( sse_parameter_registers[sseused], fn.parameters[i].t.copy(), token=self.current_token))
                sseused+=1

            else:
                instructions+=self.evaluateRightsideExpression(EC.ExpressionComponent( norm_parameter_registers[normused], fn.parameters[i].t.copy(),token=self.current_token))
                normused+=1

            if(self.current_token.tok == ","):
                    self.advance()
        
        if(self.current_token.tok != T_ENDL):
            #self.advance()
            pass



        instructions += f"mov {rax}, {ssevarsforrax}\n"


        instructions+=fncall(fn)
        return instructions, fn

        
    def performCastAndOperation(self,a, b, op, o):
        instr = ""
        apendee = None

        if(op in ["<<", ">>"] and (a.type.isflt() or b.type.isflt())):
            throw(InvalidOperationOperands(a.token,op,a.type,b.type))


        if(a.type.__eq__(b.type)):
            #same type

            o = a.type.copy()
            needLoadA = True
            needLoadB = True
            if(a.isRegister()):
                areg = a.accessor
                needLoadA=False
            else:
                areg = ralloc(a.type.isflt())
            
            if(b.isRegister()):
                breg = b.accessor
                needLoadB = False
            else:
                breg = ralloc(a.type.isflt())


            if(needLoadB): instr+=loadToReg(breg, b.accessor)
            if(needLoadA): instr+=loadToReg(areg, a.accessor)
            instr+=doOperation(a.type,areg, breg, op, a.type.signed or b.type.signed)

            if(op in ["==","!=",">","<","<=",">="]):
                if(a.type.isflt() or b.type.isflt()):
                    rfree(areg)
                    areg = f"{rax}"
                a.type = BOOL.copy()

            apendee = (EC.ExpressionComponent(areg,a.type,token=a.token))

            rfree(breg)
        else: #situation is different when casting is directional
            if(not typematch(a.type,b.type) and not typematch(b.type, a.type) and not (a.isconstint() or b.isconstint())):
                throw(TypeMismatch(a.token, a.type, b.type))
            newtype, toConvert = determinePrecedence(a.type, b.type)
            o = newtype.copy()
            if(newtype.__eq__(a.type)):
                # cast to a
                castee = b
                caster = a
            else:
                #cast to b
                castee = a
                caster = b
            
            needLoadC = True
            needLoadCO = True

            if(caster.isRegister()):
                creg = caster.accessor
                needLoadC=False
            else:
                creg = ralloc(caster.type.isflt())
            
            if(castee.isRegister()):
                coreg = castee.accessor
                needLoadCO = False
            else:
                coreg = ralloc(castee.type.isflt())

            newcoreg = ralloc(caster.type.isflt())
            
            if(needLoadC): instr+=loadToReg(creg, caster.accessor)
            if(needLoadCO): instr+=loadToReg(coreg, castee.accessor)

            cst=castABD(caster,castee,creg,coreg,newcoreg)
            #cst represents if actual extra instructions are needed to cast
            if(cst!=False):
                instr+=cst
            else:
                rfree(newcoreg)
                newcoreg = coreg
            

            instr+=doOperation(caster.type,creg,newcoreg,op, caster.type.signed)
            # handle float comparison
            if(op in ["==","!=",">","<","<=",">="]):

                if( caster.type.isflt() or castee.type.isflt()):                    
                    rfree(creg)
                    creg = f"{rax}"
                caster.type = BOOL.copy()


            apendee = (EC.ExpressionComponent(creg,caster.type,token=caster.token))
            rfree(newcoreg)
            rfree(coreg)


        if(op in ["==","!=",">","<","<=",">="]):
            o = BOOL.copy()
        
        return instr, o, apendee



    def evaluatePostfix(self, dest, pfix):
        instr = ""
        stack = []
        sses = 0
        norms= 0
        o = VOID.copy()
        for e in pfix:
            if(e.isoperation):
                if(not operatorISO(e.accessor)):
                    b = stack.pop()
                    if(len(stack) < 1): throw(HangingOperator(pfix[len(pfix)-1].token))

                    a = stack.pop()
                    op = e.accessor

                    if(a.isconstint() and b.isconstint()): # optimize for constant expressions
                        stack.append(calculateConstant(a,b,op))
                    else:
                        newinstr, newt, apendee = self.performCastAndOperation(a,b,op,o)
                        stack.append(apendee)
                        instr+=newinstr
                        o = newt.copy()
                else:
                    if(len(stack) < 1): throw(HangingOperator(pfix[len(pfix)-1].token))
                    a = stack.pop()

                    if(e.accessor == T_NOT):

                        if(not typematch(BOOL, a.type) and not a.isconstint()):
                            throw(TypeMismatch(a.token,BOOL, a.type))
                        
                        needload = True
                        if(a.isRegister()):
                            areg = a.accessor
                            needload=False
                        else:
                            areg = ralloc(False)
                        if(needload): instr+=loadToReg(areg,a.accessor)

                        instr+=boolmath(areg,None,e.accessor)
                        o = BOOL.copy()
                        stack.append(EC.ExpressionComponent(areg,BOOL.copy(),token=a.token))

                    elif(e.accessor == T_ANOT):
                        needload=True
                        if(a.isRegister()):
                            areg = a.accessor
                            needload=False
                        else:
                            areg = ralloc(False)
                        if(needload): instr+=loadToReg(areg,a.accessor)
                        instr+=doOperation(a.type,areg,areg,T_ANOT,a.type.signed)
                        o = a.type.copy()
                        stack.append(EC.ExpressionComponent(areg,o.copy(),token=a.token))
                    
                    elif(e.accessor == T_REFRIZE):
                        
                        if( a.isconstint() ):

                            throw(AddressOfConstant(a.token))

                        elif( isinstance(a.accessor, Variable) ):
                            
                            result = ralloc(False)
                            instr+=f"lea {result}, [rbp-{a.accessor.offset}]\n"
                            o = a.type.copy()
                            o.ptrdepth+=1
                            stack.append(EC.ExpressionComponent(result, o.copy(),token=a.token))
                        
                        else:
                            throw(AddressOfConstant(a.token))
                        
                    elif(e.accessor == T_DEREF):

                        if( a.isconstint() ):

                            throw(AddressOfConstant(a.token))

                        elif(isinstance(a.accessor, Variable)):

                            tmp = ralloc(False)
                            instr+=f"mov {tmp}, {valueOf(a.accessor)}\n" 
                            if(a.accessor.t.isflt()):
                                oreg = ralloc(True)
                                instr+=f"movsd {oreg}, [{tmp}]\n"
                            else:
                                oreg = ralloc(False)
                                instr+=f"mov {oreg}, [{tmp}]\n"
                            o = a.accessor.t.copy()
                            o.ptrdepth-=1
                            rfree(tmp)
                            stack.append(EC.ExpressionComponent(oreg, o.copy(),token=a.token))
                        elif(a.isRegister()):
                            result = ralloc(a.type.isflt())
                            if(a.type.isflt()):
                                instr+=f"movsd {result}, [{a.accessor}]\n"
                            else:
                                instr+=f"mov {result}, [{a.accessor}]\n"
                            rfree(a.accessor)
                            o = a.type.copy()
                            o.ptrdepth-=1
                            stack.append(EC.ExpressionComponent(result, o.copy(),token=a.token))

                    elif(e.accessor == T_TYPECAST):

                        
                        tid = e.type
                        t = self.compiler.getType(tid)
                        if(t == None):
                            throw(UnkownType(e.token))
                        aval = ralloc(a.type.isflt())
                        result = ralloc(t.isflt())
                        cst=castABD(EC.ExpressionComponent("",t),EC.ExpressionComponent("",a.type),"",aval,result)
                        if(cst != False):
                            instr+=loadToReg(aval, a.accessor)
                            instr+=cst
                            rfree(aval)
                            stack.append(EC.ExpressionComponent(result,t.copy(),token=a.token))
                        else:
                            rfree(aval)
                            rfree(result)
                            stack.append(EC.ExpressionComponent(a.accessor,t.copy(),token=a.token))
                    else:
                        print(e)
                        exit(1)


            else:
                stack.append(e)
        
        if(len(stack) != 1): throw(HangingOperator(pfix[len(pfix)-1].token))
        final = stack.pop()
        
        
        o = final.type.copy()
        
        instr+=";------------\n"
        if(dest == "AMB"):
            if(final.isRegister()):
                rfree(final.accessor)
            return instr, o

        if(final.type.__eq__(dest.type)):

            if(isinstance(final.accessor, Variable)):
                tmp = ralloc(final.type.isflt())
                instr+=loadToReg(tmp, final.accessor)

                final.accessor = tmp
                rfree(tmp)
            else:
                rfree(final.accessor)
            instr+=loadToReg(dest.accessor,final.accessor)

        
        
        else:

            #not needed error
            #if(not typematch(dest.type, final.type)):
            #throw(TypeMismatch(dest.token, dest.type, final.type))



            twoStep = False
            if(isinstance(dest.accessor, Variable)):
                castdest = ralloc(dest.type.isflt())
                twoStep = True
            else:
                castdest = dest.accessor

            if(dest.type.isflt() and not final.type.isflt()):
                if(isinstance(final.accessor, int)):
                    instr+=f"mov {rax}, {final.accessor}\n"
                    final.accessor = "rax"
                elif(final.accessor == "pop"):
                    instr+=f"pop {rax}\n"
                    final.accessor = "rax"

                cst = f"cvtsi2sd {valueOf(castdest)}, {valueOf(final.accessor)}\n"
            elif(not dest.type.isflt() and final.type.isflt()):
                if(final.accessor == "pop"):
                    instr+=f"pop {rax}\nmovq {xmm7}, {rax}\n"
                    final.accessor = "xmm7"

                cst = f"cvttsd2si {valueOf(castdest)}, {valueOf(final.accessor)}\n"
            else:
                cst = False
            
            
            if(cst!=False):
                instr+=cst
                if(twoStep):
                    instr+=loadToReg(dest.accessor, castdest)

            else:
                source = final.accessor
                if(isinstance(final.accessor, Variable)):
                    instr+=loadToReg(castdest, final.accessor)
                    source = castdest
                instr+=loadToReg(dest.accessor,source)

            if(final.isRegister()):
                rfree(final.accessor)

            rfree(castdest)


        return instr, o



    def buildExpressionComponents(self):
        exprtokens= []
        opens = 1
        instructions = ""
        wasfunc = False
        while opens>0 and self.current_token.tok != T_ENDL and self.current_token.tok != T_COMMA and self.current_token.tok != T_CLSIDX:

            if(self.current_token.tok == T_CLSP):opens-=1
            elif(self.current_token.tok == T_OPENP):opens+=1

            if(opens <=0): break

            elif(self.current_token.tok == T_ID):
                if(self.tokens[self.ctidx+1].tok == "("):
                    wasfunc=True
                    start = self.current_token.start.copy()
                    fninstr, fn = self.buildFunctionCall()
                    
                    token =Token(T_FUNCTIONCALL,fninstr,start, self.current_token.start.copy())
                    token.fn = fn
                    exprtokens.append(token)
                    instructions+=fninstr+"\n"

                    if(fn.returntype.isflt()):
                        instructions+=f"movq {rax}, {sse_return_register}\n"
                    instructions+=f"push {norm_return_register}\n"
               
               
                elif(self.tokens[self.ctidx+1].tok == "["):
                    wasfunc = True
                    start = self.current_token.start.copy()
                    var = self.getVariable(self.current_token.value)
                    if(not var.isStackarr and var.t.ptrdepth == 0): throw(TakingIndexOfScalar(self.current_token))
                    
                    
                    self.advance()
                    
                    if(var.isStackarr):
                        sizes = var.stacksizes
                        i = 0
                    else:
                        sizes = []
                        for i in range((var.t.ptrdepth+1)):
                            sizes.append(var.t.size(i))
                        i = 0


                    # @ (&c+idxa*8+idxb)
                    exprtokens.append(Token(T_OPENP,T_OPENP,self.current_token.start,self.current_token.end))
                    exprtokens.append(Token(T_DEREF,T_DEREF,self.current_token.start,self.current_token.end))
                    exprtokens.append(Token(T_OPENP,T_OPENP,self.current_token.start,self.current_token.end))
                    
                    if(var.isStackarr): exprtokens.append(Token(T_REFRIZE,T_REFRIZE,self.current_token.start,self.current_token.end))
                    
                    
                    exprtokens.append(Token(T_ID, var.name,start,start))
                    
                    
                    while(self.current_token.tok == "["):
                        self.advance()
                        
                        if(var.isStackarr):
                            exprtokens.append(Token(T_MINUS,T_MINUS,self.current_token.start,self.current_token.end))
                            size = sizes[i]*var.t.size(i)
                        else:
                            exprtokens.append(Token(T_PLUS, T_PLUS,start,start))
                            size = sizes[i]

                        newtoks, newinstrs = self.buildExpressionComponents()
                        instructions+=newinstrs
                        exprtokens.append(Token(T_OPENP,T_OPENP,start,start))
                        for t in newtoks:
                            exprtokens.append(t)
                        exprtokens.append(Token(T_CLSP,T_CLSP,start,start))
                        exprtokens.append(Token(T_TIMES,T_TIMES, start,start))
                        exprtokens.append(Token(T_INT,size,start,start))
                        i+=1
                        self.advance()
                    exprtokens.append(Token(T_CLSP,T_CLSP,self.current_token.start,self.current_token.end))
                    exprtokens.append(Token(T_CLSP,T_CLSP,self.current_token.start,self.current_token.end))

                    self.ctidx-=2
                    self.advance()
                elif(self.tokens[self.ctidx+1].tok == T_DOT):
                    wasfunc = True
                    start = self.current_token.loc.copy()
                    var = self.getVariable(self.current_token.value)
                    if(var == None): throw(UnkownIdentifier(self.current_token))
                    self.advance()
                    member = self.current_token.value
                    offset = member.offset
                    exprtokens.append(Token(T_ID, f"{var.name}.{member.name}",start,self.current_token.end))


            if(not wasfunc):
                exprtokens.append(self.current_token)
            wasfunc=False

            self.advance()

        return exprtokens, instructions


    def evaluateRightsideExpression(self, destination, otyperef=None):
        instructions = ""
        start = self.ctidx
        opens = 1
        comment = ""
        exprtokens = []
        instructions=""

        
        exprtokens, instructions = self.buildExpressionComponents()


        comment = exprtokens
        pf = Postfixer(exprtokens,self)

        



        if(config.DO_DEBUG):
            instructions+=f";{comment}\n\n"
        ins, ot = self.evaluatePostfix(destination, pf.createPostfix())
        instructions += ins

        if(otyperef != None):
            otyperef.load(ot)
        
        return instructions




    def buildDeclaration(self):
        t = self.checkForType()
        

        name = self.checkForId()

        if(self.getVariable(name) != None and not self.getVariable(name).glob):
            throw(VariableRedeclaration(self.tokens[self.ctidx-1], name))

        if(self.compiler.getType(name) != None): throw(UsingTypenameAsVariable(self.tokens[self.ctidx-1]))

        self.addVariable(Variable(t,name))
        var = self.variables[len(self.variables)-1]
        
        var.isptr = t.ptrdepth>0
        if(not var.isptr and var.t.members!=None):
            for v in var.t.members:
                if(isinstance(v, Variable)):
                    
                    self.variables.append(Variable(v.t.copy(),f"{var.name}.{v.name}",offset=var.offset+v.offset,isptr=v.isptr,signed=v.signed))

        sizes = [1]
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
            totalsize = product(sizes)*t.size(0)
            var.stackarrsize = totalsize
            var.isStackarr = True
            var.stacksizes = sizes
            self.stackCounter+=totalsize
            if(self.current_token.tok != T_ENDL): throw(ExpectedToken(self.current_token, ";"))



        

        if(self.current_token.tok == T_ENDL): 
            self.advance()
            return

        if(self.current_token.tok != T_EQUALS): throw(ExpectedToken(self.current_token, " = or ; "))

        self.advance()

        self.addline(self.evaluateRightsideExpression(EC.ExpressionComponent(var, var.t, token=self.current_token)))
        
        self.checkSemi()

    def buildBlankfnCall(self):
        instructions, fn = self.buildFunctionCall()
        if(self.current_token.tok == ")"): self.advance()
        if(self.current_token.tok != T_ENDL): throw(ExpectedSemicolon(self.current_token))
        self.addline(instructions)
        self.advance()

    def buildAssignment(self):
        vt = self.current_token
        v = self.getVariable(self.current_token.value)
        self.advance()
        offset = v.offset
        inst = ""
        isptridx = False
        depthreached = 0
        if(v.isStackarr):


            startaddr = ralloc(False)
            inst += f"lea {startaddr}, [rbp-{v.offset}]\n"

            idxr = 0
            while(self.current_token.tok == T_OPENIDX):
                self.advance()
                dsize = v.stacksizes[idxr]*v.t.size(0)
                result = ralloc(False)
                otref = VOID.copy()
                inst+=self.evaluateRightsideExpression( EC.ExpressionComponent(result,INT.copy(),token=vt),otref)  
                if(otref.isflt()): throw(UsingFloatAsIndex(vt))
                if(dsize!=1): inst+=f"imul {result}, {dsize}\n" 
                inst+=f"sub {startaddr}, {result}\n"         
                rfree(result)
                self.advance()
                idxr+=1
            depthreached = idxr

        elif(v.t.ptrdepth > 0):
            startaddr = ralloc(False)
            inst += f"mov {startaddr}, [rbp-{v.offset}]\n"
            idxr=0
            sizes = []
            for i in range((v.t.ptrdepth)):
                sizes.append(8)
            sizes.append(v.t.s)
            while(self.current_token.tok == T_OPENIDX):
                isptridx = True

                self.advance()
                dsize = sizes[idxr]
                result = ralloc(False)
                otref = VOID.copy()
                inst += self.evaluateRightsideExpression( EC.ExpressionComponent(result, INT.copy(),token=vt) ,otref)
                if(otref.isflt()): throw(UsingFloatAsIndex(vt))
                if(dsize!=1): inst+=f"imul {result}, {dsize}\n"
                inst+=f"add {startaddr}, {result}\n"
                rfree(result)
                self.advance()
                idxr+=1
            depthreached = idxr
        elif(v.t.members != None):
            if(self.current_token.tok == T_DOT):
                self.advance()
                if(self.current_token.tok != T_ID): throw(ExpectedIdentifier(self.current_token))
                member = self.current_token.value
                if(not v.t.hasMember(member)): throw(UnkownIdentifier(self.current_token))
                v = self.getVariable(f"{v.name}.{member}")
                offset = v.offset
                self.advance()

        if(self.current_token.tok == T_EQUALS and not v.isStackarr and not isptridx): #normal
            self.advance()

            ev = self.evaluateRightsideExpression(    EC.ExpressionComponent(Variable(v.t,v.name,offset=offset,glob=v.glob),v.t,token=vt)                )
            self.addline(inst)
            self.addline(ev)
        elif(self.current_token.tok == T_EQUALS and v.isStackarr and not isptridx):

            self.advance()
            result = ralloc(v.t.isfltdepth(depthreached))
            inst+=f"push {startaddr}\n"
            ev = self.evaluateRightsideExpression(  EC.ExpressionComponent(result, v.t,token=vt)  )
            if(v.t.size(depthreached) == 1 and not v.t.isfltdepth(depthreached)): result = boolchar_version[result]
            self.addline(inst)
            self.addline(ev)
            self.addline(f"pop {startaddr}")
            if(v.t.isfltdepth(depthreached)):
                self.addline(f"movsd [{startaddr}], {result}\n")
            else:
                self.addline(f"mov [{startaddr}], {result}\n")
            rfree(result)
            rfree(startaddr)
        
        
        
        elif(self.current_token.tok == T_EQUALS and isptridx):
            self.advance()
            result = ralloc(v.t.isfltdepth(depthreached))
            if(v.t.size(depthreached) == 1): result = boolchar_version[result]
            newt = v.t.copy()
            newt.ptrdepth-=1
            inst+=f"push {startaddr}\n"

            ev = self.evaluateRightsideExpression( EC.ExpressionComponent(result,newt,token=vt) )
            self.addline(inst)
            self.addline(ev)
            self.addline(f"pop {startaddr}")

            if(newt.isflt()):
                self.addline(f"movsd [{startaddr}], {result}\n")
            else:
                self.addline(f"mov [{startaddr}], {result}\n")
            rfree(result)
            rfree(startaddr)


        else: # ++ or -- shortcuts
            o1 = self.current_token.value
            self.advance()
            if(self.current_token.tok != "+" and self.current_token.tok != "-"):
                throw(UnkownExpressionShortcut(self.current_token))
            o1 += self.current_token.value
            if(o1 != "--" and o1 != "++"):
                throw(UnkownExpressionShortcut(self.current_token))
            
            expr = [EC.ExpressionComponent(v,v.t),EC.ExpressionComponent(1,INT.copy(),constint=True),EC.ExpressionComponent(o1[0],o1,isoperation=True)]
            instr,o = self.evaluatePostfix(EC.ExpressionComponent( v, v.t.copy() , token=vt),expr)
            inst+=instr
            self.addline(inst)
            self.advance()

        if(self.current_token.tok!=T_CLSP): self.checkSemi()



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
                throw(UnexpectedToken(self.current_token))
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