

# COMPILETIME

T_DTYPE = "dtype"
T_ID = "id"
T_INT = "int"
T_DOUBLE = "double"
T_STRING = "string"
T_BOOL = "bool"
T_KEYWORD = "keyword"
T_ENDL = ";"
T_EOF = "EOF"
T_CHAR = "char"

T_PLUS = "+"
T_MINUS = "-"
T_TIMES = "*"
T_DIVIDE = "/"

T_INC = "++"
T_DEC = "--"

T_SAME = "=="
T_NOTEQUAL = "!="
T_GREATER = ">"
T_LESS = "<"
T_GE = ">="
T_LE = "<="

T_SR = ">>>"
T_SL = "<<<"

T_DEREF = "@"
T_REFRIZE = "&"

T_PTRIZE = "*"
T_PTRACCESS = "->"
T_DOT = "."

T_NOT = "!"
T_OR = "||"
T_AND = "&&"
T_XOR = "^"


T_MULTIOP = "-><=!|&"

T_DIGITS = "0123456789"
T_IDCHARS = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_"

T_EQUALS = "="

T_OPENP = "("
T_CLSP = ")"
T_OPENSCOPE = "{"
T_CLSSCOPE = "}"
T_OPENIDX = "["
T_CLSIDX = "]"

T_COMMA = ","


T_AMBIGUOUS = "T?T"


KEYWORDS = [

    "elif",
    "else",
    
    "function",
    "const",
    "unsigned",
    
    "for",
    "while",
    "if",
    "__asm",
    "return",
    "typedef"



]


T_FUNCTIONCALL = "fn(x)"
T_REGISTER = "reg"


class Token:
    # used for T_FUNCTIONCALL only
    def __init__(self, tok, value, start, end):
        self.tok = tok
        self.start = start
        self.end = end
        self.value = value

    def __repr__(self):
        return f"[ {self.tok} : {self.value} ]"