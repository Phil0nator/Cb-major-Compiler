bits 64
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
global _char._strerror_pvoid:
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
	global sscanf
global _int___SSCANF_pchar.char.void..:
	global sscanf
	extern sscanf
	extern sscanf
	extern sscanf
	extern sscanf
global _int_inet_aton_pchar.in_addr.:
global _int_recv_pfd_tchar.size_tint:
global _int_send_pfd_tchar.size_tint:
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
global _void_.operator33_pVec3fVec3f.:
global _void_.operator34_pVec3fVec3f.:
global _void_.operator36_pVec3fVec3f.:
global _void_.operator35_pVec3fVec3f.:
global _double_.operator20_pVec3fVec3f.:
global _err_t_init_pSocket:
global _err_t_init_pSocketintintint:
global _err_t_connect_pSocketchar.int:
global _ssize_t_send_pSocketchar.:
global _ssize_t_send_pSocketchar.size_t:
global _err_t_close_pSocket:
global _ssize_t_recv_pSocketchar.size_t:
global _err_t_init_pSocket:
global _err_t_init_pSocketintintint:
global _err_t_connect_pSocketchar.int:
global _ssize_t_send_pSocketchar.:
global _ssize_t_send_pSocketchar.size_t:
global _err_t_close_pSocket:
global _ssize_t_recv_pSocketchar.size_t:
	global scanf
	global fscanf
global _int_getInt_pchar.:
global _uint_getUint_pchar.:
global _char_getchar_p:
global _size_t_getString_pchar.size_tchar.:
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
	section .data align=8
__linux_errstrlist: DQ __LC.S0, __LC.S1, __LC.S2, __LC.S3, __LC.S4, __LC.S5, __LC.S6, __LC.S7, __LC.S8, __LC.S9, __LC.S10, __LC.S11, __LC.S12, __LC.S13, __LC.S14, __LC.S15, __LC.S16, __LC.S17, __LC.S18, __LC.S19, __LC.S20, __LC.S21, __LC.S22, __LC.S23, __LC.S24, __LC.S25, __LC.S26, __LC.S27, __LC.S28, __LC.S29, __LC.S30, __LC.S31, __LC.S32, __LC.S33, __LC.S34, __LC.S35, __LC.S36, __LC.S37, __LC.S38, __LC.S39, __LC.S40, __LC.S41, __LC.S42, __LC.S43, __LC.S44, __LC.S45, __LC.S46, __LC.S47, __LC.S48, __LC.S49, __LC.S50, __LC.S51, __LC.S52, __LC.S53, __LC.S54, __LC.S55, __LC.S56, __LC.S57, __LC.S58, __LC.S59, __LC.S60, __LC.S61, __LC.S62, __LC.S63, __LC.S64, __LC.S65, __LC.S66, __LC.S67, __LC.S68, __LC.S69, __LC.S70, __LC.S71, __LC.S72, __LC.S73, __LC.S74, __LC.S75, __LC.S76, __LC.S77, __LC.S78, __LC.S79, __LC.S80, __LC.S81, __LC.S82, __LC.S83, __LC.S84, __LC.S85, __LC.S86, __LC.S87, __LC.S88, __LC.S89, __LC.S90, __LC.S91, __LC.S92, __LC.S93, __LC.S94, __LC.S95, __LC.S96, __LC.S97, __LC.S98, __LC.S99, __LC.S100, __LC.S101, __LC.S102, __LC.S103, __LC.S104, __LC.S105, __LC.S106, __LC.S107, __LC.S108, __LC.S109, __LC.S110, __LC.S111, __LC.S112, __LC.S113, __LC.S114, __LC.S115, __LC.S116, __LC.S117, __LC.S118, __LC.S119, __LC.S120, __LC.S121, __LC.S122, __LC.S123, __LC.S124, __LC.S125, __LC.S126, __LC.S127, __LC.S128
__LC.F0: dq 0x0.0p+0
M_MINZERO_MEM: dq 0
__numbercharactersbase1016: DQ `0123456789abcdef`
malloc_maxcache: DQ 524288
free_head: DQ 0
cached_size: DQ 0
appends: DQ 0
deletions: DQ 0
rand_next: DQ 1
mdays: DD 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31
wday_name: DQ __LC.S145, __LC.S146, __LC.S147, __LC.S148, __LC.S149, __LC.S150, __LC.S151
mon_name: DQ __LC.S152, __LC.S153, __LC.S154, __LC.S155, __LC.S156, __LC.S157, __LC.S158, __LC.S159, __LC.S160, __LC.S161, __LC.S162, __LC.S163
asctime__result_buf: DB 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 0
__systembashpath: DQ `/bin/bash`
__emptyenv: DQ __LC.S168, 0, 0
__systemcallargvconst: DQ __LC.S169, __LC.S170, 0, 0
clone_threadflags: DQ 4001553
__LC.S0: db `Operation not permitted`, 0
__LC.S1: db `No such file or directory`, 0
__LC.S2: db `No such process`, 0
__LC.S3: db `Interrupted system call`, 0
__LC.S4: db `I/O error`, 0
__LC.S5: db `No such device or address`, 0
__LC.S6: db `Argument list too long`, 0
__LC.S7: db `Exec format error`, 0
__LC.S8: db `Bad file number`, 0
__LC.S9: db `No child processes`, 0
__LC.S10: db `Try again`, 0
__LC.S11: db `Out of memory`, 0
__LC.S12: db `Permission denied`, 0
__LC.S13: db `Bad address`, 0
__LC.S14: db `Block device required`, 0
__LC.S15: db `Device or resource busy`, 0
__LC.S16: db `File exists`, 0
__LC.S17: db `Cross-device link`, 0
__LC.S18: db `No such device`, 0
__LC.S19: db `Not a directory`, 0
__LC.S20: db `Is a directory`, 0
__LC.S21: db `Invalid argument`, 0
__LC.S22: db `File table overflow`, 0
__LC.S23: db `Too many open files`, 0
__LC.S24: db `Not a typewriter`, 0
__LC.S25: db `Text file busy`, 0
__LC.S26: db `File too large`, 0
__LC.S27: db `No space left on device`, 0
__LC.S28: db `Illegal seek`, 0
__LC.S29: db `Read-only file system`, 0
__LC.S30: db `Too many links`, 0
__LC.S31: db `Broken pipe`, 0
__LC.S32: db `Math argument out of domain of func`, 0
__LC.S33: db `Math result not representable`, 0
__LC.S34: db `Resource deadlock would occur`, 0
__LC.S35: db `File name too long`, 0
__LC.S36: db `No record locks available`, 0
__LC.S37: db `Function not implemented`, 0
__LC.S38: db `Directory not empty`, 0
__LC.S39: db `Too many symbolic links encountered`, 0
__LC.S40: db `No message of desired type`, 0
__LC.S41: db `Identifier removed`, 0
__LC.S42: db `Channel number out of range`, 0
__LC.S43: db `Level 2 not synchronized`, 0
__LC.S44: db `Level 3 halted`, 0
__LC.S45: db `Level 3 reset`, 0
__LC.S46: db `Link number out of range`, 0
__LC.S47: db `Protocol driver not attached`, 0
__LC.S48: db `No CSI structure available`, 0
__LC.S49: db `Level 2 halted`, 0
__LC.S50: db `Invalid exchange`, 0
__LC.S51: db `Invalid request descriptor`, 0
__LC.S52: db `Exchange full`, 0
__LC.S53: db `No anode`, 0
__LC.S54: db `Invalid request code`, 0
__LC.S55: db `Invalid slot`, 0
__LC.S56: db `Bad font file format`, 0
__LC.S57: db `Device not a stream`, 0
__LC.S58: db `No data available`, 0
__LC.S59: db `Timer expired`, 0
__LC.S60: db `Out of streams resources`, 0
__LC.S61: db `Machine is not on the network`, 0
__LC.S62: db `Package not installed`, 0
__LC.S63: db `Object is remote`, 0
__LC.S64: db `Link has been severed`, 0
__LC.S65: db `Advertise error`, 0
__LC.S66: db `Srmount error`, 0
__LC.S67: db `Communication error on send`, 0
__LC.S68: db `Protocol error`, 0
__LC.S69: db `Multihop attempted`, 0
__LC.S70: db `RFS specific error`, 0
__LC.S71: db `Not a data message`, 0
__LC.S72: db `Value too large for defined data type`, 0
__LC.S73: db `Name not unique on network`, 0
__LC.S74: db `File descriptor in bad state`, 0
__LC.S75: db `Remote address changed`, 0
__LC.S76: db `Can not access a needed shared library`, 0
__LC.S77: db `Accessing a corrupted shared library`, 0
__LC.S78: db `.lib section in a.out corrupted`, 0
__LC.S79: db `Attempting to link in too many shared libraries`, 0
__LC.S80: db `Cannot exec a shared library directly`, 0
__LC.S81: db `Illegal byte sequence`, 0
__LC.S82: db `Interrupted system call should be restarted`, 0
__LC.S83: db `Streams pipe error`, 0
__LC.S84: db `Too many users`, 0
__LC.S85: db `Socket operation on non-socket`, 0
__LC.S86: db `Destination address required`, 0
__LC.S87: db `Message too long`, 0
__LC.S88: db `Protocol wrong type for socket`, 0
__LC.S89: db `Protocol not available`, 0
__LC.S90: db `Protocol not supported`, 0
__LC.S91: db `Socket type not supported`, 0
__LC.S92: db `Operation not supported on transport endpoint`, 0
__LC.S93: db `Protocol family not supported`, 0
__LC.S94: db `Address family not supported by protocol`, 0
__LC.S95: db `Address already in use`, 0
__LC.S96: db `Cannot assign requested address`, 0
__LC.S97: db `Network is down`, 0
__LC.S98: db `Network is unreachable`, 0
__LC.S99: db `Network dropped connection because of reset`, 0
__LC.S100: db `Software caused connection abort`, 0
__LC.S101: db `Connection reset by peer`, 0
__LC.S102: db `No buffer space available`, 0
__LC.S103: db `Transport endpoint is already connected`, 0
__LC.S104: db `Transport endpoint is not connected`, 0
__LC.S105: db `Cannot send after transport endpoint shutdown`, 0
__LC.S106: db `Too many references: cannot splice`, 0
__LC.S107: db `Connection timed out`, 0
__LC.S108: db `Connection refused`, 0
__LC.S109: db `Host is down`, 0
__LC.S110: db `No route to host`, 0
__LC.S111: db `Operation already in progress`, 0
__LC.S112: db `Operation now in progress`, 0
__LC.S113: db `Stale NFS file handle`, 0
__LC.S114: db `Structure needs cleaning`, 0
__LC.S115: db `Not a XENIX named type file`, 0
__LC.S116: db `No XENIX semaphores available`, 0
__LC.S117: db `Is a named type file`, 0
__LC.S118: db `Remote I/O error`, 0
__LC.S119: db `Quota exceeded`, 0
__LC.S120: db `No medium found`, 0
__LC.S121: db `Wrong medium type`, 0
__LC.S122: db `Operation Canceled`, 0
__LC.S123: db `Required key not available`, 0
__LC.S124: db `Key has expired`, 0
__LC.S125: db `Key has been revoked`, 0
__LC.S126: db `Key was rejected by service`, 0
__LC.S127: db `Owner died`, 0
__LC.S128: db `State not recoverable`, 0
__LC.S129: db `Unkown Error Code.`, 0
__LC.S130: db `0123456789abcdef`, 0
__LC.S131: db `QNaN`, 0
__LC.S132: db `SNaN`, 0
__LC.S133: db `NaN`, 0
__LC.S134: db `Inf`, 0
__LC.S135: db `-Inf`, 0
__LC.S136: db `False`, 0
__LC.S137: db `True`, 0
__LC.S138: db `%s:%i: Assertion '%s' failed.\n`, 0
__LC.S139: db `=======================\n`, 0
__LC.S140: db `EMPTY\n`, 0
__LC.S141: db `BLOCK: %i @ %x : %i\n`, 0
__LC.S142: db `Appends: %i, Deletions %i, Cache: %u\n`, 0
__LC.S143: db `=======================\n`, 0
__LC.S144: db `Malloc:%i: Bad mmap: `, 0
__LC.S145: db `Sun`, 0
__LC.S146: db `Mon`, 0
__LC.S147: db `Tue`, 0
__LC.S148: db `Wed`, 0
__LC.S149: db `Thu`, 0
__LC.S150: db `Fri`, 0
__LC.S151: db `Sat`, 0
__LC.S152: db `Jan`, 0
__LC.S153: db `Feb`, 0
__LC.S154: db `Mar`, 0
__LC.S155: db `Apr`, 0
__LC.S156: db `May`, 0
__LC.S157: db `Jun`, 0
__LC.S158: db `Jul`, 0
__LC.S159: db `Aug`, 0
__LC.S160: db `Sep`, 0
__LC.S161: db `Oct`, 0
__LC.S162: db `Nov`, 0
__LC.S163: db `Dec`, 0
__LC.S164: db `%i `, 0
__LC.S165: db `%i:%i:%i %i`, 0
__LC.S166: db `%i.%i.%i.%i`, 0
__LC.S167: db `/bin/bash`, 0
__LC.S168: db `PATH=/bin:/usr/bin:/sbin:/usr/sbin`, 0
__LC.S169: db `sudo`, 0
__LC.S170: db `-c`, 0
__LC.S171: db `LOCKED`, 0
__LC.S172: db `[%i, %i, %i, %i, %i]`, 0
__LC.S173: db `Lost connection to host.`, 0
__LC.S174: db `123hd0.5: \t %i%s%f`, 0
__LC.S175: db `hd`, 0
	section .bss align=8
