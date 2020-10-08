from Classes.Token import *
from Classes.Location import *
from Classes.Error import *
from Lexer import Lexer
def join(arr, d):
    out = ""
    for s in arr:
        out+=s+d
    return out
##############
#
#   The PreParser class is used to parse a raw text file into only preprocessor directives
#       like include, define, etc...
#   \see PreProcessor
#   \see Lexer
#############

class PreParser:
    def __init__(self, content, fname):
        self.content = content
        self.content += "\n"+chr(1)
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
                
        lex = Lexer(self.fname,self.content)
        directives = lex.getTokens(getDirectives=True)
        self.content = join(directives,"\n")+chr(1)
        while self.chidx < len(self.content)-1:
            
           if (self.ch == chr(1)):

               self.tokens.append(Token(T_EOF,T_EOF,self.loc.copy(),self.loc.copy()))
               return self.tokens

           elif (self.ch == "\n"):
               self.advance()
           elif (self.ch == "#"):
               self.parseDirective()
           elif(self.chidx < len(self.content)-1):
              self.advance()
        self.tokens.append(Token(T_EOF,T_EOF,self.loc.copy(),self.loc.copy()))

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
        while self.current_token.tok != T_EOF and self.tkidx < len(self.tokens)-1:
            if ( self.current_token.tok == T_KEYWORD):
                
                if ( self.current_token.value == "include"):

                    self.advance()
                    
                    if(self.current_token.tok == T_STRING):

                        path = self.current_token.value
                        print(f"[including: {path} ]")
                        with open(path, "rb") as f:
                            self.texts.append([f.read().decode(), path])
                            
                        pp = PreParser(self.texts[-1][0],path)
                        tokens = pp.getTokens()
                        i = 1
                        for t in tokens:
                            if(t.tok != T_EOF):
                                self.tokens.insert(self.tkidx+i, t)
                            i+=1
                        self.advance()
                    else:

                        print("Invalid Include ( %s ): %s"%(self.current_token, self.current_token.start))
                
                elif (self.current_token.value == "define"):
                    self.advance()
                    content = self.current_token.value.split(" ")
                    name = content[0]
                    content = join(content[1:]," ")

                    self.definitions.append((name,content))
                    self.advance()
                else:
                    pass
            
            

        


        for text in self.texts:
            for d in self.definitions:
                text[0] = text[0].replace(d[0],d[1])
        return self.texts

        
