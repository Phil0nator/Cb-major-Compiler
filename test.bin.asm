bits 64
extern _char._get_errstr_pvoid:
extern _void_native_cpuid_pcpuidreg_t.cpuidreg_t.cpuidreg_t.cpuidreg_t.:
extern _bool_cpuid_getfeature_pulong:
extern _bool_cpuid_getextended_pulong:
extern _long_pow_plonglong:
extern _double_pow_plonglong:
extern _double_pow_pdoublelong:
extern _long_ceil_pdouble:
extern _long_floor_pdouble:
extern _long_abs_plong:
extern _double_abs_pdouble:
extern _long_log_plong:
extern _long_log_plonglong:
extern _long_log2_plong:
extern _double_fmod_pdoubledouble:
extern _long_divmod_plonglonglong.:
extern _long_divmods_plonglonglong.:
extern _double_sin_pdouble:
extern _double_cos_pdouble:
extern _double_tan_pdouble:
extern _double_cot_pdouble:
extern _double_sec_pdouble:
extern _double_csc_pdouble:
extern _double_asin_pdouble:
extern _double_acos_pdouble:
extern _double_atan_pdouble:
extern _long_strcpy_pchar.char.:
extern _size_t_strlen_pchar.:
extern _char._memchr_pchar.charsize_t:
extern _int_memcmp_pchar.char.size_t:
extern _char._strcat_pchar.char.:
extern _char._strncat_pchar.char.size_t:
extern _char._strchr_pchar.char:
extern _int_strcmp_pchar.char:
extern _size_t_strcspn_pchar.char.:
extern _char._strerror_pvoid:
extern _int___sprintf_pchar.char.void.:
	extern sprintf
	extern sprintf
	extern sprintf
	extern sprintf
extern _fd_t_fopen_pchar.char.:
extern _size_t_fputs_pfd_tchar.:
extern _size_t_puts_pchar.:
extern _long_fgets_pfd_tchar.size_t:
extern _void._floads_pfd_t:
	extern printf
	extern printf
	extern printf
	extern printf
	extern printf
	extern eprintf
	extern eprintf
	extern eprintf
	extern eprintf
	extern eprintf
	extern fprintf
	extern fprintf
	extern fprintf
	extern fprintf
extern _void___assert_pboolchar.intchar.:
extern _void_free_pvoid.:
extern _void._malloc_psize_t:
extern _void._realloc_pvoid.size_t:
extern _void._calloc_psize_t:
extern _void._mapalloc_psize_t:
extern _void_mapfree_pvoid.:
extern _void_maprealloc_pvoid.size_t:
extern _void_memcpy_pvoid.void.size_t:
extern _void_avx_memcpy_pvoid.void.size_t:
extern _void_avx_memzeraligned_pvoid.size_t:
extern _void_avx_memzer_pvoid.size_t:
extern _void_memset_pvoid.ucharsize_t:
extern _void_memzer_pvoid.size_t:
extern _long_rand_p:
extern _void_srand_p:
extern _void_srand_plong:
extern _clock_t_clock_p:
extern _tm._gmtime_ptime_t:
extern _char._asctime_ptm.:
	extern timezone
	extern daylight
	extern tzname
	extern tzset
extern _tm._localtime_ptime_t:
extern _char._ctime_ptime_t:
extern _void_usleep_plong:
extern _int___SSCANF_pchar.char.void..:
	extern sscanf
	extern sscanf
	extern sscanf
	extern sscanf
	extern sscanf
extern _int_inet_aton_pchar.in_addr.:
extern _int_recv_pfd_tchar.size_tint:
extern _int_send_pfd_tchar.size_tint:
extern _void_feed_pStackvoid.:
extern _void_alloc_pStacksize_t:
extern _void_destroy_pStack:
extern _void_push_pStackvoid:
extern _void_pop_pStack:
extern _void_pop_pStackvoid.:
extern _void_set_pVec3fdoubledoubledouble:
extern _void_add_pVec3fVec3f.:
extern _void_sub_pVec3fVec3f.:
extern _void_mul_pVec3fVec3f.:
extern _void_div_pVec3fVec3f.:
extern _void_sqrt_pVec3f:
extern _double_dot_pVec3fVec3f.:
extern _void_.operator33_pVec3fVec3f.:
extern _void_.operator34_pVec3fVec3f.:
extern _void_.operator36_pVec3fVec3f.:
extern _void_.operator35_pVec3fVec3f.:
extern _double_.operator20_pVec3fVec3f.:
extern _err_t_init_pSocket:
extern _err_t_init_pSocketintintint:
extern _err_t_connect_pSocketchar.int:
extern _ssize_t_send_pSocketchar.:
extern _ssize_t_send_pSocketchar.size_t:
extern _err_t_close_pSocket:
extern _ssize_t_recv_pSocketchar.size_t:
extern _int_getInt_pchar.:
extern _uint_getUint_pchar.:
extern _char_getchar_p:
extern _size_t_getString_pchar.size_tchar.:
extern _int_toInteger_pchar.bool:
extern _int___scanf_pchar.void..fd_t:
	extern scanf
	extern scanf
	extern scanf
	extern scanf
	extern scanf
	extern scanf
	extern fscanf
	extern fscanf
	extern fscanf
	extern fscanf
	extern fscanf
