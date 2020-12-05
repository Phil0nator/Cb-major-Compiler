
/**
 * assert.k provides basic assertions for debugging.
 * EX: 
 *      assert(x == 5);
 *          This will print out an error like: "file.k:lineno: Assertion ' x == 5' failed." into STDERR,
 *          and exit the program if x does not equal 5.
 * 
 * When NDEBUG is defined, assert will do nothing. For release versions of code,
 * the NDEBUG flag should always be set if you are using assert for debugging because
 * the NDEBUG flag ensures that your assert calls affect neither compile time nor runtime. 
 * 
 */

#ifndef __ASSERT
#define __ASSERT 1

#include "io/printf.cb"
#include "sys/pth.k"

#ifndef NDEBUG
/**
 * Assert that condition x is true, otherwise print error and abort.
 */
#define assert(x) __assert(x, __FILE__, \ 
                            __LINE__, __STRINGIFY__(x)) 
#endif
#ifdef NDEBUG
#define assert(x) (1)
#endif


function void __assert(bool condition, char* fname, int line, char* assertion){

#ifndef NDEBUG
    if(!condition){

        eprintf("%s:%i: Assertion '%s' failed.\n", fname, line, assertion);
        exit(1);
    }
#endif

}


#endif