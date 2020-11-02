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


check_fortrue = f"{ensure_boolean}"


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

    return """push rbp\nmov rbp, rsp\nsub rsp, %s\n""" % ((amt))


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


def setValueOf(val, flt, ptr):
    if(isinstance(val.accessor, (str, int, float))):
        return str(val.accessor) if not flt else val.accessor.hex()
    if(isinstance(val.accessor, Variable)):

        if(ptr):
            return val.accessor.name
        else:
            return setValueOf(val.accessor.initializer, flt, False)


def createIntrinsicConstant(variable):

    if(isinstance(variable.initializer, list)):
        if(variable.t.isflt()):

            out = f"{variable.name}: dq {str.join(', ', (setValueOf(val, variable.t.isflt(), variable.t.ptrdepth > 0) for val in variable.initializer))}\n"
        else:
            out = f"{variable.name}: {getConstantReserver(variable.t.down())} { str.join(', ', (setValueOf(val, variable.t.isflt(), variable.t.ptrdepth > 0) for val in variable.initializer))  }\n"
        return out

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

    if(isinstance(dest, EC.ExpressionComponent)):

        size = dest.type.csize()
        if(isinstance(dest.accessor, Variable)):
            return loadToReg(dest.accessor, setSize(source, size))
        return loadToReg(
            f'{psizeoft(dest.type)}[{setSize(dest.accessor,8)}]', setSize(source, size))

    if(isinstance(dest, Variable)):
        return loadToReg(dest, source)
    return loadToReg(f"[{setSize(dest,8)}]", source)


def spush(v: EC.ExpressionComponent):
    if(v.type.isflt()):
        return f"movq {rax}, {v.accessor}\npush {rax}\n"
    if(isinstance(v.accessor, Variable)):
        return f"mov {rax}, {valueOf(v.accessor)}\npush {rax}\n"
    return f"push {v.accessor}\n"


def spop(v: EC.ExpressionComponent):
    if(v.type.isflt()):
        return f"pop {rax}\nmovq {valueOf(v.accessor)}, {rax}\n"
    if(isinstance(v.accessor, Variable)):
        return f"pop {rax}\nmov {valueOf(v.accessor)}, {rax}\n"
    return f"pop {v.accessor}\n"


def fncall(fn):
    global norm_scratch_registers_inuse, sse_scratch_registers_inuse
    if(not fn.inline):
        return "call %s\n" % fn.getCallingLabel()
    else:

        regstate = norm_scratch_registers_inuse.copy()
        regstatesse = sse_scratch_registers_inuse.copy()
        rfreeAll()

        resetcfg = False
        if(fn.isCompiled and not config.__nowarn__):
            config.__nowarn__ = True
            resetcfg = True
        fn = fn.reset()
        fn.compile()

        norm_scratch_registers_inuse = regstate
        sse_scratch_registers_inuse = regstatesse

        if resetcfg:
            config.__nowarn__ = False

        return fn.asm

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


def valueOf(x, dflt=False, exactSize=True):
    if (isinstance(x, str)):
        return x
    elif (isinstance(x, Variable)):
        x.referenced = True
        if(x.glob):
            if(x.isptr):
                return f"{x.name}"
            return f"[{x.name}]"
        else:
            offset = x.offset

            if(x.isStackarr):
                offset += x.stackarrsize
            if(not exactSize):
                return f"QWORD[rbp-{offset}]" if x.register is None else x.register
            return f"{psizeoft(x.t)}[rbp-{offset}]" if x.register is None else setSize(
                x.register, x.t.csize())
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

            return f"pop {rax}\nmov {valueOf(reg)}, {setSize(rax, reg.t.csize())}\n"

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
            return f"lea {setSize(reg,8)}, [rbp-{value.offset+value.stackarrsize}] \n"

        if(isfloat(value)):
            return f"movq {reg}, {valueOf(value)}\n"

        if(reg in normal_size):
            if(isinstance(value, Variable)):
                reg = setSize(reg, value.t.csize())
            if(isinstance(value, str) and value in normal_size):
                reg = setSize(reg, sizeOf(value))

        return f"mov {reg}, {valueOf(value)}\n"

    elif(isinstance(reg, Variable)):

        if(reg.t.isflt()):

            return f"movsd {valueOf(reg)}, {valueOf(value)}\n"

        if (isinstance(value, str) and value in normal_size):
            value = setSize(value, reg.t.csize())

        return f"mov {valueOf(reg)}, {valueOf(value)}\n"

# only for parameter loading


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
    return f"_L{inf}_{hex(total_labelCounter)}" if config.DO_DEBUG else f".L{hex(total_labelCounter)}"


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


def loadToRax(areg):
    return Instruction("mov", [setSize(rax, sizeOf(areg)), areg])


def getFromRax(areg):
    return Instruction("mov", [areg, setSize(rax, sizeOf(areg))])


def getFromRdx(areg):
    return Instruction("mov", [areg, setSize(rdx, sizeOf(areg))])


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


def cmpI(areg, breg, signed, op):

    comparator = getComparater(signed, op)
    return f"\ncmp {areg}, {breg}\nset{comparator} {setSize(areg, 1)}\n"


def cmpF(areg, breg, op):

    comparator = getComparater(False, op)
    return f"ucomisd {areg}, {breg}\nset{comparator} {'al'}\n"


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

        return doIntOperation(setSize(areg, t.csize()), setSize(
            breg, t.csize()), op, signed, size=t.size(0))
    else:
        print("fatal type mismatch: unkown.")
        exit(1)


def castABD(a, b, areg, breg, newbreg):

    if(a.type.isflt() and config.GlobalCompiler.Tequals(b.type.name, "void")) or (b.type.isflt() and config.GlobalCompiler.Tequals(a.type.name, "void")):
        return f"movq {valueOf(newbreg)}, {valueOf(breg)}\n"

    if(not a.type.isflt() and not b.type.isflt()):
        if(a.type.csize() != b.type.csize()):
            out = maskset(newbreg, a.type.csize())

            out += f"mov {newbreg}, {setSize( breg, sizeOf(newbreg) ) }\n"
            return out
        return False
    if(a.type.isflt() and not b.type.isflt()):
        return f"cvtsi2sd {valueOf(newbreg)}, {valueOf(breg)}\n"
    if(b.type.isflt() and not a.type.isflt()):
        return f"cvttsd2si {valueOf(newbreg)}, {valueOf(breg)}\n"
    return False


def shiftmul(i):
    return int(math.log2(i)) if i > 0 else 0
