global _char._get_errstr_pint:
global _void_native_cpuid_pcpuidreg_t.cpuidreg_t.cpuidreg_t.cpuidreg_t.:
global _bool_cpuid_getfeature_pulong:
global _bool_cpuid_getextended_pulong:
global _bool_all_of_raw_piterablesize_tsize_tvoid.:
global _bool_any_of_raw_piterablesize_tsize_tvoid.:
global _bool_none_of_raw_piterablesize_tsize_tvoid.:
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
global _long_strcpy_pchar.char.:
global _size_t_strlen_pchar.:
global _char._memchr_pchar.charsize_t:
global _int_memcmp_pchar.char.size_t:
global _char._strcat_pchar.char.:
global _char._strncat_pchar.char.size_t:
global _char._strchr_pchar.char:
global _int_strcmp_pchar.char:
global _size_t_strcspn_pchar.char.:
global _char._strerror_plong:
	global sprintf
global _int___sprintf_pchar.char.void.:
	global sprintf
	extern sprintf
	extern sprintf
	extern sprintf
global _FILE_fopen_pchar.char.:
global _size_t_fputs_pFILEchar.:
global _size_t_puts_pchar.:
global _long_fgets_pFILEchar.size_t:
global _void._floads_pFILE:
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
global _long_rand_p:
global _void_srand_p:
global _void_srand_plong:
global _clock_t_clock_p:
global _tm._gmtime_ptime_t:
global _char._asctime_ptm.:
	extern timezone
	extern daylight
	extern tzname
	extern tzset
global _tm._localtime_ptime_t:
global _char._ctime_ptime_t:
global _void_usleep_plong:
global _void_feed_pStackvoid.:
global _void_alloc_pStacksize_t:
global _void_destroy_pStack:
global _void_push_pStackvoid:
global _void_pop_pStack:
global _void_pop_pStackvoid.:
global _void_set_pVec3fdoubledoubledouble:
global _void_add_pVec3fVec3f.:
global _void_sub_pVec3fVec3f.:
global _void_mul_pVec3fVec3f.:
global _void_div_pVec3fVec3f.:
global _void_sqrt_pVec3f:
global _double_dot_pVec3fVec3f.:
global _int___SSCANF_pchar.char.void..:
	global sscanf
	extern sscanf
	extern sscanf
	extern sscanf
	extern sscanf
global _int_getInt_pchar.:
global _uint_getUint_pchar.:
global _char_getchar_p:
global _void_getString_pchar.intchar.:
global _int_toInteger_pchar.bool:
global _int___scanf_pchar.void..fd_t:
	global scanf
	extern scanf
	extern scanf
	extern scanf
	extern scanf
	extern scanf
	global fscanf
	extern fscanf
	extern fscanf
	extern fscanf
	extern fscanf
global _long_system_pchar.:
global _void_mutex_cmpxchg_pmutex.intint:
global _void_mlock_pmutex.:
global _void_munlock_pmutex.:
global _void_thread_create_pthread_t.__threadcallablevoid.:
global _void_thread_join_pthread_t.:
	section .data
	align 8
LC.S0: db `Success`, 0
LC.S1: db `Operation not permitted`, 0
LC.S2: db `No such file or directory`, 0
LC.S3: db `No such process`, 0
LC.S4: db `Interrupted system call`, 0
LC.S5: db `I/O error`, 0
LC.S6: db `No such device or address`, 0
LC.S7: db `Argument list too long`, 0
LC.S8: db `Exec format error`, 0
LC.S9: db `Bad file number`, 0
LC.S10: db `No child processes`, 0
LC.S11: db `Try again`, 0
LC.S12: db `Out of memory`, 0
LC.S13: db `Permission denied`, 0
LC.S14: db `Bad address`, 0
LC.S15: db `Block device required`, 0
LC.S16: db `Device or resource busy`, 0
LC.S17: db `File exists`, 0
LC.S18: db `Cross-device link`, 0
LC.S19: db `No such device`, 0
LC.S20: db `Not a directory`, 0
LC.S21: db `Is a directory`, 0
LC.S22: db `Invalid argument`, 0
LC.S23: db `File table overflow`, 0
LC.S24: db `Too many open files`, 0
LC.S25: db `Not a typewriter`, 0
LC.S26: db `Text file busy`, 0
LC.S27: db `File too large`, 0
LC.S28: db `No space left on device`, 0
LC.S29: db `Illegal seek`, 0
LC.S30: db `Read-only file system`, 0
LC.S31: db `Too many links`, 0
LC.S32: db `Broken pipe`, 0
LC.S33: db `Math argument out of domain of func`, 0
LC.S34: db `Math result not representable`, 0
LC.S35: db `Resource deadlock would occur`, 0
LC.S36: db `File name too long`, 0
LC.S37: db `No record locks available`, 0
LC.S38: db `Function not implemented`, 0
LC.S39: db `Directory not empty`, 0
LC.S40: db `Too many symbolic links encountered`, 0
LC.S41: db `Operation would block`, 0
LC.S42: db `No message of desired type`, 0
LC.S43: db `Identifier removed`, 0
LC.S44: db `Channel number out of range`, 0
LC.S45: db `Level 2 not synchronized`, 0
LC.S46: db `Level 3 halted`, 0
LC.S47: db `Level 3 reset`, 0
LC.S48: db `Link number out of range`, 0
LC.S49: db `Protocol driver not attached`, 0
LC.S50: db `No CSI structure available`, 0
LC.S51: db `Level 2 halted`, 0
LC.S52: db `Invalid exchange`, 0
LC.S53: db `Invalid request descriptor`, 0
LC.S54: db `Exchange full`, 0
LC.S55: db `No anode`, 0
LC.S56: db `Invalid request code`, 0
LC.S57: db `Invalid slot`, 0
LC.S58: db `EDEADLK`, 0
LC.S59: db `Bad font file format`, 0
LC.S60: db `Device not a stream`, 0
LC.S61: db `No data available`, 0
LC.S62: db `Timer expired`, 0
LC.S63: db `Out of streams resources`, 0
LC.S64: db `Machine is not on the network`, 0
LC.S65: db `Package not installed`, 0
LC.S66: db `Object is remote`, 0
LC.S67: db `Link has been severed`, 0
LC.S68: db `Advertise error`, 0
LC.S69: db `Srmount error`, 0
LC.S70: db `Communication error on send`, 0
LC.S71: db `Protocol error`, 0
LC.S72: db `Multihop attempted`, 0
LC.S73: db `RFS specific error`, 0
LC.S74: db `Not a data message`, 0
LC.S75: db `Value too large for defined data type`, 0
LC.S76: db `Name not unique on network`, 0
LC.S77: db `File descriptor in bad state`, 0
LC.S78: db `Remote address changed`, 0
LC.S79: db `Can not access a needed shared library`, 0
LC.S80: db `Accessing a corrupted shared library`, 0
LC.S81: db `.lib section in a.out corrupted`, 0
LC.S82: db `Attempting to link in too many shared libraries`, 0
LC.S83: db `Cannot exec a shared library directly`, 0
LC.S84: db `Illegal byte sequence`, 0
LC.S85: db `Interrupted system call should be restarted`, 0
LC.S86: db `Streams pipe error`, 0
LC.S87: db `Too many users`, 0
LC.S88: db `Socket operation on non-socket`, 0
LC.S89: db `Destination address required`, 0
LC.S90: db `Message too long`, 0
LC.S91: db `Protocol wrong type for socket`, 0
LC.S92: db `Protocol not available`, 0
LC.S93: db `Protocol not supported`, 0
LC.S94: db `Socket type not supported`, 0
LC.S95: db `Operation not supported on transport endpoint`, 0
LC.S96: db `Protocol family not supported`, 0
LC.S97: db `Address family not supported by protocol`, 0
LC.S98: db `Address already in use`, 0
LC.S99: db `Cannot assign requested address`, 0
LC.S100: db `Network is down`, 0
LC.S101: db `Network is unreachable`, 0
LC.S102: db `Network dropped connection because of reset`, 0
LC.S103: db `Software caused connection abort`, 0
LC.S104: db `Connection reset by peer`, 0
LC.S105: db `No buffer space available`, 0
LC.S106: db `Transport endpoint is already connected`, 0
LC.S107: db `Transport endpoint is not connected`, 0
LC.S108: db `Cannot send after transport endpoint shutdown`, 0
LC.S109: db `Too many references: cannot splice`, 0
LC.S110: db `Connection timed out`, 0
LC.S111: db `Connection refused`, 0
LC.S112: db `Host is down`, 0
LC.S113: db `No route to host`, 0
LC.S114: db `Operation already in progress`, 0
LC.S115: db `Operation now in progress`, 0
LC.S116: db `Stale NFS file handle`, 0
LC.S117: db `Structure needs cleaning`, 0
LC.S118: db `Not a XENIX named type file`, 0
LC.S119: db `No XENIX semaphores available`, 0
LC.S120: db `Is a named type file`, 0
LC.S121: db `Remote I/O error`, 0
LC.S122: db `Quota exceeded`, 0
LC.S123: db `No medium found`, 0
LC.S124: db `Wrong medium type`, 0
LC.S125: db `Operation Canceled`, 0
LC.S126: db `Required key not available`, 0
LC.S127: db `Key has expired`, 0
LC.S128: db `Key has been revoked`, 0
LC.S129: db `Key was rejected by service`, 0
LC.S130: db `Owner died`, 0
LC.S131: db `State not recoverable`, 0
LC.S132: db `Unkown Error Code.`, 0
LC.F0: dq 0x0.0p+0
LC.F1: dq 0x1.0000000000000p-1
LC.F2: dq 0x1.921fb54442d18p+1
LC.F3: dq 0x1.921fb54442d18p+0
LC.F4: dq 0x1.0000000000000p+0
LC.F5: dq 0x1.0000000000000p+0
LC.F6: dq 0x1.0000000000000p+0
LC.F7: dq 0x1.0000000000000p-1
LC.F8: dq 0x1.8000000000000p+1
LC.F9: dq 0x1.8000000000000p-2
LC.F10: dq 0x1.4000000000000p+2
LC.F11: dq 0x1.4000000000000p-2
LC.F12: dq 0x1.c000000000000p+2
LC.F13: dq 0x1.1800000000000p-2
LC.F14: dq 0x1.2000000000000p+3
LC.F15: dq 0x1.921fb54442d18p-1
LC.F16: dq 0x1.8000000000000p+1
LC.F17: dq 0x1.4000000000000p+2
LC.F18: dq 0x1.c000000000000p+2
LC.F19: dq 0x1.2000000000000p+3
LC.F20: dq 0x1.0000000000000p+0
LC.F21: dq 0x1.8000000000000p+1
LC.F22: dq 0x1.0000000000000p+0
LC.F23: dq 0x1.4000000000000p+2
LC.F24: dq 0x1.0000000000000p+0
LC.F25: dq 0x1.8000000000000p+1
LC.F26: dq 0x1.0000000000000p+0
LC.F27: dq 0x1.4000000000000p+2
LC.S133: db `0123456789abcdef`, 0
LC.S134: db `QNaN`, 0
LC.S135: db `SNaN`, 0
LC.S136: db `NaN`, 0
LC.S137: db `Inf`, 0
LC.S138: db `-Inf`, 0
LC.S139: db `False`, 0
LC.S140: db `True`, 0
LC.S141: db `%s:%i: Assertion '%s' failed.\n`, 0
LC.S142: db `=======================\n`, 0
LC.S143: db `EMPTY\n`, 0
LC.S144: db `BLOCK: %i @ %x : %i\n`, 0
LC.S145: db `Appends: %i, Deletions %i, Cache: %u\n`, 0
LC.S146: db `=======================\n`, 0
LC.S147: db `Sun`, 0
LC.S148: db `Mon`, 0
LC.S149: db `Tue`, 0
LC.S150: db `Wed`, 0
LC.S151: db `Thu`, 0
LC.S152: db `Fri`, 0
LC.S153: db `Sat`, 0
LC.S154: db `Jan`, 0
LC.S155: db `Feb`, 0
LC.S156: db `Mar`, 0
LC.S157: db `Apr`, 0
LC.S158: db `May`, 0
LC.S159: db `Jun`, 0
LC.S160: db `Jul`, 0
LC.S161: db `Aug`, 0
LC.S162: db `Sep`, 0
LC.S163: db `Oct`, 0
LC.S164: db `Nov`, 0
LC.S165: db `Dec`, 0
LC.F28: dq 0x1.6d40000000000p+8
LC.F29: dq 0x1.6d40000000000p+8
LC.S166: db `%i `, 0
LC.S167: db `%i:%i:%i %i`, 0
LC.S168: db `/bin/bash`, 0
LC.S169: db `PATH=/bin:/usr/bin:/sbin:/usr/sbin`, 0
LC.S170: db `sudo`, 0
LC.S171: db `-c`, 0
LC.S172: db `LOCKED`, 0
LC.S173: db `cvtsi2sd xmm0 , argc`, 0
LC.S174: db `%f\n`, 0
__linux_errstrlist: DQ LC.S0, LC.S1, LC.S2, LC.S3, LC.S4, LC.S5, LC.S6, LC.S7, LC.S8, LC.S9, LC.S10, LC.S11, LC.S12, LC.S13, LC.S14, LC.S15, LC.S16, LC.S17, LC.S18, LC.S19, LC.S20, LC.S21, LC.S22, LC.S23, LC.S24, LC.S25, LC.S26, LC.S27, LC.S28, LC.S29, LC.S30, LC.S31, LC.S32, LC.S33, LC.S34, LC.S35, LC.S36, LC.S37, LC.S38, LC.S39, LC.S40, LC.S41, LC.S42, LC.S43, LC.S44, LC.S45, LC.S46, LC.S47, LC.S48, LC.S49, LC.S50, LC.S51, LC.S52, LC.S53, LC.S54, LC.S55, LC.S56, LC.S57, LC.S58, LC.S59, LC.S60, LC.S61, LC.S62, LC.S63, LC.S64, LC.S65, LC.S66, LC.S67, LC.S68, LC.S69, LC.S70, LC.S71, LC.S72, LC.S73, LC.S74, LC.S75, LC.S76, LC.S77, LC.S78, LC.S79, LC.S80, LC.S81, LC.S82, LC.S83, LC.S84, LC.S85, LC.S86, LC.S87, LC.S88, LC.S89, LC.S90, LC.S91, LC.S92, LC.S93, LC.S94, LC.S95, LC.S96, LC.S97, LC.S98, LC.S99, LC.S100, LC.S101, LC.S102, LC.S103, LC.S104, LC.S105, LC.S106, LC.S107, LC.S108, LC.S109, LC.S110, LC.S111, LC.S112, LC.S113, LC.S114, LC.S115, LC.S116, LC.S117, LC.S118, LC.S119, LC.S120, LC.S121, LC.S122, LC.S123, LC.S124, LC.S125, LC.S126, LC.S127, LC.S128, LC.S129, LC.S130, LC.S131
M_MINZERO_MEM: DQ 0x0.0p+0
__numbercharactersbase1016: DQ "0123456789abcdef"
malloc_maxcache: DQ 524288
free_head: DQ 0
cached_size: DQ 0
appends: DQ 0
deletions: DQ 0
rand_next: DQ 1
mdays: DD 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31
wday_name: DQ LC.S147, LC.S148, LC.S149, LC.S150, LC.S151, LC.S152, LC.S153
mon_name: DQ LC.S154, LC.S155, LC.S156, LC.S157, LC.S158, LC.S159, LC.S160, LC.S161, LC.S162, LC.S163, LC.S164, LC.S165
asctime__result_buf: DB 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 0
__systembashpath: DQ "/bin/bash"
__emptyenv: DQ LC.S169, 0, 0
__systemcallargvconst: DQ LC.S170, LC.S171, 0, 0
clone_threadflags: DQ 4001553
	section .bss
	align 16
