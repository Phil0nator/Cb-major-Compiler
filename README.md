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

## Hello World

The following is a basic hello world program to get started.

```C
#include "std.k"

function int main(int argc, char** argv){
  
  printf("Hello World!");

  return 0;
}

```


## Keywords

```js function``` Declare a basic function
```python global``` Declare a function to be linkable as an object file
```C extern ``` Declare a function defined in a linkable object file
```Cpp __cdecl``` Declare a global function suitable for use with C
```nasm cextern``` Declare a function defined in an object file from gcc


