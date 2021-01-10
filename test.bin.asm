bits 64
global _long_pow_plonglong:
global _double_pow_plonglong:
global _double_pow_pdoublelong:
global _long_ceil_pdouble:
global _long_floor_pdouble:
global _long_abs_plong:
global _double_abs_pdouble:
global _long_log_plong:
global _long_log_plonglong:
global _long_log2_plong:
global _double_fmod_pdoubledouble:
global _long_divmod_plonglonglong.:
global _long_divmods_plonglonglong.:
global _double_sin_pdouble:
global _double_cos_pdouble:
global _double_tan_pdouble:
global _double_cot_pdouble:
global _double_sec_pdouble:
global _double_csc_pdouble:
global _double_asin_pdouble:
global _double_acos_pdouble:
global _double_atan_pdouble:
global _bool_all_of_raw_piterablesize_tsize_tvoid.:
global _bool_any_of_raw_piterablesize_tsize_tvoid.:
global _bool_none_of_raw_piterablesize_tsize_tvoid.:
global _fd_t_fopen_pchar.char.:
global _size_t_fputs_pfd_tchar.:
global _size_t_puts_pchar.:
global _long_fgets_pfd_tchar.size_t:
global _void._floads_pfd_t:
global _void___assert_pboolchar.intchar.:
global _void_free_pvoid.:
global _void._malloc_psize_t:
global _void._realloc_pvoid.size_t:
global _void._calloc_psize_t:
global _void._mapalloc_psize_t:
global _void_mapfree_pvoid.:
global _void_maprealloc_pvoid.size_t:
global _void_memcpy_pvoid.void.size_t:
global _void_avx_memcpy_pvoid.void.size_t:
global _void_avx_memzeraligned_pvoid.size_t:
global _void_avx_memzer_pvoid.size_t:
global _void_memset_pvoid.ucharsize_t:
global _void_memzer_pvoid.size_t:
global _char._get_errstr_pvoid:
global _long_strcpy_pchar.char.:
global _size_t_strlen_pchar.:
global _char._memchr_pchar.charsize_t:
global _int_memcmp_pchar.char.size_t:
global _char._strcat_pchar.char.:
global _char._strncat_pchar.char.size_t:
global _char._strchr_pchar.char:
global _int_strcmp_pchar.char:
global _size_t_strcspn_pchar.char.:
global _char._strerror_pvoid:
	global sprintf
global _int___sprintf_pchar.char.void.:
	global sprintf
	extern sprintf
	extern sprintf
	extern sprintf
	global printf
	global eprintf
	global fprintf
	global printf
	extern printf
	extern printf
	extern printf
	extern printf
	global eprintf
	extern eprintf
	extern eprintf
	extern eprintf
	extern eprintf
	global fprintf
	extern fprintf
	extern fprintf
	extern fprintf
	section .data align=8
__LC.F0: dq 0x0.0p+0
M_MINZERO_MEM: dq 0
malloc_maxcache: DQ 524288
free_head: DQ 0
cached_size: DQ 0
appends: DQ 0
deletions: DQ 0
__linux_errstrlist: DQ __LC.S7, __LC.S8, __LC.S9, __LC.S10, __LC.S11, __LC.S12, __LC.S13, __LC.S14, __LC.S15, __LC.S16, __LC.S17, __LC.S18, __LC.S19, __LC.S20, __LC.S21, __LC.S22, __LC.S23, __LC.S24, __LC.S25, __LC.S26, __LC.S27, __LC.S28, __LC.S29, __LC.S30, __LC.S31, __LC.S32, __LC.S33, __LC.S34, __LC.S35, __LC.S36, __LC.S37, __LC.S38, __LC.S39, __LC.S40, __LC.S41, __LC.S42, __LC.S43, __LC.S44, __LC.S45, __LC.S46, __LC.S47, __LC.S48, __LC.S49, __LC.S50, __LC.S51, __LC.S52, __LC.S53, __LC.S54, __LC.S55, __LC.S56, __LC.S57, __LC.S58, __LC.S59, __LC.S60, __LC.S61, __LC.S62, __LC.S63, __LC.S64, __LC.S65, __LC.S66, __LC.S67, __LC.S68, __LC.S69, __LC.S70, __LC.S71, __LC.S72, __LC.S73, __LC.S74, __LC.S75, __LC.S76, __LC.S77, __LC.S78, __LC.S79, __LC.S80, __LC.S81, __LC.S82, __LC.S83, __LC.S84, __LC.S85, __LC.S86, __LC.S87, __LC.S88, __LC.S89, __LC.S90, __LC.S91, __LC.S92, __LC.S93, __LC.S94, __LC.S95, __LC.S96, __LC.S97, __LC.S98, __LC.S99, __LC.S100, __LC.S101, __LC.S102, __LC.S103, __LC.S104, __LC.S105, __LC.S106, __LC.S107, __LC.S108, __LC.S109, __LC.S110, __LC.S111, __LC.S112, __LC.S113, __LC.S114, __LC.S115, __LC.S116, __LC.S117, __LC.S118, __LC.S119, __LC.S120, __LC.S121, __LC.S122, __LC.S123, __LC.S124, __LC.S125, __LC.S126, __LC.S127, __LC.S128, __LC.S129, __LC.S130, __LC.S131, __LC.S132, __LC.S133, __LC.S134, __LC.S135
__numbercharactersbase1016: DQ `0123456789abcdef`
__LC.S0: db `%s:%i: Assertion '%s' failed.\n`, 0
__LC.S1: db `=======================\n`, 0
__LC.S2: db `EMPTY\n`, 0
__LC.S3: db `BLOCK: %i @ %x : %i\n`, 0
__LC.S4: db `Appends: %i, Deletions %i, Cache: %u\n`, 0
__LC.S5: db `=======================\n`, 0
__LC.S6: db `Malloc:%i: Bad mmap: `, 0
__LC.S7: db `Operation not permitted`, 0
__LC.S8: db `No such file or directory`, 0
__LC.S9: db `No such process`, 0
__LC.S10: db `Interrupted system call`, 0
__LC.S11: db `I/O error`, 0
__LC.S12: db `No such device or address`, 0
__LC.S13: db `Argument list too long`, 0
__LC.S14: db `Exec format error`, 0
__LC.S15: db `Bad file number`, 0
__LC.S16: db `No child processes`, 0
__LC.S17: db `Try again`, 0
__LC.S18: db `Out of memory`, 0
__LC.S19: db `Permission denied`, 0
__LC.S20: db `Bad address`, 0
__LC.S21: db `Block device required`, 0
__LC.S22: db `Device or resource busy`, 0
__LC.S23: db `File exists`, 0
__LC.S24: db `Cross-device link`, 0
__LC.S25: db `No such device`, 0
__LC.S26: db `Not a directory`, 0
__LC.S27: db `Is a directory`, 0
__LC.S28: db `Invalid argument`, 0
__LC.S29: db `File table overflow`, 0
__LC.S30: db `Too many open files`, 0
__LC.S31: db `Not a typewriter`, 0
__LC.S32: db `Text file busy`, 0
__LC.S33: db `File too large`, 0
__LC.S34: db `No space left on device`, 0
__LC.S35: db `Illegal seek`, 0
__LC.S36: db `Read-only file system`, 0
__LC.S37: db `Too many links`, 0
__LC.S38: db `Broken pipe`, 0
__LC.S39: db `Math argument out of domain of func`, 0
__LC.S40: db `Math result not representable`, 0
__LC.S41: db `Resource deadlock would occur`, 0
__LC.S42: db `File name too long`, 0
__LC.S43: db `No record locks available`, 0
__LC.S44: db `Function not implemented`, 0
__LC.S45: db `Directory not empty`, 0
__LC.S46: db `Too many symbolic links encountered`, 0
__LC.S47: db `No message of desired type`, 0
__LC.S48: db `Identifier removed`, 0
__LC.S49: db `Channel number out of range`, 0
__LC.S50: db `Level 2 not synchronized`, 0
__LC.S51: db `Level 3 halted`, 0
__LC.S52: db `Level 3 reset`, 0
__LC.S53: db `Link number out of range`, 0
__LC.S54: db `Protocol driver not attached`, 0
__LC.S55: db `No CSI structure available`, 0
__LC.S56: db `Level 2 halted`, 0
__LC.S57: db `Invalid exchange`, 0
__LC.S58: db `Invalid request descriptor`, 0
__LC.S59: db `Exchange full`, 0
__LC.S60: db `No anode`, 0
__LC.S61: db `Invalid request code`, 0
__LC.S62: db `Invalid slot`, 0
__LC.S63: db `Bad font file format`, 0
__LC.S64: db `Device not a stream`, 0
__LC.S65: db `No data available`, 0
__LC.S66: db `Timer expired`, 0
__LC.S67: db `Out of streams resources`, 0
__LC.S68: db `Machine is not on the network`, 0
__LC.S69: db `Package not installed`, 0
__LC.S70: db `Object is remote`, 0
__LC.S71: db `Link has been severed`, 0
__LC.S72: db `Advertise error`, 0
__LC.S73: db `Srmount error`, 0
__LC.S74: db `Communication error on send`, 0
__LC.S75: db `Protocol error`, 0
__LC.S76: db `Multihop attempted`, 0
__LC.S77: db `RFS specific error`, 0
__LC.S78: db `Not a data message`, 0
__LC.S79: db `Value too large for defined data type`, 0
__LC.S80: db `Name not unique on network`, 0
__LC.S81: db `File descriptor in bad state`, 0
__LC.S82: db `Remote address changed`, 0
__LC.S83: db `Can not access a needed shared library`, 0
__LC.S84: db `Accessing a corrupted shared library`, 0
__LC.S85: db `.lib section in a.out corrupted`, 0
__LC.S86: db `Attempting to link in too many shared libraries`, 0
__LC.S87: db `Cannot exec a shared library directly`, 0
__LC.S88: db `Illegal byte sequence`, 0
__LC.S89: db `Interrupted system call should be restarted`, 0
__LC.S90: db `Streams pipe error`, 0
__LC.S91: db `Too many users`, 0
__LC.S92: db `Socket operation on non-socket`, 0
__LC.S93: db `Destination address required`, 0
__LC.S94: db `Message too long`, 0
__LC.S95: db `Protocol wrong type for socket`, 0
__LC.S96: db `Protocol not available`, 0
__LC.S97: db `Protocol not supported`, 0
__LC.S98: db `Socket type not supported`, 0
__LC.S99: db `Operation not supported on transport endpoint`, 0
__LC.S100: db `Protocol family not supported`, 0
__LC.S101: db `Address family not supported by protocol`, 0
__LC.S102: db `Address already in use`, 0
__LC.S103: db `Cannot assign requested address`, 0
__LC.S104: db `Network is down`, 0
__LC.S105: db `Network is unreachable`, 0
__LC.S106: db `Network dropped connection because of reset`, 0
__LC.S107: db `Software caused connection abort`, 0
__LC.S108: db `Connection reset by peer`, 0
__LC.S109: db `No buffer space available`, 0
__LC.S110: db `Transport endpoint is already connected`, 0
__LC.S111: db `Transport endpoint is not connected`, 0
__LC.S112: db `Cannot send after transport endpoint shutdown`, 0
__LC.S113: db `Too many references: cannot splice`, 0
__LC.S114: db `Connection timed out`, 0
__LC.S115: db `Connection refused`, 0
__LC.S116: db `Host is down`, 0
__LC.S117: db `No route to host`, 0
__LC.S118: db `Operation already in progress`, 0
__LC.S119: db `Operation now in progress`, 0
__LC.S120: db `Stale NFS file handle`, 0
__LC.S121: db `Structure needs cleaning`, 0
__LC.S122: db `Not a XENIX named type file`, 0
__LC.S123: db `No XENIX semaphores available`, 0
__LC.S124: db `Is a named type file`, 0
__LC.S125: db `Remote I/O error`, 0
__LC.S126: db `Quota exceeded`, 0
__LC.S127: db `No medium found`, 0
__LC.S128: db `Wrong medium type`, 0
__LC.S129: db `Operation Canceled`, 0
__LC.S130: db `Required key not available`, 0
__LC.S131: db `Key has expired`, 0
__LC.S132: db `Key has been revoked`, 0
__LC.S133: db `Key was rejected by service`, 0
__LC.S134: db `Owner died`, 0
__LC.S135: db `State not recoverable`, 0
__LC.S136: db `Unkown Error Code.`, 0
__LC.S137: db `0123456789abcdef`, 0
__LC.S138: db `QNaN`, 0
__LC.S139: db `SNaN`, 0
__LC.S140: db `NaN`, 0
__LC.S141: db `Inf`, 0
__LC.S142: db `-Inf`, 0
__LC.S143: db `False`, 0
__LC.S144: db `True`, 0
__LC.S145: db `test\n`, 0
	section .bss align=8
	section .text align=16
	global main