extern _long_system_pchar.:
extern _void_mutex_cmpxchg_pmutex.intint:
extern _void_mlock_pmutex.:
extern _void_munlock_pmutex.:
extern _void_thread_create_pthread_t.__threadcallablevoid.:
extern _void_thread_join_pthread_t.:
	section .data align=8
__LC.F0: dq 0x0.0p+0
M_MINZERO_MEM: dq 0
__LC.S0: db `[`, 0
__LC.S1: db `%i, `, 0
__LC.S2: db `%i]\n`, 0
__LC.S3: db `Failed: %i/%i != %i, but %i`, 0
__LC.S4: db `127.0.0.1`, 0
__LC.S5: db `Lost connection to host.`, 0
__LC.S6: db `123hd0.5: \t %i%s%f`, 0
__LC.S7: db `hd`, 0
	section .bss align=8
	section .text align=16
	global main
_void__Dvector_pvector:
	push rdi
	mov rdi, qword[rdi+0]
	call _void_mapfree_pvoid.
	pop rdi
	mov rbx, rax
	xor rax, rax
___void__Dvector_pvector__return:
	ret
_void__Cvector_pvectorsize_t:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov [rbp-8], rsi
	push rdi
	mov rbx, qword[rbp-8]
	sal rbx, 2
	mov rdi, rbx
	call _void._mapalloc_psize_t
	pop rdi
	mov rbx, rax
	mov qword[rdi+0], rbx
	mov r10, qword[rdi+0]
	mov qword[rdi+8], r10
	mov rbx, qword[rbp-8]
	sal rbx, 2
	mov r10, qword[rdi+0]
	add r10, rbx
	mov qword[rdi+16], r10
	xor rax, rax
___void__Cvector_pvectorsize_t__return:
	leave
	ret
_void__Cvector_pvector:
	push rdi
	mov rdi, 40
	call _void._mapalloc_psize_t
	pop rdi
	mov rbx, rax
	mov qword[rdi+0], rbx
	mov r10, qword[rdi+0]
	mov qword[rdi+8], r10
	mov rbx, qword[rdi+0]
	add rbx, 40
	mov qword[rdi+16], rbx
	xor rax, rax
___void__Cvector_pvector__return:
	ret
_void_insert_pvectorint.size_tint:
	push rbp
	mov rbp, rsp
	sub rsp, 48
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	mov [rbp-24], rdx
	push rdi
	mov rdi, qword[rbp-8]
	mov r10, qword[rdi+0]
	mov rbx, qword[rdi+8]
	sub rbx, r10
	sar rbx, 2
	mov rax, rbx
.L0x1d:
	pop rdi
	mov rbx, rax
	mov qword[rbp-32], rbx
	push rdi
	mov rbx, qword[rbp-32]
	inc rbx
	mov rsi, rbx
	mov rdi, qword[rbp-8]
	call _void_reserve_pvectorint.size_t
	pop rdi
	mov rbx, rax
	mov r10, qword[rbp-32]
	mov qword[rbp-40], r10
	jmp .L0x30
.L0x2f:
	mov rbx, qword[rbp-40]
	inc rbx
	mov r10, qword[rdi+0]
	lea r11, [r10+rbx*4]
	mov r10, qword[rbp-40]
	mov rbx, qword[rdi+0]
	mov r12d, [rbx+r10*4]
	mov [r11], r12d
.L0x31:
	sub qword[rbp-40], 1
.L0x30:
	mov r10, qword[rbp-16]
	cmp qword[rbp-40], r10
	jge .L0x2f
