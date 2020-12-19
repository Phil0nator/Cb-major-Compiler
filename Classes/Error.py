import config
from colorama import Fore, Style
from termcolor import colored
error_indicator = f"{Fore.RED}{Style.BRIGHT}"


class Error:
    def __init__(self, tok, message):
        self.tok = tok
        self.message = message

    def __repr__(self):

        # build pretty print error message
        line = self.tok.start.line + 1
        file = self.tok.start.file
        char = self.tok.start.ch
        diff = self.tok.end.ch - char

        file = config.loadRawFile(file, None)

        # file = file[0:char] + error_indicator + \
        #    file[char:self.tok.end.ch] + Style.RESET_ALL + file[char + diff:-1]

        lines = file.split("\n")
        # determine number of characters before error token on given line
        line -= lines[0] != ""
        beginchars = lines[line - 1].find(str(self.tok.value))

        lines[line - 1] = lines[line - 1].replace(
            str(self.tok.value), f"{error_indicator}{self.tok.value}{Style.RESET_ALL}", 1)
        lp = ""
        try:
            if(len(lines) > 1 and line >= 1):
                lp += f"|{line-1}\t" + lines[line - 2] + "\n"
            if(line != len(lines) - 1 and len(lines) > 1):
                lp += f"|{line}\t" + lines[line - 1] + "\n"
        except IndexError:
            pass

        # highlight problem token
        problem = lp
        # add underline
        problem += f"  \t{error_indicator}{' '*beginchars}^{'~'*(self.tok.end.ch-self.tok.start.ch-1)}{Style.RESET_ALL}"

        # return f"{Fore.RED}{Style.BRIGHT}Compiletime Error:{Style.RESET_ALL}
        # \n\t{Style.BRIGHT} {self.message} {Style.RESET_ALL}
        # \n\t\t{error_indicator}{self.tok}{Style.RESET_ALL} at:
        # \n\n{problem}\n\t{Style.BRIGHT}{self.tok.start}{Style.RESET_ALL}"
        return f"{Style.BRIGHT}cbm: {self.tok.start.file}:{line}:{self.tok.start.ch}: {Fore.RED}fatal error: {self.message}{Style.RESET_ALL} {self.tok}:\n{problem}"


def throw(error):
    print(error)
    #config.GlobalCompiler.panicmode = True
    exit(1)


def warn(warning):
    print(warning) if not config.__nowarn__ else None


class FileNotFound(Error):
    def __init__(self, tok, path):
        self.tok = tok
        self.message = f"File '{path}' not found: "


class UnexepectedEOFError(Error):
    def __init__(self, tok):
        self.tok = tok
        self.message = "Unexpected EOF: "


class UnkownCharSequence(Error):
    def __init__(self, tok):
        self.tok = tok
        self.message = "Unkown Character Sequence: "


class UnexpectedIdentifier(Error):
    def __init__(self, tok):
        self.tok = tok
        self.message = "Unexpected Indentifier: "


class ExpectedIdentifier(Error):
    def __init__(self, tok):
        self.tok = tok
        self.message = "Expected Indentifier: "


class ExpectedSemicolon(Error):
    def __init__(self, tok):
        self.tok = tok
        self.message = "Expected Semicolon: "


class UnexpectedToken(Error):
    def __init__(self, tok):
        self.tok = tok
        self.message = "Unexpected Token: "


class IntrinsicRequired(Error):
    def __init__(self, tok):
        self.tok = tok
        self.message = "An Intrinsic Type was required: "


class ExpectedValue(Error):
    def __init__(self, tok):
        self.tok = tok
        self.message = "Expected Value: "


class InvalidConstant(Error):
    def __init__(self, tok):
        self.tok = tok
        self.message = "Invalid Constant (constants may only be primitive, non-pointer values): "


class ExpectedType(Error):
    def __init__(self, tok):
        self.tok = tok
        self.message = "Expected Type: "


class ExpectedParethesis(Error):
    def __init__(self, tok):
        self.tok = tok
        self.message = "Expected Parethesis: "


class ExpectedComma(Error):
    def __init__(self, tok):
        self.tok = tok
        self.message = "Expected Comma: "


class ExpectedToken(Error):
    def __init__(self, tok, exp):
        self.tok = tok
        self.message = "Expected token ( '%s' ) :" % exp


class UnkownIdentifier(Error):
    def __init__(self, tok):
        self.tok = tok
        self.message = "Unkown Identifier: "


class UnkownFunction(Error):
    def __init__(self, tok, name, types):
        self.tok = tok
        self.message = f"Unkown function {name} with parameter types {types} :"


class InvalidSignSpecifier(Error):
    def __init__(self, tok):
        self.tok = tok
        self.message = f"Invalid sign specifier ( only integral non-sse types may be specified as unsigned ): "


class NonbooleanIf(Error):
    def __init__(self, tok):
        self.tok = tok
        self.message = f"Non-boolean value used to determine if statement: "


class TypeMismatch(Error):
    def __init__(self, tok, a, b):
        self.tok = tok
        self.message = f"Invalid implicit typecast from {b} to {a} :"


