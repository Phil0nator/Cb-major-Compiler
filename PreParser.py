from Classes.Token import *
from Classes.Location import Location
from Classes.Error import *
from Classes.Macro import Macro
from Classes.Constexpr import determineConstexpr
from Postfixer import Postfixer
from Lexer import Lexer
from config import include_directories
from Function import Function
import os
import platform
import cpuid
import datetime
import time


def join(arr, d):
    out = ""
    for s in arr:
        out += s + d
    return out


# add the compiler-produced define macros
# EX: __WIN32, __LINUX, __DARWIN, etc...
oslist = ["Linux", "Darwin", "Windows", "SunOS", "Java", "BSD"]

"""
getCompilerDefines() is what generates all pre-defined macros.
    It defines macros about the following:
        -Operating system
        -SSE capability
        -AVX capability
        -BMI capability
        -Date / Time of compilation
    Non-constant macros will be set as they appear in PreProcessor.checkDefn()
    @see PreProcessor.checkDefn
"""


def getCompilerDefines():
    operating_system = platform.system()
    arch = platform.processor()
    defines = []
    T_0 = [Token(T_INT, 0, None, None)]
    T_1 = [Token(T_INT, 1, None, None)]
    T_B = [T_0, T_1]
    defines.append([f"__{operating_system.upper()}", T_1])
    yes = "Yes"
    sse = cpuid._is_set(1, 3, 25) == yes
    sse2 = cpuid._is_set(1, 3, 26) == yes
    sse3 = cpuid._is_set(1, 2, 0) == yes
    ssse3 = cpuid._is_set(1, 2, 9) == yes
    sse41 = cpuid._is_set(1, 2, 19) == yes
    sse42 = cpuid._is_set(1, 2, 20) == yes
    sse4a = cpuid._is_set(0x80000001, 2, 6) == yes
    avx = cpuid._is_set(1, 2, 28) == yes
    avx2 = cpuid._is_set(7, 1, 5) == yes
    bmi1 = cpuid._is_set(7, 1, 3) == yes
    bmi2 = cpuid._is_set(7, 1, 8) == yes

    if(sse):
        defines.append(["__SSE", T_1])
    if(sse2):
        defines.append(["__SSE2", T_1])
    if(sse3):
        defines.append(["__SSE3", T_1])
    if(ssse3):
        defines.append(["__SSSE3", T_1])
    if(sse41):
        defines.append(["__SSE4_1", T_1])
    if(sse42):
        defines.append(["__SSE4_2", T_1])
    if(sse4a):
        defines.append(["__SSE4A", T_1])
    if(avx):
        defines.append(["__AVX", T_1])
    if(avx2):
        defines.append(["__AVX2", T_1])
    if(bmi1):
        defines.append(["__BMI1", T_1])
    if(bmi2):
        defines.append(["__BMI2", T_1])

    defines.append(["__TIME__", [Token(T_STRING, time.ctime(), None, None)]])

    return defines


##############################
#
#   The PreProcessor class is used to execute directive tokens from
#       a PreParser object.
#   It will return the new raw texts associated with their respective
#       file names in tuples.
#   \see compile.py
#   \see PreParser
#
#
#############################


