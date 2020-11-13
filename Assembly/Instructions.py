import config
from Classes.Token import isdigit
from Assembly.Registers import REGISTERS
import Classes.ExpressionComponent as EC
import re
import struct

MOV_INST = ["mov", "movq", "movsd"]


def getMovop(a, b):
    if ("xmm" in a and "xmm" in b):
        return "movsd"
    elif ("xmm" in a) ^ ("xmm" in b):
        return "movq"
    return "mov"


def line_filter(line):
    if(line.op == '' or line.dest is None):
        return False
    return True


class Line:
    def __init__(self, op, dest, source, flags, idx):
        self.op = op
        self.dest = dest
        self.source = source
        self.flags = flags
        self.idx = idx

    def hasAddr(self):
        return '[' in self.dest + \
            (self.source if self.source is not None else '')

    def contains(self, c):
        return c in self.__repr__()

    def __repr__(self):
        return f"{self.op} {self.dest}, {self.source if self.source is not None else ''} {self.flags if self.flags is not None else ''} : {self.idx}"

################################################
#
#   The Peephole is used to optimize a small segment of
#       already-compiled assembly code based on the
#       optimization level set by -O2, or -O3.
#
#       -O2 will simply attempt to eliminate redundant
#       push, pop, mov, and zeroing operations
#
#       -O3 will attempt to predetermine values that will
#       always end up being the same, and will aggressively
#       alter the given code for a faster runtime.
#
#
#
#
#################################################


class Peephole:
    def __init__(self):
        self.instructions = ''
        self.optlvl = config.__oplevel__

    def addline(self, instruction):
        self.instructions = f"{self.instructions}{instruction}"

    def parseLine(self, l, i):

        spo = l.strip().split(",")
        sp = spo[0].split(
            " ") + spo[1].strip().split(" ") if len(spo) > 1 else spo[0].split(" ")
        opcount = len(sp)
        op = sp[0]
        dest = sp[1].replace(",", "").strip() if opcount > 1 else None
        source = sp[2].strip() if opcount > 2 else None
        flags = sp[3].strip() if opcount > 3 else None

        return Line(op, dest, source, flags, i)

    def flush(self):
        self.instructions = ""

    ####################################
    #   TODO:
    #       - optimize for branch prediction
    #       - optimize for U / V pipe alignment
    #           (reorder instructions requiring same address)
    #       - optimize for instruction pairing
    #           (reorder / adjust)
    #       - optimize LEA instruction for AGI stalls
    #           (effective address set in prev. instruction)
    #           (pg 43)
    #   (https://www.agner.org/optimize/microarchitecture.pdf)
    #
    ####################################

    def opl3(self):
        self.opl2()

    def opl2(self):
        while self.opl2_parser() > 0:
            pass

    def opl2_parser(self, lineget=[]):

        optims = 0
        splitted = self.instructions.split("\n")
        lines = []
        for i in range(len(splitted)):
            lines.append(self.parseLine(splitted[i], i))

        lines = list(filter(line_filter, lines))

        if(len(lines) > 1):

            prev = lines[0]
            for line in lines[1:]:

                # redundant push/pop operations
                if (line.op == "pop" and prev.op == "push"):
                    if(line.dest != prev.dest):
                        splitted[line.idx] = f"mov {line.dest}, {prev.dest}"
                    else:
                        splitted[line.idx] = ""
                    splitted[prev.idx] = ""
                    optims += 1

                # redundant mov's
                if (line.op in MOV_INST and prev.op == line.op):
                    # if same source  ->  destination, but both not addresses
                    if(line.source == prev.dest and not prev.hasAddr()):
                        splitted[line.idx] = f"{getMovop(line.dest, prev.source)} {line.dest}, {prev.source}"

                        #optims +=1

                # replace 'mov %r, 0' with the faster 'xor %r, %r'
                if(line.op == "mov" and line.source == "0" and not line.hasAddr()):
                    splitted[line.idx] = f"xor {line.dest}, {line.dest}"
                    optims += 1

                prev = line

        self.instructions = '\n'.join(splitted)

        return optims

    def get(self):
        if(self.optlvl == 1):
            return self.instructions
        self.opl2() if(self.optlvl == 2) else self.opl3()
        return self.instructions


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
        return ONELINE_ASSIGNMENTS[op][dest.type.isflt()]
    return ""


# get the comparison specifier for op, with sign signed
def getComparater(signed, op):
    if(signed):
        return signed_comparisons[op]
    else:
        return unsigned_comparisons[op]


def floatTo64h(flt):
    if isinstance(flt, float):

        o =  bytearray(struct.pack("!d", flt))
        return "0x" + o.hex()
    return floatTo64h(float(flt))

# format an instruction


def Instruction(op, operands=[]):
    out = f"{op} "
    for operand in operands:
        out = f"{out}{operand}, "
    out = f"{out[:-2]}\n"
    return out
