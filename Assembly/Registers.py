################################
#
#   Registers contains information about register names,
#       usage, status, etc...
#
#
#################################


from Classes.Variable import Variable
import config
import traceback
# 64 bit registers

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

# masterlist -- includes all available registers
REGISTERS = ["rax", "rbx", "rcx", "rdx", "rsi", "rdi", "r8", "r9", "r10", "r11", "r12", "r13", "r14", "r15"
             "al", "bl", "cl", "dl", "r8b", "r9b", "r10b", "r11b", "r12b", "r13b", "r14b", "r15b",
             "eax", "ebx", "ecx", "edx", "esi", "edi", "r8d", "r9d", "r10d", "r11d", "r12d", "r13d", "r14d", "r15d",
             "ax", "bx", "cx", "dx", "si", "di", "r8w", "r9w", "r10w", "r11w", "r12w", "r13w", "r14w", "r15w"
             ]
if(REGISTERS[-1] == "r15w"):
    for i in range(15):
        REGISTERS.append(f"xmm{i}")
        REGISTERS.append(f"ymm{i}")

# get byte version of qword register
boolchar_version = {

    rax: al,
    rbx: bl,
    rcx: cl,
    rdx: dl,
    r8: r8b,
    r9: r9b,
    r10: r10b,
    r11: r11b,
    r12: r12b,
    r13: r13b,
    r14: r14b,
    r15: r15b,
    rdi: "dil",
    rsi: "sil"


}
# get dword version of qword version
dword_version = {

    rax: "eax",
    rbx: "ebx",
    rcx: "ecx",
    rdx: "edx",
    r8: "r8d",
    r9: "r9d",
    r10: "r10d",
    r11: "r11d",
    r12: "r12d",
    r13: "r13d",
    r14: "r14d",
    r15: "r15d",
    rsi: "esi",
    rdi: "edi"


}
# get word version of qword register
small_version = {

    rax: "ax",
    rbx: "bx",
    rcx: "cx",
    rdx: "dx",
    r8: "r8w",
    r9: "r9w",
    r10: "r10w",
    r11: "r11w",
    r12: "r12w",
    r13: "r13w",
    r14: "r14w",
    r15: "r15w",
    rsi: "si",
    rdi: "di"


}
# return any int register to its qword size
normal_size = {


    "al": rax,
    "ax": rax,
    "eax": rax,
    "rax": rax,
    "bl": rbx,
    "bx": rbx,
    "ebx": rbx,
    "rbx": rbx,
    "cl": rcx,
    "cx": rcx,
    "ecx": rcx,
    rcx: rcx,
    "dl": rdx,
    "dx": rdx,
    "edx": rdx,
    "rdx": rdx,
    r8b: r8,
    r9b: r9,
    r10b: r10,
    r11b: r11,
    r12b: r12,
    r13b: r13,
    r14b: r14,
    r15b: r15,
    "r8w": r8,
    "r9w": r9,
    "r10w": r10,
    "r11w": r11,
    "r12w": r12,
    "r13w": r13,
    "r14w": r14,
    "r15w": r15,
    "r8d": r8,
    "r9d": r9,
    "r10d": r10,
    "r11d": r11,
    "r12d": r12,
    "r13d": r13,
    "r14d": r14,
    "r15d": r15,
    r8: "r8",
    r9: "r9",
    r10: "r10",
    r11: "r11",
    r12: "r12",
    r13: "r13",
    r14: "r14",
    r15: "r15",
    "sil": rsi,
    "dil": rdi,
    "si": rsi,
    "di": rdi,
    "esi": rsi,
    "edi": rdi,
    rsi: rsi,
    rdi: rdi

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

win_norm_parameter_registers = [

    rcx,
    rdx,
    r8,
    r9

]

win_sse_parameter_registers = [
    xmm0,
    xmm1,
    xmm2,
    xmm3
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
# scratch

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

callee_registers = [
    "rbx",
    "r10",
    "r11",
    "r12",
    "r13",
    "r14",
    "r15"
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
# allocation
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
    False,
    False
]



# register allocation and deallocation system:
def ralloc(flt, size=8, allow_volatile=True):

    # Register leak debugging:
    #config.LAST_RALLOC = traceback.format_stack()

    if(flt or size > 8):
        for i in range(len(sse_scratch_registers_inuse)):
            if(not sse_scratch_registers_inuse[i]):
                out = sse_scratch_registers[i]
                sse_scratch_registers_inuse[i] = True
                return out

    else:
        for i in range(len(norm_scratch_registers_inuse)):

            if i == 1 and config.rcx_functioncalls_inprogress > 0:
                continue

            if(not norm_scratch_registers_inuse[i]):
                out = norm_scratch_registers[i]
                norm_scratch_registers_inuse[i] = True

                return setSize(out, size)


def reralloc(r):
    if(not isinstance(r, str)):
        return
    r = normal_size[r]
    if("xmm" in r):
        sse_scratch_registers_inuse[sse_scratch_registers.index(r)] = True
    else:
        norm_scratch_registers_inuse[norm_scratch_registers.index(r)] = True


def ravailable(r):
    if "xmm" in r:
        return sse_scratch_registers_inuse[sse_scratch_registers.index(r)]
    return norm_scratch_registers_inuse[norm_scratch_registers.index(
        setSize(r, 8))]


def ralloc_last(flt=False):
    if(not flt):
        for i in range(len(norm_scratch_registers_inuse)):
            if(not norm_scratch_registers_inuse[i]):
                return norm_scratch_registers[i - 1]
    else:
        for i in range(len(sse_scratch_registers_inuse)):
            if(not sse_scratch_registers_inuse[i]):
                return sse_scratch_registers[i - 1]


def rfree(r):
    if(not isinstance(r, str) or r in ["pop", ""]):
        return
    r = normal_size[r] if not r.startswith("xmm") else r
    if r in sse_scratch_registers:
        sse_scratch_registers_inuse[sse_scratch_registers.index(r)] = False
    elif r in norm_scratch_registers:
        norm_scratch_registers_inuse[norm_scratch_registers.index(r)] = False


def rfreeAll():
    for i in range(len(sse_scratch_registers_inuse)):
        sse_scratch_registers_inuse[i] = False
        norm_scratch_registers_inuse[i] = False

# set reg to size size (bytes)


def setSize(reg, size):

    if isinstance(reg, int):
        return reg

    if("xmm" in reg):
        return reg

    reg = normal_size[reg]

    if(size == 1):
        return boolchar_version[reg]
    elif(size == 2):
        return small_version[reg]
    elif(size == 4):
        return dword_version[reg]

    return reg

# get the size in bytes of a register


def sizeOf(reg):
    if(isinstance(reg, Variable)):
        return reg.t.csize()
    elif(isinstance(reg, int)):
        return 8

    if("xmm" in reg):
        return 8
    if(setSize(reg, 4) == reg):
        return 4
    if(setSize(reg, 1) == reg):
        return 1
    if(setSize(reg, 2) == reg):
        return 2
    return 8


# return registers
norm_return_register = rax
sse_return_register = xmm0
