from Token import *
from Location import *
from Error import *
def join(arr, d):
    out = ""
    for s in arr:
        out+=s+d
    return out


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
            
            print("Untimely Advance PreParse")
            exit()

    def getTokens(self):
        
        while self.chidx < len(self.content):
            
            if (ord(self.ch) == 1):

                self.tokens.append(Token(T_EOF,T_EOF,self.loc.copy(),self.loc.copy()))
                return self.tokens

            elif (self.ch == "\n"):
                self.advance()
            elif (self.ch == "#"):
                self.parseDirective()
            else:
                self.advance()
        return self.tokens


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
        else:
            content = ""
            b2 = self.loc.copy()
            while self.ch != "\n":
                content+=self.ch
                self.advance()
            
            self.tokens.append(Token(T_AMBIGUOUS, content, b2, self.loc.copy()))








class PreProcessor:
    def __init__(self, raw, tokens, startf):
        self.texts = [[raw, startf]]
        self.tokens = tokens
        self.stack = 0
        self.current_token = tokens[0]
        self.tkidx = 0
        self.definitions = []

    def advance(self):
        self.tkidx+=1
        self.current_token = self.tokens[self.tkidx]

    def getDefn(self, name):
        for d in self.definitions:
            if d[0] == name:
                return d
        return None

    def process(self):
        
        while self.current_token.tok != T_EOF:
            if ( self.current_token.tok == T_KEYWORD):
                
                if ( self.current_token.value == "include"):

                    self.advance()

                    if(self.current_token.tok == T_STRING):

                        path = self.current_token.value

                        with open(path, "rb") as f:
                            self.texts.insert(0, [f.read().decode(), path])
                            
                        pp = PreParser(self.texts[0][0],path)
                        tokens = pp.getTokens()

                        for t in tokens[:-1]:
                            self.tokens.insert(self.tkidx+1, t)
                        self.advance()
                        
                
                    else:

                        print("Invalid Include: %s"%self.current_token.start)
                
                elif (self.current_token.value == "define"):
                    self.advance()
                    content = self.current_token.value.split(" ")
                    name = content[0]
                    content = join(content[1:]," ")

                    self.definitions.append((name,content))
                    self.advance()
            
            
            
            

        


        for text in self.texts:
            for d in self.definitions:
                text[0] = text[0].replace(d[0],d[1])
        return self.texts

        
