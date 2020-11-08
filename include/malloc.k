/**
 * malloc provides higher level memory management.
 */
#ifndef __MALLOC
#define __MALLOC 1
#include "stddef.k"
#include "filesystem.k"
typedef int intptr_t;
typedef int off_t;
#define ALLOC_UNIT 3*_SC_PAGESIZE
#define MIN_DEALLOC _SC_PAGESIZE

global void* mmap(void* addr, size_t length, int prot, int flags, int fd, off_t offset){
    __asm{"
    mov rax, 9
    syscall
    "}
}



struct block_t{
    size_t size;
    block_t* next;
    block_t* prev;

};
block_t* head = NULL;

function void* add_page(){}


global void* mlc(size_t size){
    


    
    size_t allocsize;
    if (size < ALLOC_UNIT){
        allocsize = ALLOC_UNIT;
    }else{
        allocsize = size + (size % _SC_PAGESIZE);
    }

    void* ptr;
    if(head == NULL){
        fd_t fd = fopen("/dev/zero", "r+");
        int s = allocsize;
        ptr = mmap(0, s, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, fd, 0);
        close(fd);
        block_t newhead;

        newhead.size = allocsize;
        newhead.next=0;
        newhead.prev=0;

        memcpy(ptr, &newhead, block_t);
        head = ptr;
        ptr+=block_t;
        return ptr;
        

    }

}


#endif