__tmbuf: resb 36
__internaltime: resb 8
	section .text
	align 8
	global main
_char._get_errstr_pint:
	cmp edi, 131
	setl dil
	cmp edi, 0
	setge dil
	and dil, dil
	jz .L0x2c5
	mov rbx, __linux_errstrlist
	mov rbx, [rbx+rdi*8]
	mov rax, rbx
	jmp ___char._get_errstr_pint__return
.L0x2c5:
.L0x2c6:
	mov rax, LC.S132
___char._get_errstr_pint__return:
	ret
_void_native_cpuid_pcpuidreg_t.cpuidreg_t.cpuidreg_t.cpuidreg_t.:
	mov eax, [rdi]  
	mov ebx, [rsi]  
	mov r11, rdx  
	mov r10, rcx  
	mov ecx, [r11]  
	mov edx, [r10]  
	cpuid
	mov [rdi], eax  
	mov [rsi], ebx  
	mov [r11], ecx  
	mov [r10], edx  
	ret
_bool_cpuid_getfeature_pulong:
	push rbp
	mov rbp, rsp
	sub rsp, 64
	mov [rbp-8], rdi
	mov qword[rbp-16], 1
	mov qword[rbp-24], 0
	mov qword[rbp-32], 0
	mov qword[rbp-40], 0
	lea rbx, [rbp-40]
	mov rcx, rbx
	lea rbx, [rbp-32]
	mov rdx, rbx
	lea rbx, [rbp-24]
	mov rsi, rbx
	lea rbx, [rbp-16]
	mov rdi, rbx
	call _void_native_cpuid_pcpuidreg_t.cpuidreg_t.cpuidreg_t.cpuidreg_t.
	mov rbx, qword[rbp-32]
	shl rbx, 32
	add rbx, qword[rbp-40]
	mov qword[rbp-48], rbx
	mov r10, 1
	mov rbx, qword[rbp-8]
	mov rax, rcx
	mov cl, bl
	shl r10, cl
	mov rcx, rax
	mov qword[rbp-56], r10
	mov r10, qword[rbp-56]
	mov rbx, qword[rbp-48]
	and rbx, r10
	mov r10, qword[rbp-8]
	mov rax, rcx
	mov cl, r10b
	shr rbx, cl
	mov rcx, rax
	mov al, bl
___bool_cpuid_getfeature_pulong__return:
	leave
	ret
_bool_cpuid_getextended_pulong:
	push rbp
	mov rbp, rsp
	sub rsp, 56
	mov [rbp-8], rdi
	mov qword[rbp-16], 7
	mov qword[rbp-24], 0
	mov qword[rbp-32], 0
	mov qword[rbp-40], 0
	mov r10, 3
	mov rbx, qword[rbp-8]
	and rbx, r10
	mov qword[rbp-48], rbx
	shr qword[rbp-8], 2
	lea rbx, [rbp-40]
	mov rcx, rbx
	lea rbx, [rbp-32]
	mov rdx, rbx
	lea rbx, [rbp-24]
	mov rsi, rbx
	lea rbx, [rbp-16]
	mov rdi, rbx
	call _void_native_cpuid_pcpuidreg_t.cpuidreg_t.cpuidreg_t.cpuidreg_t.
	lea rbx, [rbp-24]
	mov r10, qword[rbp-48]
	mov rbx, [rbx+r10*8]
	mov qword[rbp-48], rbx
	mov r10, 1
	mov rbx, qword[rbp-8]
	mov rax, rcx
	mov cl, bl
	shl r10, cl
	mov rcx, rax
	mov rbx, qword[rbp-48]
	and rbx, r10
	mov r10, qword[rbp-8]
	mov rax, rcx
	mov cl, r10b
	shr rbx, cl
	mov rcx, rax
	mov al, bl
___bool_cpuid_getextended_pulong__return:
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
	lea rbx, [r11+r10]
	mov r11, qword[rbp-8]
	mov qword[rbp-40], r11
	jmp .L0x2b8
.L0x2b7:
	push rbx
	mov rbx, qword[rbp-40]
	mov r10, qword[rbx]
	mov rdi, r10
	push rbx
	call qword[rbp-32]
	mov rbx, rax
	pop rbx
	cmp rax, 0
	jne .L0x2bb
	xor rax, rax
	jmp ___bool_all_of_raw_piterablesize_tsize_tvoid.__return
.L0x2bb:
.L0x2bc:
.L0x2b9:
	mov r10, qword[rbp-16]
	add qword[rbp-40], r10
.L0x2b8:
	cmp qword[rbp-40], rbx
	jl .L0x2b7
.L0x2ba:
	mov rax, 1
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
	lea rbx, [r11+r10]
	mov r11, qword[rbp-8]
	mov qword[rbp-40], r11
	jmp .L0x2b2
.L0x2b1:
	push rbx
	mov rbx, qword[rbp-40]
	mov r10, qword[rbx]
	mov rdi, r10
	push rbx
	call qword[rbp-32]
	mov rbx, rax
	pop rbx
	test rbx, rbx
	jz .L0x2b5
	mov rax, 1
	jmp ___bool_any_of_raw_piterablesize_tsize_tvoid.__return
.L0x2b5:
.L0x2b6:
.L0x2b3:
	mov r10, qword[rbp-16]
	add qword[rbp-40], r10
.L0x2b2:
	cmp qword[rbp-40], rbx
	jl .L0x2b1
.L0x2b4:
	xor rax, rax
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
	lea rbx, [r11+r10]
	mov r11, qword[rbp-8]
	mov qword[rbp-40], r11
	jmp .L0x2ac
.L0x2ab:
	push rbx
	mov rbx, qword[rbp-40]
	mov r10, qword[rbx]
	mov rdi, r10
	push rbx
	call qword[rbp-32]
	mov rbx, rax
	pop rbx
	test rbx, rbx
	jz .L0x2af
	xor rax, rax
	jmp ___bool_none_of_raw_piterablesize_tsize_tvoid.__return
.L0x2af:
.L0x2b0:
.L0x2ad:
	mov r10, qword[rbp-16]
	add qword[rbp-40], r10
.L0x2ac:
	cmp qword[rbp-40], rbx
	jl .L0x2ab
.L0x2ae:
	mov rax, 1
___bool_none_of_raw_piterablesize_tsize_tvoid.__return:
	leave
	ret
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
	movq rax, xmm0
	push rax
	movsd xmm7, qword[LC.F1]
	subsd xmm0, xmm7
	roundsd xmm0, xmm0, 0  
	cvttsd2si rax, xmm0
.L0x2a4:
	mov rbx, rax
	pop rax
	movq xmm0, rax
___long_floor_pdouble__return:
	ret
_long_abs_plong:
	mov rax, rdi
	sar rdi, 63
	xor rax, rdi
	sub rax, rdi
	ret
_long_ceil_pdouble:
	movq rax, xmm0
	push rax
	xor rbx, rbx
	cvtsi2sd xmm7, rbx
	subsd xmm7, xmm0
	movsd xmm0, xmm7
	call _long_floor_pdouble
	mov rbx, rax
	pop rax
	movq xmm0, rax
	mov rax, rbx
	push rax
	xor r10, r10
	pop rbx
	sub r10, rbx
	mov rax, r10
___long_ceil_pdouble__return:
	ret
_double_abs_pdouble:
	movq rax, xmm0
	shl rax, 1
	shr rax, 1
	movq xmm0, rax 
	ret
_long_log_plong:
	push rdi
	call _long_log2_plong
	mov rbx, rax
	pop rdi
	mov rax, rbx
	push rax
	mov r10, 3
	pop rbx
	xor rdx, rdx
	mov rax, rbx
	idiv r10
___long_log_plong__return:
	ret
_long_log_plonglong:
	push rdi
	push rsi
	mov rdi, rsi
	call _long_log2_plong
	mov rbx, rax
	pop rsi
	pop rdi
	mov rax, rbx
	push rax
	push rdi
	push rsi
	call _long_log2_plong
	mov rbx, rax
	pop rsi
	pop rdi
	mov r10, rbx
	pop rbx
	xor rdx, rdx
	mov rax, rbx
	idiv r10
___long_log_plonglong__return:
	ret
_long_log2_plong:
	xor rax, rax
.L0x295_long_lop2_plong_flp:
	sar rdi, 1
	inc rax
	test rdi, rdi
	jnz .L0x295_long_lop2_plong_flp
	dec rax
	ret
_double_fmod_pdoubledouble:
	movq rax, xmm0
	push rax
	movq rax, xmm1
	push rax
	divsd xmm0, xmm1
	call _long_floor_pdouble
	mov rbx, rax
	pop rax
	movq xmm1, rax
	pop rax
	movq xmm0, rax
	mov rax, rbx
	push rax
	xor rbx, rbx
	cvtsi2sd xmm7, rbx
	subsd xmm7, xmm1
	pop rbx
	cvtsi2sd xmm8, rbx
	mulsd xmm7, xmm8
	addsd xmm7, xmm0
	movsd xmm0, xmm7
___double_fmod_pdoubledouble__return:
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
	mulsd xmm0, xmm0
	mulsd xmm0, xmm0
	mov rbx, 6
	cvtsi2sd xmm7, rbx
	divsd xmm0, xmm7
	subsd xmm0, xmm0
	mulsd xmm0, xmm0
	mulsd xmm0, xmm0
	mulsd xmm0, xmm0
	mulsd xmm0, xmm0
	mov rbx, 120
	cvtsi2sd xmm7, rbx
	divsd xmm0, xmm7
	addsd xmm0, xmm0
	mulsd xmm0, xmm0
	mulsd xmm0, xmm0
	mulsd xmm0, xmm0
	mulsd xmm0, xmm0
	mulsd xmm0, xmm0
	mulsd xmm0, xmm0
	mov rbx, 5040
	cvtsi2sd xmm7, rbx
	divsd xmm0, xmm7
	subsd xmm0, xmm0
	mulsd xmm0, xmm0
	mulsd xmm0, xmm0
	mulsd xmm0, xmm0
	mulsd xmm0, xmm0
	mulsd xmm0, xmm0
	mulsd xmm0, xmm0
	mulsd xmm0, xmm0
	mulsd xmm0, xmm0
	mov rbx, 362880
	cvtsi2sd xmm7, rbx
	divsd xmm0, xmm7
	addsd xmm0, xmm0
___double_taylor_sin_pdouble__return:
	ret
_double_sin_pdouble:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	movsd [rbp-8], xmm0
	xor rbx, rbx
	movsd xmm7, qword[rbp-8]
	cvtsi2sd xmm8, rbx
	comisd xmm7, xmm8
	je .L0x28e
	mov rbx, 2
	movsd xmm7, qword[LC.F2]
	cvtsi2sd xmm8, rbx
	mulsd xmm8, xmm7
	movsd xmm1, xmm8
	movsd xmm7, qword[rbp-8]
	movsd xmm0, xmm7
	call _double_fmod_pdoubledouble
	movsd xmm8, xmm0
	movsd xmm7, qword[LC.F2]
	subsd xmm7, xmm8
	movsd xmm0, xmm7
	call _double_taylor_sin_pdouble
	movsd xmm0, xmm0
	jmp ___double_sin_pdouble__return
.L0x28e:
.L0x28f:
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
	xor rbx, rbx
	movsd xmm7, qword[rbp-8]
	cvtsi2sd xmm8, rbx
	comisd xmm7, xmm8
	je .L0x28c
	movsd xmm8, qword[LC.F3]
	movsd xmm7, qword[rbp-8]
	addsd xmm7, xmm8
	movsd xmm0, xmm7
	call _double_sin_pdouble
	movsd xmm0, xmm0
	jmp ___double_cos_pdouble__return
.L0x28c:
.L0x28d:
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
	xor rbx, rbx
	movsd xmm7, qword[rbp-8]
	cvtsi2sd xmm8, rbx
	comisd xmm7, xmm8
	je .L0x28a
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
.L0x28a:
.L0x28b:
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
	xor rbx, rbx
	movsd xmm7, qword[rbp-8]
	cvtsi2sd xmm8, rbx
	comisd xmm7, xmm8
	je .L0x288
	movsd xmm7, qword[rbp-8]
	movsd xmm0, xmm7
	call _double_tan_pdouble
	movsd xmm8, xmm0
	movsd xmm7, qword[LC.F4]
	divsd xmm7, xmm8
	movsd xmm0, xmm7
	jmp ___double_cot_pdouble__return
.L0x288:
.L0x289:
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
	xor rbx, rbx
	movsd xmm7, qword[rbp-8]
	cvtsi2sd xmm8, rbx
	comisd xmm7, xmm8
	je .L0x286
	movsd xmm7, qword[rbp-8]
	movsd xmm0, xmm7
	call _double_cos_pdouble
	movsd xmm8, xmm0
	movsd xmm7, qword[LC.F5]
	divsd xmm7, xmm8
	movsd xmm0, xmm7
	jmp ___double_sec_pdouble__return
