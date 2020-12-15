# used to store out-of-order instructions for ternary operator
import Classes.ExpressionComponent as EC
from Assembly.CodeBlocks import (boolmath, castABD, doOperation, getComparater,
                                 getOnelineAssignmentOp, lea_mul_opt,
                                 loadToReg, magic_division, magic_modulo,
                                 maskset, shiftInt, shiftmul, valueOf, zeroize)
from Assembly.Instructions import (ONELINE_ASSIGNMENTS, Instruction,
                                   signed_comparisons)
from Assembly.Registers import *
from Assembly.Registers import ralloc, ralloc_last, rfree, rfreeAll
from Assembly.TypeSizes import dwordImmediate, psizeof, psizeoft
from Classes.Constexpr import calculateConstant, ternarystack
from Classes.DType import *
from Classes.Error import *
from Classes.Token import *
from Classes.Variable import Variable
from globals import (BOOL, CHAR, COMMUNITIVE, DOUBLE, INT, INTRINSICS, LITERAL,
                     LONG, SHORT, VOID, canShiftmul, operatorISO, typematch)

#############################
# optloadRegs is used to load
#   two values into registers,
#   unless they already exist in registers.
#   This function ensures that values are
#   loaded as few times as possible.
############################


def optloadRegs(a, b, op, o, constvalok=False):
    instr = ""
    o = a.type.copy()
    areg = ""
    breg = ""
    needLoadA = True
    needLoadB = True
    overrideAload = False

    if (constvalok and isinstance(a.accessor, int)
            and dwordImmediate(a.accessor)):
        areg = a.accessor
        if b is None:
            return areg, None, o, ""
        overrideAload = True

    if (b is not None and constvalok and isinstance(
            b.accessor, int) and dwordImmediate(a.accessor)):
        breg = b.accessor
        return areg, breg, o, instr

    if(a.isRegister() or overrideAload):
        areg = a.accessor
        needLoadA = False
    #elif isinstance(a.accessor, Variable) and a.accessor.register is not None:
    #    areg = a.accessor.register
    #    needLoadA = False
    else:
        areg = ralloc(a.type.isflt(), size=a.type.csize())

    if(b is not None):
        if (b.isconstint()):
            b.type.s = a.type.s

        if(b.isRegister()):
            breg = b.accessor
            needLoadB = False
        #elif isinstance(b.accessor, Variable) and b.accessor.register is not None:
        #    breg = b.accessor.register
        #    needLoadB = False
        else:

            breg = ralloc(b.type.isflt(), size=b.type.csize())

        if(needLoadB):
            instr += loadToReg(breg, b.accessor)

    if(needLoadA):
        instr += loadToReg(areg, a.accessor)

    return areg, breg, o, instr


###########################
#   bringdown_memloc takes an expression component
#       and returns the instructions necessary
#       to reduce its pointer depth by one.
#       (used for member access and arrays)
############################
def bringdown_memloc(a):
    instr = ""
    if(a.memory_location):

        if a.type.isflt():
            out = ralloc(True)
            instr += f"movsd {out}, [{setSize(a.accessor, 8)}]\n"
            rfree(a.accessor)
            a.accessor = out
        else:
            instr += f"mov {setSize( a.accessor, a.type.csize())}, {psizeoft(a.type)}[{setSize(a.accessor,8)}]\n"
            instr += maskset(a.accessor, a.type.csize())

        a.memory_location = False

    return instr

# do two bringdown_memloc calls in one


def bringdown_memlocs(a, b):
    return bringdown_memloc(a) + bringdown_memloc(b)


'''
The ExpressionEvaluator abstract class contains functions shared by
    Leftside and Rightside evaluators. This is mostly functions for
    semi-constexpr optimizations (int operations with one constant and one var).
    Assignments are also layed out in depth in the normal ExpressionEvaluator class.
'''


