#####################################################
#
#   CodeBlocks contains functions and constants used accross
#       many files as templates to create a block of asm
#       based on some inputs.
#   CodeBlocks is especially messy because it contains
#       the bulk of the raw string operations.
#
######################################################


import math

import Classes.ExpressionComponent as EC
from Classes.Error import *
from Classes.Variable import Variable

from Assembly.Instructions import (ONELINE_ASSIGNMENTS, Instruction,
                                   getComparater, onelineAssignment)
from Assembly.Registers import *
from Assembly.TypeSizes import (getConstantReserver, getHeapReserver, isfloat,
                                maskset, psizeof, psizeoft, dwordImmediate)

from globals import canShiftmul

# bitmasks for boolean values
ensure_boolean = "and al, 1\n"

# check if a value is true


def checkTrue(checkval: EC.ExpressionComponent):
    if(checkval.isRegister() and not checkval.type.isflt()):
        return f"test {setSize(checkval.accessor, checkval.type.csize())}, {setSize(checkval.accessor, checkval.type.csize())}\n"
    elif(checkval.type.isflt()):
        return f"movq rax, {valueOf(checkval.accessor)}\ntest rax, rax\n"
    else:
        return f"mov {setSize(rax, sizeOf(checkval.accessor))}, {valueOf(checkval.accessor)}\ntest {setSize(rax, sizeOf(checkval.accessor))}, {setSize(rax, sizeOf(checkval.accessor))}\n"

# get calling label for function based on name mangling scheme


def functionlabel(fn):
    if(fn.extern):  # externs have no mangling
        return fn.name + ":"
    # _returntype_name_ptypetypetype...  :
    out = "_%s_%s_%s:\n" % (fn.returntype, fn.name, "p#")
    types = ""
    for p in fn.parameters:
        types += p.t.__repr__()
    out = out.replace("#", types)
    return out


def extra_parameterlabel(fn, num):
    return f"{functionlabel(fn)[:-2]}{len(fn.parameters)-num}thp:"


# get the code block to allocate a stack frame at the begining of a function


def function_allocator(amt):

    return """push rbp\nmov rbp, rsp\nsub rsp, %s\n""" % (
        (amt)) if amt > 8 else ""

# set a register to zero using the faster 'xor' instruction


def zeroize(reg):
    return Instruction("xor", [reg, reg])


def allocate_readonly(value):
    return createIntrinsicConstant(value)


# make name a label

def label(name):
    return "%s:\n" % name

# generate the closing for a function (exit stack frame, and return)


def function_closer(name, destructions, fn):
    return """__%s__return:
%s
leave
ret
""" % (name, destructions) if fn.stackCounter > 8 else f"__{name}__return:\nret\n"

# Get the value of a number that is within a set ( a set refers to this
# notation: { ... , ... , ... })


def setValueOf(val, flt, ptr):

    if(isinstance(val, float)):
        return val.hex()

    if(isinstance(val.accessor, (str, int, float))):
        return str(val.accessor) if not flt else float(val.accessor).hex()
    if(isinstance(val.accessor, Variable)):

        if(ptr):
            return val.accessor.name
        else:
            return setValueOf(val.accessor.initializer, flt, False)

# generate .data code for an intrinsic constant (can be a set)


def createIntrinsicConstant(variable):

    # if it is a set
    if(isinstance(variable.initializer, list)):
        t = variable.t.down()
        if(t.isflt()):

            out = f"{variable.name}: DQ {str.join(', ', (setValueOf(val, t.isflt(), t.ptrdepth > 0) for val in variable.initializer))}\n"
        else:
            out = f"{variable.name}: {getConstantReserver(t)} { str.join(', ', (setValueOf(val, t.isflt(), t.ptrdepth > 0) for val in variable.initializer))  }\n"
        return out
    # for floats
    if((variable.t.isflt())):
        return f"{variable.name}: DQ {variable.initializer.hex()}\n"

    # for int types
    return "%s: %s %s\n" % (variable.name, getConstantReserver(
        variable.t), (variable.initializer))


