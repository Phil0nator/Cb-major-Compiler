#include "std.k"


function int main(){


     

     fd_t fd = fopen("testing.txt", "w+");

     long err;
     char* contents = malloc(100);
     err = fputs(fd, "This is other text\n");
     if (err < 0){
          printf(strerror(err));
     }
     
     lseek(fd,0,SEEK_SET);
     err = fgets(fd, contents, 100);

     if(err < 0){
          printf(strerror(err));
     }

     printf(contents);

}
