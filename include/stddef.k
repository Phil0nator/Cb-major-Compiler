/* The <stddef.k> header contains important data type definitions copied from <sys/types.h> from C.
 * It is considered good programming practice to use these definitions, 
 * instead of the underlying base type.  By convention, all type names end 
 * with _t.
 */

void* nullptr = 0;

void null = 0;

const char nullterm = 0;

/* The type size_t holds all results of the sizeof operator. */

typedef unsigned int size_t;

typedef unsigned int time_t; /* time in sec since 1 Jan 1970 0000 GMT */

typedef int ssize_t; /* The type ssize_t holds all signed results of the sizeof operator. */

typedef int ptrdiff_t;

typedef int clock_t; /* unit for system accounting */



typedef char i8_t; /* 8 bit signed type */


/*
  * Default boolean values;
*/
const bool true  = 1;
const bool false = 0;

/*
  * float == double
*/
typedef double float;

typedef short int32;