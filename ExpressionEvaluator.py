from typing import *

import Classes.ExpressionComponent as EC
from Assembly.CodeBlocks import (boolmath, cast_regUp, castABD,
                                 createFloatConstant, deregisterizeValueType,
                                 doOperation, fncall, getComparater,
                                 getOnelineAssignmentOp, lea_mul_opt,
                                 lea_struct, loadToReg, magic_division,
                                 magic_modulo, maskset, moveParameterVector,
                                 registerizeValueType, shiftInt, shiftmul,
                                 valueOf, zeroize, moveVector)
from Assembly.Instructions import (ONELINE_ASSIGNMENTS, Instruction,
                                   floatTo32h, floatTo64h, signed_comparisons)
from Assembly.Registers import *
from Assembly.TypeSizes import dwordImmediate, psizeof, psizeoft
from Classes.Constexpr import calculateConstant, ternarystack
from Classes.DType import *
from Classes.Error import *
from Classes.Token import *
from Classes.Variable import Variable
from globals import (BOOL, CHAR, COMMUNITIVE, DOUBLE, INT, INTRINSICS, LITERAL,
                     LONG, SHORT, VOID, canShiftmul, operatorISO)


###########################
#   bringdown_memloc takes an expression component
#       and returns the instructions necessary
#       to reduce its pointer depth by one.
#       (used for member access and arrays)
############################
def bringdown_memloc(a: EC.ExpressionComponent) -> str:
    instr = ""
    if(a.memory_location):

        # floats need to use their own 'movsd' instruction
        if a.type.isflt():
            out = ralloc(True)
            instr += f"movsd {out}, [{setSize(a.accessor, 8)}]\n"
            rfree(a.accessor)
            a.accessor = out
        else:

            if a.type.isintrinsic() or a.type.function_template is not None:
                instr += f"mov {setSize( a.accessor, a.type.csize())}, {psizeoft(a.type)}[{setSize(a.accessor,8)}]\n"
                a.accessor = setSize(a.accessor, a.type.csize())
            else:

                tempvar = Variable(
                    a.type, '__tmp__', bpr=setSize(
                        a.accessor, 8) + '+')
                reginstr, _, __, ___ = registerizeValueType(
                    a.type, tempvar, -1, 0)
                instr += reginstr
                rfree(a.accessor)
                a.accessor = "rax" if a.type.s <= 8 else (
                    "xmm0" if a.type.s <= 16 else (
                        'xmm0' if a.type.s <= 32 else "rax"))

        # once a memloc has been lowered, it is no longer representable, for compiler purposes, as a
        # memory location.
        # It can still be dereferenced again by the user, but the compiler will not see it strictly as
        # an address anymore.
        a.memory_location = False

    return instr

# do two bringdown_memloc calls in one


def bringdown_memlocs(a: EC.ExpressionComponent,
                      b: EC.ExpressionComponent) -> str:
    return bringdown_memloc(a) + bringdown_memloc(b)


