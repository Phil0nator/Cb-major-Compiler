from Classes.Location import Location
from Classes.Token import Token
import Classes.Token as T
from Classes.Error import throw
from Classes.Error import UnkownCharSequence
from Classes.Error import UnexepectedEOFError, TokenMismatch
from globals import *
import re




#ambiguous_regex = re.compile("(?!([a-Z]|[_]|[0-9]))")
ambiguous_regex = re.compile("\W", flags=re.ASCII)





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
            return self.ch
        else:
            throw(UnexepectedEOFError(
                Token(self.ch, self.ch, self.loc.copy(), self.loc)))

    # build math operators that use more than one character (max = 3)
    def buildMultichar(self):
        op = self.ch
        begin = self.loc.copy()
        self.advance()
        if(self.ch not in T.T_MULTIOP or op + self.ch not in T.MULTIOPERS):            
            return Token(op, op, begin, self.loc.copy())
        op += self.ch
        self.advance()
        if(self.ch not in T.T_MULTIOP or op + self.ch not in T.MULTIOPERS):
            return Token(op, op, begin, self.loc.copy())
        op += self.ch
        self.advance()
        if(self.ch not in T.T_MULTIOP or op + self.ch not in T.MULTIOPERS):
            return Token(op, op, begin, self.loc.copy())
        op += self.ch
        self.advance()
        return Token(op, op, begin, self.loc.copy())

    # build a number based on digits, . for floats, and e for scientific
    # notation
    def buildNumber(self):
        num = self.ch
        begin = self.loc.copy()
        self.advance()
        pchars = T.T_DIGITS + T.T_DOT + "e"
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
        #content = self.ch
        #ch = self.advance()

        end = self.raw.find("\"", self.chidx)
        if(end == -1 or end >= len(self.raw)):
            throw(TokenMismatch(Token("\"", "\"", begin, begin)))
        content = self.raw[self.chidx:end]
        self.chidx = end


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
        raw = self.raw
        chidx = self.chidx

        end = ambiguous_regex.search(raw,chidx).end()-1
        value = (raw[chidx-1:end])
        lv = len(value)-1
        """ for ch in raw[chidx:]:
            char = ord(ch)
            if(T.isidchar(char) or T.isdigit(char)):
                count += 1
            else:
                break """

        



        #value = f"{value}{raw[chidx:chidx+count]}"
        #lv = len(value) - 2
        self.chidx += lv-1
        self.loc.ch += lv-1
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
                tokens.append(Token(T.T_BSLASH, T.T_BSLASH,self.loc.copy(),self.loc.copy()))
                advance()

            elif (self.ch == "#"):
                advance()
                t = self.buildAmbiguous()
                t.tok = T.T_DIRECTIVE
                tokens.append(t)


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
                
                # managing comments:

                # single line comments:
                if(self.ch == "/"):
                    # find and jump to next newline
                    self.chidx = self.raw.find("\n", self.chidx)
                    advance()                
                
                # multiline comments: 
                elif(self.ch == "*"):
                    #find and jump to next instance of '*/' in raw text
                    self.chidx = self.raw.find("*/",self.chidx)+1
                    advance()
                
                # not a comment
                else:
                    self.chidx -= 2
                    advance()
                    tokens.append(self.buildMultichar())

            elif (self.ch in "()}{[],^@%~:?"):
                tokens.append(
                    Token(self.ch, self.ch, self.loc.copy(), self.loc.copy()))
                advance()

            elif (self.ch == "-"):
                advance()
                prev = tokens[-1]
                if prev.tok not in [T.T_INT, T.T_CHAR,
                                    T.T_DOUBLE, T.T_ID] and self.ch in T.T_DIGITS:
                    t = self.buildNumber()
                    t.value = -t.value
                else:
                    self.chidx -= 2
                    advance()
                    t = self.buildMultichar()

                tokens.append(t)
            elif (self.ch in T.T_MULTIOP):
                token = self.buildMultichar()
                tokens.append(token)

            elif (T.isdigit(ord(self.ch))):
                token = self.buildNumber()
                tokens.append(token)

            elif (self.ch == "\""):
                token = self.buildString()
                tokens.append(token)

            elif (self.ch == "'"):
                token = self.buildChar()
                tokens.append(token)

            elif (T.isidchar(ord(self.ch))):
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
