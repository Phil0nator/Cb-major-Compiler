#####################
#   config contains global variables,
#       argument parsing info, setup stuffs, etc...
#
#####################





import argparse as arg
parser = arg.ArgumentParser(description='Compile, link, and debug .k programs.')
parser.add_argument("-o", "--output", required=True, help="Name of output file")
parser.add_argument("-i", "--input", required=True, help="Name of input file")
parser.add_argument("-nasm", "--assembly", action="store_true", default=False, help="Output compiled version in nasm assembly as well as the executable")
parser.add_argument("-r","--run", action="store_true", default=False, help="Auto-run the executable after compilation")
parser.add_argument("-g", "--debug",action="store_true",default=False, help="Add helpful comments in the outputted nasm code if [-nasm] option used")
parser.add_argument("-O2","--optimize2",action="store_true", default=False, help="Use level 2 optimization (longer compiletime, but somewhat faster output)")
parser.add_argument("-O3","--optimize3",action="store_true", default=False, help="Use level 3 optimization (much longer compiletime, but faster output)")
parser.add_argument("-p", "--profile", action="store_true", default=False, help="Print profiling statistics about the compiler for debugging/optimization")
parser.add_argument("-c", "--object", action ="store_true", default=False,help="Compile to an object file instead of an executable")

args = parser.parse_args()
__fileinput__=args.input
__fileoutput__=args.output
__tonasm__=args.assembly
__autorun__=args.run
__dbg__ = args.debug
DO_DEBUG = args.debug
__profile__ = args.profile
__oplevel__ = 1
__executable__ = not args.object

if(args.optimize2):
    __oplevel__ = 2
elif(args.optimize3):
    __oplevel__ = 3
GlobalCompiler = None

REGISTERS = ["rax","rbx","rcx","rdx","rsi","rdi","r8","r9","r10","r11","r12","r13","r14","r15"
            "al","bl","cl","dl","r8b","r9b","r10b","r11b","r12b","r13b","r14b","r15b",
            "eax","ebx","ecx","edx","esi","edi","r8d","r9d","r10d","r11d","r12d","r13d","r14d","r15d",
            "ax","bx","cx","dx","si","di","r8w","r9w","r10w","r11w","r12w","r13w","r14w","r15w"
]
for i in range(15):
    REGISTERS.append(f"xmm{i}")
    REGISTERS.append(f"ymm{i}")
raw_filedata = []