class ExpressionEvaluator:
    '''
        The ExpressionEvaluator class contains functions shared by
        Leftside and Rightside evaluators. This is mostly functions for
        semi-constexpr optimizations (int operations with one constant and one var).
        Assignments are also layed out in depth in the normal ExpressionEvaluator class.
    '''

    def __init__(self, fn):
        self.fn = fn
        self.resultflags = None

        self.value_cache = {}

    def optloadRegs(self, a: EC.ExpressionComponent, b: EC.ExpressionComponent,
                    op: str, o: DType, constvalok: bool = False) -> Tuple[str, str, DType, str]:
        #############################
        # optloadRegs is used to load
        #   two values into registers,
        #   unless they already exist in registers.
        #   This function ensures that values are
        #   loaded as few times as possible.
        ############################
        instr = ""
        # o represents an output type to classify the two given components
        o = a.type.copy()
        # areg is a register for a, and breg is a register for b
        areg = ""
        breg = ""
        # if a and b already have registers allocated to them, they might not need to
        # be loaded again
        needLoadA = True
        needLoadB = True
        # sometimes a does not need to be loaded if it is an immediate and the operation
        # allows it
        overrideAload = False

        # check if a constant can be used in place of a register
        if (constvalok and isinstance(a.accessor, int)
                and dwordImmediate(a.accessor)):
            areg = a.accessor
            if b is None:
                return areg, None, o, ""
            overrideAload = True

        # check if a constant can be used in place of a register
        if (b is not None and constvalok and isinstance(
                b.accessor, int) and dwordImmediate(a.accessor)):
            breg = b.accessor
            return areg, breg, o, instr

        # override a load if constant can be used
        if(a.isRegister() or overrideAload) and not (a.accessor == setSize('rax', a.type.csize())):
            areg = a.accessor
            needLoadA = False

        else:
            # if not, a new register can be allocated
            if op not in ["*", "/", "%"] or a.type.isflt():
                areg = ralloc(a.type.isflt(), size=a.type.csize())
            else:
                areg = setSize("rax", a.type.csize())

        # sometimes this function is called with None for b if the caller just wants to load a,
        # so if b is not None, it will be loaded in a similar way to a.
        if(b is not None):

            # when b is a constant, it adopts a's type
            if (b.isconstint()):
                b.type.s = a.type.s

            # if b is a register, it doesn't need to be loaded
            if(b.isRegister()):
                breg = b.accessor
                needLoadB = False

            else:
                # if b needs to be loaded, a new register is allocated for it
                breg = ralloc(b.type.isflt(), size=b.type.csize())

            if(needLoadB):
                # when necessary, b's value is loaded to it's new register
                instr += loadToReg(breg, b.accessor)

        if(needLoadA):
            # when necessary, a's value is loaded to it's new register
            instr += loadToReg(areg, a.accessor)

        # this function can be called using 'None' in order to be
        # used statically.
        # otherwise, caching can be done to optimize expressions.
        if (self is not None):
            pass

        return areg, breg, o, instr

    def overloadHeader(self):
        out = ""
        if self.fn.memberfn:
            out += "push rdi\n"
        return out

    def overloadFooter(self):
        out = ""
        if self.fn.memberfn:
            out += "pop rdi\n"
        return out

    def performCastAndGeneralizedOperation(self, fn, a, b, op, o):
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
                areg, breg, o, ninstr = self.optloadRegs(a, None, op, o)
                instr += ninstr

            else:
                areg, breg, o, ninstr = self.optloadRegs(a, b, op, o)
                instr += ninstr

                if sizeOf(breg) < 8:
                    instr += cast_regUp("rax", breg, b.type.signed)
                    rfree(breg)
                    breg = "rax"

                areg = setSize(areg, 8)
                oreg = ralloc(False)
                if(a.type.size(1) in [1, 2, 4, 8]):
                    instr += f"lea {oreg}, [{areg}+{setSize(breg,8)}*{a.type.size(1)}]\n"
                else:
                    if(canShiftmul(a.type.size(1))):
                        instr += f"shl {breg}, {shiftmul(a.type.size(1))}\n"
                    else:
                        instr += f"imul {breg}, {a.type.size(1)}\n"
                    instr += f"lea {oreg}, [{areg}+{setSize(breg,8)}]\n"
                rfree(areg)
            apendee = (EC.ExpressionComponent(
                oreg, a.type.down(), token=a.token))

            # TODO
            #
            # Sometimes setting this to true causes errors

            apendee.memory_location = True

            rfree(breg)

        elif(a.type.__eq__(b.type)):
            # same type
            areg, breg, o, ninstr = self.optloadRegs(a, b, op, o)
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
            if(not typematch(a.type, b.type, True) and not typematch(b.type, a.type, True) and not (a.isconstint() or b.isconstint())):
                throw(TypeMismatch(a.token, a.type, b.type))
            newtype, toConvert = determinePrecedence(a.type, b.type, fn)
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

            creg, coreg, __, loadinstr = self.optloadRegs(
                caster, castee, op, o)
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

    # swap_op refers to the swap operator '<=>'

    def swap_op(self, a: EC.ExpressionComponent,
                b: EC.ExpressionComponent) -> Tuple[str, DType, EC.ExpressionComponent]:

        # normal setup:
        apendee = b
        newt = b.type
        inst = self.normal_semiconstexprheader(a, b)

        # load registers:
        areg, breg, _, linstrs = self.optloadRegs(a, b, "<=>", VOID.copy())
        inst += linstrs

        # When a is a stack-based variable:
        if isinstance(a.accessor, Variable) and a.accessor.register is None:
            # This sort of swapping between memory is already implimented
            # in the loadToReg function:
            inst += loadToReg(b.accessor, areg)
            inst += loadToReg(a.accessor, breg)
            # cleanup
            b.accessor = breg
            rfree(areg)
        # When b is a stack-based variable:
        elif isinstance(b.accessor, Variable) and b.accessor.register is None:
            # This sort of swapping between memory is already implimented
            # in the loadToReg function:
            inst += loadToReg(a.accessor, breg)
            inst += loadToReg(b.accessor, areg)
            # cleanup
            b.accessor = breg
            rfree(areg)
        # When a and b are both held in registers
        else:
            tmp = ralloc(b.type.isflt() and a.type.isflt())
            inst += loadToReg(tmp, areg)
            inst += loadToReg(a.accessor, breg)
            inst += loadToReg(b.accessor, tmp)
            rfree(tmp)
            rfree(areg)
            b.accessor = breg

        # (The value of b is returned in the expression)
        return inst, newt, apendee

    # Any assignments will be handled in this function.
    # This includes operators like '+=', '-=', etc...

    def doAssignment(self, a, b, op, evaluator,
                     optoken, depth=0) -> Tuple[str, DType, EC.ExpressionComponent]:
        ogb = EC.ExpressionComponent(
            b.accessor,
            b.type,
            constint=b.constint,
            token=b.token,
            memloc=b.memory_location)
        # the swapping operator is passed on to its own function:
        if op == "<=>":
            return self.swap_op(a, b)

        atesttype = a.type
        btesttype = b.type
        if not typematch(atesttype, btesttype, True):
            print(
                atesttype,
                btesttype,
                self.fn.compiler.getType(
                    atesttype.name))
            throw(TypeMismatch(a.token, atesttype, btesttype))

        instrs = ""
        # get the necessary opcode for the operation,
        # and determine if it can be done in one line.
        cmd, oneline = getOnelineAssignmentOp(a, b, op)

        # is the destination a variable...
        vardest = isinstance(a.accessor, Variable)

        if(isinstance(b.accessor, int) and not dwordImmediate(b.accessor)) or (a.type.isflt() and b.isconstint()):
            b.accessor, _, __, qwordinstr = self.optloadRegs(
                b, None, "", VOID.copy())
            b.constint = False
            instrs += qwordinstr

        # is the right side of the equation constant
        constright = b.isconstint() and not a.type.isflt()

        # invalid leftside
        # if(a.isRegister() and not (a.memory_location or a.member_loc)):
        #    throw(InvalidDestination(a.token))

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
                if b.accessor == "pop":
                    newbreg = ralloc(b.type.isflt())
                    instrs += loadToReg(newbreg, b.accessor)
                    b.accessor = newbreg
                cst = castABD(a, b, None, b.accessor, castlock)

                # no casting
                if(cst == False):

                    breg, _, __, linstrs = self.optloadRegs(
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
                    if b.accessor == "pop":
                        newbreg = ralloc(b.type.isflt())
                        instrs += loadToReg(newbreg, b.accessor)
                        b.accessor = newbreg
                    cst = castABD(a, b, None, b.accessor, castlock)

                    # casting
                    if(cst == False):

                        breg, _, __, linstrs = self.optloadRegs(
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
                instrs = self.compile_aopb(EC.ExpressionComponent(
                    a.accessor, a.type, token=a.token), op[:-1], b, evaluator, tmpstack, optoken)
                b = tmpstack[1]
                # instrs, _, b = evaluator.performCastAndOperation(
                #    a, b, op[:-1], VOID.copy())

            # the destination is a pointer held by a register
            else:
                # if a is not a register, the destination must be invalid (a
                # constant probably)
                if(not a.isRegister()):
                    throw(InvalidDestination(a.token))

                # avalreg, _, __, loadinst = self.optloadRegs(
                #    a, None, op, LONG.copy())
                #instrs += loadinst
                # do calculation with implicit cast, and store result in b
                tmpstack = [None]

                opinstr = self.compile_aopb(EC.ExpressionComponent(
                    a.accessor, a.type, token=a.token), op, b, evaluator, tmpstack,
                    optoken)
                b = tmpstack[1]

                # opinstr, _, b = evaluator.performCastAndOperation(
                # EC.ExpressionComponent(avalreg, a.type.copy()), b, op[:-1],
                # VOID.copy())
                instrs += opinstr

            # at this point any arithmatic has been done, and the result
            # is stored in b. So, a recursive call the self.doAssignment with the same
            # a argument, and the new calculated b argument, and the plain "=" argument
            # should correctly move the new value into place.
            movinstr, a.type, b = self.doAssignment(
                a, b, "=", evaluator, optoken, depth + 1)
            instrs += movinstr

        return instrs, a.type.copy(), a

    # normal_semiconstexprheader is a wrapper for the normal operations needed at the begining
    # of a semiconstexpr handler, and often also in other handlers.
    def normal_semiconstexprheader(
            self, a, b) -> Tuple[str, DType, EC.ExpressionComponent]:
        return bringdown_memlocs(a, b)

    # Compile the first half of a ternary operation
    def ternarypartA(self, a, b):  # op == "?"
        # standard header
        newinstr = self.normal_semiconstexprheader(a, b)
        # check for other half
        if(len(ternarystack) <= 0):
            throw(UnmatchedTernary(a.token))
        # load regs
        reg, _, __, newinstr = self.optloadRegs(a, None, "?", LONG.copy())
        # load info from other half
        cmpinstr, aregec, bregec = ternarystack.pop()
        # test value of ternary
        newinstr += f"test {reg}, {reg}\n"
        newinstr += cmpinstr
        # cleanup
        rfree(aregec.accessor)
        rfree(bregec.accessor)
        rfree(reg)
        return newinstr, b.type.copy(), b

    # Compile the second half of a ternary operation
    # op == ':'
    def ternarypartB(self, a, b) -> Tuple[str, DType, EC.ExpressionComponent]:
        # standard header
        newinstr = self.normal_semiconstexprheader(a, b)

        # check type mismatch
        if(a.type.isflt() != b.type.isflt()):
            throw(TypeMismatch(a.token, a.type, b.type))
        # load regs
        areg, breg, __, outinstr = self.optloadRegs(a, b, ":", LONG.copy())
        areg = setSize(areg, 8)
        breg = setSize(breg, 8)
        resultreg = ralloc(False, size=8)
        # conditional move the new values in
        newinstr += f"cmovnz {resultreg}, {areg}\ncmovz {resultreg}, {breg}\n"
        # place info on the ternary stack for the ternarypartA function
        ternarystack.append(
            (newinstr, EC.ExpressionComponent(
                areg, a.type, token=a.token), EC.ExpressionComponent(
                breg, b.type, token=b.token)))
        return outinstr, a.type.copy(), EC.ExpressionComponent(
            resultreg, a.type.copy(), token=a.token)

    # Bitshift optimization for multiplication and division by multiples of 2
    def mult_div_optimization(
            self, a, b, op) -> Tuple[str, DType, EC.ExpressionComponent]:
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

            areg, ___, _, i = self.optloadRegs(a, None, op, LONG.copy())
            newinstr += i

            shiftdir = op
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

            areg, ___, _, i = self.optloadRegs(a, None, op, LONG.copy())
            newinstr += i
            # actual code
            newinstr += lea_mul_opt(shiftval, areg, a, b)
            # closing
            newt = a.type
            a.accessor = areg
            apendee = a

        elif (op == "/"):

            # standard loading...
            newinstr = self.normal_semiconstexprheader(a, b)

            newinstr += bringdown_memloc(a)

            areg, ___, _, i = self.optloadRegs(a, None, op, LONG.copy())
            newinstr += i

            newinstr += magic_division(a, areg, b.accessor)
            a.accessor = areg
            apendee = a

        newt = a.type.copy()
        return newinstr, newt, apendee

    # shifting by constant value optimization
    def const_shift_optimization(
            self, a, b, op) -> Tuple[str, DType, EC.ExpressionComponent]:
        # standard header
        newinstr = self.normal_semiconstexprheader(a, b)
        # load regs
        areg, ___, _, i = self.optloadRegs(a, None, op, LONG.copy())
        newinstr += i
        # shift operation
        newinstr += shiftInt(setSize(areg, a.type.csize()),
                             b.accessor, op, a.type.signed)
        # closing
        a.accessor = areg
        apendee = a
        newt = a.type.copy()
        return newinstr, newt, apendee
    # addition or subtraction by one optimization

    def inc_dec_optimization(self, a, b, op) -> Tuple[str,
                                                      DType, EC.ExpressionComponent]:
        # header
        newinstr = bringdown_memloc(a)
        # load reg
        areg, ___, _, i = self.optloadRegs(a, None, op, LONG.copy())
        newinstr += i

        # deterine opcode
        cmd = "inc" if op == '+' else "dec"
        # actual instruction
        newinstr += Instruction(cmd, [setSize(areg, a.type.csize())])
        # cleanup
        a.accessor = areg
        apendee = a
        newt = a.type.copy()
        return newinstr, newt, apendee
    # use of smaller 'test' instruction in place of 'cmp' for particular
    # comparisons

    def test_optimization(
            self, a, b, op) -> Tuple[str, DType, EC.ExpressionComponent]:
        # header
        newinstr = bringdown_memlocs(a, b)
        # load regs
        areg, breg, o, ninst = self.optloadRegs(a, None, op, None)
        newinstr += ninst
        # determine conditional opcode
        cmp = "z" if op == "==" else "nz"
        # instruction
        newinstr += f"test {setSize(areg, a.type.csize())}, {setSize(areg, a.type.csize())}\nset{cmp} {setSize(areg, 1)}\n"

        return newinstr, BOOL.copy(), EC.ExpressionComponent(
            areg, BOOL.copy(), token=a.token)

    def mod_opt(self, a, b, op) -> Tuple[str, DType, EC.ExpressionComponent]:
        newinstr = None
        newt = None
        apendee = None
        # magic modulo optimization:
        if (a.type.csize() < 9 or (canShiftmul(
                b.accessor) and not a.type.isSigned())):
            newinstr = self.normal_semiconstexprheader(a, b)
            areg, ___, _, i = self.optloadRegs(a, None, op, LONG.copy())
            newinstr += i
            newinstr += magic_modulo(a, areg, b.accessor)
            a.accessor = areg

        return newinstr, a.type, a

    # optimization for operations which do not require both operands in
    # registers
    def noloadOp(self, a, b, op) -> Tuple[str, DType, EC.ExpressionComponent]:

        # load regs
        areg, breg, o, newinstr = self.optloadRegs(a, None, op, None)
        newinstr += bringdown_memlocs(a, b)
        # determine opcode
        cmd = "add" if op == "+" else "sub"
        # instruction
        newinstr += f"{cmd} {setSize(areg, a.type.csize())}, {b.accessor}\n"

        return newinstr, a.type.copy(), EC.ExpressionComponent(
            areg, a.type.copy(), token=a.token)

    def makeFloatImmediate(self, e):
        instr = ""
        flthex = floatTo32h(
            float(
                e.accessor.initializer)) if e.type.csize() == 4 else floatTo64h(
            float(
                e.accessor.initializer))
        instr += loadToReg("rax", flthex)
        reg = ralloc(True)
        instr += Instruction("movq", [reg, "rax"])
        return EC.ExpressionComponent(
            reg,
            e.type.copy(),
            token=e.token

        ), instr

    # Check if an operation is a semiconstexpr, and if so what optimizations
    # are possible.

    def check_semiconstexpr_optimization(self, a, b, op, evaluator, optoken):
        newinstr = None
        newt = None
        apendee = None
        # if one arg is 0, and can be optimized, add no extra
        # code.
        if(b.accessor == 0 and op in ["+", "-", "||", "|", ">>", "<<"] and op not in signed_comparisons):
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
            return self.doAssignment(a, b, op, evaluator, optoken)

        return newinstr, newt, apendee

    def compile_aopb(self, a, op, b, evaluator, stack, optoken):
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

        # check for integer-based floating point literals
        if (a.type.isflt() and b.isconstint()):

            flthex = floatTo32h(
                float(
                    b.accessor)) if a.type.csize() == 4 else floatTo64h(
                float(
                    b.accessor))
            instr += loadToReg("rax", flthex)
            reg = ralloc(True)
            instr += Instruction("movq", [reg, "rax"])
            b = EC.ExpressionComponent(
                reg,
                a.type.copy(),
                token=b.token

            )

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
                a, b, op, evaluator, optoken)

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
                    a, b, op, evaluator, optoken)
                instr += ninster
                stack.append(apendee)
            # op is -> or .
            elif(op == T_PTRACCESS or op == T_DOT):
                ninster, o, apendee = evaluator.memberAccess(a, b, optoken)
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

    def buildDefaultOperatorEquals(self, a, b, evaluator, stack):
        instr = ""
        if isinstance(b.accessor, Variable):
            ninstr, _, __, ___ = registerizeValueType(
                b.type, b.accessor, -1, 0)
        elif not b.type.isintrinsic():
            ninstr = moveParameterVector(b.type.csize(), b.accessor, -1, 0)
        else:
            ninstr, _, __, ___ = registerizeValueType(b.type, Variable(
                b.type, "__tmp__", bpr=b.accessor + '+'
            ), -1, 0)
        instr += ninstr

        if isinstance(a.accessor, Variable):
            ninstr, _, __ = deregisterizeValueType(a.type, a.accessor, -1, 0)
        else:
            ninstr, _, __ = deregisterizeValueType(a.type, Variable(
                a.type, "__tmp__", bpr=a.accessor + '+'
            ), -1, 0)

        instr += ninstr
        rfree(a.accessor)
        stack.append(b)

        return instr

    def compile_memberAccessOverload(self, a, b, evaluator, stack):
        """
        - compile_memberAccessOverload serves to handle the special case where the '->' operator is overloaded.
        In this case, there are two operands provided on the compiler level, but only one on the assembly level.
        This is the only operator that satisfies the above condition, so it has its own special case here.

        - The register dependencies handled by ExpressionEvaluator.overloadHeader() and ExpressionEvaluator.overloadFooter()
        are handled by the caller for this function.
        """
        instr = ""

        # get the actual overload
        overload = a.type.getOpOverload('->')
        if overload is None:
            throw(NoOverloadOp(a.token, a.type, "", op))
        # legacy
        o = overload.returntype.copy()

        # load single assembly-level parameter
        if a.memory_location and a.isRegister():
            instr += f"mov rdi, {a.accessor}\n"
        else:
            instr += lea_struct('rdi', a)
        # old value is irrevelant
        rfree(a.accessor)
        # check if the return value will be in an xmm/ymm register
        fltret = overload.returntype.isflt() or overload.returntype.csize() > 8

        # determine output register
        oreg = norm_return_register if not fltret else sse_return_register

        # call overload
        instr += fncall(overload)

        # determine new leftside to this template: (left)->(right)
        newleft = EC.ExpressionComponent(
            oreg, o, token=a.token
        )
        # perform the member access using the new left value
        ninstr, o, apendee = evaluator.memberAccess(newleft, b, Token(
            '->', '->', a.token.start, a.token.end
        ))
        # close up
        instr += ninstr
        stack.append(apendee)

        return instr

    # compile the overloaded operator of type a.type, with input b

    def compile_AoverloadB(self, a, op, b, evaluator, stack):
        # handle potential register dependencies
        instr = self.overloadHeader()
        """"""
        # TODO::
        #       Make sure to bringdown memlocks here!
        """"""

        # check for special case with member access
        if op == "->":
            return instr + self.compile_memberAccessOverload(
                a, b, evaluator, stack) + self.overloadFooter()

        # check to see if this type has an overload for this operation
        overload = a.type.getOpOverload(op, b.type)
        if overload is None:
            # if not:
            # special case with default copy overload
            if op == "=" and self.fn.compiler.Tequals(
                    a.type.name, b.type.name):
                return instr + self.buildDefaultOperatorEquals(
                    a, b, evaluator, stack) + self.overloadFooter()
            # otherwise, throw an error
            throw(NoOverloadOp(a.token, a.type, b.type, op))

        # check if the overload returns with an xmm/ymm/r register
        fltret = overload.returntype.isflt() or overload.returntype.csize() > 8
        # check if the overload expects an xmm/ymm/r register
        fltparam = overload.parameters[1].t.isflt()

        # Load the parameter:

        # if the parameter is primitive, it is a simple loadToReg
        if b.type.isintrinsic():
            instr += loadToReg(
                norm_parameter_registers[1] if not fltparam
                else sse_parameter_registers[0],
                b.accessor)
        # otherwise, it needs to be vectorized
        else:
            if isinstance(b.accessor, Variable):
                ninstr, _, __, ___ = registerizeValueType(
                    b.type, b.accessor, 1, 0)
            else:

                ninstr, _, __, ___ = registerizeValueType(b.type, Variable(
                    b.type, "__tmp__", bpr=b.accessor + '+'
                ), 1, 0)

            instr += ninstr

        # the value for 'this' can be loaded:
        if a.memory_location and a.isRegister():
            instr += f"mov rdi, {a.accessor}\n"
        else:
            instr += lea_struct('rdi', a)

        # the old value of a is now garbage
        rfree(a.accessor)

        # call the overload
        instr += fncall(overload)
        # begin cleanup:

        # returntype
        rett = self.fn.compiler.getType(overload.returntype.name)
        # allocate a new register for the return value of this overload
        output = ralloc(fltret, rett.csize())

        # if the returntype is primitive, it can be loaded to its new register
        # with a simple loadToReg
        if rett.isintrinsic():
            instr += loadToReg(output,
                               norm_return_register if not fltret else sse_return_register)
        # otherwise, it needs to be vector moved
        else:
            instr += moveVector(rett.csize(), output,
                                norm_return_register if rett.csize() <= 8 else sse_return_register)

        # the new expression value can be added to the stack
        stack.append(
            EC.ExpressionComponent(output, rett.copy(), token=a.token)
        )
        # b's value is now also garbage
        rfree(b.accessor)

        # closing for register dependencies
        instr += self.overloadFooter()
        return instr

    # compile a implicit cast of struct b to type a.type

    def compile_implicitCastBtoA(self, a, op, b, evaluator, stack):
        pass

    # compile the overloaded single operand operator for struct a
    def compile_AoverloadSingleOperand(self, a, op):
        instr = self.overloadHeader()
        overload = a.type.getOpOverload(op)
        if overload is None:
            throw(NoOverloadOp(a.token, a.type, "", op))
        o = overload.returntype.copy()

        if a.memory_location and a.isRegister():
            instr += f"mov rdi, {a.accessor}\n"
        else:
            instr += lea_struct('rdi', a)
        rfree(a.accessor)
        fltret = overload.returntype.isflt() or overload.returntype.csize() > 8

        oreg = norm_return_register if not fltret else sse_return_register

        instr += fncall(overload)

        apendee = EC.ExpressionComponent(
            oreg, o, token=a.token
        )
        instr += self.overloadFooter()
        return instr, o, apendee

    # evaluate a generated postfix list of EC's

    def evaluatePostfix(self, pfix, evaluator):
        instr = ""

        for i in reversed(range(len(pfix))):
            if pfix[i].accessor == "pop":
                newreg = ralloc(pfix[i].type.isflt())
                instr += loadToReg(newreg, pfix[i].accessor)
                pfix[i].accessor = newreg

        stack = []      # used for evaluation
        o = LONG.copy()
        for e in pfix:  # for each component
            if(e.isoperation):
                if(not operatorISO(e.accessor)):  # if the operator takes two operands

                    # check for error condition
                    if len(stack) == 0:
                        throw(HangingOperator(pfix[-1].token))

                    b = stack.pop()              # second operand
                    op = e.accessor              # operation

                    if(len(stack) < 1):
                        if(op == '-'):
                            a = EC.ExpressionComponent(
                                0, LITERAL, constint=True, token=b.token)
                        else:
                            throw(HangingOperator(pfix[-1].token))
                    else:
                        a = stack.pop()              # first operand

                    # check for double/float literals that can be converted to
                    # immediates
                    if (isinstance(b.accessor, Variable) and b.type.isflt()
                            and b.accessor.glob and not b.accessor.mutable):
                        b, ninstr = self.makeFloatImmediate(b)
                        instr += ninstr
                    if (isinstance(a.accessor, Variable) and a.type.isflt()
                            and a.accessor.glob and not a.accessor.mutable):
                        a, ninstr = self.makeFloatImmediate(a)
                        instr += ninstr


                    # check for function types
                    if a.type.function_template is not None or b.type.function_template is not None:
                        if fntypematch(a.type, b.type):
                            instr += self.compile_aopb(a,
                                                       op, b, evaluator, stack, e)
                        else:
                            throw(TypeMismatch(a.token, a.type, b.type))

                    # check for non-primitive types for operator overloading:
                    elif not a.type.isintrinsic() and op not in ["."]:
                        # check for operator accepting b's type
                        instr += self.compile_AoverloadB(a,
                                                         op, b, evaluator, stack)

                    elif not b.type.isintrinsic():
                        pass
                        # check for implicit cast overload for b.type -> a.type

                    else:
                        # normal conditions:
                        instr += self.compile_aopb(a,
                                                   op,
                                                   b,
                                                   evaluator,
                                                   stack,
                                                   e.token)

                else:  # op takes only one operand

                    if(len(stack) < 1):
                        throw(HangingOperator(pfix[-1].token))
                    a = stack.pop()  # operand

                    if not a.type.isintrinsic() and e.accessor not in [
                            '.', "&"]:
                        ninstr, o, apendee = self.compile_AoverloadSingleOperand(
                            a, e.accessor)
                        stack.append(apendee)
                        instr += ninstr

                    # op == !
                    elif(e.accessor == T_NOT):

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
        if not a.type.isflt():
            needload = True
            instr = ""
            instr += bringdown_memloc(a)

            cmd = "inc" if op == "++" else "dec"

            instr += Instruction(cmd, [valueOf(a.accessor, exactSize=True)])
            o = a.type.copy()

            return instr, o, a
        else:
            tmpstack = [None]
            instr = self.compile_aopb(
                a,
                op[0],
                EC.ExpressionComponent(
                    1, LITERAL, constint=True, token=a.token),
                self,
                tmpstack,
                None
            )
            instr += loadToReg(a.accessor, tmpstack[1].accessor)
            return instr, a.type.copy(), tmpstack[1]

    def negate(self, a, o):
        areg, _, __, instr = self.optloadRegs(a, None, "negate", o)
        return f"{instr}\nneg {areg}\n", areg

    # Do an operation with a op b -> o:DType

    def performCastAndOperation(self, a, b, op, o):
        instr = ""
        apendee = None

        # Check for simple negate:
        if op == "-" and a.accessor == 0 and not b.type.isflt():
            instr, breg = self.negate(b, o)
            apendee = EC.ExpressionComponent(breg, b.type, token=b.token)
            return instr, o, apendee

        # Generalized Leftside operation evaluation is only different for the
        # '[' operator.
        if(op == "["):
            if(b.type.isflt()):
                throw(UsingFloatAsIndex(b.token))

            instr += bringdown_memlocs(a, b)

            if(isinstance(b.accessor, int) and b.accessor == 0):
                areg, breg, o, ninstr = self.optloadRegs(a, None, op, o)
                instr += ninstr

            elif (isinstance(a.accessor, Variable) and a.accessor.isStackarr) and a.type.csize() in [1, 2, 4, 8]:
                itemsize = a.type.csize()
                offset = a.accessor.offset
                areg = ralloc(False)
                if isinstance(b.accessor, int):
                    newoffset = offset - itemsize * b.accessor + a.accessor.stackarrsize
                    instr += f"lea {areg}, [{a.accessor.baseptr}{newoffset}]\n"
                    breg = 'rax'
                else:
                    breg, _, __, ninstr = self.optloadRegs(b, None, '[', o)
                    instr += f"{ninstr}lea {areg}, [{a.accessor.baseptr}{offset+a.accessor.stackarrsize}+{setSize(breg, 8)}*{itemsize}]\n"
            else:
                areg, breg, o, ninstr = self.optloadRegs(a, b, op, o)
                instr += ninstr
                if sizeOf(breg) < 8:
                    instr += cast_regUp("rax", breg, b.type.signed)
                    rfree(breg)
                    breg = "rax"

                areg = setSize(areg, 8)
                oreg = ralloc(False)
                if(a.type.size(1) in [1, 2, 4, 8]):
                    instr += f"lea {oreg}, [{areg}+{setSize(breg,8)}*{a.type.size(1)}]\n"
                else:
                    if(canShiftmul(a.type.size(1))):
                        instr += f"shl {breg}, {shiftmul(a.type.size(1))}\n"
                    else:
                        instr += f"imul {breg}, {a.type.size(1)}\n"
                    instr += f"lea {oreg}, [{areg}+{setSize(breg,8)}]\n"
                rfree(areg)
                areg = oreg
            apendee = (EC.ExpressionComponent(
                areg, a.type.down(), token=a.token))
            apendee.memory_location = True
            rfree(breg)

            return instr, o, apendee

        # Leftside evaluation for general operations is the same as rightside evaluation,
        # so unless the above conditions are met, a RightSideEvaluator can be used for common
        # operations.
        return self.performCastAndGeneralizedOperation(self.fn, a, b, op, o)

    # access member b of struct a
    def memberAccess(self, a, b, optok):
        instr = ""
        member = b.accessor
        if(isinstance(member, Variable)):
            member = member.name
        pdepth = a.type.ptrdepth
        a.type = self.fn.compiler.getType(a.type.name)
        if a.type is None:
            # this should not happen
            print(f"This error is a sign of a compiler bug:{a.accessor}")
            throw(UnkownType(a.token))

        a.type.ptrdepth = pdepth

        if a.type.ptrdepth != 0 and optok.value == ".":
            throw(WrongMemberAccess(a.token, optok, b.token, a.type, '.'))
        elif a.type.ptrdepth == 0 and optok.value == "->":
            throw(WrongMemberAccess(a.token, optok, b.token, a.type, '->'))

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
        if(not typematch(BOOL, a.type, True) and not a.isconstint()):
            throw(TypeMismatch(a.token, BOOL, a.type))

        areg, ___, _, i = self.optloadRegs(a, None, "op", LONG.copy())
        instr += i
        instr += boolmath(areg, None, T_NOT)
        o = BOOL.copy()
        return instr, o, EC.ExpressionComponent(
            areg, BOOL.copy(), token=a.token)

    # evaluate bitwize not
    def evalANOT(self, a):
        instr = ""
        needload = True
        areg, ___, _, i = self.optloadRegs(a, None, "op", LONG.copy())
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
                if a.type.isintrinsic():
                    instr += f"lea {result}, [{a.accessor.baseptr}{a.accessor.offset}]\n"
                else:
                    instr += f"lea {result}, [{a.accessor.baseptr}{a.accessor.offset+a.type.csize()}]\n"
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
        elif (a.isRegister() and a.memory_location):

            a.memory_location = False
            a.type = a.type.up()
            return "", a.type.up(), a

        else:
            throw(AddressOfConstant(a.token))

    # get value pointed to by a. (same as a[0])
    def derefrence(self, a):

        if(a.isconstint()):

            throw(AddressOfConstant(a.token))

        instr = bringdown_memloc(a)
        areg, breg, o, ninstr = self.optloadRegs(a, None, "[", VOID.copy())
        instr += ninstr
        out = instr, a.type.down(), EC.ExpressionComponent(
            areg, a.type.down(), memloc=True, token=a.token)
        return out

    # cast a to type e
    def typecast(self, a, e, o):
        instr = ""
        t = self.fn.compiler.getType(
            e.type) if isinstance(
            e.type,
            str) else e.type
        if(t is None):
            throw(UnkownType(e.token))

        # if t.isflt() == a.type.isflt():
        #    a.type = t
        #    if a.isRegister():
        #        a.accessor = setSize(a.accessor, t.csize())
        #    return "", t, a
        aval = ralloc(a.type.isflt(), a.type.csize())
        result = ralloc(t.isflt(), t.csize())

        instr += bringdown_memloc(a)
        cst = castABD(EC.ExpressionComponent("", t, token=e.token),
                      EC.ExpressionComponent("", a.type, token=a.token), "", aval, result)

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
            o = t
            return instr, o, EC.ExpressionComponent(
                a.accessor, t.copy(), token=a.token)

    # no deposit is necessary for leftside evaluation
    def depositFinal(self, final):
        return final

    # main wrapper
    def evaluate(self, pfix):

        out = self.evaluatePostfix(pfix, self)

        return out


