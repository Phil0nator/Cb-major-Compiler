#include "cblib.cb"

#define TEST __python("pow(2,3)")

int main(int argc){

    printf("%i\n", TEST);

}