#include "include/printf.k"
#include "include/stddef.k"
#include "include/memory.k"





struct Test{

    int a;
    int b;
    int c;
    char *str;

};




function int main(int argc, char** argv){

    int *stuff = malloc(100*int);

    Test *st = malloc(Test*2);
    st[1]->a = 32;
    st[1]->b = 26;
    st[0]->b = 5235;

    print(st[0]->b);

    return 0;
}