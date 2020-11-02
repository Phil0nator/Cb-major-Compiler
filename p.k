#include "std.k"

inline int add2(int x){
     printf("x: %i\n", x);
     if( x== 3){
          return 2;
     }else{
          return 5;
     }
}



function int main(){

     printf("%i\n", add2(2));
     printf("%i\n", add2(3));


}
