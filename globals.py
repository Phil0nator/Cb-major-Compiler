from DType import *
from Variable import *
from Token import *
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
    

]


nrom_scratch_registers = [

    r10,
    r11,
    r12,
    r13,
    r14,
    r15

]

sse_scratch_registers = [


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
VOID = DType("void", 8)
BOOL = DType("bool", 1)

INTRINSICS = [INT,BOOL,DOUBLE,CHAR,BOOL,FLOAT,VOID]

false = (0)
true = (255)









PRIORITY = {

    "(":0,
    "+":1,
    "-":1,
    "!":1,
    "||":1,
    "&&":1,
    "==":1,
    "!=":1,
    ">":1,
    "<":1,
    ">=":1,
    "<=":1,
    ">>>":1,
    "<<<":1,
    "^":1,
    "*":2,
    "/":2,
    "%":2,


}


OPERATORS = [

    "(",
    "+",
    "-",
    "!",
    "||",
    "&&",
    "==",
    "!=",
    ">",
    "<",
    ">=",
    "<=",
    ">>",
    "<<",
    "^",
    "*",
    "/",
    "%"


]









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

"""%((amt))


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
    return """__%s__return:

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
    if("xmm" not in reg):
        return "mov [rbp-%s], %s"%((od),reg)
    else:
        return "movsd [rbp-%s], %s"%((od), reg)
def movValToVar(var, reg):
    if var.glob :
        return "mov [%s], %s"%(var.name,reg)
    else:
        movRegToVar(var,reg)

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



def fncall(fn):
    return "call %s\n"%fn.getCallingLabel()

def valueOf(x):
    if (isinstance(x,str)):
        return x
    elif (isinstance(x, Variable)):
        if(x.glob):
            if(x.isptr):
                return f"{x.name}"
            return f"[{x.name}]"
        else:
            return "[rbp-%s]"%(x.offset)
    elif (isinstance(x, int)):
        return (x)
    

def loadToAB(a, b):
    return "mov %s, %s\n%s"%(rbx, valueOf(b), "mov %s, %s\n"%(rax, valueOf(a)))

def loadTo78(a, b):
    return f"movsd {xmm7}, {valueOf(a)}\nmovsd {xmm8}, {valueOf(b)}\n"

def loadFI(a, b):
    return f"movsd {xmm7}, {valueOf(a)}\ncvtsi2sd {xmm8}, {valueOf(b)}\n"

def loadIF(a, b):
    return f"cvtsi2sd {xmm7}, {valueOf(a)}\nmovsd {xmm8}, {valueOf(b)}\n"

def isfloat(x):
    if (isinstance(x, Token)):
        if(x.tok == T_REGISTER):
            return "xmm" in x.value
        else:
            if(isinstance(x.value, int)): return False
            return False
    if(isinstance(x, str)):
        return "xmm" in x
    if(isinstance(x, Variable)):
        return x.isflt()
    return False




def addI():
    return f"add {rax}, {rbx}\n"
def addF():
    return f"addsd {xmm7}, {xmm8}\n"

def subI():
    return f'sub {rax}, {rbx}\n'
def subF():
    return f"subsd {xmm7}, {xmm8}\n"

def mulI():
    return f"imul {rax}, {rbx}\n"
def mulF():
    return f"mulsd {xmm7}, {xmm8}\n"

def divI():
    return f"xor rdx, rdx\nidiv {rbx}\n"
def divF():
    return f"divsd {xmm7}, {xmm8}\n"






def doOperation(a, b, o, d):
    instr = "\n"
    if(isfloat(a) and isfloat(b)):
        instr+=loadTo78(a,b)
    elif(isfloat(a) and not isfloat(b)):
        instr+=loadFI(a,b)
    elif (not isfloat(a) and isfloat(b)):
        instr+=loadIF(a,b)
    else:
        instr+=loadToAB(a,b)
    

    if(isfloat(a) or isfloat(b)):
        if(o == "+"):
            instr+=addF()
        elif(o == "-"):
            instr+=subF()
        elif(o == "/"):
            instr+=divF()
        elif(o=="*"):
            instr+=mulF()


        instr += f"movsd {d}, {xmm7}\n"

    else:
        if(o == "+"):
            instr+=addI()
        elif(o == "-"):
            instr+=subI()
        elif(o == "/"):
            instr+=divI()
        elif(o=="*"):
            instr+=mulI()
    
        instr += f"mov {d}, {rax}\n"


    return instr
