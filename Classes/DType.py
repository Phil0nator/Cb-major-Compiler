import config
from Classes.Error import *

###########################
#   The DType class is used to represent datatypes.
#
############################
class DType:
    def __init__(self, name, size, members=None, ptrdepth=0, signed=True):
        self.name=name
        self.s=size # base size if not pointer
        self.members=members # for structures
        self.ptrdepth = ptrdepth # how many layers of pointers are there
        self.signed = signed # signed vs unsigned integers / chars/ bools/ etc...

    def size(self, depth): # determine the size at a given pointer depth
        if(depth < self.ptrdepth):
            return 8
        return self.s
    
    def csize(self):
        return self.size(0)

    def hasMember(self, name): # structures
        for m in self.members:
            if m.name == name: return True
        return False
    
    def getMember(self, name):
        for m in self.members:
            if m.name == name: return m
        return None

    def load(self, other): # accept properties of another DType object
        self.__init__(other.name,other.s,other.members,other.ptrdepth,other.signed)

    def copy(self): # duplicate
        return DType(self.name,self.s,members=self.members,ptrdepth=self.ptrdepth, signed=self.signed)

    def isflt(self): # determine if at the current ptrdepth the type is a double/float
        return config.GlobalCompiler.Tequals(self.name, "double") and self.ptrdepth==0

    def isfltdepth(self, depth): # determine if the type is a double/float at a given depth
        return depth >= self.ptrdepth and config.GlobalCompiler.Tequals(self.name, "double")

    def __eq__(self, other): # determine if this type is the same as another type (reguardless of typedefs)
        if(isinstance(other, DType)):
            return (self.name == other.name or config.GlobalCompiler.Tequals(self.name, other.name)) and self.ptrdepth == other.ptrdepth and self.signed == other.signed 
        else:
            return False

    def __repr__(self): # pretty print
        if(self.signed):
            return f"{self.name}"+"."*self.ptrdepth
        else:
            return f"u{self.name}"+"."*self.ptrdepth

# layout for type precedence
# lower numbers = lower precedence
type_precedence = {

    "bool":0,
    "char":0,
    "unsigned char": 1,
    "unsigned bool": 1,
    "short":2,
    "unsigned short":3,
    "int" :4,
    "unsigned int":5,
    "double":6,
    "void":7


}
# determine weather to cast a to b, or b to a based on precedence, pointerdepth, voids, etc...
def determinePrecedence(a, b, fn):
    # preq : must have typematch
    if( a.name not in type_precedence) ^ (b.name not in type_precedence): throw(TypeMismatch(fn.current_token,a,b))
    if(type_precedence[a.name] > type_precedence[b.name] and a.ptrdepth == b.ptrdepth):
        
        
        return a, b
    elif(a.ptrdepth > 0 and b.__eq__(DType("int", 8))) or (a.ptrdepth>0 and b.__eq__(DType("int",8,signed=False))):

        return a, b
    
    else:
        
        return b, a


