#include "std.k"


int main(long argc, char** argv){


    unsigned int a;unsigned int b;unsigned int c;unsigned int d;
    a=1;
    b=0;
    c=0;
    d=0;
    native_cpuid(&a,&b,&c,&d);
    printf("%b4\n",a);
    printf("%i\n", GETBIT(a,4));

    return 0;
}
