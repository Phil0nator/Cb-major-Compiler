################
#   Token strings are prefaced with T_
#
#############

# COMPILETIME

T_DTYPE = "dtype"
T_ID = "id"
T_INT = "int"
T_DOUBLE = "double"
T_FLOAT = "float"
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

T_MULTIOP = "-><=!|&+/*^%:."
MULTIOPERS = [
    "->",
    "!=",
    "<=",
    ">=",
    "==",
    "+=",
    "-=",
    "*=",
    "/=",
    "&=",
    "|=",
    "<<=",
    ">>=",
    "^=",
    "%=",
    "++",
    "--",
    ">>",
    "<<",
    "||",
    "&&",
    "...",
    "..",
    "::",
    "<=>"]


T_DIGITS = "0123456789"
T_IDCHARS = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_"

# c >= '0' and c <= '9'


def isdigit(c):
    return (c) >= 48 and (c) <= 57

# (c <= 'Z' and c >= 'A') or (c >= 'a' and c <= 'z') or c == '_'


def isidchar(c):
    return ((c) >= 97 and (c) <= 122) or ((c) >= 65 and (c) <= 90) or c == 95


T_EQUALS = "="

T_OPENP = "("
T_CLSP = ")"
T_OPENSCOPE = "{"
T_CLSSCOPE = "}"
T_OPENIDX = "["
T_CLSIDX = "]"

T_COMMA = ","
T_BSLASH = "\\"
T_ELIPSES = "..."

T_TYPECAST = "$"

T_TERNARYQ = "?"
T_TERNARYELSE = ":"

T_AMBIGUOUS = "T?T"
T_DIRECTIVE = "#directive"
T_INCLUDER = "<...>"

T_NAMESPACE = "::"

KEYWORDS = [

    "elif",
    "else",

    "function",
    "constructor",
    "destructor",
    "struct",
    "const",
    "unsigned",
    "signed",
    "template",
    "class",
    "typename",
    "auto",
    "constexpr",
    "operator",
    "explicit",
    "enum",
    "lambda",


    "__vectorize",

    "noexcept",
    "safetype",

    "private",
    "public",
    "protected",
    "virtual",

    "for",
    "while",
    "if",
    "break",
    "continue",
    "__asm",
    "__simd",

    "return",
    "typedef",
    "switch",
    "case",

    "del",
    "do",
    "goto",

    "extern",
    "winextern",
    "cextern",
    "__cdecl",
    "global",
    "inline",

    "register",
    "static"
]

IGNORABLES = [
    "signed"
]


SETTERS = [
    "=",
    "+=",
    "-=",
    "*=",
    "/=",
    "&=",
    "|=",
    "<<=",
    ">>=",
    "^=",
    "%=",
    "<=>"]


T_FUNCTIONCALL = "fn(x)"
T_IDXER = "[x]"
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
        self.thint = None  # type hint
        self.tracker = 0  # usage hint

    def copy(self, start, end):
        return Token(self.tok, self.value, start, end)

    def loadLocs(self, other):
        self.start = other.start.copy()
        self.end = other.end.copy()
        return self

    # reverse a token into its original string value
    # (specifically used for the -E compile option for preprocess only)
    def reverse(self):

        if(self.tok == T_EOF):
            return ""

        if(self.tok == T_STRING):
            return f"\"{self.value}\""

        if(self.tok == T_TYPECAST):
            return f"${self.value} "

        if(isinstance(self.value, int)):
            return f"{self.value}"

        if(self.tok == T_ID or self.tok == T_KEYWORD):
            return f"{self.value} "

        return str(self.value)

    def __repr__(self):  # pretty print
        if(self.tok != T_FUNCTIONCALL):
            return f"[ {self.tok} : {self.value}]" if self.tok != self.value else f" {self.value} "
        else:
            return f"[ {T_FUNCTIONCALL} : {self.fn} ]"