_long_pow_plonglong:
	mov rax, rdi
	dec rsi
	jz _int_pow_pintint_end
_int_pow_pintint_flp:
	mul rdi
	dec rsi
	jnz _int_pow_pintint_flp
_int_pow_pintint_end:
	ret
_double_pow_plonglong:
	push rbp
	mov rbp, rsp
	sub rsp, 24
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	mov rbx, qword[rbp-16]
	mov rsi, rbx
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _long_pow_plonglong
	push rax
	pop rax
	cvtsi2sd xmm0, rdi
	leave
	ret
_double_pow_pdoublelong:
	dec rdi
_double_pow_pdoubleint_flp:
	mulsd xmm0, xmm0
	dec rdi
	jnz _int_pow_pintint_flp
	ret
_long_floor_pdouble:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	movsd [rbp-8], xmm0
	mov rax, 4602678819172646912
	movq xmm7, rax
	movsd xmm8, qword[rbp-8]
	subsd xmm8, xmm7
	movsd xmm0, xmm8
	roundsd xmm0, xmm0, 0  
	cvttsd2si rax, xmm0
.L0x183:
___long_floor_pdouble__return:
	leave
	ret
_long_abs_plong:
	mov rax, rdi
	sar rdi, 63
	xor rax, rdi
	sub rax, rdi
	ret
_long_ceil_pdouble:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	movsd [rbp-8], xmm0
	xor rbx, rbx
	movsd xmm7, qword[rbp-8]
	cvtsi2sd xmm8, rbx
	subsd xmm8, xmm7
	movsd xmm0, xmm8
	call _long_floor_pdouble
	push rax
	xor r10, r10
	pop rbx
	sub r10, rbx
	mov rax, r10
___long_ceil_pdouble__return:
	leave
	ret
_double_abs_pdouble:
	movq rax, xmm0
	shl rax, 1
	shr rax, 1
	movq xmm0, rax 
	ret
_long_log_plong:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov [rbp-8], rdi
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _long_log2_plong
	mov rbx, rax
	xor rax, rax
	mov rax, rbx
	mov rdx, 3074457345618257920
	imul rdx
	mov rax, rbx
	sub rax, rdx
	shr rax, 1
	add rax, rdx
	shr rax, 1
___long_log_plong__return:
	leave
	ret
_long_log_plonglong:
	push rbp
	mov rbp, rsp
	sub rsp, 24
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	call _long_log2_plong
	push rax
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _long_log2_plong
	mov r10, rax
	pop rbx
	xor rdx, rdx
	mov rax, rbx
	idiv r10
___long_log_plonglong__return:
	leave
	ret
_long_log2_plong:
	xor rax, rax
.L0x17a_long_lop2_plong_flp:
	sar rdi, 1
	inc rax
	test rdi, rdi
	jnz .L0x17a_long_lop2_plong_flp
	dec rax
	ret
_double_fmod_pdoubledouble:
	push rbp
	mov rbp, rsp
	sub rsp, 24
	movsd [rbp-8], xmm0
	movsd [rbp-16], xmm1
	movsd xmm8, qword[rbp-16]
	movsd xmm7, qword[rbp-8]
	divsd xmm7, xmm8
	movsd xmm0, xmm7
	call _long_floor_pdouble
	push rax
	xor rbx, rbx
	movsd xmm7, qword[rbp-16]
	cvtsi2sd xmm8, rbx
	subsd xmm8, xmm7
	pop rbx
	cvtsi2sd xmm7, rbx
	mulsd xmm8, xmm7
	movsd xmm7, qword[rbp-8]
	addsd xmm8, xmm7
	movsd xmm0, xmm8
___double_fmod_pdoubledouble__return:
	leave
	ret
_long_divmod_plonglonglong.:
	mov rbx, rdx
	xor rdx, rdx
	mov rax, rdi
	prefetchw [rbx]
	div rsi
	mov [rbx], rdx
	ret
_long_divmods_plonglonglong.:
	mov rbx, rdx
	xor rdx, rdx
	mov rax, rdi
	prefetchw [rbx]
	idiv rsi
	mov [rbx], rdx
	ret
_double_taylor_sin_pdouble:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	movsd [rbp-8], xmm0
	movsd xmm8, qword[rbp-8]
	movsd xmm7, qword[rbp-8]
	mulsd xmm7, xmm8
	movsd xmm8, qword[rbp-8]
	mulsd xmm7, xmm8
	mov rax, 4618441417868443648
	movq xmm8, rax
	divsd xmm7, xmm8
	movsd xmm8, qword[rbp-8]
	subsd xmm8, xmm7
	movsd xmm9, qword[rbp-8]
	movsd xmm7, qword[rbp-8]
	mulsd xmm7, xmm9
	movsd xmm9, qword[rbp-8]
	mulsd xmm7, xmm9
	movsd xmm9, qword[rbp-8]
	mulsd xmm7, xmm9
	movsd xmm9, qword[rbp-8]
	mulsd xmm7, xmm9
	mov rax, 4638144666238189568
	movq xmm9, rax
	divsd xmm7, xmm9
	addsd xmm8, xmm7
	movsd xmm9, qword[rbp-8]
	movsd xmm7, qword[rbp-8]
	mulsd xmm7, xmm9
	movsd xmm9, qword[rbp-8]
	mulsd xmm7, xmm9
	movsd xmm9, qword[rbp-8]
	mulsd xmm7, xmm9
	movsd xmm9, qword[rbp-8]
	mulsd xmm7, xmm9
	movsd xmm9, qword[rbp-8]
	mulsd xmm7, xmm9
	movsd xmm9, qword[rbp-8]
	mulsd xmm7, xmm9
	mov rax, 4662263553305083904
	movq xmm9, rax
	divsd xmm7, xmm9
	subsd xmm8, xmm7
	movsd xmm9, qword[rbp-8]
	movsd xmm7, qword[rbp-8]
	mulsd xmm7, xmm9
	movsd xmm9, qword[rbp-8]
	mulsd xmm7, xmm9
	movsd xmm9, qword[rbp-8]
	mulsd xmm7, xmm9
	movsd xmm9, qword[rbp-8]
	mulsd xmm7, xmm9
	movsd xmm9, qword[rbp-8]
	mulsd xmm7, xmm9
	movsd xmm9, qword[rbp-8]
	mulsd xmm7, xmm9
	movsd xmm9, qword[rbp-8]
	mulsd xmm7, xmm9
	movsd xmm9, qword[rbp-8]
	mulsd xmm7, xmm9
	mov rax, 4689977843394805760
	movq xmm9, rax
	divsd xmm7, xmm9
	addsd xmm8, xmm7
	movsd xmm0, xmm8
___double_taylor_sin_pdouble__return:
	leave
	ret
_double_sin_pdouble:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	movsd [rbp-8], xmm0
	xor rax, rax
	movq xmm7, rax
	movsd xmm8, qword[rbp-8]
	comisd xmm8, xmm7
	je .L0x173
	mov rax, 4614256656552045848
	movq xmm7, rax
	mov rbx, 2
	cvtsi2sd xmm8, rbx
	mulsd xmm8, xmm7
	movsd xmm1, xmm8
	movsd xmm7, qword[rbp-8]
	movsd xmm0, xmm7
	call _double_fmod_pdoubledouble
	movq rax, xmm0
	push rax
	mov rax, 4614256656552045848
	movq xmm7, rax
	pop rax
	movq xmm8, rax
	subsd xmm7, xmm8
	movsd xmm0, xmm7
	call _double_taylor_sin_pdouble
	movq rax, xmm0
	jmp ___double_sin_pdouble__return
	jmp .L0x174
.L0x173:
.L0x174:
	xor rax, rax
	cvtsi2sd xmm0, rax
___double_sin_pdouble__return:
	leave
	ret
_double_cos_pdouble:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	movsd [rbp-8], xmm0
	xor rax, rax
	movq xmm7, rax
	movsd xmm8, qword[rbp-8]
	comisd xmm8, xmm7
	je .L0x171
	mov rax, 4609753056924675352
	movq xmm7, rax
	movsd xmm8, qword[rbp-8]
	addsd xmm8, xmm7
	movsd xmm0, xmm8
	call _double_sin_pdouble
	movq rax, xmm0
	jmp ___double_cos_pdouble__return
	jmp .L0x172
.L0x171:
.L0x172:
	mov rax, 1
	cvtsi2sd xmm0, rax
___double_cos_pdouble__return:
	leave
	ret
_double_tan_pdouble:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	movsd [rbp-8], xmm0
	xor rax, rax
	movq xmm7, rax
	movsd xmm8, qword[rbp-8]
	comisd xmm8, xmm7
	je .L0x16f
	movsd xmm7, qword[rbp-8]
	movsd xmm0, xmm7
	call _double_sin_pdouble
	movq rax, xmm0
	push rax
	movsd xmm7, qword[rbp-8]
	movsd xmm0, xmm7
	call _double_cos_pdouble
	movsd xmm8, xmm0
	pop rax
	movq xmm7, rax
	divsd xmm7, xmm8
	movsd xmm0, xmm7
	jmp ___double_tan_pdouble__return
	jmp .L0x170
.L0x16f:
.L0x170:
	xor rax, rax
	cvtsi2sd xmm0, rax
___double_tan_pdouble__return:
	leave
	ret
_double_cot_pdouble:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	movsd [rbp-8], xmm0
	xor rax, rax
	movq xmm7, rax
	movsd xmm8, qword[rbp-8]
	comisd xmm8, xmm7
	je .L0x16d
	movsd xmm7, qword[rbp-8]
	movsd xmm0, xmm7
	call _double_tan_pdouble
	movq rax, xmm0
	push rax
	mov rax, 4607182418800017408
	movq xmm7, rax
	pop rax
	movq xmm8, rax
	divsd xmm7, xmm8
	movsd xmm0, xmm7
	jmp ___double_cot_pdouble__return
	jmp .L0x16e
.L0x16d:
.L0x16e:
	mov rax, 9221120237041090561
	movq xmm0, rax
___double_cot_pdouble__return:
	leave
	ret
_double_sec_pdouble:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	movsd [rbp-8], xmm0
	xor rax, rax
	movq xmm7, rax
	movsd xmm8, qword[rbp-8]
	comisd xmm8, xmm7
	je .L0x16b
	movsd xmm7, qword[rbp-8]
	movsd xmm0, xmm7
	call _double_cos_pdouble
	movq rax, xmm0
	push rax
	mov rax, 4607182418800017408
	movq xmm7, rax
	pop rax
	movq xmm8, rax
	divsd xmm7, xmm8
	movsd xmm0, xmm7
	jmp ___double_sec_pdouble__return
	jmp .L0x16c
.L0x16b:
.L0x16c:
	mov rax, 1
	cvtsi2sd xmm0, rax
___double_sec_pdouble__return:
	leave
	ret
