bits 64
extern _char._get_errstr_pvoid:
extern _void_native_cpuid_pcpuidreg_t.cpuidreg_t.cpuidreg_t.cpuidreg_t.:
extern _bool_cpuid_getfeature_pulong:
extern _bool_cpuid_getextended_pulong:
extern _bool_all_of_raw_piterablesize_tsize_tvoid.:
extern _bool_any_of_raw_piterablesize_tsize_tvoid.:
extern _bool_none_of_raw_piterablesize_tsize_tvoid.:
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
__LC.S3: db `Failed to divide: %i\n`, 0
__LC.S4: db `All good.`, 0
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
	ret
_void_push_back_pvectorint.int:
	push rbp
	mov rbp, rsp
	sub rsp, 24
	mov [rbp-8], rsi
	mov r10, qword[rdi+16]
	cmp qword[rdi+8], r10
	jne .L0x2
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
	jmp .L0x3
.L0x2:
.L0x3:
	mov rbx, qword[rdi+8]
	mov r11d, dword[rbp-8]
	mov [rbx], r11d
	add qword[rdi+8], 4
	xor rax, rax
	leave
	ret
_int_at_pvectorint.size_t:
	mov rbx, qword[rdi+0]
	mov r10d, [rbx+rsi*4]
	mov eax, r10d
___int_at_pvectorint.size_t__return:
	ret
_size_t_size_pvectorint.:
	mov r10, qword[rdi+0]
	mov rbx, qword[rdi+8]
	sub rbx, r10
	sar rbx, 2
	mov rax, rbx
___size_t_size_pvectorint.__return:
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
.L0xb:
	pop rdi
	mov rbx, rax
	xor rax, rax
	ret
_void_printvec_pvectorint:
	push rbp
	mov rbp, rsp
	sub rsp, 56
	movdqu [rbp-32], xmm0
	vextracti128 xmm7, ymm0, 1
	movsd [rbp-16], xmm7
	lea rdi, [rbp-32]
	call _size_t_size_pvectorint.
	mov rbx, rax
	mov qword[rbp-40], rbx
	mov rdi, __LC.S0
	call _size_t_puts_pchar.
	mov rbx, rax
	mov qword[rbp-48], 0
	jmp .L0xd
.L0xc:
	lea rdi, [rbp-32]
	mov rbx, qword[rbp-48]
	mov rsi, rbx
	call _int_at_pvectorint.size_t
	mov rsi, rax
	mov rdi, __LC.S1
	call printf
	mov rbx, rax
.L0xe:
	add qword[rbp-48], 1
.L0xd:
	mov rbx, qword[rbp-40]
	dec rbx
	cmp qword[rbp-48], rbx
	jl .L0xc
.L0xf:
	lea rdi, [rbp-32]
	mov rbx, qword[rbp-40]
	dec rbx
	mov rsi, rbx
	call _int_at_pvectorint.size_t
	mov rsi, rax
	mov rdi, __LC.S2
	call printf
	mov rbx, rax
	xor rax, rax
	leave
	ret
_void_checknum_plong:
	push rbp
	mov rbp, rsp
	sub rsp, 24
	mov [rbp-8], rdi
	mov qword[rbp-16], 5
	mov r10, qword[rbp-16]
	mov rbx, qword[rbp-8]
	xor rdx, rdx
	mov rax, rbx
	idiv r10
	mov rbx, rax
	mov r10, qword[rbp-8]
	mov rdx, 4617315517961601024
	mov rax, r10
	movq xmm0, rdx
	cvtsi2sd xmm1, rax
	divsd xmm1, xmm0
	cvttsd2si r10, xmm1
	cmp rbx, r10
	je .L0x10
	mov rsi, qword[rbp-8]
	mov rdi, __LC.S3
	call printf
	mov rbx, rax
	mov rdi, 1
	mov rax, 60
	mov r10, rcx
	syscall
	mov rbx, rax
.L0x15:
	mov rbx, rax
	jmp .L0x11
.L0x10:
.L0x11:
	xor rax, rax
	leave
	ret
main:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov qword[rbp-8], 1
	jmp .L0x17
.L0x16:
	mov rax, qword[rbp-8]
	test rax, rax
	jz .L0x1a
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _void_checknum_plong
	mov rbx, rax
	jmp .L0x1b
.L0x1a:
.L0x1b:
.L0x18:
	add qword[rbp-8], 1
.L0x17:
	mov r10, 9223372036854775807
	cmp qword[rbp-8], r10
	jl .L0x16
.L0x19:
	mov rdi, __LC.S4
	call _size_t_puts_pchar.
	mov rbx, rax
	xor eax, eax
__main__return:
	leave
	ret
	