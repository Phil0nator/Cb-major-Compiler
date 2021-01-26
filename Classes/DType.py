import config
from Classes.Error import *

literal = "&LITERAL&"


###########################
#   The DType class is used to represent datatypes.
#
############################


class DType:
    def __init__(self, name, size, members=None, ptrdepth=0,
                 signed=True, destructor=None, constructors=None, stackarr=False, operators=None,
                 function_template=None):
        self.name = name
        self.s = size  # base size if not pointer
        self.members = members  # for structures
        self.ptrdepth = ptrdepth  # how many layers of pointers are there
        # signed vs unsigned integers / chars/ bools/ etc...
        self.signed = signed
        self.destructor = destructor  # only for structures
        self.constructors = constructors  # only for structures
        self.stackarr = stackarr        # is stack-based array
        self.operators = operators if operators is not None else {}
        self.function_template = function_template  # function types

    def size(self, depth):  # determine the size at a given pointer depth
        if(depth < self.ptrdepth):
            return 8
        return self.s

    def isSigned(self, depth=0):
        if self.ptrdepth - depth == 0:
            return self.signed
        return False

    def csize(self):
        return self.size(0)

    

    def hasMember(self, name):  # structures
        for m in self.members:
            if m.name == name:
                return True
        return False

    def getMember(self, name):
        if(self.members is None):
            return None
        for m in self.members:
            if m.name == name:
                return m
        return None

    def load(self, other):  # accept properties of another DType object
        self.__init__(other.name, other.s, other.members.copy() if other.members is not None else None, other.ptrdepth,
                      other.signed, other.destructor, other.constructors, other.operators.copy(),
                      other.function_template.reset() if other.function_template is not None else None)

    def copy(self):  # duplicate
        return DType(self.name, self.s, members=(self.members.copy()) if self.members is not None else None, ptrdepth=self.ptrdepth,
                     signed=self.signed, constructors=self.constructors, destructor=self.destructor, operators=self.operators.copy(),
                     function_template=self.function_template.reset() if self.function_template is not None else None)

    def isflt(self):  # determine if at the current ptrdepth the type is a double/float
        return (config.GlobalCompiler.Tequals(
            self.name, "double") or config.GlobalCompiler.Tequals(
            self.name, "float")) and self.ptrdepth == 0 and not self.stackarr

    def isfltarr(self):
        return config.GlobalCompiler.Tequals(
            self.name, "double") and self.ptrdepth == 0

    def isfltdepth(self, depth):  # determine if the type is a double/float at a given depth
        return depth >= self.ptrdepth and config.GlobalCompiler.Tequals(
            self.name, "double")

    def down(self):
        out = self.copy()
        out.ptrdepth -= 1 * out.ptrdepth > 0
        return out

    def bottom(self):
        out = self.copy()
        out.ptrdepth = 0
        return out

    def up(self):
        out = self.copy()
        out.ptrdepth += 1
        return out

    def getOpOverload(self, op, param=None):
        if param is not None:
            if op not in self.operators:
                return None

            

            for overload in self.operators[op]:
                if overload.parameters[1].t.__eq__(param):
                    return overload

            return None

    def getConstructor(self, types):
        types = types[1:]
        for constructor in self.constructors:
            if len(types) == len(constructor.parameters)-1 and \
                 all((typematch(constructor.parameters[i+1].t,types[i], False) for i in range(len(constructor.parameters[1:])))):
                return constructor
        return None

    def getMemberFn(self, name, types):
        for member in self.members:
            if member.t.function_template is not None and member.name == name:
                fn = member.initializer
                if len(types) == len(fn.parameters)-1 and \
                    all((typematch(fn.parameters[i+1].t,types[i], False) for i in range(len(fn.parameters[1:])))):
                    return fn


    def isintrinsic(self):
        return self.ptrdepth != 0 or config.GlobalCompiler.isIntrinsic(
            self.name) is not None

    def __eq__(self, other):  # determine if this type is the same as another type (reguardless of typedefs)
        if(isinstance(other, DType)):
            return (other.name == literal and not self.isflt()) or (self.name == other.name or config.GlobalCompiler.Tequals(
                self.name, other.name)) and self.ptrdepth == other.ptrdepth and self.signed == other.signed
        else:
            return False

    def __repr__(self, safe=False):  # pretty print
        if not safe or self.function_template is None:
            if(self.signed):
                return f"{self.name}" + "." * self.ptrdepth
            else:
                return f"u{self.name}" + "." * self.ptrdepth
        elif safe:
            return f"function@{self.function_template.returntype.__repr__(safe)}~{'_'.join((p.t.__repr__(safe) for p in self.function_template.parameters))}~" + \
                "." * self.ptrdepth
        else:
            return f"{self.name}" + "." * self.ptrdepth


