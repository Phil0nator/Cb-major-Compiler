from DType import *
# REGISTERS

rax = "rax"
rbx = "rbx"
rcx = "rcx"
rdx = "rdx"
rsi = "rsi"
rdi = "rdi"
r8 = "r8"
r9 = "r9"
r10 = "r10"
r11 = "r11"
r12 = "r12"
r13 = "r13"
r14 = "r14"
r15 = "r15"

# SSE

xmm0 = "xmm0"
xmm1 = "xmm1"
xmm2 = "xmm2"
xmm3 = "xmm3"
xmm4 = "xmm4"
xmm5 = "xmm5"
xmm6 = "xmm6"
xmm7 = "xmm7"
xmm8 = "xmm8"
xmm9 = "xmm9"
xmm10 = "xmm10"
xmm11 = "xmm11"
xmm12 = "xmm12"
xmm13 = "xmm13"
xmm14 = "xmm14"

# char or bool

al = "al"
bl = "bl"
cl = "cl"
dl = "dl"
r8b = "r8b"
r9b = "r9b"
r10b = "r10b"
r11b = "r11b"
r12b = "r12b"
r13b = "r13b"
r14b = "r14b"
r15b = "r15b"


# parameters:

norm_parameter_registers = [

    rdi,
    rsi,
    rdx,
    rcx,
    r8,
    r9

]

sse_parameter_registers = [

    xmm0,
    xmm1,
    xmm2,
    xmm3,
    xmm4,
    xmm5,
    xmm6,
    xmm7,
    xmm8,
    xmm9,
    xmm10,
    xmm11,
    xmm12,
    xmm13,
    xmm14,

]

norm_return_register = "rax"
sse_return_register = "xmm0"

with open("include/stub.asm", "rb") as f:
    stub = f.read().decode()

with open("include/io64.inc", "rb") as f:
    io64 = f.read().decode()

fileTemplate = "%s\n\n%s"%(io64,stub)


# intrinsic types:

INT = DType("int", 8)
CHAR = DType("char", 1)
DOUBLE = DType("double", 8)
VOID = DType("void", 0)
BOOL = DType("bool", 1)

false = hex(0)
true = hex(255)






















# macros
def join(arr):
    out = ""
    for s in arr:
        out+=s
    return out


def function_allocator(amt):

    return """

push rbp
mov rbp, rsp
sub rsp, %s

"""%(hex(amt))


def zeroize(reg):
    return "xor %s, %s"%(reg,reg)

def label(name):
    return "\n%s:\n"%name


def functionlabel(fn):

    out = "\n_%s_%s_%s:\n"% ( fn.returntype.name, fn.name, "p#")
    types = ""
    for p in fn.parameters:
        types+=p.t.name
    out = out.replace("#", types)
    return out


def function_closer(name):
    return """


__%s__return:

leave
ret

"""%(name)

constantReservers = ["DB", "DW", "DD", "DQ"]
def getConstantReserver(t):
    return constantReservers[t.size-5]



def createIntrinsicConstant(variable):
    return "%s: %s %s"%(variable.name,getConstantReserver(variable.t), hex(variable.initializer))
    pass

stringconstant_counter = 0
def createStringConstant(s):

    out = []
    name = ("STRING_CONSTANT_%s"%stringconstant_counter)
    out.append( "%s: db `%s`, 0"%(name, s))
    out.append(name)
    return out

#compiletime:


