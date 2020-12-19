global _char._get_errstr_pvoid:
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
global _fd_t_fopen_pchar.char.:
global _size_t_fputs_pfd_tchar.:
global _size_t_puts_pchar.:
global _long_fgets_pfd_tchar.size_t:
global _void._floads_pfd_t:
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
	global sscanf
global _int___SSCANF_pchar.char.void..:
	global sscanf
	extern sscanf
	extern sscanf
	extern sscanf
	extern sscanf
	global scanf
	global fscanf
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
LC.S0: db `Operation not permitted`, 0
LC.S1: db `No such file or directory`, 0
LC.S2: db `No such process`, 0
LC.S3: db `Interrupted system call`, 0
LC.S4: db `I/O error`, 0
LC.S5: db `No such device or address`, 0
LC.S6: db `Argument list too long`, 0
LC.S7: db `Exec format error`, 0
LC.S8: db `Bad file number`, 0
LC.S9: db `No child processes`, 0
LC.S10: db `Try again`, 0
LC.S11: db `Out of memory`, 0
LC.S12: db `Permission denied`, 0
LC.S13: db `Bad address`, 0
LC.S14: db `Block device required`, 0
LC.S15: db `Device or resource busy`, 0
LC.S16: db `File exists`, 0
LC.S17: db `Cross-device link`, 0
LC.S18: db `No such device`, 0
LC.S19: db `Not a directory`, 0
LC.S20: db `Is a directory`, 0
LC.S21: db `Invalid argument`, 0
LC.S22: db `File table overflow`, 0
LC.S23: db `Too many open files`, 0
LC.S24: db `Not a typewriter`, 0
LC.S25: db `Text file busy`, 0
LC.S26: db `File too large`, 0
LC.S27: db `No space left on device`, 0
LC.S28: db `Illegal seek`, 0
LC.S29: db `Read-only file system`, 0
LC.S30: db `Too many links`, 0
LC.S31: db `Broken pipe`, 0
LC.S32: db `Math argument out of domain of func`, 0
LC.S33: db `Math result not representable`, 0
LC.S34: db `Resource deadlock would occur`, 0
LC.S35: db `File name too long`, 0
LC.S36: db `No record locks available`, 0
LC.S37: db `Function not implemented`, 0
LC.S38: db `Directory not empty`, 0
LC.S39: db `Too many symbolic links encountered`, 0
LC.S40: db `No message of desired type`, 0
LC.S41: db `Identifier removed`, 0
LC.S42: db `Channel number out of range`, 0
LC.S43: db `Level 2 not synchronized`, 0
LC.S44: db `Level 3 halted`, 0
LC.S45: db `Level 3 reset`, 0
LC.S46: db `Link number out of range`, 0
LC.S47: db `Protocol driver not attached`, 0
LC.S48: db `No CSI structure available`, 0
LC.S49: db `Level 2 halted`, 0
LC.S50: db `Invalid exchange`, 0
LC.S51: db `Invalid request descriptor`, 0
LC.S52: db `Exchange full`, 0
LC.S53: db `No anode`, 0
LC.S54: db `Invalid request code`, 0
LC.S55: db `Invalid slot`, 0
LC.S56: db `Bad font file format`, 0
LC.S57: db `Device not a stream`, 0
LC.S58: db `No data available`, 0
LC.S59: db `Timer expired`, 0
LC.S60: db `Out of streams resources`, 0
LC.S61: db `Machine is not on the network`, 0
LC.S62: db `Package not installed`, 0
LC.S63: db `Object is remote`, 0
LC.S64: db `Link has been severed`, 0
LC.S65: db `Advertise error`, 0
LC.S66: db `Srmount error`, 0
LC.S67: db `Communication error on send`, 0
LC.S68: db `Protocol error`, 0
LC.S69: db `Multihop attempted`, 0
LC.S70: db `RFS specific error`, 0
LC.S71: db `Not a data message`, 0
LC.S72: db `Value too large for defined data type`, 0
LC.S73: db `Name not unique on network`, 0
LC.S74: db `File descriptor in bad state`, 0
LC.S75: db `Remote address changed`, 0
LC.S76: db `Can not access a needed shared library`, 0
LC.S77: db `Accessing a corrupted shared library`, 0
LC.S78: db `.lib section in a.out corrupted`, 0
LC.S79: db `Attempting to link in too many shared libraries`, 0
LC.S80: db `Cannot exec a shared library directly`, 0
LC.S81: db `Illegal byte sequence`, 0
LC.S82: db `Interrupted system call should be restarted`, 0
LC.S83: db `Streams pipe error`, 0
LC.S84: db `Too many users`, 0
LC.S85: db `Socket operation on non-socket`, 0
LC.S86: db `Destination address required`, 0
LC.S87: db `Message too long`, 0
LC.S88: db `Protocol wrong type for socket`, 0
LC.S89: db `Protocol not available`, 0
LC.S90: db `Protocol not supported`, 0
LC.S91: db `Socket type not supported`, 0
LC.S92: db `Operation not supported on transport endpoint`, 0
LC.S93: db `Protocol family not supported`, 0
LC.S94: db `Address family not supported by protocol`, 0
LC.S95: db `Address already in use`, 0
LC.S96: db `Cannot assign requested address`, 0
LC.S97: db `Network is down`, 0
LC.S98: db `Network is unreachable`, 0
LC.S99: db `Network dropped connection because of reset`, 0
LC.S100: db `Software caused connection abort`, 0
LC.S101: db `Connection reset by peer`, 0
LC.S102: db `No buffer space available`, 0
LC.S103: db `Transport endpoint is already connected`, 0
LC.S104: db `Transport endpoint is not connected`, 0
LC.S105: db `Cannot send after transport endpoint shutdown`, 0
LC.S106: db `Too many references: cannot splice`, 0
LC.S107: db `Connection timed out`, 0
LC.S108: db `Connection refused`, 0
LC.S109: db `Host is down`, 0
LC.S110: db `No route to host`, 0
LC.S111: db `Operation already in progress`, 0
LC.S112: db `Operation now in progress`, 0
LC.S113: db `Stale NFS file handle`, 0
LC.S114: db `Structure needs cleaning`, 0
LC.S115: db `Not a XENIX named type file`, 0
LC.S116: db `No XENIX semaphores available`, 0
LC.S117: db `Is a named type file`, 0
LC.S118: db `Remote I/O error`, 0
LC.S119: db `Quota exceeded`, 0
LC.S120: db `No medium found`, 0
LC.S121: db `Wrong medium type`, 0
LC.S122: db `Operation Canceled`, 0
LC.S123: db `Required key not available`, 0
LC.S124: db `Key has expired`, 0
LC.S125: db `Key has been revoked`, 0
LC.S126: db `Key was rejected by service`, 0
LC.S127: db `Owner died`, 0
LC.S128: db `State not recoverable`, 0
LC.S129: db `Unkown Error Code.`, 0
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
LC.S130: db `0123456789abcdef`, 0
LC.S131: db `QNaN`, 0
LC.S132: db `SNaN`, 0
LC.S133: db `NaN`, 0
LC.S134: db `Inf`, 0
LC.S135: db `-Inf`, 0
LC.S136: db `False`, 0
LC.S137: db `True`, 0
LC.S138: db `%s:%i: Assertion '%s' failed.\n`, 0
LC.S139: db `=======================\n`, 0
LC.S140: db `EMPTY\n`, 0
LC.S141: db `BLOCK: %i @ %x : %i\n`, 0
LC.S142: db `Appends: %i, Deletions %i, Cache: %u\n`, 0
LC.S143: db `=======================\n`, 0
LC.S144: db `Malloc:%i: Bad mmap: `, 0
LC.S145: db `Sun`, 0
LC.S146: db `Mon`, 0
LC.S147: db `Tue`, 0
LC.S148: db `Wed`, 0
LC.S149: db `Thu`, 0
LC.S150: db `Fri`, 0
LC.S151: db `Sat`, 0
LC.S152: db `Jan`, 0
LC.S153: db `Feb`, 0
LC.S154: db `Mar`, 0
LC.S155: db `Apr`, 0
LC.S156: db `May`, 0
LC.S157: db `Jun`, 0
LC.S158: db `Jul`, 0
LC.S159: db `Aug`, 0
LC.S160: db `Sep`, 0
LC.S161: db `Oct`, 0
LC.S162: db `Nov`, 0
LC.S163: db `Dec`, 0
LC.F28: dq 0x1.6d40000000000p+8
LC.F29: dq 0x1.6d40000000000p+8
LC.S164: db `%i `, 0
LC.S165: db `%i:%i:%i %i`, 0
LC.S166: db `/bin/bash`, 0
LC.S167: db `PATH=/bin:/usr/bin:/sbin:/usr/sbin`, 0
LC.S168: db `sudo`, 0
LC.S169: db `-c`, 0
LC.S170: db `LOCKED`, 0
LC.S171: db `%f\n`, 0
LC.S172: db `123hd0.5: \t %i%s%f`, 0
LC.S173: db `hd`, 0
LC.F30: dq 0x1.0000000000000p-1
__linux_errstrlist: DQ LC.S0, LC.S1, LC.S2, LC.S3, LC.S4, LC.S5, LC.S6, LC.S7, LC.S8, LC.S9, LC.S10, LC.S11, LC.S12, LC.S13, LC.S14, LC.S15, LC.S16, LC.S17, LC.S18, LC.S19, LC.S20, LC.S21, LC.S22, LC.S23, LC.S24, LC.S25, LC.S26, LC.S27, LC.S28, LC.S29, LC.S30, LC.S31, LC.S32, LC.S33, LC.S34, LC.S35, LC.S36, LC.S37, LC.S38, LC.S39, LC.S40, LC.S41, LC.S42, LC.S43, LC.S44, LC.S45, LC.S46, LC.S47, LC.S48, LC.S49, LC.S50, LC.S51, LC.S52, LC.S53, LC.S54, LC.S55, LC.S56, LC.S57, LC.S58, LC.S59, LC.S60, LC.S61, LC.S62, LC.S63, LC.S64, LC.S65, LC.S66, LC.S67, LC.S68, LC.S69, LC.S70, LC.S71, LC.S72, LC.S73, LC.S74, LC.S75, LC.S76, LC.S77, LC.S78, LC.S79, LC.S80, LC.S81, LC.S82, LC.S83, LC.S84, LC.S85, LC.S86, LC.S87, LC.S88, LC.S89, LC.S90, LC.S91, LC.S92, LC.S93, LC.S94, LC.S95, LC.S96, LC.S97, LC.S98, LC.S99, LC.S100, LC.S101, LC.S102, LC.S103, LC.S104, LC.S105, LC.S106, LC.S107, LC.S108, LC.S109, LC.S110, LC.S111, LC.S112, LC.S113, LC.S114, LC.S115, LC.S116, LC.S117, LC.S118, LC.S119, LC.S120, LC.S121, LC.S122, LC.S123, LC.S124, LC.S125, LC.S126, LC.S127, LC.S128
M_MINZERO_MEM: DQ 0x0.0p+0
__numbercharactersbase1016: DQ "0123456789abcdef"
malloc_maxcache: DQ 524288
free_head: DQ 0
cached_size: DQ 0
appends: DQ 0
deletions: DQ 0
rand_next: DQ 1
mdays: DD 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31
wday_name: DQ LC.S145, LC.S146, LC.S147, LC.S148, LC.S149, LC.S150, LC.S151
mon_name: DQ LC.S152, LC.S153, LC.S154, LC.S155, LC.S156, LC.S157, LC.S158, LC.S159, LC.S160, LC.S161, LC.S162, LC.S163
asctime__result_buf: DB 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 0
__systembashpath: DQ "/bin/bash"
__emptyenv: DQ LC.S167, 0, 0
__systemcallargvconst: DQ LC.S168, LC.S169, 0, 0
clone_threadflags: DQ 4001553
	section .bss
	align 16
