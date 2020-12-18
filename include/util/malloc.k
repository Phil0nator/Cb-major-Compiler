/*
    MIT License
    Copyright (c) 2020 Philo Kaulkin

    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in all
    copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
    EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
    MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
    IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
    DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
    OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE
    OR OTHER DEALINGS IN THE SOFTWARE.
*/




#define MALLOC_PAGESIZE 4096
#define MALLOC_PAGESIZE_ADJUSTED (MALLOC_PAGESIZE-sizeof(mblock))
#define MALLOC_USERPTR(localptr) ((localptr)+sizeof(mblock))
#define MALLOC_LOCALPTR(userptr) ((userptr)-sizeof(mblock))



/**
 * malloc_maxcache determines the maximum amount of memory to keep in the free_head
 * linked list. Once the amount of memory held in the free_head is greater than this,
 * the addresses being freed will be unmapped instead of added to free_head.
 * If malloc is called with a value larger than malloc_maxcache, it will be added to
 * malloc_maxcache to make the program smoother for massive memory segments.
 */
size_t malloc_maxcache = (MALLOC_PAGESIZE * 128);

/**
 * mblock's form the metadata used at the begining of malloc'd blocks of memory.
 */
struct mblock{
    /**
     * Size refers to the size of the allocated area, minus the meta data.
     * e.g:
     *   malloc(100) -> mblock.size of 100,
     *  even though the actual mapped area will be 100 + sizeof(mblock)
     */
    size_t size;
    /**
     * next and prev are used as linked list pointers because mblocks are stored in a 
     * linked list which is started in free_head. 
     */
    mblock* next;
    mblock* prev;
    
    /**
     * free: 0 = in use, 1 = free.
     * The data type is long for memory alignment. 
     */
    long free;


};

/**
 * free_head marks the begining of the linked list of mblocks.
 */
mblock* free_head = nullptr;
/**
 * cached_size keeps track of the number of bytes of memory cached in free_head.
 */
size_t cached_size = NULL;

/**
 * merge_right removes a given block from the linked list.
 * @param block a valid block to remove
 * @returns None
 */
void merge_right(mblock* b){
    if(b->next != nullptr){
        if(b->next->free == true){
            if(  ($mblock* b + b->size + sizeof(mblock) )== b->next ){
                b->size += b->next->size + sizeof(mblock);
                b->next = b->next->next;
                if(b->next){
                    b->next->prev = b;
                }

            }
        }
    }
}

/**
 * scan_merge is responsible for searching through cached mblocks to see if a newly
 * added block can be simply merged with an existing one instead of adding it on the end.
 * scan_merge will also perform address unmapping if the cached data exceeds malloc_maxcache.
 * @param b a mblock to test
 * @returns weather or not b needs to be added to the linked list
 */
bool scan_merge(mblock* b){

    if(cached_size > malloc_maxcache){
        cached_size -= b->size + sizeof(mblock);
        cached_size = clamp( cached_size, 0, INT_MAX);
        destroy_ptr(b);
        return false;
    }

    merge_right(b);
    merge_right(b->prev);

    return true;
}

/**
 * A more complex way to add a block to the linked list, which includes
 * the merge scan.
 * @param block block to add
 * @returns None
 */
void add_block(mblock* block){
    if(free_head == nullptr){

        free_head = block;
        block->prev = block;

        block->next = nullptr;
        return;
    }
    free_head->prev->next = block;
    free_head->prev = block;

}

/**
 * scan_existing searches through existing mblocks based on a size request.
 * Any blocks with a size greater than or equal to request, will be split and returned.
 * On failure, scan_existing returns nullptr;
 * @param request minimum number of bytes needed
 * @returns A removed mblock with a size of exactly request, or nullptr if none are available 
 */
mblock* scan_existing(size_t request){

    if(free_head == nullptr){
        return nullptr;
    }

    for each_link(mblock,block,next,free_head){

        if(block->free == true){
            if(block->size >= request){

                split_block(block, request);
                block->free=false;
                return block;

            }
        }

    }


    return nullptr;

}

size_t appends = 0;
size_t deletions = 0;

/**
 * A debugging function to view the contents of the cached blocks
 */
