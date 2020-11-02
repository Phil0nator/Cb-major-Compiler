#include "std.k"

function int isprime( unsigned long data )
{
     //printf(self);


     printf("%i",data);
     //unpack data
     unsigned int position = data&&0xf;
     unsigned long test = data>>4;
     printf("position:%i\nvalue:%i",position,test);	

     // 
     long testn = 2;
     long divOut = testn+1;     
     long divMod;

     while (divOut > testn){
     	
	divOut = test/testn;
	divMod = test%testn;
	//printf("divOut:%d\ndivMod:%d\n",divOut,divMod);
	if (divMod == 0){
		return(0);
	}
     	//printf("%d\n",test);
	testn++;
     }
     printf("%i",test);
     return(1);

}

function int main(){

unsigned long val = 16;
unsigned int position = 2;
unsigned long data = (val << 4) + position;
printf("%i\n",data);


printf("\n%i\n",0);
printf("\n\n%i\n",isprime(data));


}