__tmbuf: resb 36
__internaltime: resb 8
	section .text align=16
	global main
_long_toStr_plongchar.boollong:
	push rbp
	mov rbp, rsp
	sub rsp, 127
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	mov [rbp-24], rdx
	mov [rbp-32], rcx
	mov rbx, qword[rbp-8]
	test rbx, rbx
	jnz .L0x95
	mov rbx, qword[rbp-16]
	mov byte[rbx], 48
	mov rax, 2
	jmp ___long_toStr_plongchar.boollong__return
	jmp .L0x96
.L0x95:
.L0x96:
	mov byte[rbp-40], 0
	cmp qword[rbp-8], 0
	setl bl
	and bl, byte[rbp-24]
	jz .L0x97
	mov rbx, qword[rbp-16]
	mov byte[rbx], 45
	add qword[rbp-16], 1
	xor r10, r10
	sub r10, qword[rbp-8]
	mov qword[rbp-8], r10
	mov byte[rbp-40], 1
	jmp .L0x98
.L0x97:
.L0x98:
	mov rdx, 64
	mov sil, 0
	lea rbx, [rbp-111]
	mov rdi, rbx
	call _void_memset_pvoid.ucharsize_t
	mov qword[rbp-119], 0
	jmp .L0x9a
.L0x99:
	lea rbx, [rbp-127]
	mov rdx, rbx
	mov rbx, qword[rbp-32]
	mov rsi, rbx
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _long_divmod_plonglonglong.
	mov r10, rax
	mov qword[rbp-8], r10
	mov r10, qword[rbp-119]
	lea rbx, [rbp-111] 
	lea r11, [rbx+r10*1]
	mov r10, qword[rbp-127]
	mov rbx, __numbercharactersbase1016
	mov r12b, [rbx+r10*1]
	mov [r11], r12b
	add qword[rbp-119], 1
.L0x9a:
	mov rbx, qword[rbp-8]
	test rbx, rbx
	jnz .L0x99
.L0x9b:
	sub qword[rbp-16], 1
	mov rbx, qword[rbp-119]
	mov dword[rbp-127], ebx
	jmp .L0x9d
.L0x9c:
	mov r10d, dword[rbp-127]
	mov rbx, qword[rbp-16]
	mov eax, r10d
	cdqe
	lea r10, [rbx+rax*1]
	mov r11d, dword[rbp-127]
	mov rbx, qword[rbp-119]
	movsxd r12, r11d
	sub rbx, r12
	lea r11, [rbp-111] 
	mov r12b, [r11+rbx*1]
	mov [r10], r12b
.L0x9e:
	sub dword[rbp-127], 1
.L0x9d:
	xor r10d, r10d
	cmp dword[rbp-127], r10d
	jg .L0x9c
.L0x9f:
	mov r10b, byte[rbp-40]
	mov rbx, qword[rbp-119]
	movsx eax, r10b
	cdqe
	add rbx, rax
	inc rbx
	mov rax, rbx
___long_toStr_plongchar.boollong__return:
	leave
	ret
_char._get_errstr_pvoid:
	cmp rdi, 131
	setl bl
	xor r11, r11
	cmp rdi, r11
	setge r10b
	and bl, r10b
	jz .L0x2
	mov r10, rdi
	mov rbx, __linux_errstrlist
	mov r11, [rbx+r10*8]
	mov rax, r11
	jmp ___char._get_errstr_pvoid__return
	jmp .L0x3
.L0x2:
.L0x3:
	mov rax, __LC.S129
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
	mov eax, r10d
	mov r10d, [rbx+rax*4]
	mov dword[rbp-48], r10d
	mov r10, 1
	mov rbx, qword[rbp-8]
	mov rax, rcx
	mov cl, bl
	shl r10, cl
	mov rcx, rax
	mov ebx, dword[rbp-48]
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
	jmp .L0xb
.L0xa:
	mov r10, qword[rbp-40]
	mov r10, qword[r10]
	mov rdi, r10
	call qword[rbp-32]
	cmp rax, 0
	jne .L0xe
	xor al, al
	jmp ___bool_all_of_raw_piterablesize_tsize_tvoid.__return
	jmp .L0xf
.L0xe:
.L0xf:
.L0xc:
	mov r11, qword[rbp-16]
	add qword[rbp-40], r11
.L0xb:
	cmp qword[rbp-40], rbx
	jl .L0xa
.L0xd:
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
	jmp .L0x11
.L0x10:
	mov r10, qword[rbp-40]
	mov r10, qword[r10]
	mov rdi, r10
	call qword[rbp-32]
	mov rbx, rax
	test rbx, rbx
	jz .L0x14
	mov al, 1
	jmp ___bool_any_of_raw_piterablesize_tsize_tvoid.__return
	jmp .L0x15
.L0x14:
.L0x15:
.L0x12:
	mov r11, qword[rbp-16]
	add qword[rbp-40], r11
.L0x11:
	cmp qword[rbp-40], rbx
	jl .L0x10
.L0x13:
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
	jmp .L0x17
.L0x16:
	mov r10, qword[rbp-40]
	mov r10, qword[r10]
	mov rdi, r10
	call qword[rbp-32]
	mov rbx, rax
	test rbx, rbx
	jz .L0x1a
	xor al, al
	jmp ___bool_none_of_raw_piterablesize_tsize_tvoid.__return
	jmp .L0x1b
.L0x1a:
.L0x1b:
.L0x18:
	mov r11, qword[rbp-16]
	add qword[rbp-40], r11
.L0x17:
	cmp qword[rbp-40], rbx
	jl .L0x16
.L0x19:
	mov al, 1
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
.L0x25:
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
	mov rdx, 4613937818241073152
	mov rax, rbx
	movq xmm0, rdx
	cvtsi2sd xmm1, rax
	divsd xmm1, xmm0
	cvttsd2si rbx, xmm1
	mov rax, rbx
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
.L0x2c_long_lop2_plong_flp:
	sar rdi, 1
	inc rax
	test rdi, rdi
	jnz .L0x2c_long_lop2_plong_flp
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
	je .L0x31
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
	jmp .L0x32
.L0x31:
.L0x32:
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
	je .L0x33
	mov rax, 4609753056924675352
	movq xmm7, rax
	movsd xmm8, qword[rbp-8]
	addsd xmm8, xmm7
	movsd xmm0, xmm8
	call _double_sin_pdouble
	movq rax, xmm0
	jmp ___double_cos_pdouble__return
	jmp .L0x34
.L0x33:
.L0x34:
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
	je .L0x35
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
	jmp .L0x36
.L0x35:
.L0x36:
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
	je .L0x37
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
	jmp .L0x38
.L0x37:
.L0x38:
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
	je .L0x39
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
	jmp .L0x3a
.L0x39:
.L0x3a:
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
	je .L0x3b
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
	jmp .L0x3c
.L0x3b:
.L0x3c:
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
	jz .L0x3d
	mov rax, 9221120237041090561
	movq xmm0, rax
	jmp ___double_asin_pdouble__return
	jmp .L0x3e
.L0x3d:
.L0x3e:
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
	jz .L0x3f
	mov rax, 9221120237041090561
	movq xmm0, rax
	jmp ___double_acos_pdouble__return
	jmp .L0x40
.L0x3f:
.L0x40:
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
	jne .L0x4d
	mov rax, 4605249457297304856
	movq xmm7, rax
	xor rbx, rbx
	cvtsi2sd xmm8, rbx
	subsd xmm8, xmm7
	movsd xmm0, xmm8
	jmp ___double_atan_pdouble__return
	jmp .L0x4e
.L0x4d:
	mov rax, 4607182418800017408
	movq xmm7, rax
	movsd xmm8, qword[rbp-8]
	comisd xmm8, xmm7
	jne .L0x4f
	mov rax, 4605249457297304856
	movq xmm7, rax
	movsd xmm0, xmm7
	jmp ___double_atan_pdouble__return
	jmp .L0x50
.L0x4f:
	xor rax, rax
	movq xmm7, rax
	movsd xmm8, qword[rbp-8]
	comisd xmm8, xmm7
	jne .L0x51
	xor rax, rax
	cvtsi2sd xmm0, rax
	jmp ___double_atan_pdouble__return
	jmp .L0x52
.L0x51:
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
	jz .L0x53
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
	jmp .L0x54
.L0x53:
	mov rax, 13830554455654793216
	movq xmm7, rax
	movsd xmm8, qword[rbp-8]
	comisd xmm8, xmm7
	jge .L0x55
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
	jmp .L0x56
