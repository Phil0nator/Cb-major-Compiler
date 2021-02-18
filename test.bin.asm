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
extern _mallocptr._malloc_psize_t:
extern _mallocptr._realloc_pvoid.size_t:
extern _mallocptr._calloc_psize_t:
extern _mallocptr._mapalloc_psize_t:
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
extern _string_.operator32_pstring.char.:
extern _string_.operator33_pstring.string:
extern _string_.operator3_pstring.string:
extern _string_.operator3_pstring.char.:
extern _string_.operator33_pstring.char.:
extern _void_.operator32_postream.fd_t:
extern _ostream_.operator18_postream.char.:
extern _ostream_.operator18_postream.long:
extern _ostream_.operator18_postream.int:
extern _ostream_.operator18_postream.ulong:
extern _ostream_.operator18_postream.float:
extern _ostream_.operator18_postream.double:
extern _ostream_.operator18_postream.char:
extern _void_feed_pStack.void.:
extern _void_alloc_pStack.size_t:
extern _void_destroy_pStack.:
extern _void_push_pStack.void:
extern _void_pop_pStack.:
extern _void_pop_pStack.void.:
extern _void_set_pVec3f.doubledoubledouble:
extern _void_add_pVec3f.Vec3f.:
extern _void_sub_pVec3f.Vec3f.:
extern _void_mul_pVec3f.Vec3f.:
extern _void_div_pVec3f.Vec3f.:
extern _void_sqrt_pVec3f.:
extern _double_dot_pVec3f.Vec3f.:
extern _void_.operator33_pVec3f.Vec3f.:
extern _void_.operator34_pVec3f.Vec3f.:
extern _void_.operator36_pVec3f.Vec3f.:
extern _void_.operator35_pVec3f.Vec3f.:
extern _double_.operator20_pVec3f.Vec3f.:
extern _err_t_init_pSocket.:
extern _err_t_init_pSocket.intintint:
extern _err_t_connect_pSocket.char.int:
extern _ssize_t_send_pSocket.char.:
extern _ssize_t_send_pSocket.char.size_t:
extern _err_t_close_pSocket.:
extern _ssize_t_recv_pSocket.char.size_t:
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
cerr:
cerr.handle: DQ 2
clog:
clog.handle: DQ 2
teststr: DQ __LC.S4
__LC.S0: db `[`, 0
__LC.S1: db `%i, `, 0
__LC.S2: db `%i]\n`, 0
__LC.S3: db `%l: %l\n`, 0
__LC.S4: db `x123`, 0
__LC.S5: db `127.0.0.1`, 0
__LC.S6: db `Lost connection to host.`, 0
__LC.S7: db `123hd0.5: \t %i%s%f`, 0
__LC.S8: db `hd`, 0
	section .bss align=8
cout:
cout.handle: resb 8
cin:
cin.handle: resb 8
test:
test.begin: resb 8
test.end: resb 8
test.stop: resb 8
	section .init align=16
__cbbuiltin_initheader:
	mov rdi, test
	call _void__Cvector_pvector.
	section .fini align=16
__cbbuiltin_finifooter:
	mov rdi, test
	call _void__Dvector_pvector.
	section .text align=16
	global main
_void__Dvector_pvector.:
	push rdi
	mov rdi, qword[rdi+0]
	call _void_mapfree_pvoid.
	pop rdi
	mov rbx, rax
	xor rax, rax
___void__Dvector_pvector.__return:
	ret
_void__Cvector_pvector.size_t:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov [rbp-8], rsi
	push rdi
	mov rax, qword[rbp-8]
	sal rax, 2
	mov rdi, rax
	call _mallocptr._mapalloc_psize_t
	pop rdi
	mov rbx, rax
	mov qword[rdi+0], rbx
	mov rcx, qword[rdi+0]
	mov qword[rdi+8], rcx
	mov rax, qword[rbp-8]
	sal rax, 2
	mov rbx, qword[rdi+0]
	add rbx, rax
	mov qword[rdi+16], rbx
	xor rax, rax