.L0x286:
.L0x287:
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
	xor rbx, rbx
	movsd xmm7, qword[rbp-8]
	cvtsi2sd xmm8, rbx
	comisd xmm7, xmm8
	je .L0x284
	movsd xmm7, qword[rbp-8]
	movsd xmm0, xmm7
	call _double_sin_pdouble
	movsd xmm8, xmm0
	movsd xmm7, qword[LC.F6]
	divsd xmm7, xmm8
	movsd xmm0, xmm7
	jmp ___double_csc_pdouble__return
.L0x284:
.L0x285:
	mov rax, 9221120237041090561
	movq xmm0, rax
___double_csc_pdouble__return:
	leave
	ret
_double_taylor_asin_pdouble:
	mulsd xmm0, xmm0
	mulsd xmm0, xmm0
	movsd xmm7, qword[LC.F8]
	divsd xmm0, xmm7
	movsd xmm7, qword[LC.F7]
	mulsd xmm7, xmm0
	addsd xmm0, xmm7
	mulsd xmm0, xmm0
	mulsd xmm0, xmm0
	mulsd xmm0, xmm0
	mulsd xmm0, xmm0
	movsd xmm7, qword[LC.F10]
	divsd xmm0, xmm7
	movsd xmm7, qword[LC.F9]
	mulsd xmm7, xmm0
	addsd xmm0, xmm7
	mulsd xmm0, xmm0
	mulsd xmm0, xmm0
	mulsd xmm0, xmm0
	mulsd xmm0, xmm0
	mulsd xmm0, xmm0
	mulsd xmm0, xmm0
	movsd xmm7, qword[LC.F12]
	divsd xmm0, xmm7
	movsd xmm7, qword[LC.F11]
	mulsd xmm7, xmm0
	addsd xmm0, xmm7
	mulsd xmm0, xmm0
	mulsd xmm0, xmm0
	mulsd xmm0, xmm0
	mulsd xmm0, xmm0
	mulsd xmm0, xmm0
	mulsd xmm0, xmm0
	mulsd xmm0, xmm0
	mulsd xmm0, xmm0
	movsd xmm7, qword[LC.F14]
	divsd xmm0, xmm7
	movsd xmm7, qword[LC.F13]
	mulsd xmm7, xmm0
	addsd xmm0, xmm7
___double_taylor_asin_pdouble__return:
	ret
_double_asin_pdouble:
	mov rbx, -1
	cvtsi2sd xmm7, rbx
	comisd xmm0, xmm7
	setl r10b
	mov rbx, 1
	cvtsi2sd xmm7, rbx
	comisd xmm0, xmm7
	setg r11b
	or r10b, r11b
	jz .L0x282
	mov rax, 9221120237041090561
	movq xmm0, rax
	jmp ___double_asin_pdouble__return
.L0x282:
.L0x283:
	movq rax, xmm0
	push rax
	movsd xmm0, xmm0
	call _double_taylor_asin_pdouble
	movq rbx, xmm0
	pop rax
	movq xmm0, rax
	mov rax, rbx
	movq xmm7, rax
	movsd xmm0, xmm7
___double_asin_pdouble__return:
	ret
_double_acos_pdouble:
	mov rbx, -1
	cvtsi2sd xmm7, rbx
	comisd xmm0, xmm7
	setl r10b
	mov rbx, 1
	cvtsi2sd xmm7, rbx
	comisd xmm0, xmm7
	setg r11b
	or r10b, r11b
	jz .L0x27e
	mov rax, 9221120237041090561
	movq xmm0, rax
	jmp ___double_acos_pdouble__return
.L0x27e:
.L0x27f:
	movq rax, xmm0
	push rax
	movsd xmm0, xmm0
	call _double_taylor_asin_pdouble
	movq rbx, xmm0
	pop rax
	movq xmm0, rax
	mov rax, rbx
	movq xmm8, rax
	movsd xmm7, qword[LC.F3]
	subsd xmm7, xmm8
	movsd xmm0, xmm7
___double_acos_pdouble__return:
	ret
_double_atan_pdouble:
	mov rbx, -1
	cvtsi2sd xmm7, rbx
	comisd xmm0, xmm7
	jne .L0x270
	xor rbx, rbx
	movsd xmm7, qword[LC.F15]
	cvtsi2sd xmm8, rbx
	subsd xmm8, xmm7
	movsd xmm0, xmm8
	jmp ___double_atan_pdouble__return
.L0x270:
	mov rbx, 1
	cvtsi2sd xmm7, rbx
	comisd xmm0, xmm7
	jne .L0x272
	movsd xmm7, qword[LC.F15]
	movsd xmm0, xmm7
	jmp ___double_atan_pdouble__return
.L0x272:
	xor rbx, rbx
	cvtsi2sd xmm7, rbx
	comisd xmm0, xmm7
	jne .L0x274
	xor rax, rax
	cvtsi2sd xmm0, rax
	jmp ___double_atan_pdouble__return
.L0x274:
	mov rbx, 1
	cvtsi2sd xmm7, rbx
	comisd xmm0, xmm7
	setle r10b
	mov rbx, -1
	cvtsi2sd xmm7, rbx
	comisd xmm0, xmm7
	setge r11b
	and r10b, r11b
	jz .L0x276
	mulsd xmm0, xmm0
	mulsd xmm0, xmm0
	movsd xmm7, qword[LC.F16]
	divsd xmm0, xmm7
	subsd xmm0, xmm0
	mulsd xmm0, xmm0
	mulsd xmm0, xmm0
	mulsd xmm0, xmm0
	mulsd xmm0, xmm0
	movsd xmm7, qword[LC.F17]
	divsd xmm0, xmm7
	addsd xmm0, xmm0
	mulsd xmm0, xmm0
	mulsd xmm0, xmm0
	mulsd xmm0, xmm0
	mulsd xmm0, xmm0
	mulsd xmm0, xmm0
	mulsd xmm0, xmm0
	movsd xmm7, qword[LC.F18]
	divsd xmm0, xmm7
	subsd xmm0, xmm0
	mulsd xmm0, xmm0
	mulsd xmm0, xmm0
	mulsd xmm0, xmm0
	mulsd xmm0, xmm0
	mulsd xmm0, xmm0
	mulsd xmm0, xmm0
	mulsd xmm0, xmm0
	mulsd xmm0, xmm0
	movsd xmm7, qword[LC.F19]
	divsd xmm0, xmm7
	addsd xmm0, xmm0
	jmp ___double_atan_pdouble__return
.L0x276:
	mov rbx, -1
	cvtsi2sd xmm7, rbx
	comisd xmm0, xmm7
	jge .L0x278
	xor rbx, rbx
	movsd xmm7, qword[LC.F3]
	cvtsi2sd xmm8, rbx
	subsd xmm8, xmm7
	mov rbx, 1
	cvtsi2sd xmm7, rbx
	divsd xmm7, xmm0
	subsd xmm8, xmm7
	mulsd xmm0, xmm0
	mulsd xmm0, xmm0
	movsd xmm7, qword[LC.F21]
	mulsd xmm7, xmm0
	movsd xmm9, qword[LC.F20]
	divsd xmm9, xmm7
	addsd xmm8, xmm9
	mulsd xmm0, xmm0
	mulsd xmm0, xmm0
	mulsd xmm0, xmm0
	mulsd xmm0, xmm0
	movsd xmm7, qword[LC.F23]
	mulsd xmm7, xmm0
	movsd xmm9, qword[LC.F22]
	divsd xmm9, xmm7
	subsd xmm8, xmm9
	movsd xmm0, xmm8
	jmp ___double_atan_pdouble__return
.L0x278:
	mov rbx, 1
	cvtsi2sd xmm7, rbx
	comisd xmm0, xmm7
	jle .L0x27a
	mov rbx, 1
	cvtsi2sd xmm7, rbx
	divsd xmm7, xmm0
	movsd xmm8, qword[LC.F3]
	subsd xmm8, xmm7
	mulsd xmm0, xmm0
	mulsd xmm0, xmm0
	movsd xmm7, qword[LC.F25]
	mulsd xmm7, xmm0
	movsd xmm9, qword[LC.F24]
	divsd xmm9, xmm7
	addsd xmm8, xmm9
	mulsd xmm0, xmm0
	mulsd xmm0, xmm0
	mulsd xmm0, xmm0
	mulsd xmm0, xmm0
	movsd xmm7, qword[LC.F27]
	mulsd xmm7, xmm0
	movsd xmm9, qword[LC.F26]
	divsd xmm9, xmm7
	subsd xmm8, xmm9
	movsd xmm0, xmm8
	jmp ___double_atan_pdouble__return
.L0x27a:
.L0x27b:
.L0x279:
.L0x277:
.L0x275:
.L0x273:
.L0x271:
	mov rax, 9221120237041090561
	movq xmm0, rax
___double_atan_pdouble__return:
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
	lea rbx, [rdi+rdx]
	jmp .L0x25c
.L0x25b:
	mov dil, byte[rdi]
	and rdi, 0xff
	cmp dil, sil
	jne .L0x25e
	mov rax, rdi
	jmp ___char._memchr_pchar.charsize_t__return
.L0x25e:
.L0x25f:
	inc rdi
.L0x25c:
	cmp rdi, rbx
	jl .L0x25b
.L0x25d:
	xor rax, rax
___char._memchr_pchar.charsize_t__return:
	ret
_int_memcmp_pchar.char.size_t:
	xor ebx, ebx
	lea r10, [rdi+rdx]
	jmp .L0x252
.L0x251:
	mov dil, byte[rdi]
	and rdi, 0xff
	mov sil, byte[rsi]
	and rsi, 0xff
	cmp dil, sil
	jge .L0x254
	dec ebx
	jmp .L0x255
.L0x254:
	inc ebx
.L0x255:
	inc rdi
	inc rsi
.L0x252:
	cmp rdi, r10
	jl .L0x251
.L0x253:
	mov eax, ebx
___int_memcmp_pchar.char.size_t__return:
	ret
_char._strchr_pchar.char:
	jmp .L0x248
.L0x247:
	mov dil, byte[rdi]
	and rdi, 0xff
	cmp dil, sil
	jne .L0x24a
	mov rax, rdi
	jmp ___char._strchr_pchar.char__return
.L0x24a:
.L0x24b:
	inc rdi
.L0x248:
	mov dil, byte[rdi]
	and rdi, 0xff
	test dil, dil
	jnz .L0x247
.L0x249:
	xor rax, rax
___char._strchr_pchar.char__return:
	ret
_char._strerror_plong:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov [rbp-8], rdi
	cmp qword[rbp-8], 0
	jl .L0x240
	mov rdi, qword[rbp-8]
	call _char._get_errstr_pint
	jmp ___char._strerror_plong__return
.L0x240:
	xor r10, r10
	sub r10, qword[rbp-8]
	mov edi, r10d
	call _char._get_errstr_pint
	jmp ___char._strerror_plong__return
.L0x241:
	xor rax, rax
___char._strerror_plong__return:
	leave
	ret
_long_divmod10_plonglong.:
	mov rbx, 10
	xor rdx, rdx
	mov rax, rdi
	idiv rbx
	mov rdi, rdx
	mov [rsi], rdi
	mov rbx, 10
	xor rdx, rdx
	mov rax, rdi
	idiv rbx
___long_divmod10_plonglong.__return:
	ret
_long_toStr_plongchar.boollong:
	push rbp
	mov rbp, rsp
	sub rsp, 128
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	mov [rbp-24], rdx
	mov [rbp-32], rcx
	mov rbx, qword[rbp-8]
	test rbx, rbx
	jnz .L0x235
	mov rbx, qword[rbp-16]
	mov byte[rbx], 48
	mov rax, 1
	jmp ___long_toStr_plongchar.boollong__return
.L0x235:
.L0x236:
	mov byte[rbp-40], 0
	cmp qword[rbp-8], 0
	setl bl
	and bl, byte[rbp-24]
	jz .L0x237
	mov rbx, qword[rbp-16]
	mov byte[rbx], 45
	inc qword[rbp-16]
	xor r10, r10
	sub r10, qword[rbp-8]
	mov qword[rbp-8], r10
	mov byte[rbp-40], 1
	jmp .L0x238
.L0x237:
.L0x238:
	mov rdx, 64
	mov rsi, 0
	lea rbx, [rbp-112]
	mov rdi, rbx
	call _void_memset_pvoid.ucharsize_t
	mov qword[rbp-120], 0
	jmp .L0x23a
.L0x239:
	lea rbx, [rbp-128]
	mov rdx, rbx
	mov rbx, qword[rbp-32]
	mov rsi, rbx
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _long_divmod_plonglonglong.
	mov r10, rax
	mov qword[rbp-8], r10
	mov r10, qword[rbp-120]
	lea rbx, [rbp-112] 
	lea rbx, [rbx+r10*1]
	mov r11, qword[rbp-128]
	mov r10, __numbercharactersbase1016
	mov r10b, [r10+r11*1]
	and r10, 0xff
	mov [rbx], r10b
	inc qword[rbp-120]
.L0x23a:
	mov rbx, qword[rbp-8]
	test rbx, rbx
	jnz .L0x239
.L0x23b:
	mov rbx, qword[rbp-120]
	mov dword[rbp-128], ebx
	jmp .L0x23d
.L0x23c:
	mov r10d, dword[rbp-128]
	mov rbx, qword[rbp-16]
	and r10, 0x7fffffff
	lea rbx, [rbx+r10*1]
	mov r11d, dword[rbp-128]
	mov r10, qword[rbp-120]
	mov r12d, r11d
	sub r10, r12
	lea r11, [rbp-112] 
	mov r11b, [r11+r10*1]
	and r11, 0xff
	mov [rbx], r11b
.L0x23e:
	dec dword[rbp-128]
.L0x23d:
	cmp dword[rbp-128], 0
	jg .L0x23c
.L0x23f:
	mov r10b, byte[rbp-40]
	mov rbx, qword[rbp-120]
	mov r11b, r10b
	add rbx, r11
	inc rbx
	mov rax, rbx
___long_toStr_plongchar.boollong__return:
	leave
	ret
_size_t_toBinary_pchar.ulonglong:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	add rdi, rdx
	mov dword[rbp-8], 0
	jmp .L0x230
.L0x22f:
	and rsi, 1
	cmp rsi, 1
	jne .L0x233
	mov byte[rdi], 49
	jmp .L0x234