_double_csc_pdouble:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	movsd [rbp-8], xmm0
	xor rax, rax
	movq xmm7, rax
	movsd xmm8, qword[rbp-8]
	comisd xmm8, xmm7
	je .L0x169
	movsd xmm7, qword[rbp-8]
	movsd xmm0, xmm7
	call _double_sin_pdouble
	movq rax, xmm0
	push rax
	mov rax, 4607182418800017408
	movq xmm7, rax
	pop rax
	movq xmm8, rax
	divsd xmm7, xmm8
	movsd xmm0, xmm7
	jmp ___double_csc_pdouble__return
	jmp .L0x16a
.L0x169:
.L0x16a:
	mov rax, 9221120237041090561
	movq xmm0, rax
___double_csc_pdouble__return:
	leave
	ret
_double_taylor_asin_pdouble:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	movsd [rbp-8], xmm0
	movsd xmm8, qword[rbp-8]
	movsd xmm7, qword[rbp-8]
	mulsd xmm7, xmm8
	movsd xmm8, qword[rbp-8]
	mulsd xmm7, xmm8
	mov rax, 4613937818241073152
	movq xmm8, rax
	divsd xmm7, xmm8
	mov rax, 4602678819172646912
	movq xmm8, rax
	mulsd xmm8, xmm7
	movsd xmm7, qword[rbp-8]
	addsd xmm7, xmm8
	movsd xmm9, qword[rbp-8]
	movsd xmm8, qword[rbp-8]
	mulsd xmm8, xmm9
	movsd xmm9, qword[rbp-8]
	mulsd xmm8, xmm9
	movsd xmm9, qword[rbp-8]
	mulsd xmm8, xmm9
	movsd xmm9, qword[rbp-8]
	mulsd xmm8, xmm9
	mov rax, 4617315517961601024
	movq xmm9, rax
	divsd xmm8, xmm9
	mov rax, 4600427019358961664
	movq xmm9, rax
	mulsd xmm9, xmm8
	addsd xmm7, xmm9
	movsd xmm9, qword[rbp-8]
	movsd xmm8, qword[rbp-8]
	mulsd xmm8, xmm9
	movsd xmm9, qword[rbp-8]
	mulsd xmm8, xmm9
	movsd xmm9, qword[rbp-8]
	mulsd xmm8, xmm9
	movsd xmm9, qword[rbp-8]
	mulsd xmm8, xmm9
	movsd xmm9, qword[rbp-8]
	mulsd xmm8, xmm9
	movsd xmm9, qword[rbp-8]
	mulsd xmm8, xmm9
	mov rax, 4619567317775286272
	movq xmm9, rax
	divsd xmm8, xmm9
	mov rax, 4599301119452119040
	movq xmm9, rax
	mulsd xmm9, xmm8
	addsd xmm7, xmm9
	movsd xmm9, qword[rbp-8]
	movsd xmm8, qword[rbp-8]
	mulsd xmm8, xmm9
	movsd xmm9, qword[rbp-8]
	mulsd xmm8, xmm9
	movsd xmm9, qword[rbp-8]
	mulsd xmm8, xmm9
	movsd xmm9, qword[rbp-8]
	mulsd xmm8, xmm9
	movsd xmm9, qword[rbp-8]
	mulsd xmm8, xmm9
	movsd xmm9, qword[rbp-8]
	mulsd xmm8, xmm9
	movsd xmm9, qword[rbp-8]
	mulsd xmm8, xmm9
	movsd xmm9, qword[rbp-8]
	mulsd xmm8, xmm9
	mov rax, 4621256167635550208
	movq xmm9, rax
	divsd xmm8, xmm9
	mov rax, 4598597432010342400
	movq xmm9, rax
	mulsd xmm9, xmm8
	addsd xmm7, xmm9
	movsd xmm0, xmm7
___double_taylor_asin_pdouble__return:
	leave
	ret
_double_asin_pdouble:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	movsd [rbp-8], xmm0
	mov rax, 13830554455654793216
	movq xmm7, rax
	movsd xmm8, qword[rbp-8]
	comisd xmm8, xmm7
	setl bl
	mov rax, 4607182418800017408
	movq xmm7, rax
	movsd xmm8, qword[rbp-8]
	comisd xmm8, xmm7
	setg r10b
	or bl, r10b
	jz .L0x167
	mov rax, 9221120237041090561
	movq xmm0, rax
	jmp ___double_asin_pdouble__return
	jmp .L0x168
.L0x167:
.L0x168:
	movsd xmm7, qword[rbp-8]
	movsd xmm0, xmm7
	call _double_taylor_asin_pdouble
	movq rax, xmm0
___double_asin_pdouble__return:
	leave
	ret
_double_acos_pdouble:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	movsd [rbp-8], xmm0
	mov rax, 13830554455654793216
	movq xmm7, rax
	movsd xmm8, qword[rbp-8]
	comisd xmm8, xmm7
	setl bl
	mov rax, 4607182418800017408
	movq xmm7, rax
	movsd xmm8, qword[rbp-8]
	comisd xmm8, xmm7
	setg r10b
	or bl, r10b
	jz .L0x165
	mov rax, 9221120237041090561
	movq xmm0, rax
	jmp ___double_acos_pdouble__return
	jmp .L0x166
.L0x165:
.L0x166:
	movsd xmm7, qword[rbp-8]
	movsd xmm0, xmm7
	call _double_taylor_asin_pdouble
	movq rax, xmm0
	push rax
	mov rax, 4609753056924675352
	movq xmm7, rax
	pop rax
	movq xmm8, rax
	subsd xmm7, xmm8
	movsd xmm0, xmm7
___double_acos_pdouble__return:
	leave
	ret
_double_atan_pdouble:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	movsd [rbp-8], xmm0
	mov rax, 13830554455654793216
	movq xmm7, rax
	movsd xmm8, qword[rbp-8]
	comisd xmm8, xmm7
	jne .L0x159
	mov rax, 4605249457297304856
	movq xmm7, rax
	xor rbx, rbx
	cvtsi2sd xmm8, rbx
	subsd xmm8, xmm7
	movsd xmm0, xmm8
	jmp ___double_atan_pdouble__return
	jmp .L0x15a
.L0x159:
	mov rax, 4607182418800017408
	movq xmm7, rax
	movsd xmm8, qword[rbp-8]
	comisd xmm8, xmm7
	jne .L0x15b
	mov rax, 4605249457297304856
	movq xmm7, rax
	movsd xmm0, xmm7
	jmp ___double_atan_pdouble__return
	jmp .L0x15c
.L0x15b:
	xor rax, rax
	movq xmm7, rax
	movsd xmm8, qword[rbp-8]
	comisd xmm8, xmm7
	jne .L0x15d
	xor rax, rax
	cvtsi2sd xmm0, rax
	jmp ___double_atan_pdouble__return
	jmp .L0x15e
.L0x15d:
	mov rax, 4607182418800017408
	movq xmm7, rax
	movsd xmm8, qword[rbp-8]
	comisd xmm8, xmm7
	setle bl
	mov rax, 13830554455654793216
	movq xmm7, rax
	movsd xmm8, qword[rbp-8]
	comisd xmm8, xmm7
	setge r10b
	and bl, r10b
	jz .L0x15f
	movsd xmm8, qword[rbp-8]
	movsd xmm7, qword[rbp-8]
	mulsd xmm7, xmm8
	movsd xmm8, qword[rbp-8]
	mulsd xmm7, xmm8
	mov rax, 4613937818241073152
	movq xmm8, rax
	divsd xmm7, xmm8
	movsd xmm8, qword[rbp-8]
	subsd xmm8, xmm7
	movsd xmm9, qword[rbp-8]
	movsd xmm7, qword[rbp-8]
	mulsd xmm7, xmm9
	movsd xmm9, qword[rbp-8]
	mulsd xmm7, xmm9
	movsd xmm9, qword[rbp-8]
	mulsd xmm7, xmm9
	movsd xmm9, qword[rbp-8]
	mulsd xmm7, xmm9
	mov rax, 4617315517961601024
	movq xmm9, rax
	divsd xmm7, xmm9
	addsd xmm8, xmm7
	movsd xmm9, qword[rbp-8]
	movsd xmm7, qword[rbp-8]
	mulsd xmm7, xmm9
	movsd xmm9, qword[rbp-8]
	mulsd xmm7, xmm9
	movsd xmm9, qword[rbp-8]
	mulsd xmm7, xmm9
	movsd xmm9, qword[rbp-8]
	mulsd xmm7, xmm9
	movsd xmm9, qword[rbp-8]
	mulsd xmm7, xmm9
	movsd xmm9, qword[rbp-8]
	mulsd xmm7, xmm9
	mov rax, 4619567317775286272
	movq xmm9, rax
	divsd xmm7, xmm9
	subsd xmm8, xmm7
	movsd xmm9, qword[rbp-8]
	movsd xmm7, qword[rbp-8]
	mulsd xmm7, xmm9
	movsd xmm9, qword[rbp-8]
	mulsd xmm7, xmm9
	movsd xmm9, qword[rbp-8]
	mulsd xmm7, xmm9
	movsd xmm9, qword[rbp-8]
	mulsd xmm7, xmm9
	movsd xmm9, qword[rbp-8]
	mulsd xmm7, xmm9
	movsd xmm9, qword[rbp-8]
	mulsd xmm7, xmm9
	movsd xmm9, qword[rbp-8]
	mulsd xmm7, xmm9
	movsd xmm9, qword[rbp-8]
	mulsd xmm7, xmm9
	mov rax, 4621256167635550208
	movq xmm9, rax
	divsd xmm7, xmm9
	addsd xmm8, xmm7
	movsd xmm0, xmm8
	jmp ___double_atan_pdouble__return
	jmp .L0x160
.L0x15f:
	mov rax, 13830554455654793216
	movq xmm7, rax
	movsd xmm8, qword[rbp-8]
	comisd xmm8, xmm7
	jge .L0x161
	mov rax, 4609753056924675352
	movq xmm7, rax
	xor rbx, rbx
	cvtsi2sd xmm8, rbx
	subsd xmm8, xmm7
	mov rbx, 1
	movsd xmm7, qword[rbp-8]
	cvtsi2sd xmm9, rbx
	divsd xmm9, xmm7
	subsd xmm8, xmm9
	movsd xmm9, qword[rbp-8]
	movsd xmm7, qword[rbp-8]
	mulsd xmm7, xmm9
	movsd xmm9, qword[rbp-8]
	mulsd xmm7, xmm9
	mov rax, 4613937818241073152
	movq xmm9, rax
	mulsd xmm9, xmm7
	mov rax, 4607182418800017408
	movq xmm7, rax
	divsd xmm7, xmm9
	addsd xmm8, xmm7
	movsd xmm9, qword[rbp-8]
	movsd xmm7, qword[rbp-8]
	mulsd xmm7, xmm9
	movsd xmm9, qword[rbp-8]
	mulsd xmm7, xmm9
	movsd xmm9, qword[rbp-8]
	mulsd xmm7, xmm9
	movsd xmm9, qword[rbp-8]
	mulsd xmm7, xmm9
	mov rax, 4617315517961601024
	movq xmm9, rax
	mulsd xmm9, xmm7
	mov rax, 4607182418800017408
	movq xmm7, rax
	divsd xmm7, xmm9
	subsd xmm8, xmm7
	movsd xmm0, xmm8
	jmp ___double_atan_pdouble__return
	jmp .L0x162