# keep string IDS
stringconstant_counter = 0

# create specifically a string literal in .data


def createStringConstant(s) -> tuple:
    global stringconstant_counter
    out = []
    name = ("LC.S%s" % stringconstant_counter)
    out.append("%s: db `%s`, 0\n" % (name, s.replace("\n", "")))
    out.append(name)
    stringconstant_counter += 1
    return out


# keep float IDs
floatconstant_counter = 0

# create specifically a float literal in .data


def createFloatConstant(s):
    global floatconstant_counter
    out = []
    name = ("LC.F%s" % floatconstant_counter)
    #out.append("%s: dq __float32__(%s)\n"%(name,s))
    out.append(f"{name}: dq {s.hex()}\n")
    out.append(name)
    floatconstant_counter += 1
    return out

# create .bss variable


def createIntrinsicHeap(variable):
    return "%s: %s\n" % (variable.name, getHeapReserver(variable))

# load source (any type) to dest (also any type)


def loadToPtr(dest, source):

    if(isinstance(dest, EC.ExpressionComponent)):

        size = dest.type.csize()
        if(isinstance(dest.accessor, Variable)):

            return loadToReg(dest.accessor, setSize(source, size))

        return loadToReg(
            f'{psizeoft(dest.type)}[{setSize(dest.accessor,8)}]', setSize(source, size))

    if(isinstance(dest, Variable)):

        return loadToReg(dest, source)
    return loadToReg(f"[{setSize(dest,8)}]", source)

# push v to the stack


def spush(v: EC.ExpressionComponent):
    if(v.type.isflt()):
        return f"movq {rax}, {v.accessor}\npush {rax}\n"
    if(isinstance(v.accessor, Variable)):
        return f"mov {rax}, {valueOf(v.accessor)}\npush {rax}\n"
    return f"push {v.accessor}\n"

# pop from the stack into v


def spop(v: EC.ExpressionComponent):
    if(v.type.isflt()):
        return f"pop {rax}\nmovq {valueOf(v.accessor)}, {rax}\n"
    if(isinstance(v.accessor, Variable)):
        return f"pop {rax}\nmov {valueOf(v.accessor)}, {rax}\n"
    return f"pop {v.accessor}\n"

# call a function
# (for regular functions this is as simple as using the 'call' instruction)
# for inline functions this means recompiling the function, and pasting its
# raw assembly


def fncall(fn):
    global norm_scratch_registers_inuse, sse_scratch_registers_inuse
    fn.references += 1
    if(not fn.inline):
        return "call %s\n" % fn.getCallingLabel()
    else:
        if not fn.isCompiled:
            # save register allocation for calling
            regstate = norm_scratch_registers_inuse.copy()
            regstatesse = sse_scratch_registers_inuse.copy()
            # free all registers for re-compilation of the inline
            rfreeAll()

            resetcfg = False

            # suppress warnings for re-compilation
            if(fn.isCompiled and not config.__nowarn__):
                config.__nowarn__ = True
                resetcfg = True
            fn = fn.reset()
            fn.compile()
            # restore register state
            norm_scratch_registers_inuse = regstate
            sse_scratch_registers_inuse = regstatesse
            # re-enable warnings if necessary
            if resetcfg:
                config.__nowarn__ = False

        return fn.asm

# mov variable var into register reg


def movVarToReg(reg, var):
    if isfloat(var):
        if isfloat(reg):
            return f"movsd {reg}, {valueOf(var)}\n"
        else:
            return f"cvttsd2si {reg}, {valueOf(var)}\n"
    else:
        if isfloat(reg):
            return f"cvtsi2sd {reg}, {valueOf(var)}\n"

        else:
            return f"mov {reg},  {valueOf(var)}\n"


def movMemVar(dest, source):
    return f"mov rax, {valueOf(source)}\n{loadToReg(dest, 'rax')}"

