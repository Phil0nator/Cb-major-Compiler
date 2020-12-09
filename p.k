#define __CBLIB_SOURCE
#include "cblib.cb"



int main(int argc, char** argv){
    
    "%f\n";
    "%i\n";
    static_cast<void, long>(argc);
    __asm{"
    push rbp
	mov rbp, rsp
	sub rsp, 32
    	mov [rbp-8], rdi
	mov [rbp-16], rsi
	sub rsp, 256
	mov rax, rsp
.L0x1:
	mov qword[rbp-24], rax
	mov rsi, 256
	mov rdi, qword[rbp-24]
	call _void_memzer_pvoid.size_t
	mov qword[rbp-32], 0
	jmp .L0x4
.L0x3:
	xor r9, r9
	xor r8, r8
	xor rcx, rcx
	movsd xmm7, qword[FLT_CONSTANT_15]
	movsd xmm0, xmm7
	call _double_sin_pdouble
	movsd xmm7, xmm0
	cvttsd2si rdi, xmm7
	call _void_static_cast_plong
	mov rdx, rax
	mov rsi, STRING_CONSTANT_173
	mov rbx, qword[rbp-24]
	mov rdi, rbx
	call sprintf
	xor r9, r9
	xor r8, r8
	xor rcx, rcx
	mov rdx, 288230376151711744
	mov rsi, STRING_CONSTANT_174
	mov rbx, qword[rbp-24]
	mov rdi, rbx
	call sprintf
.L0x5:
	inc qword[rbp-32]
.L0x4:
	cmp qword[rbp-32], 25000000
	jl .L0x3
.L0x6:
	mov rbx, qword[rbp-24]
	mov rdi, rbx
	push rdi
	mov rsi, rdi
	mov rdi, 1
	call _size_t_fputs_pFILEchar.
	mov rbx, rax
	pop rdi
	mov rax, rbx
.L0x8:
    leave
    "}


    return 0;
}
