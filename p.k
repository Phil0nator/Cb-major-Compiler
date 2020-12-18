#define __CBLIB_SOURCE
#include "cblib.cb"


int main(int argc){
    
    char* test = malloc(50);
    strcpy(test, "test123\n");
    puts(test);
    printf("123hd: %i%s",123,"hd\n");

    return 0;
}
