#####################################################
#
#   CodeBlocks contains functions and constants used accross
#       many files as templates to create a block of asm
#       based on some inputs.
#
#
######################################################


from Assembly.Instructions import Instruction, getComparater
from Assembly.Registers import *
from Classes.Variable import Variable
import Classes.ExpressionComponent as EC
from Assembly.TypeSizes import isfloat, psizeof, psizeoft, getConstantReserver, getHeapReserver, maskset
import math


# bitmasks for boolean values
ensure_boolean = "and al, 1\n"


check_fortrue = f"{ensure_boolean}cmp al, 1\n"


def functionlabel(fn):
    if(fn.extern):
        return fn.name + ":"
    out = "_%s_%s_%s:\n" % (fn.returntype, fn.name, "p#")
    types = ""
    for p in fn.parameters:
        types += p.t.__repr__()
    out = out.replace("#", types)
    return out


def function_allocator(amt):

    return """
push rbp
mov rbp, rsp
sub rsp, %s
""" % ((amt))


def zeroize(reg):
    return Instruction("xor", [reg, reg])


def label(name):
    return "%s:\n" % name


def function_closer(name, destructions):
    return """__%s__return:
%s
leave
ret
""" % (name, destructions)


def createIntrinsicConstant(variable):

    if((variable.t.isflt())):
        return f"{variable.name}: dq {variable.initializer.hex()}\n"

    return "%s: %s %s\n" % (variable.name, getConstantReserver(
        variable.t), (variable.initializer))


stringconstant_counter = 0


def createStringConstant(s):
    global stringconstant_counter
    out = []
    name = ("STRING_CONSTANT_%s" % stringconstant_counter)
    out.append("%s: db `%s`, 0\n" % (name, s))
    out.append(name)
    stringconstant_counter += 1
    return out


floatconstant_counter = 0


def createFloatConstant(s):
    global floatconstant_counter
    out = []
    name = ("FLT_CONSTANT_%s" % floatconstant_counter)
    #out.append("%s: dq __float32__(%s)\n"%(name,s))
    out.append(f"{name}: dq {s.hex()}\n")
    out.append(name)
    floatconstant_counter += 1
    return out


def createIntrinsicHeap(variable):
    return "%s: %s\n" % (variable.name, getHeapReserver(variable))


def loadToPtr(dest, source):

    if(isinstance(dest, Variable)):
        return loadToReg(dest, source)
    return loadToReg(f"[{dest}]", source)


def spush(v: EC.ExpressionComponent):
    if(v.type.isflt()):
        return f"movq {rax}, {v.accessor}\npush {rax}\n"
    if(isinstance(v.accessor, Variable)):
        return f"mov {rax}, {valueOf(v.accessor)}\npush {rax}\n"
    return f"push {v.accessor}\n"


def fncall(fn):
    return "call %s\n" % fn.getCallingLabel()


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


def valueOf(x, dflt=False, exactSize=False):
    if (isinstance(x, str)):
        return x
    elif (isinstance(x, Variable)):
        if(x.glob):
            if(x.isptr):
                return f"{x.name}"
            return f"[{x.name}]"
        else:
            offset = x.offset
            if(x.isStackarr):
                offset += x.stackarrsize
            if(not exactSize):
                return f"QWORD[rbp-{offset}]"
            return f"{psizeoft(x.t)}[rbp-{offset}]"
    elif (isinstance(x, int)):
        return (x)


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

            return f"pop {rax}\nmov {valueOf(reg)}, {rax}\n"

    if(isinstance(reg, str)):
        if("xmm" in reg):
            # TODO:
            # SEE IF THIS IS FINE
            if(isinstance(value, Variable) and value.t.isflt()):
                return f"movsd {reg}, {valueOf(value)}\n"
            elif(isinstance(value, str) and "xmm" in value):
                return f"movsd {reg}, {value}\n"
            else:
                return f"mov {reg}, {valueOf(value)} ;<-\n"
        if(isinstance(value, Variable) and value.isStackarr):
            return f"lea {reg}, [rbp-{value.offset+value.stackarrsize}]\n"
        if(isfloat(value)):
            return f"movq {reg}, {valueOf(value)}\n"
        return f"mov {reg}, {valueOf(value)}\n"

    elif(isinstance(reg, Variable)):

        if(reg.t.isflt()):

            return f"movsd {valueOf(reg)}, {valueOf(value)}\n"
        return f"mov {valueOf(reg)}, {valueOf(value)}\n"


