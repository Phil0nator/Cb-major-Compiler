
	section .data align=8
	section .bss align=8
	section .text align=16
	global main
_void_sort_pint.int:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov dword[rbp-8], 0
	jmp .L0xf
.L0xe:
	mov r10d, dword[rbp-8]
	mov dword[rbp-16], r10d
	jmp .L0x13
.L0x12:
	mov r10d, dword[rbp-16]
	mov rbx, rdi
	mov eax, r10d
	cdqe
	lea r10, [rbx+rax*4]
	mov r11d, dword[rbp-8]
	mov rbx, rdi
	mov eax, r11d
	cdqe
	lea r11, [rbx+rax*4]
	mov r10d, dword[r10]
	cmp r10d, dword[r11]
	jge .L0x16
	mov r10d, dword[rbp-16]
	mov rbx, rdi
	mov eax, r10d
	cdqe
	mov r10d, [rbx+rax*4]
	mov dword[rbp-24], r10d
	mov r10d, dword[rbp-16]
	mov rbx, rdi
	mov eax, r10d
	cdqe
	lea r10, [rbx+rax*4]
	mov r11d, dword[rbp-8]
	mov rbx, rdi
	mov eax, r11d
	cdqe
	mov r11d, [rbx+rax*4]
	mov [r10], r11d
	mov r10d, dword[rbp-8]
	mov rbx, rdi
	mov eax, r10d
	cdqe
	lea r10, [rbx+rax*4]
	mov r11d, dword[rbp-24]
	mov [r10], r11d
	jmp .L0x17
.L0x16:
.L0x17:
.L0x14:
	add dword[rbp-16], 1
.L0x13:
	cmp dword[rbp-16], esi
	jl .L0x12
.L0x15:
.L0x10:
	add dword[rbp-8], 1
.L0xf:
	cmp dword[rbp-8], esi
	jl .L0xe
.L0x11:
	xor rax, rax
	leave
	ret
main:
	push rbp
	mov rbp, rsp
	sub rsp, 300024
	mov dword[rbp-300016], 0
	jmp .L0x1
.L0x0:
	mov r10d, 74999
	sub r10d, dword[rbp-300016]
	lea rbx, [rbp-300008] 
	mov eax, r10d
	cdqe
	lea r10, [rbx+rax*4]
	mov r11d, dword[rbp-300016]
	mov [r10], r11d
.L0x2:
	add dword[rbp-300016], 1
.L0x1:
	cmp dword[rbp-300016], 75000
	jl .L0x0
.L0x3:
	mov esi, 75000
	lea rbx, [rbp-300008]
	mov rdi, rbx
	call _void_sort_pint.int
	xor eax, eax
__main__return:
	leave
	ret
	