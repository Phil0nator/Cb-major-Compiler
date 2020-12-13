extern _char._get_errstr_pint:
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
extern _char._strerror_plong:
extern _int___sprintf_pchar.char.void.:
	extern sprintf
	extern sprintf
	extern sprintf
	extern sprintf
extern _FILE_fopen_pchar.char.:
extern _size_t_fputs_pFILEchar.:
extern _size_t_puts_pchar.:
extern _long_fgets_pFILEchar.size_t:
extern _void._floads_pFILE:
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
extern _int___SSCANF_pchar.char.void..:
	extern sscanf
	extern sscanf
	extern sscanf
	extern sscanf
	extern sscanf
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
LC.F0: dq 0x0.0p+0
LC.S132: db `Enter an integer: `, 0
LC.S133: db `%i`, 0
LC.S134: db `Number of digits: %i`, 0
__linux_errstrlist: DQ LC.S0, LC.S1, LC.S2, LC.S3, LC.S4, LC.S5, LC.S6, LC.S7, LC.S8, LC.S9, LC.S10, LC.S11, LC.S12, LC.S13, LC.S14, LC.S15, LC.S16, LC.S17, LC.S18, LC.S19, LC.S20, LC.S21, LC.S22, LC.S23, LC.S24, LC.S25, LC.S26, LC.S27, LC.S28, LC.S29, LC.S30, LC.S31, LC.S32, LC.S33, LC.S34, LC.S35, LC.S36, LC.S37, LC.S38, LC.S39, LC.S40, LC.S41, LC.S42, LC.S43, LC.S44, LC.S45, LC.S46, LC.S47, LC.S48, LC.S49, LC.S50, LC.S51, LC.S52, LC.S53, LC.S54, LC.S55, LC.S56, LC.S57, LC.S58, LC.S59, LC.S60, LC.S61, LC.S62, LC.S63, LC.S64, LC.S65, LC.S66, LC.S67, LC.S68, LC.S69, LC.S70, LC.S71, LC.S72, LC.S73, LC.S74, LC.S75, LC.S76, LC.S77, LC.S78, LC.S79, LC.S80, LC.S81, LC.S82, LC.S83, LC.S84, LC.S85, LC.S86, LC.S87, LC.S88, LC.S89, LC.S90, LC.S91, LC.S92, LC.S93, LC.S94, LC.S95, LC.S96, LC.S97, LC.S98, LC.S99, LC.S100, LC.S101, LC.S102, LC.S103, LC.S104, LC.S105, LC.S106, LC.S107, LC.S108, LC.S109, LC.S110, LC.S111, LC.S112, LC.S113, LC.S114, LC.S115, LC.S116, LC.S117, LC.S118, LC.S119, LC.S120, LC.S121, LC.S122, LC.S123, LC.S124, LC.S125, LC.S126, LC.S127, LC.S128, LC.S129, LC.S130, LC.S131
M_MINZERO_MEM: DQ 0x0.0p+0
	section .bss
	align 16
	section .text
	align 8
	global main
main:
	push rbp
	mov rbp, rsp
	sub rsp, 24
	mov dword[rbp-16], 0
	mov rdi, LC.S132
	push rdi
	call _size_t_puts_pchar.
	mov rbx, rax
	pop rdi
	jmp .L0x1
.L0x1:
	lea rbx, [rbp-8]
	mov rsi, rbx
	mov rdi, LC.S133
	call scanf
	jmp .L0x4
.L0x3:
	mov ebx, dword[rbp-8]
	xor rax, rax
	mov rax, rbx
	mov rcx, 858993460
	imul rcx
	sar rax, 33
	mov rbx, rax
	mov dword[rbp-8], ebx
	inc dword[rbp-16]
.L0x4:
	mov ebx, dword[rbp-8]
	test ebx, ebx
	jnz .L0x3
.L0x5:
	mov esi, dword[rbp-16]
	mov rdi, LC.S134
	call printf
	xor eax, eax
	leave
	ret
	