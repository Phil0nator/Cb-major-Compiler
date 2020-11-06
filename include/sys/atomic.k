#ifndef __ATOMIC
#define __ATIMIC 1

inline long _atomic_cmpxchg(long* atom, long* expected, long desired){
    __asm{"
        mov rax, [rsi]
        lock cmpxchg qword[rdi], rdx
        jz %L__end
        mov rax, [rdi]
        mov [rsi], rax
        %L__end:
    "}
}

inline int _atomic_cmpxchg(int* atom, int* expected, int desired){
    __asm{"
        mov eax, [rsi]
        lock cmpxchg dword[rdi], edx
        jz %L__end
        mov eax, [rdi]
        mov [rsi], eax
        %L__end:
    "}
}

inline int _atomic_sub(int* atom, int subtractor){
    __asm{"
    xor rax, rax
    mov eax, [rdi]
    lock sub dword[rdi], esi
    "}
}

inline void _atomic_store(int* atom, int newval){
    __asm{"

        lock xchg dword[rdi], esi
    
    "}
}




#endif