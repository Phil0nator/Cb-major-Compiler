import config
from Classes.Token import isdigit
from Assembly.Registers import REGISTERS


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
        return opl2()

    def opl2(self):
        lines = self.instructions.replace(
            "\n\n", "\n").replace(
            "\t", "").split("\n")
        outlines = ""
        prev = self.parseLine(lines[0])
        pi = 0
        i = 1
        for l in lines[1:]:
            l = l.strip()

            if(len(l) < 5 or l.startswith(";")):
                continue
            op, dest, source, flags = self.parseLine(l)

            if(prev[0] == "push" and op == "pop"):

                lines[pi] = Instruction(
                    "mov", [
                        dest, prev[1]]) if(
                    dest != prev[1]) else None
                lines[i] = None

            if(prev[0] in ["mov", "movq"] and op in ["mov", "movq"]):
                if(prev[1] == source and "[" not in prev[2] and not isdigit(ord(prev[2][0]))):
                    lines[i] = None
                    lines[pi] = Instruction(
                        op, [dest, prev[2]]) if dest != prev[2] else None

            if(op == "mov" and dest in REGISTERS and source == "0"):
                lines[i] = Instruction("xor", [dest, dest])

            prev = (op, dest, source, flags)
            pi += 1
            i += 1

        lines = list(filter(None, lines))
        self.instructions = str.join("\n", lines)

    def get(self):

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