#
# get the value of x.
# valueOf is used within lines, so it will always equate to one
# operand, without a newline, for use as destination or source.
#
# the dflt flag is depricated
# the exactSize flag is used to specify that the exact size of the
# variable / register should be used rather than the defualt 8 byte
# standard.
#


def valueOf(x, dflt=False, exactSize=True):
    if (isinstance(x, str)):
        return x
    elif (isinstance(x, Variable)):
        x.referenced = True
        if(x.glob):
            if(x.t.ptrdepth > 1 or x.isptr):
                
                return f"{x.name}"
            return f"[{x.name}]" if not exactSize else f"{psizeoft(x.t)}[{x.name}]"
        else:
            offset = x.offset

            if(x.isStackarr):
                offset += x.stackarrsize
            if(not exactSize):
                return f"QWORD[{x.baseptr}{offset}]" if x.register is None else x.register
            return f"{psizeoft(x.t)}[{x.baseptr}{offset}]" if x.register is None else setSize(
                x.register, x.t.csize())
    elif (isinstance(x, int)):
        return (x)

# load value value into register reg


def loadToReg(reg, value):
    if(reg == value):
        return ""
    if(value == "pop"):
        if(isinstance(reg, str)):
            if("xmm" in reg):
                pop = f"pop {rax}\n"
                return f"{pop}movq {reg}, {rax}\n"
            return f"pop {normal_size[ reg]}\n"
        elif(isinstance(reg, Variable)):

            return f"pop {rax}\nmov {valueOf(reg)}, {setSize(rax, reg.t.csize())}\n"

    if(isinstance(reg, str)):
        if("xmm" in reg):

            if(isinstance(value, Variable) and value.t.isflt()) and (isfloat(reg)):
                return f"movsd {reg}, {valueOf(value)}\n"
            elif(isinstance(value, str) and "xmm" in value):
                return f"movsd {reg}, {value}\n"
            else:
                if isinstance(value, int):
                    if value == 0:
                        return f"xorpd {reg}, {reg}\n"
                    else:
                        return f"mov rax, {value}\ncvtsi2sd {reg}, rax\n"

        if(isinstance(value, Variable) and value.isStackarr):
            return f"lea {setSize(reg,8)}, [{value.baseptr}{value.offset+value.stackarrsize}] \n"

        if(isfloat(value)):

            return f"movq {reg}, {valueOf(value)}\n"

        if(reg in normal_size):
            if(isinstance(value, Variable)):
                reg = setSize(reg, value.t.csize())
            if(isinstance(value, str) and value in normal_size):
                reg = setSize(reg, sizeOf(value))

        if(isinstance(value, int)):
            if(not dwordImmediate(value) and isinstance(reg, Variable)):
                return f"mov rax, {valueOf(value)}\nmov {valueOf(reg)}, rax\n"

        return f"mov {reg}, {valueOf(value)}\n"

    elif(isinstance(reg, Variable)):

        if(reg.t.isflt()):
            if(isfloat(value)):
                return f"movsd {valueOf(reg)}, {valueOf(value)}\n"
            else:
                return f"mov {valueOf(reg)}, {valueOf(value)}\n"

        if (isinstance(value, str) and value in normal_size):
            value = setSize(value, reg.t.csize())
        if(isinstance(value, int) and not dwordImmediate(value) and reg.t.csize() == 8):
            return f"mov rax, {valueOf(value)}\nmov {valueOf(reg)}, rax\n"

        return f"mov {valueOf(reg)}, {valueOf(value)}\n"

# only for parameter loading


def movRegToVar(od, reg):
    if("xmm" not in reg):
        return "mov [rbp-%s], %s" % ((od), reg)
    else:
        return "movsd [rbp-%s], %s" % ((od), reg)


# logic label handling
total_labelCounter = -1

# logic labels are created with an inf value only when the debug flag is
# set (-g)


