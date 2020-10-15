typedef void* FILE_T;

function int getInt(char* msg){
    __asm{"
    PRINT_STRING [rdi]
    GET_DEC 8, rax
    "}
}
function unsigned int getUint(char* msg){
    __asm{"
    PRINT_STRING [rdi]
    GET_UDEC 8, rax
    "}
}
function char getChar(char* msg){
    __asm{"
    PRINT_STRING [rdi]
    GET_CHAR rax
    "}
}
function char getchar(){
    __asm{"call getchar"}
}

function int getHex(char* msg){
    __asm{"
    PRINT_STRING [rdi]
    GET_HEX 8, rax
    "}
}
function void getString(char* buffer, int maxlen, char* msg){
    __asm{"
    PRINT_STRING [rdx]
    GET_STRING [rdi], rsi 
    "}
}
function void fgets(char* buffer, int len, FILE_T file){

    __asm{"call fgets"}

}

function void get_stdin(){
    __asm{"call get_stdin"}
}

function char* getString(char* msg){
    
    size_t size = 80;
    char *str = malloc(size);
    int c;
    size_t len = 0;
    printf("%s", msg);
    c = getchar();

    while (c != 10) {
        //str[len] = c;
        if(len == size) {
            size = size * 2;
            str = realloc(str, size);
        }
        c = getchar();
        len=len+1;
    }
    str[len+1]=0;
    return realloc(str, len);



}


function int toInteger(char* str){

    __asm{
"
mov r8, rdi
xor rax, rax
xor rbx, rbx
mov rcx, -1
mov rdx, 1
_int_toint_lp1:
inc rcx
mov bl, [r8+rcx]
cmp bl, '0'
jl __int_toint_end
cmp bl, '9'
jg __int_toint_end

cmp bl, 0
jne _int_toint_lp1
dec r8
_int_toint_lp2:
xor rbx, rbx
mov bl, [ r8+rcx ]

sub rbx, 48 ; offset
imul rbx, rdx
add rax, rbx
imul rdx, 10

loop _int_toint_lp2
__int_toint_end:
"
    }


}