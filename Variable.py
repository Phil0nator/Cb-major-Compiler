class Variable:
    def __init__(self, t, name, glob=False, offset=0x0, initializer=None, isptr=False):
        self.t = t
        self.name=name
        self.glob=glob
        self.offset=offset
        self.initializer = initializer
        self.isptr = isptr


    def __repr__(self):
        return f"[ Variable: {self.name} ]"

    