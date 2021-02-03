from Classes.Location import Location
from Classes.Token import Token
import Classes.Token as T
from Classes.Error import throw, fatalThrow, Error
from Classes.Error import UnkownCharSequence
from Classes.Error import UnexepectedEOFError, TokenMismatch
from globals import *
import re


#ambiguous_regex = re.compile("(?!([a-Z]|[_]|[0-9]))")
ambiguous_regex = re.compile(r"\W", flags=re.ASCII)
number_regex = re.compile(r"(?!([0-9]|[.e\-]))", flags=re.ASCII)

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
        #self.raw = raw.replace("\t", "")
        self.raw = raw
        self.raw += chr(1)
        self.ch = self.raw[0]
        self.chidx = 0
        self.size = len(self.raw)

    def advance(self) -> str:  # increment the current character

        self.chidx += 1
        self.loc.ch += 1
        self.ch = self.raw[self.chidx]
        self.loc.line += (self.ch == "\n")
        return self.ch

    # build math operators that use more than one character (max = 3)

    def buildMultichar(self) -> Token:
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
    def buildNumber(self) -> Token:
        num = self.ch
        begin = self.loc.copy()
        self.advance()
        pchars = T.T_DIGITS + T.T_DOT + "e"
        base = 10
        if(self.ch == "x" or self.ch == "X"):
            num += self.ch
            self.advance()
            pchars += "abcdefABCDEF"
            base = 16

        while self.ch in pchars:
            num += self.ch
            self.advance()
            if("e" in num):
                pchars += "-"

        if(self.ch == "b"):
            base = 2
            self.advance()
        elif(self.ch == "q"):
            base = 8
            self.advance()

        t = T.T_INT
        if(T.T_DOT in num):
            val = float(num)
            if self.ch == 'd':
                t = T.T_DOUBLE
                self.advance()
            elif self.ch == 'f':
                t = T.T_FLOAT
                self.advance()
            else:
                t = T.T_DOUBLE
        else:
            if self.ch == 'd':
                t = T.T_DOUBLE
                self.advance()
                val = float(int(num, base))
            elif self.ch == 'f':
                t = T.T_FLOAT
                self.advance()
                val = float(int(num, base))
            else:
                val = int(num, base)

        return Token(t, val, begin, self.loc.copy())

    def buildString(self) -> Token:  # build a string value with escape characters
        self.advance()
        begin = self.loc.copy()
        if(self.ch == "\""):
            self.advance()
            return Token(T.T_STRING, "", begin, self.loc.copy())

        end = self.raw.find("\"", self.chidx)

        if(end == -1 or end >= len(self.raw)):
            raise(TokenMismatch(Token("\"", "\"", begin, begin)))
        content = self.raw[self.chidx:end]
        self.chidx = end
        # account for multi-line strings
        newlines = content.count("\n")
        self.loc.line += newlines - 1 if newlines else 0
        self.loc.ch += len(content)
        self.advance()
        return Token(T.T_STRING, content, begin, self.loc.copy())

    def buildIncluder(self) -> Token:
        self.advance()
        begin = self.loc.copy()
        if(self.ch == ">"):
            self.advance()
            return Token(T.T_STRING, "", begin, self.loc.copy())
        #content = self.ch
        #ch = self.advance()

        end = self.raw.find(">", self.chidx)
        if(end == -1 or end >= len(self.raw)):
            raise(TokenMismatch(Token("<", ">", begin, begin)))
        content = self.raw[self.chidx:end]
        self.chidx = end

        self.advance()
        return Token(T.T_STRING, content, begin, self.loc.copy())

    def buildChar(self) -> Token:  # build a char token with one char
        self.advance()
        begin = self.loc.copy()
        v = ord(self.ch)
        if self.size - self.chidx < 3:
            raise(
                UnexepectedEOFError(
                    Token(
                        T.T_CHAR,
                        self.ch,
                        begin,
                        self.loc)))
        self.advance()
        if self.ch != "'":
            raise(
                TokenMismatch(
                    Token(
                        T.T_CHAR,
                        v,
                        begin,
                        self.loc
                    )
                )
            )

        self.advance()
        return Token(T.T_CHAR, v, begin, self.loc.copy())

    # build unkown identifier. Could be : ID, Keyword, Type, etc...
    def buildAmbiguous(self) -> Token:
        begin = self.loc.copy()
        self.advance()
        raw = self.raw
        chidx = self.chidx

        # r"\W", flags=re.ASCII
        end = ambiguous_regex.search(raw, chidx).end() - 1
        value = (raw[chidx - 1:end])
        lv = end - (chidx - 1) - 2
        self.chidx += lv
        self.loc.ch += lv
        self.advance()

        if(value in T.KEYWORDS):
            
            return Token(T.T_KEYWORD, value, begin, self.loc.copy())
        return Token(T.T_ID, value, begin, self.loc.copy())

    def lex(self, getDirectives=False) -> list:
        tokens = []
        directives = []
        advance = self.advance
        # a [1] character marks the end of the raw text
        while self.ch != chr(1):
            # newlines, spaces, and indents have no response
            if(self.ch == "\n" or self.ch in " \t\r"):
                advance()

            # backslash characters
            elif(self.ch == "\\"):
                tokens.append(
                    Token(
                        T.T_BSLASH,
                        T.T_BSLASH,
                        self.loc.copy(),
                        self.loc.copy()))
                advance()

            # pre-compiler directives
            elif (self.ch == "#"):

                advance()
                while(self.ch == " "):
                    advance()

                t = self.buildAmbiguous()
                t.tok = T.T_DIRECTIVE
                tokens.append(t)
                if(self.chidx < self.size - 1):
                    if(self.raw[self.chidx + 1] == "<"):
                        t2 = self.buildIncluder()
                        tokens.append(t2)

            # typecasts
            elif(self.ch == "$"):
                advance()
                t = self.buildAmbiguous()
                t.tok = T.T_TYPECAST

                while self.ch == "*":
                    advance()
                    t.value += "."

                tokens.append(t)

            # semicolon
            elif(self.ch == ";"):
                tokens.append(Token(T.T_ENDL, T.T_ENDL,
                                    self.loc.copy(), self.loc.copy()))
                advance()

            elif(self.ch == "+"):

                tokens.append(self.buildMultichar())

            elif(self.ch == "/"):
                advance()

                # managing comments:
                olchdx = self.chidx

                # single line comments:
                if(self.ch == "/"):
                    # find and jump to next newline
                    self.chidx = self.raw.find("\n", self.chidx) - 1
                    if self.chidx <= 0:
                        raise(
                            UnexepectedEOFError(
                                Token(
                                    '',
                                    '',
                                    self.loc,
                                    self.loc)))
                    self.loc.ch += self.chidx - olchdx
                    advance()

                # multiline comments:
                elif(self.ch == "*"):
                    # find and jump to next instance of '*/' in raw text
                    self.chidx = self.raw.find("*/", self.chidx) + 1
                    if self.chidx <= 0:
                        raise(
                            UnexepectedEOFError(
                                Token(
                                    '',
                                    '',
                                    self.loc,
                                    self.loc)))
                    self.loc.ch += self.chidx - olchdx
                    self.loc.line += self.raw.count("\n", olchdx, self.chidx)
                    advance()

                # not a comment
                else:
                    self.chidx -= 2
                    self.loc.ch -= 2
                    advance()
                    tokens.append(self.buildMultichar())

            elif (self.ch in "()}{[],@~?"):
                tokens.append(
                    Token(self.ch, self.ch, self.loc.copy(), None))
                advance()
                tokens[-1].end = self.loc.copy()

            elif (self.ch == "-"):
                advance()
                prev = tokens[-1]
                if prev.tok not in [T.T_INT, T.T_CHAR,
                                    T.T_DOUBLE, T.T_ID, T.T_CLSP] and self.ch.isdigit():
                    t = self.buildNumber()
                    t.value = -t.value
                else:
                    self.chidx -= 2
                    self.loc.ch-=2
                    advance()
                    t = self.buildMultichar()

                tokens.append(t)
            elif (self.ch in T.T_MULTIOP):
                token = self.buildMultichar()
                tokens.append(token)

            elif (self.ch == "."):

                if self.raw[self.chidx + 1].isdigit():
                    token = self.buildNumber()
                else:
                    token = self.buildMultichar()
                tokens.append(token)

            elif self.ch.isdigit():
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
                print(ord(self.ch))
                raise(UnkownCharSequence(
                    Token(self.ch, self.ch, self.loc.copy(), self.loc.copy())))

        tokens.append(
            Token(T.T_EOF, T.T_EOF, self.loc.copy(), self.loc.copy()))

        if(getDirectives):
            return directives

        return tokens

    # main function to get all tokens for a given text file.
    # getDirectives can be set to True by the PreProcessor to only see directives
    # \see PreParser

    def getTokens(self, getDirectives=False) -> list:
        try:

            return self.lex(getDirectives)

        except Error as e:

            fatalThrow(e)
