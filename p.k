#define __CBLIB_SOURCE
#include "cblib.cb"


int main(){
    for (register int i = 0; i < 5000000; i++){
        fprintf(-1, "This is sin(pi/4): %f\n", sin(M_PI_4));
    }
    return 0x0;
}
