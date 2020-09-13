def copy(s):
    out = ""
    for char in s:
        out+=char
    return out

class Location:
    def __init__(self, idx, ln, col, fn, ftext):
        self.idx=idx
        self.ln = ln
        self.col=col
        self.fn=fn
        self.ftext=ftext
        self.linesample = ""

    def advance(self, current_char):
        self.idx+=1
        self.col+=1


            
        if current_char == "\n":
            self.ln+=1
            self.col=0
            
            

        return self

    def copy(self):
        l= Location(self.idx,self.ln,self.col,self.fn,self.ftext)
        l.linesample="%s"%copy(self.linesample)
        return l

    def __repr__(self):
        return f"index: {self.idx}, line: {self.ln}, file: {self.fn}"

