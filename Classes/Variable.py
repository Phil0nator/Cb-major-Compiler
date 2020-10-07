class Variable:
    def __init__(self, t, name, glob=False, offset=0, initializer=None, isptr=False, mutable=True, signed = True, isStackarr = False):
        self.t = t
        self.name=name
        self.glob=glob
        self.offset=offset
        self.initializer = initializer
        self.isptr = isptr
        self.mutable = mutable
        self.signed = signed
        self.isStackarr = isStackarr
        self.stackarrsize = t.size(0)
        self.stackdims = isStackarr
        self.stacksizes = []

    def isflt(self):
        return (self.t.name == "float" or self.t.name == "double") and self.isptr == False

    def __repr__(self):
        if(self.isStackarr):
            return f"[Variable: {self.t} {self.name}[{self.stackarrsize}] @ {self.offset} -> {self.offset+self.stackarrsize}]]"
        else:
            return f"[ Variable: {self.t} {self.name} @ {(self.offset)}]"

    