___void__Cvector_pvector.size_t__return:
	leave
	ret
_void__Cvector_pvector.:
	push rdi
	mov rdi, 40
	call _mallocptr._mapalloc_psize_t
	pop rdi
	mov rbx, rax
	mov qword[rdi+0], rbx
	mov rcx, qword[rdi+0]
	mov qword[rdi+8], rcx
	mov rbx, qword[rdi+0]
	add rbx, 40
	mov qword[rdi+16], rbx
	xor rax, rax
___void__Cvector_pvector.__return:
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
	mov rcx, qword[rdi+0]
	mov rbx, qword[rdi+8]
	sub rbx, rcx
	mov rax, rbx
	shr rbx, 63
	add rbx, rax
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
	mov rcx, qword[rbp-32]
	mov qword[rbp-40], rcx
	jmp .L0x30
.L0x2f:
	mov rbx, qword[rbp-40]
	inc rbx
	mov rcx, qword[rdi+0]
	lea r10, [rcx+rbx*4]
	mov rcx, qword[rbp-40]
	mov rbx, qword[rdi+0]
	mov r11d, [rbx+rcx*4]
	mov [r10], r11d
.L0x31:
	sub qword[rbp-40], 1
.L0x30:
	mov rcx, qword[rbp-16]
	cmp qword[rbp-40], rcx
	jge .L0x2f
.L0x32:
	add qword[rdi+8], 4
	mov rcx, qword[rbp-16]
	mov rbx, qword[rdi+0]
	lea r10, [rbx+rcx*4]
	mov ecx, dword[rbp-24]
	mov [r10], ecx
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
	mov rcx, qword[rdi+16]
	cmp qword[rdi+8], rcx
	jne .L0x20
	mov rcx, qword[rdi+0]
	mov rbx, qword[rdi+16]
	sub rbx, rcx
	mov qword[rbp-16], rbx
	push rdi
	mov rax, qword[rbp-16]
	sal rax, 1
	mov rsi, rax
	mov rdi, qword[rdi+0]
	call _void_maprealloc_pvoid.size_t
	pop rdi
	mov rbx, rax
	mov rcx, qword[rbp-16]
	add qword[rdi+16], rcx
	jmp .L0x21
.L0x20:
.L0x21:
	mov rbx, qword[rdi+8]
	mov r10d, dword[rbp-8]
	mov [rbx], r10d
	add qword[rdi+8], 4
	xor rax, rax
___void_push_back_pvectorint.int__return:
	leave
	ret
_int_at_pvectorint.size_t:
	mov rbx, qword[rdi+0]
	mov ecx, [rbx+rsi*4]
	mov eax, ecx
___int_at_pvectorint.size_t__return:
	ret
_void_resize_pvectorint.size_t:
	push rbp
	mov rbp, rsp
	sub rsp, 24
	mov [rbp-8], rsi
	mov rax, qword[rbp-8]
	sal rax, 2
	mov rcx, rax
	mov qword[rbp-16], rcx
	push rdi
	mov rbx, qword[rbp-16]
	mov rsi, rbx
	mov rdi, qword[rdi+0]
	call _void_maprealloc_pvoid.size_t
	pop rdi
	mov rbx, rax
	mov rcx, qword[rbp-16]
	mov rbx, qword[rdi+0]
	add rbx, rcx
	mov qword[rdi+16], rbx
	mov rcx, qword[rdi+16]
	cmp qword[rdi+8], rcx
	jle .L0x17
	mov rcx, qword[rdi+16]
	mov qword[rdi+8], rcx
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
	mov rcx, qword[rdi+0]
	mov rbx, qword[rdi+16]
	sub rbx, rcx
	mov rax, rbx
	shr rbx, 63
	add rbx, rax
	sar rbx, 2
	mov rax, rbx
