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

#define PROT_READ       0x1
#define PROT_WRITE      0x2
#define PROT_EXEC       0x4
#define PROT_NONE       0x0

#define PROT_GROWSDOWN  0x01000000
#define PROT_GROWSUP    0x02000000

#define MAP_SHARED      0x01
#define MAP_PRIVATE     0x02

#define MAP_FIXED       0x10
#define MAP_FILE        0

#define MAP_ANONYMOUS 0x20


struct block_t{
    size_t size;
    block_t* next;
    block_t* prev;

};
block_t* free_memory = nullptr;

fd_t zerofd = NULL;


function void remove_page(block_t* block){

    block->prev->next = block->next;
    block->next->prev = block->prev;

}

function void add_page(block_t* page){

    if(free_memory ==  nullptr){
        free_memory = page;
        return;
    }

    
    page->next=free_memory;
    page->next->prev=page;
    free_memory=page;

    
    

}


function void populate_zerofd(){
    zerofd = fopen("/dev/zero", "r+");
}


function void* _scan(size_t size){

    if(free_memory == nullptr){return nullptr;}
    block_t* ptr = free_memory;

    while(ptr->next != nullptr){
        
        if(ptr->size >= size){
            remove_page(ptr);
            return ptr+block_t;

        }
        
        
        ptr = ptr->next;
        
    }


    return nullptr;


}


global void* mlc(size_t size){
    


    size+=block_t;
    size_t allocsize;
    if (size < ALLOC_UNIT){
        allocsize = ALLOC_UNIT;
    }else{
        allocsize = size + (size % _SC_PAGESIZE);
    }
    void* ptr = _scan(allocsize);

    if(ptr == nullptr){
        
        if(!zerofd){
            populate_zerofd();
        }

        int s = size;
        ptr = mmap(0, s, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, zerofd, 0);
        block_t header;
        header.size = size;
        header.next=0;
        header.prev=0;

        memcpy(ptr, &header, block_t);

        ptr+=block_t;
    }



    return ptr;
    

}


global void fr(void* ptr){


    ptr-=block_t;
    add_page(ptr);


}


#endif