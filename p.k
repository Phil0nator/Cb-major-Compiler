#include "std.k"


int main(long argc, char** argv){


    bool avx = cpuid_getfeature(CPUID_SSE2);
    printf("%B\n", avx);


    return 0;
}
