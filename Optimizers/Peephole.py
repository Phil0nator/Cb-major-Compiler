import config
from Assembly.Instructions import (dwordImmediate, reversed_comparisons,
                                   shorthand_incrementation,
                                   unsigned_comparisons)
from Assembly.TypeSizes import getSizeSpecifier
from Classes.Constexpr import calculateConstant
from Classes.ExpressionComponent import ExpressionComponent

MOV_INST = ["mov", "movq", "movsd"]
SIMPLE_ARITH_INST = ["add", "sub", "and", "or", "xor", "cmp"]
SIMD_ARITH_INST = ["addsd", "subsd", "divsd", "mulsd", "comisd"]
CMP_INST = ["cmp", "ucomisd", "comisd"]

REPLICABLE_INST = {
    "add": "+",
    "sub": "-",
    "imul": "*",
    "shl": "<<",
    "shr": ">>",
    "sal": "<<",
    "sar": ">>",
}


def regeq(a, b):
    return setSize(a, 8) == setSize(
        b, 8) if a in REGISTERS and b in REGISTERS else False


def getMovop(a, b):
    if ("xmm" in a and ("xmm" in b or "[" in b)):
        return "movsd"
    elif ("xmm" in a) ^ ("xmm" in b):
        return "movq"
    return "mov"


def line_filter(line):
    if(line.op == '' or line.dest is None):
        return False
    return True


def splitfilter(line):
    return line != ''


