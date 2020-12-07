#ifndef __STACK
#   error "Stack.k should only be included through Stack.cb"
#endif


void Stack::feed(void* ptr){
        this->base = ptr;
}

void Stack::alloc(size_t size){
    this->size = size;
    this->base = mapalloc(size);
}

void Stack::destroy(){
    mapfree(this->base);
}