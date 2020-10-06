from Classes.DType import *
from Classes.Variable import *
from Classes.Token import *
import time
import Classes.ExpressionComponent as EC







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

boolchar_version = {

    rax:al,
    rbx:bl,
    rcx:cl,
    rdx:dl,
    r8:r8b,
    r9:r9b,
    r10:r10b,
    r11:r11b,
    r12:r12b,
    r13:r13b,
    r14:r14b,
    r15:r15b


}


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


norm_scratch_registers = [
    
    rbx,
    rcx,
    r10,
    r11,
    r12,
    r13,
    r14,
    r15

]

sse_scratch_registers = [

    xmm7,
    xmm8,
    xmm9,
    xmm10,
    xmm11,
    xmm12,
    xmm13,
    xmm14,

]

sse_scratch_registers_inuse = [
    False,
    False,
    False,
    False,
    False,
    False,
    False,
    False
]

norm_scratch_registers_inuse = [
    False,
    False,
    False,
    False,
    False,
    False,
    False,
    False
]

def ralloc(flt):
    if(flt):
        for i in range(len(sse_scratch_registers_inuse)):
            if(not sse_scratch_registers_inuse[i]):
                out = sse_scratch_registers[i]
                sse_scratch_registers_inuse[i]=True
                return out

    else:
        for i in range(len(norm_scratch_registers_inuse)):
            if(not norm_scratch_registers_inuse[i]):
                out = norm_scratch_registers[i]
                norm_scratch_registers_inuse[i]=True
                return out

                
def rfree(r):
    
    if r in sse_scratch_registers:
        sse_scratch_registers_inuse[sse_scratch_registers.index(r)] = False
    elif r in norm_scratch_registers: norm_scratch_registers_inuse[norm_scratch_registers.index(r)] = False
def rfreeAll():
    for i in range(len(sse_scratch_registers_inuse)):
        sse_scratch_registers_inuse[i]=False
        norm_scratch_registers_inuse[i]=False



ensure_boolean = "and al, 00000001b\n"
check_fortrue = f"{ensure_boolean}cmp al, 1\n"







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
VOID = DType("void", 8)
BOOL = DType("bool", 1)



INTRINSICS = [INT,BOOL,DOUBLE,CHAR,BOOL,VOID]

false = (0)
true = (255)



signed_comparisons = {

    "==": "je",
    "!=": "jne",
    "<" : "jl",
    ">" : "jg",
    "<=": "jle",
    ">=": "jge"

}

unsigned_comparisons = {

    "==": "je",
    "!=": "jne",
    "<" : "jb",
    ">" : "ja",
    "<=": "jbe",
    ">=": "jae"

}

def getComparater(signed, op):
    if(signed):
        return signed_comparisons[op]
    else:
        return unsigned_comparisons[op]




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
    "&":3,
    "@":3,
    "$":0


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
    "%",
    "&",
    "@",
    "$"


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

def getSizeSpecifier(t):

    return "QWORD"

def createIntrinsicConstant(variable):
    
    if((variable.t.isflt())):

        #return "%s: dq __float32__(%s)\n"%(variable.name, (variable.initializer))
        return f"{variable.name}: dq {variable.initializer.hex()}\n"

    return "%s: %s %s\n"%(variable.name,getConstantReserver(variable.t), (variable.initializer))

    

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
    #out.append("%s: dq __float32__(%s)\n"%(name,s))
    out.append(f"{name}: dq {s.hex()}\n")
    out.append(name)
    floatconstant_counter+=1
    return out


def createIntrinsicHeap(variable):
    return "%s: %s\n"%(variable.name,getHeapReserver(variable))



def movVarHeap(vd, vs):

    return "xor rax, rax\nmov rax, %s[%s]\n%s"%( psizeof(vs), vs.name, "mov %s[%s], rax\n"%( psizeof(vd), vd.name )  )






#compiletime:
def isIntrinsic(q):
    for t in INTRINSICS:
        if q == t.name:
            return True
    return False

def TsCompatible(typea, typeb, fni):
    return typematch(typea, typeb)


def typematch(a, b):
    if(isinstance(a, DType) and isinstance(b, DType)):
        if(a.name == "void" or b.name == "void"): return True
        if(a.ptrdepth != b.ptrdepth): return False
        if(a.isflt() and b.isflt()): return True
        
        if(isIntrinsic(a.name) and isIntrinsic(b.name)):
            if(type_precedence[a.name] > type_precedence[b.name]): return True
            return False
        

    return False





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
def spush(v: EC.ExpressionComponent):
    if(v.type.isflt()):
        return f"movq {rax}, {v.accessor}\npush {rax}\n"
    if(isinstance(v.accessor, Variable)):
        return f"mov {rax}, {valueOf(v.accessor)}\npush {rax}\n"
    return f"push {v.accessor}\n"

def fncall(fn):
    return "call %s\n"%fn.getCallingLabel()

def valueOf(x, dflt = False):
    if (isinstance(x,str)):
        return x
    elif (isinstance(x, Variable)):
        if(x.glob):
            if(x.isptr):
                return f"{x.name}"
            return f"[{x.name}]"
        else:
            return f"{getSizeSpecifier(x.t)}[rbp-{x.offset}]"
    elif (isinstance(x, int)):
        return (x)