# take final result and cast it properly to the destination specified

def depositFinal(dest, final):
    instr = ""
    instr += bringdown_memloc(final)

    if(dest == "AMB"):
        if(final.isRegister()):
            rfree(final.accessor)
        return instr

    if(isinstance(final.accessor, str) and final.accessor != "pop"):
        final.accessor = setSize(final.accessor, (dest.type.csize()))

    # if(isinstance(dest.accessor, str)):
    #    dest.accessor = setSize(dest.accessor, final.type.csize())

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

                if("[" not in valueOf(castdest) + valueOf(
                        final.accessor)) and "xmm" in valueOf(castdest) + valueOf(final.accessor):
                    cmd = "movq"
                else:
                    cmd = "mov"
                    castdest = setSize(castdest, final.type.csize())

                cst = f"{cmd} {valueOf(castdest)}, {valueOf(final.accessor)}\n"

            else:
                if dest.type.csize() == 8:
                    cst = f"cvtsi2sd {valueOf(castdest)}, {valueOf(final.accessor)}\n"
                else:
                    cst = f"cvtsi2ss {valueOf(castdest)}, {valueOf(final.accessor)}\n"

        elif(not dest.type.isflt() and final.type.isflt()):
            if(final.accessor == "pop"):
                instr += f"pop {rax}\nmovq {xmm7}, {rax}\n"
                final.accessor = "xmm7"
            if(config.GlobalCompiler.Tequals(dest.type.name, "void")):
                if("[" not in valueOf(castdest) + valueOf(
                        final.accessor)) and "xmm" in valueOf(castdest) + valueOf(final.accessor):
                    cmd = "movq"
                else:
                    cmd = "mov"
                    castdest = setSize(castdest, final.type.csize())

                cst = f"{cmd} {valueOf(castdest)}, {valueOf(final.accessor)}\n"

            else:
                if final.type.csize() == 8:
                    cst = f"cvttsd2si {valueOf(castdest)}, {valueOf(final.accessor)}\n"
                else:
                    cst = f"cvttss2si {valueOf(castdest)}, {valueOf(final.accessor)}\n"
        else:
            if dest.type.isflt():

                if dest.type.csize() == final.type.csize():
                    cst = False
                else:
                    if final.type.csize() == 8:
                        cst = f"cvtsd2ss {valueOf(castdest)}, {valueOf(final.accessor)}\n"
                    else:
                        cst = f"cvtss2sd {valueOf(castdest)}, {valueOf(final.accessor)}\n"

            else:
                cst = cast_regUp(castdest, final.accessor, final.type.signed)

        if(cst != False) and (cst != ""):
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
    return instr