void printstate(){
    printf("=======================\n");
    if(free_head == nullptr){
        printf("EMPTY\n");
    }else{
        for each_link(mblock, block, next, free_head){
            printf("BLOCK: %i @ %x : %i\n", block->size, block, block->free);

        }
    }

    printf("Appends: %i, Deletions %i, Cache: %u\n",appends,deletions, cached_size);


    printf("=======================\n");
}

/**
 * Map memory for a new pointer.
 * @param size number of bytes to allocate
 * @returns a newly mapped pointer of size bytes
 */
mblock* create_ptr(size_t size){
    void* ptr = qmmap(size);
    if (ptr > 0){
        return ptr;
    }
    printf("Malloc:%i: Bad mmap: ", __LINE__, strerror(ptr));
    exit(1);
    return nullptr;
}
/**
 * Unmap memory of an old pointer.
 * @param ptr a valid block to unmap
 * @returns None
 */
inline void destroy_ptr(mblock* ptr){
    return munmap(ptr, ptr->size+sizeof(mblock));
}

/**
 * split_block is responsible for taking a large mblock and splitting its data into two parts.
 * For example, splitting a block of size 1024 into a 256 byte block e.g:
 *  | {1024 , next, prev} | -----------------------|
 *  ^
 * Given pointer
 *                       new space
 *                           \/
 *  | {256, next, prev}   | ---- | {1024 - 256 - sizeof(mblock), next, prev } | ------------| 
 *  ^                            ^                                            ^
 * Given pointer     Added block to cache                               cached space
 * 
 * Because a new block would require an new mblock region, there is an inhearent memory cost of (sizeof(mblock))
 * for every split. So, if the destination size is less than sizeof(mblock) in difference from the original size,
 * No changes are made to the block.
 * @param block a block to split
 * @param destsize the new size for the block
 * @returns None
 */
void split_block(mblock* block, size_t destsize){

    if((block->size - destsize - sizeof(mblock) )<= sizeof(mblock)){
        return;
    }

    mblock* newblock = block+destsize+sizeof(mblock);
    newblock->prev=block;
    newblock->next=block->next;


    
    if(block->next){
        block->next->prev = newblock;
    }

    block->next=newblock;
    
    newblock->size = (block->size -destsize) - sizeof(mblock);
    newblock->free = true;
    block->size = destsize;


}




void free(void* usrptr){
    if (usrptr==nullptr){
        return;
    }
    mblock* block = MALLOC_LOCALPTR(usrptr);
    if(block->size >= MALLOC_PAGESIZE){
        block->size+=sizeof(mblock);
        destroy_ptr(block);
        return;
    }
    block->free = true;
    scan_merge(block);

}


void* malloc(size_t size){

    mblock* out;
    if(size >= MALLOC_PAGESIZE){
        
        out = create_ptr(size+sizeof(mblock));
        out->size = size;
        out->next = nullptr;
        out->prev = nullptr;
        out->free = false;
        return MALLOC_USERPTR(out);

    }

    if(free_head != nullptr){

        out = scan_existing(size);
        if(out){
            out->free=false;
            return MALLOC_USERPTR( out );
        }

    }



    out = create_ptr(MALLOC_PAGESIZE);
    out->size = MALLOC_PAGESIZE-sizeof(mblock);
    add_block(out);
    split_block(out, size);
    out->free=false;
    return MALLOC_USERPTR( out );


}



void* realloc(void* addr, size_t newsize){
    
    mblock *block = MALLOC_LOCALPTR(addr);
    size_t oldsize = block->size;

    if(oldsize < MALLOC_PAGESIZE){

        free(addr);
        void* newaddr = malloc(newsize);
        if ( addr == newaddr ){
            return addr;
        }
        memcpy(newaddr, addr, oldsize);
        return newaddr;
    
    }

    mmap(addr,newsize, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, 0, 0);
    return addr;
}



void* calloc(size_t size){
    void* out = malloc(size);
    memzer(out, size);
    return out;
}



void* mapalloc(size_t size){
    void* out = qmmap(size+sizeof(long));
    @out = size;
    return out+sizeof(long);
}

void mapfree(void* ptr){
    ptr-=sizeof(long);
    size_t size = @ptr;
    munmap(ptr, size);

}

void maprealloc(void* ptr, size_t newsize){
    mmap(ptr, newsize, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, 0, 0); 
}