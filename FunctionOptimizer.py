def join(strs):
    out = ""
    for s in strs:
        out+=s+"\n"
    return out

def remove_empty(strs):
    out =[]
    for s in strs:
        if s != '' and s.count(" ") != len(s):
            out.append(s.strip())
    return out


class FNO:
    def __init__(self, fn):
        self.fn = fn
        self.text = self.fn.bodytext
        self.regs = {
            "rax": "0",
            "rbx": "0",
            "rcx": "0",
            "rdx": "0",
            "rsi": "0",
            "rdi": "0",
            "r8": "0",
            "r9": "0",
            "r10": "0",
            "r11": "0",
            "r12": "0",
            "r13": "0",
            "r14": "0",
            "r15": "0",
            "xmm0": "0",
            "xmm1": "0",
            "xmm2": "0",
            "xmm3": "0",
            "xmm4": "0",
            "xmm5": "0",
            "xmm6": "0",
            "xmm7": "0",
            "xmm8": "0",
            "xmm9": "0",
            "xmm10": "0",
            "xmm11": "0",
            "xmm12": "0",
            "xmm13": "0",
            "xmm14": "0",
            "xmm15":"0"
        }
    

    def analyze_movs(self, lines):
        for i in range(len(lines)):
            if(i >= len(lines)):
                break
            line = lines[i]

            if(line.startswith("mov")):
                args = line.split(",")
                end = args[1]
                args[0] = args[0].replace("mov ","")
                dest = args[0]
                source = args[1]
                print(args)
                if dest in self.regs:
                    currentValue = self.regs[dest]
                    if(currentValue == source):
                        lines.pop(i)
                    else:
                        self.regs[dest] = source
                        for reg in self.regs:
                            if self.regs[reg] == dest:
                                self.regs[reg] = "\0"*100
                



    def optimize(self):
        lines = self.text.replace("\t", "").split("\n")
        lines = remove_empty(lines)
        #self.analyze_movs(lines)


        return join(lines)


