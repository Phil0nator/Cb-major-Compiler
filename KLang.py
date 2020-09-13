import os
import sys
from preprocessor import *
from constants import *
import time

from errors import *

from Location import *

from Token import *

from Lexer import *

from Declaration import *

from Function import *

from Compiler import *

import argparse as arg

import platform

__fileinput__ = ""
__fileoutput__ = ""
__tonasm__ = False
__autorun__ = False
__comp__ = None
__dbg__ = False

def main():
    global cc, __comp__
    start=time.time()

    data = ""

    


    
    cc["DEF"] = [{"__%s__"%platform.system():"1"}]
    cc["GL_VAR"] = []
    cc["FILES"] = [__fileinput__]
    cc["LINDEX"] = []
    

    with open(__fileinput__, "rb") as f:
        data = f.read().decode()

    

    data = pre_process(data,cc)
    

    l = Lexer(0, data)
    tokens, errors = l.make_tokens()
    if(errors != None):
        print(errors.as_string())
        exit(1)
    

    compiler = Compiler(tokens)
    __comp__ = compiler
    compiler.fill_info()
    
    asm = top_stub
    asm = asm.replace("&&FDEF&&", compiler._fdef)
    asm = asm.replace("&&TEXT&&", compiler.main) 
    asm = asm.replace("&&BSS&&", compiler._bss)
    asm = asm.replace("&&DATA&&", compiler._data)


    

    with open("%s.asm"%__fileoutput__, "wb") as f:
        f.write(asm.encode())
    commands = updateCommands(__fileinput__, __fileoutput__)
    if(__dbg__): commands[1] = commands[1].replace("&G","-g")
    else:commands[1] = commands[1].replace("&G","")
    os.system(commands[0] + " && " + commands[1])
    os.remove(__fileoutput__+".o")

    if(not __tonasm__):
        os.remove("%s.asm"%__fileoutput__)

    end = time.time()
    print("Compiled and linked symbols in %s s\n"%str(end-start))


    if(__autorun__):
        os.system("./%s"%__fileoutput__)

    ############################################
    # All tokens -> global variables
    #       define global vars in bss, finals in .data
    # Remaining tokens -> functions
    #
    #
    #
    #
    # Function parameters will be passed through : r9-r15. 
    #    Before calling these will be pushed, and after they will be poped
    # Functions using a return value will return to the register: r8
    #
    #
    #
    # Float values will be stored in the heap, and pointed to by vars
    # Float math needs to be done through memory anyway, so the performance cost will be small
    #
    #############################################



def handleArgs():
    global __fileinput__,__fileoutput__,__tonasm__,__autorun__,__dbg__
    parser = arg.ArgumentParser(description='Compile .rud programs into either nasm assembly, or to an executable.')
    parser.add_argument("-o", "--output", required=True)
    parser.add_argument("-i", "--input", required=True)
    parser.add_argument("-nasm", action="store_true", default=False)
    parser.add_argument("-r", action="store_true", default=False)
    parser.add_argument("-g", action="store_true",default=False)
    args = parser.parse_args()
    __fileinput__=args.input
    __fileoutput__=args.output
    __tonasm__=args.nasm
    __autorun__=args.r
    __dbg__ = args.g
if( __name__ == "__main__"):
    handleArgs()
    try:
        main()
        
    except Exception:
        print(Exception.with_traceback())
        print("An unkown error has occured on token: "+__comp__.current_token.__repr__())
        print("Location: "+__comp__.current_token.start.__repr__())