class AddressOfConstant(Error):
    def __init__(self, tok):
        self.tok = tok
        self.message = f"Taking address of constant value: "


class UnkownType(Error):
    def __init__(self, tok):
        self.tok = tok
        self.message = f"Unkown Type: "


class UnkownExpressionShortcut(Error):
    def __init__(self, tok):
        self.tok = tok
        self.message = f"Unkown expression shortcut: "


class TakingIndexOfScalar(Error):
    def __init__(self, tok):
        self.tok = tok
        self.message = f"Cannot take index of scalar: "


class UsingFloatAsIndex(Error):
    def __init__(self, tok):
        self.tok = tok
        self.message = f"Cannot use a float value as index: "


class VariableRedeclaration(Error):
    def __init__(self, tok, v):
        self.tok = tok
        self.message = f"Existing declaration for variable [{v}] :"


class InvalidOperationOperands(Error):
    def __init__(self, tok, op, a, b):
        self.tok = tok
        self.message = f"Invalid operation [ '{op}' ] for operands of type [ '{a}', '{b}' ] :"


class UsingTypenameAsVariable(Error):
    def __init__(self, tok):
        self.tok = tok
        self.message = f"Cannot use typename as variable name: "


class HangingOperator(Error):
    def __init__(self, tok):
        self.tok = tok
        self.message = f"Invalid expression due to hanging operator: "


class UnmatchedBreak(Error):
    def __init__(self, tok):
        self.tok = tok
        self.message = f"Unmatched break: "


class InvalidSimdOperation(Error):
    def __init__(self, tok, operation):
        self.tok = tok
        self.message = f"Cannot perform SIMD operation ( '{operation} ') on integers: "


class TokenMismatch(Error):
    def __init__(self, tok):
        self.tok = tok
        self.message = f"Unmatched token: "


class SetLiteralSizeMismatch(Error):
    def __init__(self, tok):
        self.tok = tok
        self.message = f"Set literal size mismatch: "


class InvalidExpressionComponent(Error):
    def __init__(self, tok):
        self.tok = tok
        self.message = f"Invalid expression component: "


class InvalidDestination(Error):
    def __init__(self, tok):
        self.tok = tok
        self.message = f"Invalid assignment destination: "


class ExpectedLValue(Error):
    def __init__(self, tok):
        self.tok = tok
        self.message = f"Expected Rightside Expression: "


class RegsiterStructure(Error):
    def __init__(self, tok):
        self.tok = tok
        self.message = f"Cannot create structure in register: "


class GlobalDeletion(Error):
    def __init__(self, tok):
        self.tok = tok
        self.message = f"Cannot delete global variable: "


class NonRegisterDeletion(Error):
    def __init__(self, tok):
        self.tok = tok
        self.message = f"Could not delete non-register variable: "


class AssigningExternedValue(Error):
    def __init__(self, tok):
        self.tok = tok
        self.message = f"Cannot assign extern'd identifier: "


class RecursiveInlineCall(Error):
    def __init__(self, tok):
        self.tok = tok
        self.message = f"Inline functions cannot be recursive: "


class UnkownDirective(Error):
    def __init__(self, tok):
        self.tok = tok
        self.message = f"Unkown precompile directive: "


class UnmatchedTernary(Error):
    def __init__(self, tok):
        self.tok = tok
        self.message = f"Unmatched ternary operator: "


class UseOfIncompleteType(Error):
    def __init__(self, tok, t):
        self.tok = tok
        self.message = f"Invalid use of incomplete type ('{t}'): "


class VariableTemplate(Error):
    def __init__(self, tok):
        self.tok = tok
        self.message = f"Cannot build template of variable:"


class DivisionByZero(Error):
    def __init__(self, tok):
        self.tok = tok
        self.message = f"Cannot divide by zero:"


class Warning:
    def __init__(self, tok, msg):
        self.msg = msg
        self.tok = tok

    def __repr__(self):

        start = f"{Style.BRIGHT}{Fore.MAGENTA}Warning! :{Style.RESET_ALL}"

        locline = f"{Style.BRIGHT}{self.tok.start.file}:{self.tok.start.line}:{self.tok.start.ch}{Style.RESET_ALL}"

        return f"{start}{self.msg}{locline}"


class RegisterDeclWarning(Warning):
    def __init__(self, tok):
        self.tok = tok
        self.msg = "Too many register declarations at: "


class NoReturnStatement(Warning):
    def __init__(self, tok, fn):
        self.tok = tok
        self.msg = f"No guaranteed return statement in non-void function '{fn.returntype} {fn.name} {fn.parameters}' : "


class UnusedVariable(Warning):
    def __init__(self, tok, var, fn):
        self.tok = tok if tok is not None else fn.tokens[0]
        self.msg = f"Unused variable (' {var} ') in function {fn}: "


class UnreachableCode(Warning):
    def __init__(self, tok, fn):
        self.tok = tok
        self.msg = f"Ureachable code starting with ( '{tok}' ) in function {fn}: "
