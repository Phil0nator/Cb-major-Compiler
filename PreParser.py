from Classes.Token import *
from Classes.Location import Location
from Classes.Error import *
from Lexer import Lexer
from config import include_directories
import os
import platform
import cpuid
import datetime
import time


def join(arr, d):
    out = ""
    for s in arr:
        out += s + d
    return out


# add the compiler-produced define macros
# EX: __WIN32, __LINUX, __DARWIN, etc...
oslist = ["Linux", "Darwin", "Windows", "SunOS", "Java", "BSD"]


def getCompilerDefines():
    operating_system = platform.system()
    arch = platform.processor()
    defines = []
    T_0 = [Token(T_INT, 0, None, None)]
    T_1 = [Token(T_INT, 1, None, None)]
    T_B = [T_0, T_1]
    defines.append([f"__{operating_system.upper()}", T_1])
    yes = "Yes"
    sse = cpuid._is_set(1, 3, 25) == yes
    sse2 = cpuid._is_set(1, 3, 26) == yes
    sse3 = cpuid._is_set(1, 2, 0) == yes
    ssse3 = cpuid._is_set(1, 2, 9) == yes
    sse41 = cpuid._is_set(1, 2, 19) == yes
    sse42 = cpuid._is_set(1, 2, 20) == yes
    sse4a = cpuid._is_set(0x80000001, 2, 6) == yes
    avx = cpuid._is_set(1, 2, 28) == yes
    avx2 = cpuid._is_set(7, 1, 5) == yes
    bmi1 = cpuid._is_set(7, 1, 3) == yes
    bmi2 = cpuid._is_set(7, 1, 8) == yes

    if(sse):
        defines.append(["__SSE", T_1])
    if(sse2):
        defines.append(["__SSE2", T_1])
    if(sse3):
        defines.append(["__SSE3", T_1])
    if(ssse3):
        defines.append(["__SSSE3", T_1])
    if(sse41):
        defines.append(["__SSE4_1", T_1])
    if(sse42):
        defines.append(["__SSE4_2", T_1])
    if(sse4a):
        defines.append(["__SSE4A", T_1])
    if(avx):
        defines.append(["__AVX", T_1])
    if(avx2):
        defines.append(["__AVX2", T_1])
    if(bmi1):
        defines.append(["__BMI1", T_1])
    if(bmi2):
        defines.append(["__BMI2", T_1])

    defines.append(["__TIME__", [Token(T_STRING, time.ctime(), None, None)]])

    return defines


##############################
#
#   The PreProcessor class is used to execute directive tokens from
#       a PreParser object.
#   It will return the new raw texts associated with their respective
#       file names in tuples.
#   \see compile.py
#   \see PreParser
#
#
#############################


class PreProcessor:
    def __init__(self, tokens):

        self.tokens = tokens                    # all tokens
        self.current_token = tokens[0]          # current token
        self.tkidx = 0                          # current position
        # definition: [str:name, tokens[]]
        self.definitions = getCompilerDefines()
        self.dels = 0                           # number of tokens deleted

    def advance(self):
        self.tkidx += 1
        self.current_token = self.tokens[self.tkidx]

    def update(self):                           # correct current_token to potentially changed index
        self.current_token = self.tokens[self.tkidx]

    def delmov(self):                           # delete current token, and move to the next
        self.tokens[self.tkidx] = None
        self.advance()
        self.dels += 1

    def getDefn(self, name):                    # get a definition by name
        return next((d for d in self.definitions if d[0] == name), None)

    def checkToks(self, tok):                   # check for specific tokens
        if(self.current_token.tok not in tok):
            throw(ExpectedToken(self.current_token, tok))

    def loadRaw(self, path):  # load a raw file based on a given path
        return config.loadRawFile(path, self.current_token)

    def buildIncludeStatement(self):            # #include directive
        self.delmov()

        self.checkToks([T_STRING, T_INCLUDER])
        path = self.current_token.value
        rawdata = self.loadRaw(path)

        lex = Lexer(path, rawdata)
        tokens = lex.getTokens()
        self.delmov()
        self.tokens[self.tkidx:self.tkidx] = tokens[:-1]
        self.update()

    def buildDefine(self):                      # #define directive
        self.delmov()

        self.checkToks([T_ID])
        name = self.current_token.value
        sline = self.current_token.start.line
        self.delmov()
        if(self.current_token.start.line != sline):
            self.definitions.append(
                [name, [Token(T_INT, 0, self.current_token.start, self.current_token.end)]])
            return

        definitionTokens = [self.current_token]
        line = self.current_token.start.line
        self.delmov()
        while(self.current_token.start.line == line):
            definitionTokens.append(self.current_token)
            self.delmov()
        self.definitions.append([name, definitionTokens])
    # check if current token (id) is a macro
    # if so, replace it with the actual values for that macro

    def checkDefn(self):
        assert self.current_token.tok == T_ID
        dq = self.getDefn(self.current_token.value)
        if(dq is None):
            if(self.current_token.value == "__LINE__"):
                self.delmov()
                self.tokens[self.tkidx] = Token(
                    T_INT, self.tokens[self.tkidx].start.line + 1, self.tokens[self.tkidx].start, self.tokens[self.tkidx].end)
                return
            elif(self.current_token.value == "__FILE__"):
                self.delmov()
                self.tokens[self.tkidx] = Token(
                    T_STRING, self.tokens[self.tkidx].start.file, self.tokens[self.tkidx].start, self.tokens[self.tkidx].end)
                return

            self.advance()
            return
        self.delmov()
        self.tokens[self.tkidx:self.tkidx] = dq[1]

    # #ifdef directive
    def buildifdef(self):
        self.delmov()
        self.checkToks([T_ID])
        q = self.getDefn(self.current_token.value)
        if(q is None):
            while not (self.current_token.tok ==
                       T_DIRECTIVE and self.current_token.value == "endif"):
                self.delmov()
        else:
            self.delmov()

    # #ifndef directive
    def buildifndef(self):
        self.delmov()
        self.checkToks([T_ID])
        q = self.getDefn(self.current_token.value)
        if(q is None):
            self.delmov()
        else:
            while not (self.current_token.tok ==
                       T_DIRECTIVE and self.current_token.value == "endif"):
                self.delmov()

    # main function
    def process(self):

        while self.current_token.tok != T_EOF:
            self.update()
            if(self.current_token.tok == T_DIRECTIVE):
                # token is directive

                if(self.current_token.value == "include"):
                    # build include statement
                    self.buildIncludeStatement()

                elif(self.current_token.value == "define"):
                    # build define statement
                    self.buildDefine()
                elif(self.current_token.value == "ifdef"):
                    self.buildifdef()
                elif(self.current_token.value == "ifndef"):
                    self.buildifndef()

                elif(self.current_token.value == "endif"):
                    self.delmov()

            elif(self.current_token.tok == T_ID):
                self.checkDefn()

            else:
                self.advance()

        # filter out deleted tokens that were replaced with None
        return list(filter(None, self.tokens))
