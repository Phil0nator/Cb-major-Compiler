from globals import *
from Variable import *
from DType import *
from Token import *
from Error import *
from Postfixer import *
import Optimizer
import config
import time
import ExpressionComponent as EC


def product(arr):
    total = arr[0]
    for i in arr[1:]:
        total*=i
    return total




## TODO:
#   Nested functions are very broken
#       (maybe rewrite)




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
            instr = self.evaluateRightsideExpression(EC.ExpressionComponent(sse_return_register, DOUBLE.copy))
        else:
            instr = self.evaluateRightsideExpression(EC.ExpressionComponent(norm_return_register,INT.copy()))
        self.addline(instr)
        self.addline(f"jmp {self.getClosingLabel().replace(':','')}")

    def buildIfStatement(self):
        self.advance()
        if(self.current_token.tok != T_OPENP): throw(ExpectedToken(self.current_token,"("))
        self.advance()

        preInstructions = self.evaluateRightsideExpression(EC.ExpressionComponent(rax, BOOL.copy()))
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
        cmpinst = self.evaluateRightsideExpression(EC.ExpressionComponent(rax, BOOL.copy()))
        cmpinst += f"{check_fortrue}je {startlabel}\n"

        if(self.current_token.tok != T_OPENSCOPE): throw(ExpectedToken(self.current_token, "{"))
        self.advance()
        self.beginRecursiveCompile()
        self.addline(f"{comparisonlabel}:")
        self.addline(cmpinst)
        self.advance()



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
            self.advance()


        fn = self.getFunction(fid,types)
        self.ctidx = start-1
        self.advance()

        pcount = len(fn.parameters)


        normsused = 0
        sseused = 0
        
        for p in types:
            if p.isflt():
                sseused+=1
            else:
                normsused+=1
        ssevarsforrax = sseused
        ssetotal = sseused
        normtotal = normsused

        for i in range(pcount, 0, -1):
            if(fn.parameters[i-1].isflt()):
                
                instructions+=self.evaluateRightsideExpression(EC.ExpressionComponent( sse_parameter_registers[ssetotal-sseused], fn.parameters[i-1].t.copy()))
                sseused-=1
            else:
                instructions+=self.evaluateRightsideExpression(EC.ExpressionComponent( norm_parameter_registers[normtotal-normsused], fn.parameters[i-1].t.copy()))
                normsused-=1
        
            if(self.current_token.tok == ","):
                    self.advance()
        
        if(self.current_token.tok != T_ENDL):
            self.advance()
        



        instructions += f"mov {rax}, {ssevarsforrax}\n"


        instructions+=fncall(fn)
        return instructions, fn

        
    def performCastAndOperation(self,a, b, op, o):
        instr = ""
        apendee = None
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
            instr+=doOperation(areg, breg, op, a.type.signed or b.type.signed)
            apendee = (EC.ExpressionComponent(areg,a.type))
            rfree(breg)
        else: #situation is different when casting is directional
            if(not typematch(a.type,b.type)):
                throw(TypeMismatch(self.current_token, a.type, b.type))
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
            
            instr+=doOperation(creg,newcoreg,op, caster.type.signed)
            apendee = (EC.ExpressionComponent(creg,caster.type))
            rfree(newcoreg)
            rfree(coreg)

        
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
                stack.append(e)
        final = stack.pop()
        o = final.type.copy()
        
        instr+=";------------\n"
        if(dest == "AMB"):
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
                cst = f"cvtsi2sd {valueOf(castdest)}, {valueOf(final.accessor)}\n"
            elif(not dest.type.isflt() and final.type.isflt()):
                cst = f"cvttsd2si {valueOf(castdest)}, {valueOf(final.accessor)}\n"
            else:
                cst = False
            
            
            if(cst!=False):
                instr+=cst
                if(twoStep):
                    instr+=loadToReg(dest.accessor, castdest)
            
            else:
                source = final
                if(isinstance(final.accessor, Variable)):
                    instr+=loadToReg(castdest, final.accessor)
                    source = castdest
                instr+=loadToReg(dest.accessor,source.accessor)
            
            rfree(castdest)
            rfreeAll()


        return instr, o





    def evaluateRightsideExpression(self, destination, otyperef=None):
        instructions = ""
        start = self.ctidx
        opens = 1
        comment = ""
        exprtokens = []
        while opens>0 and self.current_token.tok != T_ENDL and self.current_token.tok != T_COMMA:
            if(self.current_token.tok == T_CLSP):opens-=1
            elif(self.current_token.tok == T_OPENP):opens+=1




            exprtokens.append(self.current_token)


            self.advance()



        comment = exprtokens
        pf = Postfixer(exprtokens,self)

        


        instructions=""
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
        self.addVariable(Variable(t,name))
        var = self.variables[len(self.variables)-1]
        var.isptr = t.ptrdepth>0
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

        self.addline(self.evaluateRightsideExpression(EC.ExpressionComponent(var, var.t)))
        

    def buildBlankfnCall(self):
        instructions, fn = self.buildFunctionCall()
        if(self.current_token.tok != T_ENDL): throw(ExpectedSemicolon(self.current_token))
        self.addline(instructions)
        self.advance()

    def buildAssignment(self):
        v = self.getVariable(self.current_token.value)
        self.advance()
        offset = v.offset
        inst = ""
        if(self.current_token.tok == T_OPENIDX):
            inst = self.evaluateRightsideExpression(EC.ExpressionComponent("rbx",INT.copy()))
            inst+=(f"mov {rax}, {(offset)}\n")
            inst+=(f"sub {rax}, {rbx}\n")
            offset = "rax"
        
        self.advance()
        ev = self.evaluateRightsideExpression(    EC.ExpressionComponent(Variable(v.t,v.name,offset=offset),v.t)                )
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

        
        optimizer = Optimizer.Optimizer(self.asm)
        optimizer.optimize(config.__oplevel__)

    def __repr__(self):
        return f"[ function {self.returntype} {self.name}( {self.parameters} ) ]"