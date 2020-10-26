#ifndef __MALLOC
#define __MALLOC 1
#include "stddef.k"
typedef int intptr_t;

#define ALLOC_UNIT 3*_SC_PAGESIZE
#define MIN_DEALLOC _SC_PAGESIZE


struct block_t{
    size_t size;
    block_t* next;
    block_t* prev;

};
block_t* head = NULL;



#endif