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


fileTemplate = stub


# primitive types:

LONG = DType("long", 8, signed=True)
INT = DType("int", 4, signed=True)
SHORT = DType("short", 2, signed=True)
CHAR = DType("char", 1, signed=True)
DOUBLE = DType("double", 8, signed=True)
VOID = DType("void", 8, signed=True)
BOOL = DType("bool", 1, signed=True)
LITERAL = DType("&LITERAL&", 8, signed=True)

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

# determine if a and b are compatible for casting


def typematch(a, b, implicit):
    if(isinstance(a, DType) and isinstance(b, DType)):

        if(a.name == LITERAL.name or b.name == LITERAL.name):
            return True
        # anything can be cast to or from void
        if(config.GlobalCompiler.Tequals(a.name, "void") or config.GlobalCompiler.Tequals(b.name, "void")):
            return True

        # two equal types are compatible
        if(a.__eq__(b)):
            return True

        # two equal types with different signs are compatible
        if(DType(a.name, a.size, a.members, a.ptrdepth, False, a.destructor, a.constructor).__eq__(DType(b.name, b.size, b.members, b.ptrdepth, False, b.destructor, b.constructor))):
            return True

        # two integer values are compatible in implicit situations
        if(not a.isflt() and not b.isflt() and implicit):
            return True
        # two floats are compatible
        if(a.isflt() and b.isflt()):
            return True
        #
        #elif(DType(a.name, a.size, None, a.ptrdepth, False).__eq__(DType(b.name, b.size, None, b.ptrdepth, False))):
        #    return True

        # two variables with different pointer depths are not compatible (at
        # this point no void types)
        if(a.ptrdepth != b.ptrdepth):
            return False
        

        # if the type precedence checks out, they are compatible, else not
        if(isIntrinsic(a.name) and isIntrinsic(b.name) and implicit):
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