__tmbuf: resb 36
__internaltime: resb 8
	section .text
	align 8
	global main
_char._get_errstr_pvoid:
	cmp rdi, 131
	setl bl
	xor r11, r11
	cmp rdi, r11
	setge r10b
	and bl, r10b
	jz .L0x28b
	mov r10, rdi
	mov rbx, __linux_errstrlist
	mov rbx, [rbx+r10*8]
	mov rax, rbx
	jmp ___char._get_errstr_pvoid__return
	jmp .L0x28c
.L0x28b:
.L0x28c:
	mov rax, LC.S129
___char._get_errstr_pvoid__return:
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
	mov dword[rbp-16], 1
	mov dword[rbp-24], 0
	mov dword[rbp-32], 0
	mov dword[rbp-40], 0
	lea rbx, [rbp-40]
	mov rcx, rbx
	lea rbx, [rbp-32]
	mov rdx, rbx
	lea rbx, [rbp-24]
	mov rsi, rbx
	lea rbx, [rbp-16]
	mov rdi, rbx
	call _void_native_cpuid_pcpuidreg_t.cpuidreg_t.cpuidreg_t.cpuidreg_t.
	mov ebx, dword[rbp-32]
	shl ebx, 32
	add ebx, dword[rbp-40]
	xor r10, r10
	mov r10d, ebx
	mov qword[rbp-48], r10
	mov r10, 1
	mov rbx, qword[rbp-8]
	mov rax, rcx
	mov cl, bl
	shl r10, cl
	mov rcx, rax
	mov qword[rbp-56], r10
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
	mov dword[rbp-16], 7
	mov dword[rbp-24], 0
	mov dword[rbp-32], 0
	mov dword[rbp-40], 0
	mov r10, 3
	mov rbx, qword[rbp-8]
	and rbx, r10
	mov r10, rbx
	mov dword[rbp-48], r10d
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
	mov r10d, dword[rbp-48]
	xor rax, rax
	mov eax, r10d
	mov ebx, [rbx+rax*4]
	mov dword[rbp-48], ebx
	mov r10, 1
	mov rbx, qword[rbp-8]
	mov rax, rcx
	mov cl, bl
	shl r10, cl
	mov rcx, rax
	mov ebx, dword[rbp-48]
	xor r10, r10
	mov r10d, ebx
	and r10, r10
	mov rbx, qword[rbp-8]
	mov rax, rcx
	mov cl, bl
	shr r10, cl
	mov rcx, rax
	mov al, r10b
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
	add r11, r10
	mov rbx, r11
	mov r11, qword[rbp-8]
	mov qword[rbp-40], r11
	jmp .L0x27e
.L0x27d:
	mov r10, qword[rbp-40]
	mov r10, qword[r10]
	mov rdi, r10
	call qword[rbp-32]
	cmp rax, 0
	jne .L0x281
	xor rax, rax
	jmp ___bool_all_of_raw_piterablesize_tsize_tvoid.__return
	jmp .L0x282
.L0x281:
.L0x282:
.L0x27f:
	mov r11, qword[rbp-16]
	add qword[rbp-40], r11
.L0x27e:
	cmp qword[rbp-40], rbx
	jl .L0x27d
.L0x280:
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
	add r11, r10
	mov rbx, r11
	mov r11, qword[rbp-8]
	mov qword[rbp-40], r11
	jmp .L0x278
.L0x277:
	mov r10, qword[rbp-40]
	mov r10, qword[r10]
	mov rdi, r10
	call qword[rbp-32]
	mov rbx, rax
	test rbx, rbx
	jz .L0x27b
	mov rax, 1
	jmp ___bool_any_of_raw_piterablesize_tsize_tvoid.__return
	jmp .L0x27c
.L0x27b:
.L0x27c:
.L0x279:
	mov r11, qword[rbp-16]
	add qword[rbp-40], r11
.L0x278:
	cmp qword[rbp-40], rbx
	jl .L0x277
.L0x27a:
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
	add r11, r10
	mov rbx, r11
	mov r11, qword[rbp-8]
	mov qword[rbp-40], r11
	jmp .L0x272
.L0x271:
	mov r10, qword[rbp-40]
	mov r10, qword[r10]
	mov rdi, r10
	call qword[rbp-32]
	mov rbx, rax
	test rbx, rbx
	jz .L0x275
	xor rax, rax
	jmp ___bool_none_of_raw_piterablesize_tsize_tvoid.__return
	jmp .L0x276
.L0x275:
.L0x276:
.L0x273:
	mov r11, qword[rbp-16]
	add qword[rbp-40], r11
.L0x272:
	cmp qword[rbp-40], rbx
	jl .L0x271
.L0x274:
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
	push rbp
	mov rbp, rsp
	sub rsp, 16
	movsd [rbp-8], xmm0
	movsd xmm8, qword[LC.F1]
	movsd xmm7, qword[rbp-8]
	subsd xmm7, xmm8
	movsd xmm0, xmm7
	roundsd xmm0, xmm0, 0  
	cvttsd2si rax, xmm0
.L0x26a:
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
.L0x261_long_lop2_plong_flp:
	sar rdi, 1
	inc rax
	test rdi, rdi
	jnz .L0x261_long_lop2_plong_flp
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
	mov rbx, 6
	cvtsi2sd xmm8, rbx
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
	mov rbx, 120
	cvtsi2sd xmm9, rbx
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
	mov rbx, 5040
	cvtsi2sd xmm9, rbx
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
	mov rbx, 362880
	cvtsi2sd xmm9, rbx
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
	xor rbx, rbx
	movsd xmm7, qword[rbp-8]
	cvtsi2sd xmm8, rbx
	comisd xmm7, xmm8
	je .L0x25a
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
	jmp ___double_sin_pdouble__return
	jmp .L0x25b
.L0x25a:
.L0x25b:
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
	je .L0x258
	movsd xmm8, qword[LC.F3]
	movsd xmm7, qword[rbp-8]
	addsd xmm7, xmm8
	movsd xmm0, xmm7
	call _double_sin_pdouble
	jmp ___double_cos_pdouble__return
	jmp .L0x259
.L0x258:
.L0x259:
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
	je .L0x256
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
	jmp .L0x257
.L0x256:
.L0x257:
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
	je .L0x254
	movsd xmm7, qword[rbp-8]
	movsd xmm0, xmm7
	call _double_tan_pdouble
	movsd xmm8, xmm0
	movsd xmm7, qword[LC.F4]
	divsd xmm7, xmm8
	movsd xmm0, xmm7
	jmp ___double_cot_pdouble__return
	jmp .L0x255
.L0x254:
.L0x255:
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
	je .L0x252
	movsd xmm7, qword[rbp-8]
	movsd xmm0, xmm7
	call _double_cos_pdouble
	movsd xmm8, xmm0
	movsd xmm7, qword[LC.F5]
	divsd xmm7, xmm8
	movsd xmm0, xmm7
	jmp ___double_sec_pdouble__return
	jmp .L0x253
.L0x252:
.L0x253:
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
	je .L0x250
	movsd xmm7, qword[rbp-8]
	movsd xmm0, xmm7
	call _double_sin_pdouble
	movsd xmm8, xmm0
	movsd xmm7, qword[LC.F6]
	divsd xmm7, xmm8
	movsd xmm0, xmm7
	jmp ___double_csc_pdouble__return
	jmp .L0x251
.L0x250:
.L0x251:
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
	movsd xmm8, qword[LC.F8]
	divsd xmm7, xmm8
	movsd xmm8, qword[LC.F7]
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
	movsd xmm9, qword[LC.F10]
	divsd xmm8, xmm9
	movsd xmm9, qword[LC.F9]
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
	movsd xmm9, qword[LC.F12]
	divsd xmm8, xmm9
	movsd xmm9, qword[LC.F11]
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
	movsd xmm9, qword[LC.F14]
	divsd xmm8, xmm9
	movsd xmm9, qword[LC.F13]
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
	mov rbx, -1
	movsd xmm7, qword[rbp-8]
	cvtsi2sd xmm8, rbx
	comisd xmm7, xmm8
	setl r10b
	mov rbx, 1
	movsd xmm7, qword[rbp-8]
	cvtsi2sd xmm8, rbx
	comisd xmm7, xmm8
	setg r11b
	or r10b, r11b
	jz .L0x24e
	mov rax, 9221120237041090561
	movq xmm0, rax
	jmp ___double_asin_pdouble__return
	jmp .L0x24f
.L0x24e:
.L0x24f:
	movsd xmm7, qword[rbp-8]
	movsd xmm0, xmm7
	call _double_taylor_asin_pdouble
___double_asin_pdouble__return:
	leave
	ret
_double_acos_pdouble:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	movsd [rbp-8], xmm0
	mov rbx, -1
	movsd xmm7, qword[rbp-8]
	cvtsi2sd xmm8, rbx
	comisd xmm7, xmm8
	setl r10b
	mov rbx, 1
	movsd xmm7, qword[rbp-8]
	cvtsi2sd xmm8, rbx
	comisd xmm7, xmm8
	setg r11b
	or r10b, r11b
	jz .L0x24c
	mov rax, 9221120237041090561
	movq xmm0, rax
	jmp ___double_acos_pdouble__return
	jmp .L0x24d
.L0x24c:
.L0x24d:
	movsd xmm7, qword[rbp-8]
	movsd xmm0, xmm7
	call _double_taylor_asin_pdouble
	movsd xmm8, xmm0
	movsd xmm7, qword[LC.F3]
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
	mov rbx, -1
	movsd xmm7, qword[rbp-8]
	cvtsi2sd xmm8, rbx
	comisd xmm7, xmm8
	jne .L0x240
	xor rbx, rbx
	movsd xmm7, qword[LC.F15]
	cvtsi2sd xmm8, rbx
	subsd xmm8, xmm7
	movsd xmm0, xmm8
	jmp ___double_atan_pdouble__return
	jmp .L0x241
