class Location:
    def __init__(self, file, line, ch):
        self.file = file
        self.line = line
        self.ch = ch

    def copy(self):
        return Location(self.file,self.line,self.ch)

    def __repr__(self):
        return f"[ file: {self.file} , Line: {self.line}, char: {self.ch} ]"