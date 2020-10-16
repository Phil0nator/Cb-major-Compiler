from globals import *
from Classes.Error import *
from Classes.Token import *
from Classes.DType import *



def optloadRegs(a, b, op, o):
    instr=""
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
    return areg, breg, o, instr



    
def bringdown_memloc( a):
    instr=""
    if(a.memory_location):
        instr+=f"mov {a.accessor}, [{a.accessor}]\n"
        a.memory_location=False
    return instr

def bringdown_memlocs( a, b):
    return bringdown_memloc(a) + bringdown_memloc(b)


class RightSideEvaluator:
    def __init__(self, fn):
        self.fn = fn



    # (used for rightside evaluation)
    def performCastAndOperation(self,a, b, op, o):                      # Do an operation with a op b -> o:DType
        instr = ""
        apendee = None
        if(op in ["<<", ">>"]):
            if( (a.type.isflt() or b.type.isflt())):
                throw(InvalidOperationOperands(a.token,op,a.type,b.type))
            # else:
            #     instr+=self.bringdown_memloc(a)
            #     if(a.isRegister()):
            #         areg = a.accessor
            #     else:
            #         areg = ralloc(False)
            #         instr+=loadToReg(areg,a.accessor)
            #     instr+=doIntOperation(areg, b.accessor, op, a.type.signed)


        instr+=bringdown_memlocs(a,b)

        if(op == "["):
            if(b.type.isflt()): throw(UsingFloatAsIndex(b.token))
            
            
            areg, breg, o, ninstr = optloadRegs(a,b,op,o)
            instr+=ninstr
            if(a.type.size(1) in [1,2,4,8]):
                instr+=f"lea {areg}, [{areg}+{breg}*{a.type.size(1)}]\n"
            else:
                if(canShiftmul(a.type.size(1))):
                    instr+=f"shl {breg}, {shiftmul(a.type.size(1))}\n"
                else:
                    instr+=f"imul {breg}, {a.type.size(1)}\n"
                instr+=f"lea {areg}, [{areg}+{breg}]\n"
            apendee = (EC.ExpressionComponent(areg, a.type.down(),token=a.token))
            apendee.memory_location = True
            rfree(breg)

        

        elif(a.type.__eq__(b.type)):
            #same type

            areg, breg, o, ninstr = optloadRegs(a,b,op,o)
            instr+=ninstr
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
            newtype, toConvert = determinePrecedence(a.type, b.type,self.fn)
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
                o = BOOL.copy()


            apendee = (EC.ExpressionComponent(creg,caster.type,token=caster.token))
            rfree(newcoreg)
            rfree(coreg)


        
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
                    elif(b.isconstint() and not a.isconstint() and not a.type.isflt()): # optimize for semi constexpr
                        newinstr = None
                        
                        if(b.accessor == 0 and op not in  ["/", "["] and op not in signed_comparisons):
                            apendee = a
                            newinstr = ""
                            newt = a.type.copy()
                        if(op == "*" or op == "/"):
                            
                            if(canShiftmul(b.accessor)):
                                newinstr = ""
                                if(a.isRegister()):
                                    areg = a.accessor
                                else:
                                    areg = ralloc(False)
                                    newinstr+=loadToReg(areg,a.accessor)
                                    
                                
                                if(op == "*"):
                                    newinstr+=f"shl {valueOf(areg)}, {shiftmul(b.accessor)}\n"
                                else:
                                    newinstr+=f"shr {valueOf(areg)}, {shiftmul(b.accessor)}\n"
                                a.accessor = areg
                                apendee = a
                            newt = a.type.copy()



                        if(newinstr == None): newinstr, newt, apendee = self.performCastAndOperation(a,b,op,o)
                        stack.append(apendee)
                        instr+=newinstr
                        o = newt.copy()




                    else:
                        if(op == T_PTRACCESS or op == T_DOT):

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
                        instr+=bringdown_memloc(a)
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
                        instr+=bringdown_memloc(a)
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
                            if(a.accessor.isStackarr):
                                instr+=f"lea {result}, [rbp-{a.accessor.offset+a.accessor.stackarrsize}]\n"
                            else:

                                instr+=f"lea {result}, [rbp-{a.accessor.offset+a.accessor.t.csize()}]\n"
                            o = a.type.copy()
                            o.ptrdepth+=1
                            stack.append(EC.ExpressionComponent(result, o.copy(),token=a.token))
                        
                        elif(a.memory_location):
                            a.memory_location = False
                            o = a.type.copy()
                            o.ptrdepth+=1
                            stack.append(EC.ExpressionComponent(a.accessir, o.copy(),token=a.token))

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
                        t = self.fn.compiler.getType(tid)
                        if(t == None):
                            throw(UnkownType(e.token))
                        aval = ralloc(a.type.isflt())
                        result = ralloc(t.isflt())
                        instr+=bringdown_memloc(a)
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
        
        if(len(stack) != 1): 
            throw(HangingOperator(self.fn.current_token))
        final = stack.pop()
        
        
        o = final.type.copy()
        #TODO: Make own function:
        #       make able to handle different data sizes
        instr+=";------------\n"
        instr+=bringdown_memloc(final)
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



