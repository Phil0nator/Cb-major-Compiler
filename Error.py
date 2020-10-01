class Error:
    def __init__(self, tok, message):
        self.tok = tok
        self.message = message
    
    def __repr__(self):
        return f"{self.message} {self.tok} at {self.tok.start}"


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