def loadToReg(reg, value):
    if(reg == value):return ""
    if(value == "pop"):
        if(isinstance(reg, str)):
            if("xmm" in reg):
                pop = f"pop {rax}\n"
                return f"{pop}movq {reg}, {rax}\n"
            return f"pop {reg}\n"
        elif(isinstance(reg, Variable)):
            return f"pop {rax}\nmov {valueOf(reg)}, {rax}\n"

    if(isinstance(reg, str)):
        if("xmm" in reg):
            return f"movsd {reg}, {valueOf(value)}\n"
        return f"mov {reg}, {valueOf(value)}\n"
    elif(isinstance(reg, Variable)):
        
        if(reg.t.isflt()):
            
            return f"movsd {valueOf(reg)}, {valueOf(value)}\n"
        return f"mov {valueOf(reg)}, {valueOf(value)}\n"
    

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
        
        return x.isflt() and not x.isptr
    return False




total_labelCounter = -1
def getLogicLabel(inf):
    global total_labelCounter
    total_labelCounter+=1
    return f"_L{inf}_{hex(total_labelCounter)}"


def operatorISO(op):
    return op in ["!", "@", "&", "$"]


def calculateConstant(a, b, op):
    if(op == "*"):
        return EC.ExpressionComponent(int(a.accessor*b.accessor), INT.copy(), constint=True)
    elif(op == "/"):
        return EC.ExpressionComponent(int(a.accessor/b.accessor),INT.copy(), constint=True)
    elif(op == "+"):
        return EC.ExpressionComponent(int(a.accessor+b.accessor),INT.copy(), constint=True)
    elif(op == "-"):
        return EC.ExpressionComponent(int(a.accessor-b.accessor),INT.copy(), constint=True)
    elif(op == "=="):
        return EC.ExpressionComponent(int(a.accessor==b.accessor),INT.copy(), constint=True)
    elif(op == "!="):
        return EC.ExpressionComponent(int(a.accessor!=b.accessor),INT.copy(), constint=True)
    elif(op == "<="):
        return EC.ExpressionComponent(int(a.accessor<=b.accessor),INT.copy(), constint=True)
    elif(op == ">="):
        return EC.ExpressionComponent(int(a.accessor>=b.accessor),INT.copy(), constint=True)
    elif(op == ">"):
        return EC.ExpressionComponent(int(a.accessor>b.accessor),INT.copy(), constint=True)
    elif(op == "<"):
        return EC.ExpressionComponent(int(a.accessor<b.accessor),INT.copy(), constint=True)



def doIntOperation(areg, breg, op, signed):
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
        
        return f"xor rdx, rdx\nmov{rax},{areg}\n{asmop} {breg}\nmov {areg}, {rax}\n"
    
    elif(op == "mov"):
        return f"mov {areg}, {breg}\n"

    elif(op in ["==","!=",">","<","<=",">="]):
        return cmpI(boolchar_version[areg],boolchar_version[breg],signed,op)
    elif(op in ["!","&&","||","^"]):
        return boolmath(boolchar_version[areg],boolchar_version[breg],op)


def cmpI(areg, breg,signed, op):
    infl = getLogicLabel("CMPI")
    inflpost = getLogicLabel("CMPIPOST")
    comparator = getComparater(signed, op)
    return f"cmp {areg}, {breg}\n{comparator} {infl}\nxor {areg}, {areg}\njmp {inflpost}\n{infl}:\nmov {areg}, 255\n{inflpost}:\n"

def boolmath(areg, breg,op):
    cmd = ""
    if(op == "||"):
        cmd = "or"
    elif(op == "&&"):
        cmd = "and"
    elif(op == "^"):
        cmd = "xor"
    elif(op == "!"):
        instr = f"not {areg}\n"
        instr += f"and {areg}, 00000001b\n"
        return instr
        
    instr = f"{cmd} {areg}, {breg}\n"
    return instr














def doFloatOperation(areg, breg, op):
    asmop = ""
    if(op == "+"):
        asmop = "addsd"
    elif(op == "-"):
        asmop="subsd"
    elif(op == "*"):
        asmop="mulsd"
    elif(op == "/"):
        asmop="divsd"
    elif(op == "mov"):
        asmop="movsd"
    
    return f"{asmop} {areg}, {breg}\n"
    

def doOperation(areg, breg, op, signed = False):
    if("xmm" in areg and "xmm" in breg):
        return doFloatOperation(areg, breg, op)
    elif("xmm" not in areg and "xmm" not in breg):
        return doIntOperation(areg,breg,op, signed)
    else:
        print("fatal type mismatch: unkown.")
        exit(1)





def castABD(a, b, areg, breg, newbreg):
    if(not a.type.isflt() and not b.type.isflt()):
        return False
    if(a.type.isflt() and not b.type.isflt()):
        return f"cvtsi2sd {valueOf(newbreg)}, {valueOf(breg)}\n"
    if(b.type.isflt() and not a.type.isflt()):
        return f"cvttsd2si {valueOf(newbreg)}, {valueOf(breg)}\n"
    return False