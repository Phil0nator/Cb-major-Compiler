from Declaration import *
from Token import *
from errors import *
from constants import *
from Struct import *
from FunctionOptimizer import *
'''
#The function class is where most things are compiled: the body of functions;
#Function objects are constructed by the compiler, and then sent to compile here.
#The Function object looks through a list of its tokens line by line, and depending on how the line begins it will determine 
    what kind of statement it needs to create (variable declaration, if, etc...)
#All expressions (parameters, assignements, etc...) will be passed through the bulky evaluateExpression() function, which handles the bulk of math operations
#xmm10 is defined as the float transit register
#evaluateExpression() outlines other register uses


#Each different type of statement has its own member function designed to construct it.
'''
class Function:
    def __init__(self,name,params,tokens, compiler, types):
        self.tokens = tokens
        self.types = types
        self.name = name
        if(name == "main"):
            self.name = "m"
        self.params = params
        self.compiler = compiler
        self.ret = "var"
        
        self.header = self.name+":"
        self.allocator = ""
        self.closer = "__%s__leave_ret_:\nleave\nret\n"%self.name
        self.bodytext = ""
        self.isFast = False
        self.allocationCounter = 8
        self.allocationoffset = 0
        self.declarations = []

        self.intexprs = 0
        self.fltexprs = 0

        self.blncmpcounter =0


        self.forstack = []

        self.ifcounter = 0

        self.current_token = self.tokens[0]
        self.ct_idx = 0
    """
    #add a line to the body of a function's assembly
    """
    def addline(self, line):
        self.bodytext+=("%s\n"%line)
    """
    #add a new variable declaration, and increment stack ptr
    """
    def appendDeclaration(self, name, isfloat):
        self.declarations.append(Declaration(name,self.allocationCounter,isfloat))
        self.allocationCounter+=8



    def buildFunctionCall(self, id):
        fn_name = id
        #first push the parameter registers in use:
        for i in range(len(self.params)):
            pass
            ###########self.addline("push %s"%parameter_registers[i])

        #collect parameters
        params = []
        types = self.compiler.getFunctionByName(id).types
        

        if(self.current_token.tok == T_CLOSEP): #No parameters
            pass
        else:
            t = types[len(params)] #
            

            if(t == "var"):
                self.evaluation_wrapper(reg=parameter_registers[len(params)])
                params.append(parameter_registers[len(params)])
            elif (t == "Function"):
                self.addline("mov %s, %s"%(parameter_registers[len(params)], self.current_token.value))
                params.append(parameter_registers[len(params)])
            else:
                self.evaluation_wrapper(reg=flt_parameter_registers[len(params)])
                params.append(flt_parameter_registers[len(params)])
            while self.current_token.tok != T_CLOSEP and self.current_token.tok != "->" and self.current_token.tok != T_EOL:

                t = types[len(params)]
                
                if(self.current_token.tok == T_COMMA):
                    self.advance()
                    if(t == "var"):
                        self.evaluation_wrapper(reg=parameter_registers[len(params)])
                        params.append(parameter_registers[len(params)])
                    elif (t == "Function"):
                        self.addline("mov %s, %s"%(parameter_registers[len(params)], self.current_token.value))
                        params.append(parameter_registers[len(params)])
                        self.advance()
                    else:
                        self.evaluation_wrapper(reg=flt_parameter_registers[len(params)])
                        params.append(flt_parameter_registers[len(params)])

                elif(self.current_token.tok == T_ID):
                    if(t == "var"):
                        self.evaluation_wrapper(reg=parameter_registers[len(params)])
                        params.append(parameter_registers[len(params)])
                    elif (t == "Function"):
                        self.addline("mov %s, %s"%(parameter_registers[len(params)], self.current_token.value))
                        params.append(parameter_registers[len(params)])
                        self.advance()
                    else:
                        self.evaluation_wrapper(reg=flt_parameter_registers[len(params)])
                        params.append(flt_parameter_registers[len(params)])
                elif (self.current_token.tok == T_INT or self.current_token.tok == T_FLOAT or self.current_token.tok == "&" or self.current_token.tok == "*"):
                    if(t == "var"):
                        self.evaluation_wrapper(reg=parameter_registers[len(params)])
                        params.append(parameter_registers[len(params)])
                    elif (t == "Function"):
                        self.addline("mov %s, %s"%(parameter_registers[len(params)], self.current_token.value))
                        params.append(parameter_registers[len(params)])
                        self.advance()
                    else:
                        self.evaluation_wrapper(reg=flt_parameter_registers[len(params)])
                        params.append(flt_parameter_registers[len(params)])

                    
                else:
                    throw(InvalidParameter(self.current_token.start,self.current_token.end,self.current_token.value, self.current_token.tok))
        #params are filled
        self.addline("call "+fn_name)
        
        if(len(params) == 0):
            for i in range(len(self.params)):
                pass
                ##########self.addline("pop %s"%parameter_registers[len(self.params)-(i+1)])
            
            

        if(self.current_token.tok == ")"):
            self.advance()#move past ')'
        
        
        if(self.current_token.tok == "->"): #use return value
            self.advance()
            if(self.current_token.tok != T_ID):
                throw(InvalidFunctionReturnDestination(self.current_token.start,self.current_token.end,self.current_token.value, self.current_token.tok))

            if(self.compiler.globalExists( self.current_token.value ) ):
                if(self.compiler.globalIsFloat(self.current_token.value)):
                    self.addline("movss %s, xmm8"%value_of_global(self.current_token.value, self.compiler).replace("QWORD", ""))

                else:
                    self.addline("mov %s,r8"% value_of_global(self.current_token.value, self.compiler) )
            else:
                if(self.getDeclarationByID(self.current_token.value).isfloat):
                    self.addline("movss [rbp-%s], xmm8"%hex(self.getDeclarationByID(self.current_token.value).offset))
                else:
                    self.addline(place_value_from_reg(self.getDeclarationByID(self.current_token.value).offset, "r8"))
        for i in range(len(self.params)):
            pass
            #########self.addline("pop %s"%(parameter_registers[len(self.params)-(i+1)]))
        
        self.advance() # end the line

    def buildArrayIndexer(self, id):
        self.evaluation_wrapper(reg="rax") #store index in rax
        
        self.addline("mov r15, 0x8")
        self.addline("mul r15") #account for sizeof(var)

        decl = self.getDeclarationByID(id)
        
        if(decl.isarr):
            self.addline("mov rbx, rbp")
            self.addline("sub rbx, %s"%hex(decl.offset))
        else:
            self.addline(load_value_toreg(self.getDeclarationByID(id).offset, "rbx")) #store origin in rbx
        
        
        
        self.advance()
        
        if(self.current_token.tok == "->"):
            self.advance()


            if(self.current_token.tok != T_ID):
                throw(InvalidFunctionReturnDestination(self.current_token.start,self.current_token.end,self.current_token.value, self.current_token.tok))

            if(self.compiler.globalExists( self.current_token.value ) ):
                if(self.compiler.globalIsFloat(self.current_token.value)):
                    self.addline("movss %s, [rbx+rax]"%value_of_global(self.current_token.value, self.compiler).replace("QWORD", ""))

                else:
                    self.addline("mov %s,[rbx+rax]"% value_of_global(self.current_token.value, self.compiler) )
            else:
                if(self.getDeclarationByID(self.current_token.value).isfloat):

                    
                    self.addline("movss xmm10, [rbx+rax]")
                    self.addline("movss [rbp-%s], xmm10"%self.getDeclarationByID(self.current_token.value).offset)
                
                else:
                    #self.addline(place_value_from_reg(self.getDeclarationByID(self.current_token.value).offset, "[rbx+rax]"))
                    self.addline("mov r15,QWORD [rbx+rax]")
                    self.addline("mov QWORD [rbp-%s], r15"%hex(self.getDeclarationByID(self.current_token.value).offset))
            self.advance()
            return


        if(self.current_token.tok != T_EQUALS):
            throw(InvalidVariableAssignment(self.current_token.start,self.current_token.end,self.current_token.value,self.current_token.tok))

        self.advance()
        if(self.current_token.tok == T_KEYWORD and self.current_token.value == "float"):
            self.advance()
            self.evaluation_wrapper(reg="xmm10")
            self.addline("movss [rbx+rax], xmm10")
            return
        
        self.evaluation_wrapper(reg="r15")
        self.addline("mov QWORD [rbx+rax], r15")


    def buildPointerAssignment(self, id):
        self.evaluation_wrapper(reg="rax") #store index in rax
        self.addline(load_value_toreg(self.getDeclarationByID(id).offset, "rbx")) #store origin in rbx
        self.advance()
        



        if(self.current_token.tok == "->"):
            self.advance()


            if(self.current_token.tok != T_ID):
                throw(InvalidFunctionReturnDestination(self.current_token.start,self.current_token.end,self.current_token.value, self.current_token.tok))

            if(self.compiler.globalExists( self.current_token.value ) ):
                if(self.compiler.globalIsFloat(self.current_token.value)):
                    self.addline("movss %s, [rbx+rax]"%value_of_global(self.current_token.value, self.compiler).replace("QWORD", ""))

                else:
                    self.addline("mov %s,[rbx+rax]"% value_of_global(self.current_token.value, self.compiler) )
            else:
                if(self.getDeclarationByID(self.current_token.value).isfloat):
                    self.addline("movss xmm10, [rbx+rax]")
                    self.addline("movss [rbp-%s], xmm10"%self.getDeclarationByID(self.current_token.value).offset)
                
                else:
                    #self.addline(place_value_from_reg(self.getDeclarationByID(self.current_token.value).offset, "[rbx+rax]"))
                    self.addline("mov r15,QWORD [rbx+rax]")
                    self.addline("mov QWORD [rbp-%s], r15"%hex(self.getDeclarationByID(self.current_token.value).offset))
            self.advance()
            return




        if(self.current_token.tok != T_EQUALS):
            throw(InvalidVariableAssignment(self.current_token.start,self.current_token.end,self.current_token.value,self.current_token.tok))

        self.advance()
        if(self.current_token.tok == T_KEYWORD and self.current_token.value == "float"):
            self.advance()
            self.evaluation_wrapper(reg="xmm10")
            self.addline("movss [rbx+rax], xmm10")
            return
        
        self.evaluation_wrapper(reg="r15")
        self.addline("mov QWORD [rbx+rax], r15")




    def buildPropertyAssignment(self, id):
        if(not "." in self.name): throw(InvalidMemberAccess(self.current_token.start,self.current_token.end,self.current_token.value,self.current_token.tok))
        structname = self.name.split(".")[0]
        struct = self.compiler.getStructByName(structname)
        if(struct == None):throw(InvalidMemberAccess(self.current_token.start,self.current_token.end,self.current_token.value,self.current_token.tok))
        
        if(self.current_token.tok != T_ID):throw(InvalidMemberAccess(self.current_token.start,self.current_token.end,self.current_token.value,self.current_token.tok))
        addr = struct.getOffsetByMemberName(self.current_token.value)
        
        if(self.compiler.globalExists(id)):
            self.addline("mov r8, ["+id+"]")
        else:
            self.addline(load_value_toreg(self.getDeclarationByID(id).offset, "r8")) #store origin in r8
        
        self.addline("add r8, "+hex(int(addr))) # add offset
        

        self.advance()
        if(self.current_token.tok == "->"):
            self.advance()


            if(self.current_token.tok != T_ID):
                throw(InvalidFunctionReturnDestination(self.current_token.start,self.current_token.end,self.current_token.value, self.current_token.tok))

            if(self.compiler.globalExists( self.current_token.value ) ):
                if(self.compiler.globalIsFloat(self.current_token.value)):
                    self.addline("movss %s, [r8]"%value_of_global(self.current_token.value, self.compiler).replace("QWORD", ""))

                else:
                    self.addline("mov %s,[r8]"% value_of_global(self.current_token.value, self.compiler) )
            else:
                if(self.getDeclarationByID(self.current_token.value).isfloat):
                    self.addline("movss [rbp-%s], [r8]"%self.getDeclarationByID(self.current_token.value).offset)
                else:         
                    self.addline("mov rcx, [r8]")
                    self.addline(place_value_from_reg(self.getDeclarationByID(self.current_token.value).offset, "rcx"))
            self.advance()
            return

        if(self.current_token.tok != T_EQUALS):throw(InvalidMemberAccess(self.current_token.start,self.current_token.end,self.current_token.value,self.current_token.tok))
        self.advance()
        self.evaluation_wrapper(reg="rax") #store new value in rax
        self.addline("mov [r8], rax")

    """
    #Construct a statement that starts with a T_ID (based on current position)
    """

    def buildIDStatement(self):
        id = self.current_token.value

        self.advance()
        if(self.current_token.tok == "="):
            self.advance()
            if(not self.compiler.globalExists(id)):
                self.evaluation_wrapper(decl=self.getDeclarationByID(id))
            else:
                self.evaluation_wrapper(glob=id)
            return
        elif(self.current_token.tok == "@"):
            self.advance()
            self.buildPointerAssignment(id)
        elif (self.current_token.tok == "["):
            self.advance()
            self.buildArrayIndexer(id)

        elif(self.current_token.tok == T_PROPOF):
            
            self.advance()
            self.buildPropertyAssignment(id)
        elif (self.current_token.tok == "++"):
            self.advance()
            self.addline(load_value_toreg(self.getDeclarationByID(id).offset,"rax"))
            self.addline("inc rax")
            self.addline(place_value_from_reg(self.getDeclarationByID(id).offset, "rax"))
        elif (self.current_token.tok == "--"):
            self.advance()
            self.addline(load_value_toreg(self.getDeclarationByID(id).offset,"rax"))
            self.addline("dec rax")
            self.addline(place_value_from_reg(self.getDeclarationByID(id).offset, "rax"))
        elif (self.current_token.tok == T_OPENP):
            self.advance()
            self.buildFunctionCall(id)
        else:
            print(self.current_token)
            throw(InvalidVariableAssignment(self.current_token.start,self.current_token.end,self.current_token.value, self.current_token.tok))




    """
    #Get the variable declaration based on the variable name
    """
    def getDeclarationByID(self, name):
        for decl in self.declarations:
            if decl.name == name : return decl
        for p in self.params:
            if p == name : 
                if(self.types[self.params.index(p)] == "var"):
                    return parameter_registers[self.params.index(p)]
                else:
                    return flt_parameter_registers[self.params.index(p)]
        return None

    def evaluation_wrapper(self,decl=None,reg=None,glob=None):
        self.fltexprs=0
        self.intexprs=0
        self.evaluateExpression(decl=decl,reg=reg,glob=glob)
        self.intexprs=0
        self.fltexprs=0


    """
    #Based on current position, generate assembly to: evaluate an expression, and place its final result into the variable described by decl 


    TEST: removed parameter registers by pre-allocating them as declarations at the begining of a function


    """
    def evaluateExpression(self, decl=None, reg=None, glob=None):
        expr = [] #holds the expression
        
        
        """

        #determine the contents of the expression:
        """
        while self.current_token != None and self.current_token.tok != T_EOL and self.current_token.tok != T_CLOSEP and self.current_token.tok != T_CLSLINDEX:
            if(self.current_token.tok in T_EOL+T_COMMA): break
            if(self.current_token.tok == T_INT or self.current_token.tok == T_FLOAT or self.current_token.tok == T_BOOLEAN):
                expr.append(self.current_token.value)
                self.advance()

            elif(self.current_token.tok == T_ID):
                #accounting for global variables/local through ID
                if(not self.compiler.globalExists(self.current_token.value)):
                    expr.append(self.getDeclarationByID(self.current_token.value))
                    self.advance()
                
                else:
                    expr.append(self.current_token.value)
                    self.advance()

            elif(self.current_token.tok in "^++--/*&&!!||%>><<==>=<=!="):

                expr.append(self.current_token.tok)
                self.advance()
            elif(self.current_token.tok == T_OPENP):
                self.advance()
                #if((isinstance(reg, str) and "xmm" in reg ) or (decl != None and decl.isfloat) or (glob != None and self.compiler.globalIsFloat(glob))):
                #    self.evaluateExpression(reg="xmm10")
                #    expr.append("xmm10")
                #else:
                #    self.evaluateExpression(reg="rdi")
                #    expr.append("rdi")
                if((isinstance(reg, str) and "xmm" in reg ) or (decl != None and decl.isfloat) or (glob != None and self.compiler.globalIsFloat(glob))):
                    self.fltexprs+=1
                    self.evaluateExpression(glob="__expstack_flt%s"%self.fltexprs)
                    expr.append("__expstack_int%s"%self.fltexprs)
                    
                else:
                    self.intexprs+=1
                    self.evaluateExpression(glob="__expstack_int%s"%self.intexprs)
                    expr.append("__expstack_int%s"%self.intexprs)
                    
                if(self.intexprs > 31 or self.fltexprs > 31):
                    throw(ExpressionOverflow(self.current_token.start,self.current_token.end,self.current_token.value,self.current_token.tok))

            else:
                throw(InvalidExpressionComponent(self.current_token.start,self.current_token.end,self.current_token.value, self.current_token.tok))
            #max expression size
        if(self.current_token.tok in T_CLOSEP+T_COMMA+T_EOL):
            self.advance()
        if(reg == None): 
       
            if(len(expr) == 1):
                if(decl != None):
                    if(decl.isfloat):
                        if(isinstance(expr[0], float)):
                            self.addline("mov  [rbp-"+hex(decl.offset)+"], __float32__("+str(expr[0])+")")
                            return
                        elif(self.compiler.globalExists( expr[0] )):
                            if(self.compiler.globalIsFloat(expr[0])):
                                self.addline("movss xmm10, [%s]"%expr[0])
                                self.addline("movss  [rbp-"+hex(decl.offset)+"], xmm10")
                            else:
                                self.addline("mov  [rbp-"+hex(decl.offset)+"], [%s]"%expr[0])
                            return
                        elif(isinstance(expr[0], Declaration)):
                            if(expr[0].isfloat):
                                self.addline("movss xmm10,  [rbp-"+hex(expr[0].offset)+"]")
                                self.addline("movss  [rbp-"+hex(decl.offet)+"], xmm10")
                            else:
                                self.addline("cvttss2si rax,  [rbp-"+hex(expr[0].offset)+"]")
                                self.addline("mov [rbp-"+hex(decl.offset)+"], rax")

                if(glob != None):
                    if(self.compiler.globalIsFloat(glob)):
                        if(isinstance(expr[0], float)):
                            self.addline("mov  ["+glob+"], __float32__("+str(expr[0])+")")
                            return
                        elif(self.compiler.globalExists( expr[0] )):
                            self.addline("mov QWORD ["+glob+"], [%s]"%expr[0])
                            return
                        elif(isinstance(expr[0], Declaration)):
                            if(expr[0].isfloat):
                                self.addline("movss  xmm10, [rbp-"+hex(expr[0].offset)+"]")
                                self.addline("movss [%s], xmm10"%glob)
                            else:
                                self.addline("cvttss2si rax,  [rbp-"+hex(expr[0].offset)+"]")
                                self.addline("mov QWORD ["+glob+"], rax")




                if(isinstance(expr[0], Declaration )):
                    self.addline("mov rbx, QWORD [rbp-"+hex(expr[0].offset)+"]")
                elif(isinstance(expr[0], int)):
                    self.addline("mov rbx, "+hex(expr[0]))
                elif (self.compiler.globalExists( expr[0])):

                    self.addline("mov %s, %s"%("rbx",value_of_global(expr[0], self.compiler  )))
                
                elif (expr[0] == "rdi"):
                    self.addline("mov rbx, rdi")
                else:
                    throw(InvalidExpressionComponent(self.current_token.start,self.current_token.end,self.current_token.value, self.current_token.tok))
                if(decl is not None): self.addline("mov QWORD [rbp-"+hex(decl.offset)+"], rbx")
                elif (reg is not None): self.addline(correct_mov(reg,"rbx"))
                else: self.addline("mov %s, rbx"%value_of_global(glob, self.compiler))
                return
        else:
            
            if(isinstance(reg, str) and "xmm" in reg):


                if(len(expr) == 1):

                    if(isinstance(expr[0], Declaration )):
                        self.addline(("movss %s,  [rbp-"%reg)+hex(expr[0].offset)+"]")
                    elif(isinstance(expr[0], int)):
                        self.addline("mov rax, %s"%hex(expr[0]))
                        self.addline(("cvtsi2ss %s, rax"%reg))
                    elif (self.compiler.globalExists( expr[0])):
                        self.addline("movss %s, [%s]"%(reg,expr[0]))
                    else:
                        print(self.current_token)
                        throw(InvalidExpressionComponent(self.current_token.start,self.current_token.end,self.current_token.value, self.current_token.tok))
                    return
                


            else:

                if(len(expr) == 1):

                    if(isinstance(expr[0], Declaration )):
                        self.addline(("mov %s, QWORD [rbp-"%reg)+hex(expr[0].offset)+"]")
                    elif(isinstance(expr[0], int)):
                        self.addline(("mov %s, "%reg)+hex(expr[0]))
                    elif (expr[0] == "rdi"):
                        self.addline("mov %s, rdi"%reg)
                    elif (self.compiler.globalExists( expr[0])):
                        self.addline("mov %s, %s"%(reg,value_of_global(expr[0], self.compiler  )))
                    else:
                        print(self.current_token)
                        throw(InvalidExpressionComponent(self.current_token.start,self.current_token.end,self.current_token.value, self.current_token.tok))
                    return
        

        _reg = "rbx"
        if(str(expr[1]) in "*/%"):
            _reg="rax"
        fltinvolved = False
        
        """

        #Create assembly for the move
        """
        if(isinstance(expr[0], Declaration )):
            if(expr[0].isfloat):
                self.addline("movss xmm15, [rbp-"+hex(expr[0].offset)+"]")
                fltinvolved=True
            else:
                self.addline(("mov %s, QWORD [rbp-"+hex(expr[0].offset)+"]")%_reg)
        elif(isinstance(expr[0], int)):
            self.addline(("mov %s, "+hex(expr[0]))%_reg)
        elif (isinstance(expr[0], float)):
            self.addline("movss xmm15, __float32__("+str(expr[0])+")")
            fltinvolved=True
        elif("xmm" in expr[0]):
            fltinvolved = True
            self.addline("movss xmm15, [%s]"%expr[0])

        elif (self.compiler.globalExists( expr[0])):
            if("FLT_CONSTANT_" in expr[0]):
                self.addline("movss xmm15, [%s]"%expr[0])
                fltinvolved=True
            else:
                self.addline("mov %s, %s"%(_reg,value_of_global(expr[0], self.compiler)))
        if(expr[1] == "!"):
            expr.append(0)
        
        if(not fltinvolved):

            if(len(expr) == 2):
                if(expr[1] == "++"):
                    self.addline("inc %s"%_reg)
                elif(expr[1] == "--"):
                    self.addline("dec %s"%_reg)
                
                elif(expr[0] == T_AMPERSAND):
                    if(isinstance(expr[1], Declaration)):
                        self.addline("mov %s, rbp"%_reg)
                        self.addline("sub %s, %s"%(_reg, hex(expr[1].offset)))
                    elif self.compiler.globalExists(expr[1]) or self.compiler.functionExists(expr[1]):
                        self.addline("mov %s, %s"%(_reg,expr[1]))
                    
                
                elif(expr[0] == "*"):
                    if(isinstance(expr[1], Declaration)):
                        self.addline("mov %s, [rbp-%s]"%(_reg, hex(expr[1].offset)))
                        self.addline("mov %s, [%s]"%(_reg,_reg))
                    elif self.compiler.globalExists(expr[1]) or self.compiler.functionExists(expr[1]):
                        self.addline("mov %s, [%s]"%(_reg,expr[1]))
                        



                if(_reg != "rbx"):
                    self.addline("mov rbx, %s"%_reg)
                

                if(decl is not None): self.addline("mov QWORD [rbp-%s], %s"%(hex(decl.offset), "rbx"))
                elif (reg is not None): 
                    self.addline(correct_mov(reg,"rbx"))
                else: self.addline("mov %s,%s"%(value_of_global(glob, self.compiler), "rbx"))
                return
        else:


            if(len(expr) == 2):
                if(expr[1] == "++"):
                    self.addline("movss xmm14, __FLT_STANDARD_1")
                    self.addline("addss xmm15, xmm14")
                if(expr[1] == "--"):
                    self.addline("movss xmm14, __FLT_STANDARD_1")
                    self.addline("subss xmm15, xmm14")
                
                


        opbisfloat = False


        #move operand b into rcx / xmm14 reguardless
        if(isinstance(expr[2], Declaration )):
            if(expr[2].isfloat):
                self.addline("movss xmm14,  [rbp-"+hex(expr[2].offset)+"]")
                opbisfloat=True
            else:
                self.addline("mov rcx, QWORD [rbp-"+hex(expr[2].offset)+"]")
        elif(isinstance(expr[2], int)):
            self.addline("mov rcx, "+hex(expr[2]))
        elif (self.compiler.globalExists( expr[2])):
            if("FLT_CONSTANT_" in expr[2]):
                self.addline("movss xmm14, [%s]"%expr[2])
                opbisfloat=True
            else:
                self.addline("mov %s, %s"%("rcx",value_of_global(expr[2], self.compiler)))
        
        elif (expr[2] == "rdi"):
            self.addline("mov rcx, rdi")
        elif("xmm" in expr[2]):
            self.addline("movss xmm14, "+expr[2])
            opbisfloat=True
        else:
            print(expr)
            throw(InvalidExpressionComponent(self.current_token.start,self.current_token.end,self.current_token.value, self.current_token.tok))











        negated_condition = "__blncmpncnd_%s_%s"%(self.name,hex(self.blncmpcounter))
        """
        #Create assembly for the math, and the re-deposit
        """
        #perform arithmatic, and move result into decl
        if(not opbisfloat and not fltinvolved):
            outputreg = "rbx"
            if(expr[1] == "+"):
                self.addline("add rbx, rcx")
            elif(expr[1] == "-"):
                self.addline("sub rbx, rcx")
            elif(expr[1] == "*"):
                self.addline("imul rcx")
                outputreg = "rax"
            elif(expr[1] == "/"):
                self.addline("xor rdx, rdx")
                self.addline("idiv rcx")
                outputreg = "rax"
            elif(expr[1] == "%"):
                self.addline("xor rdx, rdx")
                self.addline("div rcx")
                outputreg = "rdx"
            elif(expr[1] == "&&"):
                self.addline("and bl, cl")
            elif (expr[1] == "||"):
                self.addline("or bl, cl")
            elif (expr[1] == "!"):
                self.addline("not bl")
            elif (expr[1] == "^"):
                self.addline("xor bl, cl")

            

            elif (expr[1] == "=="):
                

                #self.addline("test rbx, rcx")
                #self.addline("cmove rbx, %s"%true)
                #self.addline("cmovne rbx, %s"%false)
                self.blncmpcounter+=1
                self.addline("cmp rbx, rcx")
                self.addline("mov rbx, 0")
                self.addline("jne %s"%negated_condition)
                self.addline("mov rbx, -1")
                self.addline("%s:"%negated_condition)
                

            elif (expr[1] == ">="):
                #self.addline("test rbx, rcx")
                #self.addline("cmovge rbx, %s"%true)
                #self.addline("cmovnge rbx, %s"%false)
                self.blncmpcounter+=1
                self.addline("cmp rbx, rcx")
                self.addline("mov rbx, 0")
                self.addline("jl %s"%negated_condition)
                self.addline("mov rbx, -1")
                self.addline("%s:"%negated_condition)

            elif (expr[1] == "<="):
                #self.addline("test rbx, rcx")
                #self.addline("cmovle rbx, %s"%true)
                #self.addline("cmovnle rbx, %s"%false)
                self.blncmpcounter+=1
                self.addline("cmp rbx, rcx")
                self.addline("mov rbx, 0")
                self.addline("jg %s"%negated_condition)
                self.addline("mov rbx, -1")
                self.addline("%s:"%negated_condition)

            elif (expr[1] == "!="):
                #self.addline("test rbx, rcx")
                #self.addline("cmovne rbx, %s"%true)
                #self.addline("cmove rbx, %s"%false)

                self.blncmpcounter+=1
                self.addline("cmp rbx, rcx")
                self.addline("mov rbx, 0")
                self.addline("je %s"%negated_condition)
                self.addline("mov rbx, -1")
                self.addline("%s:"%negated_condition)

            elif (expr[1] == ">"):
                #self.addline("test rbx, rcx")
                #self.addline("cmovg rbx, %s"%true)
                #self.addline("cmovl rbx, %s"%false)

                self.blncmpcounter+=1
                self.addline("cmp rbx, rcx")
                self.addline("mov rbx, 0")
                self.addline("jle %s"%negated_condition)
                self.addline("mov rbx, -1")
                self.addline("%s:"%negated_condition)

            elif (expr[1] == "<"):
                #self.addline("test rbx, rcx")
                #self.addline("cmovl rbx, %s"%true)
                #self.addline("cmovg rbx, %s"%false)

                self.blncmpcounter+=1
                self.addline("cmp rbx, rcx")
                self.addline("mov rbx, 0")
                self.addline("jge %s"%negated_condition)
                self.addline("mov rbx, -1")
                self.addline("%s:"%negated_condition)


            if(decl is not None): self.addline("mov QWORD [rbp-%s], %s"%(hex(decl.offset), outputreg))
            elif (reg is not None): 
                self.addline(correct_mov(reg,outputreg))
            else: self.addline("mov %s,%s"%(value_of_global(glob, self.compiler), outputreg))
        
        
        else: #deal with float arithmetic


            if(opbisfloat and fltinvolved): #both operands are floats
                pass #no mov needed
            elif (not opbisfloat and fltinvolved): #only first operand is float
                self.addline("cvtsi2ss xmm14, rcx") #mov second op into xmm14
            elif (opbisfloat and not fltinvolved): #only second operand is float
                self.addline("cvtsi2ss xmm15, %s"%_reg)
            else:
                pass#nonsense
            
            #ops are in xmm15, xmm14
            if(expr[1] == "+"):
                self.addline("addss xmm15, xmm14")
            elif (expr[1] == "-"):
                self.addline("subss xmm15, xmm14")
            elif (expr[1] == "*"):
                self.addline("mulss xmm15, xmm14")
            elif (expr[1] == "/"):
                self.addline("divss xmm15, xmm14")
            
            if(decl is not None):
                if(decl.isfloat):
                    self.addline("movss [rbp-%s], xmm15"%hex(decl.offset))
                else:


                    self.addline("cvttss2si rax, xmm15")
                    self.addline("mov QWORD [rbp-%s], rax"%hex(decl.offset))
            elif (reg is not None):
                if("xmm" in reg):
                    self.addline("movss "+reg+", xmm15")
                else:

                    self.addline("cvttss2si "+reg+", xmm15")
            else:
                #global                    

                if(self.compiler.globalIsFloat(glob)):
                    self.addline("movss [%s], xmm15"%glob)
                else:

                    self.addline("cvss2si rax, xmm15")
                    self.addline("mov "+glob+", rax")










    



    def buildVariableDeclaration(self):
        flt = (self.current_token.value == "float")
        self.advance()
        isarr = False
        if(self.current_token.tok == T_OPENLINDEX):
            isarr=True
            self.advance()
            if(self.current_token.tok != T_INT): throw(InvalidStackspaceAllocator(self.current_token.start,self.current_token.end,self.current_token.value,self.current_token.tok))
            size = (int(self.current_token.value)+1)*8
            self.allocationoffset+=size
            self.allocationCounter+=size
            self.advance()
            if(self.current_token.tok != T_CLSLINDEX): throw(InvalidStackspaceAllocator(self.current_token.start,self.current_token.end,self.current_token.value,self.current_token.tok))
            self.advance()

        if(self.current_token.tok != T_ID):
            throw(InvalidVariableDeclarator(self.current_token.start,self.current_token.end,self.current_token.value, self.current_token.tok))
            
        id = self.current_token.value
        
        if(self.getDeclarationByID(id) != None):
            throw(VariableReDeclaration(self.current_token.start,self.current_token.end,self.current_token.value, self.current_token.tok))
        self.advance()
        if(self.current_token.tok == T_EOL): #variable declaration without assignment
            self.appendDeclaration(id,flt)
            

            if(not flt):
                if(not isarr):
                    self.addline(place_value_from_reg(self.declarations[len(self.declarations)-1].offset, "0x0"))
                else:
                    
                    self.addline(place_value_from_reg(self.declarations[len(self.declarations)-1].offset, "rbp"))
                    self.addline(place_value_from_reg(self.declarations[len(self.declarations)-1].offset, hex(self.allocationCounter-size)).replace("mov", "sub"))
            
            else:
                if(not isarr):
                    self.addline("movss  xmm10, [FLT_STANDARD_ZERO]")
                    self.addline("movss [rbp-"+hex(self.declarations[len(self.declarations)-1].offset)+"], xmm10")
                else:
                    self.addline(place_value_from_reg(self.declarations[len(self.declarations)-1].offset, "rbp"))
                    self.addline(place_value_from_reg(self.declarations[len(self.declarations)-1].offset, hex(self.allocationCounter-size)).replace("mov", "sub"))

            #self.advance()

            return
        if(isarr):return
        if(self.current_token.tok == "="): #with assignment
            self.advance()
            self.appendDeclaration(id,flt)
            
            terma = self.current_token.value

            if(self.compiler.functionExists(terma)):
                self.addline(place_value_from_reg(self.declarations[len(self.declarations)-1].offset, terma))
                self.advance()
                if(self.current_token.tok != T_EOL):      throw(InvalidVariableDeclarator(self.current_token.start,self.current_token.end,self.current_token.value, self.current_token.tok))
                self.advance()
            
            elif(not self.compiler.globalExists(id)):
                self.evaluation_wrapper(decl=self.declarations[len(self.declarations)-1])#evaluate expression, and place it into this declaration
            else:
                self.evaluation_wrapper(glob=id)
            
            return
        else: #invalid statement
            throw(InvalidVariableDeclarator(self.current_token.start,self.current_token.end,self.current_token.value, self.current_token.tok))










    def buildReturnStatement(self):
        #current token will already be the return value
        if(self.ret == "float"):
            self.evaluation_wrapper(reg="xmm8")
            self.addline("cvttss2si r8, xmm8")
        else:
            self.evaluation_wrapper(reg="r8")
            self.addline("cvtsi2ss xmm8,r8")
        
        self.addline("jmp __%s__leave_ret_"%self.name)





    def buildAsmBlock(self):
        if(self.current_token.tok != T_OSCOPE):
            throw(InvalidASMBlock(self.current_token.start,self.current_token.end,self.current_token.value, self.current_token.tok))

        self.advance()
        if(self.current_token.tok != T_STRING):
            throw(InvalidASMBlock(self.current_token.start,self.current_token.end,self.current_token.value, self.current_token.tok))
        self.addline(self.current_token.value)
        self.advance()
        if(self.current_token.tok != T_CLSCOPE):
            throw(InvalidASMBlock(self.current_token.start,self.current_token.end,self.current_token.value, self.current_token.tok))
        self.advance()


    def buildForBlock(self):
        if(self.current_token.tok != T_OPENP):
            throw(InvalidForBlockInit(self.current_token.start,self.current_token.end,self.current_token.value, self.current_token.tok))
        
        self.advance()
        if(self.current_token.tok != T_KEYWORD or self.current_token.value != "var"):
            throw(InvalidForBlockInit(self.current_token.start,self.current_token.end,self.current_token.value, self.current_token.tok))

        
        
        self.buildVariableDeclaration() #determine incrementor
        if(self.current_token.tok == T_EOL):
            self.advance()
        decl = self.declarations[len(self.declarations)-1]
        self.addline("__"+self.name+"__flp"+hex(decl.offset)+":")

        beginidx = len(self.bodytext) #anything added after this point, and before doCompilations will go at the end of the loop's asm
        
        self.appendDeclaration("__%s__flp_maxnum%s"%(self.name,hex(decl.offset)),False)
        maxdecl = self.declarations[len(self.declarations)-1]
        if(self.current_token.tok == ";"):
            self.advance()

        self.addline("__"+self.name+"__flp_end_"+hex(decl.offset)+":")
        self.forstack.append("__"+self.name+"__flp_end_final"+hex(decl.offset))
        endmarker = "__"+self.name+"__flp_end_final"+hex(decl.offset)
        self.evaluation_wrapper(decl=maxdecl)

        
        #self.evaluateExpression(decl=decl)
        self.buildIDStatement()
        self.advance()
        
        if(self.current_token.tok == T_CLOSEP):
            self.advance()


        if(self.current_token.tok != T_OSCOPE):
            throw(InvalidForBlockInit(self.current_token.start,self.current_token.end,self.current_token.value, self.current_token.tok))
        self.advance()#move past {


        self.addline(load_value_toreg(maxdecl.offset,"rdi"))
        #self.addline(load_value_toreg(decl.offset,"rsi"))
        self.addline("mov rsi, -1")

        self.addline("cmp rdi, rsi")
        self.addline("je %s"%("__"+self.name+"__flp"+hex(decl.offset)))

        header = self.bodytext[beginidx:]
        self.bodytext = self.bodytext[:beginidx]
        self.doCompilations(forblock=True)
        self.advance()
        self.addline(header)
        self.addline("%s: "%endmarker)
        if(len(self.forstack) > 0):
            if(self.forstack[len(self.forstack)-1] == endmarker):
                self.forstack.pop()
        
        
    def buildCMP(self):
        if(self.current_token.tok != T_OPENP):
            throw(InvalidCMPBlockHeader(self.current_token.start,self.current_token.end,self.current_token.value, self.current_token.tok))
        
        self.advance()

        self.evaluation_wrapper(reg="r14")
        self.evaluation_wrapper(reg="r15")
        
        if(self.current_token.tok != T_OSCOPE):
            throw(InvalidCMPBlockHeader(self.current_token.start,self.current_token.end,self.current_token.value, self.current_token.tok))
        endblockname = "__cmpblock__%s__%s"%(self.name,hex(len(self.bodytext)))
        self.addline("cmp r14, r15")
        self.addline("push %s"%endblockname)
        self.advance(   )
        while self.current_token.tok != None and self.current_token.tok != T_CLSCOPE:
            if(self.current_token.tok not in CMP_TOKS):
                throw(InvalidCMPBlockHeader(self.current_token.start, self.current_token.end, self.current_token.value, self.current_token.tok))
            
            op = CMP_TABLE[self.current_token.tok]
            self.advance()
            
            if(self.current_token.tok != ":"):throw(InvalidCMPBlockHeader(self.current_token.start, self.current_token.end, self.current_token.value, self.current_token.tok))
            self.advance()
            
            if(self.current_token.tok == T_KEYWORD and self.current_token.value == "return"):
                self.addline("%s __%s__leave_ret_"%(op, self.name))
                self.advance()
                self.advance()
                continue
            elif (self.current_token.tok == T_KEYWORD and self.current_token.value == "continue"):
                self.addline("%s %s"%(op, endblockname))
                self.advance()
                self.advance()
                continue


            if(self.current_token.tok != T_ID):throw(InvalidCMPBlockHeader(self.current_token.start, self.current_token.end, self.current_token.value, self.current_token.tok))
            id = self.current_token.value
            
            self.advance()
            if(self.current_token.tok == T_CLSCOPE):break
            
            if(self.current_token.tok != T_EOL):throw(InvalidCMPBlockHeader(self.current_token.start, self.current_token.end, self.current_token.value, self.current_token.tok))
            self.addline("%s %s"%(op, id))
            self.advance()

        self.advance()
        self.addline("add rsp, 0x8")
        self.addline("%s:"%endblockname)

        if(self.current_token.tok != "->"): return
        self.advance()

        if(self.current_token.tok != T_ID):throw(InvalidCMPBlockHeader(self.current_token.start, self.current_token.end, self.current_token.value, self.current_token.tok))

        id = self.current_token.value

        decl = self.getDeclarationByID(id)
        
        self.addline(place_value_from_reg(decl.offset,"r8"))
        
        self.advance()
        
        if(self.current_token.tok != T_EOL):throw(InvalidCMPBlockHeader(self.current_token.start, self.current_token.end, self.current_token.value, self.current_token.tok))
        
        self.advance()


    def buildIFBlock(self):
        self.ifcounter+=1
        if(self.current_token.tok != T_OPENP):
            throw(InvalidIFHeader(self.current_token.start,self.current_token.end,self.current_token.value,self.current_token.tok))
        self.advance()
        self.evaluation_wrapper(reg="r14")
        self.addline("mov r15, -1")
        self.addline("cmp r14, r15") #if r14 is not true:
        labeltojump = "__ifntrue_%s_%s"%(self.name,hex(self.ifcounter))
        self.addline("jne %s"%labeltojump)
        self.doCompilations(forblock=True)
        self.addline("jmp %s"%labeltojump)
        

        if(self.current_token.tok != T_CLSCOPE) : throw(InvalidIFHeader(self.current_token.start,self.current_token.end,self.current_token.value,self.current_token.tok))
        self.advance()
        if(self.current_token.tok == T_KEYWORD and self.current_token.value == "else"):
            self.advance()
            if(self.current_token.tok != T_OSCOPE) : throw(InvalidIFHeader(self.current_token.start,self.current_token.end,self.current_token.value,self.current_token.tok))
            self.doCompilations(forblock=True)
            if(self.current_token.tok != T_CLSCOPE) : throw(InvalidIFHeader(self.current_token.start,self.current_token.end,self.current_token.value,self.current_token.tok))
            self.advance()
        self.addline("%s:"%labeltojump)

    def checkendlinesemi(self):
        if(self.current_token.tok != T_EOL): throw(MissingSemiColon(self.current_token.start,self.current_token.end, self.current_token.value,self.current_token.tok))
        self.advance()


    def buildKeywordStatement(self):

        if(self.current_token.value == "var" or self.current_token.value == "float"):
            self.buildVariableDeclaration()
        elif(self.current_token.value == "return"):
            self.advance()
            self.buildReturnStatement()
        elif(self.current_token.value == "__asm"):
            self.advance()
            self.buildAsmBlock()
        elif(self.current_token.value == "for"):
            self.advance()
            self.buildForBlock()
        elif(self.current_token.value == "cmp"):
            self.advance()
            self.buildCMP()
        elif(self.current_token.value == "if"):
            self.advance()
            self.buildIFBlock()
        elif (self.current_token.value == "break"):
            self.advance()
            spot = self.forstack.pop()
            self.addline("jmp %s"%spot)
        elif(self.current_token.value == "label"):
            self.advance()
            if self.current_token.tok != T_ID: throw(InvalidLabelDeclaration(self.current_token.start,self.current_token.end,self.current_token.value,self.current_token.tok))
            id = self.current_token.value
            self.addline("%s:"%id)
            self.advance()
            self.checkendlinesemi()
        elif (self.current_token.value == "goto"):
            self.advance()
            if self.current_token.tok != T_ID: throw(InvalidLabelDeclaration(self.current_token.start,self.current_token.end,self.current_token.value,self.current_token.tok))
            id = self.current_token.value
            self.addline("jmp %s"%id)
            self.advance()
            self.checkendlinesemi()


        else:
            self.advance()









    def compile(self):
        if(not self.isFast): #the fast keyword prevents this paramter storage
            self.allocationoffset = len(self.params)*8+8
            for token in self.tokens:
                
                if(token.tok == T_KEYWORD and token.value == "var" or token.value == "float" or token.value=="for"): #forloops require extra declarations
                    self.allocationoffset += 8
        else:
            self.allocationoffset = 8
            for token in self.tokens:
                if(token.tok == T_KEYWORD and token.value == "var" or token.value == "float"):
                    self.allocationoffset += 8

        if(not self.isFast):
            for i in range(len(self.params)):
                if(self.types[i] == "var"):
                    self.appendDeclaration(self.params[i], False)

                    self.allocator += place_value_from_reg((i+1)*8,parameter_registers[i])
                else:
                    self.appendDeclaration(self.params[i], True)
                    self.allocator += "movss [rbp-"+hex((i+1)*8)+"], "+flt_parameter_registers[i]+"\n"

            
        self.bodytext = "&&ALLOCATOR&&"
        self.doCompilations()
        self.advance()
        self.allocator = "%s%s"%(allocate(self.allocationoffset),self.allocator)

        self.bodytext = self.bodytext.replace("&&ALLOCATOR&&","%s"%(self.allocator))
        self.bodytext = FNO(self).optimize()
    

    def buildLeftsideExpression(self):
        self.advance()
        self.evaluation_wrapper(reg="r15") # store expression value in r15
        isindexptr = False
        if(self.current_token.tok == "@"):
            #build pointer assignent
            self.advance()
            self.evaluation_wrapper(reg = "r14")
            isindexptr=True
        elif (self.current_token.tok == "["):
            #build indexer assignment
            self.advance()
            self.evaluation_wrapper(reg="rax")
            self.addline("mov rbx, 0x8")
            self.addline("mul rbx")
            self.addline("mov r14, rax")
            isindexptr=True
        elif(self.current_token.tok == "="):
            self.addline("xor r14, r14")
            isindexptr=True

        if(isindexptr):
            if(self.current_token.tok == "]"): 
                self.advance()
            if(self.current_token.tok == T_EQUALS):
                self.advance()
                self.addline("push r15")
                self.addline("push r14")
                self.evaluation_wrapper(reg="r13")
                #if(self.current_token.tok != T_EOL) :  throw(InvalidLefthandExpression(self.current_token.start,self.current_token.end,self.current_token.value,self.current_token.tok))
                self.addline("pop r14")
                self.addline("pop r15")
                self.addline("mov [r15+r14], r13")
            
            elif (self.current_token.tok == "->"):
                self.advance()
                if(self.current_token.tok != T_ID) :  throw(InvalidLefthandExpression(self.current_token.start,self.current_token.end,self.current_token.value,self.current_token.tok))
                id = self.current_token.value
                self.advance()
                if(self.compiler.globalExists(id)):
                    if(self.compiler.globalIsFloat(id)):
                        self.addline("movss xmm10,[r15+r14]")
                        self.addline("movss [%s], xmm10"%id)
                    else:
                        self.addline("mov rbx, [r15+r14]")
                        self.addline("mov [%s],rbx"%id)
                else:
                    d = self.getDeclarationByID(id)
                    if(d.isfloat):
                        self.addline("movss xmm10,[r15+r14]")
                        self.addline("movss [rbp-%s], xmm10"%hex(d.offset))
                    else:
                        self.addline("mov rbx, [r15+r14]")
                        self.addline("mov [rbp-%s],rbx"%hex(d.offset))
                
                if(self.current_token.tok != T_EOL) :  throw(InvalidLefthandExpression(self.current_token.start,self.current_token.end,self.current_token.value,self.current_token.tok))




            return


        if (self.current_token.tok == "("):
            #build fnptr call
            self.advance()
            pindex = 0
            while self.current_token.tok != T_CLOSEP and self.current_token.tok != "->" and self.current_token.tok != T_EOL:
                if(self.current_token.tok == T_COMMA):
                    self.advance()
                
                self.evaluation_wrapper(reg=parameter_registers[pindex])
                #self.addline("cvttss2si %s, %s"%(parameter_registers[pindex],flt_parameter_registers[pindex]))
                pindex+=1
            
            self.addline("call r15")
            
            
            
            
            
            #same as end of fncall
            
            
            if(self.current_token.tok == ")"):
                self.advance()#move past ')'
        
        
            if(self.current_token.tok == "->"): #use return value
                self.advance()
                if(self.current_token.tok != T_ID):
                    throw(InvalidFunctionReturnDestination(self.current_token.start,self.current_token.end,self.current_token.value, self.current_token.tok))

                if(self.compiler.globalExists( self.current_token.value ) ):
                    if(self.compiler.globalIsFloat(self.current_token.value)):
                        self.addline("movss %s, xmm8"%value_of_global(self.current_token.value, self.compiler).replace("QWORD", ""))

                    else:
                        self.addline("mov %s,r8"% value_of_global(self.current_token.value, self.compiler) )
                else:
                    if(self.getDeclarationByID(self.current_token.value).isfloat):
                        self.addline("movss [rbp-%s], xmm8"%hex(self.getDeclarationByID(self.current_token.value).offset))
                    else:
                        self.addline(place_value_from_reg(self.getDeclarationByID(self.current_token.value).offset, "r8"))
            for i in range(len(self.params)):
                pass
                #########self.addline("pop %s"%(parameter_registers[len(self.params)-(i+1)]))
            
            self.advance() # end the line



    def doCompilations(self, forblock=False):
        opens = 0
        while self.current_token != None and self.current_token.tok != T_EOF and self.current_token.tok != T_CLSCOPE:
            
            if(self.current_token.tok in T_EOL+T_OSCOPE+T_CLSCOPE+T_COLON):
                self.advance()
            elif(self.current_token.tok == T_KEYWORD):
                self.buildKeywordStatement()
            elif(self.current_token.tok == T_ID):
                self.buildIDStatement()
            elif(self.current_token.tok == T_OPENP):
                self.buildLeftsideExpression()

            else:
                throw(UnkownStatementInitiator(self.current_token.start,self.current_token.end,self.current_token.value, self.current_token.tok))
    def getFinalText(self):

        return self.header+"\n"+self.bodytext+"\n"+self.closer+"\n"

    def advance(self):
        self.ct_idx+=1
        if self.ct_idx < len(self.tokens):
            self.current_token = self.tokens[self.ct_idx]
        else:
            self.current_token = Token(T_EOF)




    def __repr__(self):

        return f'{self.name} ( {self.params} )'






