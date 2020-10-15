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
function void printf(char* template, void a, void b, void c){
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
mov rax, 1
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
call printf
FFLUSH_STDOUT
UNALIGN_STACK


    "}


}

function void print(int a){

    printf("%li\n", a);

}
function void print(short a){
    __asm{
        "PRINT_DEC 4, rdi
        NEWLINE
        "
    }
}

function void print(unsigned int a){

    printf("%lu\n", a);

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
function void print(void* a){
    int ptr = a;
    print(ptr);
}

// Array printing functions: 
function void print(int* a, int len){

    if(len == 0){
        print("[]");
        return 0;
    }

    printf("[",0);
    for(int i = 0; i < len-1;i++){

        printf(" %i ,", a[i]);

    }
    printf(" %i ]\n", a[len-1]);

}