.L0x161:
	mov rax, 4607182418800017408
	movq xmm7, rax
	movsd xmm8, qword[rbp-8]
	comisd xmm8, xmm7
	jle .L0x163
	mov rbx, 1
	movsd xmm7, qword[rbp-8]
	cvtsi2sd xmm8, rbx
	divsd xmm8, xmm7
	mov rax, 4609753056924675352
	movq xmm7, rax
	subsd xmm7, xmm8
	movsd xmm9, qword[rbp-8]
	movsd xmm8, qword[rbp-8]
	mulsd xmm8, xmm9
	movsd xmm9, qword[rbp-8]
	mulsd xmm8, xmm9
	mov rax, 4613937818241073152
	movq xmm9, rax
	mulsd xmm9, xmm8
	mov rax, 4607182418800017408
	movq xmm8, rax
	divsd xmm8, xmm9
	addsd xmm7, xmm8
	movsd xmm9, qword[rbp-8]
	movsd xmm8, qword[rbp-8]
	mulsd xmm8, xmm9
	movsd xmm9, qword[rbp-8]
	mulsd xmm8, xmm9
	movsd xmm9, qword[rbp-8]
	mulsd xmm8, xmm9
	movsd xmm9, qword[rbp-8]
	mulsd xmm8, xmm9
	mov rax, 4617315517961601024
	movq xmm9, rax
	mulsd xmm9, xmm8
	mov rax, 4607182418800017408
	movq xmm8, rax
	divsd xmm8, xmm9
	subsd xmm7, xmm8
	movsd xmm0, xmm7
	jmp ___double_atan_pdouble__return
	jmp .L0x164
.L0x163:
.L0x164:
.L0x162:
.L0x160:
.L0x15e:
.L0x15c:
.L0x15a:
	mov rax, 9221120237041090561
	movq xmm0, rax
___double_atan_pdouble__return:
	leave
	ret
_bool_all_of_raw_piterablesize_tsize_tvoid.:
	push rbp
	mov rbp, rsp
	sub rsp, 48
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	mov [rbp-24], rdx
	mov [rbp-32], rcx
	mov r11, qword[rbp-24]
	mov r10, qword[rbp-16]
	imul r10, r11
	mov r11, qword[rbp-8]
	add r11, r10
	mov rbx, r11
	mov r11, qword[rbp-8]
	mov qword[rbp-40], r11
	jmp .L0x148
.L0x147:
	mov r10, qword[rbp-40]
	mov r10, qword[r10]
	mov rdi, r10
	call qword[rbp-32]
	cmp rax, 0
	jne .L0x14b
	xor al, al
	jmp ___bool_all_of_raw_piterablesize_tsize_tvoid.__return
	jmp .L0x14c
.L0x14b:
.L0x14c:
.L0x149:
	mov r11, qword[rbp-16]
	add qword[rbp-40], r11
.L0x148:
	cmp qword[rbp-40], rbx
	jl .L0x147
.L0x14a:
	mov al, 1
___bool_all_of_raw_piterablesize_tsize_tvoid.__return:
	leave
	ret
_bool_any_of_raw_piterablesize_tsize_tvoid.:
	push rbp
	mov rbp, rsp
	sub rsp, 48
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	mov [rbp-24], rdx
	mov [rbp-32], rcx
	mov r11, qword[rbp-24]
	mov r10, qword[rbp-16]
	imul r10, r11
	mov r11, qword[rbp-8]
	add r11, r10
	mov rbx, r11
	mov r11, qword[rbp-8]
	mov qword[rbp-40], r11
	jmp .L0x142
.L0x141:
	mov r10, qword[rbp-40]
	mov r10, qword[r10]
	mov rdi, r10
	call qword[rbp-32]
	mov rbx, rax
	test rbx, rbx
	jz .L0x145
	mov al, 1
	jmp ___bool_any_of_raw_piterablesize_tsize_tvoid.__return
	jmp .L0x146
.L0x145:
.L0x146:
.L0x143:
	mov r11, qword[rbp-16]
	add qword[rbp-40], r11
.L0x142:
	cmp qword[rbp-40], rbx
	jl .L0x141
.L0x144:
	xor al, al
___bool_any_of_raw_piterablesize_tsize_tvoid.__return:
	leave
	ret
_bool_none_of_raw_piterablesize_tsize_tvoid.:
	push rbp
	mov rbp, rsp
	sub rsp, 48
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	mov [rbp-24], rdx
	mov [rbp-32], rcx
	mov r11, qword[rbp-24]
	mov r10, qword[rbp-16]
	imul r10, r11
	mov r11, qword[rbp-8]
	add r11, r10
	mov rbx, r11
	mov r11, qword[rbp-8]
	mov qword[rbp-40], r11
	jmp .L0x13c
.L0x13b:
	mov r10, qword[rbp-40]
	mov r10, qword[r10]
	mov rdi, r10
	call qword[rbp-32]
	mov rbx, rax
	test rbx, rbx
	jz .L0x13f
	xor al, al
	jmp ___bool_none_of_raw_piterablesize_tsize_tvoid.__return
	jmp .L0x140
.L0x13f:
.L0x140:
.L0x13d:
	mov r11, qword[rbp-16]
	add qword[rbp-40], r11
.L0x13c:
	cmp qword[rbp-40], rbx
	jl .L0x13b
.L0x13e:
	mov al, 1
___bool_none_of_raw_piterablesize_tsize_tvoid.__return:
	leave
	ret
_fd_t_fopen_pchar.char.:
	push rbp
	mov rbp, rsp
	sub rsp, 56
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	mov rbx, qword[rbp-16]
	mov bl, byte[rbx]
	movsx eax, bl
	cdqe
	mov r10, rax
	mov qword[rbp-24], r10
	mov r10b, 1
	mov rbx, qword[rbp-16]
	movsx eax, r10b
	cdqe
	mov r10b, [rbx+rax*1]
	mov rbx, qword[rbp-24]
	movsx eax, r10b
	cdqe
	add rbx, rax
	mov qword[rbp-32], 510
	mov dword[rbp-40], 0
	cmp qword[rbp-24], 114
	je .L0x12b
	cmp r10, 119
	je .L0x12c
	cmp r10, 97
	je .L0x12d
	cmp r10, 157
	je .L0x12e
	cmp r10, 162
	je .L0x12f
	cmp r10, 140
	je .L0x130
	jmp .L0x12a
.L0x12b:
	mov dword[rbp-40], 0
	jmp .L0x12a
.L0x12c:
	mov dword[rbp-40], 1
	jmp .L0x12a
.L0x12d:
	mov dword[rbp-40], 1
	jmp .L0x12a
.L0x12e:
	mov dword[rbp-40], 2
	jmp .L0x12a
.L0x12f:
	mov dword[rbp-40], 2
	jmp .L0x12a
.L0x130:
	mov dword[rbp-40], 2
	jmp .L0x12a
.L0x12a:
	mov r10, qword[rbp-32]
	mov rdx, r10
	mov r10d, dword[rbp-40]
	mov esi, r10d
	mov r10, qword[rbp-8]
	mov rdi, r10
	mov rax, 2
	mov r10, rcx
	syscall
.L0x134:
	mov r10, rax
	mov qword[rbp-48], r10
	cmp qword[rbp-24], 140
	sete bl
	cmp qword[rbp-24], 97
	sete r10b
	or bl, r10b
	jz .L0x135
	mov edx, 2
	mov esi, 0
	mov rbx, qword[rbp-48]
	mov rdi, rbx
	mov rax, 8
	mov r10, rcx
	syscall
.L0x13a:
	jmp .L0x136
.L0x135:
.L0x136:
	mov rbx, qword[rbp-48]
	mov rax, rbx
___fd_t_fopen_pchar.char.__return:
	leave
	ret
_size_t_fputs_pfd_tchar.:
	push rbp
	mov rbp, rsp
	sub rsp, 40
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	call _size_t_strlen_pchar.
	mov r10, rax
	mov qword[rbp-24], r10
	mov rbx, qword[rbp-24]
	mov rdx, rbx
	mov rbx, qword[rbp-16]
	mov rsi, rbx
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	mov rax, 1
	mov r10, rcx
	syscall
.L0x129:
	mov r10, rax
	mov qword[rbp-32], r10
	mov rbx, qword[rbp-32]
	mov rax, rbx
___size_t_fputs_pfd_tchar.__return:
	leave
	ret
_size_t_puts_pchar.:
	push rbp
	mov rbp, rsp
	sub rsp, 32
	mov [rbp-8], rdi
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _size_t_strlen_pchar.
	mov r10, rax
	mov qword[rbp-16], r10
	mov rbx, qword[rbp-16]
	mov rdx, rbx
	mov rbx, qword[rbp-8]
	mov rsi, rbx
	mov rdi, 1
	mov rax, 1
	mov r10, rcx
	syscall
.L0x125:
	mov r10, rax
	mov qword[rbp-24], r10
	mov rbx, qword[rbp-24]
	mov rax, rbx
___size_t_puts_pchar.__return:
	leave
	ret
_long_fgets_pfd_tchar.size_t:
	push rbp
	mov rbp, rsp
	sub rsp, 40
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	mov [rbp-24], rdx
	mov rbx, qword[rbp-24]
	mov rdx, rbx
	mov rbx, qword[rbp-16]
	mov rsi, rbx
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	mov rax, 0
	mov r10, rcx
	syscall
.L0x121:
	mov r10, rax
	mov qword[rbp-32], r10
	mov rbx, qword[rbp-32]
	mov rax, rbx
___long_fgets_pfd_tchar.size_t__return:
	leave
	ret
_void._floads_pfd_t:
	push rbp
	mov rbp, rsp
	sub rsp, 40
	mov [rbp-8], rdi
	mov edx, 2
	mov esi, 0
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	mov rax, 8
	mov r10, rcx
	syscall
.L0x113:
	mov r10, rax
	mov dword[rbp-16], r10d
	mov edx, 2
	mov r10d, 0
	sub r10d, dword[rbp-16]
	mov esi, r10d
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	mov rax, 8
	mov r10, rcx
	syscall
.L0x117:
	mov ebx, dword[rbp-16]
	movsxd r10, ebx
	mov rdi, r10
	call _void._mapalloc_psize_t
	mov r10, rax
	mov qword[rbp-24], r10
	mov ebx, dword[rbp-16]
	movsxd r10, ebx
	mov rdx, r10
	mov rbx, qword[rbp-24]
	mov rsi, rbx
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	mov rax, 0
	mov r10, rcx
	syscall
.L0x11b:
	mov r10, rax
	mov qword[rbp-32], r10
	cmp qword[rbp-32], 0
	jge .L0x11c
	mov rax, qword[rbp-32]
	jmp ___void._floads_pfd_t__return
	jmp .L0x11d
.L0x11c:
.L0x11d:
	mov rax, qword[rbp-24]
___void._floads_pfd_t__return:
	leave
	ret
_void___assert_pboolchar.intchar.:
	push rbp
	mov rbp, rsp
	sub rsp, 40
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	mov [rbp-24], rdx
	mov [rbp-32], rcx
	cmp byte[rbp-8], 0
	jne .L0x10a
	mov rcx, qword[rbp-32]
	movsxd rdx, dword[rbp-24]
	mov rsi, qword[rbp-16]
	mov rdi, __LC.S0
	call eprintf
	mov rdi, 1
	mov rax, 60
	mov r10, rcx
	syscall
.L0x10f:
	jmp .L0x10b
.L0x10a:
.L0x10b:
	xor rax, rax
	leave
	ret
_void_merge_right_pmblock.:
	mov rbx, rdi
	mov rbx, [rbx+8]
	test rbx, rbx
	jz .L0x102
	mov rbx, rdi
	lea rbx, [rbx+8]
	mov r10, rbx
	cmp qword[r10+24], 1
	jne .L0x104
	mov rbx, rdi
	mov rbx, qword[rbx]
	mov r10, rdi
	lea r10, [r10+rbx+32]
	mov rbx, rdi
	cmp r10, qword[rbx]
	jne .L0x106
	mov rbx, rdi
	mov r10, rdi
	lea r10, [r10+8]
	mov r11, r10
	mov r11, qword[r11]
	add r11, 32
	add [rbx], r11
	mov rbx, rdi
	lea rbx, [rbx+8]
	mov r10, rdi
	lea r10, [r10+8]
	mov r11, r10
	mov r11, [r11+8]
	mov [rbx], r11
	mov rbx, rdi
	lea rbx, [rbx+8]
	test rbx, rbx
	jz .L0x108
	mov rbx, rdi
	lea rbx, [rbx+8]
	mov r10, rbx
	lea r10, [r10+16]
	mov r11, rdi
	mov [r10], r11
	jmp .L0x109
