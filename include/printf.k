/*
  *    <printf.k> contains some printf rappers for convenience, and some print(x) functions for primitive types.
*/











function void printf(char* template, int format){

    __asm{"
    
    ALIGN_STACK
    call printf
    FFLUSH_STDOUT
    UNALIGN_STACK


    "}

}
function void printf(char* template){

    __asm{"
    
    ALIGN_STACK
    call printf
    FFLUSH_STDOUT
    UNALIGN_STACK


    "}

}
function void printf(char*template, unsigned int format){
    
    __asm{"
    
    ALIGN_STACK
    call printf
    FFLUSH_STDOUT
    UNALIGN_STACK


    "}
}
function void printf(char* template, double f){

    __asm{"
    
    ALIGN_STACK
    ;cvtps2pd xmm0, xmm0
    call printf
    FFLUSH_STDOUT
    UNALIGN_STACK


    "}

}
function void printf(char* template, char* other){

    __asm{"
    
    ALIGN_STACK
    call printf
    FFLUSH_STDOUT
    UNALIGN_STACK


    "}

}

function void printf(char* template, int a, int b){

    __asm{"
    
    ALIGN_STACK
    call printf
    FFLUSH_STDOUT
    UNALIGN_STACK


    "}

}

function void printf(char* template, double a, double b){
    __asm{"
    
    ALIGN_STACK
    ;cvtps2pd xmm0, xmm0
    ;cvtps2pd xmm1, xmm1
    call printf
    FFLUSH_STDOUT
    UNALIGN_STACK


    "}


}

function void print(int a){

    printf("%i\n", a);

}

function void print(unsigned int a){

    printf("%u\n", a);

}

function void print(double a){
    printf("%lf\n", a);
}

function void print(char* a){

    __asm{"
    

    PRINT_STRING [rdi]
    NEWLINE
    "}

}
function void print(char a){

    __asm{"

     PRINT_CHAR rdi
     NEWLINE   

    "}

}
function void print(bool a){

    if(a){
        print("True");
        return 0;
    }
    print("False");
    return 0;

}