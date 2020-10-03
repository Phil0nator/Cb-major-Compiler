class DType:
    def __init__(self, name, size, members=None, ptrdepth=0, signed=True):
        self.name=name
        self.s=size
        self.members=members
        self.ptrdepth = ptrdepth
        self.signed = signed

    def size(self, depth):
        if(depth < self.ptrdepth):
            return 8
        return self.s
    
    def copy(self):
        return DType(self.name,self.s,members=self.members,ptrdepth=self.ptrdepth, signed=self.signed)

    def isflt(self):
        return self.name == "float" or self.name == "double"

    def __eq__(self, other):
        if(isinstance(other, DType)):
            return self.name == other.name
        else:
            return False

    def __repr__(self):
        if(self.signed):
            return f"{self.name}"+"."*self.ptrdepth
        else:
            return f"u{self.name}"+"."*self.ptrdepth