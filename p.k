#define __CBLIB_SOURCE
#include "cblib.cb"






int testFunction(int* input, int length) {
  register int sum = 0;
  for (int i = 0; i < length; ++i) {
    sum += input[i];
  }
  return sum;
}




int main(unsigned int argc, char** argv){
	

}
