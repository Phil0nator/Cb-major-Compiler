class Error:
    def __init__(self, tok, message):
        self.tok = tok
        self.message = message
    
    def __repr__(self):
        return f"Compiletime Error: \n\t{self.message} \n\t\t{self.tok} at: \n\t{self.tok.start}"


def throw(error):
    print(error)
    exit(1)


class UnexepectedEOFError(Error):
    def __init__(self, tok):
        self.tok = tok
        self.message = "Unexpected EOF: "


class UnexpectedIdentifier(Error):
    def __init__(self,tok):
        self.tok=tok
        self.message = "Unexpected Indentifier: "

class ExpectedIdentifier(Error):
    def __init__(self,tok):
        self.tok=tok
        self.message = "Expected Indentifier: "

class ExpectedSemicolon(Error):
    def __init__(self,tok):
        self.tok=tok
        self.message = "Expected Semicolon: "

class UnexpectedToken(Error):
    def __init__(self, tok):
        self.tok=tok
        self.message = "Unexpected Token: "

class IntrinsicRequired(Error):
    def __init__(self, tok):
        self.tok=tok
        self.message = "An Intrinsic Type was required: "

class ExpectedValue(Error):
    def __init__(self,tok):
        self.tok=tok
        self.message = "Expected Value: "

class InvalidConstant(Error):
    def __init__(self,tok):
        self.tok=tok
        self.message = "Invalid Constant (constants may only be primitive, non-pointer values): "


class ExpectedType(Error):
    def __init__(self,tok):
        self.tok=tok
        self.message = "Expected Type: "

class ExpectedParethesis(Error):
    def __init__(self,tok):
        self.tok=tok
        self.message = "Expected Parethesis: "

class ExpectedComma(Error):
    def __init__(self,tok):
        self.tok=tok
        self.message = "Expected Comma: "

class ExpectedToken(Error):
    def __init__(self,tok,exp):
        self.tok=tok
        self.message = "Expected token ( '%s' ) :"%exp



class UnkownIdentifier(Error):
    def __init__(self,tok):
        self.tok=tok
        self.message = "Unkown Identifier: "

class UnkownFunction(Error):
    def __init__(self, tok, name, types):
        self.tok=tok
        self.message = f"Unkown function {name} with parameter types {types} :"

class InvalidSignSpecifier(Error):
    def __init__(self, tok):
        self.tok=tok
        self.message = f"Invalid sign specifier ( only integral non-sse types may be specified as unsigned ): "