class Line:
    def __init__(self, op, dest, source, flags, idx):
        self.op = op
        self.dest = dest
        self.source = source
        self.flags = flags
        self.idx = idx

    def constSource(self):
        if(self.source.isdigit()):
            return dwordImmediate(int(self.source))
        return False

    def validSourceCopy(self):
        if(self.source.isdigit()):
            return dwordImmediate(int(self.source))
        return True

    def psize_dest(self):
        if("qword[" in self.dest):
            return "qword"
        if("dword[" in self.dest):
            return "dword"
        if("word[" in self.dest):
            return "word"
        if("byte[" in self.dest):
            return "byte"
        return ""

    def psize_source(self):
        if("qword[" in self.source):
            return "qword"
        if("dword[" in self.source):
            return "dword"
        if("word[" in self.source):
            return "word"
        if("byte[" in self.source):
            return "byte"
        return ""

    def size_dest(self):
        return sizeOf(self.dest)

    def threePart(self):
        return self.dest is not None and self.source is not None

    def noRelation(self, other):
        return ((self.dest is not None) and self.dest not in str(other)
                ) and self.source is not None and self.source not in str(other)

    def hasAddr(self):
        return '[' in self.dest + str(self.source)

    def contains(self, c):
        return c in (self.dest if self.dest is not None else "") or c in (
            self.source if self.source is not None else "")

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
    def opl3_parser(self, lineget=[]):

        optims = 0  # optimizations made
        splitted = self.instructions.split("\n")
        lines = []
        for i in range(len(splitted)):
            lines.append(self.parseLine(splitted[i], i))

        lines = list(filter(line_filter, lines))
        linecount = len(lines)

        if(linecount > 1):

            prev = lines[0]
            for line in lines[1:]:
                nxtidx = lines.index(line) + 1
                nextline = lines[nxtidx] if nxtidx < linecount else None

                if(line.threePart() and prev.threePart() and nextline is not None):

                    # cmp instructions that compare a register with zero, can be replaced with the faster and smaller
                    # test instruction.
                    if(line.op in CMP_INST and line.constSource() and not int(line.source) and not line.hasAddr()
                            and nextline.op in ["jz", "jnz", "je", "jne", "setz", "setnz", "sete", "setne"]):

                        splitted[line.idx] = f"test {line.dest}, {line.dest}\n"
                        splitted[nextline.idx] = f"{nextline.op[:-1]}z {nextline.dest}\n"
                        optims += 1

                    # in instances where the compiler creates code to evaluate an or, and, or xor operation for use
                    # in a conditional operation, the subsequent test
                    # instruction that will be emitted will be redundant.
                    if(line.op == "test" and prev.op in ["or", "and", "xor"] and line.dest == line.source and line.dest == prev.dest):
                        # ommit line
                        splitted[line.idx] = ""

                    # Simplify the basic float operation structure of the compiler:
                    #   mov xmm0, {1}
                    #   mov xmm1, {2}
                    #   opsd xmm1, xmm0
                    #   ...
                    #
                    #   Into the following structure:
                    #
                    #   mov xmm1, {2}
                    #   opsd xmm1, {1}
                    #   TODO:
                    #   Fix Errors (Use Arcsin to test)
                    # if (nextline.op in SIMD_ARITH_INST and prev.op ==
                    #        "movsd" and prev.dest == nextline.source):
                    #    splitted[prev.idx] = ""
                    #    splitted[nextline.idx] = f"{nextline.op} {nextline.dest}, {prev.source}\n"

                    # Spread out adjacent lea instructions in common pattern formed in index operators in order
                    # to keep port 1 open for lea instructions with three address components.
                    # Often, these paterns can be broken up by moving an adjacent and unrelated instruction in between
                    # the two lea instructions.
                    # This new pattern will also often be optimized again by the level 2 optimizer to reduce the three instruction
                    # set into a single lea followed by a mov.
                    elif (prev.op == "lea" and line.op == "lea" and line.dest == prev.dest and nextline.source is not None):
                        if(nextline.dest != prev.dest and nextline.source not in (prev.source + line.source)):
                            tmp = splitted[line.idx]
                            splitted[line.idx] = splitted[nextline.idx]
                            splitted[nextline.idx] = tmp
                            optims += 1

                    elif (line.op == "cvtsi2sd") and (line.source == prev.dest) and (prev.constSource()):
                        if int(prev.source) == 0:
                            splitted[prev.idx] = ""
                            splitted[line.idx] = f"xorpd {line.dest}, {line.dest}\n"

                    elif (prev.op == "mov") and (prev.constSource()) and \
                        (line.op in REPLICABLE_INST) and (line.dest == prev.dest) \
                            and (line.constSource()) and not (prev.hasAddr()):

                        a = int(prev.source)
                        b = int(line.source)
                        op = REPLICABLE_INST[line.op]
                        value = calculateConstant(
                            ExpressionComponent(a, None, constint=True),
                            ExpressionComponent(b, None, constint=True),
                            op
                        )

                        splitted[prev.idx] = ""
                        splitted[line.idx] = f"mov {line.dest}, {value.accessor}\n"
                        optims += 1

                # additions or subtractions by one can be substituted for their
                # faster counterparts in 'inc' or 'dec' respectively
                if(line.op == "add" or line.op == "sub") and line.constSource() and int(line.source) == 1 and not line.hasAddr():
                    splitted[line.idx] = f"{shorthand_incrementation[line.op]} {line.dest}\n"

                # The compiler naturally will produce structures like the following in the generation of control
                # structures. Example:
                #
                #   cmp a, b
                #   sete c
                #   test c, c
                #   jz .L0x0
                #
                # This type of structure is optimized in this section to the following:
                #
                #   cmp a, b
                #   je .L0x0
                #
                #
                if(prev.op.startswith("set") and line.op == "test" and
                        (nextline.op.startswith("j") or nextline.op.startswith("set"))):

                    # condition of the previous op
                    conda = prev.op[3:]
                    # conditions of the next op
                    condb = nextline.op[1:] if nextline.op[0] == "j" else nextline.op[3:]

                    # new condition
                    newcond = conda if condb == "nz" else reversed_comparisons[conda]

                    splitted[prev.idx] = ""
                    splitted[line.idx] = ""
                    splitted[nextline.idx] = f"{nextline.op.replace(condb, newcond)} {nextline.dest}\n"
                    optims += 1

                prev = line

        self.instructions = '\n'.join(splitted)

        return optims

    def opl3(self):
        self.opl2()

        while self.opl3_parser() > 0:
            pass

        self.opl2()

    def opl2(self):
        while self.opl2_parser() > 0:
            pass

    def opl2_parser(self, lineget=[]):

        optims = 0
        splitted = self.instructions.split("\n")
        lines = []
        for i in range(len(splitted)):
            if splitted[i] != '':
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
                elif (line.op in MOV_INST and prev.op == line.op):
                    # if same source  ->  destination, but both not addresses
                    if(line.source == prev.dest and not (line.hasAddr() or prev.hasAddr())):

                        splitted[line.idx] = f"{getMovop(line.dest, prev.source)} {line.dest}, {prev.source}"

                        # TODO:
                        # check for errors with this deletion:
                        splitted[prev.idx] = ""
                        optims += 1

                    # elif (line.source == prev.dest and line.dest == prev.source):
                    #    splitted[line.idx] = ""
                    #    optims += 1

                # replace 'mov %r, 0' with the faster 'xor %r, %r'
                elif(line.op == "mov" and (line.constSource() and int(line.source) == 0) and not line.hasAddr()):
                    splitted[line.idx] = f"xor {line.dest}, {line.dest}"
                    optims += 1

                # ensure that there are no redundant movs like:
                # e.g: mov rax, rax
                if (line.op in MOV_INST and line.dest == line.source):
                    splitted[line.idx] = ""
                    optims += 1

                # replace the common structure:
                #   lea reg, [addr]
                #   mov reg, [reg]
                #
                # by replacing it with the faster:
                #   mov reg, [addr]
                #
                elif(prev.op == "lea" and line.op in ["mov", "movsd"]):
                    if(f"[{prev.dest}]" in line.source and "[" not in line.dest) \
                            and ("[" in line.source):
                        splitted[prev.idx] = ""
                        splitted[line.idx] = f"{line.op} {line.dest}, {prev.source}\n"
                        optims += 1
                    elif (f"[{prev.dest}]" in line.dest and "[" not in line.source) \
                            and ("[" in line.dest):
                        sizesp = line.psize_dest()
                        splitted[prev.idx] = ""
                        splitted[line.idx] = f"{line.op} {sizesp}{prev.source}, {line.source}\n"

                # remove repetitive / impossible jmp instructions
                elif (prev.op == "jmp" and prev.op == line.op and prev.idx == line.idx - 1):
                    splitted[line.idx] = ""
                elif (line.op == "jmp" and splitted[line.idx + 1] == line.dest + ":"):
                    splitted[line.idx] = ""

                # incorperate memory operands for suitable instructions
                # TODO: (Experiment more to make sure this works)
                elif (prev.op == "mov" and line.op in SIMPLE_ARITH_INST and not (line.hasAddr() and prev.hasAddr()) and prev.validSourceCopy()):

                    # Condition 1 satisfies a replaceable line dest, Condition 2
                    # satisfies a replaceable line source
                    if(line.op == "cmp" and prev.dest == line.dest and not prev.constSource()):
                        if prev.psize_source() == "" and "[" in prev.source:
                            prev.source = f"{getSizeSpecifier(prev.dest)}{prev.source}"

                        splitted[prev.idx] = ""
                        splitted[line.idx] = f"{line.op} {prev.source}, {line.source}\n"
                        optims += 1

                    elif (prev.dest == line.source):
                        if prev.psize_source() == "" and "[" in prev.source:
                            prev.source = f"{getSizeSpecifier(prev.dest)}{prev.source}"

                        splitted[line.idx] = f"{line.op} {line.dest}, {prev.source}\n"
                        splitted[prev.idx] = ""
                        optims += 1
                #TODO: FIX
                # many add instructions can be optimized to use the lea instruction in order to diversify
                # port usage, and increase overall microarchitecture usage.
                # elif (prev.op == "add" and line.op == "mov" and line.source == prev.dest and not (prev.hasAddr() or line.hasAddr())):
                #    splitted[prev.idx] = ""
                #    splitted[line.idx] = f"lea {line.dest}, [{prev.dest}+{prev.source}]\n"
                #    optims += 1

                # a pair of additions, subtractions, or a combination of the two can be simplified into one lea
                # instruction in order to reduce file size, avoid stalls, and
                # increase microarchitecture usage
                elif (prev.op == "add" or (prev.op == "sub" and prev.constSource())) and (line.op == "add" or (line.op == "sub" and line.constSource())):
                    if(prev.dest == line.dest and not (prev.op == "sub" and prev.op == line.op) and not (prev.hasAddr() or line.hasAddr())):

                        # if the previous was an add, then the terms can be
                        # compiled in order:
                        if(prev.op == "add"):
                            effective_address = f"[{prev.dest}+{prev.source}{'+' if line.op == 'add' else '-'}{line.source}]"
                        # if the previous was a sub, then the terms must be reversed
                        # (The new first term or old last term must be + because you cannot use two subtractions)
                        else:
                            effective_address = f"[{line.dest}+{line.source}-{prev.source}]\n"

                        splitted[prev.idx] = ""
                        splitted[line.idx] = f"lea {line.dest}, {effective_address}\n"
                        optims += 1

                elif not config.__Osize__ and line.op in ["inc", "dec"] and line.hasAddr():
                    op = "add" if line.op == "inc" else "sub"
                    splitted[line.idx] = f"{op} {line.dest}, 1\n"
                    optims += 1

                prev = line
        else:
            for line in lines:
                # replace 'mov %r, 0' with the faster 'xor %r, %r'
                if(line.op == "mov" and (line.constSource() and int(line.source) == 0) and not line.hasAddr()):
                    splitted[line.idx] = f"xor {line.dest}, {line.dest}"
                    optims += 1

                # ensure that there are no redundant movs like:
                # e.g: mov rax, rax
                elif (line.op == "mov" and line.dest == line.source):
                    splitted[line.idx] = ""

        self.instructions = '\n'.join(splitted)

        return optims

    def get(self):
        if(self.optlvl == 1):
            return self.instructions
        self.opl2() if(self.optlvl == 2) else self.opl3()
        return self.instructions
