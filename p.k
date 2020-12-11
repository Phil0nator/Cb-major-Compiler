//#define __CBLIB_SOURCE
#include "cblib.cb"

//long test = LONG_MAX;

struct Test{

	char t;
	long value;

	function long get(){
		return value;
	}

};

int main(unsigned int argc, char** argv){
	
	Test test;
	test.value = 36;
	printf("%i\n", test.get());
	return 0;
}
