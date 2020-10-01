from Variable import *
from Function import *
from DType import *
from Token import *
from Location import *
from Lexer import *
from Error import *
class Compiler:

    def __init__(self):
        self.globals = []
        self.constants = ""
        self.heap = ""
        self.initializers = ""
        self.entry = ""
        self.text = ""
        self.currentfname = ""
        self.currentTokens = []


        self.functions = []
        self.globals = []
        


    def compile(self, ftup):
        self.currentfname = ftup[1]
        raw = ftup[0]
        lex = Lexer(self.currentfname,raw)
        self.currentTokens = lex.getTokens()
        