.L0x55:
	mov rax, 4607182418800017408
	movq xmm7, rax
	movsd xmm8, qword[rbp-8]
	comisd xmm8, xmm7
	jle .L0x57
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
	jmp .L0x58
.L0x57:
.L0x58:
.L0x56:
.L0x54:
.L0x52:
.L0x50:
.L0x4e:
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
	jmp .L0x63
.L0x62:
	mov r10, rdi
	cmp byte[r10], sil
	jne .L0x65
	mov rax, rdi
	jmp ___char._memchr_pchar.charsize_t__return
	jmp .L0x66
.L0x65:
.L0x66:
	inc rdi
.L0x63:
	cmp rdi, rbx
	jl .L0x62
.L0x64:
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
	jmp .L0x6d
.L0x6c:
	mov r11, rdi
	mov r12, rsi
	mov r11b, byte[r11]
	cmp r11b, byte[r12]
	jge .L0x6f
	dec ebx
	jmp .L0x70
.L0x6f:
	inc ebx
.L0x70:
	inc rdi
	inc rsi
.L0x6d:
	cmp rdi, r10
	jl .L0x6c
.L0x6e:
	mov eax, ebx
___int_memcmp_pchar.char.size_t__return:
	leave
	ret
_char._strchr_pchar.char:
	jmp .L0x77
.L0x76:
	mov rbx, rdi
	cmp byte[rbx], sil
	jne .L0x79
	mov rax, rdi
	jmp ___char._strchr_pchar.char__return
	jmp .L0x7a
.L0x79:
.L0x7a:
	inc rdi
.L0x77:
	mov rbx, rdi
	mov bl, byte[rbx]
	test bl, bl
	jnz .L0x76
.L0x78:
	xor rax, rax
___char._strchr_pchar.char__return:
	ret
_char._strerror_pvoid:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov [rbp-8], rdi
	cmp qword[rbp-8], 0
	jl .L0x7b
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _char._get_errstr_pvoid
	jmp ___char._strerror_pvoid__return
	jmp .L0x7c
.L0x7b:
	xor r10, r10
	sub r10, qword[rbp-8]
	mov rdi, r10
	call _char._get_errstr_pvoid
	jmp ___char._strerror_pvoid__return
.L0x7c:
	xor rax, rax
___char._strerror_pvoid__return:
	leave
	ret
_long_divmod10_plonglong.:
	mov rbx, rsi
	mov r10, rdi
	mov rdx, 4621819117588971520
	mov rax, r10
	movq xmm0, rdx
	cvtsi2sd xmm1, rax
	divsd xmm1, xmm0
	cvttsd2si r10, xmm1
	mov rdx, 10
	imul rdx
	sub r10, rax
	mov [rbx], r10
	mov rdx, 4621819117588971520
	mov rax, rdi
	movq xmm0, rdx
	cvtsi2sd xmm1, rax
	divsd xmm1, xmm0
	cvttsd2si rdi, xmm1
	mov rax, rdi
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
	jmp .L0x84
.L0x83:
	mov r10, 1
	mov rbx, rsi
	and rbx, r10
	jz .L0x87
	mov rbx, rdi
	mov byte[rbx], 49
	jmp .L0x88
.L0x87:
	mov rbx, rdi
	mov byte[rbx], 48
.L0x88:
	shr rsi, 1
	dec rdi
.L0x85:
	add dword[rbp-16], 1
.L0x84:
	mov r10d, dword[rbp-8]
	cmp dword[rbp-16], r10d
	jl .L0x83
.L0x86:
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
	jne .L0x89
	mov rsi, __LC.S131
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	call _long_strcpy_pchar.char.
	mov rax, 4
	jmp ___long_toStr_pdoublechar.long__return
	jmp .L0x8a
.L0x89:
	movsd xmm7, qword[rbp-8]
	movq rbx, xmm7
	mov r10, 9218868437227405313
	cmp rbx, r10
	jne .L0x8b
	mov rsi, __LC.S132
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	call _long_strcpy_pchar.char.
	mov rax, 4
	jmp ___long_toStr_pdoublechar.long__return
	jmp .L0x8c
.L0x8b:
	movsd xmm7, qword[rbp-8]
	movq rbx, xmm7
	mov r10, 9223372036854775807
	cmp rbx, r10
	jne .L0x8d
	mov rsi, __LC.S133
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	call _long_strcpy_pchar.char.
	mov rax, 3
	jmp ___long_toStr_pdoublechar.long__return
	jmp .L0x8e
.L0x8d:
	mov rax, 4890904797277847552
	movq xmm7, rax
	movsd xmm8, qword[rbp-8]
	comisd xmm8, xmm7
	jne .L0x8f
	mov rsi, __LC.S134
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	call _long_strcpy_pchar.char.
	mov rax, 3
	jmp ___long_toStr_pdoublechar.long__return
	jmp .L0x90
.L0x8f:
	mov rax, 4895410595928473600
	movq xmm7, rax
	movsd xmm8, qword[rbp-8]
	comisd xmm8, xmm7
	jne .L0x91
	mov rsi, __LC.S135
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	call _long_strcpy_pchar.char.
	mov rax, 4
	jmp ___long_toStr_pdoublechar.long__return
	jmp .L0x92
.L0x91:
.L0x92:
.L0x90:
.L0x8e:
.L0x8c:
.L0x8a:
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
	jz .L0x93
	mov rbx, qword[rbp-16]
	mov byte[rbx], 45
	add qword[rbp-16], 1
	add qword[rbp-40], 1
	jmp .L0x94
.L0x93:
.L0x94:
	mov rcx, 10
	mov dl, 1
	mov rbx, qword[rbp-16]
	mov rsi, rbx
	mov rbx, qword[rbp-32]
	mov rdi, rbx
	call _long_toStr_plongchar.boollong
	add qword[rbp-40], rax
	mov rbx, qword[rbp-40]
	dec rbx
	add qword[rbp-16], rbx
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
.L0xaa:
	mov rdi, rax
	call _long_abs_plong
	mov r10, rax
	mov qword[rbp-48], r10
	mov rcx, 10
	mov dl, 1
	mov rbx, qword[rbp-16]
	mov rsi, rbx
	mov rbx, qword[rbp-48]
	mov rdi, rbx
	call _long_toStr_plongchar.boollong
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
	jmp .L0xad
.L0xac:
	mov rbx, qword[rbp-16]
	mov byte[rbx], 48
	add qword[rbp-16], 1
	add qword[rbp-40], 1
.L0xae:
	add qword[rbp-64], 1
.L0xad:
	mov r10, qword[rbp-56]
	cmp qword[rbp-64], r10
	jl .L0xac
.L0xaf:
	mov rcx, 10
	mov dl, 1
	mov rbx, qword[rbp-16]
	mov rsi, rbx
	mov rbx, qword[rbp-48]
	mov rdi, rbx
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
	jz .L0xb0
	xor eax, eax
	jmp ___int___sprintf_pchar.char.void.__return
	jmp .L0xb1
.L0xb0:
.L0xb1:
	jmp .L0xb3
.L0xb2:
	mov rbx, qword[rbp-16]
	cmp byte[rbx], 37
	je .L0xb5
	mov rbx, qword[rbp-8]
	mov r10, qword[rbp-16]
	mov r10b, byte[r10]
	mov [rbx], r10b
	add qword[rbp-8], 1
	jmp .L0xb6
.L0xb5:
	add qword[rbp-16], 1
	mov rbx, qword[rbp-16]
	mov bl, byte[rbx]
	mov byte[rbp-48], bl
	cmp byte[rbp-48], 105
	je .L0xb8
	cmp bl, 108
	je .L0xb9
	cmp bl, 99
	je .L0xba
	cmp bl, 120
	je .L0xbb
	cmp bl, 111
	je .L0xbc
	cmp bl, 117
	je .L0xbd
	cmp bl, 115
	je .L0xc0
	cmp bl, 66
	je .L0xc1
	cmp bl, 101
	je .L0xc4
	cmp bl, 102
	je .L0xc5
	cmp bl, 98
	je .L0xc6
	jmp .L0xb7
.L0xb8:
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
	movsxd rdi, dword[rbp-56]
	call _long_toStr_plongchar.boollong
	mov r11, rax
	mov qword[rbp-64], r11
	mov r10, qword[rbp-64]
	dec r10
	add qword[rbp-8], r10
	jmp .L0xb7
.L0xb9:
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
	mov r10, qword[rbp-72]
	mov rdi, r10
	call _long_toStr_plongchar.boollong
	mov r11, rax
	mov qword[rbp-80], r11
	mov r10, qword[rbp-80]
	dec r10
	add qword[rbp-8], r10
	jmp .L0xb7
.L0xba:
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
	add qword[rbp-8], 1
	jmp .L0xb7
.L0xbb:
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
	mov r10, qword[rbp-96]
	mov rdi, r10
	call _long_toStr_plongchar.boollong
	mov r11, rax
	mov qword[rbp-104], r11
	mov r10, qword[rbp-104]
	dec r10
	add qword[rbp-8], r10
	jmp .L0xb7
.L0xbc:
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
	mov r10, qword[rbp-112]
	mov rdi, r10
	call _long_toStr_plongchar.boollong
	mov r11, rax
	mov qword[rbp-120], r11
	mov r10, qword[rbp-120]
	dec r10
	add qword[rbp-8], r10
	jmp .L0xb7
.L0xbd:
	mov r11b, 1
	mov r10, qword[rbp-16]
	movsx eax, r11b
	cdqe
	mov r11b, [r10+rax*1]
	mov byte[rbp-128], r11b
	cmp byte[rbp-128], 108
	jne .L0xbe
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
	mov r10, qword[rbp-136]
	mov rdi, r10
	call _long_toStr_plongchar.boollong
	mov r10, rax
	mov dword[rbp-144], r10d
	dec r10d
	movsxd r11, r10d
	add qword[rbp-8], r11
	add qword[rbp-16], 1
	jmp .L0xbf
.L0xbe:
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
	mov r10, qword[rbp-136]
	mov rdi, r10
	call _long_toStr_plongchar.boollong
	mov r10, rax
	mov dword[rbp-144], r10d
	dec r10d
	movsxd r11, r10d
	add qword[rbp-8], r11
.L0xbf:
	jmp .L0xb7
.L0xc0:
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
	movsxd r10, dword[rbp-136]
	add qword[rbp-8], r10
	jmp .L0xb7
.L0xc1:
	mov r11d, dword[rbp-32]
	mov r10, qword[rbp-24]
	mov eax, r11d
	cdqe
	mov r11, [r10+rax*8]
	mov r10, r11
	mov byte[rbp-144], r10b
	mov r11, __LC.S136
	mov qword[rbp-152], r11
	mov al, byte[rbp-144]
	test al, al
	jz .L0xc2
	mov r11, __LC.S137
	mov qword[rbp-152], r11
	jmp .L0xc3
.L0xc2:
.L0xc3:
	mov r10, qword[rbp-152]
	mov rsi, r10
	mov r10, qword[rbp-8]
	mov rdi, r10
	call _long_strcpy_pchar.char.
	mov r10, rax
	mov dword[rbp-160], r10d
	movsxd r10, dword[rbp-160]
	add qword[rbp-8], r10
	jmp .L0xb7
