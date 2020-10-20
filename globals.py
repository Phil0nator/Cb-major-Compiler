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
#   Globals contians misc. utilities
#       used throughout the project.
#
#   globals is still a mess.
###################################


# Load template stub
with open(f"{config.includepath}stub.asm", "rb") as f:
    stub = f.read().decode()

with open(f"{config.includepath}io64.inc", "rb") as f:
    io64 = f.read().decode()

fileTemplate = "%s\n\n%s" % (io64, stub)


# primitive types:

INT = DType("int", 8, signed=True)
SHORT = DType("short", 4, signed=True)
SMALL = DType("small", 2, signed=True)
CHAR = DType("char", 1, signed=True)
DOUBLE = DType("double", 8, signed=True)
VOID = DType("void", 8, signed=True)
BOOL = DType("bool", 1, signed=True)


INTRINSICS = [INT, SHORT, BOOL, DOUBLE, CHAR, BOOL, VOID, SMALL]


# Operator priority (complicated pemdas)
PRIORITY = {

    "(": 0,
    "[": 0,








    "||": 1,

    "&&": 2,

    "|": 3,

    "^": 4,

    "&": 5,



    "==": 6,
    "!=": 6,


    ">": 7,
    "<": 7,
    ">=": 7,
    "<=": 7,

    ">>": 8,
    "<<": 8,

    "+": 9,
    "-": 9,

    "*": 10,
    "/": 10,
    "%": 10,



    "&": 11,
    "@": 11,
    "~": 11,
    "!": 11,
    "->": 11,
    "--": 11,
    "++": 11,


    "$": 12,


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
    "$",
    "++",
    "--"


]

integer_only = [

    ">>",
    "<<"


]


# macros


# get size specifier for address


# section reserver sizes


# compiletime:
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

        if(config.GlobalCompiler.Tequals(a.name, "void") or config.GlobalCompiler.Tequals(b.name, "void")):
            return True
        if(a.__eq__(INT.copy()) and b.ptrdepth > 0):
            return True
        if(a.__eq__(b)):
            return True
        if(not a.isflt() and not b.isflt()):
            return True
        elif(DType(a.name, a.size, None, a.ptrdepth, False).__eq__(DType(b.name, b.size, None, b.ptrdepth, False))):
            return True
        if(a.ptrdepth != b.ptrdepth):
            return False
        if(a.isflt() and b.isflt()):
            return True

        if(isIntrinsic(a.name) and isIntrinsic(b.name)):
            if(Type.type_precedence[a.name] > Type.type_precedence[b.name]):
                return True
            return False

    return False


def operatorISO(op):
    return op in ["!", "@", "&", "$", "~", "++", "--"]


# optimizations
def canShiftmul(val):

    x = math.log2(val)
    if(not x.is_integer()):
        return False
    return True