.L0x108:
.L0x109:
	jmp .L0x107
.L0x106:
.L0x107:
	jmp .L0x105
.L0x104:
.L0x105:
	jmp .L0x103
.L0x102:
.L0x103:
	xor rax, rax
	ret
_bool_scan_merge_pmblock.:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov [rbp-8], rdi
	mov r10, qword[malloc_maxcache]
	cmp qword[cached_size], r10
	jle .L0xf1
	mov rbx, qword[rbp-8]
	mov rbx, qword[rbx]
	add rbx, 32
	sub qword[cached_size], rbx
	xor r10, r10
	cmp qword[cached_size], r10
	setl bl
	cmp qword[cached_size], 2147483647
	setg r10b
	mov r12, qword[cached_size]
	mov r11, 2147483647
	test r10, r10
	cmovnz r13, r11
	cmovz r13, r12
	xor r10, r10
	test rbx, rbx
	cmovnz r11, r10
	cmovz r11, r13
	mov qword[cached_size], r11
	mov rbx, qword[rbp-8]
	mov rbx, qword[rbx]
	add rbx, 32
	mov rsi, rbx
	mov rax, 11
	mov r10, rcx
	syscall
.L0xf8:
.L0xf4:
	xor al, al
	jmp ___bool_scan_merge_pmblock.__return
	jmp .L0xf2
.L0xf1:
.L0xf2:
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _void_merge_right_pmblock.
	mov rbx, qword[rbp-8]
	mov rbx, [rbx+16]
	mov rdi, rbx
	call _void_merge_right_pmblock.
	mov al, 1
___bool_scan_merge_pmblock.__return:
	leave
	ret
_void_add_block_pmblock.:
	mov rbx, qword[free_head]
	test rbx, rbx
	jnz .L0xef
	mov r10, rdi
	mov qword[free_head], r10
	mov rbx, rdi
	lea rbx, [rbx+16]
	mov r11, rdi
	mov [rbx], r11
	mov rbx, rdi
	mov qword[rbx+8], 0
	jmp ___void_add_block_pmblock.__return
	jmp .L0xf0
.L0xef:
.L0xf0:
	mov rbx, qword[free_head]
	lea rbx, [rbx+16]
	mov r10, rbx
	lea r10, [r10+8]
	mov r11, rdi
	mov [r10], r11
	mov rbx, qword[free_head]
	lea rbx, [rbx+16]
	mov r11, rdi
	mov [rbx], r11
___void_add_block_pmblock.__return:
	ret
_mblock._scan_existing_psize_t:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov [rbp-8], rdi
	mov rbx, qword[free_head]
	test rbx, rbx
	jnz .L0xe3
	xor rax, rax
	jmp ___mblock._scan_existing_psize_t__return
	jmp .L0xe4
.L0xe3:
.L0xe4:
	mov r10, qword[free_head]
	mov qword[rbp-16], r10
	jmp .L0xe6
.L0xe5:
	mov rbx, qword[rbp-16]
	cmp qword[rbx+24], 1
	jne .L0xe9
	mov rbx, qword[rbp-16]
	mov rbx, qword[rbx]
	cmp rbx, qword[rbp-8]
	jl .L0xeb
	mov rbx, qword[rbp-8]
	mov rsi, rbx
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	call _void_split_block_pmblock.size_t
	mov rbx, qword[rbp-16]
	mov qword[rbx+24], 0
	mov rbx, qword[rbp-16]
	mov rax, rbx
	jmp ___mblock._scan_existing_psize_t__return
	jmp .L0xec
.L0xeb:
.L0xec:
	jmp .L0xea
.L0xe9:
.L0xea:
.L0xe7:
	mov rbx, qword[rbp-16]
	mov rbx, [rbx+8]
	mov qword[rbp-16], rbx
.L0xe6:
	test rbx, rbx
	jnz .L0xe5
.L0xe8:
	xor rax, rax
___mblock._scan_existing_psize_t__return:
	leave
	ret
_void_printstate_p:
	mov rdi, __LC.S1
	call _size_t_puts_pchar.
.L0xd5:
	mov rbx, qword[free_head]
	test rbx, rbx
	jnz .L0xd7
	mov rdi, __LC.S2
	call _size_t_puts_pchar.
.L0xda:
	jmp .L0xd8
.L0xd7:
	mov r10, qword[free_head]
	mov qword[rbp-8], r10
	jmp .L0xdd
.L0xdc:
	mov rbx, qword[rbp-8]
	mov rbx, [rbx+24]
	mov rcx, rbx
	mov rdx, qword[rbp-8]
	mov rbx, qword[rbp-8]
	mov rbx, qword[rbx]
	mov rsi, rbx
	mov rdi, __LC.S3
	call printf
.L0xde:
	mov rbx, qword[rbp-8]
	mov rbx, [rbx+8]
	mov qword[rbp-8], rbx
.L0xdd:
	test rbx, rbx
	jnz .L0xdc
.L0xdf:
.L0xd8:
	mov rcx, qword[cached_size]
	mov rdx, qword[deletions]
	mov rsi, qword[appends]
	mov rdi, __LC.S4
	call printf
	mov rdi, __LC.S5
	call _size_t_puts_pchar.
.L0xe1:
	xor rax, rax
	ret
_mblock._create_ptr_psize_t:
	push rbp
	mov rbp, rsp
	sub rsp, 24
	mov [rbp-8], rdi
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	mov r9d, 0
	mov r8, 0
	mov rcx, 34
	mov rdx, 3
	mov rsi, rdi
	mov rdi, 0
	mov rax, 9
	mov r10, rcx
	syscall
.L0xcc:
.L0xc8:
	mov r10, rax
	mov qword[rbp-16], r10
	cmp r10, 0
	jle .L0xce
	mov rax, qword[rbp-16]
	jmp ___mblock._create_ptr_psize_t__return
	jmp .L0xcf
.L0xce:
.L0xcf:
	mov rdi, qword[rbp-16]
	call _char._strerror_pvoid
	mov rdx, rax
	mov rsi, 206
	mov rdi, __LC.S6
	call printf
	mov rdi, 1
	mov rax, 60
	mov r10, rcx
	syscall
.L0xd3:
	xor rax, rax
___mblock._create_ptr_psize_t__return:
	leave
	ret
_void_split_block_pmblock.size_t:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov rbx, rdi
	mov rbx, qword[rbx]
	sub rbx, rsi
	sub rbx, 32
	cmp rbx, 32
	jg .L0xc3
	jmp ___void_split_block_pmblock.size_t__return
	jmp .L0xc4
.L0xc3:
.L0xc4:
	mov r10, rsi
	mov rbx, rdi
	lea rbx, [rbx+r10+32]
	mov qword[rbp-8], rbx
	lea rbx, [rbx+16]
	mov r11, rdi
	mov [rbx], r11
	mov rbx, qword[rbp-8]
	lea rbx, [rbx+8]
	mov r10, rdi
	mov r10, [r10+8]
	mov [rbx], r10
	mov rbx, rdi
	lea rbx, [rbx+8]
	test rbx, rbx
	jz .L0xc5
	mov rbx, rdi
	lea rbx, [rbx+8]
	mov r10, rbx
	lea r10, [r10+16]
	mov r11, qword[rbp-8]
	mov [r10], r11
	jmp .L0xc6
.L0xc5:
.L0xc6:
	mov rbx, rdi
	lea rbx, [rbx+8]
	mov r11, qword[rbp-8]
	mov [rbx], r11
	mov rbx, qword[rbp-8]
	mov r10, rdi
	mov r10, qword[r10]
	sub r10, rsi
	sub r10, 32
	mov [rbx], r10
	mov rbx, qword[rbp-8]
	mov qword[rbx+24], 1
	mov rbx, rdi
	mov r11, rsi
	mov [rbx], r11
___void_split_block_pmblock.size_t__return:
	leave
	ret
_void_free_pvoid.:
	push rbp
	mov rbp, rsp
	sub rsp, 24
	mov [rbp-8], rdi
	mov rbx, qword[rbp-8]
	test rbx, rbx
	jnz .L0xb4
	jmp ___void_free_pvoid.__return
	jmp .L0xb5
.L0xb4:
.L0xb5:
	mov rbx, qword[rbp-8]
	sub rbx, 32
	mov qword[rbp-16], rbx
	cmp qword[rbx], 4096
	jl .L0xb6
	mov rbx, qword[rbp-16]
	add qword[rbx], 32
	mov rbx, qword[rbp-16]
	mov rbx, qword[rbx]
	add rbx, 32
	mov rsi, rbx
	mov rax, 11
	mov r10, rcx
	syscall
.L0xbd:
.L0xb9:
	jmp ___void_free_pvoid.__return
	jmp .L0xb7
.L0xb6:
.L0xb7:
	mov rbx, qword[rbp-16]
	mov qword[rbx+24], 1
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	call _bool_scan_merge_pmblock.
___void_free_pvoid.__return:
	leave
	ret
_void._malloc_psize_t:
	push rbp
	mov rbp, rsp
	sub rsp, 24
	mov [rbp-8], rdi
	cmp qword[rbp-8], 4096
	jl .L0xae
	mov rbx, qword[rbp-8]
	add rbx, 32
	mov rdi, rbx
	call _mblock._create_ptr_psize_t
	mov r10, rax
	mov qword[rbp-16], r10
	mov rbx, qword[rbp-16]
	mov r11, qword[rbp-8]
	mov [rbx], r11
	mov rbx, qword[rbp-16]
	mov qword[rbx+8], 0
	mov rbx, qword[rbp-16]
	mov qword[rbx+16], 0
	mov rbx, qword[rbp-16]
	mov qword[rbx+24], 0
	mov rbx, qword[rbp-16]
	add rbx, 32
	mov rax, rbx
	jmp ___void._malloc_psize_t__return
	jmp .L0xaf
.L0xae:
.L0xaf:
	mov rbx, qword[free_head]
	test rbx, rbx
	jz .L0xb0
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _mblock._scan_existing_psize_t
	mov r10, rax
	mov qword[rbp-16], r10
	mov rax, qword[rbp-16]
	test rax, rax
	jz .L0xb2
	mov rbx, qword[rbp-16]
	mov qword[rbx+24], 0
	mov rbx, qword[rbp-16]
	add rbx, 32
	mov rax, rbx
	jmp ___void._malloc_psize_t__return
	jmp .L0xb3
.L0xb2:
.L0xb3:
	jmp .L0xb1
.L0xb0:
.L0xb1:
	mov rdi, 4096
	call _mblock._create_ptr_psize_t
	mov r10, rax
	mov qword[rbp-16], r10
	mov rbx, qword[rbp-16]
	mov qword[rbx], 4064
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	call _void_add_block_pmblock.
	mov rbx, qword[rbp-8]
	mov rsi, rbx
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	call _void_split_block_pmblock.size_t
	mov rbx, qword[rbp-16]
	mov qword[rbx+24], 0
	mov rbx, qword[rbp-16]
	add rbx, 32
	mov rax, rbx
___void._malloc_psize_t__return:
	leave
	ret
_void._realloc_pvoid.size_t:
	push rbp
	mov rbp, rsp
	sub rsp, 48
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	mov rbx, qword[rbp-8]
	sub rbx, 32
	mov qword[rbp-24], rbx
	mov rbx, qword[rbx]
	mov qword[rbp-32], rbx
	cmp qword[rbp-32], 4096
	jge .L0xa6
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _void_free_pvoid.
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	call _void._malloc_psize_t
	mov r10, rax
	mov qword[rbp-40], r10
	cmp qword[rbp-8], r10
	jne .L0xa8
	mov rbx, qword[rbp-8]
	mov rax, rbx
	jmp ___void._realloc_pvoid.size_t__return
	jmp .L0xa9