def getLogicLabel(inf):
    global total_labelCounter
    total_labelCounter += 1
    return f".L{inf}_{hex(total_labelCounter)}" if config.DO_DEBUG else f".L{hex(total_labelCounter)}"

# bitshift int a by int b in direction op, based on signed flag


def shiftInt(a, b, op, signed):
    cmd = ""
    if(op == ">>"):
        if(signed):
            cmd = "sar"
        else:
            cmd = "shr"
    elif(op == "<<"):
        if(signed):
            cmd = "sal"
        else:
            cmd = "shl"

    if(isinstance(b, int)):
        return f"{cmd} {a}, {b}\n"
    else:
        if(a == rcx):
            tmp = rax
            return f"mov {tmp}, {a}\nmov cl, {boolchar_version[b]}\n{cmd} {tmp}, cl\nmov {a}, {tmp}\n"
        elif(b == rcx):
            return f"{cmd} {a}, cl\n"
        else:
            tmp = rax
            return f"mov {tmp}, rcx\nmov cl, {boolchar_version[b]}\n{cmd} {a}, cl\nmov rcx, {tmp}\n"

# load register to rax


def loadToRax(areg):
    return Instruction("mov", [setSize(rax, sizeOf(areg)), areg])

# load rax to register


def getFromRax(areg):
    return Instruction("mov", [areg, setSize(rax, sizeOf(areg))])

# load rdx to register


def getFromRdx(areg):
    return Instruction("mov", [areg, setSize(rdx, sizeOf(areg))])

# perform integer arithmatic op on areg by breg
# (op areg, breg)


def doIntOperation(areg, breg, op, signed, size=8):

    if(op == "+"):
        return f"add {areg}, {breg}\n"
    elif(op == "-"):
        return f"sub {areg}, {breg}\n"
    elif(op == "*" and signed):

        return f"imul {areg}, {breg}\n" if size != 1 else f"imul {setSize(areg, 2)}, {setSize(breg,2)}\n"
    elif(op == "*"):
        return f"{loadToRax(areg)}\nmul {breg}\n{getFromRax(areg)}\n"
    elif(op == "/"):

        if(signed):
            asmop = "idiv"
        else:
            asmop = "div"
        return f"xor rdx, rdx\n{loadToRax(areg)}\n{asmop} {breg}\n{getFromRax(areg)}\n"

    elif(op == "%"):
        if(signed):
            asmop = "idiv"
        else:
            asmop = "div"

        out = f"xor rdx, rdx\n{loadToRax(areg)}\n{asmop} {breg}\n{getFromRdx(areg)}\n"
        return out
    elif(op in [">>", "<<"]):
        return shiftInt(areg, breg, op, signed)

    elif(op == "mov"):
        return f"mov {areg}, {breg}\n"

    elif(op in ["==", "!=", ">", "<", "<=", ">="]):
        return cmpI(areg, breg, signed, op)
    elif(op in ["!", "&&", "||", "^", "~", "|", "&"]):
        return boolmath(areg, breg, op)

# compare areg, breg
# set(op) (byte)breg


def cmpI(areg, breg, signed, op):

    comparator = getComparater(signed, op)
    return f"\ncmp {areg}, {breg}\nset{comparator} {setSize(areg, 1)}\n"

# compare areg, breg
# set(op) al


def cmpF(areg, breg, op):

    comparator = getComparater(True, op)
    result = ralloc(False)
    return f"comisd {areg}, {breg}\nset{comparator} {boolchar_version[result]}\n"

# perform boolean operations (bitwize/logical)


def boolmath(areg, breg, op):
    cmd = ""
    if(op == "|" or op == "||"):
        cmd = "or"
    elif(op == "&" or op == "&&"):
        cmd = "and"
    elif(op == "^"):
        cmd = "xor"
    elif(op == "!"):
        return cmpI(areg, 0, False, "==")
    elif(op == "~"):
        return f"not {areg}\n"

    instr = f"{cmd} {areg}, {breg}\n"

    return instr