.L0xc4:
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
	jmp .L0xb7
.L0xc5:
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
	jmp .L0xb7
.L0xc6:
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
	jne .L0xc7
	add qword[rbp-16], 1
	jmp .L0xc8
.L0xc7:
	cmp byte[rbp-216], 52
	jne .L0xc9
	mov dword[rbp-224], 32
	add qword[rbp-16], 1
	jmp .L0xca
.L0xc9:
	cmp byte[rbp-216], 50
	jne .L0xcb
	mov dword[rbp-224], 16
	add qword[rbp-16], 1
	jmp .L0xcc
.L0xcb:
	cmp byte[rbp-216], 49
	jne .L0xcd
	mov dword[rbp-224], 8
	add qword[rbp-16], 1
	jmp .L0xce
.L0xcd:
.L0xce:
.L0xcc:
.L0xca:
.L0xc8:
	mov r10d, dword[rbp-224]
	mov edx, r10d
	mov rsi, qword[rbp-208]
	mov r10, qword[rbp-8]
	mov rdi, r10
	call _size_t_toBinary_pchar.ulongint
	mov r11, rax
	mov qword[rbp-232], r11
	add qword[rbp-8], r11
	jmp .L0xb7
.L0xb7:
	add dword[rbp-32], 1
.L0xb6:
	add qword[rbp-16], 1
.L0xb3:
	mov rbx, qword[rbp-16]
	mov bl, byte[rbx]
	test bl, bl
	jnz .L0xb2
.L0xb4:
	mov r10, qword[rbp-8]
	sub r10, qword[rbp-40]
	mov eax, r10d
___int___sprintf_pchar.char.void.__return:
	leave
	ret
sprintf:
	push rbp
	mov rbp, rsp
	sub rsp, 96
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	mov [rbp-24], rdx
	mov [rbp-32], rcx
	mov [rbp-40], r8
	mov [rbp-48], r9
	lea rbx, [rbp-80] 
	mov r11, qword[rbp-24]
	mov [rbx], r11
	mov r10, 1
	lea rbx, [rbp-80] 
	lea r11, [rbx+r10*8]
	mov r10, qword[rbp-32]
	mov [r11], r10
	mov r10, 2
	lea rbx, [rbp-80] 
	lea r11, [rbx+r10*8]
	mov r10, qword[rbp-40]
	mov [r11], r10
	mov r10, 3
	lea rbx, [rbp-80] 
	lea r11, [rbx+r10*8]
	mov r10, qword[rbp-48]
	mov [r11], r10
	lea rbx, [rbp-80]
	mov rdx, rbx
	mov rbx, qword[rbp-16]
	mov rsi, rbx
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _int___sprintf_pchar.char.void.
	mov r10, rax
	mov dword[rbp-88], r10d
	mov ebx, dword[rbp-88]
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
	je .L0xd0
	cmp r10, 119
	je .L0xd1
	cmp r10, 97
	je .L0xd2
	cmp r10, 157
	je .L0xd3
	cmp r10, 162
	je .L0xd4
	cmp r10, 140
	je .L0xd5
	jmp .L0xcf
.L0xd0:
	mov dword[rbp-40], 0
	jmp .L0xcf
.L0xd1:
	mov dword[rbp-40], 1
	jmp .L0xcf
.L0xd2:
	mov dword[rbp-40], 1
	jmp .L0xcf
.L0xd3:
	mov dword[rbp-40], 2
	jmp .L0xcf
.L0xd4:
	mov dword[rbp-40], 2
	jmp .L0xcf
.L0xd5:
	mov dword[rbp-40], 2
	jmp .L0xcf
.L0xcf:
	mov r10, qword[rbp-32]
	mov rdx, r10
	mov r10d, dword[rbp-40]
	mov esi, r10d
	mov r10, qword[rbp-8]
	mov rdi, r10
	mov rax, 2
	mov r10, rcx
	syscall
.L0xd9:
	mov r10, rax
	mov qword[rbp-48], r10
	cmp qword[rbp-24], 140
	sete bl
	cmp qword[rbp-24], 97
	sete r10b
	or bl, r10b
	jz .L0xda
	mov edx, 2
	mov esi, 0
	mov rbx, qword[rbp-48]
	mov rdi, rbx
	mov rax, 8
	mov r10, rcx
	syscall
.L0xdf:
	jmp .L0xdb
.L0xda:
.L0xdb:
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
.L0xe3:
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
.L0xe7:
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
.L0xeb:
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
.L0xef:
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
.L0xf3:
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
.L0xf7:
	mov r10, rax
	mov qword[rbp-32], r10
	cmp qword[rbp-32], 0
	jge .L0xf8
	mov rax, qword[rbp-32]
	jmp ___void._floads_pfd_t__return
	jmp .L0xf9
.L0xf8:
.L0xf9:
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
	mov r9d, 0
	mov r8, 0
	mov rcx, 34
	mov rdx, 3
	mov rsi, rdi
	mov rdi, 0
	mov rax, 9
	mov r10, rcx
	syscall
.L0xff:
.L0xfb:
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
.L0x104:
	mov rsi, 10000
	mov rdi, qword[rbp-32]
	mov rax, 11
	mov r10, rcx
	syscall
.L0x108:
	xor rax, rax
	leave
	ret
printf:
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
	lea r11, [rbx+r10*8]
	mov r10, qword[rbp-24]
	mov [r11], r10
	mov r10, 2
	lea rbx, [rbp-96] 
	lea r11, [rbx+r10*8]
	mov r10, qword[rbp-32]
	mov [r11], r10
	mov r10, 3
	lea rbx, [rbp-96] 
	lea r11, [rbx+r10*8]
	mov r10, qword[rbp-40]
	mov [r11], r10
	mov r10, 4
	lea rbx, [rbp-96] 
	lea r11, [rbx+r10*8]
	mov r10, qword[rbp-48]
	mov [r11], r10
	mov rdx, 1
	lea rbx, [rbp-96]
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
	lea r11, [rbx+r10*8]
	mov r10, qword[rbp-24]
	mov [r11], r10
	mov r10, 2
	lea rbx, [rbp-96] 
	lea r11, [rbx+r10*8]
	mov r10, qword[rbp-32]
	mov [r11], r10
	mov r10, 3
	lea rbx, [rbp-96] 
	lea r11, [rbx+r10*8]
	mov r10, qword[rbp-40]
	mov [r11], r10
	mov r10, 4
	lea rbx, [rbp-96] 
	lea r11, [rbx+r10*8]
	mov r10, qword[rbp-48]
	mov [r11], r10
	mov rdx, 2
	lea rbx, [rbp-96]
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
	sub rsp, 88
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	mov [rbp-24], rdx
	mov [rbp-32], rcx
	mov [rbp-40], r8
	mov [rbp-48], r9
	lea rbx, [rbp-80] 
	mov r11, qword[rbp-24]
	mov [rbx], r11
	mov r10, 1
	lea rbx, [rbp-80] 
	lea r11, [rbx+r10*8]
	mov r10, qword[rbp-32]
	mov [r11], r10
	mov r10, 2
	lea rbx, [rbp-80] 
	lea r11, [rbx+r10*8]
	mov r10, qword[rbp-40]
	mov [r11], r10
	mov r10, 3
	lea rbx, [rbp-80] 
	lea r11, [rbx+r10*8]
	mov r10, qword[rbp-48]
	mov [r11], r10
	mov rbx, qword[rbp-8]
	mov rdx, rbx
	lea rbx, [rbp-80]
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
	jne .L0x109
	mov rcx, qword[rbp-32]
	movsxd rdx, dword[rbp-24]
	mov rsi, qword[rbp-16]
	mov rdi, __LC.S138
	call eprintf
	mov rdi, 1
	mov rax, 60
	mov r10, rcx
	syscall
.L0x10e:
	jmp .L0x10a
.L0x109:
.L0x10a:
	xor rax, rax
	leave
	ret
_void_merge_right_pmblock.:
	mov rbx, rdi
	mov rbx, [rbx+8]
	test rbx, rbx
	jz .L0x117
	mov rbx, rdi
	lea rbx, [rbx+8]
	mov r10, rbx
	cmp qword[r10+24], 1
	jne .L0x119
	mov rbx, rdi
	mov rbx, qword[rbx]
	mov r10, rdi
	lea r10, [r10+rbx+32]
	mov rbx, rdi
	cmp r10, qword[rbx]
	jne .L0x11b
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
	jz .L0x11d
	mov rbx, rdi
	lea rbx, [rbx+8]
	mov r10, rbx
	lea r10, [r10+16]
	mov r11, rdi
	mov [r10], r11
	jmp .L0x11e
.L0x11d:
.L0x11e:
	jmp .L0x11c
.L0x11b:
.L0x11c:
	jmp .L0x11a
.L0x119:
.L0x11a:
	jmp .L0x118
.L0x117:
.L0x118:
	xor rax, rax
	ret
_bool_scan_merge_pmblock.:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov [rbp-8], rdi
	mov r10, qword[malloc_maxcache]
	cmp qword[cached_size], r10
	jle .L0x11f
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
.L0x126:
.L0x122:
	xor al, al
	jmp ___bool_scan_merge_pmblock.__return
	jmp .L0x120
.L0x11f:
.L0x120:
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
	jnz .L0x12a
	mov r10, rdi
	mov qword[free_head], r10
	mov rbx, rdi
	lea rbx, [rbx+16]
	mov r11, rdi
	mov [rbx], r11
	mov rbx, rdi
	mov qword[rbx+8], 0
	jmp ___void_add_block_pmblock.__return
	jmp .L0x12b
.L0x12a:
.L0x12b:
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
	jnz .L0x12c
	xor rax, rax
	jmp ___mblock._scan_existing_psize_t__return
	jmp .L0x12d
.L0x12c:
.L0x12d:
	mov r10, qword[free_head]
	mov qword[rbp-16], r10
	jmp .L0x12f
.L0x12e:
	mov rbx, qword[rbp-16]
	cmp qword[rbx+24], 1
	jne .L0x132
	mov rbx, qword[rbp-16]
	mov rbx, qword[rbx]
	cmp rbx, qword[rbp-8]
	jl .L0x134
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
	jmp .L0x135
.L0x134:
.L0x135:
	jmp .L0x133
.L0x132:
.L0x133:
.L0x130:
	mov rbx, qword[rbp-16]
	mov rbx, [rbx+8]
	mov qword[rbp-16], rbx
.L0x12f:
	test rbx, rbx
	jnz .L0x12e
.L0x131:
	xor rax, rax
___mblock._scan_existing_psize_t__return:
	leave
	ret
_void_printstate_p:
	mov rdi, __LC.S139
	call _size_t_puts_pchar.
.L0x137:
	mov rbx, qword[free_head]
	test rbx, rbx
	jnz .L0x139
	mov rdi, __LC.S140
	call _size_t_puts_pchar.
.L0x13c:
	jmp .L0x13a
.L0x139:
	mov r10, qword[free_head]
	mov qword[rbp-8], r10
	jmp .L0x13f
