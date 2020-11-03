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
    #io64 = f.read().decode()
    io64 = ""

fileTemplate = "%s\n\n%s" % (io64, stub)


# primitive types:

LONG = DType("long", 8, signed=True)
INT = DType("int", 4, signed=True)
SHORT = DType("short", 2, signed=True)
CHAR = DType("char", 1, signed=True)
DOUBLE = DType("double", 8, signed=True)
VOID = DType("void", 8, signed=True)
BOOL = DType("bool", 1, signed=True)


INTRINSICS = [INT, LONG, BOOL, DOUBLE, CHAR, BOOL, VOID, SHORT]


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
    "--": 11,
    "++": 11,

    "->": 12,

    "$": 13,


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
    "--"


]
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
    return typematch(typea, typeb)

# determine if a and b are compatible for casting


def typematch(a, b):
    if(isinstance(a, DType) and isinstance(b, DType)):

        # anything can be cast to or from void
        if(config.GlobalCompiler.Tequals(a.name, "void") or config.GlobalCompiler.Tequals(b.name, "void")):
            return True
        if(a.__eq__(VOID.copy()) and b.ptrdepth > 0):
            return True

        # two equal types are compatible
        if(a.__eq__(b)):
            return True

        # two equal types with different signs are compatible
        if(DType(a.name, a.size, a.members, a.ptrdepth, False, a.destructor, a.constructor).__eq__(DType(b.name, b.size, b.members, b.ptrdepth, False, b.destructor, b.constructor))):
            return True

        # two integer values are compatible
        if(not a.isflt() and not b.isflt()):
            return True

        #
        elif(DType(a.name, a.size, None, a.ptrdepth, False).__eq__(DType(b.name, b.size, None, b.ptrdepth, False))):
            return True

        # two variables with different pointer depths are not compatible (at
        # this point no void types)
        if(a.ptrdepth != b.ptrdepth):
            return False
        # two floats are compatible
        if(a.isflt() and b.isflt()):
            return True

        # if the type precedence checks out, they are compatible, else not
        if(isIntrinsic(a.name) and isIntrinsic(b.name)):
            if(Type.type_precedence[a.name] > Type.type_precedence[b.name]):
                return True
            return False

    return False

# Single Operand operators


def operatorISO(op):
    return op in ["!", "@", "&", "$", "~", "++", "--"]


# optimizations
def canShiftmul(val):

    x = math.log2(val) if val > 0 else 3.14
    if(not x.is_integer()):
        return False
    return True