.L0x233:
	mov byte[rdi], 48
.L0x234:
	shr rsi, 1
	dec rdi
.L0x231:
	inc dword[rbp-8]
.L0x230:
	mov ebx, dword[rbp-8]
	mov r10d, ebx
	cmp r10, rdx
	jl .L0x22f
.L0x232:
	mov rax, rdx
___size_t_toBinary_pchar.ulonglong__return:
	leave
	ret
_long_toStr_pdoublechar.long:
	push rbp
	mov rbp, rsp
	sub rsp, 56
	movsd [rbp-8], xmm0
	mov [rbp-16], rdi
	mov [rbp-24], rsi
	movsd xmm7, qword[rbp-8]
	movq rbx, xmm7
	mov r10, 9221120237041090561
	cmp rbx, r10
	jne .L0x1e9
	mov rsi, LC.S134
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	call _long_strcpy_pchar.char.
	mov rax, 4
	jmp ___long_toStr_pdoublechar.long__return
.L0x1e9:
	movsd xmm7, qword[rbp-8]
	movq rbx, xmm7
	mov r10, 9218868437227405313
	cmp rbx, r10
	jne .L0x1eb
	mov rsi, LC.S135
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	call _long_strcpy_pchar.char.
	mov rax, 4
	jmp ___long_toStr_pdoublechar.long__return
.L0x1eb:
	movsd xmm7, qword[rbp-8]
	movq rbx, xmm7
	mov r10, 9223372036854775807
	cmp rbx, r10
	jne .L0x1ed
	mov rsi, LC.S136
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	call _long_strcpy_pchar.char.
	mov rax, 3
	jmp ___long_toStr_pdoublechar.long__return
.L0x1ed:
	mov rbx, 9218868437227405312
	movsd xmm7, qword[rbp-8]
	movq xmm8, rbx
	comisd xmm7, xmm8
	jne .L0x1ef
	mov rsi, LC.S137
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	call _long_strcpy_pchar.char.
	mov rax, 3
	jmp ___long_toStr_pdoublechar.long__return
.L0x1ef:
	mov rbx, 18442240474082181120
	movsd xmm7, qword[rbp-8]
	movq xmm8, rbx
	comisd xmm7, xmm8
	jne .L0x1f1
	mov rsi, LC.S138
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	call _long_strcpy_pchar.char.
	mov rax, 4
	jmp ___long_toStr_pdoublechar.long__return
.L0x1f1:
.L0x1f2:
.L0x1f0:
.L0x1ee:
.L0x1ec:
.L0x1ea:
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
	jz .L0x1f3
	mov rbx, qword[rbp-16]
	mov byte[rbx], 45
	inc qword[rbp-16]
	inc qword[rbp-40]
	jmp .L0x1f4
.L0x1f3:
.L0x1f4:
	mov rcx, 10
	mov rdx, 1
	mov rbx, qword[rbp-16]
	mov rsi, rbx
	mov rbx, qword[rbp-32]
	mov rdi, rbx
	call _long_toStr_plongchar.boollong
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
	mov rcx, 10
	mov rdx, 1
	mov rbx, qword[rbp-16]
	mov rsi, rbx
	movsd xmm7, qword[rbp-8]
	movsd xmm0, xmm7
	roundsd xmm0, xmm0, 0  
	cvttsd2si rax, xmm0
.L0x20b:
	mov rdi, rax
	call _long_abs_plong
	mov rdi, rax
	call _long_toStr_plongchar.boollong
	mov rbx, rax
	dec rbx
	mov qword[rbp-48], rbx
	mov rbx, qword[rbp-16]
	mov byte[rbx], 46
	inc qword[rbp-16]
	mov r10, 7
	sub r10, qword[rbp-48]
	mov qword[rbp-48], r10
	mov qword[rbp-56], 0
	jmp .L0x20e
.L0x20d:
	mov rbx, qword[rbp-16]
	mov byte[rbx], 48
	inc qword[rbp-16]
	inc qword[rbp-40]
.L0x20f:
	inc qword[rbp-56]
.L0x20e:
	mov r10, qword[rbp-48]
	cmp qword[rbp-56], r10
	jl .L0x20d
.L0x210:
	dec qword[rbp-16]
	mov rcx, 10
	mov rdx, 1
	mov rbx, qword[rbp-16]
	mov rsi, rbx
	movsd xmm7, qword[rbp-8]
	movsd xmm0, xmm7
	roundsd xmm0, xmm0, 0  
	cvttsd2si rax, xmm0
.L0x227:
	mov rdi, rax
	call _long_abs_plong
	mov rdi, rax
	call _long_toStr_plongchar.boollong
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
	jz .L0x1cd
	xor rax, rax
	jmp ___int___sprintf_pchar.char.void.__return
.L0x1cd:
.L0x1ce:
.L0x1cf:
	mov rbx, qword[rbp-16]
	mov bl, byte[rbx]
	and rbx, 0xff
	cmp bl, 37
	je .L0x1d2
	mov rbx, qword[rbp-8]
	mov r10, qword[rbp-16]
	mov r10b, byte[r10]
	and r10, 0xff
	mov [rbx], r10b
	jmp .L0x1d3
.L0x1d2:
	inc qword[rbp-16]
	mov rbx, qword[rbp-16]
	mov bl, byte[rbx]
	and rbx, 0xff
	mov byte[rbp-48], bl
	cmp byte[rbp-48], 105
	je .L0x1d5
	cmp byte[rbp-48], 99
	je .L0x1d6
	cmp byte[rbp-48], 120
	je .L0x1d7
	cmp byte[rbp-48], 111
	je .L0x1d8
	cmp byte[rbp-48], 117
	je .L0x1d9
	cmp byte[rbp-48], 115
	je .L0x1da
	cmp byte[rbp-48], 66
	je .L0x1db
	cmp byte[rbp-48], 100
	je .L0x1de
	cmp byte[rbp-48], 102
	je .L0x1df
	cmp byte[rbp-48], 98
	je .L0x1e0
	jmp .L0x1d4
.L0x1d5:
	mov r10d, dword[rbp-32]
	mov rbx, qword[rbp-24]
	and r10, 0x7fffffff
	mov rbx, [rbx+r10*8]
	mov qword[rbp-56], rbx
	mov rcx, 10
	mov rdx, 1
	mov rbx, qword[rbp-8]
	mov rsi, rbx
	mov rbx, qword[rbp-56]
	mov rdi, rbx
	call _long_toStr_plongchar.boollong
	mov r10, rax
	mov qword[rbp-64], r10
	mov rbx, qword[rbp-64]
	dec rbx
	add qword[rbp-8], rbx
	jmp .L0x1d4
.L0x1d6:
	mov r10d, dword[rbp-32]
	mov rbx, qword[rbp-24]
	and r10, 0x7fffffff
	mov rbx, [rbx+r10*8]
	mov r11, rbx
	mov byte[rbp-72], r11b
	mov rbx, qword[rbp-8]
	mov r11b, byte[rbp-72]
	mov [rbx], r11b
	jmp .L0x1d4
.L0x1d7:
	mov r10d, dword[rbp-32]
	mov rbx, qword[rbp-24]
	and r10, 0x7fffffff
	mov rbx, [rbx+r10*8]
	mov qword[rbp-80], rbx
	mov rcx, 16
	mov rdx, 0
	mov rbx, qword[rbp-8]
	mov rsi, rbx
	mov rbx, qword[rbp-80]
	mov rdi, rbx
	call _long_toStr_plongchar.boollong
	mov r10, rax
	mov qword[rbp-88], r10
	mov rbx, qword[rbp-88]
	dec rbx
	add qword[rbp-8], rbx
	jmp .L0x1d4
.L0x1d8:
	mov r10d, dword[rbp-32]
	mov rbx, qword[rbp-24]
	and r10, 0x7fffffff
	mov rbx, [rbx+r10*8]
	mov qword[rbp-96], rbx
	mov rcx, 8
	mov rdx, 0
	mov rbx, qword[rbp-8]
	mov rsi, rbx
	mov rbx, qword[rbp-96]
	mov rdi, rbx
	call _long_toStr_plongchar.boollong
	mov r10, rax
	mov qword[rbp-104], r10
	mov rbx, qword[rbp-104]
	dec rbx
	add qword[rbp-8], rbx
	jmp .L0x1d4
.L0x1d9:
	mov r10d, dword[rbp-32]
	mov rbx, qword[rbp-24]
	and r10, 0x7fffffff
	mov rbx, [rbx+r10*8]
	mov qword[rbp-112], rbx
	mov rcx, 10
	mov rdx, 0
	mov rbx, qword[rbp-8]
	mov rsi, rbx
	mov rbx, qword[rbp-112]
	mov rdi, rbx
	call _long_toStr_plongchar.boollong
	mov rbx, rax
	mov dword[rbp-120], ebx
	mov ebx, dword[rbp-120]
	dec ebx
	mov r10d, ebx
	add qword[rbp-8], r10
	jmp .L0x1d4
.L0x1da:
	mov r10d, dword[rbp-32]
	mov rbx, qword[rbp-24]
	and r10, 0x7fffffff
	mov rbx, [rbx+r10*8]
	mov rsi, rbx
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _long_strcpy_pchar.char.
	mov rbx, rax
	mov dword[rbp-128], ebx
	mov ebx, dword[rbp-128]
	dec ebx
	mov r10d, ebx
	add qword[rbp-8], r10
	jmp .L0x1d4
.L0x1db:
	mov r10d, dword[rbp-32]
	mov rbx, qword[rbp-24]
	and r10, 0x7fffffff
	mov rbx, [rbx+r10*8]
	mov r10, rbx
	mov byte[rbp-136], r10b
	mov r10, LC.S139
	mov qword[rbp-144], r10
	mov al, byte[rbp-136]
	test al, al
	jz .L0x1dc
	mov r10, LC.S140
	mov qword[rbp-144], r10
	jmp .L0x1dd
.L0x1dc:
.L0x1dd:
	mov rbx, qword[rbp-144]
	mov rsi, rbx
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _long_strcpy_pchar.char.
	mov rbx, rax
	mov dword[rbp-152], ebx
	mov ebx, dword[rbp-152]
	add qword[rbp-8], rbx
	jmp .L0x1d4
.L0x1de:
	mov r10d, dword[rbp-32]
	mov rbx, qword[rbp-24]
	and r10, 0x7fffffff
	mov rbx, [rbx+r10*8]
	movq xmm7, rbx
	movsd qword[rbp-160], xmm7
	mov rsi, 1000000000
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	movsd xmm7, qword[rbp-160]
	movsd xmm0, xmm7
	call _long_toStr_pdoublechar.long
	mov rbx, rax
	mov dword[rbp-168], ebx
	mov ebx, dword[rbp-168]
	dec ebx
	mov r10d, ebx
	add qword[rbp-8], r10
	jmp .L0x1d4
.L0x1df:
	mov r10d, dword[rbp-32]
	mov rbx, qword[rbp-24]
	and r10, 0x7fffffff
	mov rbx, [rbx+r10*8]
	movq xmm7, rbx
	movsd qword[rbp-176], xmm7
	mov rsi, 10000000
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	movsd xmm7, qword[rbp-176]
	movsd xmm0, xmm7
	call _long_toStr_pdoublechar.long
	mov rbx, rax
	mov dword[rbp-184], ebx
	mov ebx, dword[rbp-184]
	dec ebx
	mov r10d, ebx
	add qword[rbp-8], r10
	jmp .L0x1d4
.L0x1e0:
	mov r10d, dword[rbp-32]
	mov rbx, qword[rbp-24]
	and r10, 0x7fffffff
	mov rbx, [rbx+r10*8]
	mov qword[rbp-192], rbx
	mov rbx, qword[rbp-16]
	inc rbx
	mov bl, byte[rbx]
	and rbx, 0xff
	mov byte[rbp-200], bl
	mov qword[rbp-208], 64
	cmp byte[rbp-200], 56
	jne .L0x1e1
	inc qword[rbp-16]
	jmp .L0x1e2
.L0x1e1:
	cmp byte[rbp-200], 52
	jne .L0x1e3
	mov qword[rbp-208], 32
	inc qword[rbp-16]
	jmp .L0x1e4
.L0x1e3:
	cmp byte[rbp-200], 50
	jne .L0x1e5
	mov qword[rbp-208], 16
	inc qword[rbp-16]
	jmp .L0x1e6
.L0x1e5:
	cmp byte[rbp-200], 49
	jne .L0x1e7
	mov qword[rbp-208], 8
	inc qword[rbp-16]
	jmp .L0x1e8
.L0x1e7:
.L0x1e8:
.L0x1e6:
.L0x1e4:
.L0x1e2:
	mov rbx, qword[rbp-208]
	mov rdx, rbx
	mov rsi, qword[rbp-192]
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _size_t_toBinary_pchar.ulonglong
	mov r10, rax
	mov qword[rbp-216], r10
	mov r10, qword[rbp-216]
	add qword[rbp-8], r10
	jmp .L0x1d4
.L0x1d4:
	inc dword[rbp-32]
.L0x1d3:
	inc qword[rbp-16]
	inc qword[rbp-8]
.L0x1d0:
	mov rbx, qword[rbp-16]
	mov bl, byte[rbx]
	and rbx, 0xff
	test bl, bl
	jnz .L0x1cf
.L0x1d1:
	mov r10, qword[rbp-8]
	sub r10, qword[rbp-40]
	mov eax, r10d
___int___sprintf_pchar.char.void.__return:
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
	lea rbx, [rbx+r10*8]
	mov r11, qword[rbp-32]
	mov [rbx], r11
	mov r10, 2
	lea rbx, [rbp-88] 
	lea rbx, [rbx+r10*8]
	mov r11, qword[rbp-40]
	mov [rbx], r11
	mov r10, 3
	lea rbx, [rbp-88] 
	lea rbx, [rbx+r10*8]
	mov r11, qword[rbp-48]
	mov [rbx], r11
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
_FILE_fopen_pchar.char.:
	push rbp
	mov rbp, rsp
	sub rsp, 56
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	mov rbx, qword[rbp-16]
	mov bl, byte[rbx]
	and rbx, 0xff
	mov r10, rbx
	mov qword[rbp-24], r10
	mov r10b, 1
	mov rbx, qword[rbp-16]
	and r10, 0xff
	mov bl, [rbx+r10*1]
	and rbx, 0xff
	mov r10, qword[rbp-24]
	add r10, rbx
	mov qword[rbp-32], 510
	mov qword[rbp-40], 0
	cmp qword[rbp-24], 114
	je .L0x1b9
	cmp qword[rbp-24], 119
	je .L0x1ba
	cmp qword[rbp-24], 97
	je .L0x1bb
	cmp qword[rbp-24], 157
	je .L0x1bc
	cmp qword[rbp-24], 162
	je .L0x1bd
	cmp qword[rbp-24], 140
	je .L0x1be
	jmp .L0x1b8