class ExpressionEvaluator:
    def __init__(self, fn):
        self.fn = fn
        self.resultflags = None

    def swap_op(self, a, b):
        apendee = b
        newt = b.type
        inst = self.normal_semiconstexprheader(a, b)
        areg, breg, _, linstrs = optloadRegs(a,b, "<=>",VOID.copy())
        inst += linstrs
        if isinstance(a.accessor, Variable) and a.accessor.register is None:
            inst += loadToReg(b.accessor, areg)
            inst += loadToReg(a.accessor, breg)
            b.accessor = breg
            rfree(areg)

        elif isinstance(b.accessor, Variable) and b.accessor.register is None:
            inst += loadToReg(a.accessor, breg)
            inst += loadToReg(b.accessor, areg)
            b.accessor = breg
            rfree(areg)
        
        else:
            tmp = ralloc(b.type.isflt() and a.type.isflt())
            inst += loadToReg(tmp, areg)
            inst += loadToReg(a.accessor, breg)
            inst += loadToReg(b.accessor, tmp)
            rfree(tmp)
            rfree(areg)
            b.accessor = breg


        return inst, newt, apendee

    # Any assignments will be handled in this function.
    # This includes operators like '+=', '-=', etc...

    def doAssignment(self, a, b, op, evaluator, depth=0):
        ogb = EC.ExpressionComponent(b.accessor, b.type, constint=b.constint, token=b.token, memloc=b.memory_location)
        # the swapping operator is passed on to its own function:
        if op == "<=>":
            return self.swap_op(a,b)

        instrs = ""
        # get the necessary opcode for the operation,
        # and determine if it can be done in one line.
        cmd, oneline = getOnelineAssignmentOp(a, b, op)

        # is the destination a variable...
        vardest = isinstance(a.accessor, Variable)

        if(isinstance(b.accessor, int) and not dwordImmediate(b.accessor)) or a.type.isflt() and b.isconstint():
            b.accessor, _, __, qwordinstr = optloadRegs(
                b, None, "", VOID.copy())
            b.constint = False
            instrs += qwordinstr

        constright = b.isconstint() and not a.type.isflt()  # is the right side of the equation constant

        # invalid leftside
        if(a.isRegister() and not a.memory_location):
            throw(InvalidDestination(a.token))

        instrs += bringdown_memloc(b)
        # if the equation can be done in one 'line'
        if(oneline):

            # if the destination is a variable, and the rightside is a constant
            if(vardest and constright):
                instrs += f"{cmd} {valueOf(a.accessor)}, {valueOf(b.accessor)}\n"
            # if the destination is a variable, and the rightside is not a
            # constant
            elif(vardest):

                # check if implicit casting is needed
                castlock = ralloc(a.type.isflt())
                cst = castABD(a, b, None, b.accessor, castlock)

                # no casting
                if(cst == False):

                    breg, _, __, linstrs = optloadRegs(
                        b, None, op, LONG.copy())
                    instrs += linstrs
                    rfree(castlock)
                # casting
                else:
                    rfree(b.accessor)
                    breg = castlock
                    instrs += cst

                # perform operation
                instrs += f"{cmd} {valueOf(a.accessor)}, {setSize(breg, a.type.csize())}\n"
                rfree(breg)
            # the destination is a pointer held in a register
            else:
                # the rightside is a constant
                if(constright):
                    instrs += f"{cmd} {psizeoft(a.type)}[{setSize(a.accessor,8)}], {valueOf(b.accessor)}\n"
                # the rightside is not a constant
                else:

                    # check if implicit casting is needed
                    castlock = ralloc(a.type.isflt())
                    cst = castABD(a, b, None, b.accessor, castlock)

                    # casting
                    if(cst == False):

                        breg, _, __, linstrs = optloadRegs(
                            b, None, op, LONG.copy())
                        instrs += linstrs
                        rfree(castlock)
                    # no casting
                    else:
                        rfree(b.accessor)
                        breg = castlock
                        instrs += cst
                    # perform operation
                    instrs += f"{cmd} [{setSize(a.accessor,8)}], {setSize(breg, a.type.csize())}\n"
                    rfree(breg)
        # the operation cannot be done in one 'line'
        else:

            # the destination is a variable
            if(vardest):
                
                # do calculation with implicit cast, and store result in b
                tmpstack = [None]
                instrs = self.compile_aopb(EC.ExpressionComponent(a.accessor, a.type,token=a.token), op[:-1], b, evaluator, tmpstack)
                b = tmpstack[1]
                #instrs, _, b = evaluator.performCastAndOperation(
                #    a, b, op[:-1], VOID.copy())


            # the destination is a pointer held by a register
            else:
                # if a is not a register, the destination must be invalid (a
                # constant probably)
                if(not a.isRegister()):
                    throw(InvalidDestination(a.token))

                #avalreg, _, __, loadinst = optloadRegs(
                #    a, None, op, LONG.copy())
                #instrs += loadinst
                # do calculation with implicit cast, and store result in b
                tmpstack = [None]
                opinstr = self.compile_aopb(EC.ExpressionComponent(a.accessor, a.type,token=a.token), op[:-1], b, evaluator, tmpstack)
                b = tmpstack[1]
                
                #opinstr, _, b = evaluator.performCastAndOperation(
                #    EC.ExpressionComponent(avalreg, a.type.copy()), b, op[:-1], VOID.copy())
                instrs += opinstr

            # at this point any arithmatic has been done, and the result
            # is stored in b. So, a recursive call the self.doAssignment with the same
            # a argument, and the new calculated b argument, and the plain "=" argument
            # should correctly move the new value into place.
            movinstr, a.type, b = self.doAssignment(a, b, "=", evaluator, depth+1)
            instrs += movinstr
        
        
        return instrs, a.type.copy(), a

    def normal_semiconstexprheader(self, a, b):
        return bringdown_memlocs(a, b)

    def ternarypartA(self, a, b):  # op == "?"
        newinstr = self.normal_semiconstexprheader(a, b)

        if(len(ternarystack) <= 0):
            throw(UnmatchedTernary(a.token))

        reg, _, __, newinstr = optloadRegs(a, None, "?", LONG.copy())
        cmpinstr, aregec, bregec = ternarystack.pop()
        newinstr += f"test {reg}, {reg}\n"
        newinstr += cmpinstr

        rfree(aregec.accessor)
        rfree(bregec.accessor)
        rfree(reg)
        return newinstr, b.type.copy(), b

    def ternarypartB(self, a, b):  # op == ':'
        newinstr = self.normal_semiconstexprheader(a, b)

        if(a.type.isflt() != b.type.isflt()):
            throw(TypeMismatch(a.token, a.type, b.type))

        areg, breg, __, outinstr = optloadRegs(a, b, ":", LONG.copy())
        areg = setSize(areg, 8)
        breg = setSize(breg, 8)
        resultreg = ralloc(False, size=8)

        newinstr += f"cmovnz {resultreg}, {areg}\ncmovz {resultreg}, {breg}\n"
        ternarystack.append(
            (newinstr, EC.ExpressionComponent(
                areg, a.type), EC.ExpressionComponent(
                breg, b.type)))
        return outinstr, a.type.copy(), EC.ExpressionComponent(
            resultreg, a.type.copy(), token=a.token)

    # Bitshift optimization for multiplication and division by multiples of 2
    def mult_div_optimization(self, a, b, op):
        newinstr = None
        newt = None
        apendee = None

        # multiplication has many special cases:

        # when multiplied by zero, anything will return $LITERAL 0
        # when divided by zero, and error will return
        if (b.accessor == 0):
            if op == "*":
                newinstr = ""
                newt = a.type
                apendee = EC.ExpressionComponent(
                    0, LITERAL, constint=True, token=b.token)
                rfree(a.accessor)
            else:
                throw(DivisionByZero(b.token))

        # when multiplied / divided by one, the value a is returned unmodified
        elif (b.accessor == 1):
            newinstr = ""
            newt = a.type
            apendee = a

        # if the number is an even log2 (can be done via shifting),
        # the bitshift instructions are used instead of mul / imul
        elif(canShiftmul(b.accessor)):
            newinstr = self.normal_semiconstexprheader(a, b)

            newinstr += bringdown_memloc(a)

            areg, ___, _, i = optloadRegs(a, None, op, LONG.copy())
            newinstr += i

            shiftdir = "<<" if op == "*" else ">>"
            newinstr += shiftInt(setSize(areg, a.type.csize()),
                                 shiftmul(b.accessor),
                                 shiftdir,
                                 a.type.signed)

            a.accessor = areg
            apendee = a

        # if the number is <= 10, the lea instruction can be used
        # to generate specialized code faster than an imov / mov instruction.
        elif(b.accessor <= 9 and op == "*"):

            # determine closest lea multiplier
            if b.accessor >= 8:
                shiftval = 8
            elif b.accessor >= 4:
                shiftval = 4
            elif b.accessor >= 2:
                shiftval = 2
            else:
                shiftval = None

            # standard loading...
            newinstr = self.normal_semiconstexprheader(a, b)

            newinstr += bringdown_memloc(a)

            areg, ___, _, i = optloadRegs(a, None, op, LONG.copy())
            newinstr += i
            # actual code
            newinstr += lea_mul_opt(shiftval, areg, a, b)
            # closing
            newt = a.type
            a.accessor = areg
            apendee = a

        elif (op == "/" and a.type.csize() != 8):

            # standard loading...
            newinstr = self.normal_semiconstexprheader(a, b)

            newinstr += bringdown_memloc(a)

            areg, ___, _, i = optloadRegs(a, None, op, LONG.copy())
            newinstr += i

            newinstr += magic_division(a, areg, b.accessor)
            a.accessor = areg
            apendee = a

        newt = a.type.copy()
        return newinstr, newt, apendee

    # shifting by constant value optimization
    def const_shift_optimization(self, a, b, op):
        newinstr = self.normal_semiconstexprheader(a, b)

        areg, ___, _, i = optloadRegs(a, None, op, LONG.copy())
        newinstr += i

        newinstr += shiftInt(setSize(areg, a.type.csize()),
                             b.accessor, op, a.type.signed)
        a.accessor = areg
        apendee = a
        newt = a.type.copy()
        return newinstr, newt, apendee
    # addition or subtraction by one optimization

    def inc_dec_optimization(self, a, b, op):
        newinstr = bringdown_memloc(a)

        areg, ___, _, i = optloadRegs(a, None, op, LONG.copy())
        newinstr += i

        cmd = "inc" if op == '+' else "dec"

        newinstr += Instruction(cmd, [setSize(areg, a.type.csize())])
        a.accessor = areg
        apendee = a
        newt = a.type.copy()
        return newinstr, newt, apendee
    # use of smaller 'test' instruction in place of 'cmp' for particular
    # comparisons

    def test_optimization(self, a, b, op):

        newinstr = bringdown_memlocs(a, b)
        areg, breg, o, ninst = optloadRegs(a, None, op, None)
        newinstr += ninst
        cmp = "z" if op == "==" else "nz"
        newinstr += f"test {setSize(areg, a.type.csize())}, {setSize(areg, a.type.csize())}\nset{cmp} {setSize(areg, 1)}\n"

        return newinstr, BOOL.copy(), EC.ExpressionComponent(
            areg, BOOL.copy(), token=a.token)

    def mod_opt(self, a, b, op):
        newinstr = None
        newt = None
        apendee = None

        if (a.type.csize() < 8 or (canShiftmul(
                b.accessor) and not a.type.isSigned())):
            newinstr = self.normal_semiconstexprheader(a, b)
            areg, ___, _, i = optloadRegs(a, None, op, LONG.copy())
            newinstr += i
            newinstr += magic_modulo(a, areg, b.accessor)
            a.accessor = areg

        return newinstr, a.type, a
    # optimization for operations which do not require both operands in
    # registers

    def noloadOp(self, a, b, op):

        areg, breg, o, newinstr = optloadRegs(a, None, op, None)
        newinstr += bringdown_memlocs(a, b)
        cmd = "add" if op == "+" else "sub"
        newinstr += f"{cmd} {setSize(areg, a.type.csize())}, {b.accessor}\n"
        return newinstr, a.type.copy(), EC.ExpressionComponent(
            areg, a.type.copy(), token=a.token)

    # Check if an operation is a semiconstexpr, and if so what optimizations
    # are possible.
    def check_semiconstexpr_optimization(self, a, b, op, evaluator):
        newinstr = None
        newt = None
        apendee = None
        # if one arg is 0, and can be optimized, add no extra
        # code.
        if(b.accessor == 0 and op in ["+","-","||","|",">>","<<"] and op not in signed_comparisons):
            apendee = a
            newinstr = ""
            newt = a.type.copy()
            return newinstr, newt, apendee

        # indexes of zero can be optimized out by
        # replacing them with a memory_address flag
        elif(b.accessor == 0 and op == "[") and (isinstance(a.accessor, str)):
            a.memory_location = True
            newinstr = bringdown_memloc(a)
            apendee = a
            newt = a.type.copy()
            a.type.ptrdepth -= 1

        # if can be optimized through bitshift
        # multiplication/division
        if(op == "*" or op == "/"):

            newinstr, newt, apendee = self.mult_div_optimization(
                a, b, op)

        elif(op == "%"):
            newinstr, newt, apendee = self.mod_opt(
                a, b, op
            )

        # can be optimized by not loading the constant
        # to a register. (shift by register requires expensive
        # use of cl register specifically)
        elif(op in [">>", "<<"]):

            newinstr, newt, apendee = self.const_shift_optimization(
                a, b, op)

        # can be optimized through the inc or dec
        # operators instead of 'add <...>, 1 '
        elif(op in ["+", "-"] and b.accessor == 1):

            newinstr, newt, apendee = self.inc_dec_optimization(
                a, b, op)

        # can be optimized through reduced register loading
        elif(op in ["+", "-"] and dwordImmediate(b.accessor)):
            newinstr, newt, apendee = self.noloadOp(a, b, op)

        # comparisons with zero can be optimized through the
        # test instruction, followed by the 'z' or 'nz' conditional
        # arguments
        elif(op == "==" or op == "!=") and b.accessor == 0:

            newinstr, newt, apendee = self.test_optimization(
                a, b, op
            )

        # ternary optimizations will by synonymous to their normal form
        # unless both operands are constants:
        if (op == ":"):

            return self.ternarypartB(a, b)

        elif(op == "?"):
            return self.ternarypartA(a, b)

        elif(op in SETTERS):
            return self.doAssignment(a, b, op, evaluator)

        return newinstr, newt, apendee


    def compile_aopb(self, a, op, b, evaluator, stack):
        # special case
        o = VOID.copy()
        instr = ""
        if(a.isconstint() and op in ["?"]):
            stack.append(calculateConstant(a, b, op))

            return ""

        c = None
        if(op in [":"]):
            c = stack.pop()
            stack.append(c)
        # optimize for constant expressions
        if(a.isconstint() and b.isconstint() and (c is None or c.isconstint())):

            stack.append(calculateConstant(a, b, op, c=c))
            return ""

        # if one operand is constant
        elif a.isconstint() and not b.isconstint() and not b.type.isflt() and COMMUNITIVE[op]:
            # setup for communitive property
            tmp = a
            a = b
            b = tmp

        # optimize for semi constexpr
        if(b.isconstint() and not a.isconstint() and not a.type.isflt()):

            # check for and do any possible optimizations
            newinstr, newt, apendee = self.check_semiconstexpr_optimization(
                a, b, op, evaluator)

            # if no valid optimizations couild be made:
            #       do the normal evaluation
            if(newinstr is None):
                newinstr, newt, apendee = evaluator.performCastAndOperation(
                    a, b, op, o)

            # push result
            stack.append(apendee)
            instr += newinstr
            o = newt.copy()

        else:  # no optimizations can be made:

            if (op in SETTERS):
                ninster, o, apendee = self.doAssignment(
                    a, b, op, evaluator)
                instr += ninster
                stack.append(apendee)
            # op is -> or .
            elif(op == T_PTRACCESS or op == T_DOT):
                ninster, o, apendee = evaluator.memberAccess(a, b)
                instr += ninster
                stack.append(apendee)
            # ternary operators:
            elif (op == T_TERNARYQ):

                ninster, o, apendee = self.ternarypartA(a, b)
                instr += ninster
                stack.append(apendee)

            elif (op == T_TERNARYELSE):

                ninster, o, apendee = self.ternarypartB(a, b)
                instr += ninster
                stack.append(apendee)

            # op is any other op
            else:
                newinstr, newt, apendee = evaluator.performCastAndOperation(
                    a, b, op, o)
                stack.append(apendee)
                instr += newinstr
                o = newt.copy()
        return instr

    # evaluate a generated postfix list of EC's

    def evaluatePostfix(self, pfix, evaluator):
        instr = ""
        stack = []      # used for evaluation
        o = LONG.copy()
        for e in pfix:  # for each component
            if(e.isoperation):
                if(not operatorISO(e.accessor)):  # if the operator takes two operands
                    b = stack.pop()              # second operand
                    op = e.accessor              # operation

                    if(len(stack) < 1):
                        if(op == '-'):
                            a = EC.ExpressionComponent(
                                0, LITERAL, constint=True)
                        else:
                            throw(HangingOperator(pfix[-1].token))
                    else:
                        a = stack.pop()              # first operand
                    

                    instr += self.compile_aopb(a, op, b, evaluator, stack)
                    
                else:  # op takes only one operand

                    if(len(stack) < 1):
                        throw(HangingOperator(pfix[-1].token))
                    a = stack.pop()  # operand

                    # op == !
                    if(e.accessor == T_NOT):

                        ninstr, o, apendee = evaluator.evalNot(a)
                        stack.append(apendee)
                        instr += ninstr

                    # op == ~
                    elif(e.accessor == T_ANOT):

                        ninster, o, apendee = evaluator.evalANOT(a)
                        stack.append(apendee)
                        instr += ninster

                    # op == &
                    elif(e.accessor == T_REFRIZE):

                        ninster, o, apendee = evaluator.refrize(a)
                        stack.append(apendee)
                        instr += ninster

                    # op == @
                    elif(e.accessor == T_DEREF):
                        ninster, o, apendee = evaluator.derefrence(a)
                        stack.append(apendee)
                        instr += ninster

                    # op == $<type>
                    elif(e.accessor == T_TYPECAST):

                        ninster, o, apendee = evaluator.typecast(a, e, o)
                        stack.append(apendee)
                        instr += ninster

                    elif(e.accessor == "++" or e.accessor == "--"):

                        ninster, o, apendee = evaluator.incdec(
                            a, e.accessor, o)
                        stack.append(apendee)
                        instr += ninster

                    else:
                        print(e)
                        exit(1)

            else:  # if element is not operator, push to stack
                stack.append(e)

        if(len(stack) != 1):
            throw(HangingOperator(self.fn.current_token))
        final = stack.pop()  # result

        # at this point the result must be properly casted/moved into the
        # specified destination
        o = final.type.copy()

        self.resultflags = final

        return instr, final


