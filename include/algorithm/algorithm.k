#ifndef __ALGORITHM
#   error "algorithm.k should only be included through algorithm.cb"
#endif

bool all_of_raw(iterable array, size_t itemsize,size_t itemcount, void* cmpfn){
    register iterable max = array+(itemsize*itemcount);
    for(iterable a = array; a < max;a+=itemsize){
        if(!cmpfn(@a)){

            return false;
        }
    }

    return true;
}

bool any_of_raw(iterable array, size_t itemsize, size_t items, void* cmpfn){
    register iterable max = array+(itemsize*items);
    for(iterable a = array; a < max; a+=itemsize){
        if(cmpfn(@a)){
            return true;
        }
    }
    return false;
}

bool none_of_raw(iterable array, size_t itemsize, size_t items, void* cmpfn){
    register iterable max = array+(itemsize*items);
    for(iterable a = array; a < max; a += itemsize){
        if(cmpfn(@a)){
            return false;
        }
    }
    return true;
}

