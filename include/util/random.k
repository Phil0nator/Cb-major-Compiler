#ifndef __RAND
#   error "random.k should only be included through random.cb"
#endif


long rand_next = 1;

inline long rdrand(){
    __asm{"rdrand rax"}
}


long rand(){
    rand_next = rand_next ^ (rand_next << 13);
    rand_next = rand_next ^ (rand_next >> 17);
    rand_next = rand_next ^ (rand_next << 5);
    return rand_next;
}


void srand(){
    rand_next=rdrand();
}

void srand(long seed){
    rand_next=seed;
}