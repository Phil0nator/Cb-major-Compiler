from Classes.Location import Location
from Classes.Token import Token
import Classes.Token as T
from globals import *
class Lexer:
    def __init__(self, fname, raw):
        self.loc = Location(fname,1,0)
        self.raw = raw.replace("\t","")
        self.raw += chr(1)
        self.ch = self.raw[0]
        self.chidx = 0


    def advance(self):

        self.chidx+=1
        if(self.chidx < len(self.raw)):
            self.ch = self.raw[self.chidx]
            self.loc.ch+=1
            if self.ch == "\n":
                self.loc.line+=1
            return
        else:
            print(self.ch)
            print(self.loc)
            print("Untimely Advance")
            exit()

    def buildMultichar(self):
        op = self.ch
        begin = self.loc.copy()
        self.advance()
        if(self.ch not in T.T_MULTIOP):
            return Token(op,op,begin,self.loc.copy())
        op += self.ch
        self.advance()
        if(self.ch not in T.T_MULTIOP):
            return Token(op,op,begin,self.loc.copy())
        op+=self.ch
        self.advance()
        return Token(op,op,begin,self.loc.copy())

    def buildNumber(self):
        num = self.ch
        begin = self.loc.copy()
        self.advance()
        pchars = T.T_DIGITS+T.T_DOT+"e"
        while self.ch in pchars:
            num+=self.ch
            self.advance()
            if("e" in num): pchars+="-"
        
        t = T.T_INT
        if(T.T_DOT in num or "e" in num):
            val = float(num)
            t=T.T_DOUBLE
        else:
            val = int(num)
        
        return Token(t,val,begin,self.loc.copy())
            

    def buildString(self):
        self.advance()
        content = self.ch
        begin = self.loc.copy()
        self.advance()
        while(self.ch != "\""):
            content+=self.ch
            self.advance()
        self.advance()
        return Token(T.T_STRING, content,begin,self.loc.copy())

    def buildChar(self):
        self.advance()
        begin = self.loc.copy()
        v = ord(self.ch)
        self.advance()
        self.advance()
        return Token(T.T_CHAR, v,begin,self.loc.copy())

    def buildAmbiguous(self):
        value = self.ch
        begin = self.loc.copy()
        self.advance()

        while self.ch in T.T_IDCHARS+T.T_DIGITS:
            value += self.ch
            self.advance()

        if( value in T.KEYWORDS ):
            if(value in ["true", "false"]):
                if(value == "true"):
                    return Token(T.T_BOOL, True, begin, self.loc.copy())
                return Token(T.T_BOOL, False, begin, self.loc.copy())
            return Token(T.T_KEYWORD, value, begin, self.loc.copy())
        return Token(T.T_ID, value, begin, self.loc.copy())


    def getTokens(self):
        tokens = []
        while self.ch != chr(1):

            if(self.ch == "\n" or self.ch == " "):
                self.advance()

            elif (self.ch == "#"):
                while self.ch != "\n":
                    self.advance()

            elif(self.ch == "$"):
                self.advance()
                t = self.buildAmbiguous()
                t.tok = T.T_TYPECAST

                while self.ch == "*":
                    self.advance()
                    t.value+="."

                tokens.append(t)


            elif(self.ch == ";"):
                tokens.append(Token(T.T_ENDL,T.T_ENDL,self.loc.copy(),self.loc.copy()))
                self.advance()
            elif(self.ch == "+"):
                tokens.append(Token(T.T_PLUS,T.T_PLUS,self.loc.copy(),self.loc.copy()))
                self.advance()
            elif(self.ch == "/"):
                self.advance()
                if(self.ch == "/"):
                    while self.ch != "\n":
                        self.advance()
                elif(self.ch == "*"):
                    comment = "  "
                    while comment[-2:] != "*/":
                        self.advance()
                        comment+=self.ch
                        
                    
                    
                else:
                    tokens.append(Token(T.T_DIVIDE,T.T_DIVIDE,self.loc.copy(),self.loc.copy()))
                    
            
            elif (self.ch in "()}{[],^*@%~."):
                tokens.append(Token(self.ch,self.ch,self.loc.copy(),self.loc.copy()))
                self.advance()

            elif (self.ch == "-"):
                self.advance()
                prev = tokens[len(tokens)-1]
                if(prev.tok in OPERATORS or prev.tok == T.T_EQUALS) and prev.tok != T.T_MINUS:
                    t = self.buildNumber()
                    t.value = -t.value
                else:

                    t = Token("-","-",self.loc.copy(),self.loc.copy())
                
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
                print("Unkown character sequence at: %s"%self.loc)

        tokens.append(Token(T.T_EOF,T.T_EOF,self.loc.copy(),self.loc.copy()))

        return tokens