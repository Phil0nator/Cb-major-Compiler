from Classes.Token import *
from Classes.Location import *
from Classes.Error import *
from Lexer import Lexer
def join(arr, d):
    out = ""
    for s in arr:
        out+=s+d
    return out

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

        self.tokens = tokens
        self.stack = 0
        self.current_token = tokens[0]
        self.tkidx = 0
        self.definitions = []

    def advance(self):
        self.tkidx+=1
        self.current_token = self.tokens[self.tkidx]

    def update(self):
        self.current_token = self.tokens[self.tkidx]


    def getDefn(self, name):
        for d in self.definitions:
            if d[0] == name:
                return d
        return None

    def checkToks(self, tok):
        if(self.current_token.tok not in tok):
            throw(ExpectedToken(self.current_token, tok))
    



    def buildIncludeStatement(self):
        self.tokens.remove(self.current_token)
        self.update()
        self.checkToks([T_STRING, T_INCLUDER])
        path = self.current_token.value
        self.tokens.remove(self.current_token)
        with open(path, "rb") as f:
            rawdata = f.read().decode()
        
        lex = Lexer(path,rawdata)
        tokens = lex.getTokens()
        #self.tokens.remove(self.current_token)
        self.tokens[self.tkidx:self.tkidx] = tokens[:-1]
        self.update()
        print(self.current_token)



    def process(self):
        while self.current_token.tok != T_EOF:
            if(self.current_token.tok == T_DIRECTIVE):
                # token is directive
                if(self.current_token.value == "include"):
                    # build include statement
                    self.buildIncludeStatement()

                elif(self.current_token.value == "define"):
                    # build define statement
                    pass



            else:
                self.advance()
        
        return self.tokens
        

        
