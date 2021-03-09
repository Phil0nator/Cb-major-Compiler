# The C flat major Compiler

Compile, debug, and link C flat files.

[Full Documentation](http://philo.kaulk.in/cflat)

## Usage

The file compile.py can be called with the following arguments:

```bash
usage: cbm [-h] [-o OUTPUT] [-nasm] [-r] [-g] [-O2] [-O3] [-OS] [-O0] [-p] [-c] [-l LINK] [-L ADDLINK] [-vb] [-v] [-nw] [-E] [-U USE]
           [-PL PLATFORM]
           input

Compile, link, and debug Cb major programs.

positional arguments:
  input                 Name of input file

optional arguments:
  -h, --help            show this help message and exit
  -o OUTPUT, --output OUTPUT
                        Name of output file
  -nasm, --assembly     Output compiled version in nasm assembly as well as the executable
  -r, --run             Auto-run the executable after compilation
  -g, --debug           Add helpful comments in the outputted nasm code if [-nasm] option used
  -O2, --optimize2      Use level 2 optimization (longer compiletime, but somewhat faster output)
  -O3, --optimize3      Use level 3 optimization (much longer compiletime, but faster output)
  -OS, --optimize-size  Optimize output for executable size, rather than speed.
  -O0, --optimize0      Disable all optimizations.
  -p, --profile         Print profiling statistics about the compiler for debugging/optimization
  -c, --object          Compile to an object file instead of an executable
  -l LINK, --link LINK  Link object files
  -L ADDLINK, --addLink ADDLINK
                        Add folder to search for object files
  -vb, --verbose        Print extra information during compilation
  -v, --version         Get the current c flat version.
  -nw, --nowarn         Suppress warnings
  -E, --preprocess      Only run the preprocessor, and output a single compile-ready file.
  -U USE, --use USE     Specify the use of additional features like address sanitizing, or stack protection.
  -PL PLATFORM, --platform PLATFORM
                        Specify an alternate platform (OS) to compile for. e.g: Compile a windows program on linux.
```

## Hello World

The following is a basic hello world program to get started.
It shows three good ways of printing out the "Hello World!" message.

```cpp
#include "cblib.cb"

function int main(int argc, char** argv){
  
  printf("Hello World!");
  puts("Hello World!");
  cout << "Hello World!";

  return 0;
}

```


## Function Keywords

```function``` Declare a basic function 


```global``` Declare a function to be linkable as an object file


```extern ``` Declare a function defined in a linkable object file


```__cdecl``` Declare a global function suitable for use with C


```cextern``` Declare a function defined in an object file from gcc

```lambda``` Declare a lambda function in your code somewhere

## Primitive Types

C flat major uses the same primitive types as modern C: char, short, int, long, float, double, bool

## Precompiler Directives

Many of the c flat precompile directives are the same as modern C, but there are a few extras.

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

```#if``` Everything between this directive and its respective ```endif``` directive will only be compiled if the expression provided does not evaluate to zero.
EX: ```#if 1||0&&1^(1||0) 
... 
#endif```

```#endif``` End a precompile if structure

```#link``` Specify a path to an object file to link
EX: ```#link "path/to/my/objectfile/lib.o"```

```#warning``` Emit a warning
EX: ```#warning "Something is not right"```

```#error``` Emit an error, and stop compilation
EX: ```#error "Something is wrong"```

### Dereferencing

Dereferencing in C flat is different than modern C because it uses the ```@``` operator.

You can dereference a pointer with the ```@``` operator.

This is the same as taking the 0th index.

Example:

```cpp
printf("%i\n", @myarr);
```


### Referencing

You can take a pointer to a variable using the ```&``` operator

Example:

```C
int a;
getValue(&a);
printf("%i\n", a);
```

## Control Structures

(The majority of control structures will look exactly like C family languages.)

### Switch statement

The only different control structure is a switch statement, which uses curly brackets instead of a colon.

Example:

```cpp
switch(expression){

  case constexpr{
    
    printf("expression = constexpr");
    break;
  
  }
  
  case constexpr2{
    
    printf("expression = constexpr2");
    break;
  
  }

}
```


## Example Program

Here is a more lengthy example program showing off more C flat functionality:

```cpp
#include "cblib.cb"
/**
 * miscfn can take in an 'x' of any type that can be added, multiplied and divided.
 * The returntype of miscfn can be automatically determined by the compiler.
 */
template<typename T> // T is an ambiguous type to be determined later
auto miscfn(T x){
    return x+(x*10)/(x+22);
}
// args is a vector (dynamic array) of c strings.
// vector is defined in the standard library
vector<char*> args;
/**
 * The main function normally returns int, and accepts an int argc, and char** argv
 */
int main(int argc, char** argv){
    // cout is an output stream object defined in the standard library used
    // for printing like in c++
    cout << "Your arguments were: " << endl;
    // for range will take values of i between 0, and argc
    // range is defined in the standard library
    for range(i, argc){
        // printf is almost identical to the C printf
        printf("%s, ",argv[i]);
        // add the argument to the vector
        args.push_back(argv[i]);
    }
    // add a newline character
    puts("\n");
    // call our miscfn on our number of arguments, after it is implicitly casted to a double
    cout << miscfn<double>(argc) << endl;
    // the type of 'adder' is determined automatically per the 'auto' keyword.
    // The type of adder will evaluate to function int(int), or in C typing: int(*adder)(int)
    // The lambda declaration here will create a new anonymous function with the body shown.
    auto adder = lambda int (int x) { return x+1; };
    // More complex lambda, with spelled out type
    function int (int, int) mult = lambda int(int x, int y) {return x*y;};
    // Even more complex lambda:
    // The type of miscop would evaluate to: 
    //          function int (int, int, function int(int, int))
    // Or in C typing:
    //          int (*miscop)(int, int, int(*fn)(int, int))
    auto miscop = lambda int (int x, int y, function int(int, int) fn ) { return fn(x,y); };
    // We can now find and print our result at the same time, because the '='
    // operator will return the value.
    int result;
    cout << ( result = miscop(adder(adder(mult(2,3))), 3, mult) );

    // This switch can only evaluate to 24 because we fed our expression above constants.
    switch (result){
    case 24
        {
        printf("\nThe result is 24.");
        break;
        }
    case 10
        {
        printf("\nYour CPU is broken.");
        break;
        }
    }
    // return 0 for success
    return 0;

}
```


