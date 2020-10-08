################
#   Token strings are prefaced with T_
#
#############

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

T_ANOT = "~"
T_AOR = "|"
T_AAND = "&"

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


T_TYPECAST = "$"

T_AMBIGUOUS = "T?T"


KEYWORDS = [

    "elif",
    "else",
    
    "function",
    "struct",
    "const",
    "unsigned",
    
    "for",
    "while",
    "if",
    "break",
    "continue",
    "__asm",
    "return",
    "typedef"



]


T_FUNCTIONCALL = "fn(x)"
T_REGISTER = "reg"

##################################
#
#   The Token class is used to abstract a body of text into
#       one of the above listed catagories (T_...) with the
#       original value if needed.
#   Each token also stores its location in a file with a Location
#       object.
#  
#   \see Lexer
#   \see Compiler
#   \see Function
#   \see Location
#################################
class Token:
    def __init__(self, tok, value, start, end):
        self.tok = tok          # catagorie
        self.start = start      # Location
        self.end = end          # Location
        self.value = value      # raw
        self.fn = None          # hint
        self.thint = None # type hint
        self.tracker = 0 # usage hint

    def __repr__(self): # pretty print
        if(self.tok != T_FUNCTIONCALL):
            return f"[ {self.tok} : {self.value}]" 
        else:
            return f"[ {T_FUNCTIONCALL} : {self.fn} ]"