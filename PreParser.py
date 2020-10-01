from Token import *
from Location import *
class PreParser:
    def __init__(self, content, fname):
        self.content = content
        self.content += chr(1)
        self.fname = fname
        
        self.ch = self.content[0]
        self.chidx = 0
        self.loc = Location(fname,0,0)
        self.tokens = []

    def advance(self):
        self.chidx+=1
        if(self.chidx < len(self.content)):
            self.ch = self.content[self.chidx]
            self.loc.ch+=1
            if self.ch == "\n":
                self.loc.line+=1
            return
        else:
            print("Untimely Advance")
            exit()

    def getTokens(self):
        
        while self.chidx < len(self.content):
            
            if (ord(self.ch) == 1):

                self.tokens.append(Token(T_EOF,T_EOF,self.loc.copy(),self.loc.copy()))
                return self.tokens

            if (self.ch == "\n"):
                self.advance()
            if (self.ch == "#"):
                self.parseDirective()
            else:
                self.advance()


    def parseString(self):
        self.advance()
        content = ""
        begin = self.loc.copy()
        while(self.ch != "\""):
            content+=self.ch

            self.advance()
        self.advance()
        return Token(T_STRING, content,begin,self.loc.copy())


    def parseDirective(self):
        
        self.advance()
        directive = ""
        begin = self.loc.copy()
        while(self.ch != " "):
            directive+=self.ch
            self.advance()
        
        self.tokens.append(Token(T_KEYWORD, directive, begin, self.loc.copy()))
        self.advance()
        if(self.ch == "\""):
            self.tokens.append(self.parseString())








class PreProcessor:
    def __init__(self, raw, tokens, startf):
        self.texts = [(raw, startf)]
        self.tokens = tokens
        self.stack = 0
        self.current_token = tokens[0]
        self.tkidx = 0

    def advance(self):
        self.tkidx+=1
        self.current_token = self.tokens[self.tkidx]

    def process(self):

        while self.current_token.tok != T_EOF:

            if ( self.current_token.tok == T_KEYWORD):
                if ( self.current_token.value == "include"):

                    self.advance()

                    if(self.current_token.tok == T_STRING):

                        path = self.current_token.value

                        with open(path, "rb") as f:
                            self.texts.insert(0, (f.read().decode(), path))
                            
                        pp = PreParser(self.texts[0][0],path)
                        tokens = pp.getTokens()

                        for t in tokens:
                            self.tokens.insert(self.tkidx+1, t)

                        self.advance()

                        

                    else:

                        print("Invalid Include: %s"%self.current_token.start)
        



        return self.texts

        
