#ifndef __STACK
#   error "Stack.k should only be included through Stack.cb"
#endif


void Stack::feed(void* nptr){
    base = nptr;
}

void Stack::alloc(size_t nsize){
    size = nsize;
    base = mapalloc(nsize);
}

void Stack::destroy(){
    mapfree(base);
}