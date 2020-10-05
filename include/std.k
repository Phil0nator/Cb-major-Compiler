
#include "include/stddef.k"

#include "include/printf.k"

#include "include/math.k"

#include "include/memory.k"

function void exit(int code){

    __asm{"
    
    mov rax, 60
    syscall
    
    "}

}