# perform boolean / bitwise operations on floating point registers


def bitmathf(areg, breg, op):
    cmd = ""
    if(op == "&&" or op == "&"):
        cmd = "pand"
    elif(op == "||" or op == "|"):
        cmd = "por"
    elif(op == "^"):
        cmd = "pxor"
    elif(op == "!"):
        return cmpF(areg, 0, "==")
    elif(op == "~"):
        return f"movq {rax}, {areg}\nnot {rax}\nmovq {areg}, {rax}\n"

    return f"{cmd} {areg}, {breg}\n"

# perform op on areg by breg for floating point values
# (op areg, breg)


def doFloatOperation(areg, breg, op):
    asmop = ""
    if(op == "["):
        print("FLOAT INDEX!")
        exit()
    if(op == "+"):
        asmop = "addsd"
    elif(op == "-"):
        asmop = "subsd"
    elif(op == "*"):
        asmop = "mulsd"
    elif(op == "/"):
        asmop = "divsd"
    elif(op == "mov"):
        asmop = "movsd"

    elif(op in ["==", "!=", ">", "<", "<=", ">="]):
        return cmpF(areg, breg, op)
    elif(op in ["&&", "||", "^", "!", "~", "&", "|"]):
        return bitmathf(areg, breg, op)

    return f"{asmop} {areg}, {breg}\n"

# wrapper for int or float doOperation functions


def doOperation(t, areg, breg, op, signed=False):
    if("xmm" in areg and "xmm" in breg):
        return doFloatOperation(areg, breg, op)
    elif("xmm" not in areg and "xmm" not in breg):

        return doIntOperation(setSize(areg, t.csize()), setSize(
            breg, t.csize()), op, signed, size=t.size(0))
    else:
        print(t, areg, breg, op, signed)
        print("fatal type mismatch: unkown.")
        exit(1)

# cast breg of type b to newbreg of type a
# areg is depricated


def castABD(a, b, areg, breg, newbreg):

    if(a.type.isflt() and config.GlobalCompiler.Tequals(b.type.name, "void")) or (b.type.isflt() and config.GlobalCompiler.Tequals(a.type.name, "void")):
        return f"movq {valueOf(newbreg)}, {valueOf(breg)}\n"

    if(not a.type.isflt() and not b.type.isflt()):
        if(a.type.csize() < b.type.csize()):
            #out = maskset(newbreg, a.type.csize())

            out = loadToReg(newbreg, breg)

            return out
        elif a.type.csize() > b.type.csize():

            out = zeroize(setSize(newbreg, 8))
            out += loadToReg(newbreg, breg)

            return out

        return False
    if(a.type.isflt() and not b.type.isflt()):
        if sizeOf(breg) < 4:
            breg = setSize(breg, 4)
        return f"cvtsi2sd {valueOf(newbreg)}, {valueOf(breg)}\n"
    if(b.type.isflt() and not a.type.isflt()):
        if sizeOf(newbreg) < 4:
            breg = setSize(newbreg, 4)
        return f"cvttsd2si {valueOf(newbreg)}, {valueOf(breg)}\n"
    return False

# get amount to shift by to multiply or divide by i


def shiftmul(i):
    return int(math.log2(i)) if i > 0 else 0


# move registers without any conversion
def raw_regmov(a, b):
    if("xmm" in a + b):
        return f"movq {a}, {b}\n"
    return f"mov {a}, {b}\n"

# get the assignment operator for a given operation, and/or if it can be done
# in one line.


def getOnelineAssignmentOp(a, b, op):
    cmd = ""
    
    if isinstance(a.accessor, Variable) and a.accessor.register is not None and \
        isinstance(b.accessor, Variable) and b.accessor.register is not None:
        return cmd, False


    if(op in ONELINE_ASSIGNMENTS):
        cmd = onelineAssignment(op, a)
    elif(op in [">>=", "<<="]):

        if (a.type.isflt()):
            throw(InvalidOperationOperands(a.token, a, b, op))

        cmd = "shl"
        if(op.startswith(">")):
            cmd = "shr"
        if(a.type.signed):
            cmd = cmd[0] + 'a' + cmd[2]

    return cmd, cmd != ""