.L0xa8:
.L0xa9:
	mov rbx, qword[rbp-32]
	mov rdx, rbx
	mov rbx, qword[rbp-8]
	mov rsi, rbx
	mov rbx, qword[rbp-40]
	mov rdi, rbx
	call _void_memcpy_pvoid.void.size_t
	mov rbx, qword[rbp-40]
	mov rax, rbx
	jmp ___void._realloc_pvoid.size_t__return
	jmp .L0xa7
.L0xa6:
.L0xa7:
	xor r9d, r9d
	xor r8, r8
	mov rcx, 34
	mov rdx, 3
	mov rbx, qword[rbp-16]
	mov rsi, rbx
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	mov rax, 9
	mov r10, rcx
	syscall
.L0xad:
	mov rbx, qword[rbp-8]
	mov rax, rbx
___void._realloc_pvoid.size_t__return:
	leave
	ret
_void._calloc_psize_t:
	push rbp
	mov rbp, rsp
	sub rsp, 24
	mov [rbp-8], rdi
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _void._malloc_psize_t
	mov r10, rax
	mov qword[rbp-16], r10
	mov rbx, qword[rbp-8]
	mov rsi, rbx
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	call _void_memzer_pvoid.size_t
	mov rbx, qword[rbp-16]
	mov rax, rbx
___void._calloc_psize_t__return:
	leave
	ret
_void._mapalloc_psize_t:
	push rbp
	mov rbp, rsp
	sub rsp, 24
	mov [rbp-8], rdi
	mov rbx, qword[rbp-8]
	add rbx, 8
	mov rdi, rbx
	mov r9d, 0
	mov r8, 0
	mov rcx, 34
	mov rdx, 3
	mov rsi, rdi
	mov rdi, 0
	mov rax, 9
	mov r10, rcx
	syscall
.L0xa4:
.L0xa0:
	mov r10, rax
	mov qword[rbp-16], r10
	mov rbx, qword[rbp-16]
	mov r11, qword[rbp-8]
	mov [rbx], r11
	mov rbx, qword[rbp-16]
	add rbx, 8
	mov rax, rbx
___void._mapalloc_psize_t__return:
	leave
	ret
_void_mapfree_pvoid.:
	push rbp
	mov rbp, rsp
	sub rsp, 24
	mov [rbp-8], rdi
	sub qword[rbp-8], 8
	mov rbx, qword[rbp-8]
	mov rbx, qword[rbx]
	mov qword[rbp-16], rbx
	mov rsi, rbx
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	mov rax, 11
	mov r10, rcx
	syscall
.L0x9e:
	xor rax, rax
	leave
	ret
_void_maprealloc_pvoid.size_t:
	push rbp
	mov rbp, rsp
	sub rsp, 24
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	mov r9d, 0
	mov r8, 0
	mov rcx, 34
	mov rdx, 3
	mov rbx, qword[rbp-16]
	mov rsi, rbx
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	mov rax, 9
	mov r10, rcx
	syscall
.L0x9a:
	xor rax, rax
	leave
	ret
_void_memcpy_pvoid.void.size_t:
_void_memcpy_pvoid.void.int_flp:
	mov bl, [rsi]
	mov [rdi], bl
	inc rsi
	inc rdi
	dec rdx
	jnz _void_memcpy_pvoid.void.int_flp
	ret
_void_avx_memcpy_pvoid.void.size_t:
	push rbp
	mov rbp, rsp
	sub rsp, 32
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	mov [rbp-24], rdx
	mov rbx, qword[rbp-24]
	mov rdx, rbx
	mov rbx, qword[rbp-16]
	mov rsi, rbx
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _void_memcpy_pvoid.void.size_t
___void_avx_memcpy_pvoid.void.size_t__return:
	leave
	ret
_void_avx_memzeraligned_pvoid.size_t:
	vxorpd ymm0, ymm0, ymm0
.L0x94avxmemzeraligned_lp:
	vmovdqu [rdi], ymm0
	add rdi, 4
	sub rsi, 4
	jnz .L0x94avxmemzeraligned_lp
	ret
_void_avx_memzer_pvoid.size_t:
	push rbp
	mov rbp, rsp
	sub rsp, 40
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	mov rbx, qword[rbp-16]
	xor rax, rax
	mov rax, rbx
	mov rdx, 1152921504606846976
	imul rdx
	mov rax, rdx
	shr rax, 1
	sal rax, 5
	sub rbx, rax
	mov r10, rbx
	mov dword[rbp-24], r10d
	mov rbx, qword[rbp-16]
	movsxd r11, r10d
	sub rbx, r11
	sar rbx, 2
	mov qword[rbp-32], rbx
	mov rsi, rbx
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _void_avx_memzeraligned_pvoid.size_t
	mov ebx, dword[rbp-24]
	test ebx, ebx
	jz .L0x91
	mov ebx, dword[rbp-24]
	movsxd r10, ebx
	mov rdx, r10
	mov sil, 0
	mov r10, qword[rbp-8]
	add r10, qword[rbp-32]
	mov rdi, r10
	call _void_memset_pvoid.ucharsize_t
	jmp .L0x92
.L0x91:
.L0x92:
	xor rax, rax
	leave
	ret
_void_memset_pvoid.ucharsize_t:
_void_memset_pvoid.ucharsize_t_flp:
	dec rdx
	mov [rdi+rdx], sil
	jnz _void_memset_pvoid.ucharsize_t_flp
	ret
_void_memzer_pvoid.size_t:
	xor bl, bl
.L0x8e:
	mov [rdi+rsi], bl
	dec rsi
	jnz .L0x8e
	ret
_char._get_errstr_pvoid:
	cmp rdi, 131
	setl bl
	xor r11, r11
	cmp rdi, r11
	setge r10b
	and bl, r10b
	jz .L0x8b
	mov r10, rdi
	mov rbx, __linux_errstrlist
	mov r11, [rbx+r10*8]
	mov rax, r11
	jmp ___char._get_errstr_pvoid__return
	jmp .L0x8c
.L0x8b:
.L0x8c:
	mov rax, __LC.S136
___char._get_errstr_pvoid__return:
	ret
_long_strcpy_pchar.char.:
	mov rax, -1
_void_strcpy_pchar.char._flp:
	inc rax
	mov bl, [rsi]
	mov [rdi], bl
	inc rdi
	inc rsi
	test bl, bl
	jnz _void_strcpy_pchar.char._flp
	ret
_size_t_strlen_pchar.:
	mov rax, -1
_size_t_strlen_pchar._flp:
	mov bl, [rdi]
	inc rax
	inc rdi
	test bl, bl
	jnz _size_t_strlen_pchar._flp
	ret
_char._memchr_pchar.charsize_t:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov [rbp-8], rdx
	mov r11, rdi
	add r11, qword[rbp-8]
	mov rbx, r11
	jmp .L0x81
.L0x80:
	mov r10, rdi
	cmp byte[r10], sil
	jne .L0x83
	mov rax, rdi
	jmp ___char._memchr_pchar.charsize_t__return
	jmp .L0x84
.L0x83:
.L0x84:
	inc rdi
.L0x81:
	cmp rdi, rbx
	jl .L0x80
.L0x82:
	xor rax, rax
___char._memchr_pchar.charsize_t__return:
	leave
	ret
_int_memcmp_pchar.char.size_t:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov [rbp-8], rdx
	mov ebx, 0
	mov r12, rdi
	add r12, qword[rbp-8]
	mov r10, r12
	jmp .L0x77
.L0x76:
	mov r11, rdi
	mov r12, rsi
	mov r11b, byte[r11]
	cmp r11b, byte[r12]
	jge .L0x79
	dec ebx
	jmp .L0x7a
.L0x79:
	inc ebx
.L0x7a:
	inc rdi
	inc rsi
.L0x77:
	cmp rdi, r10
	jl .L0x76
.L0x78:
	mov eax, ebx
___int_memcmp_pchar.char.size_t__return:
	leave
	ret
_char._strchr_pchar.char:
	jmp .L0x6d
.L0x6c:
	mov rbx, rdi
	cmp byte[rbx], sil
	jne .L0x6f
	mov rax, rdi
	jmp ___char._strchr_pchar.char__return
	jmp .L0x70
.L0x6f:
.L0x70:
	inc rdi
.L0x6d:
	mov rbx, rdi
	mov bl, byte[rbx]
	test bl, bl
	jnz .L0x6c
.L0x6e:
	xor rax, rax
___char._strchr_pchar.char__return:
	ret
_char._strerror_pvoid:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov [rbp-8], rdi
	cmp qword[rbp-8], 0
	jl .L0x65
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _char._get_errstr_pvoid
	jmp ___char._strerror_pvoid__return
	jmp .L0x66
.L0x65:
	xor r10, r10
	sub r10, qword[rbp-8]
	mov rdi, r10
	call _char._get_errstr_pvoid
	jmp ___char._strerror_pvoid__return
.L0x66:
	xor rax, rax
___char._strerror_pvoid__return:
	leave
	ret
_long_divmod10_plonglong.:
	mov rbx, rsi
	mov r10, rdi
	xor rax, rax
	mov rax, r10
	mov rdx, 3689348814741910528
	imul rdx
	mov rax, rdx
	shr rax, 1
	mov rdx, 10
	imul rdx
	sub r10, rax
	mov [rbx], r10
	xor rax, rax
	mov rax, rdi
	mov rdx, 3689348814741910528
	imul rdx
	mov rax, rdx
	shr rax, 1
___long_divmod10_plonglong.__return:
	ret
_size_t_toBinary_pchar.ulongint:
	push rbp
	mov rbp, rsp
	sub rsp, 24
	mov [rbp-8], rdx
	movsxd rbx, dword[rbp-8]
	add rdi, rbx
	mov dword[rbp-16], 0
	jmp .L0x60
.L0x5f:
	mov r10, 1
	mov rbx, rsi
	and rbx, r10
	jz .L0x63
	mov rbx, rdi
	mov byte[rbx], 49
	jmp .L0x64
.L0x63:
	mov rbx, rdi
	mov byte[rbx], 48
.L0x64:
	shr rsi, 1
	dec rdi
.L0x61:
	add dword[rbp-16], 1
.L0x60:
	mov r10d, dword[rbp-8]
	cmp dword[rbp-16], r10d
	jl .L0x5f
.L0x62:
	mov eax, dword[rbp-8]
	cdqe
___size_t_toBinary_pchar.ulongint__return:
	leave
	ret
_long_toStr_pdoublechar.long:
	push rbp
	mov rbp, rsp
	sub rsp, 64
	movsd [rbp-8], xmm0
	mov [rbp-16], rdi
	mov [rbp-24], rsi
	movsd xmm7, qword[rbp-8]
	movq rbx, xmm7
	mov r10, 9221120237041090561
	cmp rbx, r10
	jne .L0x3d
	mov rsi, __LC.S138
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	call _long_strcpy_pchar.char.
	mov rax, 4
	jmp ___long_toStr_pdoublechar.long__return
	jmp .L0x3e
.L0x3d:
	movsd xmm7, qword[rbp-8]
	movq rbx, xmm7
	mov r10, 9218868437227405313
	cmp rbx, r10
	jne .L0x3f
	mov rsi, __LC.S139
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	call _long_strcpy_pchar.char.
	mov rax, 4
	jmp ___long_toStr_pdoublechar.long__return
	jmp .L0x40
.L0x3f:
	movsd xmm7, qword[rbp-8]
	movq rbx, xmm7
	mov r10, 9223372036854775807
	cmp rbx, r10
	jne .L0x41
	mov rsi, __LC.S140
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	call _long_strcpy_pchar.char.
	mov rax, 3
	jmp ___long_toStr_pdoublechar.long__return
	jmp .L0x42
