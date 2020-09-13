import sys
from Lexer import *
from errors import *


'''
#The PreLexer class works the same as the Lexer class, but it is designed to look for things only significant to the preprocessor.
'''
class PreLexer:
    def __init__(self, fn ,text, filename):
        self.fn = fn
        self.text=text
        self.loc = Location(-1,0,-1,fn,text)
        self.current_char = None
        self.filename = filename
        for line in text.split("\n"):
            cc["LINDEX"].append(self.filename)
        self.advance()

    def advance(self):
        self.loc.advance(self.current_char)
        self.current_char = self.text[self.loc.idx] if self.loc.idx < len(self.text) else None

    def make_tokens(self):
        tokens = []


        while self.current_char != None:
            if(self.current_char in ' \t'):#ignore whitespace 
                self.advance()
            elif (self.current_char == "#" or self.current_char in ID_CHARS):

                
                tokens.append(self.make_identifier())
            
            
            
            elif(self.current_char in T_NUMBERS):
                tokens.append(self.make_number())
            elif (self.current_char == "\""):
                tokens.append(self.make_string())
            else:
                self.advance()
        tokens.append(Token(T_EOF, start=self.loc))      

        return tokens, None

    def make_number(self):
        num = ''
        dots = 0
        start=self.loc.copy()
        while self.current_char != None and self.current_char in T_NUMBERS + '.':
            if self.current_char == ".":
                if dots == 1: break #two decimals in one number??
                dots+=1
                num+="."
            else:
                num+=self.current_char
            self.advance()
        if(not num.startswith("-") and "-" in num) or (num == "-"):
            print("Invalid Integer value: "+num)
            exit(1)
        if(dots==0):
            return Token(T_INT, value=int(num), start=start,end=self.loc)
        else:
            return Token(T_FLOAT,value=float(num), start=start,end=self.loc)


    

            
    def make_string(self):
        out = ''
        start = self.loc.copy()
        self.advance()
        esc = False
        while self.current_char != None and self.current_char != "\"":
            if (self.current_char == "\\"):
                esc=True
            else:
                if(esc):
                    esc=False
                    out += ESCAPE_CHARS[self.current_char]
                else:
                    out+=self.current_char

            self.advance()

        self.advance()
        return Token(T_STRING,value=out,start=start,end=self.loc)

    def make_identifier(self):
        out = ''
        start = self.loc.copy()
        while self.current_char !=None and self.current_char in ID_CHARS+"#":
            out+=self.current_char
            
            self.advance()
        
        if out in KEYWORDS:
            _type = T_KEYWORD
            if(out == "true" or out == "false"):
                _type = T_BOOLEAN
                out = -int(out=="true")
        else:
            _type = T_ID

        return Token(_type, value=out,start=start,end=self.loc)




'''
#The Preprocessor uses similar conventions as the compiler to handle directives like #include, #define, #ifdef, etc...
#The Preprocessor will directly edit the text that will go on to be tokenized and compiled
'''

