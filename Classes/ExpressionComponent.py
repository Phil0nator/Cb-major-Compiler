import config
class ExpressionComponent:
    def __init__(self, accessor, t, isoperation=False,  constint=False, token=None):
        self.type = t
        self.accessor = accessor
        self.inmem = False
        self.isoperation = isoperation
        self.constint = constint
        self.token = token

    def isRegister(self):
        return isinstance(self.accessor, str) and self.accessor in config.REGISTERS  

    def isStackpop(self):
        return self.accessor == "pop"

    def isconstint(self):
        return self.constint != False

    def __repr__(self):
        if(not self.isoperation):
            return f"[ EC: {self.type} {self.accessor} ]"
        else:
            return f"[ EC: {self.accessor} ]"
    def valueOf(self):
        return self.accessor