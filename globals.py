import Classes.DType as Type
from Classes.DType import DType
from Classes.Variable import Variable
import Classes.Token as T
import time
import Classes.ExpressionComponent as EC
import config
import math
###################################
#
#   globals contains the majority of the raw assembly functions
#       and lower level handling.
#   globals also contains a lot of general information about how
#       registers, operations, datatypes, etc... will be handled
#       in the Compiler and the Function.
#   globals is a mess. 
#   \see Compiler
#   \see Function
#   \see DType
#
###################################




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
    r15:r15b,
    rdi:"DIL",
    rsi:"SIL"


}

dword_version = {

    rax:"eax",
    rbx:"ebx",
    rcx:"ecx",
    rdx:"edx",
    r8:"r8d",
    r9:"r9d",
    r10:"r10d",
    r11:"r11d",
    r12:"r12d",
    r13:"r13d",
    r14:"r14d",
    r15:"r15d",
    rsi:"esi",
    rdi:"edi"


}

small_version = {

    rax:"ax",
    rbx:"bx",
    rcx:"cx",
    rdx:"dx",
    r8:"r8w",
    r9:"r9w",
    r10:"r10w",
    r11:"r11w",
    r12:"r12w",
    r13:"r13w",
    r14:"r14w",
    r15:"r15w",
    rsi:"si",
    rdi:"di"


}

