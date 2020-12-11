#define __CBLIB_SOURCE
#include "cblib.cb"

//long test = LONG_MAX;


int main(unsigned int argc, char** argv){
	
	double test = 2.3;
	double* t2 = &test;
	double t3 = @t2;
	
	return 0;
}
