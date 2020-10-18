from Classes.Token import *
from Classes.Location import Location
from Classes.Error import *
from Lexer import Lexer
from config import include_directories
import os
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

        self.tokens = tokens                    # all tokens
        self.current_token = tokens[0]          # current token
        self.tkidx = 0                          # current position
        self.definitions = []                   # definition: [str:name, tokens[]]
        self.dels = 0                           # number of tokens deleted
    def advance(self):
        self.tkidx+=1
        self.current_token = self.tokens[self.tkidx]

    def update(self):                           # correct current_token to potentially changed index
        self.current_token = self.tokens[self.tkidx]

    def delmov(self):                           # delete current token, and move to the next
        self.tokens[self.tkidx] = None
        self.advance()
        self.dels+=1


    def getDefn(self, name):                    # get a definition by name
        for d in self.definitions:
            if d[0] == name:
                return d
        return None

    def checkToks(self, tok):                   # check for specific tokens
        if(self.current_token.tok not in tok):
            throw(ExpectedToken(self.current_token, tok))
    
    def loadRaw(self, path):
                            # load a raw file based on a given path
        rawdata = None
        for p in include_directories:
            try:
                with open(f"{p}/{path}", "rb") as f:
                    rawdata = f.read().decode()
                    include_directories.append(os.path.realpath(f"{p}/{path}"))
            except:
                pass
        #config.raw_filedata.append([rawdata,path])
        return rawdata

    def buildIncludeStatement(self):            # #include directive
        self.delmov()

        self.checkToks([T_STRING, T_INCLUDER])
        path = self.current_token.value
        rawdata = self.loadRaw(path)
        
        lex = Lexer(path,rawdata)
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
            self.definitions.append([name, [Token(T_INT, 0, self.current_token.start,self.current_token.end)]])
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
        if(dq == None): 
            self.advance()
            return
        self.delmov()
        self.tokens[self.tkidx:self.tkidx] = dq[1]
    
    # #ifdef directive
    def buildifdef(self):
        self.delmov()
        self.checkToks([T_ID])
        q =self.getDefn( self.current_token.value )
        if(q == None):
            while not (self.current_token.tok == T_DIRECTIVE and self.current_token.value == "endif"):
                self.delmov()
        else:
            self.delmov()

    # #ifndef directive
    def buildifndef(self):
        self.delmov()
        self.checkToks([T_ID])
        q = self.getDefn(self.current_token.value)
        if(q == None):
            self.delmov()
        else:
            while not (self.current_token.tok == T_DIRECTIVE and self.current_token.value == "endif"):
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
        

        
