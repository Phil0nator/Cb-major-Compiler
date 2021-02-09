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
                                   getComparater, onelineAssignment, floatTo32h,
                                   floatTo64h)
from Assembly.Registers import *
from Assembly.TypeSizes import (getConstantReserver, getHeapReserver, isfloat,
                                maskset, psizeof, psizeoft, dwordImmediate,
                                valueTypeClass)

from globals import canShiftmul, OPERATORS
import decimal

win_align_stack = """
enter 0,0
sub rsp, 32
and rsp, 0xfffffffffffffff0
"""

win_unalign_stack = """
leave
"""


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

    name = fn.name if fn.name not in OPERATORS else f".operator{OPERATORS.index(fn.name)}"

    if(fn.extern):  # externs have no mangling
        return name + ":"
    # _returntype_name_ptypetypetype...  :
    out = "_%s_%s_%s:\n" % (fn.returntype.__repr__(safe=True), name, "p#")
    types = ""
    for p in fn.parameters:
        types += p.t.__repr__(safe=True)
    out = out.replace("#", types)
    return out


def extra_parameterlabel(fn, num):
    return f"{functionlabel(fn)[:-2]}{len(fn.parameters)-num}thp:"


def syscall(code):
    return f"""
mov rax, {code}
mov r10, rcx
syscall
"""


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
""" % (name, destructions) if (fn.stackCounter > 8 or fn.cexterncalls) else f"__{name}__return:\nret\n"


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


def createSetInitializedGlobalStructure(variable):
    assert (isinstance(variable.initializer, list))
    if len(variable.initializer) != len(variable.t.members):
        fatalThrow(SetLiteralSizeMismatch(variable.dtok))
    out = f"{variable.name}:\n"
    for i in range(len(variable.initializer)):
        t = variable.t.members[i].t
        name = variable.name + "." + variable.t.members[i].name
        item = variable.initializer[i]
        out += f"{name}: {getConstantReserver(t)} {setValueOf(item, t.isflt(), t.ptrdepth)}\n"

    return out


# generate .data code for an intrinsic constant (can be a set)
def createIntrinsicConstant(variable):

    # if it is a set
    if(isinstance(variable.initializer, list)):
        if not variable.t.isintrinsic():
            return createSetInitializedGlobalStructure(variable)
        t = variable.t.down()
        if(t.isflt()):

            out = f"{variable.name}: DQ {str.join(', ', (setValueOf(val, t.isflt(), t.ptrdepth > 0) for val in variable.initializer))}\n"
        else:
            out = f"{variable.name}: {getConstantReserver(t)} { str.join(', ', (setValueOf(val, t.isflt(), t.ptrdepth > 0) for val in variable.initializer))  }\n"
        return out
    # for floats
    if((variable.t.isflt())):
        reserver = "dq" if variable.t.csize() == 8 else "dd"
        value = floatTo64h(variable.initializer) if variable.t.csize() == 8 \
            else floatTo32h(variable.initializer)

        return f"{variable.name}: {reserver} {value}\n"

    # for int types
    return "%s: %s %s\n" % (variable.name, getConstantReserver(
        variable.t), (variable.initializer))


# keep string IDS
stringconstant_counter = 0


# create specifically a string literal in .data
def createStringConstant(s) -> tuple:
    global stringconstant_counter
    out = []
    name = ("__LC.S%s" % stringconstant_counter)
    out.append("%s: db `%s`, 0\n" % (name, s.replace("\n", "")))
    out.append(name)
    stringconstant_counter += 1
    return out


# keep float IDs
floatconstant_counter = 0


# create specifically a float literal in .data
def createFloatConstant(s, flt32=False):
    global floatconstant_counter
    out = []
    name = ("__LC.F%s" % floatconstant_counter)
    #out.append("%s: dq __float32__(%s)\n"%(name,s))
    reserver = "dq" if not flt32 else "dd"
    out.append(f"{name}: {reserver} {s.hex()}\n")

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
        return f"{cast_regUp(rax, v.accessor, v.type.signed)}\npush {rax}\n"
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
        out = ""
        if fn.extern:
            out += """enter 0, 0\nand rsp, -16\n"""
        out += "call %s\n" % fn.getCallingLabel()
        if fn.extern:
            out += "leave"
        return out
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
        if x.parent is not None:
            x.parent.referenced = True
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


def loadToReg(reg, value, flt32=False):
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

                fltq = 'd' if value.t.csize() == 8 else 's'
                return f"movs{fltq} {reg}, {valueOf(value)}\n"

            elif(isinstance(value, str) and "xmm" in value):
                return f"movsd {reg}, {value}\n"
            else:
                if isinstance(value, int):
                    if value == 0:
                        return f"xorpd {reg}, {reg}\n"
                    else:
                        if not flt32:
                            return f"mov rax, {value}\ncvtsi2sd {reg}, rax\n"
                        else:
                            return f"mov rax, {value}\ncvtsi2ss {reg}, rax\n"

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
                if reg.t.csize() == 8:
                    return f"movsd {valueOf(reg)}, {valueOf(value)}\n"
                else:
                    return f"movss {valueOf(reg)}, {valueOf(value)}\n"
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


def lea_struct(dest: str, source: EC.ExpressionComponent) -> str:

    if isinstance(source.accessor, Variable):
        if source.accessor.glob:
            return f"mov {dest}, {source.accessor.name}\n"
        return f"lea {dest}, [{source.accessor.baseptr}{source.accessor.offset+source.type.s}]\n"
    else:
        return f"mov {dest}, {source.accessor}\n"


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
    if(op == ">>" or op == "/"):
        if(signed):
            cmd = "sar"
        else:
            cmd = "shr"
    elif(op == "<<" or op == "*"):
        if(signed):
            cmd = "sal"
        else:
            cmd = "shl"

    if(isinstance(b, int)):
        if not signed or op != "/":
            return f"{cmd} {a}, {b}\n"
        else:
            size = sizeOf(a)
            ax = setSize('rax', size)
            return f"mov {ax}, {a}\nshr {a}, {size*8-1}\nadd {a}, {ax}\nsar {a}, {b}\n"
    else:
        if(a == rcx):
            tmp = rax
            return f"mov {tmp}, {a}\nmov cl, {setSize(b, 1)}\n{cmd} {tmp}, cl\nmov {a}, {tmp}\n"
        elif(b == rcx):
            return f"{cmd} {a}, cl\n"
        else:
            tmp = rax
            return f"mov {tmp}, rcx\nmov cl, {setSize(b, 1)}\n{cmd} {a}, cl\nmov rcx, {tmp}\n"

# load register to rax


def loadToRax(areg):
    return Instruction("mov", [setSize(rax, sizeOf(areg)), areg])

# load rax to register


def getFromRax(areg):
    return Instruction("mov", [areg, setSize(rax, sizeOf(areg))])

# load rdx to register


def getFromRdx(areg):
    return Instruction("mov", [areg, setSize(rdx, sizeOf(areg))])


def saveRdx():
    if config.rdx_functioncalls_inprogress:
        return "push rdx\n"
    return ""


def restoreRdx():
    if config.rdx_functioncalls_inprogress:
        return "pop rdx\n"
    return ""


division_sign_extension = {
    2: "cwd",
    4: "cdq",
    8: "cqo"
}


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

        return f"{loadToRax(areg)}{saveRdx()}\nmul {breg}\n{restoreRdx()}{getFromRax(areg)}\n"

    elif(op == "/"):
        if(signed):
            signextend = division_sign_extension[sizeOf(areg)]
            asmop = "idiv"
        else:
            signextend = ""
            asmop = "div"
        return f"{saveRdx()}xor rdx, rdx\n{loadToRax(areg)}\n{signextend}\n{asmop} {breg}\n{restoreRdx()}{getFromRax(areg)}\n"

    elif(op == "%"):
        if(signed):
            signextend = division_sign_extension[sizeOf(areg)]
            asmop = "idiv"
        else:
            signextend = ""
            asmop = "div"

        out = f"{saveRdx()}xor rdx, rdx\n{loadToRax(areg)}\n{signextend}\n{asmop} {breg}\n{getFromRdx(areg)}\n{restoreRdx()}"
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


def pack_aligned_chararr(chars, size):
    if size == 1:
        return ord(chars)
    out = 0
    for i in range(len(chars)):
        out >>= 8
        out += ord(chars[i]) << (size * (8) - 8)
    return out


def pack_string(var, s):
    s = f"{s}\0"
    ogl = len(s)
    longs = int(ogl / 8)
    ogl -= longs * 8
    ints = int(ogl / 4)
    ogl -= ints * 4
    shorts = int(ogl / 2)
    ogl -= shorts * 2
    chars = ogl

    longout = []
    intout = []
    shortout = []
    charout = []

    iterator = [
        (longout, longs, 8),
        (intout, ints, 4),
        (shortout, shorts, 2),
        (charout, chars, 1)
    ]
    for tn, count, size in iterator:

        for i in range(count):
            temp = s[:size]
            s = s[size:]
            value = pack_aligned_chararr(temp, size)
            tn.append(value)

    return longout, intout, shortout, charout

# compare areg, breg
# set(op) al


def cmpF(areg, breg, op, float32q):

    comparator = getComparater(True, op)
    result = ralloc(False)
    return f"comis{float32q} {areg}, {breg}\nset{comparator} {setSize(result, 1)}\n"

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


def bitmathf(areg, breg, op, fltq):
    cmd = ""
    if(op == "&&" or op == "&"):
        cmd = "pand"
    elif(op == "||" or op == "|"):
        cmd = "por"
    elif(op == "^"):
        cmd = "pxor"
    elif(op == "!"):
        return cmpF(areg, 0, "==", fltq)
    elif(op == "~"):
        return f"movq {rax}, {areg}\nnot {rax}\nmovq {areg}, {rax}\n"

    return f"{cmd} {areg}, {breg}\n"

# perform op on areg by breg for floating point values
# (op areg, breg)


def doFloatOperation(areg, breg, op, float32):
    asmop = ""
    fltq = 's' if float32 else 'd'
    if(op == "["):
        print("FLOAT INDEX!")
        exit()
    if(op == "+"):
        asmop = f"adds{fltq}"
    elif(op == "-"):
        asmop = f"subs{fltq}"
    elif(op == "*"):
        asmop = f"muls{fltq}"
    elif(op == "/"):
        asmop = f"divs{fltq}"
    elif(op == "mov"):
        asmop = f"movs{fltq}"

    elif(op in ["==", "!=", ">", "<", "<=", ">="]):
        return cmpF(areg, breg, op, fltq)
    elif(op in ["&&", "||", "^", "!", "~", "&", "|"]):
        return bitmathf(areg, breg, op, fltq)

    return f"{asmop} {areg}, {breg}\n"

# wrapper for int or float doOperation functions


def doOperation(t, areg, breg, op, signed=False):
    if("xmm" in areg and "xmm" in breg):
        return doFloatOperation(areg, breg, op, t.csize() == 4)
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

    # conversions of void type do not use 'cvt' instructions
    if(a.type.isflt() and config.GlobalCompiler.Tequals(b.type.name, "void")) or (b.type.isflt() and config.GlobalCompiler.Tequals(a.type.name, "void")):
        if b.accessor == "pop":

            return loadToReg(newbreg, breg)
        else:
            return f"movq {valueOf(newbreg)}, {valueOf(breg)}\n"

    # size cast for integer types
    if(not a.type.isflt() and not b.type.isflt()):
        if(a.type.csize() < b.type.csize()):
            #out = maskset(newbreg, a.type.csize())

            out = loadToReg(newbreg, breg)

            return out
        elif a.type.csize() > b.type.csize():

            if b.type.csize() < 8 and b.type.signed:
                out = cast_regUp(newbreg, (breg), b.type.signed)
            else:
                out = loadToReg(newbreg, breg)

            return out

        return False
    # integer-float conversion
    if(a.type.isflt() and not b.type.isflt()):

        if sizeOf(breg) < 4:
            breg = setSize(breg, 4)
        if a.type.csize() == 8:
            return f"cvtsi2sd {valueOf(newbreg)}, {valueOf(breg)}\n"
        else:
            return f'cvtsi2ss {valueOf(newbreg)}, {valueOf(breg)}\n'

    # float-integer conversion
    if(b.type.isflt() and not a.type.isflt()):

        if sizeOf(newbreg) < 4:
            breg = setSize(newbreg, 4)

        if a.type.csize() == 8:
            return f"cvttsd2si {valueOf(newbreg)}, {valueOf(breg)}\n"
        else:
            return f"cvttss2si {valueOf(newbreg)}, {valueOf(breg)}\n"

    if (b.type.isflt() and a.type.isflt() and a.type.csize() != b.type.csize()):

        if a.type.csize() == 8:
            return f"cvtss2sd {valueOf(newbreg)}, {valueOf(breg)}\n"
        else:
            return f"cvtsd2ss {valueOf(newbreg)}, {valueOf(breg)}\n"

    return False


# cast_regUp is used to cast the register held in source of a size lesser than the size of dest.
# Using various instructions based on the sign of the operands, source is
# cast into dest.
def cast_regUp(dest, source, signed):
    instr = ""

    # catch pop condition
    if source == "pop":
        instr += loadToReg("rax", source)
        source = "rax"

    # assuming we are casting up to 8 byte value
    if sizeOf(dest) == 8:
        # extra check of operands
        if sizeOf(source) < 8:

            # 8 bit value cast up
            if sizeOf(source) == 1:

                # sign extention or zero extention of operand into eax
                if signed:
                    instr += f"movsx eax, {valueOf(source)}\n"
                else:
                    instr += f"movzx eax, {valueOf(source)}\n"

                # if signed, the 'cdqe' instruction can be used to sign extend
                # the value of eax -> rax
                if signed:
                    instr += f"cdqe\n"
                # else, the upper 32 bits or rax are already zeroed

                # if the cdqe instruction was used, and the destination is not rax, the value needs
                # to be moved
                if dest != "rax" and signed:
                    instr += loadToReg(dest, "rax")

            # 16 bit cast up
            if sizeOf(source) == 2:

                # mov with sign extention
                if signed:
                    instr += f"movsx {valueOf(dest)}, {valueOf(source)}\n"
                # mov with zero extention
                else:
                    instr += f"movzx {valueOf(dest)}, {valueOf(source)}\n"

            # 32 bit cast up
            elif sizeOf(source) == 4:

                if signed:
                    # when the destination is rax, the faster cdqe instruction can be used
                    # by first loading the value into eax.
                    if dest == "rax":
                        instr += loadToReg('eax', source)
                        instr += "cdqe\n"
                    # if not, the movsxd instruction is perfectly suited for this operation
                    # (mov dword with sign extention)
                    else:
                        instr += f"movsxd {valueOf(dest)}, {valueOf(source)}\n"
                # for unsigned cast-ups, the upper 32 bits of rax will be
                # zeroed anyway:
                else:
                    instr += loadToReg(dest, source)
        # equal size
        else:
            return loadToReg(dest, source)

    return instr


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


def magic_division(a, areg, d, internal=False):
    instr = ""

    ax = setSize("rax", a.type.csize())
    dx = setSize("rdx", a.type.csize())

    precision = a.type.csize() * 8
    if d > 0:
        magic_number = int(math.ceil((decimal.Decimal(1) / d) * 2**precision))
    else:
        magic_number = int(math.floor((decimal.Decimal(1) / d) * 2**precision))
    qword_magic = magic_number
    extra_flag = magic_number >> 64

    # alden solution
    out = f"""
 {saveRdx()}
 mov {ax}, {areg}
 mov rdx, {(qword_magic)}
 imul {dx}
 mov {ax}, {dx}
 shr {ax}, {precision-1}
 add {dx}, {ax}
 {f"mov {areg}, {dx}"if not internal else ""}
 {restoreRdx()}
 """

    return out


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
            instr += f"mov rdx, {b}\n"
            instr += f"{'imul' if a.type.signed else 'mul'} rdx\n"

        instr += f"sub {areg}, {setSize(rax, a.type.csize())}\n"

    return instr


def registerizeValueType(t, obj, countn, counts):

    addrtext = ""
    instr = ""
    outreg = ""
    if isinstance(obj, Variable):
        addrtext = f'[{obj.baseptr}{obj.offset+t.csize()}]'

    elif isinstance(obj, str) and obj in normal_size:
        addrtext = f'[{obj}]'
    else:
        print("Impossible registerization of vt CodeBlocks.py:856")
        exit(1)

    regclass = valueTypeClass(t.s)
    # too big to registerize
    if regclass == 3:
        outreg = addrtext
        if countn != -1:
            reg = norm_parameter_registers[countn]
        else:
            reg = "rax"
        instr = f"lea {reg}, {addrtext}\n"
    elif regclass == 2:
        reg = sse_parameter_registers[counts].replace("x", "y")
        instr = packVarToYmm(obj, reg, t.csize())
        counts += 1
    elif regclass == 1:
        reg = sse_parameter_registers[counts]
        instr = packVarToXmm(obj, reg, t.csize())
        #instr = f"movdqu {reg}, {addrtext}\n"
        counts += 1
    elif regclass == 0:
        if countn != -1:
            reg = norm_parameter_registers[countn]
        else:
            reg = "rax"
        instr = f"mov {setSize(reg, t.csize())}, [{obj.baseptr}{obj.offset}]\n"
        countn += 1

    return instr, addrtext, countn, counts


def moveParameterVector(size, regsource, countn, counts):
    if size <= 8:
        regdest = setSize(
            norm_parameter_registers[countn] if countn != -
            1 else "rax",
            size)
        return loadToReg(regdest, regsource)
    else:
        regdest = sse_parameter_registers[counts]

    if size <= 16:
        return f"movdqa {regdest}, {regsource}\n"

    return f"vmovdqa y{regdest[1:]}, {regsource}\n"


def moveVector(size, regdest, regsource):
    if size <= 8:
        return loadToReg(regdest, regsource)
    elif size <= 16:
        return f"movdqa {regdest}, {regsource}\n"
    else:
        return f"vmovdqa y{regdest[1:]}, y{regsource[1:]}\n"


def savePartOfReg(var, extraoff, reg, b):
    instr = ""
    if b <= 0:
        return ""
    if b > 8:
        instr += f"mov [{var.baseptr}{var.offset+extraoff + var.t.csize()}], {setSize(reg, 8)}\n"

    elif b % 2 == 0 or b == 1:
        instr += f"mov [{var.baseptr}{var.offset+extraoff + var.t.csize()}], {setSize(reg, b)}\n"
    else:
        if b == 3:
            instr += f"mov [{var.baseptr}{var.offset+extraoff + var.t.csize()}], {setSize(reg, 2)}\n"
            extraoff += 2
            instr += f"sar {reg}, 16\n"
            instr += savePartOfReg(var, extraoff, reg, 1)
        elif b == 5:
            instr += f"mov [{var.baseptr}{var.offset+extraoff + var.t.csize()}], {setSize(reg, 4)}\n"
            extraoff += 4
            instr += f"sar {reg}, 32\n"
            instr += savePartOfReg(var, extraoff, reg, 1)

    return instr


def packVarToYmm(var, reg, size):
    instr = ""
    if size == 32:
        return f"vmovdqu {reg}, [{var.baseptr}{var.offset+size}]\n"
    else:
        xmmreg = reg.replace("y", 'x')
        instr += packVarToXmm(var, xmmreg, size - 16)
        instr += f"vinsertf128 {reg}, {reg}, {xmmreg}, 1\n"
        instr += f"movdqu {xmmreg}, [{var.baseptr}{var.offset+size}]\n"
        return instr


def packVarToXmm(var, reg, size):
    instr = ""
    if size == 16:
        return f"movdqu {reg}, [{var.baseptr}{var.offset + size}]\n"

    else:
        instr = f"movq {reg}, [{var.baseptr}{var.offset + size}]\n"
        if size - 8 == 4:
            instr += f"movhpd {reg}, [{var.baseptr}{var.offset + size-8}]\n"
            pass
        else:
            instr += f'xor rax, rax\nmov {setSize("rax", size-8)}, [{var.baseptr}{var.offset + size-8}]\n'
            cmd = "movd" if size < 4 else "movq"
            ax = 'eax' if size < 4 else "rax"
            instr += f"{cmd} xmm7, {ax}\n"
            instr += f"movlhps {reg}, xmm7\n"

        return instr


def unpackXmmToVar(var, extraoff, reg, t, safe=True):

    # Safe refers to the need to get the memory bounds exactly correct.
    # For loading and unload parameters, there is no need to be safe.
    # However, when dereferencing pointers with an unkown origin,
    # it is important to get the memory bounds exactly correct
    # to avoid a segmentation fault.

    if safe == False:
        return f"movdqu [{var.baseptr}{var.offset+t.csize()+extraoff}], {reg}\n"

    instr = ""
    instr += f"movq rax, {reg}\n"
    instr += f"movhlps {reg}, {reg}\n"
    instr += f"movq rbx, {reg}\n"

    size = t.csize()
    if size >= 8:
        instr += f"mov [{var.baseptr}{var.offset+extraoff+t.csize()}], rax\n"
        remaining = t.csize() - 24
        instr += savePartOfReg(var, extraoff - 8, 'rbx', remaining)

    else:
        instr += savePartOfReg(var, extraoff, 'rax', size)

    return instr


def deregisterizeValueType(t, var, countn, counts):

    instr = ""
    outreg = ""
    var = var.copy()
    regclass = valueTypeClass(t.s)

    # too big to registerize
    if regclass == 3:
        reg = norm_parameter_registers[countn]
        for member in t.members:
            ax = setSize('rax', member.t.csize())
            instr += (f"mov {ax}, [{reg}+{member.offset}]\n")
            instr += (f"mov [{var.baseptr}{var.offset + var.t.csize()}], {ax}\n")
            var.offset -= member.t.csize()

        countn += 1

    elif regclass == 2:

        reg = sse_parameter_registers[counts].replace('x', 'y')
        counts += 1

        if t.csize() == 32:
            instr += f"vmovdqu [{var.baseptr}{var.offset+t.csize()}], {reg}\n"
        else:
            instr += f"movdqu [{var.baseptr}{var.offset+t.csize()}], {reg.replace('y','x')}\n"
            instr += f"vextracti128 xmm7, {reg}, 1\n"
            if t.csize() == 24:
                instr += f"movsd [{var.baseptr}{var.offset+t.csize()-16}], xmm7\n"
            else:
                instr += unpackXmmToVar(var, -16, "xmm7", t)

    elif regclass == 1:
        reg = sse_parameter_registers[counts]
        if t.s == 16:
            instr += f"movdqu [{var.baseptr}{var.offset+t.csize()}], {reg}\n"
        else:
            instr += unpackXmmToVar(var, 0, reg, t)

        counts += 1

    elif regclass == 0:

        reg = norm_parameter_registers[countn]
        countn += 1
        instr += savePartOfReg(var, -t.s, reg, t.s)

    return instr, countn, counts