.L0x41:
	mov rax, 4890904797277847552
	movq xmm7, rax
	movsd xmm8, qword[rbp-8]
	comisd xmm8, xmm7
	jne .L0x43
	mov rsi, __LC.S141
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	call _long_strcpy_pchar.char.
	mov rax, 3
	jmp ___long_toStr_pdoublechar.long__return
	jmp .L0x44
.L0x43:
	mov rax, 4895410595928473600
	movq xmm7, rax
	movsd xmm8, qword[rbp-8]
	comisd xmm8, xmm7
	jne .L0x45
	mov rsi, __LC.S142
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	call _long_strcpy_pchar.char.
	mov rax, 4
	jmp ___long_toStr_pdoublechar.long__return
	jmp .L0x46
.L0x45:
.L0x46:
.L0x44:
.L0x42:
.L0x40:
.L0x3e:
	cvttsd2si rbx, qword[rbp-8]
	mov qword[rbp-32], rbx
	mov qword[rbp-40], 0
	mov rbx, qword[rbp-32]
	test rbx, rbx
	setz bl
	movsd xmm7, qword[rbp-8]
	movq r10, xmm7
	sar r10, 63
	mov r12, r10
	and bl, r12b
	jz .L0x47
	mov rbx, qword[rbp-16]
	mov byte[rbx], 45
	add qword[rbp-16], 1
	add qword[rbp-40], 1
	jmp .L0x48
.L0x47:
.L0x48:
	mov rcx, 10
	mov dl, 1
	mov rbx, qword[rbp-16]
	mov rsi, rbx
	mov rdi, qword[rbp-32]
	call _long_toStr_pintchar.boollong
	add qword[rbp-40], rax
	mov r10, qword[rbp-40]
	add qword[rbp-16], r10
	movsd xmm7, qword[rbp-8]
	movsd xmm0, xmm7
	call _double_abs_pdouble
	movq rax, xmm0
	push rax
	mov rbx, qword[rbp-32]
	mov rdi, rbx
	call _long_abs_plong
	mov rbx, rax
	pop rax
	movq xmm7, rax
	cvtsi2sd xmm8, rbx
	subsd xmm7, xmm8
	mov rbx, qword[rbp-24]
	cvtsi2sd xmm8, rbx
	mulsd xmm7, xmm8
	movsd qword[rbp-8], xmm7
	movsd xmm0, xmm7
	roundsd xmm0, xmm0, 0  
	cvttsd2si rax, xmm0
.L0x53:
	mov rdi, rax
	call _long_abs_plong
	mov r10, rax
	mov qword[rbp-48], r10
	mov rcx, 10
	mov dl, 1
	mov rbx, qword[rbp-16]
	mov rsi, rbx
	mov rdi, qword[rbp-48]
	call _long_toStr_pintchar.boollong
	mov rbx, rax
	dec rbx
	mov qword[rbp-56], rbx
	mov rbx, qword[rbp-16]
	mov byte[rbx], 46
	add qword[rbp-16], 1
	mov r10, 7
	sub r10, qword[rbp-56]
	mov qword[rbp-56], r10
	mov qword[rbp-64], 0
	jmp .L0x56
.L0x55:
	mov rbx, qword[rbp-16]
	mov byte[rbx], 48
	add qword[rbp-16], 1
	add qword[rbp-40], 1
.L0x57:
	add qword[rbp-64], 1
.L0x56:
	mov r10, qword[rbp-56]
	cmp qword[rbp-64], r10
	jl .L0x55
.L0x58:
	mov rcx, 10
	mov dl, 1
	mov rbx, qword[rbp-16]
	mov rsi, rbx
	mov rdi, qword[rbp-48]
	call _long_toStr_pintchar.boollong
	add qword[rbp-40], rax
	mov rbx, qword[rbp-40]
	inc rbx
	mov rax, rbx
___long_toStr_pdoublechar.long__return:
	leave
	ret
_int___sprintf_pchar.char.void.:
	push rbp
	mov rbp, rsp
	sub rsp, 48
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	mov [rbp-24], rdx
	mov dword[rbp-32], 0
	mov r10, qword[rbp-8]
	mov qword[rbp-40], r10
	mov rbx, qword[rbp-8]
	test rbx, rbx
	setz bl
	mov r10, qword[rbp-16]
	test r10, r10
	setz r10b
	or bl, r10b
	jz .L0x13
	xor eax, eax
	jmp ___int___sprintf_pchar.char.void.__return
	jmp .L0x14
.L0x13:
.L0x14:
	jmp .L0x16
.L0x15:
	mov rbx, qword[rbp-16]
	cmp byte[rbx], 37
	je .L0x18
	mov rbx, qword[rbp-8]
	mov r10, qword[rbp-16]
	mov r10b, byte[r10]
	mov [rbx], r10b
	jmp .L0x19
.L0x18:
	add qword[rbp-16], 1
	mov rbx, qword[rbp-16]
	mov bl, byte[rbx]
	mov byte[rbp-48], bl
	cmp byte[rbp-48], 105
	je .L0x1b
	cmp bl, 108
	je .L0x27
	cmp bl, 99
	je .L0x28
	cmp bl, 120
	je .L0x29
	cmp bl, 111
	je .L0x2a
	cmp bl, 117
	je .L0x2b
	cmp bl, 115
	je .L0x2e
	cmp bl, 66
	je .L0x2f
	cmp bl, 101
	je .L0x32
	cmp bl, 102
	je .L0x33
	cmp bl, 98
	je .L0x34
	jmp .L0x1a
.L0x1b:
	mov r11d, dword[rbp-32]
	mov r10, qword[rbp-24]
	mov eax, r11d
	cdqe
	mov r11, [r10+rax*8]
	mov r10, r11
	mov dword[rbp-56], r10d
	mov rcx, 10
	mov dl, 1
	mov r10, qword[rbp-8]
	mov rsi, r10
	mov r10d, dword[rbp-56]
	mov edi, r10d
	call _long_toStr_pintchar.boollong
	mov r11, rax
	mov qword[rbp-64], r11
	mov r10, qword[rbp-64]
	dec r10
	add qword[rbp-8], r10
	jmp .L0x1a
.L0x27:
	mov r11d, dword[rbp-32]
	mov r10, qword[rbp-24]
	mov eax, r11d
	cdqe
	mov r11, [r10+rax*8]
	mov qword[rbp-72], r11
	mov rcx, 10
	mov dl, 1
	mov r10, qword[rbp-8]
	mov rsi, r10
	mov rdi, qword[rbp-72]
	call _long_toStr_pintchar.boollong
	mov r11, rax
	mov qword[rbp-80], r11
	mov r10, qword[rbp-80]
	dec r10
	add qword[rbp-8], r10
	jmp .L0x1a
.L0x28:
	mov r11d, dword[rbp-32]
	mov r10, qword[rbp-24]
	mov eax, r11d
	cdqe
	mov r11, [r10+rax*8]
	mov r12, r11
	mov byte[rbp-88], r12b
	mov r10, qword[rbp-8]
	mov r12b, byte[rbp-88]
	mov [r10], r12b
	jmp .L0x1a
.L0x29:
	mov r11d, dword[rbp-32]
	mov r10, qword[rbp-24]
	mov eax, r11d
	cdqe
	mov r11, [r10+rax*8]
	mov qword[rbp-96], r11
	mov rcx, 16
	mov dl, 0
	mov r10, qword[rbp-8]
	mov rsi, r10
	mov rdi, qword[rbp-96]
	call _long_toStr_pintchar.boollong
	mov r11, rax
	mov qword[rbp-104], r11
	mov r10, qword[rbp-104]
	dec r10
	add qword[rbp-8], r10
	jmp .L0x1a
.L0x2a:
	mov r11d, dword[rbp-32]
	mov r10, qword[rbp-24]
	mov eax, r11d
	cdqe
	mov r11, [r10+rax*8]
	mov qword[rbp-112], r11
	mov rcx, 8
	mov dl, 0
	mov r10, qword[rbp-8]
	mov rsi, r10
	mov rdi, qword[rbp-112]
	call _long_toStr_pintchar.boollong
	mov r11, rax
	mov qword[rbp-120], r11
	mov r10, qword[rbp-120]
	dec r10
	add qword[rbp-8], r10
	jmp .L0x1a
.L0x2b:
	mov r11b, 1
	mov r10, qword[rbp-16]
	movsx eax, r11b
	cdqe
	mov r11b, [r10+rax*1]
	mov byte[rbp-128], r11b
	cmp byte[rbp-128], 108
	jne .L0x2c
	mov r11d, dword[rbp-32]
	mov r10, qword[rbp-24]
	mov eax, r11d
	cdqe
	mov r11, [r10+rax*8]
	mov qword[rbp-136], r11
	mov rcx, 10
	mov dl, 0
	mov r10, qword[rbp-8]
	mov rsi, r10
	mov rdi, qword[rbp-136]
	call _long_toStr_pintchar.boollong
	mov r10, rax
	mov dword[rbp-144], r10d
	dec r10d
	movsxd r11, r10d
	add qword[rbp-8], r11
	add qword[rbp-16], 1
	jmp .L0x2d
.L0x2c:
	mov r11d, dword[rbp-32]
	mov r10, qword[rbp-24]
	mov eax, r11d
	cdqe
	mov r11, [r10+rax*8]
	mov qword[rbp-136], r11
	mov rcx, 10
	mov dl, 0
	mov r10, qword[rbp-8]
	mov rsi, r10
	mov rdi, qword[rbp-136]
	call _long_toStr_pintchar.boollong
	mov r10, rax
	mov dword[rbp-144], r10d
	dec r10d
	movsxd r11, r10d
	add qword[rbp-8], r11
.L0x2d:
	jmp .L0x1a
.L0x2e:
	mov r11d, dword[rbp-32]
	mov r10, qword[rbp-24]
	mov eax, r11d
	cdqe
	mov r11, [r10+rax*8]
	mov rsi, r11
	mov r10, qword[rbp-8]
	mov rdi, r10
	call _long_strcpy_pchar.char.
	mov r10, rax
	mov dword[rbp-136], r10d
	dec r10d
	movsxd r11, r10d
	add qword[rbp-8], r11
	jmp .L0x1a
.L0x2f:
	mov r11d, dword[rbp-32]
	mov r10, qword[rbp-24]
	mov eax, r11d
	cdqe
	mov r11, [r10+rax*8]
	mov r10, r11
	mov byte[rbp-144], r10b
	mov r11, __LC.S143
	mov qword[rbp-152], r11
	mov al, byte[rbp-144]
	test al, al
	jz .L0x30
	mov r11, __LC.S144
	mov qword[rbp-152], r11
	jmp .L0x31
.L0x30:
.L0x31:
	mov r10, qword[rbp-152]
	mov rsi, r10
	mov r10, qword[rbp-8]
	mov rdi, r10
	call _long_strcpy_pchar.char.
	mov r10, rax
	mov dword[rbp-160], r10d
	movsxd r10, dword[rbp-160]
	add qword[rbp-8], r10
	jmp .L0x1a
.L0x32:
	mov r11d, dword[rbp-32]
	mov r10, qword[rbp-24]
	mov eax, r11d
	cdqe
	mov r11, [r10+rax*8]
	movq xmm7, r11
	movsd qword[rbp-168], xmm7
	mov rsi, 1000000000
	mov r10, qword[rbp-8]
	mov rdi, r10
	movsd xmm7, qword[rbp-168]
	movsd xmm0, xmm7
	call _long_toStr_pdoublechar.long
	mov r10, rax
	mov dword[rbp-176], r10d
	dec r10d
	movsxd r11, r10d
	add qword[rbp-8], r11
	jmp .L0x1a