.L0x1b9:
	mov qword[rbp-40], 0
	jmp .L0x1b8
.L0x1ba:
	mov qword[rbp-40], 1
	jmp .L0x1b8
.L0x1bb:
	mov qword[rbp-40], 1
	jmp .L0x1b8
.L0x1bc:
	mov qword[rbp-40], 2
	jmp .L0x1b8
.L0x1bd:
	mov qword[rbp-40], 2
	jmp .L0x1b8
.L0x1be:
	mov qword[rbp-40], 2
	jmp .L0x1b8
.L0x1b8:
	mov rbx, qword[rbp-32]
	mov rdx, rbx
	mov rsi, qword[rbp-40]
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	mov rax , 2 
	mov r10 , rcx 
	syscall 
.L0x1c3:
	mov r10, rax
	mov qword[rbp-48], r10
	cmp qword[rbp-24], 140
	sete bl
	cmp qword[rbp-24], 97
	sete r10b
	or bl, r10b
	jz .L0x1c5
	mov rdx, 2
	mov rsi, 0
	mov rdi, qword[rbp-48]
	mov rax , 8 
	mov r10 , rcx 
	syscall 
.L0x1cb:
	jmp .L0x1c6
.L0x1c5:
.L0x1c6:
	mov rbx, qword[rbp-48]
	mov rax, rbx
___FILE_fopen_pchar.char.__return:
	leave
	ret
_size_t_fputs_pFILEchar.:
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
	mov rdi, qword[rbp-8]
	mov rax , 1 
	mov r10 , rcx 
	syscall 
.L0x1b6:
	mov r10, rax
	mov qword[rbp-32], r10
	mov rbx, qword[rbp-32]
	mov rax, rbx
___size_t_fputs_pFILEchar.__return:
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
	mov rax , 1 
	mov r10 , rcx 
	syscall 
.L0x1b0:
	mov r10, rax
	mov qword[rbp-24], r10
	mov rbx, qword[rbp-24]
	mov rax, rbx
___size_t_puts_pchar.__return:
	leave
	ret
_long_fgets_pFILEchar.size_t:
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
	mov rdi, qword[rbp-8]
	mov rax , 0 
	mov r10 , rcx 
	syscall 
.L0x1aa:
	mov r10, rax
	mov qword[rbp-32], r10
	mov rbx, qword[rbp-32]
	mov rax, rbx
___long_fgets_pFILEchar.size_t__return:
	leave
	ret
_void._floads_pFILE:
	push rbp
	mov rbp, rsp
	sub rsp, 40
	mov [rbp-8], rdi
	mov rdx, 2
	mov rsi, 0
	mov rdi, qword[rbp-8]
	mov rax , 8 
	mov r10 , rcx 
	syscall 
.L0x196:
	mov r10, rax
	mov dword[rbp-16], r10d
	mov rdx, 2
	mov r10d, 0
	sub r10d, dword[rbp-16]
	mov esi, r10d
	mov rdi, qword[rbp-8]
	mov rax , 8 
	mov r10 , rcx 
	syscall 
.L0x19c:
	mov edi, dword[rbp-16]
	call _void._mapalloc_psize_t
	mov r10, rax
	mov qword[rbp-24], r10
	mov edx, dword[rbp-16]
	mov rbx, qword[rbp-24]
	mov rsi, rbx
	mov rdi, qword[rbp-8]
	mov rax , 0 
	mov r10 , rcx 
	syscall 
.L0x1a2:
	mov r10, rax
	mov qword[rbp-32], r10
	cmp qword[rbp-32], 0
	jge .L0x1a4
	mov rax, qword[rbp-32]
	jmp ___void._floads_pFILE__return
.L0x1a4:
.L0x1a5:
	mov rax, qword[rbp-24]
___void._floads_pFILE__return:
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
	push rdi
	xor r9, r9
	xor r8, r8
	mov rcx, 34
	mov rdx, 3
	mov rsi, rdi
	mov rdi, 0
	mov rax, 9
	mov r10, rcx
	syscall
.L0x183:
	mov rbx, rax
	pop rdi
	jmp .L0x17e
.L0x17e:
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
	mov edx, dword[rbp-40]
	mov rbx, qword[rbp-32]
	mov rsi, rbx
	mov rbx, qword[rbp-24]
	mov rdi, rbx
	mov rax , 1 
	mov r10 , rcx 
	syscall 
.L0x18a:
	mov rsi, 10000
	mov rdi, qword[rbp-32]
	syscall
.L0x190:
	xor rax, 11
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
	lea rbx, [rbx+r10*8]
	mov r11, qword[rbp-24]
	mov [rbx], r11
	mov r10, 2
	lea rbx, [rbp-104] 
	lea rbx, [rbx+r10*8]
	mov r11, qword[rbp-32]
	mov [rbx], r11
	mov r10, 3
	lea rbx, [rbp-104] 
	lea rbx, [rbx+r10*8]
	mov r11, qword[rbp-40]
	mov [rbx], r11
	mov r10, 4
	lea rbx, [rbp-104] 
	lea rbx, [rbx+r10*8]
	mov r11, qword[rbp-48]
	mov [rbx], r11
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
	lea rbx, [rbx+r10*8]
	mov r11, qword[rbp-24]
	mov [rbx], r11
	mov r10, 2
	lea rbx, [rbp-104] 
	lea rbx, [rbx+r10*8]
	mov r11, qword[rbp-32]
	mov [rbx], r11
	mov r10, 3
	lea rbx, [rbp-104] 
	lea rbx, [rbx+r10*8]
	mov r11, qword[rbp-40]
	mov [rbx], r11
	mov r10, 4
	lea rbx, [rbp-104] 
	lea rbx, [rbx+r10*8]
	mov r11, qword[rbp-48]
	mov [rbx], r11
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
	lea rbx, [rbx+r10*8]
	mov r11, qword[rbp-32]
	mov [rbx], r11
	mov r10, 2
	lea rbx, [rbp-88] 
	lea rbx, [rbx+r10*8]
	mov r11, qword[rbp-40]
	mov [rbx], r11
	mov r10, 3
	lea rbx, [rbp-88] 
	lea rbx, [rbx+r10*8]
	mov r11, qword[rbp-48]
	mov [rbx], r11
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
_void___assert_pboolchar.intchar.:
	push rbp
	mov rbp, rsp
	sub rsp, 40
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	mov [rbp-24], rdx
	mov [rbp-32], rcx
	cmp byte[rbp-8], 0
	jne .L0x175
	mov rcx, qword[rbp-32]
	mov edx, dword[rbp-24]
	mov rsi, qword[rbp-16]
	mov rdi, LC.S141
	call eprintf
	mov rdi, 1
	mov rax , 60 
	mov r10 , rcx 
	syscall 
.L0x17b:
	jmp .L0x176
.L0x175:
.L0x176:
	xor rax, rax
	leave
	ret
_void_merge_right_pmblock.:
	mov rbx, rdi
	mov rbx, [rbx+8]
	test rbx, rbx
	jz .L0x16d
	mov rbx, rdi
	lea rbx, [rbx+8]
	mov r10, rbx
	cmp qword[r10+24], 1
	jne .L0x16f
	mov rbx, rdi
	lea rbx, [rdi+32]
	cmp rdi, qword[rbx]
	jne .L0x171
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
	jz .L0x173
	mov rbx, rdi
	lea rbx, [rbx+8]
	mov r10, rbx
	mov [r10+16], rdi
	jmp .L0x174
.L0x173:
.L0x174:
.L0x171:
.L0x172:
.L0x16f:
.L0x170:
.L0x16d:
.L0x16e:
	xor rax, rax
	ret
_bool_scan_merge_pmblock.:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov [rbp-8], rdi
	mov r10, qword[malloc_maxcache]
	cmp qword[cached_size], r10
	jle .L0x15a
	mov rbx, qword[rbp-8]
	mov rbx, qword[rbx]
	add rbx, 32
	sub qword[cached_size], rbx
	cmp qword[cached_size], 0
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
	mov rdi, rbx
	push rdi
	mov rbx, rdi
	mov rbx, qword[rbx]
	lea rsi, [rbx+32]
	syscall
.L0x162:
	mov rbx, 11
	pop rdi
	jmp .L0x15d
.L0x15d:
	xor rax, rax
	jmp ___bool_scan_merge_pmblock.__return
.L0x15a:
.L0x15b:
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _void_merge_right_pmblock.
	mov rbx, qword[rbp-8]
	mov rbx, [rbx+16]
	mov rdi, rbx
	call _void_merge_right_pmblock.
	mov rax, 1
___bool_scan_merge_pmblock.__return:
	leave
	ret
_void_add_block_pmblock.:
	mov rbx, qword[free_head]
	test rbx, rbx
	jnz .L0x158
	mov qword[free_head], rdi
	mov rbx, rdi
	mov [rbx+16], rdi
	mov rbx, rdi
	mov qword[rbx+8], 0
	jmp ___void_add_block_pmblock.__return
.L0x158:
.L0x159:
	mov rbx, qword[free_head]
	lea rbx, [rbx+16]
	mov r10, rbx
	mov [r10+8], rdi
	mov rbx, qword[free_head]
	mov [rbx+16], rdi
___void_add_block_pmblock.__return:
	ret
_mblock._scan_existing_psize_t:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov [rbp-8], rdi
	mov rbx, qword[free_head]
	test rbx, rbx
	jnz .L0x14c
	xor rax, rax
	jmp ___mblock._scan_existing_psize_t__return
.L0x14c:
.L0x14d:
	mov r10, qword[free_head]
	mov qword[rbp-16], r10
	jmp .L0x14f
.L0x14e:
	mov rbx, qword[rbp-16]
	cmp qword[rbx+24], 1
	jne .L0x152
	mov rbx, qword[rbp-16]
	mov rbx, qword[rbx]
	cmp rbx, qword[rbp-8]
	jl .L0x154
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
.L0x154:
.L0x155:
.L0x152:
.L0x153:
.L0x150:
	mov rbx, qword[rbp-16]
	mov rbx, [rbx+8]
	mov qword[rbp-16], rbx
.L0x14f:
	mov rbx, qword[rbp-16]
	test rbx, rbx
	jnz .L0x14e
.L0x151:
	xor rax, rax
___mblock._scan_existing_psize_t__return:
	leave
	ret
_void_printstate_p:
	mov rdi, LC.S142
	push rdi
	call _size_t_puts_pchar.
	mov rbx, rax
	pop rdi
	jmp .L0x13e
.L0x13e:
	mov rbx, qword[free_head]
	test rbx, rbx
	jnz .L0x140
	mov rdi, LC.S143
	push rdi
	call _size_t_puts_pchar.
	mov rbx, rax
	pop rdi
	jmp .L0x143
.L0x143:
.L0x140:
	mov r10, qword[free_head]
	mov qword[rbp-8], r10
	jmp .L0x146
.L0x145:
	mov rbx, qword[rbp-8]
	mov rbx, [rbx+24]
	mov rcx, rbx
	mov rdx, qword[rbp-8]
	mov rbx, qword[rbp-8]
	mov rbx, qword[rbx]
	mov rsi, rbx
	mov rdi, LC.S144
	call printf
.L0x147:
	mov rbx, qword[rbp-8]
	mov rbx, [rbx+8]
	mov qword[rbp-8], rbx
.L0x146:
	mov rbx, qword[rbp-8]
	test rbx, rbx
	jnz .L0x145
.L0x148:
.L0x141:
	mov rcx, qword[cached_size]
	mov rdx, qword[deletions]
	mov rsi, qword[appends]
	mov rdi, LC.S145
	call printf
	mov rdi, LC.S146
	push rdi
	call _size_t_puts_pchar.
	mov rbx, rax
	pop rdi
	jmp .L0x14a
.L0x14a:
	xor rax, rax
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
	jg .L0x139
	jmp ___void_split_block_pmblock.size_t__return
.L0x139:
.L0x13a:
	lea rdi, [rdi+rsi+32]
	mov qword[rbp-8], rdi
	mov rbx, qword[rbp-8]
	mov [rbx+16], rdi
	mov rbx, qword[rbp-8]
	lea rbx, [rbx+8]
	mov r10, rdi
	mov r10, [r10+8]
	mov [rbx], r10
	mov rbx, rdi
	lea rbx, [rbx+8]
	test rbx, rbx
	jz .L0x13b
	mov rbx, rdi
	lea rbx, [rbx+8]
	mov r10, rbx
	lea r10, [r10+16]
	mov r11, qword[rbp-8]
	mov [r10], r11
	jmp .L0x13c
.L0x13b:
.L0x13c:
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
	mov [rbx], rsi
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
	jnz .L0x128
	jmp ___void_free_pvoid.__return
.L0x128:
.L0x129:
	mov rbx, qword[rbp-8]
	sub rbx, 32
	mov qword[rbp-16], rbx
	mov rbx, qword[rbp-16]
	cmp qword[rbx], 4096
	jl .L0x12a
	mov rbx, qword[rbp-16]
	add qword[rbx], 32
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	push rdi
	mov rbx, rdi
	mov rbx, qword[rbx]
	lea rsi, [rbx+32]
	syscall
.L0x132:
	mov rbx, 11
	pop rdi
	jmp .L0x12d
.L0x12d:
.L0x12a:
.L0x12b:
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
	jl .L0x10a
	mov rbx, qword[rbp-8]
	lea rdi, [rbx+32]
	push rdi
	push rdi
	xor r9, r9
	xor r8, r8
	mov rcx, 34
	mov rdx, 3
	mov rsi, rdi
	mov rdi, 0
	mov rax, 9
	mov r10, rcx
	syscall
.L0x114:
	mov rbx, rax
	pop rdi
	jmp .L0x10f
.L0x10f:
	mov rbx, rax
	pop rdi
	jmp .L0x10d
