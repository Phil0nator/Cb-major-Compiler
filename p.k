#define __CBLIB_SOURCE
#include "cblib.cb"








int main(unsigned int argc, char** argv){
	int number = 69;
   
  printf("Enter an integer: ");  
  
  char* buffer = "123456";
  // reads and stores input
  sscanf("%i", buffer, &number);

  // displays output
  printf("You entered: %i", number);
  
  return 0;

}