.L0x13e:
	mov rbx, qword[rbp-8]
	mov rbx, [rbx+24]
	mov rcx, rbx
	mov rdx, qword[rbp-8]
	mov rbx, qword[rbp-8]
	mov rbx, qword[rbx]
	mov rsi, rbx
	mov rdi, __LC.S141
	call printf
.L0x140:
	mov rbx, qword[rbp-8]
	mov rbx, [rbx+8]
	mov qword[rbp-8], rbx
.L0x13f:
	test rbx, rbx
	jnz .L0x13e
.L0x141:
.L0x13a:
	mov rcx, qword[cached_size]
	mov rdx, qword[deletions]
	mov rsi, qword[appends]
	mov rdi, __LC.S142
	call printf
	mov rdi, __LC.S143
	call _size_t_puts_pchar.
.L0x143:
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
.L0x14a:
.L0x146:
	mov r10, rax
	mov qword[rbp-16], r10
	cmp r10, 0
	jle .L0x14c
	mov rax, qword[rbp-16]
	jmp ___mblock._create_ptr_psize_t__return
	jmp .L0x14d
.L0x14c:
.L0x14d:
	mov rdi, qword[rbp-16]
	call _char._strerror_pvoid
	mov rdx, rax
	mov rsi, 206
	mov rdi, __LC.S144
	call printf
	mov rdi, 1
	mov rax, 60
	mov r10, rcx
	syscall
.L0x151:
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
	jg .L0x156
	jmp ___void_split_block_pmblock.size_t__return
	jmp .L0x157
.L0x156:
.L0x157:
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
	jz .L0x158
	mov rbx, rdi
	lea rbx, [rbx+8]
	mov r10, rbx
	lea r10, [r10+16]
	mov r11, qword[rbp-8]
	mov [r10], r11
	jmp .L0x159
.L0x158:
.L0x159:
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
	jnz .L0x15a
	jmp ___void_free_pvoid.__return
	jmp .L0x15b
.L0x15a:
.L0x15b:
	mov rbx, qword[rbp-8]
	sub rbx, 32
	mov qword[rbp-16], rbx
	cmp qword[rbx], 4096
	jl .L0x15c
	mov rbx, qword[rbp-16]
	add qword[rbx], 32
	mov rbx, qword[rbp-16]
	mov rbx, qword[rbx]
	add rbx, 32
	mov rsi, rbx
	mov rax, 11
	mov r10, rcx
	syscall
.L0x163:
.L0x15f:
	jmp ___void_free_pvoid.__return
	jmp .L0x15d
.L0x15c:
.L0x15d:
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
	jl .L0x165
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
	jmp .L0x166
.L0x165:
.L0x166:
	mov rbx, qword[free_head]
	test rbx, rbx
	jz .L0x167
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _mblock._scan_existing_psize_t
	mov r10, rax
	mov qword[rbp-16], r10
	mov rax, qword[rbp-16]
	test rax, rax
	jz .L0x169
	mov rbx, qword[rbp-16]
	mov qword[rbx+24], 0
	mov rbx, qword[rbp-16]
	add rbx, 32
	mov rax, rbx
	jmp ___void._malloc_psize_t__return
	jmp .L0x16a
.L0x169:
.L0x16a:
	jmp .L0x168
.L0x167:
.L0x168:
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
	jge .L0x16b
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _void_free_pvoid.
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	call _void._malloc_psize_t
	mov r10, rax
	mov qword[rbp-40], r10
	cmp qword[rbp-8], r10
	jne .L0x16d
	mov rbx, qword[rbp-8]
	mov rax, rbx
	jmp ___void._realloc_pvoid.size_t__return
	jmp .L0x16e
.L0x16d:
.L0x16e:
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
	jmp .L0x16c
.L0x16b:
.L0x16c:
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
.L0x172:
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
.L0x178:
.L0x174:
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
.L0x17d:
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
.L0x181:
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
.L0x185avxmemzeraligned_lp:
	vmovdqu [rdi], ymm0
	add rdi, 4
	sub rsi, 4
	jnz .L0x185avxmemzeraligned_lp
	ret
_void_avx_memzer_pvoid.size_t:
	push rbp
	mov rbp, rsp
	sub rsp, 40
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	mov rbx, qword[rbp-16]
	mov rdx, 4629700416936869888
	mov rax, rbx
	movq xmm0, rdx
	cvtsi2sd xmm1, rax
	divsd xmm1, xmm0
	cvttsd2si rbx, xmm1
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
	jz .L0x186
	mov ebx, dword[rbp-24]
	movsxd r10, ebx
	mov rdx, r10
	mov sil, 0
	mov r10, qword[rbp-8]
	add r10, qword[rbp-32]
	mov rdi, r10
	call _void_memset_pvoid.ucharsize_t
	jmp .L0x187
.L0x186:
.L0x187:
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
.L0x18b:
	mov [rdi+rsi], bl
	dec rsi
	jnz .L0x18b
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
.L0x190:
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
	sub rsp, 32
	lea rbx, [rbp-24]
	mov rsi, rbx
	mov rdi, 2
	mov rax, 228
	mov r10, rcx
	syscall
.L0x195:
	mov rbx, rax
	test rbx, rbx
	jz .L0x196
	mov rax, -1
	jmp ___clock_t_clock_p__return
	jmp .L0x197
.L0x196:
.L0x197:
	mov r10, 9223372036854
	cmp qword[rbp-24], r10
	setg bl
	mov r10, qword[rbp-16]
	mov rdx, 4652007308841189376
	mov rax, r10
	movq xmm0, rdx
	cvtsi2sd xmm1, rax
	divsd xmm1, xmm0
	cvttsd2si r10, xmm1
	mov r12, 1000000
	mov r11, qword[rbp-24]
	imul r11, r12
	mov r12, 9223372036854775807
	sub r12, r11
	cmp r10, r12
	setg r10b
	or bl, r10b
	jz .L0x198
	mov rax, -1
	jmp ___clock_t_clock_p__return
	jmp .L0x199
.L0x198:
.L0x199:
	mov r10, 1000000
	mov rbx, qword[rbp-24]
	imul rbx, r10
	mov r10, qword[rbp-16]
	mov rdx, 4652007308841189376
	mov rax, r10
	movq xmm0, rdx
	cvtsi2sd xmm1, rax
	divsd xmm1, xmm0
	cvttsd2si r10, xmm1
	add rbx, r10
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
	mov rdx, 4633641066610819072
	mov rax, rbx
	movq xmm0, rdx
	cvtsi2sd xmm1, rax
	divsd xmm1, xmm0
	cvttsd2si rbx, xmm1
	mov rdx, 60
	imul rdx
	sub rbx, rax
	mov r10, rbx
	mov dword[rbp-32], r10d
	mov rbx, qword[rbp-8]
	mov rdx, 4633641066610819072
	mov rax, rbx
	movq xmm0, rdx
	cvtsi2sd xmm1, rax
	divsd xmm1, xmm0
	cvttsd2si rbx, xmm1
	mov qword[rbp-8], rbx
	mov rdx, 4633641066610819072
	mov rax, rbx
	movq xmm0, rdx
	cvtsi2sd xmm1, rax
	divsd xmm1, xmm0
	cvttsd2si rbx, xmm1
	mov rdx, 60
	imul rdx
	sub rbx, rax
	mov r10, rbx
	mov dword[rbp-40], r10d
	mov rbx, qword[rbp-8]
	mov rdx, 4633641066610819072
	mov rax, rbx
	movq xmm0, rdx
	cvtsi2sd xmm1, rax
	divsd xmm1, xmm0
	cvttsd2si rbx, xmm1
	mov qword[rbp-8], rbx
	mov rdx, 4633641066610819072
	mov rax, rbx
	movq xmm0, rdx
	cvtsi2sd xmm1, rax
	divsd xmm1, xmm0
	cvttsd2si rbx, xmm1
	mov rdx, 60
	imul rdx
	sub rbx, rax
	mov r10, rbx
	mov dword[rbp-48], r10d
	mov rbx, qword[rbp-8]
	mov rdx, 4633641066610819072
	mov rax, rbx
	movq xmm0, rdx
	cvtsi2sd xmm1, rax
	divsd xmm1, xmm0
	cvttsd2si rbx, xmm1
	mov qword[rbp-8], rbx
	mov rbx, qword[rbp-16]
	mov rdx, 4633641066610819072
	mov rax, rbx
	movq xmm0, rdx
	cvtsi2sd xmm1, rax
	divsd xmm1, xmm0
	cvttsd2si rbx, xmm1
	mov rdx, 4633641066610819072
	mov rax, rbx
	movq xmm0, rdx
	cvtsi2sd xmm1, rax
	divsd xmm1, xmm0
	cvttsd2si rbx, xmm1
	mov rdx, 4627448617123184640
	mov rax, rbx
	movq xmm0, rdx
	cvtsi2sd xmm1, rax
	divsd xmm1, xmm0
	cvttsd2si rbx, xmm1
	mov r10, rbx
	mov dword[rbp-56], r10d
	mov rax, 4645133162144333824
	movq xmm7, rax
	mov ebx, dword[rbp-56]
	cvtsi2sd xmm8, ebx
	divsd xmm8, xmm7
	movsd xmm0, xmm8
	call _long_floor_pdouble
	mov rbx, rax
	mov dword[rbp-64], ebx
	mov rax, 4645133162144333824
	movq xmm7, rax
	mov ebx, dword[rbp-64]
	cvtsi2sd xmm8, ebx
	mulsd xmm8, xmm7
	movsd xmm0, xmm8
	call _long_floor_pdouble
	push rax
	mov r10d, dword[rbp-56]
	pop rbx
	movsxd r11, r10d
	sub r11, rbx
	mov rbx, r11
	mov dword[rbp-56], ebx
	add ebx, 4
	mov rdx, 4619567317775286272
	mov eax, ebx
	cdqe
	movq xmm0, rdx
	cvtsi2sd xmm1, rax
	divsd xmm1, xmm0
	cvttsd2si rbx, xmm1
	mov rdx, 7
	imul rdx
	sub ebx, eax
	mov dword[rbp-72], ebx
	mov r10d, dword[rbp-56]
	mov dword[rbp-88], r10d
	mov dword[rbp-96], 0
	jmp .L0x19b
.L0x19a:
	mov r10d, dword[rbp-96]
	mov rbx, qword[mdays]
	mov eax, r10d
	cdqe
	mov r10d, [rbx+rax*4]
	cmp dword[rbp-88], r10d
	jle .L0x19e
	mov r10d, dword[rbp-96]
	mov rbx, qword[mdays]
	mov eax, r10d
	cdqe
	mov r10d, [rbx+rax*4]
	mov ebx, dword[rbp-88]
	sub ebx, r10d
	mov dword[rbp-88], ebx
	jmp .L0x19f
.L0x19e:
	jmp .L0x19d
.L0x19f:
.L0x19c:
	add dword[rbp-96], 1
.L0x19b:
	jmp .L0x19a
