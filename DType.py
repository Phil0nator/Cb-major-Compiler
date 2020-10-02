class DType:
    def __init__(self, name, size, members=None, ptrdepth=0):
        self.name=name
        self.s=size
        self.members=members
        self.ptrdepth = ptrdepth

    def size(self, depth):
        if(depth < self.ptrdepth):
            return 8
        return self.s
    
    def copy(self):
        return DType(self.name,self.size,members=self.members,ptrdepth=self.ptrdepth)


    def __eq__(self, other):
        if(isinstance(other, DType)):
            return self.name == other.name
        else:
            return False

    def __repr__(self):
        return f"{self.name}"+"."*self.ptrdepth