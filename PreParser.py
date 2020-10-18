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
        self.definitions = []                   # definition: [str:name, tokens[]]

    def advance(self):
        self.tkidx+=1
        self.current_token = self.tokens[self.tkidx]

    def update(self):
        self.current_token = self.tokens[self.tkidx]

    def delmov(self):
        self.tokens.remove(self.current_token)
        self.update()


    def getDefn(self, name):
        for d in self.definitions:
            if d[0] == name:
                return d
        return None

    def checkToks(self, tok):
        if(self.current_token.tok not in tok):
            throw(ExpectedToken(self.current_token, tok))
    
    def loadRaw(self, path):
        with open(path, "rb") as f:
            rawdata = f.read().decode()
        return rawdata

    def buildIncludeStatement(self):
        self.delmov()

        self.checkToks([T_STRING, T_INCLUDER])
        path = self.current_token.value
        rawdata = self.loadRaw(path)
        
        lex = Lexer(path,rawdata)
        tokens = lex.getTokens()
        self.tokens[self.tkidx:self.tkidx] = tokens[:-1]
        self.delmov()


    def buildDefine(self):
        self.delmov()
        self.checkToks([T_ID])
        name = self.current_token.value
        self.delmov()


        definitionTokens = [self.current_token]
        line = self.current_token.start.line
        self.delmov()
        while(self.current_token.start.line == line):
            definitionTokens.append(self.current_token)
            self.delmov()
        
        self.definitions.append([name, definitionTokens])

    def checkDefn(self):
        dq = self.getDefn(self.current_token.value)
        if(dq == None): 
            self.advance()
            return
        self.delmov()
        self.tokens[self.tkidx:self.tkidx] = dq[1]
    
    def buildifdef(self):
        self.delmov()
        self.checkToks([T_ID])
        q =self.getDefn( self.current_token.value )
        if(q == None):
            while not (self.current_token.tok == T_DIRECTIVE and self.current_token.value == "endif"):
                self.delmov()
        else:
            self.delmov()


    def buildifndef(self):
        self.delmov()
        self.checkToks([T_ID])
        q = self.getDefn(self.current_token.value)
        if(q == None):
            self.delmov()
        else:
            while not (self.current_token.tok == T_DIRECTIVE and self.current_token.value == "endif"):
                self.delmov()


    def process(self):
        while self.current_token.tok != T_EOF:
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
        
        return self.tokens
        

        
