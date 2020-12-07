#ifndef __ASSERT
#   error "assert.k should only be included through assert.cb"
#endif

void __assert(bool condition, char* fname, int line, char* assertion){

    if(!condition){

        eprintf("%s:%i: Assertion '%s' failed.\n", fname, line, assertion);
        exit(1);
    }

}