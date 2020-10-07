import config
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



    def load(self, other):
        self.__init__(other.name,other.s,other.members,other.ptrdepth,other.signed)

    def copy(self):
        return DType(self.name,self.s,members=self.members,ptrdepth=self.ptrdepth, signed=self.signed)

    def isflt(self):
        return config.GlobalCompiler.Tequals(self.name, "double") and self.ptrdepth==0

    def isfltdepth(self, depth):
        return depth >= self.ptrdepth and config.GlobalCompiler.Tequals(self.name, "double")

    def __eq__(self, other):
        if(isinstance(other, DType)):
            return (self.name == other.name or config.GlobalCompiler.Tequals(self.name, other.name)) and self.ptrdepth == other.ptrdepth and self.signed == other.signed 
        else:
            return False

    def __repr__(self):
        if(self.signed):
            return f"{self.name}"+"."*self.ptrdepth
        else:
            return f"u{self.name}"+"."*self.ptrdepth

type_precedence = {

    "bool":0,
    "char":0,
    "unsigned char": 1,
    "unsigned bool": 1,
    "int" :2,
    "unsigned int":3,
    "double":4,
    "void":5


}

def determinePrecedence(a, b):
    # preq : must have typematch
    if(type_precedence[a.name] > type_precedence[b.name] and a.ptrdepth == b.ptrdepth):
        
        
        return a, b
    elif(a.ptrdepth > 0 and b.__eq__(DType("int", 8))) or (a.ptrdepth>0 and b.__eq__(DType("int",8,signed=False))):

        return a, b
    
    else:
        
        return b, a