.L0x33:
	mov r11d, dword[rbp-32]
	mov r10, qword[rbp-24]
	mov eax, r11d
	cdqe
	mov r11, [r10+rax*8]
	movq xmm7, r11
	movss dword[rbp-184], xmm7
	cvtss2sd xmm7, dword[rbp-184]
	movsd qword[rbp-192], xmm7
	mov rsi, 10000000
	mov r10, qword[rbp-8]
	mov rdi, r10
	movsd xmm7, qword[rbp-192]
	movsd xmm0, xmm7
	call _long_toStr_pdoublechar.long
	mov r10, rax
	mov dword[rbp-200], r10d
	dec r10d
	movsxd r11, r10d
	add qword[rbp-8], r11
	jmp .L0x1a
.L0x34:
	mov r11d, dword[rbp-32]
	mov r10, qword[rbp-24]
	mov eax, r11d
	cdqe
	mov r11, [r10+rax*8]
	mov qword[rbp-208], r11
	mov r10, qword[rbp-16]
	inc r10
	mov r10b, byte[r10]
	mov byte[rbp-216], r10b
	mov dword[rbp-224], 64
	cmp byte[rbp-216], 56
	jne .L0x35
	add qword[rbp-16], 1
	jmp .L0x36
.L0x35:
	cmp byte[rbp-216], 52
	jne .L0x37
	mov dword[rbp-224], 32
	add qword[rbp-16], 1
	jmp .L0x38
.L0x37:
	cmp byte[rbp-216], 50
	jne .L0x39
	mov dword[rbp-224], 16
	add qword[rbp-16], 1
	jmp .L0x3a
.L0x39:
	cmp byte[rbp-216], 49
	jne .L0x3b
	mov dword[rbp-224], 8
	add qword[rbp-16], 1
	jmp .L0x3c
.L0x3b:
.L0x3c:
.L0x3a:
.L0x38:
.L0x36:
	mov r10d, dword[rbp-224]
	mov edx, r10d
	mov rsi, qword[rbp-208]
	mov r10, qword[rbp-8]
	mov rdi, r10
	call _size_t_toBinary_pchar.ulongint
	mov r11, rax
	mov qword[rbp-232], r11
	add qword[rbp-8], r11
	jmp .L0x1a
.L0x1a:
	add dword[rbp-32], 1
.L0x19:
	add qword[rbp-16], 1
	add qword[rbp-8], 1
.L0x16:
	mov rbx, qword[rbp-16]
	mov bl, byte[rbx]
	test bl, bl
	jnz .L0x15
.L0x17:
	mov r10, qword[rbp-8]
	sub r10, qword[rbp-40]
	mov eax, r10d
___int___sprintf_pchar.char.void.__return:
	leave
	ret
_long_toStr_pintchar.boollong:
	push rbp
	mov rbp, rsp
	sub rsp, 128
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	mov [rbp-24], rdx
	mov [rbp-32], rcx
	mov r10d, dword[rbp-8]
	test r10d, r10d
	jnz .L0x1c
	mov r10, qword[rbp-16]
	mov byte[r10], 48
	mov rax, 1
	jmp ___long_toStr_pintchar.boollong__return
	jmp .L0x1d
.L0x1c:
.L0x1d:
	mov byte[rbp-40], 0
	cmp dword[rbp-8], 0
	setl r10b
	and r10b, byte[rbp-24]
	jz .L0x1e
	mov r10, qword[rbp-16]
	mov byte[r10], 45
	add qword[rbp-16], 1
	xor r11d, r11d
	sub r11d, dword[rbp-8]
	mov dword[rbp-8], r11d
	mov byte[rbp-40], 1
	jmp .L0x1f
.L0x1e:
.L0x1f:
	mov rdx, 64
	mov sil, 0
	lea r10, [rbp-112]
	mov rdi, r10
	call _void_memset_pvoid.ucharsize_t
	mov qword[rbp-120], 0
	jmp .L0x21
.L0x20:
	mov r10d, dword[rbp-8]
	xor rax, rax
	mov eax, r10d
	mov edx, 858993460
	imul edx
	sar edx, 1
	mov eax, edx
	mov rdx, 10
	imul rdx
	sub r10d, eax
	movsxd r11, r10d
	mov qword[rbp-128], r11
	mov r10d, dword[rbp-8]
	xor rax, rax
	mov eax, r10d
	mov edx, 858993460
	imul edx
	sar edx, 1
	mov r10d, edx
	mov dword[rbp-8], r10d
	mov r11, qword[rbp-120]
	lea r10, [rbp-112] 
	lea r12, [r10+r11*1]
	mov r11, qword[rbp-128]
	mov r10, __numbercharactersbase1016
	mov r13b, [r10+r11*1]
	mov [r12], r13b
	add qword[rbp-120], 1
.L0x21:
	mov r10d, dword[rbp-8]
	test r10d, r10d
	jnz .L0x20
.L0x22:
	sub qword[rbp-16], 1
	mov r10, qword[rbp-120]
	mov dword[rbp-128], r10d
	jmp .L0x24
.L0x23:
	mov r11d, dword[rbp-128]
	mov r10, qword[rbp-16]
	mov eax, r11d
	cdqe
	lea r11, [r10+rax*1]
	mov r12d, dword[rbp-128]
	mov r10, qword[rbp-120]
	movsxd r13, r12d
	sub r10, r13
	lea r12, [rbp-112] 
	mov r13b, [r12+r10*1]
	mov [r11], r13b
.L0x25:
	sub dword[rbp-128], 1
.L0x24:
	xor r11d, r11d
	cmp dword[rbp-128], r11d
	jg .L0x23
.L0x26:
	mov r11b, byte[rbp-40]
	mov r10, qword[rbp-120]
	movsx eax, r11b
	cdqe
	add r10, rax
	inc r10
	mov rax, r10
___long_toStr_pintchar.boollong__return:
	leave
	ret
sprintf:
	push rbp
	mov rbp, rsp
	sub rsp, 104
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	mov [rbp-24], rdx
	mov [rbp-32], rcx
	mov [rbp-40], r8
	mov [rbp-48], r9
	lea rbx, [rbp-88] 
	mov r11, qword[rbp-24]
	mov [rbx], r11
	mov r10, 1
	lea rbx, [rbp-88] 
	lea r11, [rbx+r10*8]
	mov r10, qword[rbp-32]
	mov [r11], r10
	mov r10, 2
	lea rbx, [rbp-88] 
	lea r11, [rbx+r10*8]
	mov r10, qword[rbp-40]
	mov [r11], r10
	mov r10, 3
	lea rbx, [rbp-88] 
	lea r11, [rbx+r10*8]
	mov r10, qword[rbp-48]
	mov [r11], r10
	lea rbx, [rbp-88]
	mov rdx, rbx
	mov rbx, qword[rbp-16]
	mov rsi, rbx
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _int___sprintf_pchar.char.void.
	mov r10, rax
	mov dword[rbp-96], r10d
	mov ebx, dword[rbp-96]
	mov eax, ebx
__sprintf__return:
	leave
	ret
_void___printf_pchar.void.fd_t:
	push rbp
	mov rbp, rsp
	sub rsp, 48
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	mov [rbp-24], rdx
	mov rdi, 10000
	mov r9d, 0
	mov r8, 0
	mov rcx, 34
	mov rdx, 3
	mov rsi, rdi
	mov rdi, 0
	mov rax, 9
	mov r10, rcx
	syscall
.L0x9:
.L0x5:
	mov r10, rax
	mov qword[rbp-32], r10
	mov rbx, qword[rbp-16]
	mov rdx, rbx
	mov rbx, qword[rbp-8]
	mov rsi, rbx
	mov rbx, qword[rbp-32]
	mov rdi, rbx
	call _int___sprintf_pchar.char.void.
	mov r10, rax
	mov dword[rbp-40], r10d
	mov ebx, dword[rbp-40]
	movsxd r10, ebx
	mov rdx, r10
	mov rbx, qword[rbp-32]
	mov rsi, rbx
	mov rbx, qword[rbp-24]
	mov rdi, rbx
	mov rax, 1
	mov r10, rcx
	syscall
.L0xe:
	mov rsi, 10000
	mov rdi, qword[rbp-32]
	mov rax, 11
	mov r10, rcx
	syscall
.L0x12:
	xor rax, rax
	leave
	ret
printf:
	push rbp
	mov rbp, rsp
	sub rsp, 112
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	mov [rbp-24], rdx
	mov [rbp-32], rcx
	mov [rbp-40], r8
	mov [rbp-48], r9
	lea rbx, [rbp-104] 
	mov r11, qword[rbp-16]
	mov [rbx], r11
	mov r10, 1
	lea rbx, [rbp-104] 
	lea r11, [rbx+r10*8]
	mov r10, qword[rbp-24]
	mov [r11], r10
	mov r10, 2
	lea rbx, [rbp-104] 
	lea r11, [rbx+r10*8]
	mov r10, qword[rbp-32]
	mov [r11], r10
	mov r10, 3
	lea rbx, [rbp-104] 
	lea r11, [rbx+r10*8]
	mov r10, qword[rbp-40]
	mov [r11], r10
	mov r10, 4
	lea rbx, [rbp-104] 
	lea r11, [rbx+r10*8]
	mov r10, qword[rbp-48]
	mov [r11], r10
	mov rdx, 1
	lea rbx, [rbp-104]
	mov rsi, rbx
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _void___printf_pchar.void.fd_t
	xor rax, rax
	leave
	ret
eprintf:
	push rbp
	mov rbp, rsp
	sub rsp, 112
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	mov [rbp-24], rdx
	mov [rbp-32], rcx
	mov [rbp-40], r8
	mov [rbp-48], r9
	lea rbx, [rbp-104] 
	mov r11, qword[rbp-16]
	mov [rbx], r11
	mov r10, 1
	lea rbx, [rbp-104] 
	lea r11, [rbx+r10*8]
	mov r10, qword[rbp-24]
	mov [r11], r10
	mov r10, 2
	lea rbx, [rbp-104] 
	lea r11, [rbx+r10*8]
	mov r10, qword[rbp-32]
	mov [r11], r10
	mov r10, 3
	lea rbx, [rbp-104] 
	lea r11, [rbx+r10*8]
	mov r10, qword[rbp-40]
	mov [r11], r10
	mov r10, 4
	lea rbx, [rbp-104] 
	lea r11, [rbx+r10*8]
	mov r10, qword[rbp-48]
	mov [r11], r10
	mov rdx, 2
	lea rbx, [rbp-104]
	mov rsi, rbx
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _void___printf_pchar.void.fd_t
	xor rax, rax
	leave
	ret
fprintf:
	push rbp
	mov rbp, rsp
	sub rsp, 96
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	mov [rbp-24], rdx
	mov [rbp-32], rcx
	mov [rbp-40], r8
	mov [rbp-48], r9
	lea rbx, [rbp-88] 
	mov r11, qword[rbp-24]
	mov [rbx], r11
	mov r10, 1
	lea rbx, [rbp-88] 
	lea r11, [rbx+r10*8]
	mov r10, qword[rbp-32]
	mov [r11], r10
	mov r10, 2
	lea rbx, [rbp-88] 
	lea r11, [rbx+r10*8]
	mov r10, qword[rbp-40]
	mov [r11], r10
	mov r10, 3
	lea rbx, [rbp-88] 
	lea r11, [rbx+r10*8]
	mov r10, qword[rbp-48]
	mov [r11], r10
	mov rbx, qword[rbp-8]
	mov rdx, rbx
	lea rbx, [rbp-88]
	mov rsi, rbx
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	call _void___printf_pchar.void.fd_t
	xor rax, rax
	leave
	ret
main:
	mov rdx, 5
	mov rsi, __LC.S145
	mov rdi, 1
	mov rax, 1
	mov r10, rcx
	syscall
.L0x3:
	xor eax, eax
__main__return:
	ret
	