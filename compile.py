#
#   Load
#   PreTokenize
#   PreProcess
#   Tokenize
#   Compile
#   Optimize
#   Link
#   
#
import time
import os
import argparse as arg
from Classes.Error import *
from globals import *
import cProfile, pstats, io

from Lexer import Lexer
from PreParser import PreProcessor
from Compiler import Compiler
from Linker import *
import config

def main():

    beginTime = time.time() # record time of start
    with open(config.__fileinput__, "rb") as inpf: # read entrypoint
        raw = inpf.read().decode()

    # preprocess
    lex = Lexer(config.__fileinput__, raw)
    firstTokens = lex.getTokens()


    pp = PreProcessor(firstTokens)
    totals = pp.process()
    #print(totals)
    #

    
    # global compilation
    c = Compiler()
    config.GlobalCompiler = c
    

    c.compile(totals)

    # function compilation
    c.finalize()

    if(c.panicmode):
        print("Could not finish compilation due to errors.")
        exit(1)
    
    # feed to template
    asm = "%s"%fileTemplate
    asm = asm.replace("%%HEAP%%", c.heap)
    asm = asm.replace("%%CONSTANTS%%", c.constants)
    asm = asm.replace("%%TEXT%%", c.text)
    asm = asm.replace("%%INITIALIZE%%", c.initializers)
    asm = asm.replace("%%ENTRY%%", c.entry)
    


    #cleanup
    asm = asm.replace("\n\n","\n").replace("\n\n","\n")
    
    
    
    #print("+-+-+ FINAL +-+-+")

    #linking, and running

    with open(config.__fileoutput__+".asm", "wb") as f:
        f.write(asm.encode())

    os.system(assemble(config.__fileoutput__))
    os.system(link(config.__fileoutput__,config.__fileoutput__))
    os.remove(config.__fileoutput__+".o")

    if(not config.__tonasm__):
        os.remove(config.__fileoutput__+".asm")
    

    print("Compiled and Linked symbols in %s s"%(time.time()-beginTime))
    




if(__name__ == "__main__"):
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
    else:
        main()



    if(config.__autorun__):
        runtime = time.time()
        os.system(f"./{config.__fileoutput__}")
        print("\nRuntime: %s s"%(time.time()-runtime))