.L0x240:
	mov rbx, 1
	movsd xmm7, qword[rbp-8]
	cvtsi2sd xmm8, rbx
	comisd xmm7, xmm8
	jne .L0x242
	movsd xmm7, qword[LC.F15]
	movsd xmm0, xmm7
	jmp ___double_atan_pdouble__return
	jmp .L0x243
.L0x242:
	xor rbx, rbx
	movsd xmm7, qword[rbp-8]
	cvtsi2sd xmm8, rbx
	comisd xmm7, xmm8
	jne .L0x244
	xor rax, rax
	cvtsi2sd xmm0, rax
	jmp ___double_atan_pdouble__return
	jmp .L0x245
.L0x244:
	mov rbx, 1
	movsd xmm7, qword[rbp-8]
	cvtsi2sd xmm8, rbx
	comisd xmm7, xmm8
	setle r10b
	mov rbx, -1
	movsd xmm7, qword[rbp-8]
	cvtsi2sd xmm8, rbx
	comisd xmm7, xmm8
	setge r11b
	and r10b, r11b
	jz .L0x246
	movsd xmm8, qword[rbp-8]
	movsd xmm7, qword[rbp-8]
	mulsd xmm7, xmm8
	movsd xmm8, qword[rbp-8]
	mulsd xmm7, xmm8
	movsd xmm8, qword[LC.F16]
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
	movsd xmm9, qword[LC.F17]
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
	movsd xmm9, qword[LC.F18]
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
	movsd xmm9, qword[LC.F19]
	divsd xmm7, xmm9
	addsd xmm8, xmm7
	movsd xmm0, xmm8
	jmp ___double_atan_pdouble__return
	jmp .L0x247
.L0x246:
	mov rbx, -1
	movsd xmm7, qword[rbp-8]
	cvtsi2sd xmm8, rbx
	comisd xmm7, xmm8
	jge .L0x248
	xor rbx, rbx
	movsd xmm7, qword[LC.F3]
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
	movsd xmm9, qword[LC.F21]
	mulsd xmm9, xmm7
	movsd xmm7, qword[LC.F20]
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
	movsd xmm9, qword[LC.F23]
	mulsd xmm9, xmm7
	movsd xmm7, qword[LC.F22]
	divsd xmm7, xmm9
	subsd xmm8, xmm7
	movsd xmm0, xmm8
	jmp ___double_atan_pdouble__return
	jmp .L0x249
.L0x248:
	mov rbx, 1
	movsd xmm7, qword[rbp-8]
	cvtsi2sd xmm8, rbx
	comisd xmm7, xmm8
	jle .L0x24a
	mov rbx, 1
	movsd xmm7, qword[rbp-8]
	cvtsi2sd xmm8, rbx
	divsd xmm8, xmm7
	movsd xmm7, qword[LC.F3]
	subsd xmm7, xmm8
	movsd xmm9, qword[rbp-8]
	movsd xmm8, qword[rbp-8]
	mulsd xmm8, xmm9
	movsd xmm9, qword[rbp-8]
	mulsd xmm8, xmm9
	movsd xmm9, qword[LC.F25]
	mulsd xmm9, xmm8
	movsd xmm8, qword[LC.F24]
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
	movsd xmm9, qword[LC.F27]
	mulsd xmm9, xmm8
	movsd xmm8, qword[LC.F26]
	divsd xmm8, xmm9
	subsd xmm7, xmm8
	movsd xmm0, xmm7
	jmp ___double_atan_pdouble__return
	jmp .L0x24b
.L0x24a:
.L0x24b:
.L0x249:
.L0x247:
.L0x245:
.L0x243:
.L0x241:
	mov rax, 9221120237041090561
	movq xmm0, rax
___double_atan_pdouble__return:
	leave
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
	jmp .L0x22c
.L0x22b:
	mov r10, rdi
	cmp byte[r10], sil
	jne .L0x22e
	mov rax, rdi
	jmp ___char._memchr_pchar.charsize_t__return
	jmp .L0x22f
.L0x22e:
.L0x22f:
	inc rdi
.L0x22c:
	cmp rdi, rbx
	jl .L0x22b
.L0x22d:
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
	jmp .L0x222
.L0x221:
	mov r11, rdi
	mov r12, rsi
	mov r11b, byte[r11]
	cmp r11b, byte[r12]
	jge .L0x224
	dec ebx
	jmp .L0x225
.L0x224:
	inc ebx
.L0x225:
	inc rdi
	inc rsi
.L0x222:
	cmp rdi, r10
	jl .L0x221
.L0x223:
	mov eax, ebx
___int_memcmp_pchar.char.size_t__return:
	leave
	ret
_char._strchr_pchar.char:
	jmp .L0x218
.L0x217:
	mov rbx, rdi
	cmp byte[rbx], sil
	jne .L0x21a
	mov rax, rdi
	jmp ___char._strchr_pchar.char__return
	jmp .L0x21b
.L0x21a:
.L0x21b:
	inc rdi
.L0x218:
	mov rbx, rdi
	mov bl, byte[rbx]
	test bl, bl
	jnz .L0x217
.L0x219:
	xor rax, rax
___char._strchr_pchar.char__return:
	ret
_char._strerror_plong:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov [rbp-8], rdi
	cmp qword[rbp-8], 0
	jl .L0x210
	mov rdi, qword[rbp-8]
	call _char._get_errstr_pvoid
	jmp ___char._strerror_plong__return
	jmp .L0x211
.L0x210:
	xor r10, r10
	sub r10, qword[rbp-8]
	mov rdi, r10
	call _char._get_errstr_pvoid
	jmp ___char._strerror_plong__return
.L0x211:
	xor rax, rax
___char._strerror_plong__return:
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
	xor rbx, rbx
	mov ebx, dword[rbp-8]
	add rdi, rbx
	mov dword[rbp-16], 0
	jmp .L0x20b
.L0x20a:
	mov r10, 1
	mov rbx, rsi
	and rbx, r10
	jz .L0x20e
	mov rbx, rdi
	mov byte[rbx], 49
	jmp .L0x20f
.L0x20e:
	mov rbx, rdi
	mov byte[rbx], 48
.L0x20f:
	shr rsi, 1
	dec rdi
.L0x20c:
	inc dword[rbp-16]
.L0x20b:
	mov r10d, dword[rbp-8]
	cmp dword[rbp-16], r10d
	jl .L0x20a
.L0x20d:
	mov eax, dword[rbp-8]
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
	jne .L0x1e8
	mov rsi, LC.S131
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	call _long_strcpy_pchar.char.
	mov rax, 4
	jmp ___long_toStr_pdoublechar.long__return
	jmp .L0x1e9
.L0x1e8:
	movsd xmm7, qword[rbp-8]
	movq rbx, xmm7
	mov r10, 9218868437227405313
	cmp rbx, r10
	jne .L0x1ea
	mov rsi, LC.S132
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	call _long_strcpy_pchar.char.
	mov rax, 4
	jmp ___long_toStr_pdoublechar.long__return
	jmp .L0x1eb
.L0x1ea:
	movsd xmm7, qword[rbp-8]
	movq rbx, xmm7
	mov r10, 9223372036854775807
	cmp rbx, r10
	jne .L0x1ec
	mov rsi, LC.S133
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	call _long_strcpy_pchar.char.
	mov rax, 3
	jmp ___long_toStr_pdoublechar.long__return
	jmp .L0x1ed
.L0x1ec:
	movsd xmm7, qword[rbp-8]
	mov rbx, 9218868437227405312
	movq r10, xmm7
	cmp r10, rbx
	jne .L0x1ee
	mov rsi, LC.S134
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	call _long_strcpy_pchar.char.
	mov rax, 3
	jmp ___long_toStr_pdoublechar.long__return
	jmp .L0x1ef
.L0x1ee:
	movsd xmm7, qword[rbp-8]
	mov rbx, 18442240474082181120
	movq r10, xmm7
	cmp r10, rbx
	jne .L0x1f0
	mov rsi, LC.S135
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	call _long_strcpy_pchar.char.
	mov rax, 4
	jmp ___long_toStr_pdoublechar.long__return
	jmp .L0x1f1
.L0x1f0:
.L0x1f1:
.L0x1ef:
.L0x1ed:
.L0x1eb:
.L0x1e9:
	cvttsd2si rbx, qword[rbp-8]
	mov qword[rbp-32], rbx
	mov qword[rbp-40], 0
	mov rbx, qword[rbp-32]
	test rbx, rbx
	setz bl
	movsd xmm7, qword[rbp-8]
	movq r10, xmm7
	sar r10, 63
	and bl, r10b
	jz .L0x1f2
	mov rbx, qword[rbp-16]
	mov byte[rbx], 45
	inc qword[rbp-16]
	inc qword[rbp-40]
	jmp .L0x1f3
.L0x1f2:
.L0x1f3:
	mov rcx, 10
	mov rdx, 1
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
.L0x1fe:
	mov rdi, rax
	call _long_abs_plong
	mov r10, rax
	mov qword[rbp-48], r10
	mov rcx, 10
	mov rdx, 1
	mov rbx, qword[rbp-16]
	mov rsi, rbx
	mov rdi, qword[rbp-48]
	call _long_toStr_pintchar.boollong
	mov rbx, rax
	dec rbx
	mov qword[rbp-56], rbx
	mov rbx, qword[rbp-16]
	mov byte[rbx], 46
	inc qword[rbp-16]
	mov r10, 7
	sub r10, qword[rbp-56]
	mov qword[rbp-56], r10
	mov qword[rbp-64], 0
	jmp .L0x201
.L0x200:
	mov rbx, qword[rbp-16]
	mov byte[rbx], 48
	inc qword[rbp-16]
	inc qword[rbp-40]
.L0x202:
	inc qword[rbp-64]
.L0x201:
	mov r10, qword[rbp-56]
	cmp qword[rbp-64], r10
	jl .L0x200
.L0x203:
	mov rcx, 10
	mov rdx, 1
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
	jz .L0x1bf
	xor rax, rax
	jmp ___int___sprintf_pchar.char.void.__return
	jmp .L0x1c0
.L0x1bf:
.L0x1c0:
	jmp .L0x1c2
.L0x1c1:
	mov rbx, qword[rbp-16]
	cmp byte[rbx], 37
	je .L0x1c4
	mov rbx, qword[rbp-8]
	mov r10, qword[rbp-16]
	mov r10b, byte[r10]
	mov [rbx], r10b
	jmp .L0x1c5