.L0x10d:
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
	lea rax, [rbx+32]
	jmp ___void._malloc_psize_t__return
.L0x10a:
.L0x10b:
	mov rbx, qword[free_head]
	test rbx, rbx
	jz .L0x118
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _mblock._scan_existing_psize_t
	mov r10, rax
	mov qword[rbp-16], r10
	mov rax, qword[rbp-16]
	test rax, rax
	jz .L0x11a
	mov rbx, qword[rbp-16]
	mov qword[rbx+24], 0
	mov rbx, qword[rbp-16]
	lea rax, [rbx+32]
	jmp ___void._malloc_psize_t__return
.L0x11a:
.L0x11b:
.L0x118:
.L0x119:
	mov rdi, 4096
	push rdi
	push rdi
	xor r9, r9
	xor r8, r8
	mov rcx, 34
	mov rdx, 3
	mov rsi, rdi
	mov rdi, 0
	mov rax, 9
	mov r10, rcx
	syscall
.L0x124:
	mov rbx, rax
	pop rdi
	jmp .L0x11f
.L0x11f:
	mov rbx, rax
	pop rdi
	jmp .L0x11d
.L0x11d:
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
	lea rax, [rbx+32]
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
	mov rbx, qword[rbp-24]
	mov rbx, qword[rbx]
	mov qword[rbp-32], rbx
	cmp qword[rbp-32], 4096
	jge .L0x100
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _void_free_pvoid.
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	call _void._malloc_psize_t
	mov r10, rax
	mov qword[rbp-40], r10
	mov r10, qword[rbp-40]
	cmp qword[rbp-8], r10
	jne .L0x102
	mov rbx, qword[rbp-8]
	mov rax, rbx
	jmp ___void._realloc_pvoid.size_t__return
.L0x102:
.L0x103:
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
.L0x100:
.L0x101:
	xor r9, r9
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
.L0x108:
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
	lea rdi, [rbx+8]
	push rdi
	xor r9, r9
	xor r8, r8
	mov rcx, 34
	mov rdx, 3
	mov rsi, rdi
	mov rdi, 0
	mov rax, 9
	mov r10, rcx
	syscall
.L0xfd:
	mov rbx, rax
	pop rdi
	jmp .L0xf8
.L0xf8:
	mov r10, rax
	mov qword[rbp-16], r10
	mov rbx, qword[rbp-16]
	mov r11, qword[rbp-8]
	mov [rbx], r11
	mov rbx, qword[rbp-16]
	lea rax, [rbx+8]
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
	mov rbx, qword[rbp-16]
	mov rsi, rbx
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	syscall
.L0xf5:
	xor rax, 11
	leave
	ret
_void_maprealloc_pvoid.size_t:
	push rbp
	mov rbp, rsp
	sub rsp, 24
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	mov r9, 0
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
.L0xef:
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
	sub rsp, 56
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	mov [rbp-24], rdx
	mov r10, 32
	mov rbx, qword[rbp-24]
	xor rdx, rdx
	mov rax, rbx
	idiv r10
	mov r10, rdx
	mov dword[rbp-32], r10d
	mov r10d, dword[rbp-32]
	mov rbx, qword[rbp-24]
	mov r11d, r10d
	sub rbx, r11
	sar rbx, 2
	mov qword[rbp-40], rbx
	mov dword[rbp-48], 0
	jmp .L0xe4
.L0xe3:
	mov ebx, dword[rbp-48]
	shl rbx, 3
	add rbx, [rbp-16]
	vmovdqu ymm0, [rbx]
	mov ebx, dword[rbp-48]
	shl rbx, 3
	add rbx, [rbp-8]
	vmovdqu [rbx], ymm0
.L0xe5:
	mov ebx, dword[rbp-48]
	add ebx, 4
	mov dword[rbp-48], ebx
.L0xe4:
	mov r10d, dword[rbp-48]
	mov rbx, qword[rbp-40]
	mov r11d, r10d
	cmp r11, rbx
	jl .L0xe3
.L0xe6:
	mov ebx, dword[rbp-32]
	test ebx, ebx
	jz .L0xe7
	mov edx, dword[rbp-32]
	mov r10, qword[rbp-16]
	lea rsi, [r10+rbx]
	mov r10, qword[rbp-8]
	lea rdi, [r10+rbx]
	call _void_memcpy_pvoid.void.size_t
	jmp .L0xe8
.L0xe7:
.L0xe8:
	xor rax, rax
	leave
	ret
_void_avx_memzeraligned_pvoid.size_t:
	vxorpd ymm0, ymm0, ymm0
.L0xe2avxmemzeraligned_lp:
	vmovdqu [rdi], ymm0
	add rdi, 4
	sub rsi, 4
	jnz .L0xe2avxmemzeraligned_lp
	ret
_void_avx_memzer_pvoid.size_t:
	push rbp
	mov rbp, rsp
	sub rsp, 40
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	mov r10, 32
	mov rbx, qword[rbp-16]
	xor rdx, rdx
	mov rax, rbx
	idiv r10
	mov r10, rdx
	mov dword[rbp-24], r10d
	mov r10d, dword[rbp-24]
	mov rbx, qword[rbp-16]
	mov r11d, r10d
	sub rbx, r11
	sar rbx, 2
	mov qword[rbp-32], rbx
	mov rbx, qword[rbp-32]
	mov rsi, rbx
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _void_avx_memzeraligned_pvoid.size_t
	mov ebx, dword[rbp-24]
	test ebx, ebx
	jz .L0xdf
	mov edx, dword[rbp-24]
	mov rsi, 0
	mov r10, qword[rbp-8]
	lea rdi, [r10+rbx]
	call _void_memset_pvoid.ucharsize_t
	jmp .L0xe0
.L0xdf:
.L0xe0:
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
.L0xdc:
	mov [rdi+rsi], bl
	dec rsi
	jnz .L0xdc
	ret
_long_rand_p:
	mov rbx, qword[rand_next]
	sal rbx, 13
	mov r10, qword[rand_next]
	xor r10, rbx
	mov qword[rand_next], r10
	mov rbx, qword[rand_next]
	sar rbx, 17
	mov r10, qword[rand_next]
	xor r10, rbx
	mov qword[rand_next], r10
	mov rbx, qword[rand_next]
	sal rbx, 5
	mov r10, qword[rand_next]
	xor r10, rbx
	mov qword[rand_next], r10
	mov rbx, qword[rand_next]
	mov rax, rbx
___long_rand_p__return:
	ret
_void_srand_p:
	rdrand rax
.L0xd8:
	mov r10, rax
	mov qword[rand_next], r10
	xor rax, rax
	ret
_void_srand_plong:
	mov qword[rand_next], rdi
	xor rax, rax
	ret
_clock_t_clock_p:
	push rbp
	mov rbp, rsp
	sub rsp, 24
	lea rbx, [rbp-24]
	mov rsi, rbx
	mov rdi, 2
	mov rax , 228 
	mov r10 , rcx 
	syscall 
.L0xd1:
	mov rbx, rax
	test rbx, rbx
	jz .L0xd3
	mov rax, -1
	jmp ___clock_t_clock_p__return
.L0xd3:
.L0xd4:
	mov r10, 9223372036854
	cmp qword[rbp-24], r10
	setg bl
	mov r11, 1000
	mov r10, qword[rbp-16]
	xor rdx, rdx
	mov rax, r10
	idiv r11
	mov r10, rax
	mov r12, 1000000
	mov r11, qword[rbp-24]
	imul r11, r12
	mov r12, 9223372036854775807
	sub r12, r11
	cmp r10, r12
	setg r10b
	or bl, r10b
	jz .L0xd5
	mov rax, -1
	jmp ___clock_t_clock_p__return
.L0xd5:
.L0xd6:
	mov r10, 1000000
	mov rbx, qword[rbp-24]
	imul rbx, r10
	mov r11, 1000
	mov r10, qword[rbp-16]
	xor rdx, rdx
	mov rax, r10
	idiv r11
	lea rax, [rbx+r10]
___clock_t_clock_p__return:
	leave
	ret
_tm._gmtime_ptime_t:
	push rbp
	mov rbp, rsp
	sub rsp, 104
	mov [rbp-8], rdi
	call tzset
	mov r10, qword[rbp-8]
	mov qword[rbp-16], r10
	mov rbx, __tmbuf
	mov qword[rbp-24], rbx
	mov dword[rbp-80], 0
	mov dword[rbp-88], 0
	lea rbx, [rbp-32]
	mov rdx, rbx
	mov rsi, 60
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _long_divmod_plonglonglong.
	mov r10, rax
	mov qword[rbp-8], r10
	lea rbx, [rbp-40]
	mov rdx, rbx
	mov rsi, 60
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _long_divmod_plonglonglong.
	mov r10, rax
	mov qword[rbp-8], r10
	lea rbx, [rbp-48]
	mov rdx, rbx
	mov rsi, 24
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _long_divmod_plonglonglong.
	mov r10, rax
	mov qword[rbp-8], r10
	mov r10, 60
	mov rbx, qword[rbp-16]
	xor rdx, rdx
	mov rax, rbx
	idiv r10
	mov rbx, rax
	mov r10, 60
	xor rdx, rdx
	mov rax, rbx
	idiv r10
	mov rbx, rax
	mov r10, 24
	xor rdx, rdx
	mov rax, rbx
	idiv r10
	mov r10, rax
	mov dword[rbp-56], r10d
	mov ebx, dword[rbp-56]
	movsd xmm7, qword[LC.F28]
	cvtsi2sd xmm8, ebx
	divsd xmm8, xmm7
	movsd xmm0, xmm8
	call _long_floor_pdouble
	mov rbx, rax
	mov dword[rbp-64], ebx
	mov ebx, dword[rbp-64]
	movsd xmm7, qword[LC.F29]
	cvtsi2sd xmm8, ebx
	mulsd xmm8, xmm7
	movsd xmm0, xmm8
	call _long_floor_pdouble
	push rax
	mov r10d, dword[rbp-56]
	pop rbx
	mov r11d, r10d
	sub r11, rbx
	mov rbx, r11
	mov dword[rbp-56], ebx
	mov ebx, dword[rbp-56]
	add ebx, 4
	xor rax, rax
	mov rax, rbx
	mov rcx, 1227133514
	imul rcx
	sar rax, 33
	mov rcx, 7
	imul rcx
	sub ebx, eax
	mov dword[rbp-72], ebx
	mov r10d, dword[rbp-56]
	mov dword[rbp-88], r10d
	mov dword[rbp-96], 0
	jmp .L0xc8
.L0xc7:
	mov r10d, dword[rbp-96]
	mov rbx, qword[mdays]
	and r10, 0x7fffffff
	mov ebx, [rbx+r10*4]
	and rbx, 0x7fffffff
	cmp dword[rbp-88], ebx
	jle .L0xcb
	mov r10d, dword[rbp-96]
	mov rbx, qword[mdays]
	and r10, 0x7fffffff
	mov ebx, [rbx+r10*4]
	and rbx, 0x7fffffff
	mov r10d, dword[rbp-88]
	sub r10d, ebx
	mov dword[rbp-88], r10d
	jmp .L0xcc
.L0xcb:
.L0xcc:
.L0xc9:
	inc dword[rbp-96]
.L0xc8:
	jmp .L0xc7
.L0xca:
	inc dword[rbp-96]
	mov r10d, dword[rbp-96]
	mov dword[rbp-80], r10d
	mov rbx, qword[rbp-24]
	mov r11d, dword[rbp-32]
	mov [rbx], r11d
	mov rbx, qword[rbp-24]
	lea rbx, [rbx+4]
	mov r11d, dword[rbp-40]
	mov [rbx], r11d
	mov rbx, qword[rbp-24]
	lea rbx, [rbx+8]
	mov r11d, dword[rbp-48]
	mov [rbx], r11d
	mov rbx, qword[rbp-24]
	lea rbx, [rbx+28]
	mov r11d, dword[rbp-56]
	mov [rbx], r11d
	mov rbx, qword[rbp-24]
	lea rbx, [rbx+20]
	mov r10d, dword[rbp-64]
	add r10d, 70
	mov [rbx], r10d
	mov rbx, qword[rbp-24]
	lea rbx, [rbx+24]
	mov r11d, dword[rbp-72]
	mov [rbx], r11d
	mov rbx, qword[rbp-24]
	lea rbx, [rbx+12]
	mov r11d, dword[rbp-88]
	mov [rbx], r11d
	mov rbx, qword[rbp-24]
	lea rbx, [rbx+16]
	mov r11d, dword[rbp-80]
	mov [rbx], r11d
	mov rbx, qword[rbp-24]
	mov rax, rbx
___tm._gmtime_ptime_t__return:
	leave
	ret
_char._asctime_ptm.:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov [rbp-8], rdi
	mov rdx, 28
	mov sil, 32
	mov rdi, qword[asctime__result_buf]
	call _void_memset_pvoid.ucharsize_t
	mov rbx, qword[rbp-8]
	mov ebx, [rbx+24]
	and rbx, 0x7fffffff
	mov r10, wday_name
	mov r10, [r10+rbx*8]
	mov rsi, r10
	mov rbx, qword[asctime__result_buf]
	mov rdi, rbx
	call _long_strcpy_pchar.char.
	mov r10b, 3
	mov rbx, qword[asctime__result_buf]
	and r10, 0xff
	mov byte[rbx+r10*1], 32
	mov rbx, qword[rbp-8]
	mov ebx, [rbx+16]
	and rbx, 0x7fffffff
	mov r10, mon_name
	mov r10, [r10+rbx*8]
	mov rsi, r10
	mov rbx, qword[asctime__result_buf]
	lea rdi, [rbx+4]
	call _long_strcpy_pchar.char.
	mov r10b, 7
	mov rbx, qword[asctime__result_buf]
	and r10, 0xff
	mov byte[rbx+r10*1], 32
	mov r9, 0
	mov r8, 0
	mov rcx, 0
	mov rbx, qword[rbp-8]
	mov ebx, [rbx+12]
	and rbx, 0x7fffffff
	mov rdx, rbx
	mov rsi, LC.S166
	mov rbx, qword[asctime__result_buf]
	lea rdi, [rbx+7]
	call sprintf
	mov rbx, qword[rbp-8]
	mov ebx, [rbx+20]
	and rbx, 0x7fffffff
	add ebx, 1900
	mov r9, rbx
	mov rbx, qword[rbp-8]
	mov ebx, dword[rbx]
	and rbx, 0x7fffffff
	mov r8, rbx
	mov rbx, qword[rbp-8]
	mov ebx, [rbx+4]
	and rbx, 0x7fffffff
	mov rcx, rbx
	mov rbx, qword[rbp-8]
	mov ebx, [rbx+8]
	and rbx, 0x7fffffff
	mov rdx, rbx
	mov rsi, LC.S167
	mov rbx, qword[asctime__result_buf]
	lea rdi, [rbx+10]
	call sprintf
	mov rbx, qword[asctime__result_buf]
	mov rax, rbx