.L0x19d:
	add dword[rbp-96], 1
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
	mov eax, ebx
	cdqe
	mov rbx, [r10+rax*8]
	mov rsi, rbx
	mov rbx, qword[asctime__result_buf]
	mov rdi, rbx
	call _long_strcpy_pchar.char.
	mov r10b, 3
	mov rbx, qword[asctime__result_buf]
	movsx eax, r10b
	cdqe
	mov byte[rbx+rax*1], 32
	mov rbx, qword[rbp-8]
	mov ebx, [rbx+16]
	mov r10, mon_name
	mov eax, ebx
	cdqe
	mov rbx, [r10+rax*8]
	mov rsi, rbx
	mov rbx, qword[asctime__result_buf]
	add rbx, 4
	mov rdi, rbx
	call _long_strcpy_pchar.char.
	mov r10b, 7
	mov rbx, qword[asctime__result_buf]
	movsx eax, r10b
	cdqe
	mov byte[rbx+rax*1], 32
	mov r9, 0
	mov r8, 0
	mov rcx, 0
	mov rbx, qword[rbp-8]
	mov ebx, [rbx+12]
	mov rdx, rbx
	mov rsi, __LC.S164
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
	mov rsi, __LC.S165
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
	sub rsp, 40
	mov [rbp-8], rdi
	mov qword[rbp-32], 0
	mov r10, qword[rbp-8]
	mov qword[rbp-24], r10
	mov rsi, 0
	lea rbx, [rbp-32]
	mov rdi, rbx
	mov rax, 35
	mov r10, rcx
	syscall
.L0x1a3:
	xor rax, rax
	leave
	ret
_bool_fixNegative_pcharbool:
	cmp dil, 45
	sete bl
	and bl, sil
	mov al, bl
___bool_fixNegative_pcharbool__return:
	ret
_int_scanint_pchar.long.bool:
	push rbp
	mov rbp, rsp
	sub rsp, 64
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	mov [rbp-24], rdx
	mov qword[rbp-32], 0
	mov r10, qword[rbp-8]
	mov qword[rbp-40], r10
	mov bl, byte[rbp-24]
	mov sil, bl
	mov rbx, qword[rbp-8]
	mov bl, byte[rbx]
	mov dil, bl
	call _bool_fixNegative_pcharbool
	mov r10, rax
	mov byte[rbp-48], r10b
	movsx eax, byte[rbp-48]
	cdqe
	add qword[rbp-8], rax
	mov rbx, qword[rbp-8]
	mov bl, byte[rbx]
	mov byte[rbp-56], bl
	jmp .L0x1a5
.L0x1a4:
	sub byte[rbp-56], 48
	mov r10, 10
	mov rbx, qword[rbp-32]
	imul rbx, r10
	mov qword[rbp-32], rbx
	mov r10b, 255
	mov bl, byte[rbp-56]
	and bl, r10b
	movsx eax, bl
	cdqe
	add qword[rbp-32], rax
	add qword[rbp-8], 1
	mov rbx, qword[rbp-8]
	mov bl, byte[rbx]
	mov byte[rbp-56], bl
.L0x1a5:
	cmp byte[rbp-56], 57
	setle bl
	cmp byte[rbp-56], 48
	setge r10b
	and bl, r10b
	jnz .L0x1a4
.L0x1a6:
	cmp byte[rbp-48], 0
	jne .L0x1a7
	mov rbx, qword[rbp-16]
	mov r11, qword[rbp-32]
	mov [rbx], r11
	jmp .L0x1a8
.L0x1a7:
	mov rbx, qword[rbp-16]
	mov r11, 0
	sub r11, qword[rbp-32]
	mov [rbx], r11
.L0x1a8:
	mov r10, qword[rbp-40]
	mov rbx, qword[rbp-8]
	sub rbx, r10
	mov eax, ebx
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
	jmp .L0x1ad
.L0x1ac:
	mov rbx, qword[rbp-8]
	mov r10, rdi
	mov r10b, byte[r10]
	mov [rbx], r10b
	inc rdi
	add qword[rbp-8], 1
.L0x1ad:
	mov rbx, rdi
	cmp byte[rbx], sil
	jne .L0x1ac
.L0x1ae:
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
	mov dl, 1
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
	cmp byte[rbx], 46
	je .L0x1af
	mov rbx, qword[rbp-16]
	cvtsi2sd xmm7, qword[rbp-24]
	movsd [rbx], xmm7
	mov rax, qword[rbp-40]
	jmp ___int_scansd_pchar.double.__return
	jmp .L0x1b0
.L0x1af:
.L0x1b0:
	add qword[rbp-8], 1
	xor dl, dl
	lea rbx, [rbp-32]
	mov rsi, rbx
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _int_scanint_pchar.long.bool
	mov rbx, rax
	mov qword[rbp-48], rbx
	mov rsi, rbx
	mov rdi, 10
	call _long_pow_plonglong
	mov rbx, rax
	mov dword[rbp-56], ebx
	mov r10d, dword[rbp-56]
	mov rbx, qword[rbp-24]
	movsxd r11, r10d
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
	jz .L0x1b1
	xor eax, eax
	jmp ___int___SSCANF_pchar.char.void..__return
	jmp .L0x1b2
.L0x1b1:
.L0x1b2:
	jmp .L0x1b4
.L0x1b3:
	mov rbx, qword[rbp-8]
	cmp byte[rbx], 37
	je .L0x1b6
	add qword[rbp-8], 1
	add qword[rbp-16], 1
	jmp .L0x1b7
.L0x1b6:
	add qword[rbp-8], 1
	mov rbx, qword[rbp-8]
	mov bl, byte[rbx]
	mov byte[rbp-40], bl
	cmp byte[rbp-40], 105
	jne .L0x1b8
	mov dl, 1
	mov r10d, dword[rbp-32]
	mov rbx, qword[rbp-24]
	mov eax, r10d
	cdqe
	mov r10, [rbx+rax*8]
	mov rsi, r10
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	call _int_scanint_pchar.long.bool
	mov rbx, rax
	mov qword[rbp-48], rbx
	mov r10, qword[rbp-48]
	add qword[rbp-16], r10
	add qword[rbp-8], 1
	jmp .L0x1b9
.L0x1b8:
	cmp byte[rbp-40], 117
	jne .L0x1ba
	xor dl, dl
	mov r10d, dword[rbp-32]
	mov rbx, qword[rbp-24]
	mov eax, r10d
	cdqe
	mov r10, [rbx+rax*8]
	mov rsi, r10
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	call _int_scanint_pchar.long.bool
	mov rbx, rax
	mov qword[rbp-48], rbx
	mov r10, qword[rbp-48]
	add qword[rbp-16], r10
	add qword[rbp-8], 1
	jmp .L0x1bb
.L0x1ba:
	cmp byte[rbp-40], 99
	jne .L0x1bc
	mov r10d, dword[rbp-32]
	mov rbx, qword[rbp-24]
	mov eax, r10d
	cdqe
	mov r10, [rbx+rax*8]
	mov qword[rbp-56], r10
	mov rbx, qword[rbp-56]
	mov r10, qword[rbp-16]
	mov r10b, byte[r10]
	mov [rbx], r10b
	add qword[rbp-16], 1
	add qword[rbp-8], 1
	jmp .L0x1bd
.L0x1bc:
	cmp byte[rbp-40], 115
	jne .L0x1be
	add qword[rbp-8], 1
	mov r10d, dword[rbp-32]
	mov rbx, qword[rbp-24]
	mov eax, r10d
	cdqe
	mov r10, [rbx+rax*8]
	mov rdx, r10
	mov rbx, qword[rbp-8]
	mov bl, byte[rbx]
	mov sil, bl
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	call _int_scanstr_pchar.charchar.
	mov rbx, rax
	mov qword[rbp-48], rbx
	mov r10, qword[rbp-48]
	add qword[rbp-16], r10
	jmp .L0x1bf
.L0x1be:
	cmp byte[rbp-40], 102
	sete bl
	cmp byte[rbp-40], 100
	sete r10b
	or bl, r10b
	jz .L0x1c0
	mov r10d, dword[rbp-32]
	mov rbx, qword[rbp-24]
	mov eax, r10d
	cdqe
	mov r10, [rbx+rax*8]
	mov rsi, r10
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	call _int_scansd_pchar.double.
	mov rbx, rax
	mov qword[rbp-48], rbx
	mov r10, qword[rbp-48]
	add qword[rbp-16], r10
	add qword[rbp-8], 1
	jmp .L0x1c1
.L0x1c0:
.L0x1c1:
.L0x1bf:
.L0x1bd:
.L0x1bb:
.L0x1b9:
	add dword[rbp-32], 1
.L0x1b7:
.L0x1b4:
	mov rbx, qword[rbp-8]
	mov bl, byte[rbx]
	test bl, bl
	setnz bl
	mov r10, qword[rbp-16]
	mov r10b, byte[r10]
	test r10b, r10b
	setnz r10b
	and bl, r10b
	jnz .L0x1b3
.L0x1b5:
	mov ebx, dword[rbp-32]
	mov eax, ebx
___int___SSCANF_pchar.char.void..__return:
	leave
	ret
sscanf:
	push rbp
	mov rbp, rsp
	sub rsp, 88
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	mov [rbp-24], rdx
	mov [rbp-32], rcx
	mov [rbp-40], r8
	mov [rbp-48], r9
	lea rbx, [rbp-80] 
	mov r11, qword[rbp-24]
	mov [rbx], r11
	mov r10, 1
	lea rbx, [rbp-80] 
	lea r11, [rbx+r10*8]
	mov r10, qword[rbp-32]
	mov [r11], r10
	mov r10, 2
	lea rbx, [rbp-80] 
	lea r11, [rbx+r10*8]
	mov r10, qword[rbp-40]
	mov [r11], r10
	mov r10, 3
	lea rbx, [rbp-80] 
	lea r11, [rbx+r10*8]
	mov r10, qword[rbp-48]
	mov [r11], r10
	lea rbx, [rbp-80]
	mov rdx, rbx
	mov rbx, qword[rbp-16]
	mov rsi, rbx
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _int___SSCANF_pchar.char.void..
__sscanf__return:
	leave
	ret