def movRegToVar(od, reg):
    if("xmm" not in reg):
        return "mov [rbp-%s], %s" % ((od), reg)
    else:
        return "movsd [rbp-%s], %s" % ((od), reg)


# logic label handling
total_labelCounter = -1


def getLogicLabel(inf):
    global total_labelCounter
    total_labelCounter += 1
    return f"_L{inf}_{hex(total_labelCounter)}"


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
            tmp = ralloc(False)
            rfree(tmp)
            return f"mov {tmp}, {a}\nmov cl, {boolchar_version[b]}\n{cmd} {tmp}, cl\nmov {a}, {tmp}\n"
        elif(b == rcx):
            return f"{cmd} {a}, cl\n"
        else:
            tmp = ralloc(False)
            rfree(tmp)
            return f"mov {tmp}, rcx\nmov cl, {boolchar_version[b]}\n{cmd} {a}, cl\nmov rcx, {tmp}\n"


def doIntOperation(areg, breg, op, signed, size=8):

    if(op == "+"):
        return f"add {areg}, {breg}\n"
    elif(op == "-"):
        return f"sub {areg}, {breg}\n"
    elif(op == "*" and signed):

        return f"imul {areg}, {breg}\n"
    elif(op == "*"):
        return f"mov {rax},{areg}\nmul {breg}\nmov {areg}, {rax}\n"
    elif(op == "/"):
        if(signed):
            asmop = "idiv"
        else:
            asmop = "div"

        return f"xor rdx, rdx\nmov {rax},{areg}\n{asmop} {breg}\nmov {areg}, {rax}\n"
    elif(op == "%"):
        if(signed):
            asmop = "idiv"
        else:
            asmop = "div"

        return f"xor rdx, rdx\nmov {rax}, {areg}\n{asmop} {breg}\n mov {areg}, {rdx}\n"
    elif(op in [">>", "<<"]):
        return shiftInt(areg, breg, op, signed)

    elif(op == "mov"):
        return f"mov {areg}, {breg}\n"

    elif(op in ["==", "!=", ">", "<", "<=", ">="]):
        return cmpI(areg, breg, signed, op)
    elif(op in ["!", "&&", "||", "^", "~", "|", "&"]):
        return boolmath(areg, breg, op)


def cmpI(areg, breg, signed, op):

    comparator = getComparater(signed, op)

    return f"\ncmp {areg}, {breg}\nset{comparator} {boolchar_version[areg]}\n"


def cmpF(areg, breg, op):

    comparator = getComparater(False, op)
    return f"ucomisd {areg}, {breg}\nset{comparator} {al}\n"


def boolmath(areg, breg, op):
    cmd = ""
    if(op == "||"):
        cmd = "or"
    elif(op == "&&"):
        cmd = "and"
    elif(op == "^"):
        cmd = "xor"
    elif(op == "!"):
        return cmpI(areg, 0, False, "==")
    elif(op == "~"):
        return f"not {areg}\n"

    instr = f"{cmd} {areg}, {breg}\n"
    return instr


def bitmathf(areg, breg, op):
    cmd = ""
    if(op == "&&"):
        cmd = "pand"
    elif(op == "||"):
        cmd = "por"
    elif(op == "^"):
        cmd = "pxor"
    elif(op == "!"):
        return cmpF(areg, 0, "==")
    elif(op == "~"):
        return f"movq {rax}, {areg}\nnot {rax}\nmovq {areg}, {rax}\n"

    return f"{cmd} {areg}, {breg}\n"


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


def doOperation(t, areg, breg, op, signed=False):
    if("xmm" in areg and "xmm" in breg):
        return doFloatOperation(areg, breg, op)
    elif("xmm" not in areg and "xmm" not in breg):
        return doIntOperation(areg, breg, op, signed, size=t.size(0))
    else:
        print("fatal type mismatch: unkown.")
        exit(1)


def castABD(a, b, areg, breg, newbreg):
    if(not a.type.isflt() and not b.type.isflt()):
        if(a.type.csize() != b.type.csize()):
            out = maskset(newbreg, a.type.csize())
            out += f"mov {newbreg}, {breg}\n"
            return out
        return False
    if(a.type.isflt() and not b.type.isflt()):
        return f"cvtsi2sd {valueOf(newbreg)}, {valueOf(breg)}\n"
    if(b.type.isflt() and not a.type.isflt()):
        return f"cvttsd2si {valueOf(newbreg)}, {valueOf(breg)}\n"
    return False


def shiftmul(i):
    return int(math.log2(i))