class PreProcessor:
    def __init__(self, tokens):

        self.tokens = tokens                    # all tokens
        self.current_token = tokens[0]          # current token
        self.tkidx = 0                          # current position

        # predefined macros are generated here
        definitions = getCompilerDefines()
        # hash table for faster access to definitions
        # format:
        # {
        #   "<name>" : ["<name>", [<token_list>]],
        #   ...
        # }

        self.definitions = {}

        for d in definitions:
            self.definitions[d[0]] = d

        # macros are #defines that define a function-like directive:
        # e.g: #define MY_MACRO(x) (x*x-x+x/x)
        self.macros = []
        self.dels = 0                           # number of tokens deleted

    # move to next token
    def advance(self) -> None:
        self.tkidx += 1
        self.current_token = self.tokens[self.tkidx]

    # correct current_token to potentially changed index
    def update(self) -> None:
        self.current_token = self.tokens[self.tkidx]

    # delete current token, and move to the next
    def delmov(self) -> None:
        self.tokens[self.tkidx] = None
        self.advance()
        self.dels += 1

    # get a definition by name
    def getDefn(self, name) -> list:
        return self.definitions[name] if name in self.definitions else None

    # get a macro by name
    def getMacro(self, name) -> Macro:
        return next((m for m in self.macros if m.name == name), None)

    # get a macro by name and number of parameters
    def getMacrop(self, name, params) -> Macro:
        return next((m for m in self.macros if m.name ==
                     name and len(m.params) == params), None)

     # check for specific tokens
    def checkToks(self, tok) -> None:
        if(self.current_token.tok not in tok):
            throw(ExpectedToken(self.current_token, ' '.join(tok)))

    # load a raw file based on a given path
    def loadRaw(self, path) -> str:
        return config.loadRawFile(path, self.current_token)

    # #include directive
    def buildIncludeStatement(self) -> None:
        self.delmov()

        # verify syntax
        self.checkToks([T_STRING, T_INCLUDER])
        path = self.current_token.value
        # \see loadRaw
        rawdata = self.loadRaw(path)

        # create tokens from new file, and insert them in this PreProcessor's
        # tokenlist
        lex = Lexer(path, rawdata)

        tokens = lex.getTokens()
        self.delmov()
        # emplace the new tokens ahead of the current position
        self.tokens[self.tkidx:self.tkidx] = tokens[:-1]
        self.update()

    # #define directive
    def buildDefine(self) -> None:
        self.delmov()
        # verify syntax
        self.checkToks([T_ID])

        # collect token info
        name = self.current_token.value
        sline = self.current_token.start.line
        chs = self.current_token.end.ch
        self.delmov()
        # check for macro syntax (<id><(> ...)
        if(self.current_token.tok == T_OPENP and self.current_token.start.ch == chs):
            # if this is a macro defininition, control is passed to the build
            # Macro function
            self.buildMacro(name)
            return

        # if the define is one token long, the definition ends here:
        if(self.current_token.start.line != sline):
            # add new defn
            self.definitions[name] = [
                name, []]
            return

        # begin collecting tokens for a longer definition
        definitionTokens = [self.current_token]
        self.delmov()
        # for all tokens on the same line...
        while(self.current_token.start.line == sline):
            definitionTokens.append(self.current_token)
            if self.current_token.tok == T_STRING:
                # account for multi-line strings:
                linestops = self.current_token.value.count("\\")
                sline += linestops - 1 if linestops else 0

            self.delmov()

        # add new defn
        self.definitions[name] = [name, definitionTokens]

    # check if current token (id) is a macro
    # if so, replace it with the actual values for that macro
    def checkDefn(self) -> None:

        # if the definition is actually a macro, control is passed to
        # the checkMacro function
        if (self.tokens[self.tkidx + 1].tok == T_OPENP):
            self.checkMacro()
            return

        # get the define if it exists
        dq = self.getDefn(self.current_token.value)

        # if this is not a define, or it is a builtin:
        if(dq is None):

            # non-constant macros need to be replaced by specific values
            if(self.current_token.value == "__LINE__"):
                self.tokens[self.tkidx] = Token(
                    T_INT, self.tokens[self.tkidx].start.line, self.tokens[self.tkidx].start, self.tokens[self.tkidx].end)
                return
            elif(self.current_token.value == "__FILE__"):
                self.tokens[self.tkidx] = Token(
                    T_STRING, self.tokens[self.tkidx].start.file, self.tokens[self.tkidx].start, self.tokens[self.tkidx].end)
                return

            self.advance()
            return
        # if a define was found:
        self.delmov()
        # replace its token with the tokens found in it's definition
        self.tokens[self.tkidx:self.tkidx] = dq[1]

    # #ifdef directive
    def buildifdef(self) -> None:
        self.delmov()
        # verify syntax
        self.checkToks([T_ID])
        # get a definition for the requested id
        q = self.getDefn(self.current_token.value)

        # if it is not defined:
        if(q is None):
            # delete all the tokens in the #if body
            self.skipIfbody()
        else:
            # continue as if nothing happened
            self.delmov()

    # skip an #if ... #endif body
    def skipIfbody(self) -> None:
        opens = 1
        # opens mark the number of nested if's that are started

        # while the scope is within the original #if, delete tokens
        while opens > 0:
            self.delmov()
            if(self.current_token.tok == T_DIRECTIVE):
                if(self.current_token.value.startswith("if")):
                    opens += 1
                elif(self.current_token.value == "endif"):
                    opens -= 1

    # #ifndef directive
    def buildifndef(self) -> None:
        self.delmov()
        # verify syntax
        self.checkToks([T_ID])
        # check for a definition
        q = self.getDefn(self.current_token.value)

        if(q is None):
            # continue as if nothing happened
            self.delmov()
        else:
            # delete all tokens in the body of this #if ... #endif block
            self.skipIfbody()

    # build a new macro
    def buildMacro(self, name) -> None:
        # verify syntax
        self.checkToks([T_OPENP])
        self.delmov()
        inputs = []

        # parse parameters
        while(self.current_token.tok != T_CLSP):
            # verify syntax
            self.checkToks([T_ID])
            # store parameter token
            inputs.append(self.current_token)
            self.delmov()
            # verify syntax
            self.checkToks([T_COMMA, T_CLSP])
            # check for end, move on
            if(self.current_token.tok == T_CLSP):
                break
            self.delmov()
        self.delmov()

        body = []
        mline = self.current_token.start.line
        # for all tokens on the same line (excluding those denoted by a '\')
        while(self.current_token.start.line == mline):
            if(self.current_token.tok == T_BSLASH):
                mline += 1
            else:
                # add token to body
                body.append(self.current_token)
            self.delmov()

        # leave the rest of the construction to the Macro class
        m = Macro(name, inputs, body)
        self.macros.append(m)

    # handle the builtin __STRINGIFY__ macro
    def doStringify(self) -> None:
        self.delmov()
        self.checkToks([T_OPENP])
        self.delmov()
        opens = 1
        output = ""
        while(opens != 0):
            if(self.current_token.tok == T_OPENP):
                opens += 1
            elif(self.current_token.tok == T_CLSP):
                opens -= 1
            if(self.current_token.value == "\\n"):
                self.current_token.value = "\n"
            output = f"{output} {self.current_token.value}" if opens else output
            self.delmov()
        return output[1:]

    def checkMacro(self):
        startidx = self.tkidx
        starttok = self.current_token
        id = self.current_token.value
        macro = self.getMacro(id)
        if macro is None:

            if (id == "__STRINGIFY__"):
                o = self.doStringify()
                self.tokens[startidx] = None
                self.tokens[startidx:self.tkidx] = [
                    Token(T_STRING, o, starttok.start, starttok.end)]
                self.tkidx = startidx
                self.update()
            elif (id == "defined"):
                self.delmov()
                self.delmov()
                value = self.getMacro(
                    self.current_token.value) is not None or self.getDefn(
                    self.current_token.value) is not None

                self.tokens[startidx:self.tkidx + 2] = [
                    Token(T_INT, int(value), starttok.start, starttok.end)
                ]

                self.tkidx = startidx

                self.update()

            elif (id == "__python"):
                self.delmov()
                self.delmov()
                code = self.current_token.value.replace(
                    '\\"', '"').replace("\\n", "\n")
                try:
                    value = eval(code)
                except BaseException as e:
                    fatalThrow(Error(self.current_token, f"Python error: {e}"))


                self.tokens[startidx:self.tkidx + 2] = [
                    Token(
                        T_STRING if not isinstance(
                            value, int) else T_INT, str(value) if not isinstance(
                            value, int) else value, starttok.start, starttok.end)
                ]

            else:
                self.advance()

            return
        else:
            self.delmov()
            self.checkToks([T_OPENP])
            self.delmov()
            inps = []
            opens = 1
            subinp = []
            while(opens != 0):

                if(self.current_token.tok == T_OPENP):
                    opens += 1
                elif(self.current_token.tok == T_CLSP):
                    opens -= 1
                elif (self.current_token.tok == T_COMMA and opens == 1):
                    inps.append(subinp.copy())
                    subinp = []
                else:
                    subinp.append(self.current_token)

                self.delmov()

            inps.append(subinp.copy())
            macro = self.getMacrop(id, len(inps))
            tks = macro.get(inps, starttok)

            self.tokens[startidx] = None
            self.tokens[startidx:self.tkidx] = tks

            self.tkidx = startidx
            self.update()

    def addobject(self):
        self.delmov()
        self.checkToks([T_STRING])
        q = self.current_token.value

        for d in config.include_directories:
            if(os.path.exists(d + "/" + q)):
                config.__linkables__.append(d + q)
                self.delmov()
                return

        fatalThrow(FileNotFound(self.current_token, q))

    def buildIf(self):
        self.delmov()

        sline = self.current_token.start.line

        if(self.current_token.start.line != sline):
            throw(ExpectedValue(self.current_token))
            return

        if self.current_token.tok == T_ID:
            self.checkDefn()
            self.update()
        multitok = False
        definitionTokens = [self.current_token]
        self.delmov()

        while(self.current_token.start.line == sline):
            if self.current_token.tok == T_ID:
                self.checkDefn()
                self.update()
                self.current_token.start.line = sline
                continue
            definitionTokens.append(self.current_token)
            self.delmov()

        tmpfn = Function("empty", [], None, config.GlobalCompiler, [])
        value = determineConstexpr(False, definitionTokens, tmpfn)
        if value.accessor == 0:
            self.skipIfbody()
        else:
            pass


    def buildError(self):
        errtok = self.current_token
        self.advance()
        self.checkToks([T_STRING])
        throw(Error(errtok, self.current_token.value))

    def buildWarning(self):
        warntok = self.current_token
        self.delmov()
        self.checkToks([T_STRING])
        warn(Warning(warntok, f" {self.current_token.value} "))
        self.delmov()

    # main function
    def process(self):

        while self.current_token.tok != T_EOF:
            self.update()
            if(self.current_token.tok == T_DIRECTIVE):
                # token is directive
                self.current_token.value = self.current_token.value.lower()
                # check if there is a response to this directive
                if self.current_token.value in directive_responses:
                    # execute a response
                    directive_responses[self.current_token.value](self)
                else:
                    fatalThrow(UnkownDirective(self.current_token))

            elif(self.current_token.tok == T_ID):
                self.checkDefn()

            else:
                self.advance()
        # filter out deleted tokens that were replaced with None
        return list(filter(badfilter, self.tokens))


def badfilter(token):
    return token is not None and token.tok != T_BSLASH



directive_responses = {
    "include"   :   PreProcessor.buildIncludeStatement,
    "define"    :   PreProcessor.buildDefine,
    "ifdef"     :   PreProcessor.buildifdef,
    "if"        :   PreProcessor.buildIf,
    "ifndef"    :   PreProcessor.buildifndef,
    "endif"     :   PreProcessor.delmov,
    "link"      :   PreProcessor.addobject,
    "error"     :   PreProcessor.buildError,
    "warning"   :   PreProcessor.buildWarning
}