___char._asctime_ptm.__return:
	leave
	ret
_tm._localtime_ptime_t:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov [rbp-8], rdi
	call tzset
	mov r10, qword[timezone]
	mov rbx, qword[rbp-8]
	sub rbx, r10
	mov rdi, rbx
	call _tm._gmtime_ptime_t
___tm._localtime_ptime_t__return:
	leave
	ret
_char._ctime_ptime_t:
	push rdi
	push rdi
	call _tm._localtime_ptime_t
	mov rbx, rax
	pop rdi
	mov rdi, rbx
	call _char._asctime_ptm.
	mov rbx, rax
	pop rdi
___char._ctime_ptime_t__return:
	ret
_void_usleep_plong:
	push rbp
	mov rbp, rsp
	sub rsp, 32
	mov [rbp-8], rdi
	mov qword[rbp-32], 0
	mov r10, qword[rbp-8]
	mov qword[rbp-24], r10
	mov rsi, 0
	lea rbx, [rbp-32]
	mov rdi, rbx
	mov rax , 35 
	mov r10 , rcx 
	syscall 
.L0xc5:
	xor rax, rax
	leave
	ret
_void_feed_pStackvoid.:
	mov qword[rdi+8], rsi
	xor rax, rax
	ret
_void_alloc_pStacksize_t:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov [rbp-8], rsi
	mov r10, qword[rbp-8]
	mov qword[rdi+16], r10
	push rdi
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _void._mapalloc_psize_t
	mov rbx, rax
	pop rdi
	mov r10, rbx
	mov qword[rdi+8], r10
	xor rax, rax
	leave
	ret
_void_destroy_pStack:
	push rdi
	mov rbx, qword[rdi+8]
	mov rdi, rbx
	call _void_mapfree_pvoid.
	mov rbx, rax
	pop rdi
	xor rax, rbx
	ret
_void_set_pVec3fdoubledoubledouble:
	movsd qword[rdi+0], xmm0
	movsd qword[rdi+8], xmm1
	movsd qword[rdi+16], xmm2
	xor rax, rax
	ret
_void_add_pVec3fVec3f.:
	vmovdqu ymm0, [rdi]
	vaddpd ymm1, ymm0, [rsi]
	vmovdqu [rdi], ymm1
	ret
_void_sub_pVec3fVec3f.:
	vmovdqu ymm0, [rdi]
	vsubpd ymm1, ymm0, [rsi]
	vmovdqu [rdi], ymm1
	ret
_void_mul_pVec3fVec3f.:
	vmovdqu ymm0, [rdi]
	vmulpd ymm1, ymm0, [rsi]
	vmovdqu [rdi], ymm1
	ret
_void_div_pVec3fVec3f.:
	vmovdqu ymm0, [rdi]
	vdivpd ymm1, ymm0, [rsi]
	vmovdqu [rdi], ymm1
	ret
_void_sqrt_pVec3f:
	sqrtsd xmm0, [rdi]  
	sqrtsd xmm1, [rdi+8] 
	sqrtsd xmm2, [rdi+16] 
	movsd [rdi], xmm0  
	movsd [rdi+8], xmm1  
	movsd [rdi+16], xmm2 
	ret
_double_dot_pVec3fVec3f.:
	movsd xmm0, [rdi]   
	movsd xmm1, [rdi+8]   
	mulsd xmm0, [rsi]   
	movsd xmm2, [rdi+16]  
	mulsd xmm1, [rsi+8]   
	mulsd xmm2, [rsi+16]  
	addsd xmm0, xmm1   
	addsd xmm0, xmm2   
	ret
_int_scanint_pchar.long.bool:
	push rbp
	mov rbp, rsp
	sub rsp, 40
	mov qword[rbp-8], 0
	mov dil, byte[rdi]
	and rdi, 0xff
	mov byte[rbp-16], dil
	mov byte[rbp-24], 0
	mov qword[rbp-32], rdi
	cmp byte[rbp-16], 45
	sete bl
	and bl, dl
	jz .L0x9e
	mov byte[rbp-24], 1
	inc rdi
	mov dil, byte[rdi]
	and rdi, 0xff
	mov byte[rbp-16], dil
	jmp .L0x9f
.L0x9e:
.L0x9f:
.L0xa0:
	mov r10, 10
	mov rbx, qword[rbp-8]
	imul rbx, r10
	mov r10b, byte[rbp-16]
	sub r10b, 48
	mov r11b, r10b
	add rbx, r11
	mov qword[rbp-8], rbx
	inc rdi
	mov dil, byte[rdi]
	and rdi, 0xff
	mov byte[rbp-16], dil
.L0xa1:
	cmp byte[rbp-16], 57
	setle bl
	cmp byte[rbp-16], 48
	setge r10b
	and bl, r10b
	jnz .L0xa0
.L0xa2:
	cmp byte[rbp-24], 0
	jne .L0xa3
	mov r10, qword[rbp-8]
	mov [rsi], r10
	jmp .L0xa4
.L0xa3:
	xor r10, r10
	sub r10, qword[rbp-8]
	mov [rsi], r10
.L0xa4:
	sub rdi, qword[rbp-32]
	mov eax, edi
___int_scanint_pchar.long.bool__return:
	leave
	ret
_int_scanstr_pchar.charchar.:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov qword[rbp-8], rdi
	jmp .L0x95
.L0x94:
	mov dil, byte[rdi]
	and rdi, 0xff
	mov [rdx], dil
	inc rdi
	inc rdx
.L0x95:
	mov dil, byte[rdi]
	and rdi, 0xff
	cmp dil, sil
	jne .L0x94
.L0x96:
	sub rdi, qword[rbp-8]
	mov eax, edi
___int_scanstr_pchar.charchar.__return:
	leave
	ret
_int_scansd_pchar.double.:
	push rbp
	mov rbp, rsp
	sub rsp, 72
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	mov rdx, 1
	lea rbx, [rbp-24]
	mov rsi, rbx
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _int_scanint_pchar.long.bool
	mov rbx, rax
	mov qword[rbp-40], rbx
	mov r10, qword[rbp-40]
	add qword[rbp-8], r10
	mov rbx, qword[rbp-8]
	mov bl, byte[rbx]
	and rbx, 0xff
	cmp bl, 46
	je .L0x8f
	mov rbx, qword[rbp-16]
	cvtsi2sd xmm7, qword[rbp-24]
	movsd [rbx], xmm7
	mov rax, qword[rbp-40]
	jmp ___int_scansd_pchar.double.__return
.L0x8f:
.L0x90:
	inc qword[rbp-8]
	xor rdx, rdx
	lea rbx, [rbp-32]
	mov rsi, rbx
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _int_scanint_pchar.long.bool
	mov rbx, rax
	mov qword[rbp-48], rbx
	mov rbx, qword[rbp-48]
	mov rsi, rbx
	mov rdi, 10
	call _long_pow_plonglong
	mov rbx, rax
	mov dword[rbp-56], ebx
	mov r10d, dword[rbp-56]
	mov rbx, qword[rbp-24]
	mov r11d, r10d
	imul rbx, r11
	mov qword[rbp-24], rbx
	mov r10, qword[rbp-32]
	mov rbx, qword[rbp-24]
	add rbx, r10
	cvtsi2sd xmm7, rbx
	movsd qword[rbp-64], xmm7
	mov rbx, qword[rbp-16]
	mov r10d, dword[rbp-56]
	cvtsi2sd xmm7, r10d
	movsd xmm8, qword[rbp-64]
	divsd xmm8, xmm7
	movsd [rbx], xmm8
	mov r10, qword[rbp-48]
	mov rbx, qword[rbp-40]
	add rbx, r10
	mov eax, ebx
___int_scansd_pchar.double.__return:
	leave
	ret
_int___SSCANF_pchar.char.void..:
	push rbp
	mov rbp, rsp
	sub rsp, 40
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	mov [rbp-24], rdx
	mov dword[rbp-32], 0
	mov rbx, qword[rbp-16]
	test rbx, rbx
	setz bl
	mov r10, qword[rbp-8]
	test r10, r10
	setz r10b
	or bl, r10b
	jz .L0x7e
	xor rax, rax
	jmp ___int___SSCANF_pchar.char.void..__return
.L0x7e:
.L0x7f:
.L0x80:
	mov rbx, qword[rbp-8]
	mov bl, byte[rbx]
	and rbx, 0xff
	cmp bl, 37
	je .L0x83
	inc qword[rbp-8]
	inc qword[rbp-16]
	jmp .L0x84
.L0x83:
	inc qword[rbp-8]
	mov rbx, qword[rbp-8]
	mov bl, byte[rbx]
	and rbx, 0xff
	mov byte[rbp-40], bl
	cmp byte[rbp-40], 105
	jne .L0x85
	mov rdx, 1
	mov r10d, dword[rbp-32]
	mov rbx, qword[rbp-24]
	and r10, 0x7fffffff
	mov rbx, [rbx+r10*8]
	mov rsi, rbx
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	call _int_scanint_pchar.long.bool
	mov rbx, rax
	mov qword[rbp-48], rbx
	mov r10, qword[rbp-48]
	add qword[rbp-16], r10
	inc qword[rbp-8]
	jmp .L0x86
.L0x85:
	cmp byte[rbp-40], 117
	jne .L0x87
	xor rdx, rdx
	mov r10d, dword[rbp-32]
	mov rbx, qword[rbp-24]
	and r10, 0x7fffffff
	mov rbx, [rbx+r10*8]
	mov rsi, rbx
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	call _int_scanint_pchar.long.bool
	mov rbx, rax
	mov qword[rbp-48], rbx
	mov r10, qword[rbp-48]
	add qword[rbp-16], r10
	inc qword[rbp-8]
	jmp .L0x88
.L0x87:
	cmp byte[rbp-40], 99
	jne .L0x89
	mov r10d, dword[rbp-32]
	mov rbx, qword[rbp-24]
	and r10, 0x7fffffff
	mov rbx, [rbx+r10*8]
	mov qword[rbp-56], rbx
	mov rbx, qword[rbp-56]
	mov r10, qword[rbp-16]
	mov r10b, byte[r10]
	and r10, 0xff
	mov [rbx], r10b
	inc qword[rbp-16]
	inc qword[rbp-8]
	jmp .L0x8a
.L0x89:
	cmp byte[rbp-40], 115
	jne .L0x8b
	inc qword[rbp-8]
	mov r10d, dword[rbp-32]
	mov rbx, qword[rbp-24]
	and r10, 0x7fffffff
	mov rbx, [rbx+r10*8]
	mov rdx, rbx
	mov rbx, qword[rbp-8]
	mov r10b, byte[rbx]
	mov sil, r10b
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	call _int_scanstr_pchar.charchar.
	mov rbx, rax
	mov qword[rbp-48], rbx
	mov r10, qword[rbp-48]
	add qword[rbp-16], r10
	jmp .L0x8c
.L0x8b:
	cmp byte[rbp-40], 102
	sete bl
	cmp byte[rbp-40], 100
	sete r10b
	or bl, r10b
	jz .L0x8d
	mov r10d, dword[rbp-32]
	mov rbx, qword[rbp-24]
	and r10, 0x7fffffff
	mov rbx, [rbx+r10*8]
	mov rsi, rbx
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	call _int_scansd_pchar.double.
	mov rbx, rax
	mov qword[rbp-48], rbx
	mov r10, qword[rbp-48]
	add qword[rbp-16], r10
	inc qword[rbp-8]
	jmp .L0x8e
.L0x8d:
.L0x8e:
.L0x8c:
.L0x8a:
.L0x88:
.L0x86:
	inc dword[rbp-32]
.L0x84:
.L0x81:
	mov rbx, qword[rbp-8]
	mov bl, byte[rbx]
	and rbx, 0xff
	test bl, bl
	jnz .L0x80
.L0x82:
	mov ebx, dword[rbp-32]
	mov eax, ebx
___int___SSCANF_pchar.char.void..__return:
	leave
	ret
_int_sscanf_pchar.char.void.void.void.void.:
	push rbp
	mov rbp, rsp
	sub rsp, 48
	mov [rbp-40], rdx
	mov r10, 1
	lea rbx, [rbp-40] 
	mov [rbx+r10*8], rcx
	mov r10, 2
	lea rbx, [rbp-40] 
	mov [rbx+r10*8], r8
	mov r10, 3
	lea rbx, [rbp-40] 
	mov [rbx+r10*8], r9
	push rdi
	push rsi
	push rdx
	push rcx
	push r8
	push r9
	lea rbx, [rbp-40]
	mov rdx, rbx
	mov rsi, rsi
	mov rdi, rdi
	call _int___SSCANF_pchar.char.void..
	mov rbx, rax
	pop r9
	pop r8
	pop rcx
	pop rdx
	pop rsi
	pop rdi
	mov eax, ebx
___int_sscanf_pchar.char.void.void.void.void.__return:
	leave
	ret
_int_getInt_pchar.:
	push rbp
	mov rbp, rsp
	sub rsp, 64
	mov [rbp-8], rdi
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	push rdi
	call _size_t_puts_pchar.
	mov rbx, rax
	pop rdi
	jmp .L0x7c
.L0x7c:
	mov rdx, 40
	mov rsi, 0
	lea rbx, [rbp-56]
	mov rdi, rbx
	call _void_memset_pvoid.ucharsize_t
	mov rdx, 40
	lea rbx, [rbp-56]
	mov rsi, rbx
	mov rdi, 0
	call _long_fgets_pFILEchar.size_t
	mov rsi, 1
	lea rbx, [rbp-56]
	mov rdi, rbx
	call _int_toInteger_pchar.bool
	mov rbx, rax
	mov eax, ebx
___int_getInt_pchar.__return:
	leave
	ret
