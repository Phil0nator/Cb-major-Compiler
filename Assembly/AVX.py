###############################################
#
#   AVX contains all assembly information specific
#       to AVX operations including registers,
#       instructions, codeblocks, etc...
#
#
################################################

from Assembly.CodeBlocks import shiftmul

# SIMD


def ymmVersion(xmm):
    return xmm.replace("x", "y")


def xmmVersion(ymm):
    return ymm.replace("y", "x")


def avx_correctSize(avxreg, size):
    if(size == 2):
        return xmmVersion(avxreg)
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
    if("x" in reg):
        reg = ymmVersion(reg)
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


def avx_loadToReg(loadop, avxreg, arr, idx):
    out = ""
    if(arr.isStackarr):
        out += (f"lea {idx}, [rbp+{idx}*{arr.t.csize()}]\n")
        out += (f"sub {idx}, {arr.offset+arr.stackarrsize}\n")
        out += (f"{avx_getLoader(loadop)} {avxreg}, [{idx}]\n")
    else:
        out += (f"shl {idx}, {shiftmul(arr.t.csize())}\n")
        out += (f"add {idx}, [rbp-{arr.offset}]\n")
        out += (f"{avx_getLoader(loadop)} {avxreg}, [{idx}]\n")
    return out


avx_sizeSpecifier = ["b", "w", None, "d", None, None, None, "q"]

flt_avx_cmd = {
    "-": "subpd",
    "+": "addpd",
    "*": "mulpd",
    "/": "divpd"
}


def avx_doToReg(op, opcount, size, dest, source, flt):

    if(not flt):
        cmd = avx_getOp(f"{op}{opcount}")

        cmd = cmd.replace("#", avx_sizeSpecifier[size-1])
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
        out += (f"lea {idx}, [rbp+{idx}*{arr.t.csize()}]\n")
        out += (f"sub {idx}, {arr.offset+arr.stackarrsize}\n")
        out += (f"{avx_getLoader(loadop)} [{idx}], {avxreg}\n")
    else:
        out += (f"shl {idx}, {shiftmul(arr.t.csize())}\n")
        out += (f"add {idx}, [rbp-{arr.offset}]\n")
        out += (f"{avx_getLoader(loadop)} [{idx}], {avxreg}\n")
    return out
