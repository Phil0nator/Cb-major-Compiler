from constants import *
from errors import *
from Token import *
from Declaration import *



class Struct:
    def __init__(self, name, body):
        self.name = name
        self.tokens = body

        self.current_token = self.tokens[0]
        self.ct_idx = 0
        self.allocator = "  "
        self.declarations = []
    
    def getOffsetByMemberName(self, name):

        for d in self.declarations:
            if d.name == name:
                return d.offset
    
    
    def compile(self):
        allocationspace = 0
        prevwaskey = False
        prevflt = False
        for t in self.tokens:
            if(prevwaskey):
                self.declarations.append(Declaration(t.value,allocationspace,prevflt))
                prevwaskey=False
                prevflt=False
            if (t.tok == T_KEYWORD):
                if(t.value == "var" or t.value == "float"):
                    allocationspace+=8
                    prevwaskey=True
                    if(t.value == "float"):
                        prevflt=True
                    continue
            
            
        #call malloc to create enough space in memory
        self.allocator = """
%s
%s
ALIGN_STACK
   xor r11, r11
   xor r12, r12
   mov rdi, %s
   call malloc
   xor r11, r11
   xor r12, r12
   test rax, rax ; check for error

   ;mov byte[rax+%s], 0x0

   mov r8, rax
   UNALIGN_STACK
leave
ret

        """%(self.name+":",allocate(8),hex(allocationspace),hex(allocationspace))
        return self.allocator    
    
    
    
    
    
    
    
    
    
    
    
    
    def advance(self):
        self.ct_idx += 1
        if self.ct_idx < len(self.tokens):
            self.current_token = self.tokens[self.ct_idx]
        else:
            self.current_token = Token(T_EOF)
    
