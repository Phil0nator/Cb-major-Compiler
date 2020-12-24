import Classes.DType as Type
from Classes.DType import DType, typematch, __literal
from Classes.Variable import Variable
import Classes.Token as T
import time
import Classes.ExpressionComponent as EC
import config
import math


###################################
#
#   Globals contians misc. utilities
#       used throughout the project.
#
#   globals is still a mess.
###################################


# Load template stub
with open(f"{config.includepath}stub.asm", "rb") as f:
    stub = f.read().decode()


fileTemplate = stub


# primitive types:

LONG = DType("long", 8, signed=True)
INT = DType("int", 4, signed=True)
SHORT = DType("short", 2, signed=True)
CHAR = DType("char", 1, signed=True)
DOUBLE = DType("double", 8, signed=True)
VOID = DType("void", 8, signed=True)
BOOL = DType("bool", 1, signed=True)
LITERAL = DType(__literal, 8, signed=True)

INTRINSICS = [INT, LONG, BOOL, DOUBLE, CHAR, BOOL, VOID, SHORT, LITERAL]


# Operator priority (complicated pemdas)
PRIORITY = {

    "(": 0,
    "[": 0,



    "=": 1,
    "+=": 1,
    "-=": 1,
    "*=": 1,
    "/=": 1,
    "%=": 1,
    "<<=": 1,
    ">>=": 1,
    "&=": 1,
    "^=": 1,
    "|=": 1,
    "<=>": 1,


    "?": 2,
    ":": 3,




    "||": 4,

    "&&": 5,

    "|": 6,

    "^": 6,

    "&": 7,



    "==": 8,
    "!=": 8,


    ">": 9,
    "<": 9,
    ">=": 9,
    "<=": 9,

    ">>": 10,
    "<<": 10,

    "+": 11,
    "-": 11,

    "*": 12,
    "/": 12,
    "%": 12,



    "&": 13,
    "@": 13,
    "~": 13,
    "!": 13,
    "--": 13,
    "++": 13,

    "->": 14,

    "$": 15,


}

# operator masterlist
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
    "$",
    "++",
    "--",
    ":",
    "?",
    "=",
    "+=",
    "-=",
    "*=",
    "/=",
    "%=",
    ">>=",
    "<<=",
    "|=",
    "&=",
    "^=",
    "<=>"


]

COMMUNITIVE = {
    "(": False,
    "]": False,
    "[": False,
    "+": True,
    "-": False,
    "!": False,
    "~": False,
    "&": False,
    "|": True,
    "||": True,
    "&&": True,
    "==": False,
    "!=": False,
    ">": False,
    "<": False,
    ">=": False,
    "<=": False,
    ">>": False,
    "<<": False,
    "^": True,
    "*": True,
    "/": False,
    "%": False,
    "&": False,
    "@": False,
    "->": False,
    ".": False,
    "$": False,
    "++": False,
    "--": False,
    ":": False,
    "?": False,
    "=": False,
    "+=": False,
    "-=": False,
    "*=": False,
    "/=": False,
    "%=": False,
    ">>=": False,
    "<<=": False,
    "|=": False,
    "&=": False,
    "^=": False

}


# integer-only operations
integer_only = [

    ">>",
    "<<"


]


# compiletime:
def isIntrinsic(q):
    for t in INTRINSICS:
        if config.GlobalCompiler.Tequals(t.name, q):
            return True
    return False

# determine compatibility of two types


def TsCompatible(typea, typeb, fni):
    return typematch(typea, typeb, False)

# Single Operand operators


def operatorISO(op):
    return op in ["!", "@", "&", "$", "~", "++", "--"]


# optimizations
def canShiftmul(val):

    x = math.log2(val) if val > 0 else 3.14
    if(not x.is_integer()):
        return False
    return True
