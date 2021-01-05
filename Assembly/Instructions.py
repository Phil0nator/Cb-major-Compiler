import config
from Classes.Token import isdigit
from Assembly.TypeSizes import dwordImmediate, getSizeSpecifier
from Assembly.Registers import REGISTERS, sizeOf, setSize
import Classes.ExpressionComponent as EC
import re
import struct


# these comparison specifiers can be added onto the end
# of conditional instructions like cmovcc, jcc, setcc, etc...
signed_comparisons = {

    "==": "e",
    "!=": "ne",
    "<": "l",
    ">": "g",
    "<=": "le",
    ">=": "ge"

}

unsigned_comparisons = {

    "==": "e",
    "!=": "ne",
    "<": "b",
    ">": "a",
    "<=": "be",
    ">=": "ae"

}

reversed_comparisons = {

    "e": "ne",
    "ne": "e",
    "g": "le",
    "le": "g",
    "l": "ge",
    "ge": "l",
    "z": "nz",
    "nz": "z",
    "b": "ae",
    "ae": "b",
    "a": "be",
    "be": "a"

}


# the faster and smaller inc and dec instructions can be used in place
# of the larger add, or sub instructions respectively.
shorthand_incrementation = {
    "add": "inc",
    "sub": "dec"
}


# these are assignment operators that can be
# performed in one line (for integers specifically)
ONELINE_ASSIGNMENTS = {
    # format: "operator": ["integer opcode", "float opcode"]
    "=": ["mov", "movsd"],
    "+=": ["add", "addsd"],
    "-=": ["sub", "subsd"],
    "|=": ["or", "orpd"],
    "&=": ["and", "andpd"],
    "^=": ["xor", "xorpd"],
}

# get the assignment opcode based on an operator and a destination.
# float assignments that include arithmetic cannot be done on one line.


def onelineAssignment(op, dest):
    assert isinstance(dest, EC.ExpressionComponent)
    if(not dest.type.isflt() or op == "="):
        out = ONELINE_ASSIGNMENTS[op][dest.type.isflt()]
        if dest.type.isflt() and dest.type.csize() == 4:
            return out.replace("sd", "ss")
        return out
    return ""


# get the comparison specifier for op, with sign signed
def getComparater(signed, op):
    if(signed):
        return signed_comparisons[op]
    else:
        return unsigned_comparisons[op]


def floatTo64h(flt):
    if isinstance(flt, float):

        o = bytearray(struct.pack("!d", flt))
        return int("0x" + o.hex(), 16)
    return floatTo64h(float(flt))


def floatTo32h(flt):
    if isinstance(flt, float):
        o = bytearray(struct.pack("!f", flt))
        return int("0x" + o.hex(), 16)
    return floatTo32h(float(flt))


# format an instruction


def Instruction(op, operands=[]):
    out = f"{op} "
    for operand in operands:
        out = f"{out}{operand}, "
    out = f"{out[:-2]}\n"
    return out