############################################
#
#   The RightSideEvaluator is used to evaluate expressions
#       for a final value (as opposed to an address). The RightSizeEvaluator
#       is specially designed for specific expressions. The LeftsizeEvaluator
#       is the default for general expressions.
#
#   In most situations a general ExpressionEvaluator is fine, but a RightSideEvaluator
#       can also be used in special cases.
#
#   For example:
#       int a = 210 / x + y;
#               ~~~~~~~~~~~
#
#   The underlined region would be passed into the RightSideEvaluator
#       as a postfix of Expression Components:
#
#   [ 210, x, /, y, + ]
#
###############################################
class RightSideEvaluator(ExpressionEvaluator):
    def __init__(self, fn):
        self.fn = fn

    # optimization for addition or subtraction by one using 'inc' or 'dec'
    # instructions
    def incdec(self, a, op, o):
        needload = True
        instr = ""
        instr += bringdown_memloc(a)
        #areg, ___, _, i = optloadRegs(a, None, op, LONG.copy())
        #instr += i

        cmd = "inc" if op == "++" else "dec"

        instr += Instruction(cmd, [valueOf(a.accessor)])
        o = a.type.copy()
        return instr, o, a

    # evaluate logical NOT
    def evalNot(self, a):
        # must be bool compatible
        instr = ""
        if(not typematch(BOOL, a.type) and not a.isconstint()):
            throw(TypeMismatch(a.token, BOOL, a.type))

        # bring down memory location
        instr += bringdown_memloc(a)

        # load to register if necessary
        areg, ___, _, i = optloadRegs(a, None, "op", LONG.copy())
        instr += i

        # do not
        instr += boolmath(areg, None, T_NOT)
        o = BOOL.copy()
        return instr, o, EC.ExpressionComponent(
            areg, BOOL.copy(), token=a.token)

    # evaluate bitwise not (~ operator)
    def evalANOT(self, a):
        needload = True
        instr = ""
        instr += bringdown_memloc(a)
        areg, ___, _, i = optloadRegs(a, None, "op", LONG.copy())
        instr += i
        instr += doOperation(a.type, areg, areg, T_ANOT, a.type.signed)
        o = a.type.copy()
        return instr, o, EC.ExpressionComponent(areg, o.copy(), token=a.token)

    # take a reference of a variable
    def refrize(self, a):
        instr = ""
        if(a.isconstint()):

            throw(AddressOfConstant(a.token))

        elif(isinstance(a.accessor, Variable) and not a.accessor.glob):

            if(a.accessor.register is not None):
                throw(AddressOfConstant(a.token))

            result = ralloc(False)
            if(a.accessor.isStackarr or a.accessor.t.members is not None):
                instr += f"lea {result}, [{a.accessor.baseptr}{a.accessor.offset+a.accessor.stackarrsize}]\n"
            else:

                instr += f"lea {result}, [{a.accessor.baseptr}{a.accessor.offset}]\n"
            o = a.type.copy()
            o.ptrdepth += 1
            return instr, o, EC.ExpressionComponent(
                result, o.copy(), token=a.token)

        elif(isinstance(a.accessor, Variable)):

            result = ralloc(False)
            instr += f"mov {result}, {a.accessor.name}\n"
            o = a.type.up()
            return instr, o, EC.ExpressionComponent(
                result, o.copy(), token=a.token)

        elif(a.memory_location):
            a.memory_location = False
            o = a.type.copy()
            o.ptrdepth += 1
            return instr, o, EC.ExpressionComponent(
                a.accessor, o.copy(), token=a.token)

        else:
            throw(AddressOfConstant(a.token))

    # find the value pointed to by a. (same as a[0])
    def derefrence(self, a):
        instr = ""

        if(a.isconstint()):

            throw(AddressOfConstant(a.token))

        # a is variable
        elif(isinstance(a.accessor, Variable)):

            tmp = ralloc(False, a.accessor.t.csize())
            instr += f"mov {tmp}, {valueOf(a.accessor)}\n"
            if(a.accessor.t.isflt()):
                oreg = ralloc(True, a.accessor.t.csize())
                instr += f"movsd {oreg}, [{tmp}]\n"
            else:
                oreg = ralloc(False, a.accessor.t.csize())
                #instr += maskset(oreg, a.type.size(1))
                oreg = setSize(oreg, a.type.size(1))
                instr += f"mov {oreg}, {psizeoft(a.type, 1)}[{tmp}]\n"
            o = a.accessor.t.copy()
            o.ptrdepth -= 1
            rfree(tmp)

            return instr, o, EC.ExpressionComponent(
                oreg, o.copy(), token=a.token)

        # a is register
        elif(a.isRegister()):
            result = ralloc(a.type.isflt(), a.type.csize())
            if(a.type.isflt()):
                instr += f"movsd {result}, [{a.accessor}]\n"
            else:
                #instr += maskset(result, a.type.size(1))
                result = setSize(result, a.type.size(1))
                instr += f"mov {result}, {psizeoft(a.type, 1)}[{a.accessor}]\n"
            rfree(a.accessor)
            o = a.type.copy()
            o.ptrdepth -= 1
            return instr, o, EC.ExpressionComponent(
                result, o.copy(), token=a.token)
        # a exists next on the stack
        elif(a.accessor == "pop"):

            result = ralloc(False, a.type.csize())
            instr += loadToReg(result, a.accessor)
            a.accessor = result
            areg = ralloc(a.type.isflt(), a.type.csize())

            if(a.type.isflt()):
                instr += f"movsd {areg}, [{a.accessor}]\n"
            else:
                #instr += maskset(areg, a.type.size(1))
                areg = setSize(areg, a.type.size(1))
                instr += f"mov {areg}, {psizeoft(a.type, 1)}[{a.accessor}]\n"
            rfree(a.accessor)
            rfree(result)

            o = a.type.copy()
            o.ptrdepth -= 1
            return instr, o, EC.ExpressionComponent(
                areg, o.copy(), token=a.token)

    # cast a to type e
    def typecast(self, a, e, o):
        instr = ""
        t = self.fn.compiler.getType(
            e.type) if isinstance(
            e.type,
            str) else e.type
        if(t is None):
            throw(UnkownType(e.token))
        
        if t.isflt() == a.type.isflt():
            a.type = t
            if a.isRegister():
                a.accessor = setSize(a.accessor, t.csize())
            return "", t, a
        
        
        
        aval = ralloc(a.type.isflt(), a.type.csize())
        result = ralloc(t.isflt(), t.csize())
        
        
        
        instr += bringdown_memloc(a)
        cst = castABD(EC.ExpressionComponent("", t),
                      EC.ExpressionComponent("", a.type), "", aval, result)
        if(cst != False):
            instr += loadToReg(aval, a.accessor)
            instr += cst
            rfree(aval)
            rfree(a.accessor)
            return instr, o, EC.ExpressionComponent(
                result, t.copy(), token=a.token)
        else:
            rfree(aval)
            rfree(result)
            return instr, o, EC.ExpressionComponent(
                a.accessor, t.copy(), token=a.token)

    # (used for rightside evaluation)

    # Do an operation with a op b -> o:DType
    def performCastAndOperation(self, a, b, op, o):
        instr = ""
        apendee = None
        if(op in ["<<", ">>"]):
            if((a.type.isflt() or b.type.isflt())):
                throw(InvalidOperationOperands(a.token, op, a.type, b.type))

        instr += bringdown_memlocs(a, b)

        if(op == "["):
            if(b.type.isflt()):
                throw(UsingFloatAsIndex(b.token))
            if(isinstance(b.accessor, int) and b.accessor == 0):
                areg, breg, o, ninstr = optloadRegs(a, None, op, o)
                instr += ninstr

            else:
                areg, breg, o, ninstr = optloadRegs(a, b, op, o)
                instr += ninstr
                instr += maskset(setSize(breg, 8), sizeOf(breg))
                areg = setSize(areg, 8)
                if(a.type.size(1) in [1, 2, 4, 8]):
                    instr += f"lea {areg}, [{areg}+{setSize(breg,8)}*{a.type.size(1)}]\n"
                else:
                    if(canShiftmul(a.type.size(1))):
                        instr += f"shl {breg}, {shiftmul(a.type.size(1))}\n"
                    else:
                        instr += f"imul {breg}, {a.type.size(1)}\n"
                    instr += f"lea {areg}, [{areg}+{setSize(breg,8)}]\n"
            apendee = (EC.ExpressionComponent(
                areg, a.type.down(), token=a.token))

            # TODO
            #
            # Sometimes setting this to true causes errors

            apendee.memory_location = True

            rfree(breg)

        elif(a.type.__eq__(b.type)):
            # same type

            areg, breg, o, ninstr = optloadRegs(a, b, op, o)
            instr += ninstr
            instr += doOperation(a.type, areg, breg, op,
                                 a.type.signed or b.type.signed)
            if(op in ["==", "!=", ">", "<", "<=", ">="]):
                if(a.type.isflt() or b.type.isflt()):
                    rfree(areg)
                    areg = ralloc_last()
                a.type = BOOL.copy()

            apendee = (EC.ExpressionComponent(areg, a.type, token=a.token))

            rfree(breg)
        else:  # situation is different when casting is directional
            if(not typematch(a.type, b.type) and not typematch(b.type, a.type) and not (a.isconstint() or b.isconstint())):
                throw(TypeMismatch(a.token, a.type, b.type))
            newtype, toConvert = determinePrecedence(a.type, b.type, self.fn)
            o = newtype.copy()

            reverse = False
            if(newtype.__eq__(a.type)):
                # cast to a
                castee = b
                caster = a
            else:
                # cast to b
                castee = a
                caster = b
                reverse = True

            creg, coreg, __, loadinstr = optloadRegs(caster, castee, "op", o)
            instr += loadinstr

            newcoreg = ralloc(caster.type.isflt(), caster.type.csize())

            cst = castABD(caster, castee, creg, coreg, newcoreg)
            # cst represents if actual extra instructions are needed to cast
            if(cst != False):
                instr += cst
            else:
                rfree(newcoreg)
                newcoreg = coreg

            if(reverse):
                tmp = creg
                creg = newcoreg
                newcoreg = tmp
            instr += doOperation(caster.type, creg,
                                 newcoreg, op, caster.type.signed)

            # handle float comparison
            if(op in ["==", "!=", ">", "<", "<=", ">="]):

                if(caster.type.isflt() or castee.type.isflt()):
                    rfree(creg)
                    creg = ralloc_last()
                caster.type = BOOL.copy()
                o = BOOL.copy()

            apendee = (EC.ExpressionComponent(
                creg, caster.type, token=caster.token))
            rfree(newcoreg)
            rfree(coreg)

        return instr, o, apendee

    # access member b of struct a
    def memberAccess(self, a, b):

        temp = LeftSideEvaluator(self.fn)
        return temp.memberAccess(a, b)

        instr = ""
        member = b.accessor
        if(isinstance(member, Variable)):
            member = member.name
        # member as a Variable object
        memv = a.type.getMember(member)
        if(memv is None):
            throw(UnkownIdentifier(b.token))
        o = memv.t.copy()
        # new register

        tmpaddr = ralloc(False)
        instr += loadToReg(tmpaddr, a.accessor)

        rfree(a.accessor)

        instr += f"lea {tmpaddr}, [{tmpaddr}+{memv.offset}]\n"
        apendee = EC.ExpressionComponent(tmpaddr, memv.t.copy(), token=b.token)
        apendee.memory_location = True
        return instr, o, apendee

    # take final result and cast it properly to the destination specified

    def depositFinal(self, final, o, dest):
        instr = ""
        instr += bringdown_memloc(final)

        if(dest == "AMB"):
            if(final.isRegister()):
                rfree(final.accessor)
            return instr, o

        if(isinstance(final.accessor, str) and final.accessor != "pop"):
            final.accessor = setSize(final.accessor, (dest.type.csize()))

        if(isinstance(dest.accessor, str)):
            dest.accessor = setSize(dest.accessor, final.type.csize())

        if(final.type.__eq__(dest.type)):

            if(isinstance(final.accessor, Variable)):
                tmp = ralloc(final.type.isflt(), final.type.csize())
                instr += loadToReg(tmp, final.accessor)

                final.accessor = tmp
                rfree(tmp)
            else:
                rfree(final.accessor)
            instr += loadToReg(dest.accessor, final.accessor)

        else:

            # not needed error
            # if(not typematch(dest.type, final.type)):
            #throw(TypeMismatch(dest.token, dest.type, final.type))

            twoStep = False
            if(isinstance(dest.accessor, Variable)):

                castdest = ralloc(dest.type.isflt(), dest.type.csize())
                twoStep = True
            else:
                castdest = dest.accessor

            if(dest.type.isflt() and not final.type.isflt()):
                if(isinstance(final.accessor, int)):
                    instr += f"mov {rax}, {final.accessor}\n"
                    final.accessor = setSize("rax", final.type.csize())
                elif(final.accessor == "pop"):
                    instr += f"pop {rax}\n"
                    final.accessor = setSize("rax", final.type.csize())
                if(config.GlobalCompiler.Tequals(final.type.name, "void")):

                    cmd = "movq" if(
                        "[" not in valueOf(castdest) +
                        valueOf(
                            final.accessor)) and "xmm" in valueOf(castdest) + valueOf(final.accessor) else "mov"
                    cst = f"{cmd} {valueOf(castdest)}, {valueOf(final.accessor)}\n"

                else:
                    cst = f"cvtsi2sd {valueOf(castdest)}, {valueOf(final.accessor)}\n"
            elif(not dest.type.isflt() and final.type.isflt()):
                if(final.accessor == "pop"):
                    instr += f"pop {rax}\nmovq {xmm7}, {rax}\n"
                    final.accessor = "xmm7"
                if(config.GlobalCompiler.Tequals(dest.type.name, "void")):
                    cmd = "movq" if(
                        "[" not in valueOf(castdest) +
                        valueOf(
                            final.accessor)) and "xmm" in valueOf(castdest) + valueOf(final.accessor) else "mov"
                    cst = f"{cmd} {valueOf(castdest)}, {valueOf(final.accessor)}\n"

                else:
                    cst = f"cvttsd2si {valueOf(castdest)}, {valueOf(final.accessor)}\n"
            else:
                cst = False

            if(cst != False):
                instr += cst
                if(twoStep):
                    instr += loadToReg(dest.accessor, castdest)

            else:
                source = final.accessor
                if(isinstance(final.accessor, Variable)):
                    instr += loadToReg(castdest, final.accessor)
                    source = castdest
                instr += loadToReg(dest.accessor, source)

            if(final.isRegister()):
                rfree(final.accessor)

            rfree(castdest)
        return instr, o

    def evaluate(self, dest, pfix):
        instr, final = self.evaluatePostfix(pfix, self)
        ninster, o = self.depositFinal(final, final.type, dest)

        return instr + ninster, o