normal_size = {


    "al":rax,
    "ax":rax,
    "eax":rax,
    "rax":rax,
    "bl":rbx,
    "bx":rbx,
    "ebx":rbx,
    "rbx":rbx,
    "cl":rcx,
    "cx":rcx,
    "ecx":rcx,
    rcx:rcx,
    "dl":rdx,
    "dx":rdx,
    "edx":rdx,
    "rdx":rdx,
    r8b:r8,
    r9b:r9,
    r10b:r10,
    r11b:r11,
    r12b:r12,
    r13b:r13,
    r14b:r14,
    r15b:r15,
    "r8w":r8,
    "r9w":r9,
    "r10w":r10,
    "r11w":r11,
    "r12w":r12,
    "r13w":r13,
    "r14w":r14,
    "r15w":r15,
    "r8d":r8,
    "r9d":r9,
    "r10d":r10,
    "r11d":r11,
    "r12d":r12,
    "r13d":r13,
    "r14d":r14,
    "r15d":r15,
    r8:"r8",
    r9:"r9",
    r10:"r10",
    r11:"r11",
    r12:"r12",
    r13:"r13",
    r14:"r14",
    r15:"r15",
    "sil":rsi,
    "dil":rdi,
    "si":rsi,
    "di":rdi,
    "esi":rsi,
    "edi":rdi,
    rsi:rsi,
    rdi:rdi

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

# register allocation and deallocation system:
def ralloc(flt, size=8):
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

                if(size==1): out = boolchar_version[out]
                elif(size == 4): out = dword_version[out]
                elif(size == 2): out = small_version[out]
                return out

                
def rfree(r):
    if(isinstance(r, Variable)):
        return 
    if r in sse_scratch_registers:
        sse_scratch_registers_inuse[sse_scratch_registers.index(r)] = False
    elif r in norm_scratch_registers: norm_scratch_registers_inuse[norm_scratch_registers.index(r)] = False

def rfreeAll():
    for i in range(len(sse_scratch_registers_inuse)):
        sse_scratch_registers_inuse[i]=False
        norm_scratch_registers_inuse[i]=False

# bitmasks for boolean values
# 4 = 4 bytes = 32 bits = 4 nibs
ensure_boolean = "and al, 00000001b\n"
def maskset(reg, size):
    if(size == 8): return ""
    if(size == 4): return f"and {reg}, 0xffffffff\n"
    if(size == 2): return f"and {reg}, 0xffff\n"
    if(size == 1): return f"and {reg}, 0xff\n"

check_fortrue = f"{ensure_boolean}cmp al, 1\n"






# return registers
norm_return_register = "rax"
sse_return_register = "xmm0"

#Load template stub
with open("include/stub.asm", "rb") as f:
    stub = f.read().decode()

with open("include/io64.inc", "rb") as f:
    io64 = f.read().decode()

fileTemplate = "%s\n\n%s"%(io64,stub)


# primitive types:

INT = DType("int", 8, signed=True)
SHORT = DType("short", 4, signed=True)
SMALL = DType("small", 2, signed=True)
CHAR = DType("char", 1, signed=True)
DOUBLE = DType("double", 8, signed=True)
VOID = DType("void", 8, signed=True)
BOOL = DType("bool", 1, signed=True)



INTRINSICS = [INT,SHORT,BOOL,DOUBLE,CHAR,BOOL,VOID,SMALL]




signed_comparisons = {

    "==": "e",
    "!=": "ne",
    "<" : "l",
    ">" : "g",
    "<=": "le",
    ">=": "ge"

}

unsigned_comparisons = {

    "==": "e",
    "!=": "ne",
    "<" : "b",
    ">" : "a",
    "<=": "be",
    ">=": "ae"

}

def getComparater(signed, op):
    if(signed):
        return signed_comparisons[op]
    else:
        return unsigned_comparisons[op]



# Operator priority (complicated pemdas)
PRIORITY = {

    "(":0,
    "[":0,



    


    
    
    "||":1,

    "&&":2,
    
    "|":3,
    
    "^":4,
    
    "&":5,



    "==":6,
    "!=":6,
    
    
    ">":7,
    "<":7,
    ">=":7,
    "<=":7,
    
    ">>":8,
    "<<":8,

    "+":9,
    "-":9,
    
    "*":10,
    "/":10,
    "%":10,



    "&":11,
    "@":11,
    "~":11,
    "!":11,
    "->":11,


    "$":12,


}


OPERATORS = [

    "(",
    "]",
    "[",
    "+",
    "-",
    "!",
    "~",
    "&",
    "|",
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
    "->",
    ".",
    "$"


]

integer_only = [

    ">>",
    "<<"


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


def function_closer(name, destructions):
    return """__%s__return:
%s
leave
ret

"""%(name, destructions)
# get size specifier for address
def psizeof(v):
    if v.isptr: return "qword"
    if v.t.size(0) == 1:
        return "byte"
    if v.t.size(0) == 8:
        return "qword"
    elif v.t.size(0) == 4:
        return "dword"
    elif v.t.size(0) == 2:
        return "word"
    return "qword"

def psizeoft(t):
    if t.size(0) == 1:
        return "byte"
    if t.size(0) == 8:
        return "qword"
    elif t.size(0) == 4:
        return "dword"
    elif t.size(0) == 2:
        return "word"
    return "qword"


# section reserver sizes
constantReservers = ["DB", "DW", "DD", "DQ"]
heapReservers = ["RESB", "RESW", "RESD", "RESQ"]
def getConstantReserver(t):
    return constantReservers[t.size(0)-5]

def getHeapReserver(t):
    if t.isptr: return "RESQ 1"
    if(t.t.csize()<=8): return "RESQ 1"
    return "RESB %s"%t.t.csize()

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


def setSize(reg, size):
    if(size == 1): return boolchar_version[reg]
    elif(size == 2): return small_version[reg]
    elif(size == 4): return dword_version[reg]

    return reg



#compiletime:
def isIntrinsic(q):
    for t in INTRINSICS:
        if config.GlobalCompiler.Tequals(t.name, q):
            return True
    return False

# determine compatibility of two types
def TsCompatible(typea, typeb, fni):
    return typematch(typea, typeb)


def typematch(a, b):
    if(isinstance(a, DType) and isinstance(b, DType)):
        
        if(config.GlobalCompiler.Tequals(a.name,"void") or config.GlobalCompiler.Tequals(b.name,"void")): return True
        if(a.__eq__(INT.copy()) and b.ptrdepth > 0): return True
        if(a.__eq__(b)):return True
        elif(DType(a.name,a.size,None,a.ptrdepth,False).__eq__(DType(b.name,b.size,None,b.ptrdepth,False))): return True
        if(a.ptrdepth != b.ptrdepth): return False
        if(a.isflt() and b.isflt()): return True
        
        if(isIntrinsic(a.name) and isIntrinsic(b.name)):
            if(Type.type_precedence[a.name] > Type.type_precedence[b.name]): return True
            return False
        

    return False



def loadToPtr(dest, source):
    if(isinstance(dest, Variable)):
        return loadToReg(dest,source)
    return loadToReg(f"[{dest}]",source)

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

#push to stack
def spush(v: EC.ExpressionComponent):
    if(v.type.isflt()):
        return f"movq {rax}, {v.accessor}\npush {rax}\n"
    if(isinstance(v.accessor, Variable)):
        return f"mov {rax}, {valueOf(v.accessor)}\npush {rax}\n"
    return f"push {v.accessor}\n"

def fncall(fn):
    return "call %s\n"%fn.getCallingLabel()

# get the value of x (if x is register, return x;  if x is variable, return address; etc...)
def valueOf(x, dflt = False, exactSize=False):
    if (isinstance(x,str)):
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

def dwordize(value):
    if(isinstance(value, int)):
        return value
    if(isinstance(value, Variable)):
        return valueOf(value)
    return dword_version[value]






def loadToReg(reg, value):
    
    if(reg == value):return ""
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
            #TODO:
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

# determine if unkown type x refers to float value
def isfloat(x):
    if (isinstance(x, T.Token)):
        if(x.tok == T.T_REGISTER):
            return "xmm" in x.value
        else:
            if(isinstance(x.value, int)): return False
            return False
    if(isinstance(x, str)):
        return "xmm" in x
    if(isinstance(x, Variable)):
        
        return x.isflt() and not x.isptr
    return False



# logic label handling
total_labelCounter = -1
def getLogicLabel(inf):
    global total_labelCounter
    total_labelCounter+=1
    return f"_L{inf}_{hex(total_labelCounter)}"


def operatorISO(op):
    return op in ["!", "@", "&", "$","~"]


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
    elif(op == "%"):
        return EC.ExpressionComponent(int(a.accessor%b.accessor),INT.copy(), constint=True)
    elif(op == ">>"):
        return EC.ExpressionComponent(int(a.accessor>>b.accessor), INT.copy(), constint=True)
    elif(op == "<<"):
        return EC.ExpressionComponent(int(a.accessor<<b.accessor), INT.copy(), constint=True) 
    elif(op == "||" or op == "|"):
        return EC.ExpressionComponent(int(a.accessor or b.accessor), INT.copy(), constint=True) 
    elif(op == "&&" or op == "&"):
        return EC.ExpressionComponent(int(a.accessor and b.accessor), INT.copy(), constint=True) 
    elif(op == "^"):
        return EC.ExpressionComponent(int(a.accessor ^ b.accessor), INT.copy(), constint=True) 

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
    elif( op in [">>","<<"]):
        return shiftInt(areg,breg,op,signed)

    elif(op == "mov"):
        return f"mov {areg}, {breg}\n"
    
    elif(op in ["==","!=",">","<","<=",">="]):
        return cmpI(areg,breg,signed,op)
    elif(op in ["!","&&","||","^","~","|","&"]):
        return boolmath(areg,breg,op)


def cmpI(areg, breg,signed, op):

    comparator = getComparater(signed, op)

    return f"\ncmp {areg}, {breg}\nset{comparator} {boolchar_version[areg]}\n"


def cmpF(areg, breg, op):
    
    comparator = getComparater(False, op)
    return f"ucomisd {areg}, {breg}\nset{comparator} {al}\n"


def boolmath(areg, breg,op):
    cmd = ""
    if(op == "||"):
        cmd = "or"
    elif(op == "&&"):
        cmd = "and"
    elif(op == "^"):
        cmd = "xor"
    elif(op == "!"):
        #instr = f"not {areg}\n"
        #instr += f"and {areg}, 00000001b\n"
        #return instr
        return cmpI(areg,0,False,"==")
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
        return cmpF(areg,0,"==")
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
        asmop="subsd"
    elif(op == "*"):
        asmop="mulsd"
    elif(op == "/"):
        asmop="divsd"
    elif(op == "mov"):
        asmop="movsd"
    
    elif(op in ["==","!=",">","<","<=",">="]):
        return cmpF(areg,breg,op)
    elif(op in ["&&","||","^","!","~","&","|"]):
        return bitmathf(areg,breg,op)

    return f"{asmop} {areg}, {breg}\n"
    

def doOperation(t, areg, breg, op, signed = False):
    if("xmm" in areg and "xmm" in breg):
        return doFloatOperation(areg, breg, op)
    elif("xmm" not in areg and "xmm" not in breg):
        return doIntOperation(areg,breg,op, signed, size=t.size(0))
    else:
        print("fatal type mismatch: unkown.")
        exit(1)





def castABD(a, b, areg, breg, newbreg):
    if(not a.type.isflt() and not b.type.isflt()):
        if(a.type.csize() != b.type.csize()):
            out = maskset(newbreg,a.type.csize())
            out+=f"mov {newbreg}, {breg}\n"
            return out
        return False
    if(a.type.isflt() and not b.type.isflt()):
        return f"cvtsi2sd {valueOf(newbreg)}, {valueOf(breg)}\n"
    if(b.type.isflt() and not a.type.isflt()):
        return f"cvttsd2si {valueOf(newbreg)}, {valueOf(breg)}\n"
    return False



# optimizations
def canShiftmul(val):
    
    x = math.log2(val)
    if(not x.is_integer()):
        return False
    return True

















# SIMD
def ymmVersion(xmm):
    return xmm.replace("x","y")

def xmmVersion(ymm):
    return ymm.replace("y", "x")

def avx_correctSize(avxreg, size):
    if(size == 2): return xmmVersion(avxreg)
    return avxreg

avx_registers = []
avx_inuse = []
if(len(avx_registers) == 0):
    for i in range(15):
        avx_registers.append(f"ymm{i}")
        avx_inuse.append(False)

def avx_ralloc():
    for i in range(15):
        if(not avx_inuse[i]):
            avx_inuse[i] = True
            return avx_registers[i]
def avx_rfree(reg):
    if("x" in reg): reg = ymmVersion(reg)
    avx_inuse[avx_registers.index(reg)] = False

avx_load2 = "movdqu"
avx_load4 = "vmovdqu"

avx_add2 = "padd#"
avx_add4 = "vpadd#"

avx_sub2 = "psub#"
avx_sub4 = "vpsub#"

avx_mul2 = "pmulud#"
avx_mul4 = "vpmulud#"


#
#   __simd __add2 dtype ( array, startp ) { 
#                                           ( operation )(array2, startp2), 
#                                           (operation)(arrayn, startpn)    
#                                         }(destarr, destarrstart)
#

def avx_getOp(opspec):
    if("add" in opspec):
        if("2" in opspec):
            return avx_add2
        if("4" in opspec):
            return avx_add4
    elif("sub" in opspec):
        if("2" in opspec):
            return avx_sub2
        if("4" in opspec):
            return avx_sub4
    elif("mul" in opspec):
        if("2" in opspec):
            return avx_mul2
        if("4" in opspec):
            return avx_mul4
    if(opspec == "+2"):
        return avx_add2
    if(opspec == "+4"):
        return avx_add4
    if(opspec == "-2"):
        return avx_sub2
    if(opspec == "-4"):
        return avx_sub4
    if(opspec == "*2"):
        return avx_mul2
    if(opspec == "*4"):
        return avx_mul4
    


def avx_getLoader(opspec):
    if(2 == opspec):
        return avx_load2
    return avx_load4
def shiftmul(i):
    return int(math.log2(i))

def avx_loadToReg(loadop, avxreg, arr, idx):
    out = ""
    if(arr.isStackarr):
        out+=(f"lea {idx}, [rbp+{idx}*{arr.t.csize()}]\n")
        out+=(f"sub {idx}, {arr.offset+arr.stackarrsize}\n")
        out+=(f"{avx_getLoader(loadop)} {avxreg}, [{idx}]\n")
    else:
        out+=(f"shl {idx}, {shiftmul(arr.t.csize())}\n")
        out+=(f"add {idx}, [rbp-{arr.offset}]\n")
        out+=(f"{avx_getLoader(loadop)} {avxreg}, [{idx}]\n")
    return out

avx_sizeSpecifier = ["b", "w", None, "d", None, None, None, "q"]

flt_avx_cmd = {
    "-":"subpd",
    "+":"addpd",
    "*":"mulpd",
    "/":"divpd"
}


def avx_doToReg(op, opcount, size, dest, source, flt):
    
    if(not flt):
        cmd = avx_getOp(f"{op}{opcount}")
        
        cmd = cmd.replace("#",avx_sizeSpecifier[size-1])
        if(opcount == 4):
            return f"{cmd} {dest}, {source}, {dest}\n"
        return f"{cmd} {dest}, {source}\n"
    else:
        cmd = flt_avx_cmd[op]
        if(opcount == 4): 
            cmd = f"v{cmd}"
            return f"{cmd} {dest}, {source}, {dest}\n"
        return f"{cmd} {dest}, {source}\n"


def avx_dropToAddress(loadop, avxreg, arr, idx):
    out = ""
    if(arr.isStackarr):
        out+=(f"lea {idx}, [rbp+{idx}*{arr.t.csize()}]\n")
        out+=(f"sub {idx}, {arr.offset+arr.stackarrsize}\n")
        out+=(f"{avx_getLoader(loadop)} [{idx}], {avxreg}\n")
    else:
        out+=(f"shl {idx}, {shiftmul(arr.t.csize())}\n")
        out+=(f"add {idx}, [rbp-{arr.offset}]\n")
        out+=(f"{avx_getLoader(loadop)} [{idx}], {avxreg}\n")
    return out