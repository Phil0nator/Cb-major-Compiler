from Variable import Variable
class ExpressionComponent:
    def __init__(self, accessor, t, isoperation=False,  constint=False):
        self.type = t
        self.accessor = accessor
        self.inmem = False
        self.isoperation = isoperation
        self.constint = constint
        if(isinstance(accessor, Variable)):
            self.inmem = True
    def isRegister(self):
        return isinstance(self.type, str) and self.type == "register" 

    def isconstint(self):
        return self.constint != False

    def __repr__(self):
        if(not self.isoperation):
            return f"[ EC: {self.type} {self.accessor} ]"
        else:
            return f"[ EC: {self.accessor} ]"
    def valueOf(self):
        return self.accessor