.L0xd:
	pop rdi
	cmp rax, qword[rbp-16]
	jge .L0x13
	mov rax, qword[rbp-16]
	sal rax, 2
	mov rcx, rax
	mov qword[rbp-24], rcx
	push rdi
	mov rbx, qword[rbp-24]
	mov rsi, rbx
	mov rdi, qword[rdi+0]
	call _void_maprealloc_pvoid.size_t
	pop rdi
	mov rbx, rax
	mov rcx, qword[rbp-24]
	mov rbx, qword[rdi+0]
	add rbx, rcx
	mov qword[rdi+16], rbx
	jmp .L0x14
.L0x13:
.L0x14:
	xor rax, rax
___void_reserve_pvectorint.size_t__return:
	leave
	ret
_int_back_pvectorint.:
	mov rcx, qword[rdi+0]
	cmp qword[rdi+8], rcx
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
_void__Cstring_pstring.:
	push rdi
	mov rdi, 1
	call _mallocptr._mapalloc_psize_t
	pop rdi
	mov rbx, rax
	mov qword[rdi+0], rbx
	mov rbx, qword[rdi+0]
	mov byte[rbx], 0
	xor rax, rax
___void__Cstring_pstring.__return:
	ret
_void__Cstring_pstring.char.:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov [rbp-8], rsi
	push rdi
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _size_t_strlen_pchar.
	pop rdi
	mov rbx, rax
	mov qword[rdi+8], rbx
	push rdi
	mov rbx, qword[rdi+8]
	inc rbx
	mov rdi, rbx
	call _mallocptr._mapalloc_psize_t
	pop rdi
	mov rbx, rax
	mov qword[rdi+0], rbx
	mov rbx, qword[rdi+8]
	inc rbx
	mov rcx, qword[rdi+0]
	mov byte[rcx+rbx*1], 0
	push rdi
	mov rbx, qword[rbp-8]
	mov rsi, rbx
	mov rbx, qword[rdi+0]
	mov rdi, rbx
	call _long_strcpy_pchar.char.
	pop rdi
	mov rbx, rax
	xor rax, rax
___void__Cstring_pstring.char.__return:
	leave
	ret
_void__Dstring_pstring.:
	push rdi
	mov rdi, qword[rdi+0]
	call _void_mapfree_pvoid.
	pop rdi
	mov rbx, rax
	xor rax, rax
___void__Dstring_pstring.__return:
	ret
_void_getLine_pistream.char.size_t:
	push rbp
	mov rbp, rsp
	sub rsp, 32
	mov [rbp-8], rsi
	mov [rbp-16], rdx
	push rdi
	mov rbx, qword[rbp-16]
	mov rdx, rbx
	mov rbx, qword[rbp-8]
	mov rsi, rbx
	mov rbx, qword[rdi+0]
	mov rdi, rbx
	mov rax, 0
	mov r10, rcx
	syscall
	mov rbx, rax
.L0x3f:
	pop rdi
	mov rbx, rax
	mov qword[rbp-24], rbx
	mov rbx, qword[rbp-24]
	dec rbx
	mov rcx, qword[rbp-8]
	mov byte[rcx+rbx*1], 0
	xor rax, rax
___void_getLine_pistream.char.size_t__return:
	leave
	ret
_void_get_pistream.char.size_t:
	push rbp
	mov rbp, rsp
	sub rsp, 24
	mov [rbp-8], rsi
	mov [rbp-16], rdx
	push rdi
	mov rbx, qword[rbp-16]
	mov rdx, rbx
	mov rbx, qword[rbp-8]
	mov rsi, rbx
	mov rbx, qword[rdi+0]
	mov rdi, rbx
	mov rax, 0
	mov r10, rcx
	syscall
	mov rbx, rax
.L0x47:
	pop rdi
	mov rbx, rax
	xor rax, rax
___void_get_pistream.char.size_t__return:
	leave
	ret