class LeftSideEvaluator:
    def __init__(self, fn):
        self.fn = fn
    



    def performCastAndOperation(self,a, b, op, o):                      # Do an operation with a op b -> o:DType
        instr = ""
        apendee = None

        if(op == "["):
            if(b.type.isflt()): throw(UsingFloatAsIndex(b.token))
            
            instr+=bringdown_memlocs(a,b)
            
            if(b.isconstint() and b.accessor == 0): # index 0 means nothing
                return "", a.type.copy(), a



            areg, breg, o, ninstr = optloadRegs(a,b,op,o)
            instr+=ninstr
                

            if(a.type.size(1) in [1,2,4,8]):
                instr+=f"lea {areg}, [{areg}+{breg}*{a.type.size(1)}]\n"
            else:
                if(canShiftmul(a.type.size(1))):
                    instr+=f"shl {breg}, {shiftmul(a.type.size(1))}\n"
                else:
                    instr+=f"imul {breg}, {a.type.size(1)}\n"
                instr+=f"lea {areg}, [{areg}+{breg}]\n"
            apendee = (EC.ExpressionComponent(areg, a.type.down(),token=a.token))
            apendee.memory_location = True
            rfree(breg)
            
            return instr, o, apendee

        

        rev = RightSideEvaluator(self.fn)
        return rev.performCastAndOperation(a,b,op,o)


    def evaluatePostfix(self, pfix):
        stack = []
        instr = ""
        o = VOID.copy()
        print(pfix)
        for e in pfix:
            if(e.isoperation):
                if(not operatorISO(e.accessor)):
                    b = stack.pop()
                    if(len(stack) < 1): throw(HangingOperator(pfix[len(pfix)-1].token))

                    a = stack.pop()
                    op = e.accessor
                    

                    if(a.isconstint() and b.isconstint()): # optimize for constant expressions
                        stack.append(calculateConstant(a,b,op))
                    elif(b.isconstint() and not a.isconstint() and not a.type.isflt() and False): # optimize for semi constexpr
                        newinstr = None
                        
                        if(b.accessor == 0 and op not in  ["/", "["] and op not in signed_comparisons):
                            apendee = a
                            newinstr = ""
                            newt = a.type.copy()
                        if(op == "*" or op == "/"):
                            
                            if(canShiftmul(b.accessor)):
                                newinstr = ""
                                if(a.isRegister()):
                                    areg = a.accessor
                                else:
                                    areg = ralloc(False)
                                    newinstr+=loadToReg(areg,a.accessor)
                                    
                                
                                if(op == "*"):
                                    newinstr+=f"shl {valueOf(areg)}, {shiftmul(b.accessor)}\n"
                                else:
                                    newinstr+=f"shr {valueOf(areg)}, {shiftmul(b.accessor)}\n"
                                a.accessor = areg
                                apendee = a
                            newt = a.type.copy()



                        if(newinstr == None): newinstr, newt, apendee = self.performCastAndOperation(a,b,op,o)
                        stack.append(apendee)
                        instr+=newinstr
                        o = newt.copy()




                    else:
                        if(op == T_PTRACCESS or op == T_DOT):
                            member = b.accessor
                            memv = a.type.getMember(member)
                            if(memv == None): throw(UnkownIdentifier(b.token))
                            o = memv.t.copy()


                            tmpaddr = ralloc(False)
                            #instr+=f"mov {tmpaddr}, {valueOf(a.accessor)}\n"
                            instr+=loadToReg(tmpaddr, a.accessor)

                            if(memv.offset != 0):
                                instr+=f"lea {tmpaddr}, [{tmpaddr}+{memv.offset}]\n"

                            stack.append(EC.ExpressionComponent(tmpaddr,memv.t.copy(),token=b.token))
                            rfree(a.accessor)
                        



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
                            if(a.accessor.isStackarr):
                                instr+=f"lea {result}, [rbp-{a.accessor.offset+a.accessor.stackarrsize}]\n"
                            else:

                                instr+=f"lea {result}, [rbp-{a.accessor.offset+a.accessor.t.csize()}]\n"
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
                        t = self.fn.compiler.getType(tid)
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

        return instr, final