_int_getUint_pchar.:
	push rbp
	mov rbp, rsp
	sub rsp, 64
	mov [rbp-8], rdi
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	push rdi
	call _size_t_puts_pchar.
	mov rbx, rax
	pop rdi
	jmp .L0x79
.L0x79:
	mov rdx, 40
	mov rsi, 0
	lea rbx, [rbp-56]
	mov rdi, rbx
	call _void_memset_pvoid.ucharsize_t
	mov rdx, 40
	lea rbx, [rbp-56]
	mov rsi, rbx
	mov rdi, 0
	call _long_fgets_pFILEchar.size_t
	mov rsi, 1
	lea rbx, [rbp-56]
	mov rdi, rbx
	call _int_toInteger_pchar.bool
	mov rbx, rax
	mov eax, ebx
___int_getUint_pchar.__return:
	leave
	ret
_char_getchar_p:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov rdx, 1
	lea rbx, [rbp-8]
	mov rsi, rbx
	mov rdi, 0
	call _long_fgets_pFILEchar.size_t
	mov bl, byte[rbp-8]
	mov al, bl
___char_getchar_p__return:
	leave
	ret
_void_getString_pchar.intchar.:
	push rbp
	mov rbp, rsp
	sub rsp, 32
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	mov [rbp-24], rdx
	mov rbx, qword[rbp-24]
	mov rdi, rbx
	push rdi
	call _size_t_puts_pchar.
	mov rbx, rax
	pop rdi
	jmp .L0x76
.L0x76:
	mov edx, dword[rbp-16]
	mov rbx, qword[rbp-8]
	mov rsi, rbx
	mov rdi, 0
	call _long_fgets_pFILEchar.size_t
	xor rax, rax
	leave
	ret
_int_toInteger_pchar.bool:
	push rbp
	mov rbp, rsp
	sub rsp, 32
	jmp .L0x6c
.L0x6b:
	inc rdi
.L0x6c:
	mov dil, byte[rdi]
	and rdi, 0xff
	cmp dil, 32
	je .L0x6b
.L0x6d:
	mov dil, byte[rdi]
	and rdi, 0xff
	mov byte[rbp-8], dil
	mov dword[rbp-16], 0
	mov byte[rbp-24], 0
	cmp byte[rbp-8], 45
	sete bl
	and bl, sil
	jz .L0x6e
	mov byte[rbp-24], 1
	inc rdi
	mov dil, byte[rdi]
	and rdi, 0xff
	mov byte[rbp-8], dil
	jmp .L0x6f
.L0x6e:
.L0x6f:
.L0x70:
	mov r10d, 10
	mov ebx, dword[rbp-16]
	imul ebx, r10d
	mov r10b, byte[rbp-8]
	sub r10b, 48
	mov r11b, r10b
	add ebx, r11d
	mov dword[rbp-16], ebx
	inc rdi
	mov dil, byte[rdi]
	and rdi, 0xff
	mov byte[rbp-8], dil
.L0x71:
	mov bl, byte[rbp-8]
	test bl, bl
	setnz bl
	cmp byte[rbp-8], 10
	setne r10b
	and bl, r10b
	cmp byte[rbp-8], 32
	setne r10b
	and bl, r10b
	jnz .L0x70
.L0x72:
	mov al, byte[rbp-24]
	test al, al
	jz .L0x73
	xor r10d, r10d
	sub r10d, dword[rbp-16]
	mov eax, r10d
	jmp ___int_toInteger_pchar.bool__return
.L0x73:
.L0x74:
	mov ebx, dword[rbp-16]
	mov eax, ebx
___int_toInteger_pchar.bool__return:
	leave
	ret
_int___scanf_pchar.void..fd_t:
	push rbp
	mov rbp, rsp
	sub rsp, 64
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	mov [rbp-24], rdx
	mov qword[rbp-32], 0
	mov qword[rbp-40], 0
	mov qword[rbp-48], 0
.L0x60:
	add qword[rbp-40], 1000
	mov rbx, qword[rbp-40]
	mov rsi, rbx
	mov rdi, qword[rbp-32]
	call _void._realloc_pvoid.size_t
	mov r10, rax
	mov qword[rbp-32], r10
	mov rdx, 1000
	mov r10, qword[rbp-32]
	lea r10, [r10+rbx-1000]
	mov rsi, r10
	mov rdi, qword[rbp-24]
	call _long_fgets_pFILEchar.size_t
	mov r10, rax
	mov qword[rbp-48], r10
	mov rbx, qword[rbp-40]
	sub rbx, 1000
	add rbx, qword[rbp-48]
	mov r10, qword[rbp-32]
	mov byte[r10+rbx*1], 0
	cmp qword[rbp-48], 1000
	jge .L0x60
	mov rbx, qword[rbp-16]
	mov rdx, rbx
	mov rbx, qword[rbp-32]
	mov rsi, rbx
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _int___SSCANF_pchar.char.void..
	mov r10, rax
	mov dword[rbp-56], r10d
	mov rdi, qword[rbp-32]
	call _void_free_pvoid.
	mov ebx, dword[rbp-56]
	mov eax, ebx
___int___scanf_pchar.void..fd_t__return:
	leave
	ret
_size_t_scanf_pchar.void.void.void.void.void.:
	push rbp
	mov rbp, rsp
	sub rsp, 56
	mov [rbp-48], rsi
	mov r10, 1
	lea rbx, [rbp-48] 
	mov [rbx+r10*8], rdx
	mov r10, 2
	lea rbx, [rbp-48] 
	mov [rbx+r10*8], rcx
	mov r10, 3
	lea rbx, [rbp-48] 
	mov [rbx+r10*8], r8
	mov r10, 4
	lea rbx, [rbp-48] 
	mov [rbx+r10*8], r9
	push rdi
	push rsi
	push rdx
	push rcx
	push r8
	push r9
	xor rdx, rdx
	lea rbx, [rbp-48]
	mov rsi, rbx
	mov rdi, rdi
	call _int___scanf_pchar.void..fd_t
	mov rbx, rax
	pop r9
	pop r8
	pop rcx
	pop rdx
	pop rsi
	pop rdi
___size_t_scanf_pchar.void.void.void.void.void.__return:
	leave
	ret
_size_t_fscanf_pfd_tchar.void.void.void.void.:
	push rbp
	mov rbp, rsp
	sub rsp, 48
	mov [rbp-40], rdx
	mov r10, 1
	lea rbx, [rbp-40] 
	mov [rbx+r10*8], rcx
	mov r10, 2
	lea rbx, [rbp-40] 
	mov [rbx+r10*8], r8
	mov r10, 3
	lea rbx, [rbp-40] 
	mov [rbx+r10*8], r9
	push rdi
	push rsi
	push rdx
	push rcx
	push r8
	push r9
	mov rdx, rdi
	lea rbx, [rbp-40]
	mov rdi, rsi
	call _int___scanf_pchar.void..fd_t
	mov rbx, rax
	pop r9
	pop r8
	pop rcx
	pop rdx
	pop rsi
	pop rdi
___size_t_fscanf_pfd_tchar.void.void.void.void.__return:
	leave
	ret
_long_system_pchar.:
	push rbp
	mov rbp, rsp
	sub rsp, 32
	mov [rbp-8], rdi
	mov rax , 57 
	mov r10 , rcx 
	syscall 
.L0x4c:
	mov r10, rax
	mov qword[rbp-16], r10
	mov rbx, qword[rbp-16]
	test rbx, rbx
	jnz .L0x4f
	mov r10b, 2
	mov rbx, __systemcallargvconst
	and r10, 0xff
	lea rbx, [rbx+r10*8]
	mov r11, qword[rbp-8]
	mov [rbx], r11
	mov rdx, __emptyenv
	mov rsi, __systemcallargvconst
	mov rdi, __systembashpath
	mov rax , 59 
	mov r10 , rcx 
	syscall 
.L0x55:
	mov r10, rax
	mov qword[rbp-24], r10
	mov rbx, qword[rbp-24]
	mov rdi, rbx
	call _char._strerror_plong
	mov rdi, rax
	push rdi
	call _size_t_puts_pchar.
	mov rbx, rax
	pop rdi
	jmp .L0x58
.L0x58:
.L0x4f:
.L0x50:
	xor rdx, rdx
	xor rsi, rsi
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	mov rax, 61
	xor r8, r8
	syscall
.L0x5e:
	xor rax, rax
___long_system_pchar.__return:
	leave
	ret
_void_mutex_cmpxchg_pmutex.intint:
	push rbp
	mov rbp, rsp
	sub rsp, 40
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	mov [rbp-24], rdx
	lea rbx, [rbp-16]
	mov qword[rbp-32], rbx
	mov ebx, dword[rbp-24]
	mov edx, ebx
	mov rbx, qword[rbp-32]
	mov rsi, rbx
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	mov eax, [rsi]
	lock cmpxchg dword[rdi], edx
	jz .L0x4a__end
	mov eax, [rdi]
	mov [rsi], eax
.L0x4a__end:
.L0x49:
	mov rbx, qword[rbp-32]
	mov ebx, dword[rbx]
	and rbx, 0x7fffffff
	mov rax, rbx
___void_mutex_cmpxchg_pmutex.intint__return:
	leave
	ret
_void_mlock_pmutex.:
	push rbp
	mov rbp, rsp
	sub rsp, 24
	mov [rbp-8], rdi
	mov rdx, 1
	mov rsi, 0
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _void_mutex_cmpxchg_pmutex.intint
	mov rbx, rax
	mov dword[rbp-16], ebx
	mov ebx, dword[rbp-16]
	test ebx, ebx
	jz .L0x30
	jmp .L0x33
.L0x32:
	mov rdx, 2
	mov rsi, 1
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _void_mutex_cmpxchg_pmutex.intint
	push rax
	cmp dword[rbp-16], 2
	sete bl
	pop r10
	test r10, r10
	setnz r10b
	or bl, r10b
	jz .L0x35
	mov rdx, 2
	mov rsi, 0
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	push rdi
	push rsi
	push rdx
	xor r9, r9
	xor r8, r8
	xor rcx, rcx
	mov rax , 202 
	mov r10 , rcx 
	syscall 
.L0x3d:
	mov rbx, rax
	pop rdx
	pop rsi
	pop rdi
	jmp .L0x38
.L0x38:
.L0x35:
.L0x36:
	mov rdx, 2
	mov rsi, 0
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _void_mutex_cmpxchg_pmutex.intint
	mov rbx, rax
	mov dword[rbp-16], ebx
	mov ebx, dword[rbp-16]
	test ebx, ebx
	jnz .L0x40
	mov rdi, LC.S172
	push rdi
	call _size_t_puts_pchar.
	mov rbx, rax
	pop rdi
	jmp .L0x43
.L0x43:
.L0x40:
.L0x41:
.L0x33:
.L0x34:
.L0x30:
.L0x31:
	xor rax, rax
	leave
	ret
_void_munlock_pmutex.:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov [rbp-8], rdi
	mov rsi, 1
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	xor rax, rax
	xchg eax, [rdi]
	lock sub dword[rdi], esi
.L0x1d:
	push rax
	mov r10d, 1
	pop rbx
	cmp ebx, r10d
	je .L0x1f
	xor rsi, rsi
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	lock xchg dword[rdi], esi
.L0x25:
	mov rdx, 2
	mov rsi, 0
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	push rdi
	push rsi
	push rdx
	xor r9, r9
	xor r8, r8
	xor rcx, rcx
	mov rax , 202 
	mov r10 , rcx 
	syscall 
.L0x2d:
	mov rbx, rax
	pop rdx
	pop rsi
	pop rdi
	jmp .L0x28
.L0x28:
.L0x1f:
.L0x20:
	xor rax, rax
	leave
	ret
_void___thrdext_plong:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov [rbp-8], rdi
	mov rdi, rsp
	call _void_free_pvoid.
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	mov rax , 60 
	mov r10 , rcx 
	syscall 
.L0x17:
	leave
	ret
_long_thrdcrt_pvoid.thread_t.void.:
	mov r15, rdi
	mov r14, rsi
	mov r13, rdx
	call _void.___crtstack_p
	lea rsi, [rax + 65536 - 8]
	mov rdi, [clone_threadflags]
	mov rax, 56
	syscall
	test rax, rax
	jnz .L0x11__end
	mov rdi, r15
	mov rsi, r14
	mov rdx, r13
	call _long___enterthread_p__threadcallablethread_t.void.
	mov rdi, rax
	call _void___thrdext_plong
.L0x11__end:
	ret
_void.___crtstack_p:
	mov r9, 0
	mov r8, 0
	mov rcx, 16777250
	mov rdx, 3
	mov rsi, 65536
	mov rdi, 0
	mov rax, 9
	mov r10, rcx
	syscall
.L0xe:
	mov rax, rax
___void.___crtstack_p__return:
	ret
_long___enterthread_p__threadcallablethread_t.void.:
	push rbp
	mov rbp, rsp
	sub rsp, 40
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	mov [rbp-24], rdx
	mov rbx, qword[rbp-24]
	mov rdi, rbx
	call qword[rbp-8]
	mov r10, rax
	mov qword[rbp-32], r10
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	call _void_munlock_pmutex.
	mov rbx, qword[rbp-32]
	mov rax, rbx
___long___enterthread_p__threadcallablethread_t.void.__return:
	leave
	ret
_void_thread_create_pthread_t.__threadcallablevoid.:
	push rbp
	mov rbp, rsp
	sub rsp, 32
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	mov [rbp-24], rdx
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _void_mlock_pmutex.
	mov rbx, qword[rbp-24]
	mov rdx, rbx
	mov rbx, qword[rbp-8]
	mov rsi, rbx
	mov rdi, qword[rbp-16]
	call _long_thrdcrt_pvoid.thread_t.void.
	push rax
	mov rbx, qword[rbp-8]
	lea rbx, [rbx+12]
	pop r11
	mov [rbx], r11
	mov rbx, qword[rbp-8]
	lea rbx, [rbx+4]
	mov r11, qword[rbp-16]
	mov [rbx], r11
	xor rax, rax
	leave
	ret
_void_thread_join_pthread_t.:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov [rbp-8], rdi
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _void_mlock_pmutex.
	xor rax, rax
	leave
	ret
_double_test_p:
	ret
main:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov [rbp-8], rdi
	cvtsi2sd xmm0 , dword[rbp-8]
	call _double_test_p
	movq rax, xmm0
	mov rsi, rax
	mov rdi, LC.S174
	call printf
	leave
	ret
	