_int_inet_aton_pchar.in_addr.:
	push rbp
	mov rbp, rsp
	sub rsp, 67
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	lea rbx, [rbp-27]
	add rbx, 3
	mov r9, rbx
	lea rbx, [rbp-27]
	add rbx, 2
	mov r8, rbx
	lea rbx, [rbp-27]
	inc rbx
	mov rcx, rbx
	lea rbx, [rbp-27]
	mov rdx, rbx
	mov rbx, qword[rbp-8]
	mov rsi, rbx
	mov rdi, __LC.S166
	call sscanf
	mov bl, [rbp-27]
	movsx eax, bl
	cdqe
	mov r10, rax
	mov dword[rbp-35], r10d
	mov r10d, 255
	mov ebx, dword[rbp-35]
	and ebx, r10d
	mov r11b, 1
	lea r10, [rbp-27] 
	movsx eax, r11b
	cdqe
	mov r11b, [r10+rax*1]
	movsx eax, r11b
	cdqe
	mov r10, rax
	mov dword[rbp-43], r10d
	mov r11d, 255
	mov r10d, dword[rbp-43]
	and r10d, r11d
	mov r12b, 2
	lea r11, [rbp-27] 
	movsx eax, r12b
	cdqe
	mov r12b, [r11+rax*1]
	movsx eax, r12b
	cdqe
	mov r11, rax
	mov dword[rbp-51], r11d
	mov r12d, 255
	mov r11d, dword[rbp-51]
	and r11d, r12d
	mov r13b, 3
	lea r12, [rbp-27] 
	movsx eax, r13b
	cdqe
	mov r13b, [r12+rax*1]
	movsx eax, r13b
	cdqe
	mov r12, rax
	mov dword[rbp-59], r12d
	mov r13d, 255
	mov r12d, dword[rbp-59]
	and r12d, r13d
	mov r13d, dword[rbp-35]
	sal r13d, 24
	mov r14d, dword[rbp-43]
	sal r14d, 16
	or r13d, r14d
	mov r14d, dword[rbp-51]
	sal r14d, 8
	or r13d, r14d
	mov r14d, dword[rbp-59]
	or r14d, r13d
	mov edi, r14d
	xor rax,rax
	bswap edi
	mov eax, edi
.L0x1c6:
	push rax
	mov rbx, qword[rbp-16]
	pop r11
	mov [rbx], r11d
	mov eax, 1
___int_inet_aton_pchar.in_addr.__return:
	leave
	ret
_int_recv_pfd_tchar.size_tint:
	push rbp
	mov rbp, rsp
	sub rsp, 40
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	mov [rbp-24], rdx
	mov [rbp-32], rcx
	mov r9, 0
	mov r8, 0
	mov ebx, dword[rbp-32]
	mov ecx, ebx
	mov rbx, qword[rbp-24]
	mov rdx, rbx
	mov rbx, qword[rbp-16]
	mov rsi, rbx
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	mov rax, 45
	mov r10, rcx
	syscall
.L0x1cb:
___int_recv_pfd_tchar.size_tint__return:
	leave
	ret
_int_send_pfd_tchar.size_tint:
	push rbp
	mov rbp, rsp
	sub rsp, 40
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	mov [rbp-24], rdx
	mov [rbp-32], rcx
	mov r9, 0
	mov r8, 0
	mov ebx, dword[rbp-32]
	mov ecx, ebx
	mov rbx, qword[rbp-24]
	mov rdx, rbx
	mov rsi, qword[rbp-16]
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	mov rax, 44
	mov r10, rcx
	syscall
.L0x1cf:
___int_send_pfd_tchar.size_tint__return:
	leave
	ret
_void_feed_pStackvoid.:
	mov r10, rdi
	mov qword[rdi+8], r10
	xor rax, rax
	ret
_void_alloc_pStacksize_t:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov [rbp-8], rdi
	mov r10, qword[rbp-8]
	mov qword[rdi+16], r10
	push rdi
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _void._mapalloc_psize_t
	pop rdi
	mov r10, rax
	mov qword[rdi+8], r10
	xor rax, rax
	leave
	ret
_void_destroy_pStack:
	push rdi
	mov rbx, qword[rdi+8]
	mov rdi, rbx
	call _void_mapfree_pvoid.
	pop rdi
	xor rax, rax
	ret
_void_set_pVec3fdoubledoubledouble:
	movsd xmm8, xmm1
	movsd qword[rdi+0], xmm8
	movsd xmm8, xmm2
	movsd qword[rdi+8], xmm8
	movsd xmm8, xmm3
	movsd qword[rdi+16], xmm8
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
_void_.operator33_pVec3fVec3f.:
	vmovdqu ymm0, [rdi]
	vaddpd ymm1, ymm0, [rsi]
	vmovdqu [rdi], ymm1
	ret
_void_.operator34_pVec3fVec3f.:
	vmovdqu ymm0, [rdi]
	vsubpd ymm1, ymm0, [rsi]
	vmovdqu [rdi], ymm1
	ret
_void_.operator36_pVec3fVec3f.:
	vmovdqu ymm0, [rdi]
	vdivpd ymm1, ymm0, [rsi]
	vmovdqu [rdi], ymm1
	ret
_void_.operator35_pVec3fVec3f.:
	vmovdqu ymm0, [rdi]
	vmulpd ymm1, ymm0, [rsi]
	vmovdqu [rdi], ymm1
	ret
_double_.operator20_pVec3fVec3f.:
	movsd xmm0, [rdi]   
	movsd xmm1, [rdi+8]   
	mulsd xmm0, [rsi]   
	movsd xmm2, [rdi+16]  
	mulsd xmm1, [rsi+8]   
	mulsd xmm2, [rsi+16]  
	addsd xmm0, xmm1   
	addsd xmm0, xmm2   
	ret
_void__DSocket_pSocket:
	push rdi
	mov esi, 1
	mov rbx, qword[rdi+0]
	mov rdi, rbx
	mov rax, 48
	mov r10, rcx
	syscall
.L0x20d:
	pop rdi
	xor rax, rax
	ret
_err_t_init_pSocket:
	push rdi
	xor edx, edx
	mov esi, 1
	mov edi, 2
	mov rax, 41
	mov r10, rcx
	syscall
.L0x215:
	pop rdi
	mov r10, rax
	mov qword[rdi+0], r10
	mov rax, qword[rdi+0]
___err_t_init_pSocket__return:
	ret
_err_t_init_pSocketintintint:
	push rbp
	mov rbp, rsp
	sub rsp, 32
	mov [rbp-8], rsi
	mov [rbp-16], rdx
	mov [rbp-24], rcx
	push rdi
	mov ebx, dword[rbp-24]
	mov edx, ebx
	mov ebx, dword[rbp-16]
	mov esi, ebx
	mov ebx, dword[rbp-8]
	mov edi, ebx
	mov rax, 41
	mov r10, rcx
	syscall
.L0x21d:
	pop rdi
	mov r10, rax
	mov qword[rdi+0], r10
	mov rax, qword[rdi+0]
___err_t_init_pSocketintintint__return:
	leave
	ret
_err_t_connect_pSocketchar.int:
	push rbp
	mov rbp, rsp
	sub rsp, 56
	mov [rbp-8], rsi
	mov [rbp-16], rdx
	mov qword[rbp-40], 0
	mov word[rbp-48], 2
	push rdi
	mov ebx, dword[rbp-16]
	mov r10d, ebx
	mov di, r10w
	xor rax, rax
	bswap edi
	shr edi, 16
	mov eax, edi
.L0x22c:
	pop rdi
	mov r10, rax
	mov word[rbp-46], r10w
	push rdi
	lea rbx, [rbp-44]
	mov rsi, rbx
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _int_inet_aton_pchar.in_addr.
	pop rdi
	push rdi
	mov edx, 16
	lea rbx, [rbp-48]
	mov rsi, rbx
	mov rbx, qword[rdi+0]
	mov rdi, rbx
	mov rax, 42
	mov r10, rcx
	syscall
.L0x231:
	pop rdi
	mov r10, rax
	mov dword[rbp-24], r10d
	mov ebx, dword[rbp-24]
	mov eax, ebx
___err_t_connect_pSocketchar.int__return:
	leave
	ret
_ssize_t_send_pSocketchar.:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov [rbp-8], rsi
	push rdi
	mov rbx, qword[rbp-8]
	mov rsi, rbx
	mov rbx, qword[rdi+0]
	mov rdi, rbx
	call _size_t_fputs_pfd_tchar.
	pop rdi
___ssize_t_send_pSocketchar.__return:
	leave
	ret
_ssize_t_send_pSocketchar.size_t:
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
	mov rax, 1
	mov r10, rcx
	syscall
.L0x239:
	pop rdi
___ssize_t_send_pSocketchar.size_t__return:
	leave
	ret
_err_t_close_pSocket:
	push rdi
	mov esi, 1
	mov rbx, qword[rdi+0]
	mov rdi, rbx
	mov rax, 48
	mov r10, rcx
	syscall
.L0x241:
	pop rdi
___err_t_close_pSocket__return:
	ret
_ssize_t_recv_pSocketchar.size_t:
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
.L0x249:
	pop rdi
___ssize_t_recv_pSocketchar.size_t__return:
	leave
	ret
_int_getInt_pchar.:
	push rbp
	mov rbp, rsp
	sub rsp, 63
	mov [rbp-8], rdi
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _size_t_puts_pchar.
.L0x24b:
	mov rdx, 40
	mov sil, 0
	lea rbx, [rbp-55]
	mov rdi, rbx
	call _void_memset_pvoid.ucharsize_t
	mov rdx, 40
	lea rbx, [rbp-55]
	mov rsi, rbx
	mov rdi, 0
	call _long_fgets_pfd_tchar.size_t
	mov sil, 1
	lea rbx, [rbp-55]
	mov rdi, rbx
	call _int_toInteger_pchar.bool
___int_getInt_pchar.__return:
	leave
	ret
_int_getUint_pchar.:
	push rbp
	mov rbp, rsp
	sub rsp, 63
	mov [rbp-8], rdi
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _size_t_puts_pchar.
.L0x24e:
	mov rdx, 40
	mov sil, 0
	lea rbx, [rbp-55]
	mov rdi, rbx
	call _void_memset_pvoid.ucharsize_t
	mov rdx, 40
	lea rbx, [rbp-55]
	mov rsi, rbx
	mov rdi, 0
	call _long_fgets_pfd_tchar.size_t
	mov sil, 1
	lea rbx, [rbp-55]
	mov rdi, rbx
	call _int_toInteger_pchar.bool
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
_size_t_getString_pchar.size_tchar.:
	push rbp
	mov rbp, rsp
	sub rsp, 32
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	mov [rbp-24], rdx
	mov rbx, qword[rbp-24]
	mov rdi, rbx
	call _size_t_puts_pchar.
.L0x251:
	mov rbx, qword[rbp-16]
	mov rdx, rbx
	mov rbx, qword[rbp-8]
	mov rsi, rbx
	mov rdi, 0
	call _long_fgets_pfd_tchar.size_t
___size_t_getString_pchar.size_tchar.__return:
	leave
	ret
_int_toInteger_pchar.bool:
	push rbp
	mov rbp, rsp
	sub rsp, 32
	jmp .L0x25e
.L0x25d:
	inc rdi
.L0x25e:
	mov rbx, rdi
	cmp byte[rbx], 32
	je .L0x25d
.L0x25f:
	mov rbx, rdi
	mov bl, byte[rbx]
	mov byte[rbp-8], bl
	mov dword[rbp-16], 0
	mov byte[rbp-24], 0
	cmp byte[rbp-8], 45
	sete bl
	and bl, sil
	jz .L0x260
	mov byte[rbp-24], 1
	inc rdi
	mov rbx, rdi
	mov bl, byte[rbx]
	mov byte[rbp-8], bl
	jmp .L0x261
.L0x260:
.L0x261:
	jmp .L0x263
.L0x262:
	mov r10d, 10
	mov ebx, dword[rbp-16]
	imul ebx, r10d
	mov r10b, byte[rbp-8]
	sub r10b, 48
	add ebx, r11d
	mov dword[rbp-16], ebx
	inc rdi
	mov rbx, rdi
	mov bl, byte[rbx]
	mov byte[rbp-8], bl
