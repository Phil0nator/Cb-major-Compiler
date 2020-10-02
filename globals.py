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
FLOAT = DType("float", 8)
VOID = DType("void", 0)
BOOL = DType("bool", 1)

INTRINSICS = [INT,BOOL,DOUBLE,CHAR,BOOL,FLOAT]

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

    out = "_%s_%s_%s:\n"% ( fn.returntype, fn.name, "p#")
    types = ""
    for p in fn.parameters:
        types+=p.t.__repr__()
    out = out.replace("#", types)
    return out


def function_closer(name):
    return """
__%s__return:

leave
ret

"""%(name)

def psizeof(v):
    if v.isptr: return "qword"
    if v.t.size(0) == 1:
        return "byte"
    if v.t.size(0) == 8:
        return "qword"
    return "qword"

constantReservers = ["DB", "DW", "DD", "DQ"]
heapReservers = ["RESB", "RESW", "RESD", "RESQ"]
def getConstantReserver(t):
    return constantReservers[t.size(0)-5]

def getHeapReserver(t):
    if t.isptr: return "RESQ 1"
    return "RESB %s"%t.t.size(0)


def createIntrinsicConstant(variable):
    
    if((variable.t.name == DOUBLE.name or variable.t.name == FLOAT.name)):

        return "%s: dq __float32__(%s)\n"%(variable.name, (variable.initializer))

    return "%s: %s %s\n"%(variable.name,getConstantReserver(variable.t), (variable.initializer))

    pass

stringconstant_counter = 0
def createStringConstant(s):
    global stringconstant_counter
    out = []
    name = ("STRING_CONSTANT_%s"%stringconstant_counter)
    out.append( "%s: db `%s`, 0\n"%(name, s))
    out.append(name)
    stringconstant_counter+=1
    return out

floatconstant_counter = 0
def createFloatConstant(s):
    global floatconstant_counter
    out = []
    name = ("FLT_CONSTANT_%s"%floatconstant_counter)
    out.append("%s: dq __float32__(%s)\n"%(name,s))
    out.append(name)
    floatconstant_counter+=1
    return out


def createIntrinsicHeap(variable):
    return "%s: %s\n"%(variable.name,getHeapReserver(variable))



def movVarHeap(vd, vs):

    return "xor rax, rax\nmov rax, %s[%s]\n%s"%( psizeof(vs), vs.name, "mov %s[%s], rax\n"%( psizeof(vd), vd.name )  )






#compiletime:


def movRegToVar(od,reg):
    return "mov [rbp-%s], %s"%(hex(od),reg)