.L0x1c4:
	inc qword[rbp-16]
	mov rbx, qword[rbp-16]
	mov bl, byte[rbx]
	mov byte[rbp-48], bl
	cmp byte[rbp-48], 105
	je .L0x1c7
	cmp byte[rbp-48], 108
	je .L0x1d3
	cmp byte[rbp-48], 99
	je .L0x1d4
	cmp byte[rbp-48], 120
	je .L0x1d5
	cmp byte[rbp-48], 111
	je .L0x1d6
	cmp byte[rbp-48], 117
	je .L0x1d7
	cmp byte[rbp-48], 115
	je .L0x1da
	cmp byte[rbp-48], 66
	je .L0x1db
	cmp byte[rbp-48], 102
	je .L0x1de
	cmp byte[rbp-48], 98
	je .L0x1df
	jmp .L0x1c6
.L0x1c7:
	mov r10d, dword[rbp-32]
	mov rbx, qword[rbp-24]
	xor rax, rax
	mov eax, r10d
	mov rbx, [rbx+rax*8]
	mov r10, rbx
	mov dword[rbp-56], r10d
	mov rcx, 10
	mov rdx, 1
	mov rbx, qword[rbp-8]
	mov rsi, rbx
	mov ebx, dword[rbp-56]
	mov edi, ebx
	call _long_toStr_pintchar.boollong
	mov r10, rax
	mov qword[rbp-64], r10
	mov rbx, qword[rbp-64]
	dec rbx
	add qword[rbp-8], rbx
	jmp .L0x1c6
.L0x1d3:
	mov r10d, dword[rbp-32]
	mov rbx, qword[rbp-24]
	xor rax, rax
	mov eax, r10d
	mov rbx, [rbx+rax*8]
	mov qword[rbp-72], rbx
	mov rcx, 10
	mov rdx, 1
	mov rbx, qword[rbp-8]
	mov rsi, rbx
	mov rdi, qword[rbp-72]
	call _long_toStr_pintchar.boollong
	mov r10, rax
	mov qword[rbp-80], r10
	mov rbx, qword[rbp-80]
	dec rbx
	add qword[rbp-8], rbx
	jmp .L0x1c6
.L0x1d4:
	mov r10d, dword[rbp-32]
	mov rbx, qword[rbp-24]
	xor rax, rax
	mov eax, r10d
	mov bl, [rbx+rax*8]
	mov byte[rbp-88], bl
	mov rbx, qword[rbp-8]
	mov r11b, byte[rbp-88]
	mov [rbx], r11b
	jmp .L0x1c6
.L0x1d5:
	mov r10d, dword[rbp-32]
	mov rbx, qword[rbp-24]
	xor rax, rax
	mov eax, r10d
	mov rbx, [rbx+rax*8]
	mov qword[rbp-96], rbx
	mov rcx, 16
	mov rdx, 0
	mov rbx, qword[rbp-8]
	mov rsi, rbx
	mov rdi, qword[rbp-96]
	call _long_toStr_pintchar.boollong
	mov r10, rax
	mov qword[rbp-104], r10
	mov rbx, qword[rbp-104]
	dec rbx
	add qword[rbp-8], rbx
	jmp .L0x1c6
.L0x1d6:
	mov r10d, dword[rbp-32]
	mov rbx, qword[rbp-24]
	xor rax, rax
	mov eax, r10d
	mov rbx, [rbx+rax*8]
	mov qword[rbp-112], rbx
	mov rcx, 8
	mov rdx, 0
	mov rbx, qword[rbp-8]
	mov rsi, rbx
	mov rdi, qword[rbp-112]
	call _long_toStr_pintchar.boollong
	mov r10, rax
	mov qword[rbp-120], r10
	mov rbx, qword[rbp-120]
	dec rbx
	add qword[rbp-8], rbx
	jmp .L0x1c6
.L0x1d7:
	mov r10b, 1
	mov rbx, qword[rbp-16]
	xor rax, rax
	mov al, r10b
	mov bl, [rbx+rax*1]
	mov byte[rbp-128], bl
	cmp byte[rbp-128], 108
	jne .L0x1d8
	mov r10d, dword[rbp-32]
	mov rbx, qword[rbp-24]
	xor rax, rax
	mov eax, r10d
	mov rbx, [rbx+rax*8]
	mov qword[rbp-136], rbx
	mov rcx, 10
	mov rdx, 0
	mov rbx, qword[rbp-8]
	mov rsi, rbx
	mov rdi, qword[rbp-136]
	call _long_toStr_pintchar.boollong
	mov rbx, rax
	mov dword[rbp-144], ebx
	dec ebx
	xor r10, r10
	mov r10d, ebx
	add qword[rbp-8], r10
	inc qword[rbp-16]
	jmp .L0x1d9
.L0x1d8:
	mov r10d, dword[rbp-32]
	mov rbx, qword[rbp-24]
	xor rax, rax
	mov eax, r10d
	mov rbx, [rbx+rax*8]
	mov qword[rbp-136], rbx
	mov rcx, 10
	mov rdx, 0
	mov rbx, qword[rbp-8]
	mov rsi, rbx
	mov rdi, qword[rbp-136]
	call _long_toStr_pintchar.boollong
	mov rbx, rax
	mov dword[rbp-144], ebx
	dec ebx
	xor r10, r10
	mov r10d, ebx
	add qword[rbp-8], r10
.L0x1d9:
	jmp .L0x1c6
.L0x1da:
	mov r10d, dword[rbp-32]
	mov rbx, qword[rbp-24]
	xor rax, rax
	mov eax, r10d
	mov rbx, [rbx+rax*8]
	mov rsi, rbx
	mov rbx, qword[rbp-8]
	dec rbx
	mov rdi, rbx
	call _long_strcpy_pchar.char.
	mov rbx, rax
	mov dword[rbp-136], ebx
	sub ebx, 2
	xor r10, r10
	mov r10d, ebx
	add qword[rbp-8], r10
	jmp .L0x1c6
.L0x1db:
	mov r10d, dword[rbp-32]
	mov rbx, qword[rbp-24]
	xor rax, rax
	mov eax, r10d
	mov rbx, [rbx+rax*8]
	mov r10, rbx
	mov byte[rbp-144], r10b
	mov r10, LC.S136
	mov qword[rbp-152], r10
	mov al, byte[rbp-144]
	test al, al
	jz .L0x1dc
	mov r10, LC.S137
	mov qword[rbp-152], r10
	jmp .L0x1dd
.L0x1dc:
.L0x1dd:
	mov rbx, qword[rbp-152]
	mov rsi, rbx
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _long_strcpy_pchar.char.
	mov rbx, rax
	mov dword[rbp-160], ebx
	xor rbx, rbx
	mov ebx, dword[rbp-160]
	add qword[rbp-8], rbx
	jmp .L0x1c6
.L0x1de:
	mov r10d, dword[rbp-32]
	mov rbx, qword[rbp-24]
	xor rax, rax
	mov eax, r10d
	mov rbx, [rbx+rax*8]
	movq xmm7, rbx
	movsd qword[rbp-168], xmm7
	mov rsi, 1000000000
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	movsd xmm7, qword[rbp-168]
	movsd xmm0, xmm7
	call _long_toStr_pdoublechar.long
	mov rbx, rax
	mov dword[rbp-176], ebx
	dec ebx
	xor r10, r10
	mov r10d, ebx
	add qword[rbp-8], r10
	jmp .L0x1c6
.L0x1df:
	mov r10d, dword[rbp-32]
	mov rbx, qword[rbp-24]
	xor rax, rax
	mov eax, r10d
	mov rbx, [rbx+rax*8]
	mov qword[rbp-184], rbx
	mov rbx, qword[rbp-16]
	inc rbx
	mov bl, byte[rbx]
	mov byte[rbp-192], bl
	mov dword[rbp-200], 64
	cmp byte[rbp-192], 56
	jne .L0x1e0
	inc qword[rbp-16]
	jmp .L0x1e1
.L0x1e0:
	cmp byte[rbp-192], 52
	jne .L0x1e2
	mov dword[rbp-200], 32
	inc qword[rbp-16]
	jmp .L0x1e3
.L0x1e2:
	cmp byte[rbp-192], 50
	jne .L0x1e4
	mov dword[rbp-200], 16
	inc qword[rbp-16]
	jmp .L0x1e5
.L0x1e4:
	cmp byte[rbp-192], 49
	jne .L0x1e6
	mov dword[rbp-200], 8
	inc qword[rbp-16]
	jmp .L0x1e7
.L0x1e6:
.L0x1e7:
.L0x1e5:
.L0x1e3:
.L0x1e1:
	inc qword[rbp-16]
	mov ebx, dword[rbp-200]
	mov edx, ebx
	mov rsi, qword[rbp-184]
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _size_t_toBinary_pchar.ulongint
	mov r10, rax
	mov qword[rbp-208], r10
	add qword[rbp-8], r10
	jmp .L0x1c6
.L0x1c6:
	inc dword[rbp-32]
.L0x1c5:
	inc qword[rbp-16]
	inc qword[rbp-8]
.L0x1c2:
	mov rbx, qword[rbp-16]
	mov bl, byte[rbx]
	test bl, bl
	jnz .L0x1c1
.L0x1c3:
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
	mov ebx, dword[rbp-8]
	test ebx, ebx
	jnz .L0x1c8
	mov rbx, qword[rbp-16]
	mov byte[rbx], 48
	mov rax, 1
	jmp ___long_toStr_pintchar.boollong__return
	jmp .L0x1c9
.L0x1c8:
.L0x1c9:
	mov byte[rbp-40], 0
	cmp dword[rbp-8], 0
	setl bl
	and bl, byte[rbp-24]
	jz .L0x1ca
	mov rbx, qword[rbp-16]
	mov byte[rbx], 45
	add qword[rbp-16], 1
	xor r10d, r10d
	sub r10d, dword[rbp-8]
	mov dword[rbp-8], r10d
	mov byte[rbp-40], 1
	jmp .L0x1cb
.L0x1ca:
.L0x1cb:
	mov rdx, 64
	mov rsi, 0
	lea rbx, [rbp-112]
	mov rdi, rbx
	call _void_memset_pvoid.ucharsize_t
	mov qword[rbp-120], 0
	jmp .L0x1cd
.L0x1cc:
	mov ebx, dword[rbp-8]
	xor rax, rax
	mov eax, ebx
	mov edx, 858993460
	imul edx
	sar edx, 1
	mov eax, edx
	mov rdx, 10
	imul rdx
	sub ebx, eax
	xor r10, r10
	mov r10d, ebx
	mov qword[rbp-128], r10
	mov ebx, dword[rbp-8]
	xor rax, rax
	mov eax, ebx
	mov edx, 858993460
	imul edx
	sar edx, 1
	mov ebx, edx
	mov dword[rbp-8], ebx
	mov r10, qword[rbp-120]
	lea rbx, [rbp-112] 
	mov r11, qword[rbp-128]
	lea rbx, [rbx+r10*1]
	mov r10, __numbercharactersbase1016
	mov r10b, [r10+r11*1]
	mov [rbx], r10b
	inc qword[rbp-120]