.L0x32:
	add qword[rdi+8], 4
	mov r10, qword[rbp-16]
	mov rbx, qword[rdi+0]
	lea r11, [rbx+r10*4]
	mov r10d, dword[rbp-24]
	mov [r11], r10d
	xor rax, rax
___void_insert_pvectorint.size_tint__return:
	leave
	ret
_void_assign_pvectorint.size_tsize_tint:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov [rbp-8], rdx
	jmp .L0x2c
.L0x2b:
	mov r10, rsi
	mov rbx, qword[rdi+0]
	lea r11, [rbx+r10*4]
	mov r10d, ecx
	mov [r11], r10d
.L0x2d:
	inc rsi
.L0x2c:
	cmp rsi, qword[rbp-8]
	jl .L0x2b
.L0x2e:
	xor rax, rax
___void_assign_pvectorint.size_tsize_tint__return:
	leave
	ret
_int_pop_back_pvectorint.:
	sub qword[rdi+8], 4
	mov rbx, qword[rdi+8]
	mov ebx, dword[rbx]
	mov eax, ebx
___int_pop_back_pvectorint.__return:
	ret
_void_push_back_pvectorint.int:
	push rbp
	mov rbp, rsp
	sub rsp, 24
	mov [rbp-8], rsi
	mov r10, qword[rdi+16]
	cmp qword[rdi+8], r10
	jne .L0x20
	mov r10, qword[rdi+0]
	mov rbx, qword[rdi+16]
	sub rbx, r10
	mov qword[rbp-16], rbx
	push rdi
	mov rbx, qword[rbp-16]
	sal rbx, 1
	mov rsi, rbx
	mov rdi, qword[rdi+0]
	call _void_maprealloc_pvoid.size_t
	pop rdi
	mov rbx, rax
	mov r10, qword[rbp-16]
	add qword[rdi+16], r10
	jmp .L0x21
.L0x20:
.L0x21:
	mov rbx, qword[rdi+8]
	mov r11d, dword[rbp-8]
	mov [rbx], r11d
	add qword[rdi+8], 4
	xor rax, rax
___void_push_back_pvectorint.int__return:
	leave
	ret
_int_at_pvectorint.size_t:
	mov rbx, qword[rdi+0]
	mov r10d, [rbx+rsi*4]
	mov eax, r10d
___int_at_pvectorint.size_t__return:
	ret
_void_resize_pvectorint.size_t:
	push rbp
	mov rbp, rsp
	sub rsp, 24
	mov [rbp-8], rsi
	mov rbx, qword[rbp-8]
	sal rbx, 2
	mov qword[rbp-16], rbx
	push rdi
	mov rbx, qword[rbp-16]
	mov rsi, rbx
	mov rdi, qword[rdi+0]
	call _void_maprealloc_pvoid.size_t
	pop rdi
	mov rbx, rax
	mov r10, qword[rbp-16]
	mov rbx, qword[rdi+0]
	add rbx, r10
	mov qword[rdi+16], rbx
	mov r10, qword[rdi+16]
	cmp qword[rdi+8], r10
	jle .L0x17
	mov r10, qword[rdi+16]
	mov qword[rdi+8], r10
	jmp .L0x18
.L0x17:
.L0x18:
	xor rax, rax
___void_resize_pvectorint.size_t__return:
	leave
	ret
_void_reserve_pvectorint.size_t:
	push rbp
	mov rbp, rsp
	sub rsp, 32
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	push rdi
	mov rdi, qword[rbp-8]
	mov r10, qword[rdi+0]
	mov rbx, qword[rdi+16]
	sub rbx, r10
	sar rbx, 2
	mov rax, rbx
.L0xd:
	pop rdi
	cmp rax, qword[rbp-16]
	jge .L0x13
	mov rbx, qword[rbp-16]
	sal rbx, 2
	mov qword[rbp-24], rbx
	push rdi
	mov rbx, qword[rbp-24]
	mov rsi, rbx
	mov rdi, qword[rdi+0]
	call _void_maprealloc_pvoid.size_t
	pop rdi
	mov rbx, rax
	mov r10, qword[rbp-24]
	mov rbx, qword[rdi+0]
	add rbx, r10
	mov qword[rdi+16], rbx
	jmp .L0x14
.L0x13:
.L0x14:
	xor rax, rax
___void_reserve_pvectorint.size_t__return:
	leave
	ret
_int_back_pvectorint.:
	mov r10, qword[rdi+0]
	cmp qword[rdi+8], r10
	jne .L0x7
	mov rbx, qword[rdi+8]
	mov ebx, dword[rbx]
	mov eax, ebx
	jmp ___int_back_pvectorint.__return
	jmp .L0x8