class Preprocessor:
    def __init__(self, data, cc, fn):
        self.data = data.replace("\t", " ").replace("\r","")
        self.cc = cc
        self.filename = self.cc["FILES"][0]
        self.lexer = PreLexer(0,data, self.filename)
        self.tokens, error = self.lexer.make_tokens()

        self.current_token = self.tokens[0]
        self.ifstack = 0
        self.ct_idx = 0

        print(self.filename)

    def advance(self):
        self.ct_idx+=1
        self.current_token=self.tokens[self.ct_idx]
    
    def fileExists(self, file):
        for f in self.cc["FILES"]:
            if f == file:
                return True
        return False 
    
    def isDefined(self, name):
        for d in cc["DEF"]:
            for n in d:
                if n == name:
                    return True
        return False
    
    def buildInclude(self):
        self.advance()
        if(self.current_token.tok != T_STRING):
            throw(EmptyIncludeStatement(self.current_token.start,self.current_token.end,self.current_token.value, self.current_token.tok))
        
        file = self.current_token.value

        if(self.fileExists(file)):
            self.data=self.data.replace("#include \""+file+"\"", "\n",1)
            self.advance()
            return

        self.cc["FILES"].insert(0,file)
        if("include:" in file):
            with open("include/"+file.replace("include:",""), "rb") as f:
                newdata = pre_process(f.read().decode(),self.cc)
        else:
            try:
                with open(file, "rb") as f:
                    newdata = pre_process(f.read().decode(),self.cc)
            except:
                

                print("File does not exist: %s"%file)
                exit(1)
        self.data=self.data.replace("\"%s\""%file, "\n",1)
        self.data=self.data.replace("#include","\n"+newdata+"\n"+chr(3), 1)
        self.advance()

    def buildDefine(self):
        self.advance()
        if(self.current_token.tok != T_ID):
            throw(InvalidDefinrdirective(self.current_token.start.idx,self.current_token.end,self.current_token.value, self.current_token.tok))
        id = self.current_token.value
        self.advance()
        if(self.current_token.tok in T_INT+T_FLOAT+T_STRING+T_BOOLEAN):
            self.data=self.data.replace("#define "+id+" "+str(self.current_token.value),"",1)
            
            cc["DEF"].append({id:str(self.current_token.value)})
            self.advance()
        else:
            cc["DEF"].append({id:None})

    def buildIfndef(self):
        self.advance()
        if(self.current_token.tok != T_ID):
            throw(InvalidDefinrdirective(self.current_token.start.idx,self.current_token.end,self.current_token.value, self.current_token.tok))
        id = self.current_token.value
        ifdefmarker = "&CIFD%s&"%self.ifstack
        endifmarker = "&EIF%s&"%self.ifstack
        self.ifstack+=1
        self.data = self.data.replace("#ifndef %s"%id, ifdefmarker, 1)
        if(not self.isDefined(id)):
            self.advance()
            self.data = self.data.replace("#endif","",1)
            self.data = self.data.replace(ifdefmarker,"")
            self.ifstack-=1
            return

        else:
            while (not(self.current_token.tok == T_KEYWORD and self.current_token.value=="#endif")):
                self.advance()
            self.data = self.data.replace("#endif",endifmarker,1)
            self.advance()
            
        start = self.data.find(ifdefmarker)
        end = self.data.find(endifmarker)
        self.data = self.data[0:start] + self.data[end+len(endifmarker):len(self.data)-1]
        
        self.data = self.data.replace(endifmarker,"")
        self.data = self.data.replace(ifdefmarker,"")
        self.ifstack-=1

    def buildIfdef(self):
        self.advance()
        if(self.current_token.tok != T_ID):
            throw(InvalidDefinrdirective(self.current_token.start.idx,self.current_token.end,self.current_token.value, self.current_token.tok))
        id = self.current_token.value
        ifdefmarker = "&CIFD%s&"%self.ifstack
        endifmarker = "&EIF%s&"%self.ifstack
        self.ifstack+=1
        self.data = self.data.replace("#ifdef %s"%id, ifdefmarker, 1)
        if(self.isDefined(id)):
            self.advance()
            self.data = self.data.replace("#endif","",1)
            self.data = self.data.replace(ifdefmarker,"")
            self.ifstack-=1
            return

        else:
            while (not(self.current_token.tok == T_KEYWORD and self.current_token.value=="#endif")):
                self.advance()
            self.data = self.data.replace("#endif",endifmarker,1)
            self.advance()
            
        start = self.data.find(ifdefmarker)
        end = self.data.find(endifmarker)
        self.data = self.data[0:start] + self.data[end+len(endifmarker):len(self.data)-1]
        
        self.data = self.data.replace(endifmarker,"")
        self.data = self.data.replace(ifdefmarker,"")
        self.ifstack-=1

    def process(self):
        while self.current_token.tok != T_EOF:
            if(self.current_token.tok == T_KEYWORD):
                if(self.current_token.value == "#include"):
                    self.buildInclude()
                elif(self.current_token.value == "#define"):
                    self.buildDefine()
                elif (self.current_token.value == "#ifdef"):
                    self.buildIfdef()
                elif (self.current_token.value == "#ifndef"):
                    self.buildIfndef()
                else:
                    self.advance()
            else:
                self.advance()

        for d in cc["DEF"]:
            for id in d:
                self.data=self.data.replace(id,d[id])

        return self.data


def pre_process(data,cc):
    prep = Preprocessor(data,cc, 0)


    return prep.process()