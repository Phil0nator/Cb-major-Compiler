import Classes.Token as T
import Classes.Variable as V
import Assembly.Registers as R

# determine if a value (can be multiple types) is a float
#   for tokens, return if value is sse register
#   for strings, return if they are a sse register
#   for variables, return their type's float function
#   else: false


def isfloat(x):
    if (isinstance(x, T.Token)):
        if(x.tok == T.T_REGISTER):
            return "xmm" in x.value
        else:
            if(isinstance(x.value, int)):
                return False
            return False
    if(isinstance(x, str)):
        return "xmm" in x
    if(isinstance(x, V.Variable)):

        return x.isflt() and not x.isptr
    return False

# return the pointer size specifier for a variable v
# ex: psizeof(int a) = dword because int is 32 bits


def psizeof(v):
    if v.isptr:
        return "qword"
    if v.t.size(0) == 1:
        return "byte"
    if v.t.size(0) == 8:
        return "qword"
    elif v.t.size(0) == 4:
        return "dword"
    elif v.t.size(0) == 2:
        return "word"
    return "qword"

# return the pointer size specifier for a type t at ptrdepth lvl


def psizeoft(t, lvl=0):
    if t.size(lvl) == 1:
        return "byte"
    if t.size(lvl) == 8:
        return "qword"
    elif t.size(lvl) == 4:
        return "dword"
    elif t.size(lvl) == 2:
        return "word"
    return "qword"


# bss / data reservers
constantReservers = {"1": "DB", "2": "DW", "4": "DD", "8": "DQ"}
heapReservers = ["RESB", "RESW", "RESD", "RESQ"]


def getConstantReserver(t):
    return constantReservers[str(t.csize())]


def getHeapReserver(t):
    if t.isptr:
        return "RESQ 1"
    if(t.t.csize() <= 8):
        return "RESQ 1"
    return "RESB %s" % t.t.csize()

# depricated


def getSizeSpecifier(t):
    return "QWORD"

# use a mask to truncate reg to size


def maskset(reg, size):
    if(size == 8):
        return ""
    if(size == 4):
        return f"and {reg}, 0x7fffffff\n"
    if(size == 2):
        return f"and {reg}, 0xffff\n"
    if(size == 1):
        return f"and {reg}, 0xff\n"
    return ""


def dwordImmediate(number):
    return number < 4294967295 if isinstance(number, int) else 0