############################################
#
#   The LeftSideEvaluator is used to evaluate expressions
#       for a destination address.
#
#   For example:
#       array[0]->chars[36] = 'a';
#       ~~~~~~~~~~~~~~~~~~~
#
#   The underlined region would be passed into the LeftSideEvaluator
#       as a postfix of Expression Components:
#
#   [ array, 0, [, chars, 36, [, -> ]
#
#
#   LeftSideEvaluator is also the default for general expressions
#   that will include a SETTER ("=", "+=", etc...) operator.
#   It is specialized for that purpose.
#
###############################################
class LeftSideEvaluator(ExpressionEvaluator):
    def __init__(self, fn):
        self.fn = fn
    # optimization for addition or subtraction by 1 using 'inc' or 'dec'
    # instructions

    def incdec(self, a, op, o):
        needload = True
        instr = ""
        instr += bringdown_memloc(a)

        cmd = "inc" if op == "++" else "dec"

        instr += Instruction(cmd, [valueOf(a.accessor, exactSize=True)])
        o = a.type.copy()
        return instr, o, a

    # Do an operation with a op b -> o:DType

    def performCastAndOperation(self, a, b, op, o):
        instr = ""
        apendee = None

        # Generalized Leftside operation evaluation is only different for the
        # '[' operator.
        if(op == "["):
            if(b.type.isflt()):
                throw(UsingFloatAsIndex(b.token))

            instr += bringdown_memlocs(a, b)

            if(isinstance(b.accessor, int) and b.accessor == 0):
                areg, breg, o, ninstr = optloadRegs(a, None, op, o)
                instr += ninstr

            else:
                areg, breg, o, ninstr = optloadRegs(a, b, op, o)
                #instr += zeroize(setSize(breg, 8))
                instr += ninstr
                instr += maskset(setSize(breg, 8), sizeOf(breg))
                areg = setSize(areg, 8)
                if(a.type.size(1) in [1, 2, 4, 8]):
                    instr += f"lea {areg}, [{areg}+{setSize(breg,8)}*{a.type.size(1)}]\n"
                else:
                    if(canShiftmul(a.type.size(1))):
                        instr += f"shl {breg}, {shiftmul(a.type.size(1))}\n"
                    else:
                        instr += f"imul {breg}, {a.type.size(1)}\n"
                    instr += f"lea {areg}, [{areg}+{setSize(breg,8)}]\n"

            apendee = (EC.ExpressionComponent(
                areg, a.type.down(), token=a.token))
            apendee.memory_location = True
            rfree(breg)

            return instr, o, apendee

        # Leftside evaluation for general operations is the same as rightside evaluation,
        # so unless the above conditions are met, a RightSideEvaluator can be used for common
        # operations.
        rev = RightSideEvaluator(self.fn)
        return rev.performCastAndOperation(a, b, op, o)

    # access member b of struct a
    def memberAccess(self, a, b):
        instr = ""
        member = b.accessor
        if(isinstance(member, Variable)):
            member = member.name
        memv = a.type.getMember(member)
        if(memv is None):
            print(a, b, member, a.type.members)

            throw(UnkownIdentifier(b.token))

        o = memv.t.copy()

        if(a.member_loc > 1):
            a.memory_location = True
            instr += bringdown_memloc(a)
            a.member_loc = False

        tmpaddr = ralloc(False)
        instr += loadToReg(tmpaddr, a.accessor)

        if(memv.offset != 0):
            instr += f"lea {tmpaddr}, [{tmpaddr}+{memv.offset}]\n"

        rfree(a.accessor)
        return instr, o, EC.ExpressionComponent(
            tmpaddr, memv.t.copy(), token=b.token, memloc=True, memhint=a.member_loc + 1)

    # evaluate logical NOT
    def evalNot(self, a):
        instr = ""
        if(not typematch(BOOL, a.type) and not a.isconstint()):
            throw(TypeMismatch(a.token, BOOL, a.type))

        areg, ___, _, i = optloadRegs(a, None, "op", LONG.copy())
        instr += i
        instr += boolmath(areg, None, T_NOT)
        o = BOOL.copy()
        return instr, o, EC.ExpressionComponent(
            areg, BOOL.copy(), token=a.token)

    # evaluate bitwize not
    def evalANOT(self, a):
        instr = ""
        needload = True
        areg, ___, _, i = optloadRegs(a, None, "op", LONG.copy())
        instr += i
        instr += doOperation(a.type, areg, areg, T_ANOT, a.type.signed)
        o = a.type.copy()
        return instr, o, EC.ExpressionComponent(areg, o.copy(), token=a.token)

    # take pointer to a
    def refrize(self, a):
        instr = ""
        if(a.isconstint()):

            throw(AddressOfConstant(a.token))

        elif(isinstance(a.accessor, Variable) and not a.accessor.glob):

            if(a.accessor.register is not None):
                throw(AddressOfConstant(a.token))
            result = ralloc(False)
            if(a.accessor.isStackarr):
                instr += f"lea {result}, [{a.accessor.baseptr}{a.accessor.offset+a.accessor.stackarrsize}]\n"
            else:

                instr += f"lea {result}, [{a.accessor.baseptr}{a.accessor.offset}]\n"
            o = a.type.copy()
            o.ptrdepth += 1
            return instr, o, EC.ExpressionComponent(
                result, o.copy(), token=a.token)

        elif(isinstance(a.accessor, Variable)):

            result = ralloc(False)
            instr += f"mov {result}, {a.accessor.name}\n"
            o = a.type.up()
            return instr, o, EC.ExpressionComponent(
                result, o.copy(), token=a.token)

        else:
            throw(AddressOfConstant(a.token))

    # get value pointed to by a. (same as a[0])
    def derefrence(self, a):

        if(a.isconstint()):

            throw(AddressOfConstant(a.token))

        instr = bringdown_memloc(a)
        areg, breg, o, ninstr = optloadRegs(a, None, "[", VOID.copy())
        instr += ninstr
        out = instr, a.type.down(), EC.ExpressionComponent(
            areg, a.type.down(), memloc=True)
        return out

    # cast a to type e
    def typecast(self, a, e, o):

        return RightSideEvaluator(self.fn).typecast(a, e, o)

        instr = ""
        tid = e.type
        t = self.fn.compiler.getType(tid)
        if(t is None):
            throw(UnkownType(e.token))
        aval = ralloc(a.type.isflt(), a.type.csize())
        result = ralloc(t.isflt(), t.csize())
        cst = castABD(EC.ExpressionComponent("", t),
                      EC.ExpressionComponent("", a.type), "", aval, result)
        if(cst != False):
            instr += loadToReg(aval, a.accessor)
            instr += cst
            rfree(aval)
            rfree(a.accessor)
            appendee = EC.ExpressionComponent(result, t.copy(), token=a.token)
        else:
            rfree(aval)
            rfree(result)
            appendee = EC.ExpressionComponent(
                a.accessor, t.copy(), token=a.token)
        return instr, o, appendee

    # no deposit is necessary for leftside evaluation
    def depositFinal(self, final):
        print(final)
        return final

    # main wrapper
    def evaluate(self, pfix):

        out = self.evaluatePostfix(pfix, self)

        return out
