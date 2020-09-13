


class Declaration:
    def __init__(self, name, offset, isfloat):
        self.name = name
        self.offset = offset
        self.isfloat = isfloat
        self.isarr= False #refering specifically to stack arrays, not malloc heap memory
    def __repr__(self):
        return f"{self.name} : {str(self.offset)}\t isfloat: {self.isfloat}"
        


