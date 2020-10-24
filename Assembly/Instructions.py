import config
from Classes.Token import isdigit
from Assembly.Registers import REGISTERS

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

    def parseLine(self, l):
        sp = l.split(" ")
        opcount = len(sp)
        op = sp[0]
        dest = sp[1].replace(",", "").strip() if opcount > 1 else None
        source = sp[2].strip() if opcount > 2 else None
        flags = sp[3].strip() if opcount > 3 else None

        return op, dest, source, flags

    def flush(self):
        self.instructions = ""

    def opl3(self):
        while self.opl2() > 0:
            pass

    def opl2(self):

        optims = 0

        lines = self.instructions.replace(
            "\n\n", "\n").replace(
            "\t", "").split("\n")
        prev = self.parseLine(lines[0])
        pi = 0
        i = 1
        for l in lines[1:]:
            l = l.strip()

            if(l.startswith(";") or lines[pi] is None):
                i += 1
                continue

            op, dest, source, flags = self.parseLine(l)

            # redundant push and pop instructions
            if(prev[0] == "push" and op == "pop"):

                lines[pi] = Instruction(
                    "mov", [
                        dest, prev[1]]) if(
                    dest != prev[1]) else None
                lines[i] = None

                optims += 1

            # excessive mov statements
            if (prev[0] in ["mov", "movq", "movsd"] and op == prev[0]):
                if(prev[1] == source and not ("[" in prev[2]) and ("[" in dest) and not isdigit(ord(prev[2][0]))):

                    lines[i] = None
                    lines[pi] = Instruction(
                        op, [dest, prev[2]]) if dest != prev[2] else None

                    optims += 1

            # zeroing-by-mov is less efficient than xor
            if(op == "mov" and dest in REGISTERS and source == "0"):
                lines[i] = Instruction("xor", [dest, dest])
                optims += 1

            prev = (op, dest, source, flags)
            i += 1
            pi = i - 1

        lines = list(filter(None, lines))
        self.instructions = str.join("\n", lines)

        return optims

    def get(self):
        if(self.optlvl == 1):
            return self.instructions
        self.opl2() if(self.optlvl == 2) else self.opl3()
        return self.instructions


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


def getComparater(signed, op):
    if(signed):
        return signed_comparisons[op]
    else:
        return unsigned_comparisons[op]


def Instruction(op, operands=[]):
    out = f"{op} "
    for operand in operands:
        out = f"{out}{operand}, "
    out = f"{out[:-2]}\n"
    return out
