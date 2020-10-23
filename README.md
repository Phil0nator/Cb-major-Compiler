# The C flat Compiler

Compile, debug, and link C flat files.

## Usage

The file compile.py can be called with the following arguments:

```bash
optional arguments:
  -h, --help            show this help message and exit
  -o OUTPUT, --output OUTPUT
                        Name of output file
  -i INPUT, --input INPUT
                        Name of input file
  -nasm, --assembly     Output compiled version in nasm assembly as well as the executable
  -r, --run             Auto-run the executable after compilation
  -g, --debug           Add helpful comments in the outputted nasm code if [-nasm] option used
  -O2, --optimize2      Use level 2 optimization (longer compiletime, but somewhat faster output)
  -O3, --optimize3      Use level 3 optimization (much longer compiletime, but faster output)
  -p, --profile         Print profiling statistics about the compiler for debugging/optimization
  -c, --object          Compile to an object file instead of an executable
  -l LINK, --link LINK  Link object files
```

