class Optimizer:
    def __init__(self, raw):
        self.raw = raw
        self.lines = raw.split("\n")
        for l in self.lines:
            if l == "":
                self.lines.remove(l)
        

        self.regiser_equality = {

            "rax":[],
            "rbx":[],
            "rcx":[],
            "rdx":[],
            "rsi":[],
            "rdi":[],
            "r8":[],
            "r9":[],
            "r10":[],
            "r11":[],
            "r12":[],
            "r13":[],
            "r14":[],
            "r15":[],

            "xmm0":[],
            "xmm1":[],
            "xmm2":[],
            "xmm3":[],
            "xmm4":[],
            "xmm5":[],
            "xmm6":[],
            "xmm7":[],
            "xmm8":[],
            "xmm9":[],
            "xmm10":[],
            "xmm11":[],
            "xmm12":[],
            "xmm13":[],
            "xmm14":[]

        }



    def getTokens(self, line):

        if(":" in line or line.startswith(";")):
            return None
        parts = line.split(" ")

        for p in parts:
            if(p == ""):
                parts.remove(p)

        if(len(parts) < 3 and len(parts)>0):
            return parts
        if(len(parts)==0):
            return None

        parts[1] = parts[1].replace(",","")
        return parts
    
    def l1(self):
        lastwaspush = ""
        for i in range(len(self.lines)):
            
            line = self.getTokens(self.lines[i])
            if line == None or len(line)==0:
                continue
            
            if line[0] == "push":
                lastwaspush = line[0]+line[1]
            elif(line[0] != "pop"):
                lastwaspush = ""
            

            if( line[0] == "pop" and lastwaspush!=""):
                pass

        
        return False

    def optimize(self, level):
        
        if(level == 1):
            while self.l1():
                pass
