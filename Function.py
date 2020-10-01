class Function:
    def __init__(self, name, parameters, returntype, compiler):
        self.name = name
        self.parameters = parameters
        self.returntype=returntype
        self.compiler = compiler

    def __repr__(self):
        return f"[ function {self.returntype} {self.name}( {self.parameters} ) ]"