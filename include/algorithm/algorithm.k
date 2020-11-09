
#ifndef __ALGORITHM
#define __ALGORITHM 1

#include "memory.k"

typedef void* iterable;

#define foreach(array, length, fn) for(size_t __foreachiterator__ = 0; __foreachiterator__ < length; __foreachiterator__++) {\
                                        fn(array[__foreachiterator__]);\
                                    }

#define IMPLIES(x, y) (!(x) || (y))

#define newarray(type, amt) malloc(type*amt)
#define new(type) malloc(type)

#define vec3i_add(v1, v2) __simd 4 int (v1, 0) {(+, v2, 0)} (v1, 0)




#endif