.L0x1cd:
	mov ebx, dword[rbp-8]
	test ebx, ebx
	jnz .L0x1cc
.L0x1ce:
	dec qword[rbp-16]
	mov rbx, qword[rbp-120]
	mov dword[rbp-128], ebx
	jmp .L0x1d0
.L0x1cf:
	mov r10d, dword[rbp-128]
	mov rbx, qword[rbp-16]
	xor rax, rax
	mov eax, r10d
	lea rbx, [rbx+rax*1]
	mov r11d, dword[rbp-128]
	mov r10, qword[rbp-120]
	xor r12, r12
	mov r12d, r11d
	sub r10, r12
	lea r11, [rbp-112] 
	mov r11b, [r11+r10*1]
	mov [rbx], r11b
.L0x1d1:
	dec dword[rbp-128]
.L0x1d0:
	xor r10d, r10d
	cmp dword[rbp-128], r10d
	jg .L0x1cf
.L0x1d2:
	mov r10b, byte[rbp-40]
	mov rbx, qword[rbp-120]
	xor r11, r11
	mov r11b, r10b
	add rbx, r11
	inc rbx
	mov rax, rbx
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
	mov r11, qword[rbp-32]
	mov [rbx+r10*8], r11
	mov r10, 2
	lea rbx, [rbp-88] 
	mov r11, qword[rbp-40]
	mov [rbx+r10*8], r11
	mov r10, 3
	lea rbx, [rbp-88] 
	mov r11, qword[rbp-48]
	mov [rbx+r10*8], r11
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
_fd_t_fopen_pchar.char.:
	push rbp
	mov rbp, rsp
	sub rsp, 56
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	mov rbx, qword[rbp-16]
	mov bl, byte[rbx]
	xor r10, r10
	mov r10b, bl
	mov qword[rbp-24], r10
	mov r10b, 1
	mov rbx, qword[rbp-16]
	xor rax, rax
	mov al, r10b
	mov bl, [rbx+rax*1]
	mov r10, qword[rbp-24]
	xor r11, r11
	mov r11b, bl
	add r10, r11
	mov qword[rbp-32], 510
	mov dword[rbp-40], 0
	cmp qword[rbp-24], 114
	je .L0x1ab
	cmp qword[rbp-24], 119
	je .L0x1ac
	cmp qword[rbp-24], 97
	je .L0x1ad
	cmp qword[rbp-24], 157
	je .L0x1ae
	cmp qword[rbp-24], 162
	je .L0x1af
	cmp qword[rbp-24], 140
	je .L0x1b0
	jmp .L0x1aa
.L0x1ab:
	mov dword[rbp-40], 0
	jmp .L0x1aa
.L0x1ac:
	mov dword[rbp-40], 1
	jmp .L0x1aa
.L0x1ad:
	mov dword[rbp-40], 1
	jmp .L0x1aa
.L0x1ae:
	mov dword[rbp-40], 2
	jmp .L0x1aa
.L0x1af:
	mov dword[rbp-40], 2
	jmp .L0x1aa
.L0x1b0:
	mov dword[rbp-40], 2
	jmp .L0x1aa
.L0x1aa:
	mov rbx, qword[rbp-32]
	mov rdx, rbx
	mov ebx, dword[rbp-40]
	mov esi, ebx
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	mov rax , 2 
	mov r10 , rcx 
	syscall 
.L0x1b5:
	mov r10, rax
	mov qword[rbp-48], r10
	cmp qword[rbp-24], 140
	sete bl
	cmp qword[rbp-24], 97
	sete r10b
	or bl, r10b
	jz .L0x1b7
	mov rdx, 2
	mov rsi, 0
	mov rbx, qword[rbp-48]
	mov rdi, rbx
	mov rax , 8 
	mov r10 , rcx 
	syscall 
.L0x1bd:
	jmp .L0x1b8
.L0x1b7:
.L0x1b8:
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
	mov rax , 1 
	mov r10 , rcx 
	syscall 
.L0x1a8:
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
	mov rax , 1 
	mov r10 , rcx 
	syscall 
.L0x1a2:
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
	mov rax , 0 
	mov r10 , rcx 
	syscall 
.L0x19c:
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
	mov rdx, 2
	mov rsi, 0
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	mov rax , 8 
	mov r10 , rcx 
	syscall 
.L0x188:
	mov r10, rax
	mov dword[rbp-16], r10d
	mov rdx, 2
	mov r10d, 0
	sub r10d, dword[rbp-16]
	mov esi, r10d
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	mov rax , 8 
	mov r10 , rcx 
	syscall 
.L0x18e:
	mov edi, dword[rbp-16]
	call _void._mapalloc_psize_t
	mov r10, rax
	mov qword[rbp-24], r10
	mov edx, dword[rbp-16]
	mov rbx, qword[rbp-24]
	mov rsi, rbx
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	mov rax , 0 
	mov r10 , rcx 
	syscall 
.L0x194:
	mov r10, rax
	mov qword[rbp-32], r10
	cmp qword[rbp-32], 0
	jge .L0x196
	mov rax, qword[rbp-32]
	jmp ___void._floads_pfd_t__return
	jmp .L0x197
.L0x196:
.L0x197:
	mov rax, qword[rbp-24]
___void._floads_pfd_t__return:
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
	mov r9, 0
	mov r8, 0
	mov rcx, 34
	mov rdx, 3
	mov rsi, rdi
	mov rdi, 0
	mov rax, 9
	mov r10, rcx
	syscall
.L0x175:
.L0x170:
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
.L0x17c:
	mov rsi, 10000
	mov rdi, qword[rbp-32]
	syscall
.L0x182:
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
	mov r11, qword[rbp-24]
	mov [rbx+r10*8], r11
	mov r10, 2
	lea rbx, [rbp-104] 
	mov r11, qword[rbp-32]
	mov [rbx+r10*8], r11
	mov r10, 3
	lea rbx, [rbp-104] 
	mov r11, qword[rbp-40]
	mov [rbx+r10*8], r11
	mov r10, 4
	lea rbx, [rbp-104] 
	mov r11, qword[rbp-48]
	mov [rbx+r10*8], r11
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
	mov r11, qword[rbp-24]
	mov [rbx+r10*8], r11
	mov r10, 2
	lea rbx, [rbp-104] 
	mov r11, qword[rbp-32]
	mov [rbx+r10*8], r11
	mov r10, 3
	lea rbx, [rbp-104] 
	mov r11, qword[rbp-40]
	mov [rbx+r10*8], r11
	mov r10, 4
	lea rbx, [rbp-104] 
	mov r11, qword[rbp-48]
	mov [rbx+r10*8], r11
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
	mov r11, qword[rbp-32]
	mov [rbx+r10*8], r11
	mov r10, 2
	lea rbx, [rbp-88] 
	mov r11, qword[rbp-40]
	mov [rbx+r10*8], r11
	mov r10, 3
	lea rbx, [rbp-88] 
	mov r11, qword[rbp-48]
	mov [rbx+r10*8], r11
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
	jne .L0x167
	mov rcx, qword[rbp-32]
	mov edx, dword[rbp-24]
	mov rsi, qword[rbp-16]
	mov rdi, LC.S138
	call eprintf
	mov rdi, 1
	mov rax , 60 
	mov r10 , rcx 
	syscall 
.L0x16d:
	jmp .L0x168
.L0x167:
.L0x168:
	xor rax, rax
	leave
	ret
_void_merge_right_pmblock.:
	mov rbx, rdi
	mov rbx, [rbx+8]
	test rbx, rbx
	jz .L0x15f
	mov rbx, rdi
	lea rbx, [rbx+8]
	mov r10, rbx
	cmp qword[r10+24], 1
	jne .L0x161
	mov rbx, rdi
	mov rbx, qword[rbx]
	mov r10, rdi
	lea r10, [r10+rbx+32]
	mov rbx, rdi
	cmp r10, qword[rbx]
	jne .L0x163
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
	jz .L0x165
	mov rbx, rdi
	lea rbx, [rbx+8]
	mov r10, rbx
	lea r10, [r10+16]
	mov r11, rdi
	mov [r10], r11
	jmp .L0x166
.L0x165:
.L0x166:
	jmp .L0x164
.L0x163:
.L0x164:
	jmp .L0x162
.L0x161:
.L0x162:
	jmp .L0x160
.L0x15f:
.L0x160:
	xor rax, rax
	ret
_bool_scan_merge_pmblock.:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov [rbp-8], rdi
	mov r10, qword[malloc_maxcache]
	cmp qword[cached_size], r10
	jle .L0x14c
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
	syscall
.L0x154:
.L0x14f:
	xor rax, rax
	jmp ___bool_scan_merge_pmblock.__return
	jmp .L0x14d
.L0x14c:
.L0x14d:
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
	jnz .L0x14a
	mov r10, rdi
	mov qword[free_head], r10
	mov rbx, rdi
	lea rbx, [rbx+16]
	mov r11, rdi
	mov [rbx], r11
	mov rbx, rdi
	mov qword[rbx+8], 0
	jmp ___void_add_block_pmblock.__return
	jmp .L0x14b
.L0x14a:
.L0x14b:
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
	jnz .L0x13e
	xor rax, rax
	jmp ___mblock._scan_existing_psize_t__return
	jmp .L0x13f
.L0x13e:
.L0x13f:
	mov r10, qword[free_head]
	mov qword[rbp-16], r10
	jmp .L0x141
.L0x140:
	mov rbx, qword[rbp-16]
	cmp qword[rbx+24], 1
	jne .L0x144
	mov rbx, qword[rbp-16]
	mov rbx, qword[rbx]
	cmp rbx, qword[rbp-8]
	jl .L0x146
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
	jmp .L0x147
.L0x146:
.L0x147:
	jmp .L0x145
.L0x144:
.L0x145:
.L0x142:
	mov rbx, qword[rbp-16]
	mov rbx, [rbx+8]
	mov qword[rbp-16], rbx
.L0x141:
	test rbx, rbx
	jnz .L0x140
.L0x143:
	xor rax, rax
___mblock._scan_existing_psize_t__return:
	leave
	ret
_void_printstate_p:
	mov rdi, LC.S139
	call _size_t_puts_pchar.
.L0x130:
	mov rbx, qword[free_head]
	test rbx, rbx
	jnz .L0x132
	mov rdi, LC.S140
	call _size_t_puts_pchar.
