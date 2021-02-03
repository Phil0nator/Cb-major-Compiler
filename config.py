#####################
#   config contains global variables,
#       argument parsing info, setup stuffs, etc...
#
#####################


########
#   (The below snippet is used to ensure all dependencies are satisfied)
########

from colorama import Style, Fore, init
init()
import argparse as arg
import sys
import Classes.Error as E
import os
import subprocess
import pkg_resources
import platform


parser = arg.ArgumentParser(
    prog="cbm",
    description='Compile, link, and debug Cb major programs.')

parser.add_argument("input", help="Name of input file")
parser.add_argument("-o", "--output", required=False, default="a.out",
                    help="Name of output file")
parser.add_argument("-nasm", "--assembly", action="store_true", default=False,
                    help="Output compiled version in nasm assembly as well as the executable")
parser.add_argument("-r", "--run", action="store_true", default=False,
                    help="Auto-run the executable after compilation")
parser.add_argument("-g", "--debug", action="store_true", default=False,
                    help="Add helpful comments in the outputted nasm code if [-nasm] option used")
parser.add_argument("-O2", "--optimize2", action="store_true", default=False,
                    help="Use level 2 optimization (longer compiletime, but somewhat faster output)")
parser.add_argument("-O3", "--optimize3", action="store_true", default=True,
                    help="Use level 3 optimization (much longer compiletime, but faster output)")
parser.add_argument("-OS", "--optimize-size", action="store_true", default=False,
                    help="Optimize output for executable size, rather than speed.")
parser.add_argument("-O0", "--optimize0", action="store_true", default=False,
                    help="Disable all optimizations.")
parser.add_argument("-p", "--profile", action="store_true", default=False,
                    help="Print profiling statistics about the compiler for debugging/optimization")
parser.add_argument("-c", "--object", action="store_true", default=False,
                    help="Compile to an object file instead of an executable")
parser.add_argument("-l", "--link", action="append", help="Link object files")
parser.add_argument("-L", "--addLink", action="append",
                    help="Add folder to search for object files")

parser.add_argument("-v", "--verbose", action="store_true", default=False,
                    help="Print extra information during compilation")


parser.add_argument(
    "-nw",
    "--nowarn",
    action="store_true",
    help="Suppress warnings",
    default=False)

parser.add_argument("-E", "--preprocess", action="store_true", default=False,
                    help="Only run the preprocessor, and output a single compile-ready file.")

parser.add_argument(
    "-U",
    "--use",
    action="append",
    help="Specify the use of additional features like address sanitizing, or stack protection.")

parser.add_argument(
    "-PL",
    "--platform",
    action="append",
    help="Specify an alternate platform (OS) to compile for. e.g: Compile a windows program on linux."
)

# extra compiler features that the user can specify
ExtraFeatures = {
    "stack-protection": False,
    "address-sanitizing": False
}

args = parser.parse_args()



# load arguments to variables
__fileinput__ = args.input
__fileoutput__ = args.output
__tonasm__ = args.assembly
__autorun__ = args.run
__dbg__ = args.debug
DO_DEBUG = False
__profile__ = args.profile
__oplevel__ = 1
__executable__ = not args.object
__linkables__ = args.link if args.link is not None else []
__nowarn__ = args.nowarn
__verbose__ = args.verbose
__features__ = args.use if args.use is not None else []
__linkdirs__ = args.addLink if args.addLink is not None else []
__rawgcclink__ = "".join((f"-L{linkable}" for linkable in __linkdirs__)) + \
                 "".join((f"-l{linkable}" for linkable in __linkables__))


if args.platform is None:
    __platform__ = platform.system()
else:
    __platform__ = args.platform[-1]

# if platform is windows
__win__ = __platform__ == "Windows"

__preprocessonly__ = args.preprocess

__macros__ = []

# text that will sit at the top of the assembly
__macrotext__ = ""


__CEXTERNS__ = ""

# optimization level
if (args.optimize0):
    __oplevel__ = 0
elif(args.optimize2):
    __oplevel__ = 2
elif(args.optimize3):
    __oplevel__ = 3

# optimize for executable size
__Osize__ = False

if(args.optimize_size):
    __oplevel__ = 3
    #   TODO: Set up some optimizations
    # __Osize__ = True

# future location for the compiler to be accessed globally
GlobalCompiler = None

# directories
compilepath = (sys.path[0])
callpath = os.getcwd()
includepath = f"{compilepath}/include/" if compilepath != "" else f"include/"


include_directories = [
    "",
    compilepath,
    callpath,
    includepath,
    "/usr/include/",
    "/usr/lib"]

# load raw file is used in the preprocessor to load object files and code files
# from any of the includepaths specified in either the code or commandline
# arguments. It will also add the parent folder of the files loaded to includefiles
# so that that folder can be accessed in the future without the full path.


def loadRawFile(path, token):
    rawdata = None
    for p in include_directories:
        try:
            with open(f"{p}/{path}", "rb") as f:
                rawdata = f.read().decode()
                dir = os.path.dirname(f"{p}/{path}")
                if(dir not in include_directories):
                    include_directories.append(dir)
                break
        except FileNotFoundError:
            pass

    if(rawdata is None):
        E.fatalThrow(E.FileNotFound(token, path))
    return rawdata


raw_filedata = []

# debugging
LAST_RALLOC = None


# ensure that all features listed exist
for feature in __features__:
    if(feature not in ExtraFeatures):
        print(
            f"{Fore.RED}{Style.BRIGHT}Cbm{Style.RESET_ALL}: Unkown commandline argument '{feature}'.")
        exit(1)
    ExtraFeatures[feature] = True

    # feature specific operations:
    if(feature == "stack-protection"):
        __linkables__.append(f"{includepath}features/stackprotection.o")
        __CEXTERNS__ += "extern __stack_chk_fail\n"




# registers
rdx_functioncalls_inprogress = 0
rcx_functioncalls_inprogress = 0