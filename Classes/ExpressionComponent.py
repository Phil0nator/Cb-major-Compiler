import config
from Assembly.Registers import REGISTERS
from globals import *
############################
#   The ExpressionComponent class is used to represent parts of a leftside expression.
#       It includes ID's, constants, operators, etc...
#
#   \see Function
#   \see Postfixer
###########################


class ExpressionComponent:
    def __init__(self, accessor, t, isoperation=False,
                 constint=False, token=None, memloc=None):
        self.type = t  # DType
        self.accessor = accessor  # value: any
        # \depricated
        self.inmem = False

        self.isoperation = isoperation  # if the object represents an operator: bool
        self.constint = constint  # if the object represents a constant integer value: bool
        self.token = token  # the token from which the compenent was originated

        self.memory_location = memloc

    def isRegister(self):  # bool
        return isinstance(
            self.accessor, str) and self.accessor in REGISTERS

    def isStackpop(self):  # bool
        return self.accessor == "pop"

    def isconstint(self):  # bool
        return isinstance(self.accessor, int)

    def __repr__(self):  # pretty print
        if(not self.isoperation):
            return f"[ EC: {self.type} {self.accessor} ]"
        else:
            return f"[ EC: {self.accessor} ]"

    def valueOf(self):  # getter
        return self.accessor