.L0x135:
	jmp .L0x133
.L0x132:
	mov r10, qword[free_head]
	mov qword[rbp-8], r10
	jmp .L0x138
.L0x137:
	mov rbx, qword[rbp-8]
	mov rbx, [rbx+24]
	mov rcx, rbx
	mov rdx, qword[rbp-8]
	mov rbx, qword[rbp-8]
	mov rbx, qword[rbx]
	mov rsi, rbx
	mov rdi, LC.S141
	call printf
.L0x139:
	mov rbx, qword[rbp-8]
	mov rbx, [rbx+8]
	mov qword[rbp-8], rbx
.L0x138:
	test rbx, rbx
	jnz .L0x137
.L0x13a:
.L0x133:
	mov rcx, qword[cached_size]
	mov rdx, qword[deletions]
	mov rsi, qword[appends]
	mov rdi, LC.S142
	call printf
	mov rdi, LC.S143
	call _size_t_puts_pchar.
.L0x13c:
	xor rax, rax
	ret
_mblock._create_ptr_psize_t:
	push rbp
	mov rbp, rsp
	sub rsp, 24
	mov [rbp-8], rdi
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	mov r9, 0
	mov r8, 0
	mov rcx, 34
	mov rdx, 3
	mov rsi, rdi
	mov rdi, 0
	mov rax, 9
	mov r10, rcx
	syscall
.L0x124:
.L0x11f:
	mov r10, rax
	mov qword[rbp-16], r10
	cmp r10, 0
	jle .L0x127
	mov rax, qword[rbp-16]
	jmp ___mblock._create_ptr_psize_t__return
	jmp .L0x128
.L0x127:
.L0x128:
	mov rdi, qword[rbp-16]
	call _char._strerror_plong
	mov rdx, rax
	mov rsi, 206
	mov rdi, LC.S144
	call printf
	mov rdi, 1
	mov rax , 60 
	mov r10 , rcx 
	syscall 
.L0x12d:
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
	jg .L0x11a
	jmp ___void_split_block_pmblock.size_t__return
	jmp .L0x11b
.L0x11a:
.L0x11b:
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
	jz .L0x11c
	mov rbx, rdi
	lea rbx, [rbx+8]
	mov r10, rbx
	lea r10, [r10+16]
	mov r11, qword[rbp-8]
	mov [r10], r11
	jmp .L0x11d
.L0x11c:
.L0x11d:
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
	jnz .L0x109
	jmp ___void_free_pvoid.__return
	jmp .L0x10a
.L0x109:
.L0x10a:
	mov rbx, qword[rbp-8]
	sub rbx, 32
	mov qword[rbp-16], rbx
	cmp qword[rbx], 4096
	jl .L0x10b
	mov rbx, qword[rbp-16]
	add qword[rbx], 32
	mov rbx, qword[rbp-16]
	mov rbx, qword[rbx]
	add rbx, 32
	mov rsi, rbx
	syscall
.L0x113:
.L0x10e:
	jmp ___void_free_pvoid.__return
	jmp .L0x10c
.L0x10b:
.L0x10c:
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
	jl .L0x103
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
	jmp .L0x104
.L0x103:
.L0x104:
	mov rbx, qword[free_head]
	test rbx, rbx
	jz .L0x105
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _mblock._scan_existing_psize_t
	mov r10, rax
	mov qword[rbp-16], r10
	mov rax, qword[rbp-16]
	test rax, rax
	jz .L0x107
	mov rbx, qword[rbp-16]
	mov qword[rbx+24], 0
	mov rbx, qword[rbp-16]
	add rbx, 32
	mov rax, rbx
	jmp ___void._malloc_psize_t__return
	jmp .L0x108
.L0x107:
.L0x108:
	jmp .L0x106
.L0x105:
.L0x106:
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
	jge .L0xf9
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _void_free_pvoid.
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	call _void._malloc_psize_t
	mov r10, rax
	mov qword[rbp-40], r10
	cmp qword[rbp-8], r10
	jne .L0xfb
	mov rbx, qword[rbp-8]
	mov rax, rbx
	jmp ___void._realloc_pvoid.size_t__return
	jmp .L0xfc
.L0xfb:
.L0xfc:
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
	jmp .L0xfa
.L0xf9:
.L0xfa:
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
.L0x101:
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
	mov r9, 0
	mov r8, 0
	mov rcx, 34
	mov rdx, 3
	mov rsi, rdi
	mov rdi, 0
	mov rax, 9
	mov r10, rcx
	syscall
.L0xf6:
.L0xf1:
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
	syscall
.L0xee:
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
.L0xe8:
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
.L0xe1avxmemzeraligned_lp:
	vmovdqu [rdi], ymm0
	add rdi, 4
	sub rsi, 4
	jnz .L0xe1avxmemzeraligned_lp
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
	xor r11, r11
	mov r11d, r10d
	sub rbx, r11
	sar rbx, 2
	mov qword[rbp-32], rbx
	mov rsi, rbx
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _void_avx_memzeraligned_pvoid.size_t
	mov ebx, dword[rbp-24]
	test ebx, ebx
	jz .L0xde
	mov edx, dword[rbp-24]
	mov rsi, 0
	mov r10, qword[rbp-8]
	add r10, qword[rbp-32]
	mov rdi, r10
	call _void_memset_pvoid.ucharsize_t
	jmp .L0xdf
.L0xde:
.L0xdf:
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
.L0xdb:
	mov [rdi+rsi], bl
	dec rsi
	jnz .L0xdb
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
	mov r10, rdi
	mov qword[rand_next], r10
	xor rax, rax
	ret
_clock_t_clock_p:
	push rbp
	mov rbp, rsp
	sub rsp, 24
	lea rbx, [rbp-8]
	mov rsi, rbx
	mov rdi, 2
	mov rax , 228 
	mov r10 , rcx 
	syscall 
.L0xce:
	mov rbx, rax
	test rbx, rbx
	jz .L0xd0
	mov rax, -1
	jmp ___clock_t_clock_p__return
	jmp .L0xd1
.L0xd0:
.L0xd1:
	mov r10, 9223372036854
	cmp qword[rbp-24], r10
	setg bl
	mov r10, qword[rbp-16]
	xor rax, rax
	mov rax, r10
	mov rdx, 36893488147419104
	imul rdx
	mov rax, rdx
	shr rax, 1
	mov r10, rax
	mov r12, 1000000
	mov r11, qword[rbp-24]
	imul r11, r12
	mov r12, 9223372036854775807
	sub r12, r11
	cmp r10, r12
	setg r10b
	or bl, r10b
	jz .L0xd2
	mov rax, -1
	jmp ___clock_t_clock_p__return
	jmp .L0xd3
.L0xd2:
.L0xd3:
	mov r10, 1000000
	mov rbx, qword[rbp-24]
	imul rbx, r10
	mov r10, qword[rbp-16]
	xor rax, rax
	mov rax, r10
	mov rdx, 36893488147419104
	imul rdx
	mov rax, rdx
	shr rax, 1
	add rbx, rax
	mov rax, rbx
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
	mov rbx, qword[rbp-8]
	xor rax, rax
	mov rax, rbx
	mov rdx, 614891469123651712
	imul rdx
	mov rax, rdx
	shr rax, 1
	mov rdx, 60
	imul rdx
	sub rbx, rax
	mov r10, rbx
	mov dword[rbp-32], r10d
	mov rbx, qword[rbp-8]
	xor rax, rax
	mov rax, rbx
	mov rdx, 614891469123651712
	imul rdx
	mov rax, rdx
	shr rax, 1
	mov rbx, rax
	mov qword[rbp-8], rbx
	xor rax, rax
	mov rax, rbx
	mov rdx, 614891469123651712
	imul rdx
	mov rax, rdx
	shr rax, 1
	mov rdx, 60
	imul rdx
	sub rbx, rax
	mov r10, rbx
	mov dword[rbp-40], r10d
	mov rbx, qword[rbp-8]
	xor rax, rax
	mov rax, rbx
	mov rdx, 614891469123651712
	imul rdx
	mov rax, rdx
	shr rax, 1
	mov rbx, rax
	mov qword[rbp-8], rbx
	xor rax, rax
	mov rax, rbx
	mov rdx, 614891469123651712
	imul rdx
	mov rax, rdx
	shr rax, 1
	mov rdx, 60
	imul rdx
	sub rbx, rax
	mov r10, rbx
	mov dword[rbp-48], r10d
	mov rbx, qword[rbp-8]
	xor rax, rax
	mov rax, rbx
	mov rdx, 614891469123651712
	imul rdx
	mov rax, rdx
	shr rax, 1
	mov rbx, rax
	mov qword[rbp-8], rbx
	mov rbx, qword[rbp-16]
	xor rax, rax
	mov rax, rbx
	mov rdx, 614891469123651712
	imul rdx
	mov rax, rdx
	shr rax, 1
	mov rbx, rax
	xor rax, rax
	mov rax, rbx
	mov rdx, 614891469123651712
	imul rdx
	mov rax, rdx
	shr rax, 1
	mov rbx, rax
	xor rax, rax
	mov rax, rbx
	mov rdx, 1537228672809129216
	imul rdx
	mov rax, rdx
	shr rax, 1
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
	movsd xmm7, qword[LC.F29]
	cvtsi2sd xmm8, ebx
	mulsd xmm8, xmm7
	movsd xmm0, xmm8
	call _long_floor_pdouble
	push rax
	mov r10d, dword[rbp-56]
	pop rbx
	xor r11, r11
	mov r11d, r10d
	sub r11, rbx
	mov rbx, r11
	mov dword[rbp-56], ebx
	add ebx, 4
	xor rax, rax
	mov eax, ebx
	mov edx, 1227133514
	imul edx
	sar edx, 1
	mov eax, edx
	mov rdx, 7
	imul rdx
	sub ebx, eax
	mov dword[rbp-72], ebx
	mov r10d, dword[rbp-56]
	mov dword[rbp-88], r10d
	mov dword[rbp-96], 0
	jmp .L0xc5
.L0xc4:
	mov r10d, dword[rbp-96]
	mov rbx, qword[mdays]
	xor rax, rax
	mov eax, r10d
	mov ebx, [rbx+rax*4]
	cmp dword[rbp-88], ebx
	jle .L0xc8
	mov r10d, dword[rbp-96]
	mov rbx, qword[mdays]
	xor rax, rax
	mov eax, r10d
	mov ebx, [rbx+rax*4]
	mov r10d, dword[rbp-88]
	sub r10d, ebx
	mov dword[rbp-88], r10d
	jmp .L0xc9
.L0xc8:
	jmp .L0xc7
.L0xc9:
.L0xc6:
	inc dword[rbp-96]
.L0xc5:
	jmp .L0xc4
