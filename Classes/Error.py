import config
from colorama import Fore, Style
from termcolor import colored
import Levenshtein
error_indicator = f"{Fore.RED}{Style.BRIGHT}"

notestack = []


def check_notes():
    global notestack
    out = ''.join(('\n' + note.__repr__() for note in notestack))
    notestack = []
    return out


def represent_code(token, indicator, suggest_str=None):
    # build pretty print error message
    line = token.start.line + 1
    file = token.start.file
    char = token.start.ch
    token.value = str(token.value)
    file = config.loadRawFile(file, None)

    lines = file.split("\n")
    # determine number of characters before error token on given line
    line -= lines[0] != ""

    linechars = char - len('\n'.join(lines[:line - 1]))

    beginchars = linechars - 1

    prechars = lines[line - 1][:linechars - 1]
    postchars = lines[line - 1][linechars + len(token.value) - 1:]
    valuechars = f"{indicator}{token.value}{Style.RESET_ALL}"

    suggested_str = f"{suggestion_indicator}{suggest_str}{Style.RESET_ALL}" if suggest_str is not None \
        else ""

    lines[line - 1] = prechars + valuechars + postchars

    lp = ""
    # if(len(lines) > 1 and line >= 1):
    #    lp += f"\t|{line-1}\t" + lines[line - 2] + "\n"
    if(line != len(lines) - 1 and len(lines) > 1):
        lp += f"\t|{line}\t" + lines[line - 1] + "\n"

    # highlight problem token
    problem = lp
    # add underline
    problem += f" \t|{indicator}\t{' '*beginchars}^{'~'*(token.end.ch-token.start.ch-1)}{Style.RESET_ALL}{f'{suggestion_indicator}^{Style.RESET_ALL}' if suggest_str is not None else ''}"

    if suggest_str is not None:
        problem += f"\n \t|{suggestion_indicator}\t{' '*(beginchars+1)}{suggest_str}{Style.RESET_ALL}"

    #token.start.ch = beginchars + 1
    return problem, line, linechars


class Error(BaseException):
    def __init__(self, tok, message):
        self.tok = tok
        self.message = message

    def __repr__(self, fatal=False):

        suggestion = None
        if self.__class__ is ExpectedSemicolon:
            suggestion = ';'
        # elif self.__class__ is ExpectedToken:
        #    suggestion = self.expected

        problem, line, ch = represent_code(
            self.tok, error_indicator, suggest_str=suggestion)

        msg = f"{Style.BRIGHT}cbm: {self.tok.start.file}:{line}:{ch}:{Fore.RED}{' fatal' if fatal else ''} error: {self.message}{Style.RESET_ALL} {self.tok}:\n{problem}"
        notes = check_notes()
        return msg + notes


def throw(error, notes=[]):
    global notestack
    notestack+=notes
    if config.GlobalCompiler is not None:
        config.GlobalCompiler.panicmode = True
        raise(error)
    else:
        fatalThrow(error)
    # exit(1)


def fatalThrow(error):
    print(error.__repr__(True))
    print("Compilation terminated.")
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
        self.expected = exp


class UnkownIdentifier(Error):
    def __init__(self, tok):
        self.tok = tok
        self.message = "Unkown Identifier: "

        # check for similar identifiers
        if config.GlobalCompiler.currentfunction is None:
            arr = config.GlobalCompiler.globals
        else:
            arr = config.GlobalCompiler.globals + \
                config.GlobalCompiler.currentfunction.variables

        bestfit = min((Levenshtein.distance(v.name, tok.value) for v in arr))
        v = next(
            (v for v in arr if Levenshtein.distance(
                v.name, tok.value) == bestfit))

        if bestfit < len(tok.value) / 2:
            notestack.append(
                Note(
                    v.dtok,
                    f"Did you mean '{v.name}'? :"
                )
            )


class UnkownFunction(Error):
    def __init__(self, tok, name, types):
        self.tok = tok
        self.message = f"Unkown function {name} with parameter types {types} :"
        for function in config.GlobalCompiler.functions:
            if function.name == name:
                notestack.append(
                    Note(
                        function.declare_token,
                        "Similar function: "
                    )
                )


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

        # check for notes to make about existing declarations:

        # local scope
        if config.GlobalCompiler.currentfunction is not None:

            for variable in config.GlobalCompiler.currentfunction.variables:
                if variable.name == v:
                    notestack.append(Note(
                        variable.dtok,
                        "Existing declaration: "
                    ))
        # global scope
        else:

            for variable in config.GlobalCompiler.globals:
                if variable.name == v:
                    notestack.append(Note(
                        variable.dtok,
                        "Existing declaration: "
                    ))


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


class ExpectedConstexpr(Error):
    def __init__(self, tok):
        self.tok = tok
        self.message = f"Expected constexpr: "


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


