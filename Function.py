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

# multiply all items in an array
def product(arr):
    total = arr[0]
    for i in arr[1:]:
        total*=i
    return total


###################################################
#
#   The Function class is where the bulk of compilation occurs.
#   Function objects are isolated and created by compiler objects.
#
#
#
#####################################################
class Function:
    def __init__(self, name, parameters, returntype, compiler, tokens):
        self.name = name                        # fn name
        self.parameters = parameters            # list:Variable parameters
        self.returntype=returntype              # DType: return type
        self.compiler = compiler                # Parent
        self.tokens = tokens                    # All Tokens
        self.asm = "\n"                         # raw assembly output

        self.stackCounter = 8                   # counter to keep track of stacksize
        self.variables = []                     # all local variables

        self.continues = []                     # stack containing labels to jump to if the "continue" keyword is used
        self.breaks = []                        # stack containing labels to jump to if the "break" keyword is used


        self.current_token = self.tokens[0]     # current token
        self.ctidx = 0                          # corrent token index

    def advance(self):                              # advance token
        self.ctidx+=1
        self.current_token = self.tokens[self.ctidx]

    def getCallingLabel(self):                      # get the raw asm label used to call this function
        return functionlabel(self).replace(":","").replace("\n","")

    def checkSemi(self):                            # check current token for semicolon
        if(self.current_token.tok != T_ENDL): throw(ExpectedSemicolon(self.current_token))
        self.advance()

    def getClosingLabel(self):                      # get raw asm label used to denote the end of this function
        return function_closer(self.getCallingLabel()).split("\n")[0]

    def getVariable(self, q):                       # get a variable of name q from first local then global scope if necessary

        for v in self.variables:
            if (v.name == q):
                return v
        
        globq = self.compiler.getGlob(q)
        if(globq!=None): return globq
        return None

    def addVariable(self, v):                       # add a given variable, and set its stack offset

        v.offset = self.stackCounter
        #self.stackCounter += v.t.size(0)
        if v.t.size(0) <= 8: self.stackCounter += 8
        else: self.stackCounter += v.t.size(0)
        self.variables.append(v)


    def addline(self, l):                           # add a line of assembly to raw
        self.asm+=l+"\n"
    
    def addcomment(self, c):
        self.asm+=";"+c+"\n"

    def isbeforeTracker(self, value):
        for t in self.tokens[self.ctidx:]:
            if t.tracker == value:
                return True
        return False

    def getFunction(self, fn, types):               # get function with name fn and datatypes types, or a suitable replacement (casting)

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
                




    def checkForId(self):               # check next tokens for ID

        if(self.current_token.tok != T_ID): throw(ExpectedIdentifier(self.current_token))

        id= self.current_token.value
        self.advance()
        return id



    def checkForType(self):             # check next tokens for Type
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





    def loadParameters(self):                   # load parameters into memory (first instructions) 
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

    

    def createClosing(self):                    # create end of the function

        self.addline(function_closer(self.getCallingLabel()))

    def buildReturnStatement(self):             # build a return statement
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
        self.advance()
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




    def buildKeywordStatement(self):                    # build a statement that starts with a keyword
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
                if(fn.parameters[i].t.csize() != 8):
                    result = ralloc(False)
                else:
                    result =  norm_parameter_registers[normused]
                ec = EC.ExpressionComponent(result, fn.parameters[i].t.copy(),token=self.current_token)
                instructions+=self.evaluateRightsideExpression(ec)
                normused+=1
                
                if(fn.parameters[i].t.csize() != 8):
                    if(fn.parameters[i].t.csize() == 1):
                        instructions+=f"mov {boolchar_version[norm_parameter_registers[normused]]}, {boolchar_version[result]}\n"
                    elif(fn.parameters[i].t.csize() == 4):
                        instructions += f"mov {dwordize(norm_parameter_registers[normused])}, {dwordize(result)}\n"
                    elif(fn.parameters[i].t.csize() == 2):
                        instructions += f"mov {small_version[norm_parameter_registers[normused]]}, {small_version[result]}\n"
                    rfree(result)

            if(self.current_token.tok == ","):
                    self.advance()
        
        if(self.current_token.tok != T_ENDL):
            #self.advance()
            pass



        instructions += f"mov {rax}, {ssevarsforrax}\n"


        instructions+=fncall(fn)
        return instructions, fn

    # (used for rightside evaluation)
    def performCastAndOperation(self,a, b, op, o):                      # Do an operation with a op b -> o:DType
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
            newtype, toConvert = determinePrecedence(a.type, b.type,self)
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



    def evaluatePostfix(self, dest, pfix):                  # evaluate a rightside generated postfix list of EC's
        instr = ""
        stack = []
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
                        if(op == T_PTRACCESS):

                            member = b.accessor
                            memv = a.type.getMember(member)
                            
                            if(memv == None): throw(UnkownIdentifier(b.token))
                            o = memv.t.copy()


                            tmpaddr = ralloc(False)
                            #instr+=f"mov {tmpaddr}, {valueOf(a.accessor)}\n"
                            instr+=loadToReg(tmpaddr, a.accessor)


                            instr+=f"lea {tmpaddr}, [{tmpaddr}+{memv.offset}]\n"
                            if(memv.t.isflt()):
                                rfree(tmpaddr)
                                result = ralloc(True)
                                instr+=f"movsd {result}, [{tmpaddr}]\n"
                                stack.append(EC.ExpressionComponent(result, memv.t.copy(),token=b.token))
                            else:
                                instr+=f"mov {tmpaddr}, [{tmpaddr}]\n"
                                stack.append(EC.ExpressionComponent(tmpaddr,memv.t.copy(),token=b.token))


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
        #TODO: Make own function:
        #       make able to handle different data sizes
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



    def buildExpressionComponents(self):                        # construct expression components from tokens
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
                    depth = 0
                    if(var.isStackarr):
                        idxinstr = ""
                        addr = ralloc(False)
                        idxinstr+=f"lea {addr}, [rbp-{var.offset+var.stackarrsize}]\n"
                        depth = 0
                        while(self.current_token.tok == "["):
                            self.advance()
                            result = ralloc(False)
                            idxinstr+= self.evaluateRightsideExpression(EC.ExpressionComponent(result, INT.copy(),token=self.current_token))
                            if(var.stacksizes[depth] in [1,2,4,8]):
                                idxinstr+=f"lea {addr}, [{addr}+{result}*{var.stacksizes[depth]}]\n"
                            else:
                                idxinstr+=f"imul {result}, {var.stacksizes[depth]}\n"
                                idxinstr+=f"lea {addr}, [{addr}+{result}]\n"
                            rfree(result)
                            depth+=1
                            self.advance()

                        ot = var.t.copy()
                        
                        if(ot.isflt()):
                            rfree(addr)
                            idxinstr+=f"movq {addr}, [{addr}]\n"
                            idxinstr+=f"push {addr}\n"
                        else:
                            rfree(addr)
                            idxinstr+=f"mov {setSize(addr, ot.csize())}, [{addr}]\n"
                            idxinstr+=f"push {addr}\n"
                        instructions+=idxinstr
                        exprtokens.append(Token(T_IDXER,ot,start,self.current_token.start.copy()))

                    else:
                        sizes = []
                        for i in range(var.t.ptrdepth+1):
                            sizes.insert(0,var.t.size(i))
                        idxinstr = ""
                        addr = ralloc(False)
                        idxinstr+=f"mov {addr}, {valueOf(var)}\n"
                        while(self.current_token.tok == "["):
                            self.advance()
                            result = ralloc(False)
                            idxinstr+= self.evaluateRightsideExpression(EC.ExpressionComponent(result,INT.copy(),token=self.current_token))
                            if(sizes[depth] in [1,2,4,8]):
                                idxinstr+=f"lea {addr}, [{addr}+{result}*{sizes[depth]}]\n"
                            else:
                                idxinstr+=f"imul {result}, {sizes[depth]}\n"
                                idxinstr+=f"lea {addr}, [{addr}+{result}]\n"
                            rfree(result)
                            depth+=1
                            self.advance()
                        
                        ot = var.t.copy()
                        ot.ptrdepth -= depth
                        if(ot.isflt()):
                            rfree(addr)
                            idxinstr+=f"movq {addr}, [{addr}]\n"
                            idxinstr+=f"push {addr}\n"
                        else:
                            rfree(addr)
                            idxinstr+=f"mov {setSize(addr, ot.csize())}, [{addr}]\n"
                            idxinstr+=f"push {addr}\n"
                        instructions+=idxinstr
                        exprtokens.append(Token(T_IDXER,ot,start,self.current_token.start.copy()))

                    self.ctidx-=2
                    self.advance()


                elif(self.tokens[self.ctidx+1].tok == T_DOT):
                    wasfunc = True
                    start = self.current_token.start.copy()
                    var = self.getVariable(self.current_token.value)
                    if(var == None): throw(UnkownIdentifier(self.current_token))
                    self.advance()
                    self.advance()
                    member = self.current_token.value
                    memvar = var.t.getMember(member)
                    offset = memvar.offset
                    exprtokens.append(Token(T_ID, f"{var.name}.{memvar.name}",start,self.current_token.end))
                
                """ elif(self.tokens[self.ctidx+1].tok == T_MINUS and self.tokens[self.ctidx+2].tok == ">"):
                    wasfunc = True
                    start = self.current_token.start.copy()
                    var = self.getVariable(self.current_token.value)
                    if(var == None): throw(UnkownIdentifier(self.current_token))
                    self.advance()
                    self.advance()
                    self.advance()
                    member = self.current_token.value
                    memvar = var.t.getMember(member)
                    if(memvar == None): throw(UnkownIdentifier(self.current_token))
                    offset = memvar.offset
                    # exprtokens.append(Token(T_OPENP,T_OPENP,start,start))
                    # exprtokens.append(Token(T_DEREF,T_DEREF,start,start))
                    # exprtokens.append(Token(T_OPENP,T_OPENP,start,start))
                    # exprtokens.append(Token(T_ID, var.name,start,start))
                    # exprtokens.append(Token(T_PLUS,T_PLUS,start,start))
                    # exprtokens.append(Token(T_INT, offset,start,start))
                    # exprtokens.append(Token(T_CLSP,T_CLSP,self.current_token.start,self.current_token.end))
                    # exprtokens.append(Token(T_CLSP,T_CLSP,self.current_token.start,self.current_token.end))
                    exprtokens.append(Token(T_ID, var.name,start,start))
                    exprtokens.append(Token(T_PTRACCESS, T_PTRACCESS, start,start))
                    exprtokens.append(Token(T_AMBIGUOUS, member, start,start)) """
            if(self.tokens[self.ctidx].tok == T_MINUS and self.tokens[self.ctidx+1].tok == ">"):
                wasfunc = True
                self.advance()
                self.advance()
                exprtokens.append(Token(T_PTRACCESS,T_PTRACCESS,self.current_token.start,self.current_token.start))
                exprtokens.append(Token(T_AMBIGUOUS, self.current_token.value,self.current_token.start,self.current_token.start))


            if(not wasfunc):
                exprtokens.append(self.current_token)
            wasfunc=False

            self.advance()

        return exprtokens, instructions


    def evaluateRightsideExpression(self, destination, otyperef=None):                  # evaluate the next tokens and return the asm instructions
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




    def buildDeclaration(self):                     # declare new var
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





    def buildBlankfnCall(self):                 # build function call not in an expression
        instructions, fn = self.buildFunctionCall()
        if(self.current_token.tok == ")"): self.advance()
        if(self.current_token.tok != T_ENDL): throw(ExpectedSemicolon(self.current_token))
        self.addline(instructions)
        self.advance()











    def buildAssignment(self):                  # assign a variable
        vt = self.current_token
        v = self.getVariable(self.current_token.value)
        self.advance()
        offset = v.offset
        inst = ""
        isptridx = False
        depthreached = 0
        isMember = False
        ispMember = False
        if(v.isStackarr):


            startaddr = ralloc(False)
            inst += f"lea {startaddr}, [rbp-{v.offset+v.stackarrsize}]\n"

            idxr = 0
            while(self.current_token.tok == T_OPENIDX):
                self.advance()
                dsize = v.stacksizes[idxr]*v.t.size(0)
                result = ralloc(False)
                otref = VOID.copy()
                inst+=self.evaluateRightsideExpression( EC.ExpressionComponent(result,INT.copy(),token=vt),otref)  
                
                if(otref.isflt()): throw(UsingFloatAsIndex(vt))
                
                if(dsize in [1,2,4,8]):
                    inst+=f"lea {startaddr}, [{startaddr}+{result}*{dsize}]\n"
                else:
                    inst+=f"imul {result}, {dsize}\n" 
                    inst+=f"add {startaddr}, {result}\n"         

                


                rfree(result)
                self.advance()
                idxr+=1
            depthreached = idxr

        elif(v.t.ptrdepth > 0 and self.tokens[self.ctidx+1].tok == T_OPENIDX):
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
                
                if(dsize in [1,2,4,8]): 
                    inst+=f"lea {startaddr}, [{startaddr}+{result}*{dsize}]\n"
                else:
                    inst+=f"imul {result}, {dsize}\n"
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
                isMember = True

            elif(self.current_token.tok == T_MINUS):
                self.advance()

                if(self.current_token.tok == ">"):
                    self.advance()
                    if(self.current_token.tok != T_ID): throw(ExpectedIdentifier(self.current_token))
                    member = self.current_token.value
                    if(not v.t.hasMember(member)): throw(UnkownIdentifier(self.current_token))
                    memv = v.t.getMember(member)
                    startaddr = ralloc(False)
                    inst += f"mov {startaddr}, [rbp-{v.offset}]\n"
                    inst += f"lea {startaddr}, [{startaddr}+{memv.offset}]\n"
                    isptridx = True
                    
                    self.advance()

        
        
        
        
        
        
        if(isMember and self.current_token.tok == T_EQUALS and not v.t.isflt() and v.t.csize() != 8):
            self.advance()

            result = ralloc(False)
            ev = self.evaluateRightsideExpression( EC.ExpressionComponent(result,v.t,token=vt))
            self.addline(inst)
            self.addline(ev)
            if(isMember): 
                if(v.t.csize() == 1):
                    self.addline(f"mov BYTE[rbp-{v.offset}], {boolchar_version[result]}")
                elif(v.t.csize() == 4):
                    self.addline(f"mov DWORD[rbp-{v.offset}], {dword_version[result]}")
                elif(v.t.csize() == 2):
                    self.addline(f"mov WORD[rbp-{v.offset}], {small_version[result]}")
            elif(ispMember):
                if(v.t.csize() == 1):
                    self.addline(f"mov BYTE[{startaddr}], {boolchar_version[result]}")
                elif(v.t.csize() == 4):
                    self.addline(f"mov DWORD[{startaddr}], {dword_version[result]}")
                elif(v.t.csize() == 2):
                    self.addline(f"mov WORD[{startaddr}], {small_version[result]}")
                rfree(startaddr)

            rfree(result)

        elif(ispMember and self.current_token.tok == T_EQUALS):
            self.advance()
            result = ralloc(v.t.isflt())
            ev = self.evaluateRightsideExpression( EC.ExpressionComponent(result,v.t,token=vt))
            self.addline(inst)
            self.addline(ev)
            if(v.t.isflt()):
                self.addline(f"movsd [{startaddr}], {result}\n")
            else:
                self.addline(f"mov [{startaddr}], {result}\n")
            rfree(result)
            rfree(startaddr)




            
        elif(self.current_token.tok == T_EQUALS and not v.isStackarr and not isptridx): #normal
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



    def buildIDStatement(self):             # build statement starting with an ID token
        
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
        



    def beginRecursiveCompile(self):            # recursive main
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



    def compile(self):      # main
        
        self.addline(functionlabel(self))
        self.addline("/*%%ALLOCATOR%%*/")
        self.loadParameters()


        self.beginRecursiveCompile()



        self.asm = self.asm.replace("/*%%ALLOCATOR%%*/", function_allocator(self.stackCounter))
        self.createClosing()


    def __repr__(self):     # pretty print
        return f"[ function {self.returntype} {self.name}( {self.parameters} ) ]"