.L0xc7:
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
	mov r10, wday_name
	xor rax, rax
	mov eax, ebx
	mov r10, [r10+rax*8]
	mov rsi, r10
	mov rbx, qword[asctime__result_buf]
	mov rdi, rbx
	call _long_strcpy_pchar.char.
	mov r10b, 3
	mov rbx, qword[asctime__result_buf]
	xor rax, rax
	mov al, r10b
	mov byte[rbx+rax*1], 32
	mov rbx, qword[rbp-8]
	mov ebx, [rbx+16]
	mov r10, mon_name
	xor rax, rax
	mov eax, ebx
	mov r10, [r10+rax*8]
	mov rsi, r10
	mov rbx, qword[asctime__result_buf]
	add rbx, 4
	mov rdi, rbx
	call _long_strcpy_pchar.char.
	mov r10b, 7
	mov rbx, qword[asctime__result_buf]
	xor rax, rax
	mov al, r10b
	mov byte[rbx+rax*1], 32
	mov r9, 0
	mov r8, 0
	mov rcx, 0
	mov rbx, qword[rbp-8]
	mov ebx, [rbx+12]
	mov rdx, rbx
	mov rsi, LC.S164
	mov rbx, qword[asctime__result_buf]
	add rbx, 7
	mov rdi, rbx
	call sprintf
	mov rbx, qword[rbp-8]
	mov ebx, [rbx+20]
	add ebx, 1900
	mov r9, rbx
	mov rbx, qword[rbp-8]
	mov ebx, dword[rbx]
	mov r8, rbx
	mov rbx, qword[rbp-8]
	mov ebx, [rbx+4]
	mov rcx, rbx
	mov rbx, qword[rbp-8]
	mov ebx, [rbx+8]
	mov rdx, rbx
	mov rsi, LC.S165
	mov rbx, qword[asctime__result_buf]
	add rbx, 10
	mov rdi, rbx
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
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov [rbp-8], rdi
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _tm._localtime_ptime_t
	mov rdi, rax
	call _char._asctime_ptm.
___char._ctime_ptime_t__return:
	leave
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
	lea rbx, [rbp-16]
	mov rdi, rbx
	mov rax , 35 
	mov r10 , rcx 
	syscall 
.L0xc2:
	xor rax, rax
	leave
	ret
_void_feed_pStackvoid.:
	mov r10, rsi
	mov qword[rdi+8], r10
	xor rax, rax
	ret
_void_alloc_pStacksize_t:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov [rbp-8], rsi
	mov r10, qword[rbp-8]
	mov qword[rdi+16], r10
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _void._mapalloc_psize_t
	mov r10, rax
	mov qword[rdi+8], r10
	xor rax, rax
	leave
	ret
_void_destroy_pStack:
	mov rbx, qword[rdi+8]
	mov rdi, rbx
	call _void_mapfree_pvoid.
	xor rax, rax
	ret
_void_set_pVec3fdoubledoubledouble:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	movsd [rbp-8], xmm0
	movsd xmm8, qword[rbp-8]
	movsd qword[rdi+0], xmm8
	movsd xmm8, xmm1
	movsd qword[rdi+8], xmm8
	movsd xmm8, xmm2
	movsd qword[rdi+16], xmm8
	xor rax, rax
	leave
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
	sub rsp, 48
	mov [rbp-8], rdx
	mov qword[rbp-16], 0
	mov rbx, rdi
	mov bl, byte[rbx]
	mov byte[rbp-24], bl
	mov byte[rbp-32], 0
	mov r10, rdi
	mov qword[rbp-40], r10
	cmp byte[rbp-24], 45
	sete bl
	and bl, byte[rbp-8]
	jz .L0x9b
	mov byte[rbp-32], 1
	inc rdi
	mov rbx, rdi
	mov bl, byte[rbx]
	mov byte[rbp-24], bl
	jmp .L0x9c
.L0x9b:
.L0x9c:
	jmp .L0x9e
.L0x9d:
	sub byte[rbp-24], 48
	mov r10, 10
	mov rbx, qword[rbp-16]
	imul rbx, r10
	mov qword[rbp-16], rbx
	mov r10b, 255
	mov bl, byte[rbp-24]
	and bl, r10b
	xor r10, r10
	mov r10b, bl
	add qword[rbp-16], r10
	inc rdi
	mov rbx, rdi
	mov bl, byte[rbx]
	mov byte[rbp-24], bl
.L0x9e:
	cmp byte[rbp-24], 57
	setle bl
	cmp byte[rbp-24], 48
	setge r10b
	and bl, r10b
	jnz .L0x9d
.L0x9f:
	cmp byte[rbp-32], 0
	jne .L0xa0
	mov rbx, rsi
	mov r11, qword[rbp-16]
	mov [rbx], r11
	jmp .L0xa1
.L0xa0:
	mov rbx, rsi
	mov r11, 0
	sub r11, qword[rbp-16]
	mov [rbx], r11
.L0xa1:
	sub rdi, qword[rbp-40]
	mov eax, edi
___int_scanint_pchar.long.bool__return:
	leave
	ret
_int_scanstr_pchar.charchar.:
	push rbp
	mov rbp, rsp
	sub rsp, 24
	mov [rbp-8], rdx
	mov r10, rdi
	mov qword[rbp-16], r10
	jmp .L0x92
.L0x91:
	mov rbx, qword[rbp-8]
	mov r10, rdi
	mov r10b, byte[r10]
	mov [rbx], r10b
	inc rdi
	inc qword[rbp-8]
.L0x92:
	mov rbx, rdi
	cmp byte[rbx], sil
	jne .L0x91
.L0x93:
	sub rdi, qword[rbp-16]
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
	push rax
	xor rbx, rbx
	pop rbx
	mov qword[rbp-40], rbx
	mov r10, qword[rbp-40]
	add qword[rbp-8], r10
	mov rbx, qword[rbp-8]
	cmp byte[rbx], 46
	je .L0x8c
	mov rbx, qword[rbp-16]
	cvtsi2sd xmm7, qword[rbp-24]
	movsd [rbx], xmm7
	mov rax, qword[rbp-40]
	jmp ___int_scansd_pchar.double.__return
	jmp .L0x8d
.L0x8c:
.L0x8d:
	inc qword[rbp-8]
	xor rdx, rdx
	lea rbx, [rbp-32]
	mov rsi, rbx
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _int_scanint_pchar.long.bool
	push rax
	xor rbx, rbx
	pop rbx
	mov qword[rbp-48], rbx
	mov rsi, rbx
	mov rdi, 10
	call _long_pow_plonglong
	mov rbx, rax
	mov dword[rbp-56], ebx
	mov r10d, dword[rbp-56]
	mov rbx, qword[rbp-24]
	xor r11, r11
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
	jz .L0x7b
	xor rax, rax
	jmp ___int___SSCANF_pchar.char.void..__return
	jmp .L0x7c
.L0x7b:
.L0x7c:
	jmp .L0x7e
.L0x7d:
	mov rbx, qword[rbp-8]
	cmp byte[rbx], 37
	je .L0x80
	inc qword[rbp-8]
	inc qword[rbp-16]
	jmp .L0x81
.L0x80:
	inc qword[rbp-8]
	mov rbx, qword[rbp-8]
	mov bl, byte[rbx]
	mov byte[rbp-40], bl
	cmp byte[rbp-40], 105
	jne .L0x82
	mov rdx, 1
	mov r10d, dword[rbp-32]
	mov rbx, qword[rbp-24]
	xor rax, rax
	mov eax, r10d
	mov rbx, [rbx+rax*8]
	mov rsi, rbx
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	call _int_scanint_pchar.long.bool
	push rax
	xor rbx, rbx
	pop rbx
	mov qword[rbp-48], rbx
	mov r10, qword[rbp-48]
	add qword[rbp-16], r10
	inc qword[rbp-8]
	jmp .L0x83
.L0x82:
	cmp byte[rbp-40], 117
	jne .L0x84
	xor rdx, rdx
	mov r10d, dword[rbp-32]
	mov rbx, qword[rbp-24]
	xor rax, rax
	mov eax, r10d
	mov rbx, [rbx+rax*8]
	mov rsi, rbx
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	call _int_scanint_pchar.long.bool
	push rax
	xor rbx, rbx
	pop rbx
	mov qword[rbp-48], rbx
	mov r10, qword[rbp-48]
	add qword[rbp-16], r10
	inc qword[rbp-8]
	jmp .L0x85
.L0x84:
	cmp byte[rbp-40], 99
	jne .L0x86
	mov r10d, dword[rbp-32]
	mov rbx, qword[rbp-24]
	xor rax, rax
	mov eax, r10d
	mov rbx, [rbx+rax*8]
	mov qword[rbp-56], rbx
	mov r10, qword[rbp-16]
	mov r10b, byte[r10]
	mov [rbx], r10b
	inc qword[rbp-16]
	inc qword[rbp-8]
	jmp .L0x87
.L0x86:
	cmp byte[rbp-40], 115
	jne .L0x88
	inc qword[rbp-8]
	mov r10d, dword[rbp-32]
	mov rbx, qword[rbp-24]
	xor rax, rax
	mov eax, r10d
	mov rbx, [rbx+rax*8]
	mov rdx, rbx
	mov rbx, qword[rbp-8]
	mov bl, byte[rbx]
	mov sil, bl
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	call _int_scanstr_pchar.charchar.
	push rax
	xor rbx, rbx
	pop rbx
	mov qword[rbp-48], rbx
	mov r10, qword[rbp-48]
	add qword[rbp-16], r10
	jmp .L0x89
.L0x88:
	cmp byte[rbp-40], 102
	sete bl
	cmp byte[rbp-40], 100
	sete r10b
	or bl, r10b
	jz .L0x8a
	mov r10d, dword[rbp-32]
	mov rbx, qword[rbp-24]
	xor rax, rax
	mov eax, r10d
	mov rbx, [rbx+rax*8]
	mov rsi, rbx
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	call _int_scansd_pchar.double.
	push rax
	xor rbx, rbx
	pop rbx
	mov qword[rbp-48], rbx
	mov r10, qword[rbp-48]
	add qword[rbp-16], r10
	inc qword[rbp-8]
	jmp .L0x8b
.L0x8a:
.L0x8b:
.L0x89:
.L0x87:
.L0x85:
.L0x83:
	inc dword[rbp-32]
.L0x81:
.L0x7e:
	mov rbx, qword[rbp-8]
	mov bl, byte[rbx]
	test bl, bl
	setnz bl
	mov r10, qword[rbp-16]
	mov r10b, byte[r10]
	test r10b, r10b
	setnz r10b
	and bl, r10b
	jnz .L0x7d
.L0x7f:
	mov ebx, dword[rbp-32]
	mov eax, ebx
___int___SSCANF_pchar.char.void..__return:
	leave
	ret
