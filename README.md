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


## Unscoped Keywords

```function``` Declare a basic function 


```global``` Declare a function to be linkable as an object file


```extern ``` Declare a function defined in a linkable object file


```__cdecl``` Declare a global function suitable for use with C


```cextern``` Declare a function defined in an object file from gcc


## Primitive Types

```long``` A 64 bit integer value (can be signed or unsigned)

```int``` A 32 bit integer value (can be signed or unsigned)

```short``` A 16 bit integer value (can be signed or unsigned)

```char``` An 8 bit integer value (can be signed or unsigned)

```bool``` Synonymous to ```char```, with implied usage for true or false

```double``` 64 bit signed double precision floating point value

## Precompiler Directives

```#include``` (like C) copy the contents of another file for compilation
EX: ```#include "myfolder/myfile.k"```

```#define``` Define a macro value. Can be any series of tokens, as long as they will not be undefined at the point of usage
EX: ```#define MYMACRO 32```

```#ifdef``` Everything between this directive and its respective ```endif``` directive will only be compiled if the specified macro is defined
EX: ```#ifdef MYMACRO
...
#endif```

```#ifndef``` The opposite of ```ifdef```.
EX: ```#ifndef MYMACRO
...
#endif```

```#endif``` End a precompile if structure

```#link``` Specify a path to an object file to link
EX: ```#link "path/to/my/objectfile/lib.o"```

## Pointers

The pointer depth of a variable can be specified by adding ```*```'s after the typename.

Example:

```int** a;```

This would produce variable a: a pointer to a pointer to an integer value.

Pointer depth has no upper limit.

### Pointer indexing

Pointers can be indexed like arrays

Example:

```char** args;
printf(args[0]);
printf(args[1]);
```

A pointer's matrix dimention is its depth.


### Dereferencing

You can dereference a pointer with the ```@``` operator.

This is the same as taking the 0th index.

Example:

```printf("%i\n", @myarr);```


### Referencing

You can take a pointer to a variable using the ```&``` operator

Example:

```int a;
getValue(&a);
printf("%i\n", a);
```







