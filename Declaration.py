


class Declaration:
    def __init__(self, name, offset, t):
        self.name = name
        self.offset = offset
        self.t = t
        self.isfloat = (t=="float"or t=="double")
        self.isarr= False #refering specifically to stack arrays, not malloc heap memory
    def __repr__(self):
        return f"{self.name} : {str(self.offset)}\t isfloat: {self.t}"
        


