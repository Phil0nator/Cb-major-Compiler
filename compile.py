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



from PreParser import PreParser
from PreParser import PreProcessor
from Compiler import Compiler
from Linker import *
import config

def main():

    beginTime = time.time()
    with open(config.__fileinput__, "rb") as inpf:
        raw = inpf.read().decode()

    pre = PreParser(raw,config.__fileinput__)
    pretokens = pre.getTokens() 

    pp = PreProcessor(raw,pretokens,config.__fileinput__)
    totals = pp.process()
    print("+-+-+ Compile +-+-+")
    c = Compiler()
    config.GlobalCompiler = c
    

    for file in totals:
        config.raw_filedata.append(file)
        c.compile(file)


    c.finalize()

    if(c.panicmode):
        print("Could not finish compilation due to errors.")
        exit(1)

    asm = "%s"%fileTemplate
    asm = asm.replace("%%HEAP%%", c.heap)
    asm = asm.replace("%%CONSTANTS%%", c.constants)
    asm = asm.replace("%%TEXT%%", c.text)
    asm = asm.replace("%%INITIALIZE%%", c.initializers)
    asm = asm.replace("%%ENTRY%%", c.entry)
    



    asm = asm.replace("\n\n","\n").replace("\n\n","\n")
    
    
    
    print("+-+-+ FINAL +-+-+")

    with open(config.__fileoutput__+".asm", "wb") as f:
        f.write(asm.encode())

    os.system(assemble(config.__fileoutput__))
    os.system(link(config.__fileoutput__,config.__fileoutput__))
    os.remove(config.__fileoutput__+".o")

    if(not config.__tonasm__):
        os.remove(config.__fileoutput__+".asm")
    

    print("Compiled and Linked symbols in %s ms"%(time.time()-beginTime))
    if(config.__autorun__):
        os.system(f"./{config.__fileoutput__}")





main()