from Assembly.Registers import *
import Classes.ExpressionComponent as EC
from Classes.DType import DType
import config


aligned_load32B = "vmovdqa"
unaligned_load32B = "vmovdqu"

vop_base = {
    "+": "add",
    "-": "sub",
    "*": "mul",
    "/": "div",
    "||": "or",
    "&&": "and",
    "^": "xor"
}


vint_sizespec = {
    1: "b",
    2: "w",
    4: "d",
    8: "q"
}


def getOperation(vsize: int, flt: bool, isize: int, op: str) -> str:
    base = vop_base[op]
    if vsize == 32 and flt:
        base = f"v{base}"
    if flt and isize == 4:
        base = f"{base}ps"
    elif flt:
        base = f"{base}pd"
    else:
        base = f"p{base}{vint_sizespec[isize]}"
    return base


def vdo_assign32(dest: EC.ExpressionComponent,
                 source: EC.ExpressionComponent, dtype: DType, op: str) -> str:
    opcode = getOperation(32, dtype.isflt(), dtype.csize(), op)
    instr = """"""
