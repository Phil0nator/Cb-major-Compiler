/**
 * algorithm contains macros and functions designed to make algorithms easier to read and write.
 */
#ifndef __ALGORITHM
#define __ALGORITHM 1

#include "memory.k"

/* iterable pointer datatype */
typedef void* iterable;

/**
 * Do function fn for each item in ptr array of length.
 * @returns Does not return
 */
#define for_each(array, length, fn) for(size_t __foreachiterator__ = 0; __foreachiterator__ < length; __foreachiterator__++) {\
                                        fn((array)[__foreachiterator__]);\
                                    }
/**
 * The value of x implies y
 */
#define IMPLIES(x, y) (!(x) || (y))

/**
 * Construct a heap-based array of type with amt elements
 */
#define newarray(type, amt) malloc(type*amt)
/**
 * Dynamically allocate one object/primitive of type type
 */
#define new(type) malloc(type)
/**
 * Deallocate
 */
#define delete(ptr) free(ptr)


global bool all_of_raw(iterable array, size_t itemsize,size_t itemcount, void* cmpfn){
    register iterable max = array+(itemsize*itemcount);
    for(iterable a = array; a < max;a+=itemsize){
        if(!cmpfn(@a)){

            return false;
        }
    }

    return true;
}
/**
 * Use cmpfn to compare all elements of an array.
 * @param array the array to use
 * @param items number of items
 * @param cmpfn comparison function (return boolean)
 * @returns true if cmpfn returns true for all elements, else none
 */
#define all_of(array,items,cmpfn) all_of_raw(array, typeof(@(array)) ,(items), cmpfn)


global bool any_of_raw(iterable array, size_t itemsize, size_t items, void* cmpfn){
    register iterable max = array+(itemsize*items);
    for(iterable a = array; a < max; a+=itemsize){
        if(cmpfn(@a)){
            return true;
        }
    }
    return false;
}
/**
 * Use cmpfn to compare all elements of an array.
 * @param array the array to use
 * @param items number of items
 * @param cmpfn comparison function (return boolean)
 * @returns true if cmpfn returns true for any elements, else none
 */
#define any_of(array, items, cmpfn) any_of_raw(array, typeof(@(array)), items, cmpfn)

global bool none_of_raw(iterable array, size_t itemsize, size_t items, void* cmpfn){
    register iterable max = array+(itemsize*items);
    for(iterable a = array; a < max; a += itemsize){
        if(cmpfn(@a)){
            return false;
        }
    }
    return true;
}
/**
 * Use cmpfn to compare all elements of an array.
 * @param array the array to use
 * @param items number of items
 * @param cmpfn comparison function (return boolean)
 * @returns true if cmpfn returns true for no elements, else none
 */
#define none_of(array, items, cmpfn) none_of_raw(array, typeof(@(array)), items, cmpfn)

/**
 * Loop header for a for loop that traverses an array.
 */
#define each(varname, array, items) (size_t varname = 0; varname < (items); varname++)

/**
 * Loop header for a for loop that traverses an array with an iterator.
 */
#define each_in(varname, array, items) (iterable varname = (array); varname < (array) +  items*typeof((array))  ; varname += typeof(array))

/**
 * Perminantly halt the calling process until it is stopped by a signal.
 */
#define HALT() __haltlabel__:goto __haltlabel__

/**
 * Scalar swap a with b. (both a and be must be variables / scalar values in memory)
 * @param a a variable
 * @param b b variable
 * @returns Does not return
 */
#define swap(a, b) a = a ^ b; b = a ^ b; a = a ^ b

#endif