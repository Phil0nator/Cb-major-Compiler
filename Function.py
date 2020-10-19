from globals import *
from Classes.Variable import *
from Classes.DType import *
from Classes.Token import *
from Classes.Error import *
from Postfixer import *
from ExpressionEvaluator import RightSideEvaluator
from ExpressionEvaluator import LeftSideEvaluator
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

        self.destructor_text = ""

    def advance(self):                              # advance token
        self.ctidx+=1
        self.current_token = self.tokens[self.ctidx]



    def getCallingLabel(self):                      # get the raw asm label used to call this function
        return functionlabel(self).replace(":","").replace("\n","")



    def checkSemi(self):                            # check current token for semicolon
        if(self.current_token.tok != T_ENDL): throw(ExpectedSemicolon(self.current_token))
        self.advance()



    def checkTok(self, tok):                        # check current token for given token
        if(self.current_token.tok != tok): throw(ExpectedToken(self.current_token, tok))
        self.advance()


    def getClosingLabel(self):                      # get raw asm label used to denote the end of this function
        return function_closer(self.getCallingLabel(),None).split("\n")[0]



    def getVariable(self, q):                       # get a variable of name q from first local then global scope if necessary


        for v in self.variables:
            if (v.name == q):
                return v

        local = [v for v in self.variables if v.name == q]
        if(len(local) != 0): return local[0]
        
        globq = self.compiler.getGlob(q)
        if(globq!=None): return globq
        return None


    def addVariable(self, v):                       # add a given variable, and set its stack offset

        v.offset = self.stackCounter
        #self.stackCounter += v.t.size(0)
        if v.t.size(0) <= 8: self.stackCounter += 8
        else: 
            self.stackCounter += v.t.csize()+8
        self.variables.append(v)


    def addline(self, l):                           # add a line of assembly to raw
        #self.asm+=l+"\n"
        self.asm =f"{self.asm}{l}\n"

    def addcomment(self, c):                        # add a comment to the assembly
        self.asm+=";"+c+"\n"




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



    def checkForType(self):             # check next tokens for Type, and return it as a DType 
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
        if(self.destructor_text == ""): self.destructor_text = f"push rax\n{self.destructor_text}\npop rax\n"
        self.addline(function_closer(self.getCallingLabel(), self.destructor_text))


    def buildReturnStatement(self):             # build a return statement
        self.advance()
        if(self.current_token.tok != T_ENDL):
            if(self.returntype.isflt()):
                instr = self.evaluateRightsideExpression(EC.ExpressionComponent(sse_return_register, DOUBLE.copy(), token=self.current_token))
            else:
                instr = self.evaluateRightsideExpression(EC.ExpressionComponent(norm_return_register,INT.copy(),token=self.current_token))
            self.addline(instr)
        self.addline(f"jmp {self.getClosingLabel().replace(':','')}")
        self.checkSemi()



    def buildIfStatement(self):
        self.advance()
        self.checkTok(T_OPENP)
        
        # Build instructions neccessary to evaluate the expression a for example: if ( a ) { ... }
        preInstructions = self.evaluateRightsideExpression(EC.ExpressionComponent(rax, BOOL.copy(),token=self.current_token))
        if(self.current_token.tok == T_CLSP): 
            self.advance()
        
        # pre-determine jump labels:
        postlabel = getLogicLabel("IFPOST")
        jmpafter = getLogicLabel("IFELSE")


        self.continues.append(postlabel)


        preInstructions+= f"{check_fortrue}jne {postlabel}\n"

        self.addline(preInstructions)
        self.checkTok(T_OPENSCOPE)
        
        # compile the body 
        self.beginRecursiveCompile()
        self.addline(f"jmp {jmpafter}")
        self.advance()

        # check for else 
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
                if(self.current_token.tok == T_CLSSCOPE):
                    self.advance()
                self.addline(jmpafter+":\n")

            else:
                self.addline(postlabel+":\n")
                self.addline(jmpafter+":\n")
        else:
            self.addline(postlabel+":\n")
            self.addline(jmpafter+":\n")


        self.continues.pop()


    def buildForloop(self):
        self.advance()
        self.checkTok(T_OPENP)
        
        # pre determine jumping labels:
        toplabel = getLogicLabel("FORTOP")
        comparisonlabel = getLogicLabel("FORCMP")
        updatelabel = getLogicLabel("FORUPDATE")
        endlabel = getLogicLabel("FOREND")


        self.continues.append(comparisonlabel)
        self.breaks.append(endlabel)

        # build the declaration a for example : for ( a; ... ;...) { ... }
        self.buildDeclaration()
        # var is the variable declared above
        var = self.variables[-1]

        # build the instructions neccessary to evaluate the expression b for example: for (a; b; ...){ ... }
        getCondition = self.evaluateRightsideExpression(EC.ExpressionComponent(rax,BOOL.copy(),token=self.current_token))

        self.checkSemi()
        
        self.addline(f"jmp {comparisonlabel}\n")
        self.addline(f"{toplabel}:")
        
        self.addline(f"##FLPCONTENT##")
        
        # build the instructions for the assignment c for example: for (a;b; c){ ... }
        self.buildAssignment()
        
        # use ##FLPCONTENT## marker to re-order the instructions
        updatev = self.asm[self.asm.find("##FLPCONTENT##"):len(self.asm)-1]
        self.asm = self.asm.replace(updatev,"")
        updatev = updatev.replace("##FLPCONTENT##","")


        self.checkTok(T_CLSP)
        self.checkTok(T_OPENSCOPE)
        
        # compile the body of the flp
        self.beginRecursiveCompile()

        # add in the instruction blocks in the correct order
        self.addline(f"{updatelabel}:")
        self.addline(updatev)
        self.addline(f"{comparisonlabel}:\n")
        self.addline(getCondition)
        self.addline(f"{check_fortrue}\nje {toplabel}\n")
        self.addline(f"{endlabel}:")
        self.advance()




        self.continues.pop()
        self.breaks.pop()


        
        

    
    
    def buildWhileloop(self):
        self.advance()
        self.checkTok(T_OPENP)
        
        # pre-determined jump labels
        startlabel = getLogicLabel("WHILESTART")
        comparisonlabel = getLogicLabel("WHILECMP")
        endlabel = getLogicLabel("WHILEEND")
        self.continues.append(comparisonlabel)
        self.breaks.append(endlabel)
        
        self.addline(f"jmp {comparisonlabel}")
        self.addline(f"{startlabel}:")

        # build instructions to evaluate expression a for example: while( a ){ ... }
        cmpinst = self.evaluateRightsideExpression(EC.ExpressionComponent(rax, BOOL.copy(),token=self.current_token))
        cmpinst += f"{check_fortrue}je {startlabel}\n"
        self.advance()
        self.checkTok(T_OPENSCOPE)
        
        # build instructions for the body
        self.beginRecursiveCompile()
        self.addline(f"{comparisonlabel}:")
        self.addline(cmpinst)
        self.addline(f"{endlabel}:")
        self.advance()


        #clean up var
        self.continues.pop()
        self.breaks.pop()


    def buildSIMD(self):
        self.advance()
        
        # check for opsize
        if(self.current_token.tok != T_INT): throw(ExpectedToken(self.current_token, "SIMD opsize"))
        
        op = self.current_token.value
        self.advance()
        
        # check for dtype
        if(self.current_token.tok != T_ID): throw(ExpectedType(self.current_token))
        t = self.compiler.getType(self.current_token.value)
        vsize = t.csize()
        flt = t.isflt()
        if(t == None): throw(UnkownIdentifier(self.current_token))
        self.advance()
        
        self.checkTok(T_OPENP)
        
        # check for the first array
        arr1 = self.getVariable(self.current_token.value)
        if(arr1 == None): throw(UnkownIdentifier(self.current_token))
        self.advance()
        idx1 = ralloc(False)
        
        self.checkTok(T_COMMA)
        
        # build instructions to evaluate for the first given index
        determine_index1 = self.evaluateRightsideExpression(EC.ExpressionComponent(idx1, INT.copy(),token=self.current_token))
        
        self.checkTok(T_CLSP)
        self.checkTok(T_OPENSCOPE)
        
        

        avx1 = avx_ralloc()
        avx1 = avx_correctSize(avx1,op)
        self.addline(determine_index1)
        self.addline(avx_loadToReg(op, avx1, arr1, idx1))
        

        # evaluate the inner operations
        while self.current_token.tok != T_CLSSCOPE:
            
            self.checkTok(T_OPENP)
            
            # check for operator
            opn = self.current_token.tok
            if(not Postfixer.isOperator(None,self.current_token)):
                throw(ExpectedToken(self.current_token, "operator"))
            if( op not in ["+", "-", "*"] and not flt): throw(InvalidSimdOperation(self.current_token,op))
            self.advance()
            self.checkTok(T_COMMA)
            
            # check for array
            arrn = self.getVariable(self.current_token.value)
            if(arrn == None):
                throw(UnkownIdentifier(self.current_token))
            self.advance()
            self.checkTok(T_COMMA)
            
            # build evaluation for the index
            idxn = ralloc(False)
            determine_idxn = self.evaluateRightsideExpression(EC.ExpressionComponent(idxn, INT.copy(), token=self.current_token))
            self.advance()
            avxn = avx_ralloc()


            # fill in instruction blocks
            avxn = avx_correctSize(avxn, op)
            self.addline(determine_idxn)
            self.addline(avx_loadToReg(op, avxn, arrn, idxn))
            self.addline(avx_doToReg(opn, op, vsize, avx1, avxn, flt))

            avx_rfree(avxn)
            rfree(idxn)




        self.advance()
        self.checkTok(T_OPENP)
        # check destination array
        destarr = self.getVariable(self.current_token.value)
        if(destarr == None): throw(UnkownIdentifier(self.current_token))
        self.advance()
        self.checkTok(T_COMMA)
        
        # evaluate destination index
        determineidxf = self.evaluateRightsideExpression(EC.ExpressionComponent(idx1, INT.copy(),token=self.current_token)) 
        self.checkTok(T_CLSP)
        
        self.checkSemi()

        # fill in instruction blocks
        self.addline(determineidxf)
        self.addline(avx_dropToAddress(op,avx1,destarr,idx1))

        rfree(idx1)
        avx_rfree(avx1)
        
    
    def buildASMBlock(self): # build inline assembly block
        self.advance()
        self.checkTok(T_OPENSCOPE)
        
        # assembly instructions are stored as a string token
        if(self.current_token.tok != T_STRING): throw(ExpectedToken(self.current_token, "Assembly String"))

        content = self.current_token.value
        content = content.replace("\t", "").strip()

        self.addline(content)

        self.advance()

        self.checkTok(T_CLSSCOPE)
        


    def buildKeywordStatement(self):                    # build a statement that starts with a keyword
        word = self.current_token.value
        
        # inline assembly:
        if(word == "__asm"):
            self.buildASMBlock()
        elif(word == "return"):
            self.buildReturnStatement()
        elif(word == "unsigned"):
            s = self.current_token
            self.advance()
            self.buildDeclaration()
            v = self.variables[-1]
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
            if(len(self.breaks)==0): throw(UnmatchedBreak(self.current_token))
            l = self.breaks[-1]
            self.addline(f"jmp {l}\n")
            self.advance()
            self.checkSemi()


        elif(word == "continue"):
            l = self.continues[-1]
            self.addline(f"jmp {l}\n")
            self.advance()
            self.checkSemi()

        elif(word == "__simd"):
            self.buildSIMD()

        else:
            self.advance()


    def buildFunctionCall(self):       
        # function name             
        fid = self.current_token.value
        # token of function name
        fnstartt = self.current_token
        # placeholder
        fn = None
        instructions = ""

        self.advance()
        self.checkTok(T_OPENP)
        

        types = []

        start = self.ctidx
        # build parameters, without storing instructions in order to determine the datatypes, and place them in types[]
        while self.current_token.tok != ")" and self.current_token.tok != T_ENDL:
            o = VOID.copy()
            tmp = self.evaluateRightsideExpression("AMB", o)
            
            if(self.current_token.tok == ","):
                self.advance()
            types.append(o)
        
        # using the fn name, and the parameter types find the actual function object best suited for this call
        fn = self.getFunction(fid,types)
        self.ctidx = start-1
        self.advance()
        if(fn == None):
            throw(UnkownFunction(fnstartt,fid,types))
        pcount = len(fn.parameters)

        # build actual parameter-loading instructions using exact datatypes
        sseused = 0
        
        for p in types:
            if p.isflt():
                sseused+=1

        # track the number of normal, and sse registers used in parameter loading
        ssevarsforrax = sseused
        sseused = 0
        normused = 0






        # for each parameter
        for i in range(pcount):

            # if the parameter is a float, load to SSE register
            if(fn.parameters[i].isflt()):
                
                instructions+=self.evaluateRightsideExpression(EC.ExpressionComponent( sse_parameter_registers[sseused], fn.parameters[i].t.copy(), token=self.current_token))
                sseused+=1
            # else, load to normal register of the correct size
            else:
                # determine size:
                if(fn.parameters[i].t.csize() != 8):
                    result = ralloc(False)
                else:
                    result =  norm_parameter_registers[normused]
                ec = EC.ExpressionComponent(result, fn.parameters[i].t.copy(),token=self.current_token)
                # build main instructions
                instructions+=self.evaluateRightsideExpression(ec)
                # finalize with mov of correct size
                if(fn.parameters[i].t.csize() != 8):
                    if(fn.parameters[i].t.csize() == 1):
                        instructions+=f"mov {boolchar_version[norm_parameter_registers[normused]]}, {boolchar_version[result]}\n"
                    elif(fn.parameters[i].t.csize() == 4):
                        instructions += f"mov {dwordize(norm_parameter_registers[normused])}, {dwordize(result)}\n"
                    elif(fn.parameters[i].t.csize() == 2):
                        instructions += f"mov {small_version[norm_parameter_registers[normused]]}, {small_version[result]}\n"
                    instructions+=maskset(norm_parameter_registers[normused],fn.parameters[i].t.csize())
                    rfree(result)
                normused+=1

            if(self.current_token.tok == ","):
                    self.advance()
        
        if(self.current_token.tok != T_ENDL):
            #self.advance()
            pass


        # follow c varargs standard:
        # (number of sse registers used is stored in RAX before a function call)
        instructions += f"mov {rax}, {ssevarsforrax}\n"

        # actual 'call' instruction
        instructions+=fncall(fn)
        return instructions, fn

    
    



    def buildExpressionComponents(self):                        # construct expression components from tokens
        exprtokens= []
        opens = 1
        instructions = ""
        wasfunc = False

        # The tokens: ; , = += -= *= /= etc... will mark the end of an expression
        while opens>0 and self.current_token.tok != T_ENDL and self.current_token.tok != T_COMMA and self.current_token.tok not in SETTERS:

            # maintain track of open/close parenthesis
            if(self.current_token.tok == T_CLSP):opens-=1
            elif(self.current_token.tok == T_OPENP):opens+=1

            if(opens <=0): break

            # since function calls have the highest precedence in an expression, they can be called 
            #   before the rest of the expression is evaluated.
            #   Their return values will be pushed tot he stack, and the ExpressionEvaluator will be able to pop
            #   these off later into the ralloc'd scratch registers.
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
               
               
                # Member variables accessed from stack based structures can be abstracted as Variable objects
                #   because they are effectively stored the same.
                elif(self.tokens[self.ctidx+1].tok == T_DOT):
                    wasfunc = True
                    start = self.current_token.start.copy()
                    var = self.getVariable(self.current_token.value)
                    if(var == None): throw(UnkownIdentifier(self.current_token))
                    self.advance()
                    self.advance()
                    member = self.current_token.value
                    memvar = var.t.getMember(member)
                    if(memvar == None): throw(UnkownIdentifier(self.current_token))
                    offset = memvar.offset
                    exprtokens.append(Token(T_ID, f"{var.name}.{memvar.name}",start,self.current_token.end))
                
                

            # if one of the above special conditions was true, there is no need to add the actual
            #   current token.
            if(not wasfunc):
                exprtokens.append(self.current_token)
            wasfunc=False

            self.advance()

        return exprtokens, instructions


    def evaluateRightsideExpression(self, destination, otyperef=None):                  # evaluate the next tokens and return the asm instructions
        instructions = ""
        comment = ""
        exprtokens = []

        # get tokens, and instructions 
        exprtokens, instructions = self.buildExpressionComponents()

        # using __repr__()
        comment = exprtokens

        # \see Postfixer
        pf = Postfixer(exprtokens,self)

        



        if(config.DO_DEBUG):
            instructions+=f";{comment}\n\n"
        
        # \see RightSideEvaluator
        ev = RightSideEvaluator(self)

        # get instructions, and returntype of the now postifixed equation
        ins, ot = ev.evaluate(destination, pf.createPostfix())
        instructions += ins

        # load returntype properties to the given reference
        if(otyperef != None):
            otyperef.load(ot)
        
        return instructions


    def evaluateLeftsideExpression(self):       # evaluate the destination for a rightside expression.
        instructions = ""
        comment = ""
        exprtokens = []
        # basically the same as rightside evaluator, but uses LeftSideEvaluator class for the actual
        #   instruction building

        exprtokens, instructions = self.buildExpressionComponents()


        comment = exprtokens
        pf = Postfixer(exprtokens,self)

        if(config.DO_DEBUG):
            instructions+=f";{comment}\n"
        
        ev = LeftSideEvaluator(self)
        ins, output = ev.evaluate(pf.createPostfix())
        instructions+=ins

        return instructions, output



    def createDestructor(self, var):
        # create automatic destructors before the return statement
        if(var.t.destructor == None):
            return ""
        call_label = functionlabel( var.t.destructor )
        if(var.t.ptrdepth > 0):
            params = f"mov {rdi}, {valueOf(var)}\n"
        else:
            params = f"lea {rdi}, [rbp-{var.offset+var.t.csize()}]\n"
        instructions = f"{params}call {call_label.replace(':','')}\n"
        return instructions


    def buildDeclaration(self):                     # declare new var
        
        
        t = self.checkForType()
        

        name = self.checkForId()

        # check if variable exists already
        if(self.getVariable(name) != None and not self.getVariable(name).glob):
            throw(VariableRedeclaration(self.tokens[self.ctidx-1], name))

        # check if varname is a datatype
        if(self.compiler.getType(name) != None): throw(UsingTypenameAsVariable(self.tokens[self.ctidx-1]))

        # add variable
        self.addVariable(Variable(t,name))
        # pull variable back out from the array in order to determine its offset 
        # which is set by self.addVariable
        var = self.variables[-1]
        var.isptr = t.ptrdepth>0


        # if the variable is a stack-based structure,
        #   add its member variables too.
        if(not var.isptr and var.t.members!=None):
            for v in var.t.members:
                if(isinstance(v, Variable)):
                    
                    self.variables.append(Variable(v.t.copy(),f"{var.name}.{v.name}",offset=var.offset+var.t.csize()-v.offset,isptr=v.isptr,signed=v.signed))
                    self.addline(f"mov {valueOf(self.variables[-1])}, 0") # initialize to null
            

            # if the declaration includes a constructor, call it with the correct parameters
            if(self.current_token.tok == T_OPENP):
                # constructor
                self.advance()
                fnt = var.t.constructor
                if(fnt == None): throw(UnkownFunction(self.current_token,f"{var.t.name}.constructor",[None]))
                
                
                
                # similar steps as for function calls, just taking first parameter as (DType* this)
                # \see self.buildFunctionCall
                
                call_label = fncall(fnt)
                self.addline(f"lea {rdi}, [rbp-{var.offset+var.t.csize()}]\n")
                normsused = 1
                sseused = 0
                for p in fnt.parameters[1:]:
                    if(p.t.isflt()):
                        self.addline(self.evaluateRightsideExpression(EC.ExpressionComponent( sse_parameter_registers[sseused], p.t.copy() )))

                        sseused+=1
                    else:
                        self.addline(self.evaluateRightsideExpression(EC.ExpressionComponent( norm_parameter_registers[normsused], p.t.copy() )))
                        normsused+=1
                    self.advance()
                self.ctidx-=2
                self.advance()
                self.checkTok(T_CLSP)
                
                self.addline(call_label)
                self.checkSemi()
                self.destructor_text+= self.createDestructor(var)
                return

        sizes = [1]
        isarr = False


        # if it is a stack-based structure, and it has a destructor
        #      add it's destructor to the end of the function
        if(not isIntrinsic(var.t.name) and var.t.destructor != None):
            
            self.destructor_text+= self.createDestructor(var)

        # check for stack based array declaration
        while self.current_token.tok == "[":
            isarr=True
            self.advance()
            if self.current_token.tok != T_INT: throw(ExpectedToken(self.current_token, "constexpr"))
            size = self.current_token.value
            sizes.append(size)
            self.advance()
            self.checkTok(T_CLSIDX)
            

        if(isarr):
            totalsize = product(sizes)*t.size(0)
            var.stackarrsize = totalsize
            var.isStackarr = True
            var.stacksizes = sizes
            self.stackCounter+=totalsize
            if(self.current_token.tok != T_ENDL): throw(ExpectedToken(self.current_token, ";"))



        

        # check for same-line assignment, or not
        if(self.current_token.tok == T_ENDL): 
            self.advance()
            return

        if(self.current_token.tok != T_EQUALS): throw(ExpectedToken(self.current_token, " = or ; "))

        self.advance()


        self.addline(self.evaluateRightsideExpression(EC.ExpressionComponent(var, var.t, token=self.current_token)))
        
        self.checkSemi()





    def buildBlankfnCall(self):                 # build function call not in an expression
        #\see self.buildFunctionCall()
        instructions, fn = self.buildFunctionCall()
        if(self.current_token.tok == ")"): self.advance()
        self.checkSemi()
        
        
        self.addline(instructions)











    def buildAssignment(self):                  # assign a variable

        inst = ""


        # evaluate the destination    
        insters, dest = self.evaluateLeftsideExpression()
        self.addline(insters)
        setter = self.current_token
        self.advance()

        # register to hold assignment value
        value = ralloc(dest.type.isflt())

        # evaluate assignment value into 'value' register
        ev = self.evaluateRightsideExpression(EC.ExpressionComponent(value, dest.type,token=dest.token))
        
        
        
        self.addline(inst)
        self.addline(ev)

        
        if(setter.tok == T_EQUALS): #normal
            self.addline(loadToPtr(dest.accessor,value))
        
        # there is a setter shortcut of some kind. EX: +=, -=, /= etc...
        else:
            op = setter.tok[0]
            cmd = ""
            if(op == "+"):
                cmd = "add"
            elif(op == "-"):
                cmd = "sub"
            # add extra instructions for the shortcut
            
            if(dest.type.isflt() and dest.isRegister()):
                x = ralloc(True)
                tmp = ralloc(True)
                self.addline(f"movsd {tmp}, [{valueOf(dest.accessor)}]")
                self.addline(f"{cmd+'sd'} {tmp}, {value}\n")
                self.addline(f"movsd [{valueOf(dest.accessor)}], {tmp}\n")
                rfree(tmp)
                rfree(x)
            elif(dest.type.isflt()):
                x = ralloc(True)
                tmp = ralloc(True)

                self.addline(f"movsd {tmp}, {valueOf(dest.accessor)}")
                self.addline(f"{cmd+'sd'} {tmp}, {value}\n")
                self.addline(f"movsd {valueOf(dest.accessor)}, {tmp}\n")
                rfree(tmp)
                rfree(x)
            else:
                self.addline(f"{cmd} {valueOf(dest.accessor, exactSize=True)}, {setSize(value, dest.type.csize())}\n")
        


        rfree(value)
        rfree(dest.accessor)
        if(self.current_token.tok == T_ENDL):
            self.advance()
        
        



    def buildIDStatement(self):             # build statement starting with an ambiguous ID token
        
        id = self.current_token.value

        if (self.compiler.isType(id) and self.tokens[self.ctidx+1].tok != T_OPENP):
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
        opens = 1 # maintain track of open and close scopes ("{, }")
        while opens > 0 and self.current_token.tok != T_EOF:

            if(self.current_token.tok == T_CLSSCOPE): opens-=1




            elif(self.current_token.tok == T_KEYWORD):
                # keyword statement
                self.buildKeywordStatement()


            elif (self.current_token.tok == T_ID):
                # ID initiated statement
                self.buildIDStatement()

            elif(self.current_token.tok in [T_DEREF,T_OPENP]):
                self.buildAssignment()


            else:
                pass # ambiguous statement
                throw(UnexpectedToken(self.current_token))
                self.advance()



    def compile(self):      # main
        
        self.addline(functionlabel(self)) # label
        self.addline("/*%%ALLOCATOR%%*/") # stack allocator (size undetermined at this point)
        self.loadParameters()             # parameters


        self.beginRecursiveCompile()      # body



        self.asm = self.asm.replace("/*%%ALLOCATOR%%*/", function_allocator(self.stackCounter)) # fill in allocator with real value
        #self.addline(self.destructor_text)
        self.createClosing()              # return, destructors, stack frame closing


    def __repr__(self):     # pretty print
        return f"[ function {self.returntype} {self.name}( {self.parameters} ) ]"