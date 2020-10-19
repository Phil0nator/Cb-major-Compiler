from Classes.Location import Location
from Classes.Token import Token
import Classes.Token as T
from Classes.Error import throw
from Classes.Error import UnkownCharSequence
from Classes.Error import UnexepectedEOFError, TokenMismatch
from globals import *

##########################
#
#   The Lexer class is used to take a raw text file
#       and translate it into Token objects for a Compiler and Function
#       object to compile.
#
#       \see Classes.Token
#       \see Compiler
#       \see Function
#
##########################


class Lexer:
    def __init__(self, fname, raw):
        self.loc = Location(fname, 1, 0)
        self.raw = raw.replace("\t", "")
        self.raw += chr(1)
        self.ch = self.raw[0]
        self.chidx = 0
        self.size = len(self.raw)

    def advance(self):  # increment the current character

        self.chidx += 1
        if(self.chidx < self.size):
            self.ch = self.raw[self.chidx]
            self.loc.ch += 1
            if self.ch == "\n":
                self.loc.line += 1
            return
        else:
            throw(UnexepectedEOFError(
                Token(self.ch, self.ch, self.loc.copy(), self.loc)))

    # build math operators that use more than one character (max = 3)
    def buildMultichar(self):
        op = self.ch
        begin = self.loc.copy()
        self.advance()
        if(self.ch not in T.T_MULTIOP or op+self.ch not in T.MULTIOPERS):
            return Token(op, op, begin, self.loc.copy())
        op += self.ch
        self.advance()
        if(self.ch not in T.T_MULTIOP or op+self.ch not in T.MULTIOPERS):
            return Token(op, op, begin, self.loc.copy())
        op += self.ch
        self.advance()
        return Token(op, op, begin, self.loc.copy())

    # build a number based on digits, . for floats, and e for scientific notation
    def buildNumber(self):
        num = self.ch
        begin = self.loc.copy()
        self.advance()
        pchars = T.T_DIGITS+T.T_DOT+"e"
        if(self.ch == "x" or self.ch == "X"):
            num += self.ch
            self.advance()
            pchars += "abcdefABCDEF"
        while self.ch in pchars:
            num += self.ch
            self.advance()
            if("e" in num):
                pchars += "-"

        t = T.T_INT
        if(T.T_DOT in num or "e" in num):
            val = float(num)
            t = T.T_DOUBLE
        else:
            if("x" in num):
                val = int(num, 16)
            else:
                val = int(num)

        return Token(t, val, begin, self.loc.copy())

    def buildString(self):  # build a string value with escape characters
        self.advance()
        begin = self.loc.copy()
        if(self.ch == "\""):
            self.advance()
            return Token(T.T_STRING, "", begin, self.loc.copy())
        content = self.ch
        self.advance()

        while(self.ch != "\""):
            content += self.ch
            self.advance()
            if(self.chidx == len(self.raw)-1):
                throw(TokenMismatch(Token("\"", "\"", begin, begin)))
        self.advance()
        return Token(T.T_STRING, content, begin, self.loc.copy())

    def buildChar(self):  # build a char token with one char
        self.advance()
        begin = self.loc.copy()
        v = ord(self.ch)
        self.advance()
        self.advance()
        return Token(T.T_CHAR, v, begin, self.loc.copy())

    # build unkown identifier. Could be : ID, Keyword, Type, etc...
    def buildAmbiguous(self):
        value = self.ch
        begin = self.loc.copy()
        self.advance()
        pchars = T.T_IDCHARS+T.T_DIGITS

        for ch in self.raw[self.chidx:]:
            if(ch in pchars):
                value += ch
            else:
                break
        self.chidx += len(value)-2
        self.loc.ch += len(value)-2
        self.advance()
        if(value in T.KEYWORDS):
            return Token(T.T_KEYWORD, value, begin, self.loc.copy())
        return Token(T.T_ID, value, begin, self.loc.copy())

    # main function to get all tokens for a given text file.
    # getDirectives can be set to True by the PreProcessor to only see directives
    # \see PreParser
    def getTokens(self, getDirectives=False):
        tokens = []
        directives = []
        advance = self.advance
        while self.ch != chr(1):

            if(self.ch == "\n" or self.ch == " "):
                advance()

            elif(self.ch == "\\"):
                advance()
                advance()

            elif (self.ch == "#"):
                advance()
                t = self.buildAmbiguous()
                t.tok = T.T_DIRECTIVE
                tokens.append(t)

                # if(not getDirectives):
                #     while self.ch != "\n":
                #         self.advance()
                # else:
                #     out = ""
                #     while self.ch != "\n":
                #         out+=self.ch
                #         self.advance()
                #     directives.append(out)

            elif(self.ch == "$"):
                advance()
                t = self.buildAmbiguous()
                t.tok = T.T_TYPECAST

                while self.ch == "*":
                    advance()
                    t.value += "."

                tokens.append(t)

            elif(self.ch == ";"):
                tokens.append(Token(T.T_ENDL, T.T_ENDL,
                                    self.loc.copy(), self.loc.copy()))
                advance()
            elif(self.ch == "+"):
                tokens.append(self.buildMultichar())
            elif(self.ch == "/"):
                advance()
                if(self.ch == "/"):
                    while self.ch != "\n":
                        advance()
                elif(self.ch == "*"):
                    comment = "  "
                    while comment[-2:] != "*/":
                        self.advance()
                        comment += self.ch
                    advance()
                else:
                    self.chidx -= 2
                    advance()
                    tokens.append(self.buildMultichar())

            elif (self.ch in "()}{[],^@%~."):
                tokens.append(
                    Token(self.ch, self.ch, self.loc.copy(), self.loc.copy()))
                advance()

            elif (self.ch == "-"):
                advance()
                prev = tokens[-1]
                if prev.tok not in [T.T_INT, T.T_CHAR, T.T_DOUBLE, T.T_ID] and self.ch in T.T_DIGITS:
                    t = self.buildNumber()
                    t.value = -t.value
                else:
                    #t = Token("-","-",self.loc.copy(),self.loc.copy())
                    self.chidx -= 2
                    advance()
                    t = self.buildMultichar()

                tokens.append(t)
            elif (self.ch in T.T_MULTIOP):
                token = self.buildMultichar()
                tokens.append(token)

            elif (self.ch in T.T_DIGITS):
                token = self.buildNumber()
                tokens.append(token)

            elif (self.ch == "\""):
                token = self.buildString()
                tokens.append(token)

            elif (self.ch == "'"):
                token = self.buildChar()
                tokens.append(token)

            elif (self.ch in T.T_IDCHARS):
                token = self.buildAmbiguous()
                tokens.append(token)

            else:
                throw(UnkownCharSequence(
                    Token(self.ch, self.ch, self.loc.copy(), self.loc.copy())))

        tokens.append(
            Token(T.T_EOF, T.T_EOF, self.loc.copy(), self.loc.copy()))

        if(getDirectives):
            return directives

        return tokens
