#define __CBLIB_SOURCE
#include "cblib.cb"

template<typename T>
inline T add2(T a, T b){

    return a+b;

}



int main(long argc, char** argv){
    printf("Hello World!\n");
    

    double test = add2<double>(2.5, 3.6);
    printf("%f\n", test);
    int t2 = add2<int, int>(2,3);
    printf("%i\n", t2);

    return 0;
}
