cc = {}
class Error:
    def __init__(self, start, end, error, details, tok):
        self.start=start
        self.end=end
        self.error=error
        self.details=details
        self.tok = tok
    def as_string(self):
        result = f'{self.error} on token : {self.tok}\nValue Given: {self.details}\n'
        result += f'File : {cc["LINDEX"][self.start.ln]}, line : {self.start.ln+1}'
        result += f"\n"
        return result

def throw(e):
    print(e.as_string())
    

    exit(1)

class UnexpectedTokenError(Error):
    def __init__(self, start, end, details, tok):
        super().__init__(start,end,"Unexpected Token", details, tok)

class InvalidVariableDeclarator(Error):
    def __init__(self, start, end, details, tok):
        super().__init__(start,end,"Invalid Variable Declaration", details, tok)

class UndefinedVariable(Error):
    def __init__(self, start, end, details, tok):
        super().__init__(start,end,"Unkown Reference to Variable", details, tok)

class InvalidFunctionDeclarator(Error):
    def __init__(self, start, end, details, tok):
            super().__init__(start,end,"Invalid Function Declaration", details, tok)

class InvalidFunctionParameterDeclaration(Error):
    def __init__(self, start, end, details, tok):
            super().__init__(start,end,"Invalid Function Parameter Declaration", details, tok)

class UnkownStatementInitiator(Error):
    def __init__(self, start, end, details, tok):
            super().__init__(start,end,"Unkown Statement Initiator", details, tok)

class EmptyFunction(Error):
    def __init__(self, start, end, details, tok):
            super().__init__(start,end,"Empty Function Declaration", details, tok)

class InvalidVariableAssignment(Error):
    def __init__(self, start, end, details, tok):
            super().__init__(start,end,"Invalid Variable Assignment", details, tok)

class ExpressionOverflow(Error):
    def __init__(self, start, end, details, tok):
            super().__init__(start,end,"Expression Overflow (Maximum of 32 temporaries)", details, tok)

class InvalidExpressionComponent(Error):
    def __init__(self, start, end, details, tok):
            super().__init__(start,end,"Invalid Expression Component", details, tok)

class InvalidParameter(Error):
    def __init__(self, start, end, details, tok):
            super().__init__(start,end,"Invalid Parameter", details, tok)

class InvalidFunctionReturnDestination(Error):
    def __init__(self, start, end, details, tok):
            super().__init__(start,end,"Invalid Function Return Destination", details, tok)

class EmptyIncludeStatement(Error):
    def __init__(self, start, end, details, tok):
            super().__init__(start,end,"Empty Include Statement", details, tok)

class InvalidDefinrdirective(Error):
    def __init__(self, start, end, details, tok):
            super().__init__(start,end,"Invalid Define Directive", details, tok)

class InvalidASMBlock(Error):
    def __init__(self, start, end, details, tok):
        super().__init__(start,end,"Invalid Assembly Block", details, tok)

class InvalidForBlockInit(Error):
    def __init__(self, start, end, details, tok):
        super().__init__(start,end,"Invalid For Block Header", details, tok)

class VariableReDeclaration(Error):
    def __init__(self, start, end, details, tok):
        super().__init__(start,end,"Variable redeclared before leaving scope", details, tok)

class InvalidStructureDeclaration(Error):
    def __init__(self, start, end, details, tok):
        super().__init__(start,end,"Invalid Structure declaration", details, tok)

class InvalidCMPBlockHeader(Error):
    def __init__(self, start, end, details, tok):
        super().__init__(start,end,"Invalid CMP Block Header", details, tok)

class UndefinedFunction(Error):
    def __init__(self, start, end, details, tok):
            super().__init__(start,end,"Undefined Function", details, tok)

class InvalidMemberAccess(Error):
    def __init__(self, start, end, details, tok):
        super().__init__(start,end,"Invalid Member Access", details, tok)

class InvalidIFHeader(Error):
    def __init__(self, start, end, details, tok):
        super().__init__(start,end,"Invalid if structure header", details, tok)

class InvalidStackspaceAllocator(Error):
    def __init__(self, start, end, details, tok):
        super().__init__(start,end,"Invalid Stackspace Allocator", details, tok)

class InvalidLabelDeclaration(Error):
    def __init__(self, start, end, details, tok):
        super().__init__(start,end,"Invalid Label Declarator", details, tok)

class MissingSemiColon(Error):
    def __init__(self, start, end, details, tok):
        super().__init__(start,end,"Missing Semicolon on end of line", details, tok)

class InvalidLefthandExpression(Error):
    def __init__(self, start, end, details, tok):
        super().__init__(start,end,"Invalid Left Hand Expression", details, tok)