def lea_mul_opt(shiftval, areg, a, b):
    newinstr = ""
    if(shiftval == 2):
        newinstr += f"lea {areg}, [{areg}+{areg}*2]\n"
    elif (shiftval == 4):
        if(b.accessor == 5):
            newinstr += f"lea {areg}, [{areg}+{areg}*4]\n"
        elif(b.accessor == 6):

            r2 = ralloc(False, size=a.type.csize())
            newinstr += f"mov {r2}, {areg}\n"
            newinstr += f"lea {areg}, [{areg}+{areg}*4]\n"
            newinstr += f"add {areg}, {r2}\n"
            rfree(r2)
        else:

            r2 = ralloc(False, size=a.type.csize())
            newinstr += f"mov {r2}, {areg}\n"
            newinstr += f"lea {areg}, [{areg}*8]\n"
            newinstr += f"sub {areg}, {r2}\n"
            rfree(r2)

    elif (shiftval == 8):
        if(b.accessor == 9):
            newinstr += f"lea {areg}, [{areg}+{areg}*8]\n"

    return newinstr


def magic_division(a, areg, b, internal=False):

    # new eq : f(n, d) = (n * m(d)) >> 33
    # m(x) = 2^33 / x + 1

    postshift = math.ceil(math.log2(b))
    twopower = 8 * a.type.csize() + 1

        
    #                2^33     / x + 1
    if twopower < 60:
        multiplicand = math.ceil(pow(2, twopower) / b)
    else:
        extrabit = math.ceil(pow(2, twopower) / (b)) > 9223372036854775807
        multiplicand = (math.ceil(pow(2, twopower) / (b))) & 9223372036854775807

    #mulcmd = "imul" if a.type.signed else "mul"
    shiftcmd = "sar" if a.type.signed else "shr"

    #TODO:
    # Make work for signed integers

    ax = setSize('rax', sizeOf(areg))
    cx = setSize('rcx', sizeOf(areg))
    dx = setSize('rdx', sizeOf(areg))

    instr = f"{zeroize('rax')}\nmov {ax}, {areg}\n"
    instr += f"mov {cx}, {multiplicand}\n"
    instr += f"imul {cx}\n"
    
    if a.type.csize() != 8 :
        instr += f"{shiftcmd} {dx}, 1\n"
        instr += f"mov {areg}, {dx}\n" if not internal else f"mov {ax}, {dx}\n"
    else: # 64bit magic division
        
        if extrabit:
            instr += f"mov rax, {setSize(areg, 8)}\nsub rax, rdx\nshr rax, 1\nadd rax, rdx\nshr rax, {math.ceil(math.log2(b))-1}\n"
        else:
            instr += f"mov rax, rdx\nshr rax, {1}\n"
        
        
        instr += getFromRax(areg) if not internal else f""

    return instr


def magic_modulo(a, areg, b):
    if canShiftmul(b) and not a.type.isSigned():
        return f"and {areg}, {b-1}\n"
    else:
        # most cases :
        #   m(x, n) = x - (x / n) * n

        twopower = 8 * a.type.csize() + 1
        shiftcmd = "sar" if a.type.signed else "shr"
        #multiplicand = int(pow(2, twopower) / b + 1)

        instr = ""
        instr += magic_division(a, areg, b, True)

        if canShiftmul(b):
            instr += f"{shiftcmd[:-1]}l rax, {shiftmul(b)}\n"
        else:
            instr += f"mov rcx, {b}\n"
            instr += f"{'imul' if a.type.signed else 'mul'} rcx\n"

        instr += f"sub {areg}, {setSize(rax, a.type.csize())}\n"

    return instr