.L0x263:
	test bl, bl
	setnz bl
	cmp byte[rbp-8], 10
	setne r10b
	and bl, r10b
	cmp byte[rbp-8], 32
	setne r10b
	and bl, r10b
	jnz .L0x262
.L0x264:
	mov al, byte[rbp-24]
	test al, al
	jz .L0x265
	xor r10d, r10d
	sub r10d, dword[rbp-16]
	mov eax, r10d
	jmp ___int_toInteger_pchar.bool__return
	jmp .L0x266
.L0x265:
.L0x266:
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
	jz .L0x267
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
	jmp .L0x268
.L0x267:
	mov rbx, qword[rbp-24]
	mov rdi, rbx
	call _void._floads_pfd_t
	mov r10, rax
	mov qword[rbp-40], r10
.L0x268:
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
	sub rsp, 96
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	mov [rbp-24], rdx
	mov [rbp-32], rcx
	mov [rbp-40], r8
	mov [rbp-48], r9
	lea rbx, [rbp-88] 
	mov r11, qword[rbp-16]
	mov [rbx], r11
	mov r10, 1
	lea rbx, [rbp-88] 
	lea r11, [rbx+r10*8]
	mov r10, qword[rbp-24]
	mov [r11], r10
	mov r10, 2
	lea rbx, [rbp-88] 
	lea r11, [rbx+r10*8]
	mov r10, qword[rbp-32]
	mov [r11], r10
	mov r10, 3
	lea rbx, [rbp-88] 
	lea r11, [rbx+r10*8]
	mov r10, qword[rbp-40]
	mov [r11], r10
	mov r10, 4
	lea rbx, [rbp-88] 
	lea r11, [rbx+r10*8]
	mov r10, qword[rbp-48]
	mov [r11], r10
	mov cl, 1
	mov rdx, 0
	lea rbx, [rbp-88]
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
	sub rsp, 88
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	mov [rbp-24], rdx
	mov [rbp-32], rcx
	mov [rbp-40], r8
	mov [rbp-48], r9
	lea rbx, [rbp-80] 
	mov r11, qword[rbp-24]
	mov [rbx], r11
	mov r10, 1
	lea rbx, [rbp-80] 
	lea r11, [rbx+r10*8]
	mov r10, qword[rbp-32]
	mov [r11], r10
	mov r10, 2
	lea rbx, [rbp-80] 
	lea r11, [rbx+r10*8]
	mov r10, qword[rbp-40]
	mov [r11], r10
	mov r10, 3
	lea rbx, [rbp-80] 
	lea r11, [rbx+r10*8]
	mov r10, qword[rbp-48]
	mov [r11], r10
	mov cl, 0
	mov rbx, qword[rbp-8]
	mov rdx, rbx
	lea rbx, [rbp-80]
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
	mov rax, 57
	mov r10, rcx
	syscall
.L0x26c:
	mov r10, rax
	mov qword[rbp-16], r10
	mov rbx, qword[rbp-16]
	test rbx, rbx
	jnz .L0x26d
	mov r10b, 2
	mov rbx, __systemcallargvconst
	movsx eax, r10b
	cdqe
	lea r10, [rbx+rax*8]
	mov r11, qword[rbp-8]
	mov [r10], r11
	mov rdx, __emptyenv
	mov rsi, __systemcallargvconst
	mov rdi, __systembashpath
	mov rax, 59
	mov r10, rcx
	syscall
.L0x272:
	mov r10, rax
	mov qword[rbp-24], r10
	mov rdi, qword[rbp-24]
	call _char._strerror_pvoid
	mov rdi, rax
	call _size_t_puts_pchar.
.L0x274:
	jmp .L0x26e
.L0x26d:
.L0x26e:
	xor edx, edx
	xor rsi, rsi
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	mov ecx, edx
	mov rdx, rsi
	mov rsi, rdi
	mov edi, 0
	mov rax, 247
	mov r10, rcx
	syscall
.L0x27b:
	pop rsi
.L0x277:
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
	jz .L0x282__end
	mov eax, [rdi]
	mov [rsi], eax
.L0x282__end:
.L0x281:
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
	mov edx, 1
	mov esi, 0
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _void_mutex_cmpxchg_pmutex.intint
	mov rbx, rax
	mov dword[rbp-16], ebx
	test ebx, ebx
	jz .L0x283
	jmp .L0x286
.L0x285:
	mov edx, 2
	mov esi, 1
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
	jz .L0x288
	mov edx, 2
	mov rsi, 0
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	mov r9d, 0
	mov r8, 0
	mov rcx, 0
	mov rax, 202
	mov r10, rcx
	syscall
.L0x28f:
	pop rsi
.L0x28b:
	jmp .L0x289
.L0x288:
.L0x289:
	mov edx, 2
	mov esi, 0
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _void_mutex_cmpxchg_pmutex.intint
	mov rbx, rax
	mov dword[rbp-16], ebx
	test ebx, ebx
	jnz .L0x291
	mov rdi, __LC.S171
	call _size_t_puts_pchar.
.L0x294:
	jmp .L0x287
	jmp .L0x292
.L0x291:
.L0x292:
.L0x286:
	jmp .L0x285
.L0x287:
	jmp .L0x284
.L0x283:
.L0x284:
	xor rax, rax
	leave
	ret
_void_munlock_pmutex.:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov [rbp-8], rdi
	mov esi, 1
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	lock sub dword[rdi], esi
.L0x29a:
	push rax
	mov r10d, 1
	pop rbx
	cmp ebx, r10d
	je .L0x29c
	xor esi, esi
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	lock xchg dword[rdi], esi
.L0x2a2:
	mov edx, 2
	mov rsi, 0
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	mov r9d, 0
	mov r8, 0
	mov rcx, 0
	mov rax, 202
	mov r10, rcx
	syscall
.L0x2a9:
	pop rsi
.L0x2a5:
	jmp .L0x29d
.L0x29c:
.L0x29d:
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
	mov rax, 60
	mov r10, rcx
	syscall
	push rax
	pop rax
.L0x2af:
	push rax
	pop rax
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
	jnz .L0x2b1__end
	mov rdi, r15
	mov rsi, r14
	mov rdx, r13
	call _long___enterthread_p__threadcallablethread_t.void.
	mov rdi, rax
	call _void___thrdext_plong
.L0x2b1__end:
	ret
_void.___crtstack_p:
	mov r9d, 0
	mov r8, 0
	mov rcx, 16777250
	mov rdx, 3
	mov rsi, 65536
	mov rdi, 0
	mov rax, 9
	mov r10, rcx
	syscall
.L0x2b5:
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
_Test_testtester_pTest:
	push rbp
	mov rbp, rsp
	sub rsp, 34
	movdqu [rbp-34], xmm0
	vextracti128 xmm7, ymm0, 1
	movq rax, xmm7
	movhlps xmm7, xmm7
	movq rbx, xmm7
	mov [rbp-18], rax
	mov [rbp-10], bx
	movsxd r9, dword[rbp-13]
	movsxd r8, dword[rbp-26]
	movsx eax, byte[rbp-9]
	cdqe
	mov rcx, rax
	movsxd rdx, dword[rbp-30]
	movsxd rsi, dword[rbp-34]
	mov rdi, __LC.S172
	call printf
	movq xmm0, [rbp-18]
	xor rax, rax
	mov ax, [rbp-10]
	movq xmm7, rax
	movlhps xmm0, xmm7
	vinsertf128 ymm0, ymm0, xmm0, 1
	movdqu xmm0, [rbp-34]
___Test_testtester_pTest__return:
	leave
	ret
main:
	push rbp
	mov rbp, rsp
	sub rsp, 42
	mov dword[rbp-34], 1
	mov dword[rbp-30], 2
	mov dword[rbp-26], 4
	mov byte[rbp-22], 5
	mov qword[rbp-21], 6
	mov dword[rbp-13], 7
	mov byte[rbp-9], 3
	movq xmm0, [rbp-18]
	xor rax, rax
	mov ax, [rbp-10]
	movq xmm7, rax
	movlhps xmm0, xmm7
	vinsertf128 ymm0, ymm0, xmm0, 1
	movdqu xmm0, [rbp-34]
	call _Test_testtester_pTest
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
	call _err_t_init_pSocket
	lea rdi, [rbp-32]
	mov dx, word[rbp-16]
	mov rbx, qword[rbp-8]
	mov rsi, rbx
	call _err_t_connect_pSocketchar.int
	mov r10, rax
	mov dword[rbp-40], r10d
	mov ebx, dword[rbp-40]
	test ebx, ebx
	jz .L0x2b6
	movsxd rdi, dword[rbp-40]
	call _char._strerror_pvoid
	mov rdi, rax
	call _size_t_puts_pchar.
	mov rdi, 1
	mov rax, 60
	mov r10, rcx
	syscall
.L0x2bb:
	jmp .L0x2b7
.L0x2b6:
.L0x2b7:
	mov rdi, 1024
	call _void._mapalloc_psize_t
	mov r10, rax
	mov qword[rbp-48], r10
	mov qword[rbp-56], 0
	jmp .L0x2bd
.L0x2bc:
	jmp .L0x2c0
.L0x2bf:
	lea rdi, [rbp-32]
	mov rdx, 1024
	mov rbx, qword[rbp-48]
	mov rsi, rbx
	call _ssize_t_recv_pSocketchar.size_t
	mov r10, rax
	mov qword[rbp-56], r10
.L0x2c0:
	mov rbx, qword[rbp-56]
	test rbx, rbx
	jz .L0x2bf
.L0x2c1:
	xor r10, r10
	cmp qword[rbp-56], r10
	jge .L0x2c2
	mov rdi, __LC.S173
	call _size_t_puts_pchar.
	mov rax, -1
	jmp ___void_nc_pchar.short__return
	jmp .L0x2c3
.L0x2c2:
.L0x2c3:
	mov rbx, qword[rbp-48]
	mov rdi, rbx
	call _size_t_puts_pchar.
	mov rbx, qword[rbp-56]
	mov rsi, rbx
	mov rdi, qword[rbp-48]
	call _void_memzer_pvoid.size_t
	mov qword[rbp-56], 0
.L0x2bd:
	jmp .L0x2bc
.L0x2be:
	mov rdi, qword[rbp-48]
	call _void_mapfree_pvoid.
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
	mov qword[rbp-1015], 0
	jmp .L0x2c5
.L0x2c4:
	mov r8, 1056964608
	mov rcx, __LC.S175
	mov rdx, 123
	mov rsi, __LC.S174
	lea rbx, [rbp-1007]
	mov rdi, rbx
	call sprintf
.L0x2c6:
	add qword[rbp-1015], 1
.L0x2c5:
	cmp qword[rbp-1015], 25000000
	jl .L0x2c4
.L0x2c7:
	lea rbx, [rbp-1007]
	mov rdi, rbx
	call _size_t_puts_pchar.
	mov rax, 1108082688
	movq xmm7, rax
	movsd xmm0, xmm7
___float_benchmark_p__return:
	leave
	ret
	