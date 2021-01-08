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
extern _int_getInt_pchar.:
extern _uint_getUint_pchar.:
extern _char_getchar_p:
extern _void_getString_pchar.intchar.:
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
LC.S0: db `123hd0.5: \t %i%s%f`, 0
LC.S1: db `hd`, 0
LC.S2: db ` %i`, 0
LC.S3: db ` %i`, 0
LC.S4: db `test123`, 0
LC.S5: db ` %i`, 0
LC.S6: db ` [ %i Bytes sent successfuly. ] \n`, 0
LC.F0: dq 0x0.0p+0
M_MINZERO_MEM: dq 0
	section .bss align=8
	section .text align=16
	global main
main:
	xor eax, eax
__main__return:
	ret
_float_benchmark_p:
	push rbp
	mov rbp, rsp
	sub rsp, 1024
	mov rsi, 1000
	lea rbx, [rbp-1008]
	mov rdi, rbx
	call _void_memzer_pvoid.size_t
	mov qword[rbp-1016], 0
	jmp .L0x29
.L0x28:
	mov r8, 1056964608
	mov rcx, LC.S1
	mov rdx, 123
	mov rsi, LC.S0
	lea rbx, [rbp-1008]
	mov rdi, rbx
	call sprintf
.L0x2a:
	add qword[rbp-1016], 1
.L0x29:
	cmp qword[rbp-1016], 25000000
	jl .L0x28
.L0x2b:
	lea rbx, [rbp-1008]
	mov rdi, rbx
	call _size_t_puts_pchar.
	mov rax, 1108082688
	movq xmm7, rax
	movsd xmm0, xmm7
___float_benchmark_p__return:
	leave
	ret
_void_sockConfirm_pchar.short:
	push rbp
	mov rbp, rsp
	sub rsp, 56
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	mov edx, 0
	mov esi, 1
	mov edi, 2
	mov rax, 41
	mov r10, rcx
	syscall
.L0x3:
	mov r10, rax
	mov qword[rbp-32], r10
	cmp qword[rbp-32], 0
	jge .L0x4
	movsxd rdi, dword[rbp-24]
	call _char._strerror_pvoid
	mov rdi, rax
	call _size_t_puts_pchar.
	movsxd rsi, dword[rbp-24]
	mov rdi, LC.S2
	call printf
	mov rdi, 1
	mov rax, 60
	mov r10, rcx
	syscall
.L0x9:
	jmp .L0x5
.L0x4:
.L0x5:
	mov qword[rbp-48], 0
	mov word[rbp-56], 2
	mov bx, word[rbp-16]
	mov di, bx
	xor rax, rax
	bswap edi
	shr edi, 16
	mov eax, edi
.L0xe:
	mov r10, rax
	mov word[rbp-54], r10w
	lea rbx, [rbp-52]
	mov rsi, rbx
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _int_inet_aton_pchar.in_addr.
	mov edx, 16
	lea rbx, [rbp-56]
	mov rsi, rbx
	mov rbx, qword[rbp-32]
	mov rdi, rbx
	mov rax, 42
	mov r10, rcx
	syscall
.L0x13:
	mov r10, rax
	mov dword[rbp-24], r10d
	cmp dword[rbp-24], 0
	jge .L0x14
	movsxd rdi, dword[rbp-24]
	call _char._strerror_pvoid
	mov rdi, rax
	call _size_t_puts_pchar.
	movsxd rsi, dword[rbp-24]
	mov rdi, LC.S3
	call printf
	mov rdi, 1
	mov rax, 60
	mov r10, rcx
	syscall
.L0x19:
	jmp .L0x15
.L0x14:
.L0x15:
	mov rdx, 7
	mov rsi, LC.S4
	mov rbx, qword[rbp-32]
	mov rdi, rbx
	mov rax, 1
	mov r10, rcx
	syscall
.L0x1d:
	mov rbx, rax
	mov dword[rbp-24], ebx
	cmp dword[rbp-24], 0
	jge .L0x1e
	movsxd rdi, dword[rbp-24]
	call _char._strerror_pvoid
	mov rdi, rax
	call _size_t_puts_pchar.
	movsxd rsi, dword[rbp-24]
	mov rdi, LC.S5
	call printf
	mov rdi, 1
	mov rax, 60
	mov r10, rcx
	syscall
.L0x23:
	jmp .L0x1f
.L0x1e:
.L0x1f:
	movsxd rsi, dword[rbp-24]
	mov rdi, LC.S6
	call printf
	xor esi, esi
	mov rbx, qword[rbp-32]
	mov rdi, rbx
	mov rax, 48
	mov r10, rcx
	syscall
.L0x27:
	xor rax, rax
	leave
	ret
	