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
from Error import *
from globals import *

from Variable import *
from Function import *
from DType import *
from Token import *
from Location import *
from PreParser import *
from Compiler import *
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

    

    for file in totals:
        
        c.compile(file)

    c.finalize()

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