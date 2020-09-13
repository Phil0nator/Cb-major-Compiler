#Tokens:
import platform
T_NUMBERS = "0123456789"
T_INT = "INT"
T_FLOAT = "FLOAT"
T_BOOLEAN = "BOOL"

T_PLUS = "+"
T_MINUS = "-"
T_MUL = "*"
T_DIV = "/"
T_NOT = "!"
T_AMPERSAND = "&"
T_PIPE = "|"
T_LT = "<"
T_GT = ">"
T_OPENP = "("#(
T_CLOSEP = ")"#)
T_OSCOPE = "{" #{
T_CLSCOPE = "}" #}
T_EXPRESSION = "EXPRESSION"
T_OPENLINDEX = "["
T_CLSLINDEX = "]"
T_ID = "ID"
T_ALLOC = "ALLOCATOR"
T_CONSTVAR  ="CONST"
T_VAR = "VAR"
T_COMMA = ","
T_STRING = "STR"
T_KEYWORD = "KEYWORD"
T_EOF = "EOF"
T_COLON = ":"
T_EOL = "EOL"
T_EQUALS = "="
T_XOR = "^"
T_PROPOF = ":"
T_PTRAT = "@"

true = "[__BOOL_STANDARD_TRUE]"
false = "[__BOOL_STANDARD_FALSE]"

#MULTICHAR

TM_AND = "&&"
TM_OR = "||"
TM_LE = "<="
TM_GE = ">="
TM_LBITSHIFT = "<<"
TM_RBITSHIFT = ">>"
TM_PTRVAL = "->"
TM_PLUSEQ = "+="
TM_PP = "++"




TM_ALL = "%&|><=-!+/"
CMP_TOKS = ["==","!=",">=", "<=", "<", ">"]
CMP_TABLE = {
    "==" : "je",
    "!=" : "jne",
    ">=" : "jge",
    "<=" : "jle",
    "<"  : "jl",
    ">"  : "jg"
}

#ID
ID_CHARS = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_."



DATATYPES = {"int":8, "float":4, "double":8, "char":1," int*":8, "float*":8,"double*":8,"char*":8,"void":0,"void*":8,"bool":1}
T_DTPS = ["int", "float", "double", "char"," int*", "float*", "double*", "char*", "void", "void*","bool"]


def typeExists(t):
    return t in T_DTPS

#ESCAPE


ESCAPE_CHARS = {

    "n":"\\n",
    "t":"\\t",
    "\"":" \\\" ",
    "\\":"\\",
    "r":"\\r"



}

#Keywords

KEYWORDS = ["if", "struct", "class", "while", "for", "var", "final", "function", "true", "false", \
            "return", "__asm", "__c", "#include", "#define", "#ifdef", "#ifndef", "#else", "#endif", \
            "constructor", "cmp", "fast", "break", "continue", "Function", "else", "elif", "label", "goto"]



top_stub = """
&&IO64&&

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;
;PROGRAM START
;
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


section .data
&&DATA&&


section .bss
&&BSS&&


section .text
global CMAIN


&&FDEF&&





CMAIN:
mov rbp, rsp
xor rax, rax


mov r9, rsi     ;commandline args
mov r10, rdi
&&TEXT&&
NEWLINE
ret


"""


C_ASSEMBLE_LINK_RUN = "nasm -felf64 out.asm && gcc \"include/macro.c\" -Wimplicit-function-declaration out.o -no-pie  && ./a.out"
C_ASSEMBLE = "nasm -felf64 out.asm"

C_LINK = "gcc \"include/macro.c\" -Wimplicit-function-declaration &G out.o -no-pie -lm -o **OUT**"


def updateCommands(inp,outp):
    global C_ASSEMBLE, C_LINK
    C_ASSEMBLE = C_ASSEMBLE.replace("out.asm","%s.asm"%outp)
    
    C_LINK = C_LINK.replace("out.o","\""+outp+".o"+"\"").replace("**OUT**",outp)
    if(platform.system() == "Linux"):
        return [C_ASSEMBLE, C_LINK, "./%s"%"\""+outp+".o"+"\""]
    else:
        return [C_ASSEMBLE, C_LINK, "./%s"%"\""+outp+".o"+"\""]

if platform.system() == "Linux":

    with open("include/linux-base/io64.inc", "rb") as f:
        top_stub =top_stub.replace("&&IO64&&",f.read().decode())




parameter_registers = ["r9","r10","r11","r12","r13","r14","r15"]
flt_parameter_registers = ["xmm0", "xmm1", "xmm2", "xmm3", "xmm4", "xmm5", "xmm6", "xmm7"]
return_register = "r8"
flt_return_register = "xmm8"
transition_register = "rdi"
flt_transition_register = "xmm10"

int_allocator = 32
int_allocator_ref = "QWORD"
int_allocator_glob = "resb 8"


def define_global(name):
    return name+": resb 0x8\n"

def value_of_global(name, comp):
    if(comp.globalIsString(name)):
        return name
    return "["+name+"]"


def allocate(amt):
    return """
push rbp
mov rbp, rsp
sub rsp, """+hex(amt)+"\n"

def place_value(ptr, value):
    return """mov QWORD [rbp-"""+hex(ptr)+"""], """+hex(value)

def place_value_from_reg(ptr, reg):
    return "mov QWORD [rbp-"+hex(ptr)+"], %s\n"%reg
    

def load_value_toreg(ptr,reg):
    return """
mov %s, QWORD [rbp-%s]\n
    """%(reg,hex(ptr))

def correct_mov(regdest, regsource):
    if(not "xmm" in regdest and not "xmm" in regsource):
        return "mov %s,%s"%(regdest,regsource)
    elif ("xmm" in regdest and not "xmm" in regsource):
        return "cvtsi2ss %s,%s"%(regdest,regsource)
    elif (not "xmm" in regdest and "xmm" in regsource):
        return "cvttss2si %s, %s"%(regdest,regsource)
    else:
        return "movxx %s,%s"%(regdest,regsource)

