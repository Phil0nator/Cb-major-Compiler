#define __CBLIB_SOURCE
#include "cblib.cb"

long test = LONG_MAX;

int main(int argc, char** argv){
	
	//1000000
	for range(i, 1000000){
		fprintf(-1, "Test: %i\n", LONG_MAX/4);
	}

    return 0;
}
