# represent a position in a file
class Location:
    def __init__(self, file, line, ch):
        self.file = file # filename
        self.line = line # line of file
        self.ch = ch     # char of file

    def copy(self): # duplicate
        return Location(self.file,self.line,self.ch)

    def __repr__(self): # pretty print
        return f" \n\tfile: {self.file},\n\tLine: {self.line},\n\tchar: {self.ch} \n"