_void_get_pistream.char.:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov [rbp-8], rsi
	push rdi
	mov rdx, 1
	mov rbx, qword[rbp-8]
	mov rsi, rbx
	mov rbx, qword[rdi+0]
	mov rdi, rbx
	mov rax, 0
	mov r10, rcx
	syscall
	mov rbx, rax
.L0x4f:
	pop rdi
	mov rbx, rax
	xor rax, rax
___void_get_pistream.char.__return:
	leave
	ret
_void__DSocket_pSocket.:
	push rdi
	mov esi, 1
	mov rbx, qword[rdi+0]
	mov rdi, rbx
	mov rax, 48
	mov r10, rcx
	syscall
	mov rbx, rax
.L0x57:
	pop rdi
	mov rbx, rax
	xor rax, rax
___void__DSocket_pSocket.__return:
	ret
_void_printvec_pvectorint:
	push rbp
	mov rbp, rsp
	sub rsp, 64
	movdqu [rbp-32], xmm0
	vextracti128 xmm7, ymm0, 1
	movsd [rbp-16], xmm7
	lea rdi, [rbp-32]
	mov rcx, qword[rdi+0]
	mov rbx, qword[rdi+8]
	sub rbx, rcx
	mov rax, rbx
	shr rbx, 63
	add rbx, rax
	sar rbx, 2
.L0x1d:
	mov qword[rbp-40], rbx
	mov rdi, __LC.S0
	call _size_t_puts_pchar.
	mov rbx, rax
	mov qword[rbp-48], 0
	jmp .L0x59
.L0x58:
	mov rsi, qword[rbp-48]
	lea rdi, [rbp-32]
	mov rbx, qword[rdi+0]
	mov ecx, [rbx+rsi*4]
	mov eax, ecx
.L0x37:
	mov rsi, rax
	mov rdi, __LC.S1
	mov al, 0
	enter 0, 0
	and rsp, -16
	call printf
	leave
	mov rbx, rax
.L0x5a:
	add qword[rbp-48], 1
.L0x59:
	mov rbx, qword[rbp-40]
	dec rbx
	cmp qword[rbp-48], rbx
	jl .L0x58
.L0x5b:
	mov rbx, qword[rbp-40]
	dec rbx
	mov rsi, rbx
	lea rdi, [rbp-32]
	call _int_at_pvectorint.size_t
	mov rsi, rax
	mov rdi, __LC.S2
	mov al, 0
	enter 0, 0
	and rsp, -16
	call printf
	leave
	mov rbx, rax
	xor rax, rax
___void_printvec_pvectorint__return:
	leave
	ret
_void_check_plong:
	push rbp
	mov rbp, rsp
	sub rsp, 64
	mov [rbp-8], rdi
	mov qword[rbp-16], -8
	mov rax, qword[rbp-8]
	mov rdx, -2305843009213693952
	imul rdx
	mov rax, rdx
	shr rax, 63
	add rdx, rax
	mov rax, rdx
	mov qword[rbp-24], rax
	mov rbx, qword[rbp-16]
	mov rax, qword[rbp-8]
	xor rdx, rdx
	cqo
	idiv rbx
	mov qword[rbp-32], rax
	mov rcx, qword[rbp-32]
	cmp qword[rbp-24], rcx
	je .L0x5c
	mov rdx, qword[rbp-24]
	mov rsi, qword[rbp-8]
	mov rdi, __LC.S3
	mov al, 0
	enter 0, 0
	and rsp, -16
	call printf
	leave
	mov rbx, rax
	jmp .L0x5d
.L0x5c:
.L0x5d:
	xor rax, rax
___void_check_plong__return:
	leave
	ret
_void_testdivision_p:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov qword[rbp-8], -256
	jmp .L0x5f
.L0x5e:
	mov rax, qword[rbp-8]
	test rax, rax
	jz .L0x62
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _void_check_plong
	mov rbx, rax
	jmp .L0x63
.L0x62:
	jmp .L0x61
.L0x63:
.L0x60:
	add qword[rbp-8], 1
