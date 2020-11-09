#####################
#   config contains global variables,
#       argument parsing info, setup stuffs, etc...
#
#####################


########
#   (The below snippet is used to ensure all dependencies are satisfied)
########

from colorama import Style, Fore
import argparse as arg
import sys
import Classes.Error as E
import os
import subprocess
import pkg_resources

required = {'argparse', 'colorama', "termcolor", "cpuid"}
installed = {pkg.key for pkg in pkg_resources.working_set}
missing = required - installed


if missing:
    python = sys.executable
    subprocess.check_call(
        [python, '-m', 'pip', 'install', *missing], stdout=subprocess.DEVNULL)
###################################

parser = arg.ArgumentParser(
    description='Compile, link, and debug .k programs.')
parser.add_argument("-o", "--output", required=True,
                    help="Name of output file")
parser.add_argument("-i", "--input", required=True, help="Name of input file")
parser.add_argument("-nasm", "--assembly", action="store_true", default=False,
                    help="Output compiled version in nasm assembly as well as the executable")
parser.add_argument("-r", "--run", action="store_true", default=False,
                    help="Auto-run the executable after compilation")
parser.add_argument("-g", "--debug", action="store_true", default=False,
                    help="Add helpful comments in the outputted nasm code if [-nasm] option used")
parser.add_argument("-O2", "--optimize2", action="store_true", default=False,
                    help="Use level 2 optimization (longer compiletime, but somewhat faster output)")
parser.add_argument("-O3", "--optimize3", action="store_true", default=False,
                    help="Use level 3 optimization (much longer compiletime, but faster output)")
parser.add_argument("-p", "--profile", action="store_true", default=False,
                    help="Print profiling statistics about the compiler for debugging/optimization")
parser.add_argument("-c", "--object", action="store_true", default=False,
                    help="Compile to an object file instead of an executable")
parser.add_argument("-l", "--link", action="append", help="Link object files")

parser.add_argument(
    "-nw",
    "--nowarn",
    action="store_true",
    help="Suppress warnings",
    default=False)

parser.add_argument("-E", "--preprocess", action="store_true", default=False,
                    help="Only run the preprocessor, and output a single compile-ready file.")


args = parser.parse_args()
__fileinput__ = args.input
__fileoutput__ = args.output
__tonasm__ = args.assembly
__autorun__ = args.run
__dbg__ = args.debug
DO_DEBUG = args.debug
__profile__ = args.profile
__oplevel__ = 1
__executable__ = not args.object
__linkables__ = args.link if args.link is not None else []
__nowarn__ = args.nowarn


__preprocessonly__ = args.preprocess

__macros__ = []
__macrotext__ = ""


__CEXTERNS__ = ""


if(args.optimize2):
    __oplevel__ = 2
elif(args.optimize3):
    __oplevel__ = 3


GlobalCompiler = None

compilepath = (sys.path[0])
callpath = os.getcwd()
includepath = f"{compilepath}/include/" if compilepath != "" else f"include/"


include_directories = ["", compilepath, callpath, includepath]

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
        E.throw(E.FileNotFound(token, path))
    return rawdata


raw_filedata = []


LAST_RALLOC = None
