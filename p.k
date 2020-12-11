#define __CBLIB_SOURCE
#include "cblib.cb"

long test = LONG_MAX;


int main(unsigned int argc, char** argv){
	
	
	printf("test; %i\n", log(100));
	char* test = malloc(100);
	strcpy(test, @argv);
	printf(test);
	free(test);
	printf(test);
		

    return 0;
}