.L0x5f:
	mov rcx, 9223372036854775807
	cmp qword[rbp-8], rcx
	jl .L0x5e
.L0x61:
	xor rax, rax
___void_testdivision_p__return:
	leave
	ret
main:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov qword[rbp-8], 0
	jmp .L0x65
.L0x64:
	mov rbx, qword[rbp-8]
	mov r10, rbx
	mov esi, r10d
	mov rdi, test
	call _void_push_back_pvectorint.int
	mov rbx, rax
.L0x66:
	add qword[rbp-8], 1
.L0x65:
	cmp qword[rbp-8], 100
	jl .L0x64
.L0x67:
	movq xmm0, [test]
	xor rax, rax
	mov rax, [test-8]
	movq xmm7, rax
	movlhps xmm0, xmm7
	vinsertf128 ymm0, ymm0, xmm0, 1
	movdqu xmm0, [test]
	call _void_printvec_pvectorint
	mov rbx, rax
	mov si, 5501
	mov rdi, __LC.S5
	call _void_nc_pchar.short
	mov rbx, rax
	xor eax, eax
__main__return:
	leave
	ret
_void_nc_pchar.short:
	push rbp
	mov rbp, rsp
	sub rsp, 64
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	lea rdi, [rbp-32]
	call _err_t_init_pSocket.
	mov rbx, rax
	mov dx, word[rbp-16]
	mov rbx, qword[rbp-8]
	mov rsi, rbx
	lea rdi, [rbp-32]
	call _err_t_connect_pSocket.char.int
	mov rbx, rax
	mov dword[rbp-40], ebx
	mov ebx, dword[rbp-40]
	test ebx, ebx
	jz .L0x68
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
.L0x6d:
	mov rbx, rax
	jmp .L0x69
.L0x68:
.L0x69:
	mov rdi, 1024
	call _mallocptr._mapalloc_psize_t
	mov rbx, rax
	mov qword[rbp-48], rbx
	mov qword[rbp-56], 0
	jmp .L0x6f
.L0x6e:
	jmp .L0x72
.L0x71:
	mov rdx, 1024
	mov rbx, qword[rbp-48]
	mov rsi, rbx
	lea rdi, [rbp-32]
	call _ssize_t_recv_pSocket.char.size_t
	mov rbx, rax
	mov qword[rbp-56], rbx
.L0x72:
	mov rbx, qword[rbp-56]
	test rbx, rbx
	jz .L0x71
.L0x73:
	xor rcx, rcx
	cmp qword[rbp-56], rcx
	jge .L0x74
	mov rdi, __LC.S6
	call _size_t_puts_pchar.
	mov rbx, rax
	mov rax, -1
	jmp ___void_nc_pchar.short__return
	jmp .L0x75
.L0x74:
.L0x75:
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
.L0x6f:
	jmp .L0x6e
.L0x70:
	mov rdi, qword[rbp-48]
	call _void_mapfree_pvoid.
	mov rbx, rax
	xor rax, rax
___void_nc_pchar.short__return:
	push rax
	lea rdi, [rbp-32]
	call _void__DSocket_pSocket.
	pop rax
	leave
	ret
_float_benchmark_p:
	push rbp
	mov rbp, rsp
	sub rsp, 1024
	mov rsi, 1000
	lea rbx, [rbp-1007]
	mov rdi, rbx
	call _void_memzer_pvoid.size_t
	mov rbx, rax
	mov qword[rbp-1015], 0
	jmp .L0x77
.L0x76:
	mov r8, 1056964608
	mov rcx, __LC.S8
	mov rdx, 123
	mov rsi, __LC.S7
	lea rbx, [rbp-1007]
	mov rdi, rbx
	mov al, 0
	enter 0, 0
	and rsp, -16
	call sprintf
	leave
	mov rbx, rax
.L0x78:
	add qword[rbp-1015], 1
.L0x77:
	cmp qword[rbp-1015], 250
	jl .L0x76
.L0x79:
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
	