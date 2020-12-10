#define __CBLIB_SOURCE
#include "cblib.cb"

long test = LONG_MAX;

int main(unsigned int argc, char** argv){
	
	auto test = argv%2;
	printf("test; %i\n", test);

    return 0;
}