sscanf:
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
	mov r11, qword[rbp-32]
	mov [rbx+r10*8], r11
	mov r10, 2
	lea rbx, [rbp-88] 
	mov r11, qword[rbp-40]
	mov [rbx+r10*8], r11
	mov r10, 3
	lea rbx, [rbp-88] 
	mov r11, qword[rbp-48]
	mov [rbx+r10*8], r11
	lea rbx, [rbp-88]
	mov rdx, rbx
	mov rbx, qword[rbp-16]
	mov rsi, rbx
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _int___SSCANF_pchar.char.void..
	mov rbx, rax
	mov eax, ebx
__sscanf__return:
	leave
	ret
_int_getInt_pchar.:
	push rbp
	mov rbp, rsp
	sub rsp, 64
	mov [rbp-8], rdi
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _size_t_puts_pchar.
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
	call _long_fgets_pfd_tchar.size_t
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
	call _size_t_puts_pchar.
.L0x76:
	mov rdx, 40
	mov rsi, 0
	lea rbx, [rbp-56]
	mov rdi, rbx
	call _void_memset_pvoid.ucharsize_t
	mov rdx, 40
	lea rbx, [rbp-56]
	mov rsi, rbx
	mov rdi, 0
	call _long_fgets_pfd_tchar.size_t
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
	call _long_fgets_pfd_tchar.size_t
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
	call _size_t_puts_pchar.
.L0x73:
	mov edx, dword[rbp-16]
	mov rbx, qword[rbp-8]
	mov rsi, rbx
	mov rdi, 0
	call _long_fgets_pfd_tchar.size_t
	xor rax, rax
	leave
	ret
_int_toInteger_pchar.bool:
	push rbp
	mov rbp, rsp
	sub rsp, 32
	jmp .L0x69
.L0x68:
	inc rdi
.L0x69:
	mov rbx, rdi
	cmp byte[rbx], 32
	je .L0x68
.L0x6a:
	mov rbx, rdi
	mov bl, byte[rbx]
	mov byte[rbp-8], bl
	mov dword[rbp-16], 0
	mov byte[rbp-24], 0
	cmp byte[rbp-8], 45
	sete bl
	and bl, sil
	jz .L0x6b
	mov byte[rbp-24], 1
	inc rdi
	mov rbx, rdi
	mov bl, byte[rbx]
	mov byte[rbp-8], bl
	jmp .L0x6c
.L0x6b:
.L0x6c:
	jmp .L0x6e
.L0x6d:
	mov r10d, 10
	mov ebx, dword[rbp-16]
	imul ebx, r10d
	mov r10b, byte[rbp-8]
	sub r10b, 48
	xor r11, r11
	mov r11b, r10b
	add ebx, r11d
	mov dword[rbp-16], ebx
	inc rdi
	mov rbx, rdi
	mov bl, byte[rbx]
	mov byte[rbp-8], bl
.L0x6e:
	test bl, bl
	setnz bl
	cmp byte[rbp-8], 10
	setne r10b
	and bl, r10b
	cmp byte[rbp-8], 32
	setne r10b
	and bl, r10b
	jnz .L0x6d
.L0x6f:
	mov al, byte[rbp-24]
	test al, al
	jz .L0x70
	xor r10d, r10d
	sub r10d, dword[rbp-16]
	mov eax, r10d
	jmp ___int_toInteger_pchar.bool__return
	jmp .L0x71
.L0x70:
.L0x71:
	mov ebx, dword[rbp-16]
	mov eax, ebx
___int_toInteger_pchar.bool__return:
	leave
	ret
_int___scanf_pchar.void..fd_tbool:
	push rbp
	mov rbp, rsp
	sub rsp, 56
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	mov [rbp-24], rdx
	mov [rbp-32], rcx
	mov al, byte[rbp-32]
	test al, al
	jz .L0x5c
	mov rdi, 1000
	call _void._mapalloc_psize_t
	mov r10, rax
	mov qword[rbp-40], r10
	mov rdx, 1000
	mov rbx, qword[rbp-40]
	mov rsi, rbx
	mov rbx, qword[rbp-24]
	mov rdi, rbx
	call _long_fgets_pfd_tchar.size_t
	jmp .L0x5d
.L0x5c:
	mov rbx, qword[rbp-24]
	mov rdi, rbx
	call _void._floads_pfd_t
	mov r10, rax
	mov qword[rbp-40], r10
.L0x5d:
	mov rbx, qword[rbp-16]
	mov rdx, rbx
	mov rbx, qword[rbp-40]
	mov rsi, rbx
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _int___SSCANF_pchar.char.void..
	mov r10, rax
	mov dword[rbp-48], r10d
	mov rdi, qword[rbp-40]
	call _void_mapfree_pvoid.
	mov ebx, dword[rbp-48]
	mov eax, ebx
___int___scanf_pchar.void..fd_tbool__return:
	leave
	ret
scanf:
	push rbp
	mov rbp, rsp
	sub rsp, 104
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	mov [rbp-24], rdx
	mov [rbp-32], rcx
	mov [rbp-40], r8
	mov [rbp-48], r9
	lea rbx, [rbp-96] 
	mov r11, qword[rbp-16]
	mov [rbx], r11
	mov r10, 1
	lea rbx, [rbp-96] 
	mov r11, qword[rbp-24]
	mov [rbx+r10*8], r11
	mov r10, 2
	lea rbx, [rbp-96] 
	mov r11, qword[rbp-32]
	mov [rbx+r10*8], r11
	mov r10, 3
	lea rbx, [rbp-96] 
	mov r11, qword[rbp-40]
	mov [rbx+r10*8], r11
	mov r10, 4
	lea rbx, [rbp-96] 
	mov r11, qword[rbp-48]
	mov [rbx+r10*8], r11
	mov rcx, 1
	mov rdx, 0
	lea rbx, [rbp-96]
	mov rsi, rbx
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _int___scanf_pchar.void..fd_tbool
__scanf__return:
	leave
	ret
fscanf:
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
	mov r11, qword[rbp-32]
	mov [rbx+r10*8], r11
	mov r10, 2
	lea rbx, [rbp-88] 
	mov r11, qword[rbp-40]
	mov [rbx+r10*8], r11
	mov r10, 3
	lea rbx, [rbp-88] 
	mov r11, qword[rbp-48]
	mov [rbx+r10*8], r11
	mov rcx, 0
	mov rbx, qword[rbp-8]
	mov rdx, rbx
	lea rbx, [rbp-88]
	mov rsi, rbx
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	call _int___scanf_pchar.void..fd_tbool
__fscanf__return:
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
.L0x49:
	mov r10, rax
	mov qword[rbp-16], r10
	mov rbx, qword[rbp-16]
	test rbx, rbx
	jnz .L0x4b
	mov r10b, 2
	mov rbx, __systemcallargvconst
	xor rax, rax
	mov al, r10b
	lea rbx, [rbx+rax*8]
	mov r11, qword[rbp-8]
	mov [rbx], r11
	mov rdx, __emptyenv
	mov rsi, __systemcallargvconst
	mov rdi, __systembashpath
	mov rax , 59 
	mov r10 , rcx 
	syscall 
.L0x51:
	mov r10, rax
	mov qword[rbp-24], r10
	mov rbx, qword[rbp-24]
	mov rdi, rbx
	call _char._strerror_plong
	mov rdi, rax
	call _size_t_puts_pchar.
.L0x54:
	jmp .L0x4c
.L0x4b:
.L0x4c:
	xor rdx, rdx
	xor rsi, rsi
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	mov rax, 61
	xor r8, r8
	syscall
.L0x5a:
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
	jz .L0x44__end
	mov eax, [rdi]
	mov [rsi], eax
.L0x44__end:
.L0x43:
	mov rbx, qword[rbp-32]
	mov ebx, dword[rbx]
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
	test ebx, ebx
	jz .L0x2a
	jmp .L0x2d
.L0x2c:
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
	jz .L0x2f
	mov rdx, 2
	mov rsi, 0
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	mov r9, 0
	mov r8, 0
	mov rcx, 0
	mov rax , 202 
	mov r10 , rcx 
	syscall 
.L0x37:
	mov rbx, rax
	pop rsi
.L0x32:
	jmp .L0x30
.L0x2f:
.L0x30:
	mov rdx, 2
	mov rsi, 0
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _void_mutex_cmpxchg_pmutex.intint
	mov rbx, rax
	mov dword[rbp-16], ebx
	test ebx, ebx
	jnz .L0x3a
	mov rdi, LC.S170
	call _size_t_puts_pchar.
.L0x3d:
	jmp .L0x2e
	jmp .L0x3b
.L0x3a:
.L0x3b:
.L0x2d:
	jmp .L0x2c
.L0x2e:
	jmp .L0x2b
.L0x2a:
.L0x2b:
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
.L0x17:
	push rax
	mov r10d, 1
	pop rbx
	cmp ebx, r10d
	je .L0x19
	xor rsi, rsi
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	lock xchg dword[rdi], esi
.L0x1f:
	mov rdx, 2
	mov rsi, 0
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	mov r9, 0
	mov r8, 0
	mov rcx, 0
	mov rax , 202 
	mov r10 , rcx 
	syscall 
.L0x27:
	mov rbx, rax
	pop rsi
.L0x22:
	jmp .L0x1a
.L0x19:
.L0x1a:
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
.L0x11:
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
	jnz .L0xb__end
	mov rdi, r15
	mov rsi, r14
	mov rdx, r13
	call _long___enterthread_p__threadcallablethread_t.void.
	mov rdi, rax
	call _void___thrdext_plong
.L0xb__end:
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
.L0x8:
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
main:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov [rbp-8], rdi
	mov ebx, dword[rbp-8]
	cvtsi2sd xmm7, ebx
	movq rsi, xmm7
	mov rdi, LC.S171
	call printf
	call _void_benchmark_p
	xor rax, rax
__main__return:
	leave
	ret
_void_benchmark_p:
	push rbp
	mov rbp, rsp
	sub rsp, 1024
	mov rsi, 1000
	lea rbx, [rbp-1008]
	mov rdi, rbx
	call _void_memzer_pvoid.size_t
	mov qword[rbp-1016], 0
	jmp .L0x1
.L0x0:
	mov r8, qword[LC.F30]
	mov rcx, LC.S173
	mov rdx, 123
	mov rsi, LC.S172
	lea rbx, [rbp-1008]
	mov rdi, rbx
	call sprintf
.L0x2:
	inc qword[rbp-1016]
.L0x1:
	cmp qword[rbp-1016], 25000000
	jl .L0x0
.L0x3:
	lea rbx, [rbp-1008]
	mov rdi, rbx
	call _size_t_puts_pchar.
	xor rax, rax
	leave
	ret
	