class MultipleReturnTypes(Error):
    def __init__(self, tok, a, b):
        self.tok = tok
        self.message = f"Multiple return types ('{a}', '{b}') found in auto-return function:"


class UnkownOperator(Error):
    def __init__(self, tok):
        self.tok = tok
        self.message = f"Unkown operator (' {tok.value} '):"


class TooManyOperatorArgs(Error):
    def __init__(self, tok, op):
        self.tok = tok
        self.message = f"Too many parameters provided for overload of operator (' {op} '):"


class NoOverloadOp(Error):
    def __init__(self, tok, struct, ptype, op):
        self.tok = tok
        self.message = f"No overload of operator ('{op}') in type ('{struct}') with parameter type ('{ptype}'):"


class InvalidMainReturn(Error):
    def __init__(self, tok):
        self.tok = tok
        self.message = f"Entry point 'main' must return an integer type:"


class UnkownConstructor(Error):
    def __init__(self, tok):
        self.tok = tok
        self.message = f"Unkown constructor: "


class RequiredIntegralType(Error):
    def __init__(self, tok):
        self.tok = tok
        self.message = f"Required Integral Type: "


class WrongParameterCount(Error):
    def __init__(self, tok, fn):
        self.tok = tok
        self.message = f"Wrong number of parameters used in call to function '{fn.pretty_print_err()}'\t: "


class AutoArrsizeForSingle(Error):
    def __init__(self, tok):
        self.tok = tok
        self.message = f"Could not assign single value to an array with automatic size generation: "


class WrongMemberAccess(Error):
    def __init__(self, tokl, tokm, tokr, t, used):
        self.tok = tokm
        self.message = f"Attempted to access member '{tokr.value}' from '{tokl.value}' using '{used}': "

        if used == ".":
            notestack.append(Note(
                tokm,
                "Maybe you meant to use '->'?"
            ))
        else:
            notestack.append(Note(
                tokm,
                "Maybe you meant to use '.'?"
            ))


warning_indicator = f"{Style.BRIGHT}{Fore.MAGENTA}"


class Warning:
    def __init__(self, tok, msg):
        self.msg = msg
        self.tok = tok

    def __repr__(self):

        problem, _, ch = represent_code(self.tok, warning_indicator)
        locline = f"{self.tok.start.file}:{self.tok.start.line}:{ch}{Style.RESET_ALL}"
        start = f"{Style.BRIGHT}cbm: {locline} {Fore.MAGENTA+Style.BRIGHT}warning: {Style.RESET_ALL}"

        return f"{start}{self.msg}\n{problem}"


class RegisterDeclWarning(Warning):
    def __init__(self, tok):
        self.tok = tok
        self.msg = "Too many register declarations at: "


class InvalidMainParameters(Warning):
    def __init__(self, tok):
        self.tok = tok
        self.msg = "Entry point main takes arguments of types (int, char**):"


class NoReturnStatement(Warning):
    def __init__(self, tok, fn):
        self.tok = tok
        self.msg = f"No guaranteed return statement in non-void function '{fn.pretty_print_err()}'\t: "


class UnusedVariable(Warning):
    def __init__(self, tok, var, fn):
        self.tok = tok if tok is not None else fn.tokens[0]
        self.msg = f"Unused variable (' {var} ') in function '{fn.pretty_print_err()}'\t: "


class UnreachableCode(Warning):
    def __init__(self, tok, fn):
        self.tok = tok
        self.msg = f"Ureachable code starting with ( '{tok}' ) in function '{fn.pretty_print_err()}'\t: "


note_indicator = f"{Style.BRIGHT}{Fore.BLUE}"


class Note:
    def __init__(self, tok, msg):
        self.tok = tok
        self.msg = msg

    def __repr__(self):
        problem, _, ch = represent_code(self.tok, note_indicator)
        locline = f"{self.tok.start.file}:{self.tok.start.line}:{ch}{Style.RESET_ALL}"
        start = f"{Style.BRIGHT}cbm: {locline} {note_indicator}Note: {Style.RESET_ALL}"

        return f"{start}{self.msg}\n{problem}"


suggestion_indicator = f"{Style.BRIGHT}{Fore.GREEN}"


class Suggestion:
    def __init__(self, tok, msg):
        self.tok = tok
        self.msg = msg

    def __repr__(self):
        problem, _ = represent_code(self.tok, suggestion_indicator)
        locline = f"{self.tok.start.file}:{self.tok.start.line}:{self.tok.start.ch}{Style.RESET_ALL}"
        start = f"{Style.BRIGHT}cbm: {locline} {note_indicator}Note: {Style.RESET_ALL}"

        return f"{start}{self.msg}\n{problem}"
