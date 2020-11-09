
#ifndef __ALGORITHM
#define __ALGORITHM 1

#include "memory.k"

typedef void* iterable;

#define for_each(array, length, fn) for(size_t __foreachiterator__ = 0; __foreachiterator__ < length; __foreachiterator__++) {\
                                        fn((array)[__foreachiterator__]);\
                                    }

#define IMPLIES(x, y) (!(x) || (y))

#define newarray(type, amt) malloc(type*amt)
#define new(type) malloc(type)
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

#define none_of(array, items, cmpfn) none_of_raw(array, typeof(@(array)), items, cmpfn)

#define each(varname, array, items) (size_t varname = 0; varname < (items); varname++)

#define each_in(varname, array, items) (iterable varname = (array); varname < (array) +  items*typeof((array))  ; varname += typeof(array))

#define HALT() __haltlabel__:goto __haltlabel__


#endif