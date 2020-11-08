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
# lc 6440
# lct 9144
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

from Lexer import Lexer
from PreParser import PreProcessor
from Compiler import Compiler
from Linker import *

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

    c.compile(totals)

    # function compilation
    try:
        c.finalize()
    except AttributeError as e:
        traceback.print_tb(e.__traceback__)
        print(e)
        print(c.currentfunction.current_token.start)
        exit(1)

    if(c.panicmode):
        print("Could not finish compilation due to errors.")
        exit(1)

    # feed to template
    asm = "%s" % fileTemplate
    asm = asm.replace("%%HEAP%%", c.heap)
    asm = asm.replace("%%TEXT%%", c.text)
    asm = asm.replace("%%CEXTERNS%%", config.__CEXTERNS__)
    asm = asm.replace("%%CONSTANTS%%", c.constants)
    asm = asm.replace("%%MACROTEXT%%", config.__macrotext__)
    del c
    # cleanup

    if(config.__tonasm__): # extra cleanup so the output looks good
        asm = asm.replace("  ", " ").replace("  ", ' ')
        while("\n " in asm):
            asm = asm.replace("\n ", "\n")
        while("\n\n" in asm):
            asm = asm.replace("\n\n", "\n")
        asm = asm.replace("\n", "\n\t")

        asm = re.sub("\n\t.*:",asm_labelRepl,asm)

        if(not config.DO_DEBUG):
            asm = re.sub(";.*","",asm)


    # linking, and running

    with open(config.__fileoutput__ + ".asm", "wb") as f:
        f.write(asm.encode())

    os.system(assemble(config.__fileoutput__))
    if(config.__executable__):
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
    

    print("Compiled and Linked symbols in %s s" % (time.time() - beginTime))


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
    # normal usage
    else:
        main()

    if(config.__autorun__):
        runtime = time.time()
        os.system(f"./{config.__fileoutput__}")
        print("\nRuntime: %s s" % (time.time() - runtime))
