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
