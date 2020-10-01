class Variable:
    def __init__(self, t, name, glob=False, offset=0x0, initializer=None):
        self.t = t
        self.name=name
        self.glob=glob
        self.offset=offset
        self.initializer = initializer
    


    def __repr__(self):
        return f"[ Variable: {self.name} ]"

    