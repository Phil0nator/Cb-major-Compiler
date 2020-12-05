#ifndef __RAND
#define __RAND 1



int rand_next = 1;

/**
*
* int rdrand() is a wrapper for the very slow x86 rdrand instruction which outputs cryptographically secure random integers.
*
*/
inline int rdrand(){
    __asm{"rdrand rax"}
}

/**
*
* int rand() uses xorshift randomness to get multiple random numbers out of one 
*   rdrand call for faster but less secure random numbers.
* The srand() function must be called first before any useful numbers can be produced by rand().
*   \see srand()
*/
function int rand(){
    rand_next = rand_next ^ (rand_next << 13);
    rand_next = rand_next ^ (rand_next >> 17);
    rand_next = rand_next ^ (rand_next << 5);
    return rand_next;
}

/**
* srand() sets the seed for the speed-oriented rand() function.
*   \see rand()
*/
function void srand(){
    rand_next=rdrand();
}

#endif