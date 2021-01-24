import Classes.DType as Type
from Classes.DType import DType, typematch, literal
from Classes.Variable import Variable
import Classes.Token as T
import time
import Classes.ExpressionComponent as EC
import config
import math
import platform


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

# setup for windows entrypoint
if config.__win__:
    stub = f"%define main WinMain\n{stub}"
# setup for macos entrypoint, and Machos64 format
elif config.__platform__ == "Darwin":
    # default rel will force effective addresses using labels to be relative
    # in order to conform to the Machos64 format for mac os
    stub = f"default rel\n%define main _main\n{stub}"


fileTemplate = stub


# primitive types:

LONG = DType("long", 8, signed=True)
INT = DType("int", 4, signed=True)
SHORT = DType("short", 2, signed=True)
CHAR = DType("char", 1, signed=True)
DOUBLE = DType("double", 8, signed=True)
FLOAT = DType("float", 4, signed=True)
VOID = DType("void", 8, signed=True)
BOOL = DType("bool", 1, signed=True)
LITERAL = DType(literal, 8, signed=True)


INTRINSICS = [INT, LONG, BOOL, DOUBLE, CHAR, BOOL, VOID, SHORT, LITERAL, FLOAT]


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
    "." : 14,

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
