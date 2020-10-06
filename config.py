import argparse as arg
parser = arg.ArgumentParser(description='Compile .rud programs into either nasm assembly, or to an executable.')
parser.add_argument("-o", "--output", required=True)
parser.add_argument("-i", "--input", required=True)
parser.add_argument("-nasm", action="store_true", default=False)
parser.add_argument("-r", action="store_true", default=False)
parser.add_argument("-g", action="store_true",default=False)
parser.add_argument("-O2",action="store_true", default=False)
parser.add_argument("-O3",action="store_true", default=False)
args = parser.parse_args()
__fileinput__=args.input
__fileoutput__=args.output
__tonasm__=args.nasm
__autorun__=args.r
__dbg__ = args.g
DO_DEBUG = args.g
__oplevel__ = 1
if(args.O2):
    __oplevel__ = 2
elif(args.O3):
    __oplevel__ = 3
GlobalCompiler = None

REGISTERS = ["rax","rbx","rcx","rdx","rsi","rdi","r8","r9","r10","r11","r12","r13","r14","r15"
            "al","bl","cl","dl","r8b","r9b","r10b","r11b","r12b","r13b","r14b","r15b"
]
for i in range(15):
    REGISTERS.append(f"xmm{i}")