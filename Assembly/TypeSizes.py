import Classes.Token as T
import Classes.Variable as V
import Assembly.Registers as R


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


constantReservers = ["DB", "DW", "DD", "DQ"]
heapReservers = ["RESB", "RESW", "RESD", "RESQ"]


def getConstantReserver(t):
    return constantReservers[t.size(0)-5]


def getHeapReserver(t):
    if t.isptr:
        return "RESQ 1"
    if(t.t.csize() <= 8):
        return "RESQ 1"
    return "RESB %s" % t.t.csize()


def getSizeSpecifier(t):
    return "QWORD"


def maskset(reg, size):
    if(size == 8):
        return ""
    if(size == 4):
        return f"and {reg}, 0xffffffff\n"
    if(size == 2):
        return f"and {reg}, 0xffff\n"
    if(size == 1):
        return f"and {reg}, 0xff\n"
