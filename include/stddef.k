/**
 * The <stddef.k> header contains important data type definitions copied from <sys/types.h> from C.
 * By convention, type names end with _t.
 */
#ifndef __STDDEF
#define __STDDEF 1

#include "io/io.k" /* IO stream definitions */
#include "sys/syscall.k" /* syscall macro */


#define nullptr 0

#define NULL 0

char nullterm = 0;

/* The type size_t holds all results of the sizeof operator. */

typedef unsigned long size_t;


typedef long ssize_t; /* The type ssize_t holds all signed results of the sizeof operator. */

typedef int ptrdiff_t;

typedef void any_t;


typedef char i8_t; /* 8 bit signed type */
typedef short i16_t; /* 16 bit signed type */
typedef long int64_t; /* 64 bit signed type */
typedef unsigned long uint64_t; /* unsigned 64 bit type */

/*
  * Default boolean values;
*/
#define true    1
#define false   0

/*
  * float == double
*/
typedef double float;

typedef short int32;


#define MAX_INT 9223372036854775807
#define MAX_UINT 18446744073709551615

inline long __inline__syscall(long call){__asm{"
  mov rax, rdi
  syscall
"}}


#ifdef __GNUC__
/**
 * Compatibility with common syntax highlighting, but will never be compiled.
 */
#define global
#define function
#define __cdecl
#define cextern extern

#endif


#endif