.L0x7:
.L0x8:
	mov rbx, qword[rdi+8]
	sub rbx, 4
	mov ebx, dword[rbx]
	mov eax, ebx
___int_back_pvectorint.__return:
	ret
_void__DSocket_pSocket:
	push rdi
	mov esi, 1
	mov rbx, qword[rdi+0]
	mov rdi, rbx
	mov rax, 48
	mov r10, rcx
	syscall
	mov rbx, rax
.L0x3f:
	pop rdi
	mov rbx, rax
	xor rax, rax
___void__DSocket_pSocket__return:
	ret
_void_printvec_pvectorint:
	push rbp
	mov rbp, rsp
	sub rsp, 56
	movdqu [rbp-32], xmm0
	vextracti128 xmm7, ymm0, 1
	movsd [rbp-16], xmm7
	lea rdi, [rbp-32]
	mov r10, qword[rdi+0]
	mov rbx, qword[rdi+8]
	sub rbx, r10
	sar rbx, 2
.L0x1d:
	mov qword[rbp-40], rbx
	mov rdi, __LC.S0
	call _size_t_puts_pchar.
	mov rbx, rax
	mov qword[rbp-48], 0
	jmp .L0x41
.L0x40:
	lea rdi, [rbp-32]
	mov rsi, qword[rbp-48]
	mov rbx, qword[rdi+0]
	mov r10d, [rbx+rsi*4]
	mov eax, r10d
.L0x37:
	mov rsi, rax
	mov rdi, __LC.S1
	call printf
	mov rbx, rax
.L0x42:
	add qword[rbp-48], 1
.L0x41:
	mov rbx, qword[rbp-40]
	dec rbx
	cmp qword[rbp-48], rbx
	jl .L0x40
.L0x43:
	mov rbx, qword[rbp-40]
	dec rbx
	mov rsi, rbx
	lea rdi, [rbp-32]
	call _int_at_pvectorint.size_t
	mov rsi, rax
	mov rdi, __LC.S2
	call printf
	mov rbx, rax
	xor rax, rax
___void_printvec_pvectorint__return:
	leave
	ret
_void_check_plong:
	push rbp
	mov rbp, rsp
	sub rsp, 24
	mov [rbp-8], rdi
	mov qword[rbp-16], 3
	mov rbx, qword[rbp-8]
	mov rdx, 4613937818241073152
	mov rax, rbx
	movq xmm0, rdx
	cvtsi2sd xmm1, rax
	divsd xmm1, xmm0
	cvttsd2si rbx, xmm1
	mov r11, qword[rbp-16]
	mov r10, qword[rbp-8]
	xor rdx, rdx
	mov rax, r10
	idiv r11
	cmp rbx, rax
	je .L0x44
	mov r10, qword[rbp-16]
	mov rbx, qword[rbp-8]
	push rdx
	xor rdx, rdx
	mov rax, rbx
	idiv r10
	pop rdx
	mov r8, rax
	mov rbx, qword[rbp-8]
	mov rdx, 4613937818241073152
	mov rax, rbx
	movq xmm0, rdx
	cvtsi2sd xmm1, rax
	divsd xmm1, xmm0
	cvttsd2si rbx, xmm1
	mov rcx, rbx
	mov rdx, 3
	mov rsi, qword[rbp-8]
	mov rdi, __LC.S3
	call printf
	mov rbx, rax
	mov rdi, 1
	mov rax, 60
	mov r10, rcx
	syscall
	mov rbx, rax
.L0x49:
	mov rbx, rax
	jmp .L0x45
.L0x44:
.L0x45:
	xor rax, rax
___void_check_plong__return:
	leave
	ret
main:
	push rbp
	mov rbp, rsp
	sub rsp, 48
	mov qword[rbp-8], 15
	jmp .L0x4b
.L0x4a:
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _void_check_plong
	mov rbx, rax
.L0x4c:
	add qword[rbp-8], 1
.L0x4b:
	mov r10, 9223372036854775807
	cmp qword[rbp-8], r10
	jl .L0x4a
.L0x4d:
	lea rdi, [rbp-40]
	call _void__Cvector_pvector
	mov qword[rbp-48], 0
	jmp .L0x4f
.L0x4e:
	mov rbx, qword[rbp-48]
	mov r10, rbx
	mov esi, r10d
	lea rdi, [rbp-40]
	call _void_push_back_pvectorint.int
	mov rbx, rax