# layout for type precedence
# lower numbers = lower precedence
type_precedence = {

    "bool": 0,
    "char": 0,
    "unsigned char": 0,
    "unsigned bool": 0,
    "short": 1,
    "unsigned short": 1,
    "int": 2,
    "unsigned int": 2,
    "long": 3,
    "unsigned long": 3,
    "float": 4,
    "double": 4,
    "void": 5,
    "&LITERAL&": -1


}
# determine weather to cast a to b, or b to a based on precedence,
# pointerdepth, voids, etc...


def determinePrecedence(a, b, fn):
    # preq : must have typematch
    if(a.name not in type_precedence) or (b.name not in type_precedence):
        if(a.ptrdepth + b.ptrdepth == 0):
            throw(TypeMismatch(fn.current_token, a, b))

        if(a.ptrdepth > 0 and b.ptrdepth == 0 and not b.isflt()):
            return a, b
        else:
            return b, a

    if(type_precedence[a.name] > type_precedence[b.name] and a.ptrdepth == b.ptrdepth):

        return a, b
    elif(a.ptrdepth > 0 and b.__eq__(DType("void", 8, ptrdepth=1))) or (a.ptrdepth > 0 and b.__eq__(DType("void", 8, signed=False, ptrdepth=1))):

        return a, b

    else:

        return b, a


def fntypematch(a, b):

    if a.function_template is None or b.function_template is None:
        return False

    fna = a.function_template
    fnb = b.function_template

    if not typematch(fna.returntype, fnb.returntype, False):
        return False

    if len(fna.parameters) != len(fnb.parameters):
        return False

    return all(
        [
            typematch(fna.parameters[i].t, fnb.parameters[i].t, False) for i in range(len(fna.parameters))
        ]
    )

# determine if a and b are compatible for casting


def typematch(a, b, implicit):
    if(isinstance(a, DType) and isinstance(b, DType)):

        

        if(a.name == literal or b.name == literal):
            return True

        # anything can be cast to or from void
        if(config.GlobalCompiler.Tequals(a.name, "void") or config.GlobalCompiler.Tequals(b.name, "void")):
            return True

        if (a.function_template is not None or b.function_template is not None):
            return fntypematch(a, b)

        # two equal types are compatible
        if(a.__eq__(b)):
            return True
        # two variables with different pointer depths are not compatible (at
        # this point no void types)
        if a.ptrdepth != b.ptrdepth:
            return False

        # two equal types with different signs are compatible
        if(DType(a.name, a.size, a.members, a.ptrdepth, False, a.destructor, a.constructors).__eq__(DType(b.name, b.size, b.members, b.ptrdepth, False, b.destructor, b.constructors))):
            return True

        # two integer values are compatible in implicit situations
        if(not a.isflt() and not b.isflt() and implicit):
            return True

        if (a.isintrinsic() and b.isflt() and implicit):
            return True

        # two floats are compatible
        if(a.isflt() and b.isflt() and ((a.csize() == b.csize()) or (a.csize() > b.csize()))):
            return True

        #
        # elif(DType(a.name, a.size, None, a.ptrdepth, False).__eq__(DType(b.name, b.size, None, b.ptrdepth, False))):
        #    return True




        # if the type precedence checks out, they are compatible, else not
        if(a.isintrinsic() and b.isintrinsic()):
            if(type_precedence[a.name] >= type_precedence[b.name]):
                return True
            return False

    return False
