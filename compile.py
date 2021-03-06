'''/*
    MIT License
    Copyright (c) 2020 Philo Kaulkin

    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in all
    copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
    EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
    MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
    IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
    DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
    OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE
    OR OTHER DEALINGS IN THE SOFTWARE.
*/'''


##############################################
#   compile.py is the entrypoint of the compiler.
#
#   The large outline steps:
#       - parse cmd arguments
#       - load entrypoint file
#       - pre-process / lex first file (including
#           subsequent include statements)
#       - use Compiler.py to seperate structures, functions, globals, etc...
#       - use Function.py to compile function bodies
#       - parse together all the raw assembly
#       - depending on commandline args:
#           - assemble
#           - link
#           - run
#           etc...
#######################################################
import time
import traceback
import re
import os
import config
import argparse as arg
from globals import fileTemplate
import cProfile
import pstats
import io
import resource

from Lexer import Lexer
from PreParser import PreProcessor
from Compiler import Compiler
from Linker import *
from Classes.Error import Error, fatalThrow


def asm_labelRepl(match):
    return f"\n{match[0][2:]}"


def main():
    # record time of start
    beginTime = time.time()

    # read entrypoint
    with open(config.__fileinput__, "rb") as inpf:
        raw = inpf.read().decode()

    # preprocess
    lex = Lexer(config.__fileinput__, raw)
    firstTokens = lex.getTokens()
    del lex
    pp = PreProcessor(firstTokens)
    totals = pp.process()

    # no compilation needed, just output preprocessed file
    if(config.__preprocessonly__):

        output = "".join([t.reverse() for t in totals])
        with open(config.__fileoutput__, "wb") as f:
            f.write(output.encode())

        return 0

    del pp
    # global compilation
    c = Compiler()
    config.GlobalCompiler = c

    try:
        c.compile(totals)
    except Error as e:
        fatalThrow(e)

    # function compilation
    c.finalize()

    if(c.panicmode):
        print("Compilation terminated due to errors.")
        exit(1)

    # feed to template
    asm = "%s" % fileTemplate
    asm = asm.replace("%%HEAP%%", c.heap)
    if(not config.DO_DEBUG and config.__tonasm__):
        c.text = re.sub(";.*", "", c.text)

    asm = asm.replace("%%ALIGN%%", str(16 if not config.__Osize__ else 0))

    asm = asm.replace("%%TEXT%%", c.text)
    asm = asm.replace("%%CEXTERNS%%", config.__CEXTERNS__)
    asm = asm.replace("%%CONSTANTS%%", c.constants)
    asm = asm.replace("%%MACROTEXT%%", config.__macrotext__)
    asm = asm.replace("%%INIT%%", c.inittext)
    asm = asm.replace("%%FINI%%", c.fini)
    del c
    # cleanup

    if(config.__tonasm__):  # extra cleanup so the output looks good
        asm = asm.replace("  ", " ").replace("  ", ' ')
        while("\n " in asm):
            asm = asm.replace("\n ", "\n")
        while("\n\n" in asm):
            asm = asm.replace("\n\n", "\n")
        asm = asm.replace("\n", "\n\t")

        asm = re.sub("\n\t.*:", asm_labelRepl, asm)

    # linking, and running

    with open(config.__fileoutput__ + ".asm", "wb") as f:
        f.write(asm.encode())

    os.system(assemble(config.__fileoutput__))
    if(config.__executable__):

        # setup path
        if config.__win__:
            os.environ["PATH"] += os.pathsep + \
                os.pathsep.join([f"{config.compilepath}\\windows\\gcc\\bin"])
            os.environ["PATH"] += os.pathsep + \
                os.pathsep.join([f"{config.compilepath}\\windows\\gcc"])
            os.environ["PATH"] += os.pathsep + os.pathsep.join(
                [f"{config.compilepath}\\windows\\gcc\\x86_64-w64-mingw32"])
            os.environ["PATH"] += os.pathsep + \
                os.pathsep.join(
                [f"{config.compilepath}\\windows\\gcc\\opt\\bin"])
            os.environ["PATH"] += os.pathsep + os.pathsep.join(
                [f"{config.compilepath}\\windows\\gcc\\x86_64-w64-mingw32\\bin"])

        os.system(link(config.__fileoutput__, config.__fileoutput__))
        os.remove(config.__fileoutput__ + ".o")
    else:
        os.system(
            linkonly(
                config.__fileoutput__ +
                ".o",
                config.__fileoutput__))

    if(not config.__tonasm__):
        os.remove(config.__fileoutput__ + ".asm")
    if config.__verbose__:
        print(
            "Compiled and Linked symbols in %s s" %
            (time.time() - beginTime))


if(__name__ == "__main__"):

    # to run with profiling
    if(config.__profile__):
        pr = cProfile.Profile()
        pr.enable()
        main()
        pr.disable()
        s = io.StringIO()
        sortby = 'cumulative'
        ps = pstats.Stats(pr, stream=s).sort_stats(sortby)
        ps.print_stats()
        print(s.getvalue())
        print(
            f"Peak Memory Usage: {resource.getrusage(resource.RUSAGE_SELF).ru_maxrss}kb")
    # normal usage
    else:
        main()

    if(config.__autorun__):
        runtime = time.time()

        if not config.__win__:
            os.system(f"./{config.__fileoutput__}")
        else:
            os.system(f"{config.__fileoutput__}")

        print("\nRuntime: %s s" % (time.time() - runtime))