.L0x50:
	add qword[rbp-48], 1
.L0x4f:
	cmp qword[rbp-48], 100
	jl .L0x4e
.L0x51:
	movq xmm0, [rbp-24]
	xor rax, rax
	mov rax, [rbp-16]
	movq xmm7, rax
	movlhps xmm0, xmm7
	vinsertf128 ymm0, ymm0, xmm0, 1
	movdqu xmm0, [rbp-40]
	call _void_printvec_pvectorint
	mov rbx, rax
	mov si, 5501
	mov rdi, __LC.S4
	call _void_nc_pchar.short
	mov rbx, rax
	xor eax, eax
__main__return:
	push rax
	lea rdi, [rbp-40]
	call _void__Dvector_pvector
	pop rax
	leave
	ret
_void_nc_pchar.short:
	push rbp
	mov rbp, rsp
	sub rsp, 64
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	lea rdi, [rbp-32]
	call _err_t_init_pSocket
	mov rbx, rax
	mov dx, word[rbp-16]
	mov rbx, qword[rbp-8]
	mov rsi, rbx
	lea rdi, [rbp-32]
	call _err_t_connect_pSocketchar.int
	mov rbx, rax
	mov dword[rbp-40], ebx
	mov ebx, dword[rbp-40]
	test ebx, ebx
	jz .L0x52
	movsxd rdi, dword[rbp-40]
	call _char._strerror_pvoid
	mov rdi, rax
	call _size_t_puts_pchar.
	mov rbx, rax
	mov rdi, 1
	mov rax, 60
	mov r10, rcx
	syscall
	mov rbx, rax
.L0x57:
	mov rbx, rax
	jmp .L0x53
.L0x52:
.L0x53:
	mov rdi, 1024
	call _void._mapalloc_psize_t
	mov rbx, rax
	mov qword[rbp-48], rbx
	mov qword[rbp-56], 0
	jmp .L0x59
.L0x58:
	jmp .L0x5c
.L0x5b:
	mov rdx, 1024
	mov rbx, qword[rbp-48]
	mov rsi, rbx
	lea rdi, [rbp-32]
	call _ssize_t_recv_pSocketchar.size_t
	mov rbx, rax
	mov qword[rbp-56], rbx
.L0x5c:
	mov rbx, qword[rbp-56]
	test rbx, rbx
	jz .L0x5b
.L0x5d:
	xor r10, r10
	cmp qword[rbp-56], r10
	jge .L0x5e
	mov rdi, __LC.S5
	call _size_t_puts_pchar.
	mov rbx, rax
	mov rax, -1
	jmp ___void_nc_pchar.short__return
	jmp .L0x5f
.L0x5e:
.L0x5f:
	mov rbx, qword[rbp-48]
	mov rdi, rbx
	call _size_t_puts_pchar.
	mov rbx, rax
	mov rbx, qword[rbp-56]
	mov rsi, rbx
	mov rdi, qword[rbp-48]
	call _void_memzer_pvoid.size_t
	mov rbx, rax
	mov qword[rbp-56], 0
.L0x59:
	jmp .L0x58
.L0x5a:
	mov rdi, qword[rbp-48]
	call _void_mapfree_pvoid.
	mov rbx, rax
	xor rax, rax
___void_nc_pchar.short__return:
	push rax
	lea rdi, [rbp-32]
	call _void__DSocket_pSocket
	pop rax
	leave
	ret
_float_benchmark_p:
	push rbp
	mov rbp, rsp
	sub rsp, 1023
	mov rsi, 1000
	lea rbx, [rbp-1007]
	mov rdi, rbx
	call _void_memzer_pvoid.size_t
	mov rbx, rax
	mov qword[rbp-1015], 0
	jmp .L0x61
.L0x60:
	mov r8, 1056964608
	mov rcx, __LC.S7
	mov rdx, 123
	mov rsi, __LC.S6
	lea rbx, [rbp-1007]
	mov rdi, rbx
	call sprintf
	mov rbx, rax
.L0x62:
	add qword[rbp-1015], 1
.L0x61:
	cmp qword[rbp-1015], 250
	jl .L0x60
.L0x63:
	lea rbx, [rbp-1007]
	mov rdi, rbx
	call _size_t_puts_pchar.
	mov rbx, rax
	mov rax, 1108082688
	movq xmm7, rax
	movsd xmm0, xmm7
___float_benchmark_p__return:
	leave
	ret
	