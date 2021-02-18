bits 64
global _char._get_errstr_pvoid:
global _void_native_cpuid_pcpuidreg_t.cpuidreg_t.cpuidreg_t.cpuidreg_t.:
global _bool_cpuid_getfeature_pulong:
global _bool_cpuid_getextended_pulong:
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
global _mallocptr._malloc_psize_t:
global _mallocptr._realloc_pvoid.size_t:
global _mallocptr._calloc_psize_t:
global _mallocptr._mapalloc_psize_t:
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
global _string_.operator32_pstring.char.:
global _string_.operator33_pstring.string:
global _string_.operator3_pstring.string:
global _string_.operator3_pstring.char.:
global _string_.operator33_pstring.char.:
global _void_.operator32_postream.fd_t:
global _ostream_.operator18_postream.char.:
global _ostream_.operator18_postream.long:
global _ostream_.operator18_postream.int:
global _ostream_.operator18_postream.ulong:
global _ostream_.operator18_postream.float:
global _ostream_.operator18_postream.double:
global _ostream_.operator18_postream.char:
global _void_feed_pStack.void.:
global _void_alloc_pStack.size_t:
global _void_destroy_pStack.:
global _void_push_pStack.void:
global _void_pop_pStack.:
global _void_pop_pStack.void.:
global _void_set_pVec3f.doubledoubledouble:
global _void_add_pVec3f.Vec3f.:
global _void_sub_pVec3f.Vec3f.:
global _void_mul_pVec3f.Vec3f.:
global _void_div_pVec3f.Vec3f.:
global _void_sqrt_pVec3f.:
global _double_dot_pVec3f.Vec3f.:
global _void_.operator33_pVec3f.Vec3f.:
global _void_.operator34_pVec3f.Vec3f.:
global _void_.operator36_pVec3f.Vec3f.:
global _void_.operator35_pVec3f.Vec3f.:
global _double_.operator20_pVec3f.Vec3f.:
global _err_t_init_pSocket.:
global _err_t_init_pSocket.intintint:
global _err_t_connect_pSocket.char.int:
global _ssize_t_send_pSocket.char.:
global _ssize_t_send_pSocket.char.size_t:
global _err_t_close_pSocket.:
global _ssize_t_recv_pSocket.char.size_t:
global _err_t_init_pSocket.:
global _err_t_init_pSocket.intintint:
global _err_t_connect_pSocket.char.int:
global _ssize_t_send_pSocket.char.:
global _ssize_t_send_pSocket.char.size_t:
global _err_t_close_pSocket.:
global _ssize_t_recv_pSocket.char.size_t:
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
__numbercharactersbase1016: DQ __LC.S130
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
cerr:
cerr.handle: DQ 2
clog:
clog.handle: DQ 2
__systembashpath: DQ __LC.S173
__emptyenv: DQ __LC.S174, 0, 0
__systemcallargvconst: DQ __LC.S175, __LC.S176, 0, 0
clone_threadflags: DQ 4001553
teststr: DQ __LC.S182
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
__LC.S138: db ` %s:%i: Assertion '%s' failed.\n`, 0
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
__LC.S167: db `%l`, 0
__LC.S168: db `%ul`, 0
__LC.S169: db `%f`, 0
__LC.S170: db `%e`, 0
__LC.S171: db `%c`, 0
__LC.S172: db `%i`, 0
__LC.S173: db `/bin/bash`, 0
__LC.S174: db `PATH=/bin:/usr/bin:/sbin:/usr/sbin`, 0
__LC.S175: db `sudo`, 0
__LC.S176: db `-c`, 0
__LC.S177: db `LOCKED`, 0
__LC.S178: db `[`, 0
__LC.S179: db `%i, `, 0
__LC.S180: db `%i]\n`, 0
__LC.S181: db `%l: %l\n`, 0
__LC.S182: db `x123`, 0
__LC.S183: db `127.0.0.1`, 0
__LC.S184: db `Lost connection to host.`, 0
__LC.S185: db `123hd0.5: \t %i%s%f`, 0
__LC.S186: db `hd`, 0
	section .bss align=8
__tmbuf:
__tmbuf.tm_sec: resb 4
__tmbuf.tm_min: resb 4
__tmbuf.tm_hour: resb 4
__tmbuf.tm_mday: resb 4
__tmbuf.tm_mon: resb 4
__tmbuf.tm_year: resb 4
__tmbuf.tm_wday: resb 4
__tmbuf.tm_yday: resb 4
__tmbuf.tm_isdst: resb 4
__internaltime:
__internaltime.tz_minuteswest: resb 4
__internaltime.tz_dsttime: resb 4
cout:
cout.handle: resb 8
cin:
cin.handle: resb 8
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
	jnz .L0xbb
	mov rbx, qword[rbp-16]
	mov byte[rbx], 48
	mov rax, 2
	jmp ___long_toStr_plongchar.boollong__return
	jmp .L0xbc
.L0xbb:
.L0xbc:
	mov byte[rbp-40], 0
	cmp qword[rbp-8], 0
	setl bl
	and bl, byte[rbp-24]
	jz .L0xbd
	mov rbx, qword[rbp-16]
	mov byte[rbx], 45
	add qword[rbp-16], 1
	mov rcx, qword[rbp-8]
	mov rbx, 0
	sub rbx, rcx
	mov qword[rbp-8], rbx
	mov byte[rbp-40], 1
	jmp .L0xbe
.L0xbd:
.L0xbe:
	mov rdx, 64
	mov sil, 0
	lea rbx, [rbp-111]
	mov rdi, rbx
	call _void_memset_pvoid.ucharsize_t
	mov rbx, rax
	mov qword[rbp-119], 0
	jmp .L0xc0
.L0xbf:
	lea rbx, [rbp-127]
	mov rdx, rbx
	mov rbx, qword[rbp-32]
	mov rsi, rbx
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _long_divmod_plonglonglong.
	mov rbx, rax
	mov qword[rbp-8], rbx
	mov rcx, qword[rbp-119]
	lea rbx, [rbp-111+rcx*1]
	mov r10, qword[rbp-127]
	mov rcx, qword[__numbercharactersbase1016]
	mov r11b, [rcx+r10*1]
	mov [rbx], r11b
	add qword[rbp-119], 1
.L0xc0:
	mov rbx, qword[rbp-8]
	test rbx, rbx
	jnz .L0xbf
.L0xc1:
	sub qword[rbp-16], 1
	mov rbx, qword[rbp-119]
	mov dword[rbp-127], ebx
	jmp .L0xc3
.L0xc2:
	mov ecx, dword[rbp-127]
	mov rbx, qword[rbp-16]
	mov eax, ecx
	cdqe
	lea rcx, [rbx+rax*1]
	mov r10d, dword[rbp-127]
	mov rbx, qword[rbp-119]
	movsxd r11, r10d
	sub rbx, r11
	mov r10b, [rbp-111+rbx*1]
	mov [rcx], r10b
.L0xc4:
	sub dword[rbp-127], 1
.L0xc3:
	xor ecx, ecx
	cmp dword[rbp-127], ecx
	jg .L0xc2
.L0xc5:
	mov cl, byte[rbp-40]
	mov rbx, qword[rbp-119]
	movsx eax, cl
	cdqe
	add rbx, rax
	inc rbx
	mov rax, rbx
___long_toStr_plongchar.boollong__return:
	leave
	ret
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
_char._get_errstr_pvoid:
	cmp rdi, 131
	setl bl
	xor r10, r10
	cmp rdi, r10
	setge cl
	and bl, cl
	jz .L0x3a
	mov rcx, rdi
	mov rbx, __linux_errstrlist
	mov r10, [rbx+rcx*8]
	mov rax, r10
	jmp ___char._get_errstr_pvoid__return
	jmp .L0x3b
.L0x3a:
.L0x3b:
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
___void_native_cpuid_pcpuidreg_t.cpuidreg_t.cpuidreg_t.cpuidreg_t.__return:
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
	mov rbx, rax
	mov ebx, dword[rbp-32]
	shl ebx, 32
	add ebx, dword[rbp-40]
	mov ecx, ebx
	mov qword[rbp-48], rcx
	mov rcx, qword[rbp-8]
	mov rbx, 1
	sal rbx, cl
	mov qword[rbp-56], rbx
	mov rcx, qword[rbp-56]
	mov rbx, qword[rbp-48]
	and rbx, rcx
	mov rcx, qword[rbp-8]
	shr rbx, cl
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
	mov rcx, 3
	mov rbx, qword[rbp-8]
	and rbx, rcx
	mov rcx, rbx
	mov dword[rbp-48], ecx
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
	mov rbx, rax
	lea rbx, [rbp-24]
	mov ecx, dword[rbp-48]
	mov eax, ecx
	mov ecx, [rbx+rax*4]
	mov dword[rbp-48], ecx
	mov rcx, qword[rbp-8]
	mov rbx, 1
	sal rbx, cl
	mov ecx, dword[rbp-48]
	and ecx, ebx
	mov rbx, qword[rbp-8]
	mov r10d, ecx
	mov rax, rcx
	mov cl, bl
	shr r10, cl
	mov rcx, rax
	mov al, r10b
___bool_cpuid_getextended_pulong__return:
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
___long_pow_plonglong__return:
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
	pop rbx
	cvtsi2sd xmm0, rdi
___double_pow_plonglong__return:
	leave
	ret
_double_pow_pdoublelong:
	dec rdi
_double_pow_pdoubleint_flp:
	mulsd xmm0, xmm0
	dec rdi
	jnz _int_pow_pintint_flp
___double_pow_pdoublelong__return:
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
.L0x4b:
___long_floor_pdouble__return:
	leave
	ret
_long_abs_plong:
	mov rax, rdi
	sar rdi, 63
	xor rax, rdi
	sub rax, rdi
___long_abs_plong__return:
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
	mov rbx, rax
	xor rcx, rcx
	sub rcx, rbx
	mov rax, rcx
___long_ceil_pdouble__return:
	leave
	ret
_double_abs_pdouble:
	movq rax, xmm0
	shl rax, 1
	shr rax, 1
	movq xmm0, rax 
___double_abs_pdouble__return:
	ret
_long_log_plong:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov [rbp-8], rdi
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _long_log2_plong
	mov rdx, 6148914691236517206
	imul rdx
	mov rax, rdx
	shr rax, 63
	add rdx, rax
	mov rax, rdx
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
	mov rbx, rax
	pop rcx
	xor rdx, rdx
	mov rax, rcx
	cqo
	idiv rbx
___long_log_plonglong__return:
	leave
	ret
_long_log2_plong:
	xor rax, rax
.L0x52_long_lop2_plong_flp:
	sar rdi, 1
	inc rax
	test rdi, rdi
	jnz .L0x52_long_lop2_plong_flp
	dec rax
___long_log2_plong__return:
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
	mov rbx, rax
	xor rcx, rcx
	movsd xmm7, qword[rbp-16]
	cvtsi2sd xmm8, rcx
	subsd xmm8, xmm7
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
___long_divmod_plonglonglong.__return:
	ret
_long_divmods_plonglonglong.:
	mov rbx, rdx
	xor rdx, rdx
	mov rax, rdi
	prefetchw [rbx]
	idiv rsi
	mov [rbx], rdx
___long_divmods_plonglonglong.__return:
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
	je .L0x57
	mov rax, 4614256656552045848
	movq xmm7, rax
	mov rbx, 2
	cvtsi2sd xmm8, rbx
	mulsd xmm8, xmm7
	movsd xmm1, xmm8
	movsd xmm7, qword[rbp-8]
	movsd xmm0, xmm7
	call _double_fmod_pdoubledouble
	movsd xmm7, xmm0
	mov rax, 4614256656552045848
	movq xmm8, rax
	subsd xmm8, xmm7
	movsd xmm0, xmm8
	call _double_taylor_sin_pdouble
	jmp ___double_sin_pdouble__return
	jmp .L0x58
.L0x57:
.L0x58:
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
	je .L0x59
	mov rax, 4609753056924675352
	movq xmm7, rax
	movsd xmm8, qword[rbp-8]
	addsd xmm8, xmm7
	movsd xmm0, xmm8
	call _double_sin_pdouble
	jmp ___double_cos_pdouble__return
	jmp .L0x5a
.L0x59:
.L0x5a:
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
	je .L0x5b
	movsd xmm7, qword[rbp-8]
	movsd xmm0, xmm7
	call _double_sin_pdouble
	movq rax, xmm0
	push rax
	movsd xmm7, qword[rbp-8]
	movsd xmm0, xmm7
	call _double_cos_pdouble
	movsd xmm7, xmm0
	pop rax
	movq xmm8, rax
	divsd xmm8, xmm7
	movsd xmm0, xmm8
	jmp ___double_tan_pdouble__return
	jmp .L0x5c
.L0x5b:
.L0x5c:
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
	je .L0x5d
	movsd xmm7, qword[rbp-8]
	movsd xmm0, xmm7
	call _double_tan_pdouble
	movsd xmm7, xmm0
	mov rax, 4607182418800017408
	movq xmm8, rax
	divsd xmm8, xmm7
	movsd xmm0, xmm8
	jmp ___double_cot_pdouble__return
	jmp .L0x5e
.L0x5d:
.L0x5e:
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
	je .L0x5f
	movsd xmm7, qword[rbp-8]
	movsd xmm0, xmm7
	call _double_cos_pdouble
	movsd xmm7, xmm0
	mov rax, 4607182418800017408
	movq xmm8, rax
	divsd xmm8, xmm7
	movsd xmm0, xmm8
	jmp ___double_sec_pdouble__return
	jmp .L0x60
.L0x5f:
.L0x60:
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
	je .L0x61
	movsd xmm7, qword[rbp-8]
	movsd xmm0, xmm7
	call _double_sin_pdouble
	movsd xmm7, xmm0
	mov rax, 4607182418800017408
	movq xmm8, rax
	divsd xmm8, xmm7
	movsd xmm0, xmm8
	jmp ___double_csc_pdouble__return
	jmp .L0x62
.L0x61:
.L0x62:
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
	setg cl
	or bl, cl
	jz .L0x63
	mov rax, 9221120237041090561
	movq xmm0, rax
	jmp ___double_asin_pdouble__return
	jmp .L0x64
.L0x63:
.L0x64:
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
	mov rax, 13830554455654793216
	movq xmm7, rax
	movsd xmm8, qword[rbp-8]
	comisd xmm8, xmm7
	setl bl
	mov rax, 4607182418800017408
	movq xmm7, rax
	movsd xmm8, qword[rbp-8]
	comisd xmm8, xmm7
	setg cl
	or bl, cl
	jz .L0x65
	mov rax, 9221120237041090561
	movq xmm0, rax
	jmp ___double_acos_pdouble__return
	jmp .L0x66
.L0x65:
.L0x66:
	movsd xmm7, qword[rbp-8]
	movsd xmm0, xmm7
	call _double_taylor_asin_pdouble
	movsd xmm7, xmm0
	mov rax, 4609753056924675352
	movq xmm8, rax
	subsd xmm8, xmm7
	movsd xmm0, xmm8
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
	jne .L0x73
	mov rax, 4605249457297304856
	movq xmm7, rax
	xor rbx, rbx
	cvtsi2sd xmm8, rbx
	subsd xmm8, xmm7
	movsd xmm0, xmm8
	jmp ___double_atan_pdouble__return
	jmp .L0x74
.L0x73:
	mov rax, 4607182418800017408
	movq xmm7, rax
	movsd xmm8, qword[rbp-8]
	comisd xmm8, xmm7
	jne .L0x75
	mov rax, 4605249457297304856
	movq xmm7, rax
	movsd xmm0, xmm7
	jmp ___double_atan_pdouble__return
	jmp .L0x76
.L0x75:
	xor rax, rax
	movq xmm7, rax
	movsd xmm8, qword[rbp-8]
	comisd xmm8, xmm7
	jne .L0x77
	xor rax, rax
	cvtsi2sd xmm0, rax
	jmp ___double_atan_pdouble__return
	jmp .L0x78
.L0x77:
	mov rax, 4607182418800017408
	movq xmm7, rax
	movsd xmm8, qword[rbp-8]
	comisd xmm8, xmm7
	setle bl
	mov rax, 13830554455654793216
	movq xmm7, rax
	movsd xmm8, qword[rbp-8]
	comisd xmm8, xmm7
	setge cl
	and bl, cl
	jz .L0x79
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
	jmp .L0x7a
.L0x79:
	mov rax, 13830554455654793216
	movq xmm7, rax
	movsd xmm8, qword[rbp-8]
	comisd xmm8, xmm7
	jge .L0x7b
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
	jmp .L0x7c
.L0x7b:
	mov rax, 4607182418800017408
	movq xmm7, rax
	movsd xmm8, qword[rbp-8]
	comisd xmm8, xmm7
	jle .L0x7d
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
	jmp .L0x7e
.L0x7d:
.L0x7e:
.L0x7c:
.L0x7a:
.L0x78:
.L0x76:
.L0x74:
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
___long_strcpy_pchar.char.__return:
	ret
_size_t_strlen_pchar.:
	mov rax, -1
_size_t_strlen_pchar._flp:
	mov bl, [rdi]
	inc rax
	inc rdi
	test bl, bl
	jnz _size_t_strlen_pchar._flp
___size_t_strlen_pchar.__return:
	ret
_char._memchr_pchar.charsize_t:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov [rbp-8], rdx
	mov r10, qword[rbp-8]
	mov rcx, rdi
	add rcx, r10
	mov rbx, rcx
	jmp .L0x89
.L0x88:
	mov rcx, rdi
	cmp byte[rcx], sil
	jne .L0x8b
	mov rax, rdi
	jmp ___char._memchr_pchar.charsize_t__return
	jmp .L0x8c
.L0x8b:
.L0x8c:
	inc rdi
.L0x89:
	cmp rdi, rbx
	jl .L0x88
.L0x8a:
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
	mov r11, qword[rbp-8]
	mov r10, rdi
	add r10, r11
	mov rcx, r10
	jmp .L0x93
.L0x92:
	mov r10, rdi
	mov r11, rsi
	mov r10b, byte[r10]
	cmp r10b, byte[r11]
	jge .L0x95
	dec ebx
	jmp .L0x96
.L0x95:
	inc ebx
.L0x96:
	inc rdi
	inc rsi
.L0x93:
	cmp rdi, rcx
	jl .L0x92
.L0x94:
	mov eax, ebx
___int_memcmp_pchar.char.size_t__return:
	leave
	ret
_char._strchr_pchar.char:
	jmp .L0x9d
.L0x9c:
	mov rbx, rdi
	cmp byte[rbx], sil
	jne .L0x9f
	mov rax, rdi
	jmp ___char._strchr_pchar.char__return
	jmp .L0xa0
.L0x9f:
.L0xa0:
	inc rdi
.L0x9d:
	mov rbx, rdi
	mov bl, byte[rbx]
	test bl, bl
	jnz .L0x9c
.L0x9e:
	xor rax, rax
___char._strchr_pchar.char__return:
	ret
_char._strerror_pvoid:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov [rbp-8], rdi
	cmp qword[rbp-8], 0
	jl .L0xa1
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _char._get_errstr_pvoid
	jmp ___char._strerror_pvoid__return
	jmp .L0xa2
.L0xa1:
	mov rcx, qword[rbp-8]
	mov rbx, 0
	sub rbx, rcx
	mov rdi, rbx
	call _char._get_errstr_pvoid
	jmp ___char._strerror_pvoid__return
.L0xa2:
	xor rax, rax
___char._strerror_pvoid__return:
	leave
	ret
_long_divmod10_plonglong.:
	mov rbx, rsi
	mov rdx, 1844674407370955162
	imul rdx
	mov rax, rdx
	shr rax, 63
	add rdx, rax
	mov rdx, 10
	imul rdx
	sub rax, rax
	mov r10, rax
	mov [rbx], r10
	mov rax, rdi
	mov rdx, 1844674407370955162
	imul rdx
	mov rax, rdx
	shr rax, 63
	add rdx, rax
	mov rax, rdx
___long_divmod10_plonglong.__return:
	ret
_size_t_toBinary_pchar.ulongint:
	push rbp
	mov rbp, rsp
	sub rsp, 24
	mov [rbp-8], rdx
	mov ebx, dword[rbp-8]
	movsxd rcx, ebx
	add rdi, rcx
	mov dword[rbp-16], 0
	jmp .L0xaa
.L0xa9:
	mov rcx, 1
	mov rbx, rsi
	and rbx, rcx
	jz .L0xad
	mov rbx, rdi
	mov byte[rbx], 49
	jmp .L0xae
.L0xad:
	mov rbx, rdi
	mov byte[rbx], 48
.L0xae:
	shr rsi, 1
	dec rdi
.L0xab:
	add dword[rbp-16], 1
.L0xaa:
	mov ecx, dword[rbp-8]
	cmp dword[rbp-16], ecx
	jl .L0xa9
.L0xac:
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
	mov rcx, 9221120237041090561
	cmp rbx, rcx
	jne .L0xaf
	mov rsi, __LC.S131
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	call _long_strcpy_pchar.char.
	mov rbx, rax
	mov rax, 4
	jmp ___long_toStr_pdoublechar.long__return
	jmp .L0xb0
.L0xaf:
	movsd xmm7, qword[rbp-8]
	movq rbx, xmm7
	mov rcx, 9218868437227405313
	cmp rbx, rcx
	jne .L0xb1
	mov rsi, __LC.S132
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	call _long_strcpy_pchar.char.
	mov rbx, rax
	mov rax, 4
	jmp ___long_toStr_pdoublechar.long__return
	jmp .L0xb2
.L0xb1:
	movsd xmm7, qword[rbp-8]
	movq rbx, xmm7
	mov rcx, 9223372036854775807
	cmp rbx, rcx
	jne .L0xb3
	mov rsi, __LC.S133
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	call _long_strcpy_pchar.char.
	mov rbx, rax
	mov rax, 3
	jmp ___long_toStr_pdoublechar.long__return
	jmp .L0xb4
.L0xb3:
	mov rax, 4890904797277847552
	movq xmm7, rax
	movsd xmm8, qword[rbp-8]
	comisd xmm8, xmm7
	jne .L0xb5
	mov rsi, __LC.S134
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	call _long_strcpy_pchar.char.
	mov rbx, rax
	mov rax, 3
	jmp ___long_toStr_pdoublechar.long__return
	jmp .L0xb6
.L0xb5:
	mov rax, 4895410595928473600
	movq xmm7, rax
	movsd xmm8, qword[rbp-8]
	comisd xmm8, xmm7
	jne .L0xb7
	mov rsi, __LC.S135
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	call _long_strcpy_pchar.char.
	mov rbx, rax
	mov rax, 4
	jmp ___long_toStr_pdoublechar.long__return
	jmp .L0xb8
.L0xb7:
.L0xb8:
.L0xb6:
.L0xb4:
.L0xb2:
.L0xb0:
	cvttsd2si rbx, qword[rbp-8]
	mov qword[rbp-32], rbx
	mov qword[rbp-40], 0
	mov rbx, qword[rbp-32]
	test rbx, rbx
	setz bl
	movsd xmm7, qword[rbp-8]
	movq rcx, xmm7
	sar rcx, 63
	mov r11, rcx
	and bl, r11b
	jz .L0xb9
	mov rbx, qword[rbp-16]
	mov byte[rbx], 45
	add qword[rbp-16], 1
	add qword[rbp-40], 1
	jmp .L0xba
.L0xb9:
.L0xba:
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
	movsd xmm7, qword[rbp-8]
	movsd xmm0, xmm7
	roundsd xmm0, xmm0, 0  
	cvttsd2si rax, xmm0
.L0xd0:
	mov rdi, rax
	call _long_abs_plong
	mov rbx, rax
	mov qword[rbp-48], rbx
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
	mov rcx, qword[rbp-56]
	mov rbx, 7
	sub rbx, rcx
	mov qword[rbp-56], rbx
	mov qword[rbp-64], 0
	jmp .L0xd3
.L0xd2:
	mov rbx, qword[rbp-16]
	mov byte[rbx], 48
	add qword[rbp-16], 1
	add qword[rbp-40], 1
.L0xd4:
	add qword[rbp-64], 1
.L0xd3:
	mov rcx, qword[rbp-56]
	cmp qword[rbp-64], rcx
	jl .L0xd2
.L0xd5:
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
	mov rcx, qword[rbp-8]
	mov qword[rbp-40], rcx
	mov rbx, qword[rbp-8]
	test rbx, rbx
	setz bl
	mov rcx, qword[rbp-16]
	test rcx, rcx
	setz cl
	or bl, cl
	jz .L0xd6
	xor eax, eax
	jmp ___int___sprintf_pchar.char.void.__return
	jmp .L0xd7
.L0xd6:
.L0xd7:
	jmp .L0xd9
.L0xd8:
	mov rbx, qword[rbp-16]
	cmp byte[rbx], 37
	je .L0xdb
	mov rbx, qword[rbp-8]
	mov rcx, qword[rbp-16]
	mov cl, byte[rcx]
	mov [rbx], cl
	add qword[rbp-8], 1
	jmp .L0xdc
.L0xdb:
	add qword[rbp-16], 1
	mov rbx, qword[rbp-16]
	mov bl, byte[rbx]
	mov byte[rbp-48], bl
	cmp byte[rbp-48], 105
	je .L0xde
	cmp bl, 108
	je .L0xdf
	cmp bl, 99
	je .L0xe0
	cmp bl, 120
	je .L0xe1
	cmp bl, 111
	je .L0xe2
	cmp bl, 117
	je .L0xe3
	cmp bl, 115
	je .L0xe6
	cmp bl, 66
	je .L0xe7
	cmp bl, 101
	je .L0xea
	cmp bl, 102
	je .L0xeb
	cmp bl, 98
	je .L0xec
	jmp .L0xdd
.L0xde:
	mov r10d, dword[rbp-32]
	mov rcx, qword[rbp-24]
	mov eax, r10d
	cdqe
	mov r10, [rcx+rax*8]
	mov rcx, r10
	mov dword[rbp-56], ecx
	mov rcx, 10
	mov dl, 1
	mov r10, qword[rbp-8]
	mov rsi, r10
	movsxd rdi, dword[rbp-56]
	call _long_toStr_plongchar.boollong
	mov rcx, rax
	mov qword[rbp-64], rcx
	mov rcx, qword[rbp-64]
	dec rcx
	add qword[rbp-8], rcx
	jmp .L0xdd
.L0xdf:
	mov r10d, dword[rbp-32]
	mov rcx, qword[rbp-24]
	mov eax, r10d
	cdqe
	mov r10, [rcx+rax*8]
	mov qword[rbp-72], r10
	mov rcx, 10
	mov dl, 1
	mov r10, qword[rbp-8]
	mov rsi, r10
	mov r10, qword[rbp-72]
	mov rdi, r10
	call _long_toStr_plongchar.boollong
	mov rcx, rax
	mov qword[rbp-80], rcx
	mov rcx, qword[rbp-80]
	dec rcx
	add qword[rbp-8], rcx
	jmp .L0xdd
.L0xe0:
	mov r10d, dword[rbp-32]
	mov rcx, qword[rbp-24]
	mov eax, r10d
	cdqe
	mov r10, [rcx+rax*8]
	mov r11, r10
	mov byte[rbp-88], r11b
	mov rcx, qword[rbp-8]
	mov r11b, byte[rbp-88]
	mov [rcx], r11b
	add qword[rbp-8], 1
	jmp .L0xdd
.L0xe1:
	mov r10d, dword[rbp-32]
	mov rcx, qword[rbp-24]
	mov eax, r10d
	cdqe
	mov r10, [rcx+rax*8]
	mov qword[rbp-96], r10
	mov rcx, 16
	mov dl, 0
	mov r10, qword[rbp-8]
	mov rsi, r10
	mov r10, qword[rbp-96]
	mov rdi, r10
	call _long_toStr_plongchar.boollong
	mov rcx, rax
	mov qword[rbp-104], rcx
	mov rcx, qword[rbp-104]
	dec rcx
	add qword[rbp-8], rcx
	jmp .L0xdd
.L0xe2:
	mov r10d, dword[rbp-32]
	mov rcx, qword[rbp-24]
	mov eax, r10d
	cdqe
	mov r10, [rcx+rax*8]
	mov qword[rbp-112], r10
	mov rcx, 8
	mov dl, 0
	mov r10, qword[rbp-8]
	mov rsi, r10
	mov r10, qword[rbp-112]
	mov rdi, r10
	call _long_toStr_plongchar.boollong
	mov rcx, rax
	mov qword[rbp-120], rcx
	mov rcx, qword[rbp-120]
	dec rcx
	add qword[rbp-8], rcx
	jmp .L0xdd
.L0xe3:
	mov r10b, 1
	mov rcx, qword[rbp-16]
	movsx eax, r10b
	cdqe
	mov r10b, [rcx+rax*1]
	mov byte[rbp-128], r10b
	cmp byte[rbp-128], 108
	jne .L0xe4
	mov r10d, dword[rbp-32]
	mov rcx, qword[rbp-24]
	mov eax, r10d
	cdqe
	mov r10, [rcx+rax*8]
	mov qword[rbp-136], r10
	mov rcx, 10
	mov dl, 0
	mov r10, qword[rbp-8]
	mov rsi, r10
	mov r10, qword[rbp-136]
	mov rdi, r10
	call _long_toStr_plongchar.boollong
	mov r10, rax
	mov dword[rbp-144], r10d
	mov ecx, dword[rbp-144]
	movsxd r10, ecx
	dec r10
	add qword[rbp-8], r10
	add qword[rbp-16], 1
	jmp .L0xe5
.L0xe4:
	mov r10d, dword[rbp-32]
	mov rcx, qword[rbp-24]
	mov eax, r10d
	cdqe
	mov r10, [rcx+rax*8]
	mov qword[rbp-136], r10
	mov rcx, 10
	mov dl, 0
	mov r10, qword[rbp-8]
	mov rsi, r10
	mov r10, qword[rbp-136]
	mov rdi, r10
	call _long_toStr_plongchar.boollong
	mov r10, rax
	mov dword[rbp-144], r10d
	mov ecx, dword[rbp-144]
	movsxd r10, ecx
	dec r10
	add qword[rbp-8], r10
.L0xe5:
	jmp .L0xdd
.L0xe6:
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
	mov ecx, dword[rbp-136]
	movsxd r10, ecx
	add qword[rbp-8], r10
	jmp .L0xdd
.L0xe7:
	mov r10d, dword[rbp-32]
	mov rcx, qword[rbp-24]
	mov eax, r10d
	cdqe
	mov r10, [rcx+rax*8]
	mov rcx, r10
	mov byte[rbp-144], cl
	mov r10, __LC.S136
	mov qword[rbp-152], r10
	mov al, byte[rbp-144]
	test al, al
	jz .L0xe8
	mov r10, __LC.S137
	mov qword[rbp-152], r10
	jmp .L0xe9
.L0xe8:
.L0xe9:
	mov r10, qword[rbp-152]
	mov rsi, r10
	mov r10, qword[rbp-8]
	mov rdi, r10
	call _long_strcpy_pchar.char.
	mov r10, rax
	mov dword[rbp-160], r10d
	mov ecx, dword[rbp-160]
	movsxd r10, ecx
	add qword[rbp-8], r10
	jmp .L0xdd
.L0xea:
	mov r10d, dword[rbp-32]
	mov rcx, qword[rbp-24]
	mov eax, r10d
	cdqe
	mov r10, [rcx+rax*8]
	movq xmm7, r10
	movsd qword[rbp-168], xmm7
	mov rsi, 1000000000
	mov r10, qword[rbp-8]
	mov rdi, r10
	movsd xmm7, qword[rbp-168]
	movsd xmm0, xmm7
	call _long_toStr_pdoublechar.long
	mov r10, rax
	mov dword[rbp-176], r10d
	mov ecx, dword[rbp-176]
	movsxd r10, ecx
	dec r10
	add qword[rbp-8], r10
	jmp .L0xdd
.L0xeb:
	mov r10d, dword[rbp-32]
	mov rcx, qword[rbp-24]
	mov eax, r10d
	cdqe
	mov r10, [rcx+rax*8]
	movq xmm7, r10
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
	mov ecx, dword[rbp-200]
	movsxd r10, ecx
	dec r10
	add qword[rbp-8], r10
	jmp .L0xdd
.L0xec:
	mov r10d, dword[rbp-32]
	mov rcx, qword[rbp-24]
	mov eax, r10d
	cdqe
	mov r10, [rcx+rax*8]
	mov qword[rbp-208], r10
	mov rcx, qword[rbp-16]
	inc rcx
	mov cl, byte[rcx]
	mov byte[rbp-216], cl
	mov dword[rbp-224], 64
	cmp byte[rbp-216], 56
	jne .L0xed
	add qword[rbp-16], 1
	jmp .L0xee
.L0xed:
	cmp byte[rbp-216], 52
	jne .L0xef
	mov dword[rbp-224], 32
	add qword[rbp-16], 1
	jmp .L0xf0
.L0xef:
	cmp byte[rbp-216], 50
	jne .L0xf1
	mov dword[rbp-224], 16
	add qword[rbp-16], 1
	jmp .L0xf2
.L0xf1:
	cmp byte[rbp-216], 49
	jne .L0xf3
	mov dword[rbp-224], 8
	add qword[rbp-16], 1
	jmp .L0xf4
.L0xf3:
.L0xf4:
.L0xf2:
.L0xf0:
.L0xee:
	mov r10d, dword[rbp-224]
	mov edx, r10d
	mov rsi, qword[rbp-208]
	mov r10, qword[rbp-8]
	mov rdi, r10
	call _size_t_toBinary_pchar.ulongint
	mov rcx, rax
	mov qword[rbp-232], rcx
	mov r10, qword[rbp-232]
	add qword[rbp-8], r10
	jmp .L0xdd
.L0xdd:
	add dword[rbp-32], 1
.L0xdc:
	add qword[rbp-16], 1
.L0xd9:
	mov rbx, qword[rbp-16]
	mov bl, byte[rbx]
	test bl, bl
	jnz .L0xd8
.L0xda:
	mov rcx, qword[rbp-8]
	sub rcx, qword[rbp-40]
	mov eax, ecx
___int___sprintf_pchar.char.void.__return:
	leave
	ret
sprintf:
	push rbp
	mov rbp, rsp
	sub rsp, 96
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push rbx
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	mov [rbp-24], rdx
	mov [rbp-32], rcx
	mov [rbp-40], r8
	mov [rbp-48], r9
	lea rbx, [rbp-80] 
	mov r10, qword[rbp-24]
	mov [rbx], r10
	lea rbx, [rbp-72]
	mov r10, qword[rbp-32]
	mov [rbx], r10
	lea rbx, [rbp-64]
	mov r10, qword[rbp-40]
	mov [rbx], r10
	lea rbx, [rbp-56]
	mov r10, qword[rbp-48]
	mov [rbx], r10
	lea rbx, [rbp-80]
	mov rdx, rbx
	mov rbx, qword[rbp-16]
	mov rsi, rbx
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _int___sprintf_pchar.char.void.
	mov rbx, rax
	mov dword[rbp-88], ebx
	mov ebx, dword[rbp-88]
	mov eax, ebx
	pop rbx
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
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
	mov rcx, rax
	mov qword[rbp-24], rcx
	mov cl, 1
	mov rbx, qword[rbp-16]
	movsx eax, cl
	cdqe
	mov cl, [rbx+rax*1]
	mov rbx, qword[rbp-24]
	movsx eax, cl
	cdqe
	add rbx, rax
	mov qword[rbp-32], 510
	mov dword[rbp-40], 0
	cmp qword[rbp-24], 114
	je .L0xf6
	cmp rbx, 119
	je .L0xf7
	cmp rbx, 97
	je .L0xf8
	cmp rbx, 157
	je .L0xf9
	cmp rbx, 162
	je .L0xfa
	cmp rbx, 140
	je .L0xfb
	jmp .L0xf5
.L0xf6:
	mov dword[rbp-40], 0
	jmp .L0xf5
.L0xf7:
	mov dword[rbp-40], 1
	jmp .L0xf5
.L0xf8:
	mov dword[rbp-40], 1
	jmp .L0xf5
.L0xf9:
	mov dword[rbp-40], 2
	jmp .L0xf5
.L0xfa:
	mov dword[rbp-40], 2
	jmp .L0xf5
.L0xfb:
	mov dword[rbp-40], 2
	jmp .L0xf5
.L0xf5:
	mov rbx, qword[rbp-32]
	mov rdx, rbx
	mov ebx, dword[rbp-40]
	mov esi, ebx
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	mov rax, 2
	mov r10, rcx
	syscall
	mov rbx, rax
.L0xff:
	mov rbx, rax
	mov qword[rbp-48], rbx
	cmp qword[rbp-24], 140
	sete bl
	cmp qword[rbp-24], 97
	sete cl
	or bl, cl
	jz .L0x100
	mov edx, 2
	mov esi, 0
	mov rbx, qword[rbp-48]
	mov rdi, rbx
	mov rax, 8
	mov r10, rcx
	syscall
	mov rbx, rax
.L0x105:
	mov rbx, rax
	jmp .L0x101
.L0x100:
.L0x101:
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
	mov rbx, rax
	mov qword[rbp-24], rbx
	mov rbx, qword[rbp-24]
	mov rdx, rbx
	mov rbx, qword[rbp-16]
	mov rsi, rbx
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	mov rax, 1
	mov r10, rcx
	syscall
	mov rbx, rax
.L0x109:
	mov rbx, rax
	mov qword[rbp-32], rbx
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
	mov rbx, rax
	mov qword[rbp-16], rbx
	mov rbx, qword[rbp-16]
	mov rdx, rbx
	mov rbx, qword[rbp-8]
	mov rsi, rbx
	mov rdi, 1
	mov rax, 1
	mov r10, rcx
	syscall
	mov rbx, rax
.L0x10d:
	mov rbx, rax
	mov qword[rbp-24], rbx
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
	mov rbx, rax
.L0x111:
	mov rbx, rax
	mov qword[rbp-32], rbx
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
	mov rbx, rax
.L0x115:
	mov rbx, rax
	mov dword[rbp-16], ebx
	mov edx, 2
	mov r10d, dword[rbp-16]
	mov rbx, 0
	movsxd r11, r10d
	sub rbx, r11
	mov esi, ebx
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	mov rax, 8
	mov r10, rcx
	syscall
	mov rbx, rax
.L0x119:
	mov rbx, rax
	mov ebx, dword[rbp-16]
	movsxd rcx, ebx
	mov rdi, rcx
	call _mallocptr._mapalloc_psize_t
	mov rbx, rax
	mov qword[rbp-24], rbx
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
	mov rbx, rax
.L0x11d:
	mov rbx, rax
	mov qword[rbp-32], rbx
	cmp qword[rbp-32], 0
	jge .L0x11e
	mov rax, qword[rbp-32]
	jmp ___void._floads_pfd_t__return
	jmp .L0x11f
.L0x11e:
.L0x11f:
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
	mov rbx, rax
.L0x125:
.L0x121:
	mov rbx, rax
	mov qword[rbp-32], rbx
	mov rbx, qword[rbp-16]
	mov rdx, rbx
	mov rbx, qword[rbp-8]
	mov rsi, rbx
	mov rbx, qword[rbp-32]
	mov rdi, rbx
	call _int___sprintf_pchar.char.void.
	mov rbx, rax
	mov dword[rbp-40], ebx
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
	mov rbx, rax
.L0x12a:
	mov rbx, rax
	mov rsi, 10000
	mov rdi, qword[rbp-32]
	mov rax, 11
	mov r10, rcx
	syscall
	mov rbx, rax
.L0x12e:
	mov rbx, rax
	xor rax, rax
___void___printf_pchar.void.fd_t__return:
	leave
	ret
printf:
	push rbp
	mov rbp, rsp
	sub rsp, 104
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push rbx
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	mov [rbp-24], rdx
	mov [rbp-32], rcx
	mov [rbp-40], r8
	mov [rbp-48], r9
	lea rbx, [rbp-96] 
	mov r10, qword[rbp-16]
	mov [rbx], r10
	lea rbx, [rbp-88]
	mov r10, qword[rbp-24]
	mov [rbx], r10
	lea rbx, [rbp-80]
	mov r10, qword[rbp-32]
	mov [rbx], r10
	lea rbx, [rbp-72]
	mov r10, qword[rbp-40]
	mov [rbx], r10
	lea rbx, [rbp-64]
	mov r10, qword[rbp-48]
	mov [rbx], r10
	mov rdx, 1
	lea rbx, [rbp-96]
	mov rsi, rbx
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _void___printf_pchar.void.fd_t
	mov rbx, rax
	xor rax, rax
	pop rbx
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
__printf__return:
	leave
	ret
eprintf:
	push rbp
	mov rbp, rsp
	sub rsp, 104
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push rbx
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	mov [rbp-24], rdx
	mov [rbp-32], rcx
	mov [rbp-40], r8
	mov [rbp-48], r9
	lea rbx, [rbp-96] 
	mov r10, qword[rbp-16]
	mov [rbx], r10
	lea rbx, [rbp-88]
	mov r10, qword[rbp-24]
	mov [rbx], r10
	lea rbx, [rbp-80]
	mov r10, qword[rbp-32]
	mov [rbx], r10
	lea rbx, [rbp-72]
	mov r10, qword[rbp-40]
	mov [rbx], r10
	lea rbx, [rbp-64]
	mov r10, qword[rbp-48]
	mov [rbx], r10
	mov rdx, 2
	lea rbx, [rbp-96]
	mov rsi, rbx
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _void___printf_pchar.void.fd_t
	mov rbx, rax
	xor rax, rax
	pop rbx
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
__eprintf__return:
	leave
	ret
fprintf:
	push rbp
	mov rbp, rsp
	sub rsp, 88
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push rbx
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	mov [rbp-24], rdx
	mov [rbp-32], rcx
	mov [rbp-40], r8
	mov [rbp-48], r9
	lea rbx, [rbp-80] 
	mov r10, qword[rbp-24]
	mov [rbx], r10
	lea rbx, [rbp-72]
	mov r10, qword[rbp-32]
	mov [rbx], r10
	lea rbx, [rbp-64]
	mov r10, qword[rbp-40]
	mov [rbx], r10
	lea rbx, [rbp-56]
	mov r10, qword[rbp-48]
	mov [rbx], r10
	mov rbx, qword[rbp-8]
	mov rdx, rbx
	lea rbx, [rbp-80]
	mov rsi, rbx
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	call _void___printf_pchar.void.fd_t
	mov rbx, rax
	xor rax, rax
	pop rbx
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
__fprintf__return:
	leave
	ret
_void___assert_pboolchar.intchar.:
	push rbp
	mov rbp, rsp
	sub rsp, 64
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	mov [rbp-24], rdx
	mov [rbp-32], rcx
	cmp byte[rbp-8], 0
	jne .L0x12f
	mov rcx, qword[rbp-32]
	movsxd rdx, dword[rbp-24]
	mov rsi, qword[rbp-16]
	mov rdi, __LC.S138
	mov al, 0
	enter 0, 0
	and rsp, -16
	call eprintf
	leave
	mov rbx, rax
	mov rdi, 1
	mov rax, 60
	mov r10, rcx
	syscall
	mov rbx, rax
.L0x134:
	mov rbx, rax
	jmp .L0x130
.L0x12f:
.L0x130:
	xor rax, rax
___void___assert_pboolchar.intchar.__return:
	leave
	ret
_void_merge_right_pmblock.:
	mov rbx, rdi
	mov rbx, [rbx+8]
	test rbx, rbx
	jz .L0x13d
	mov rbx, rdi
	lea rbx, [rbx+8]
	mov rcx, rbx
	cmp qword[rcx+24], 1
	jne .L0x13f
	mov rbx, rdi
	mov rbx, qword[rbx]
	add rbx, 32
	mov rcx, rdi
	add rcx, rbx
	mov rbx, rdi
	cmp rcx, qword[rbx]
	jne .L0x141
	mov rbx, rdi
	mov rcx, rdi
	lea rcx, [rcx+8]
	mov r10, rcx
	mov r10, qword[r10]
	add r10, 32
	add [rbx], r10
	mov rbx, rdi
	lea rbx, [rbx+8]
	mov rcx, rdi
	lea rcx, [rcx+8]
	mov r10, rcx
	mov r10, [r10+8]
	mov [rbx], r10
	mov rbx, rdi
	lea rbx, [rbx+8]
	test rbx, rbx
	jz .L0x143
	mov rbx, rdi
	lea rbx, [rbx+8]
	mov rcx, rbx
	lea rcx, [rcx+16]
	mov r10, rdi
	mov [rcx], r10
	jmp .L0x144
.L0x143:
.L0x144:
	jmp .L0x142
.L0x141:
.L0x142:
	jmp .L0x140
.L0x13f:
.L0x140:
	jmp .L0x13e
.L0x13d:
.L0x13e:
	xor rax, rax
___void_merge_right_pmblock.__return:
	ret
_bool_scan_merge_pmblock.:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov [rbp-8], rdi
	mov rcx, qword[malloc_maxcache]
	cmp qword[cached_size], rcx
	jle .L0x145
	mov rbx, qword[rbp-8]
	mov rbx, qword[rbx]
	add rbx, 32
	sub qword[cached_size], rbx
	xor rcx, rcx
	cmp qword[cached_size], rcx
	setl bl
	cmp qword[cached_size], 2147483647
	setg cl
	mov r11, qword[cached_size]
	mov r10, 2147483647
	test rcx, rcx
	cmovnz r12, r10
	cmovz r12, r11
	xor rcx, rcx
	test rbx, rbx
	cmovnz r10, rcx
	cmovz r10, r12
	mov qword[cached_size], r10
	mov rbx, qword[rbp-8]
	mov rbx, qword[rbx]
	add rbx, 32
	mov rsi, rbx
	mov rax, 11
	mov r10, rcx
	syscall
	mov rbx, rax
.L0x14c:
.L0x148:
	mov rbx, rax
	xor al, al
	jmp ___bool_scan_merge_pmblock.__return
	jmp .L0x146
.L0x145:
.L0x146:
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _void_merge_right_pmblock.
	mov rbx, rax
	mov rbx, qword[rbp-8]
	mov rbx, [rbx+16]
	mov rdi, rbx
	call _void_merge_right_pmblock.
	mov rbx, rax
	mov al, 1
___bool_scan_merge_pmblock.__return:
	leave
	ret
_void_add_block_pmblock.:
	mov rbx, qword[free_head]
	test rbx, rbx
	jnz .L0x150
	mov rcx, rdi
	mov qword[free_head], rcx
	mov rbx, rdi
	lea rbx, [rbx+16]
	mov r10, rdi
	mov [rbx], r10
	mov rbx, rdi
	mov qword[rbx+8], 0
	jmp ___void_add_block_pmblock.__return
	jmp .L0x151
.L0x150:
.L0x151:
	mov rbx, qword[free_head]
	lea rbx, [rbx+16]
	mov rcx, rbx
	lea rcx, [rcx+8]
	mov r10, rdi
	mov [rcx], r10
	mov rbx, qword[free_head]
	lea rbx, [rbx+16]
	mov r10, rdi
	mov [rbx], r10
___void_add_block_pmblock.__return:
	ret
_mblock._scan_existing_psize_t:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov [rbp-8], rdi
	mov rbx, qword[free_head]
	test rbx, rbx
	jnz .L0x152
	xor rax, rax
	jmp ___mblock._scan_existing_psize_t__return
	jmp .L0x153
.L0x152:
.L0x153:
	mov rcx, qword[free_head]
	mov qword[rbp-16], rcx
	jmp .L0x155
.L0x154:
	mov rbx, qword[rbp-16]
	cmp qword[rbx+24], 1
	jne .L0x158
	mov rbx, qword[rbp-16]
	mov rbx, qword[rbx]
	cmp rbx, qword[rbp-8]
	jl .L0x15a
	mov rbx, qword[rbp-8]
	mov rsi, rbx
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	call _void_split_block_pmblock.size_t
	mov rbx, rax
	mov rbx, qword[rbp-16]
	mov qword[rbx+24], 0
	mov rbx, qword[rbp-16]
	mov rax, rbx
	jmp ___mblock._scan_existing_psize_t__return
	jmp .L0x15b
.L0x15a:
.L0x15b:
	jmp .L0x159
.L0x158:
.L0x159:
.L0x156:
	mov rbx, qword[rbp-16]
	mov rbx, [rbx+8]
	mov qword[rbp-16], rbx
.L0x155:
	mov rbx, qword[rbp-16]
	test rbx, rbx
	jnz .L0x154
.L0x157:
	xor rax, rax
___mblock._scan_existing_psize_t__return:
	leave
	ret
_void_printstate_p:
	push rbp
	mov rbp, rsp
	sub rsp, 32
	mov rdi, __LC.S139
	call _size_t_puts_pchar.
.L0x15d:
	mov rbx, rax
	mov rbx, qword[free_head]
	test rbx, rbx
	jnz .L0x15f
	mov rdi, __LC.S140
	call _size_t_puts_pchar.
.L0x162:
	mov rbx, rax
	jmp .L0x160
.L0x15f:
	mov rcx, qword[free_head]
	mov qword[rbp-8], rcx
	jmp .L0x165
.L0x164:
	mov rbx, qword[rbp-8]
	mov rbx, [rbx+24]
	mov rcx, rbx
	mov rdx, qword[rbp-8]
	mov rbx, qword[rbp-8]
	mov rbx, qword[rbx]
	mov rsi, rbx
	mov rdi, __LC.S141
	mov al, 0
	enter 0, 0
	and rsp, -16
	call printf
	leave
	mov rbx, rax
.L0x166:
	mov rbx, qword[rbp-8]
	mov rbx, [rbx+8]
	mov qword[rbp-8], rbx
.L0x165:
	mov rbx, qword[rbp-8]
	test rbx, rbx
	jnz .L0x164
.L0x167:
.L0x160:
	mov rcx, qword[cached_size]
	mov rdx, qword[deletions]
	mov rsi, qword[appends]
	mov rdi, __LC.S142
	mov al, 0
	enter 0, 0
	and rsp, -16
	call printf
	leave
	mov rbx, rax
	mov rdi, __LC.S143
	call _size_t_puts_pchar.
.L0x169:
	mov rbx, rax
	xor rax, rax
___void_printstate_p__return:
	leave
	ret
_mblock._create_ptr_psize_t:
	push rbp
	mov rbp, rsp
	sub rsp, 32
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
	mov rbx, rax
.L0x170:
.L0x16c:
	mov rbx, rax
	mov qword[rbp-16], rbx
	cmp qword[rbp-16], 0
	jle .L0x172
	mov rax, qword[rbp-16]
	jmp ___mblock._create_ptr_psize_t__return
	jmp .L0x173
.L0x172:
.L0x173:
	mov rdi, qword[rbp-16]
	call _char._strerror_pvoid
	mov rdx, rax
	mov rsi, 206
	mov rdi, __LC.S144
	mov al, 0
	enter 0, 0
	and rsp, -16
	call printf
	leave
	mov rbx, rax
	mov rdi, 1
	mov rax, 60
	mov r10, rcx
	syscall
	mov rbx, rax
.L0x177:
	mov rbx, rax
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
	jg .L0x17c
	jmp ___void_split_block_pmblock.size_t__return
	jmp .L0x17d
.L0x17c:
.L0x17d:
	mov rcx, rsi
	mov rbx, rdi
	lea rbx, [rbx+rcx+32]
	mov qword[rbp-8], rbx
	mov rbx, qword[rbp-8]
	lea rbx, [rbx+16]
	mov r10, rdi
	mov [rbx], r10
	mov rbx, qword[rbp-8]
	lea rbx, [rbx+8]
	mov rcx, rdi
	mov rcx, [rcx+8]
	mov [rbx], rcx
	mov rbx, rdi
	lea rbx, [rbx+8]
	test rbx, rbx
	jz .L0x17e
	mov rbx, rdi
	lea rbx, [rbx+8]
	mov rcx, rbx
	lea rcx, [rcx+16]
	mov r10, qword[rbp-8]
	mov [rcx], r10
	jmp .L0x17f
.L0x17e:
.L0x17f:
	mov rbx, rdi
	lea rbx, [rbx+8]
	mov r10, qword[rbp-8]
	mov [rbx], r10
	mov rbx, qword[rbp-8]
	mov rcx, rdi
	mov rcx, qword[rcx]
	sub rcx, rsi
	sub rcx, 32
	mov [rbx], rcx
	mov rbx, qword[rbp-8]
	mov qword[rbx+24], 1
	mov rbx, rdi
	mov r10, rsi
	mov [rbx], r10
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
	jnz .L0x180
	jmp ___void_free_pvoid.__return
	jmp .L0x181
.L0x180:
.L0x181:
	mov rbx, qword[rbp-8]
	sub rbx, 32
	mov qword[rbp-16], rbx
	mov rbx, qword[rbp-16]
	cmp qword[rbx], 4096
	jl .L0x182
	mov rbx, qword[rbp-16]
	add qword[rbx], 32
	mov rbx, qword[rbp-16]
	mov rbx, qword[rbx]
	add rbx, 32
	mov rsi, rbx
	mov rax, 11
	mov r10, rcx
	syscall
	mov rbx, rax
.L0x189:
.L0x185:
	mov rbx, rax
	jmp ___void_free_pvoid.__return
	jmp .L0x183
.L0x182:
.L0x183:
	mov rbx, qword[rbp-16]
	mov qword[rbx+24], 1
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	call _bool_scan_merge_pmblock.
	mov rbx, rax
___void_free_pvoid.__return:
	leave
	ret
_mallocptr._malloc_psize_t:
	push rbp
	mov rbp, rsp
	sub rsp, 24
	mov [rbp-8], rdi
	cmp qword[rbp-8], 4096
	jl .L0x18b
	mov rbx, qword[rbp-8]
	add rbx, 32
	mov rdi, rbx
	call _mblock._create_ptr_psize_t
	mov rbx, rax
	mov qword[rbp-16], rbx
	mov rbx, qword[rbp-16]
	mov r10, qword[rbp-8]
	mov [rbx], r10
	mov rbx, qword[rbp-16]
	mov qword[rbx+8], 0
	mov rbx, qword[rbp-16]
	mov qword[rbx+16], 0
	mov rbx, qword[rbp-16]
	mov qword[rbx+24], 0
	mov rbx, qword[rbp-16]
	add rbx, 32
	mov rax, rbx
	jmp ___mallocptr._malloc_psize_t__return
	jmp .L0x18c
.L0x18b:
.L0x18c:
	mov rbx, qword[free_head]
	test rbx, rbx
	jz .L0x18d
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _mblock._scan_existing_psize_t
	mov rbx, rax
	mov qword[rbp-16], rbx
	mov rax, qword[rbp-16]
	test rax, rax
	jz .L0x18f
	mov rbx, qword[rbp-16]
	mov qword[rbx+24], 0
	mov rbx, qword[rbp-16]
	add rbx, 32
	mov rax, rbx
	jmp ___mallocptr._malloc_psize_t__return
	jmp .L0x190
.L0x18f:
.L0x190:
	jmp .L0x18e
.L0x18d:
.L0x18e:
	mov rdi, 4096
	call _mblock._create_ptr_psize_t
	mov rbx, rax
	mov qword[rbp-16], rbx
	mov rbx, qword[rbp-16]
	mov qword[rbx], 4064
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	call _void_add_block_pmblock.
	mov rbx, rax
	mov rbx, qword[rbp-8]
	mov rsi, rbx
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	call _void_split_block_pmblock.size_t
	mov rbx, rax
	mov rbx, qword[rbp-16]
	mov qword[rbx+24], 0
	mov rbx, qword[rbp-16]
	add rbx, 32
	mov rax, rbx
___mallocptr._malloc_psize_t__return:
	leave
	ret
_mallocptr._realloc_pvoid.size_t:
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
	jge .L0x191
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _void_free_pvoid.
	mov rbx, rax
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	call _mallocptr._malloc_psize_t
	mov rbx, rax
	mov qword[rbp-40], rbx
	mov rcx, qword[rbp-40]
	cmp qword[rbp-8], rcx
	jne .L0x193
	mov rax, qword[rbp-8]
	jmp ___mallocptr._realloc_pvoid.size_t__return
	jmp .L0x194
.L0x193:
.L0x194:
	mov rbx, qword[rbp-32]
	mov rdx, rbx
	mov rbx, qword[rbp-8]
	mov rsi, rbx
	mov rbx, qword[rbp-40]
	mov rdi, rbx
	call _void_memcpy_pvoid.void.size_t
	mov rbx, rax
	mov rax, qword[rbp-40]
	jmp ___mallocptr._realloc_pvoid.size_t__return
	jmp .L0x192
.L0x191:
.L0x192:
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
	mov rbx, rax
.L0x198:
	mov rbx, rax
	mov rax, qword[rbp-8]
___mallocptr._realloc_pvoid.size_t__return:
	leave
	ret
_mallocptr._calloc_psize_t:
	push rbp
	mov rbp, rsp
	sub rsp, 24
	mov [rbp-8], rdi
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _mallocptr._malloc_psize_t
	mov rbx, rax
	mov qword[rbp-16], rbx
	mov rbx, qword[rbp-8]
	mov rsi, rbx
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	call _void_memzer_pvoid.size_t
	mov rbx, rax
	mov rax, qword[rbp-16]
___mallocptr._calloc_psize_t__return:
	leave
	ret
_mallocptr._mapalloc_psize_t:
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
	mov rbx, rax
.L0x19e:
.L0x19a:
	mov rbx, rax
	mov qword[rbp-16], rbx
	mov rbx, qword[rbp-16]
	mov r10, qword[rbp-8]
	mov [rbx], r10
	mov rbx, qword[rbp-16]
	add rbx, 8
	mov rax, rbx
___mallocptr._mapalloc_psize_t__return:
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
	mov rax, 11
	mov r10, rcx
	syscall
	mov rbx, rax
.L0x1a3:
	mov rbx, rax
	xor rax, rax
___void_mapfree_pvoid.__return:
	leave
	ret
_void_maprealloc_pvoid.size_t:
	push rbp
	mov rbp, rsp
	sub rsp, 24
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	sub qword[rbp-8], 8
	xor r9d, r9d
	xor r8, r8
	mov rcx, 34
	mov rdx, 3
	mov rbx, qword[rbp-16]
	add rbx, 8
	mov rsi, rbx
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	mov rax, 9
	mov r10, rcx
	syscall
	mov rbx, rax
.L0x1a7:
	mov rbx, rax
	mov rbx, qword[rbp-8]
	mov rcx, qword[rbp-16]
	add rcx, 8
	mov [rbx], rcx
	xor rax, rax
___void_maprealloc_pvoid.size_t__return:
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
___void_memcpy_pvoid.void.size_t__return:
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
.L0x1abavxmemzeraligned_lp:
	vmovdqu [rdi], ymm0
	add rdi, 4
	sub rsi, 4
	jnz .L0x1abavxmemzeraligned_lp
___void_avx_memzeraligned_pvoid.size_t__return:
	ret
_void_avx_memzer_pvoid.size_t:
	push rbp
	mov rbp, rsp
	sub rsp, 40
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	mov rax, qword[rbp-16]
	mov rdx, 576460752303423488
	imul rdx
	mov rax, rdx
	shr rax, 63
	add rdx, rax
	sal rax, 5
	sub rax, rax
	mov rbx, rax
	mov dword[rbp-24], ebx
	mov ecx, dword[rbp-24]
	mov rbx, qword[rbp-16]
	movsxd r10, ecx
	sub rbx, r10
	mov rax, rbx
	shr rbx, 63
	add rbx, rax
	sar rbx, 2
	mov qword[rbp-32], rbx
	mov rbx, qword[rbp-32]
	mov rsi, rbx
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _void_avx_memzeraligned_pvoid.size_t
	mov rbx, rax
	mov ebx, dword[rbp-24]
	test ebx, ebx
	jz .L0x1ac
	mov ebx, dword[rbp-24]
	movsxd r10, ebx
	mov rdx, r10
	mov sil, 0
	mov r10, qword[rbp-8]
	add r10, qword[rbp-32]
	mov rdi, r10
	call _void_memset_pvoid.ucharsize_t
	mov rbx, rax
	jmp .L0x1ad
.L0x1ac:
.L0x1ad:
	xor rax, rax
___void_avx_memzer_pvoid.size_t__return:
	leave
	ret
_void_memset_pvoid.ucharsize_t:
_void_memset_pvoid.ucharsize_t_flp:
	dec rdx
	mov [rdi+rdx], sil
	jnz _void_memset_pvoid.ucharsize_t_flp
___void_memset_pvoid.ucharsize_t__return:
	ret
_void_memzer_pvoid.size_t:
	xor bl, bl
.L0x1b1:
	mov [rdi+rsi], bl
	dec rsi
	jnz .L0x1b1
___void_memzer_pvoid.size_t__return:
	ret
_long_rand_p:
	mov rbx, qword[rand_next]
	sal rbx, 13
	mov rcx, qword[rand_next]
	xor rcx, rbx
	mov qword[rand_next], rcx
	mov rbx, qword[rand_next]
	sar rbx, 17
	mov rcx, qword[rand_next]
	xor rcx, rbx
	mov qword[rand_next], rcx
	mov rbx, qword[rand_next]
	sal rbx, 5
	mov rcx, qword[rand_next]
	xor rcx, rbx
	mov qword[rand_next], rcx
	mov rbx, qword[rand_next]
	mov rax, rbx
___long_rand_p__return:
	ret
_void_srand_p:
	rdrand rax
.L0x1b6:
	mov rbx, rax
	mov qword[rand_next], rbx
	xor rax, rax
___void_srand_p__return:
	ret
_void_srand_plong:
	mov rcx, rdi
	mov qword[rand_next], rcx
	xor rax, rax
___void_srand_plong__return:
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
	mov rbx, rax
.L0x1bb:
	mov rbx, rax
	test rbx, rbx
	jz .L0x1bc
	mov rax, -1
	jmp ___clock_t_clock_p__return
	jmp .L0x1bd
.L0x1bc:
.L0x1bd:
	mov rcx, 9223372036854
	cmp qword[rbp-24], rcx
	setg bl
	mov rax, qword[rbp-16]
	mov rdx, 18446744073709552
	imul rdx
	mov rax, rdx
	shr rax, 63
	add rdx, rax
	mov rax, rdx
	mov rcx, 1000000
	mov rax, qword[rbp-24]
	imul rax, rcx
	mov rcx, 9223372036854775807
	sub rcx, rax
	cmp rax, rcx
	setg r10b
	or bl, r10b
	jz .L0x1be
	mov rax, -1
	jmp ___clock_t_clock_p__return
	jmp .L0x1bf
.L0x1be:
.L0x1bf:
	mov rbx, 1000000
	mov rax, qword[rbp-24]
	imul rax, rbx
	mov rax, qword[rbp-16]
	mov rdx, 18446744073709552
	imul rdx
	mov rax, rdx
	shr rax, 63
	add rdx, rax
	mov rbx, rdx
	add rbx, rax
	mov rax, rbx
___clock_t_clock_p__return:
	leave
	ret
_tm._gmtime_ptime_t:
	push rbp
	mov rbp, rsp
	sub rsp, 128
	mov [rbp-8], rdi
	mov al, 0
	enter 0, 0
	and rsp, -16
	call tzset
	leave
	mov rbx, rax
	mov rcx, qword[rbp-8]
	mov qword[rbp-16], rcx
	mov rbx, __tmbuf
	mov qword[rbp-24], rbx
	mov dword[rbp-80], 0
	mov dword[rbp-88], 0
	mov rax, qword[rbp-8]
	mov rdx, 307445734561825861
	imul rdx
	mov rax, rdx
	shr rax, 63
	add rdx, rax
	mov rdx, 60
	imul rdx
	sub rax, rax
	mov rbx, rax
	mov dword[rbp-32], ebx
	mov rax, qword[rbp-8]
	mov rdx, 307445734561825861
	imul rdx
	mov rax, rdx
	shr rax, 63
	add rdx, rax
	mov rcx, rdx
	mov qword[rbp-8], rcx
	mov rax, qword[rbp-8]
	mov rdx, 307445734561825861
	imul rdx
	mov rax, rdx
	shr rax, 63
	add rdx, rax
	mov rdx, 60
	imul rdx
	sub rax, rax
	mov rbx, rax
	mov dword[rbp-40], ebx
	mov rax, qword[rbp-8]
	mov rdx, 307445734561825861
	imul rdx
	mov rax, rdx
	shr rax, 63
	add rdx, rax
	mov rcx, rdx
	mov qword[rbp-8], rcx
	mov rax, qword[rbp-8]
	mov rdx, 307445734561825861
	imul rdx
	mov rax, rdx
	shr rax, 63
	add rdx, rax
	mov rdx, 60
	imul rdx
	sub rax, rax
	mov rbx, rax
	mov dword[rbp-48], ebx
	mov rax, qword[rbp-8]
	mov rdx, 307445734561825861
	imul rdx
	mov rax, rdx
	shr rax, 63
	add rdx, rax
	mov rcx, rdx
	mov qword[rbp-8], rcx
	mov rax, qword[rbp-16]
	mov rdx, 307445734561825861
	imul rdx
	mov rax, rdx
	shr rax, 63
	add rdx, rax
	mov rdx, 307445734561825861
	imul rdx
	mov rax, rdx
	shr rax, 63
	add rdx, rax
	mov rdx, 768614336404564651
	imul rdx
	mov rax, rdx
	shr rax, 63
	add rdx, rax
	mov rbx, rdx
	mov dword[rbp-56], ebx
	mov rax, 4645133162144333824
	movq xmm7, rax
	mov ebx, dword[rbp-56]
	cvtsi2sd xmm8, ebx
	divsd xmm8, xmm7
	movsd xmm0, xmm8
	call _long_floor_pdouble
	mov rcx, rax
	mov dword[rbp-64], ecx
	mov rax, 4645133162144333824
	movq xmm7, rax
	mov ebx, dword[rbp-64]
	cvtsi2sd xmm8, ebx
	mulsd xmm8, xmm7
	movsd xmm0, xmm8
	call _long_floor_pdouble
	mov rbx, rax
	mov ecx, dword[rbp-56]
	movsxd r10, ecx
	sub r10, rbx
	mov rbx, r10
	mov dword[rbp-56], ebx
	mov ebx, dword[rbp-56]
	add ebx, 4
	mov eax, ebx
	mov rdx, 613566757
	imul edx
	mov eax, edx
	shr eax, 31
	add edx, eax
	mov rdx, 7
	imul rdx
	sub ebx, eax
	mov dword[rbp-72], ebx
	mov ecx, dword[rbp-56]
	mov dword[rbp-88], ecx
	mov dword[rbp-96], 0
	jmp .L0x1c1
.L0x1c0:
	mov ecx, dword[rbp-96]
	mov rbx, qword[mdays]
	mov eax, ecx
	cdqe
	mov ecx, [rbx+rax*4]
	cmp dword[rbp-88], ecx
	jle .L0x1c4
	mov ecx, dword[rbp-96]
	mov rbx, qword[mdays]
	mov eax, ecx
	cdqe
	mov ecx, [rbx+rax*4]
	mov ebx, dword[rbp-88]
	sub ebx, ecx
	mov dword[rbp-88], ebx
	jmp .L0x1c5
.L0x1c4:
	jmp .L0x1c3
.L0x1c5:
.L0x1c2:
	add dword[rbp-96], 1
.L0x1c1:
	jmp .L0x1c0
.L0x1c3:
	add dword[rbp-96], 1
	mov ecx, dword[rbp-96]
	mov dword[rbp-80], ecx
	mov rbx, qword[rbp-24]
	mov r10d, dword[rbp-32]
	mov [rbx], r10d
	mov rbx, qword[rbp-24]
	lea rbx, [rbx+4]
	mov r10d, dword[rbp-40]
	mov [rbx], r10d
	mov rbx, qword[rbp-24]
	lea rbx, [rbx+8]
	mov r10d, dword[rbp-48]
	mov [rbx], r10d
	mov rbx, qword[rbp-24]
	lea rbx, [rbx+28]
	mov r10d, dword[rbp-56]
	mov [rbx], r10d
	mov rbx, qword[rbp-24]
	lea rbx, [rbx+20]
	mov ecx, dword[rbp-64]
	add ecx, 70
	mov [rbx], ecx
	mov rbx, qword[rbp-24]
	lea rbx, [rbx+24]
	mov r10d, dword[rbp-72]
	mov [rbx], r10d
	mov rbx, qword[rbp-24]
	lea rbx, [rbx+12]
	mov r10d, dword[rbp-88]
	mov [rbx], r10d
	mov rbx, qword[rbp-24]
	lea rbx, [rbx+16]
	mov r10d, dword[rbp-80]
	mov [rbx], r10d
	mov rbx, qword[rbp-24]
	mov rax, rbx
___tm._gmtime_ptime_t__return:
	leave
	ret
_char._asctime_ptm.:
	push rbp
	mov rbp, rsp
	sub rsp, 32
	mov [rbp-8], rdi
	mov rdx, 28
	mov sil, 32
	mov rdi, qword[asctime__result_buf]
	call _void_memset_pvoid.ucharsize_t
	mov rbx, rax
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
	mov rbx, rax
	mov cl, 3
	mov rbx, qword[asctime__result_buf]
	movsx eax, cl
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
	mov rbx, rax
	mov cl, 7
	mov rbx, qword[asctime__result_buf]
	movsx eax, cl
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
	mov al, 0
	enter 0, 0
	and rsp, -16
	call sprintf
	leave
	mov rbx, rax
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
	mov al, 0
	enter 0, 0
	and rsp, -16
	call sprintf
	leave
	mov rbx, rax
	mov rbx, qword[asctime__result_buf]
	mov rax, rbx
___char._asctime_ptm.__return:
	leave
	ret
_tm._localtime_ptime_t:
	push rbp
	mov rbp, rsp
	sub rsp, 32
	mov [rbp-8], rdi
	mov al, 0
	enter 0, 0
	and rsp, -16
	call tzset
	leave
	mov rbx, rax
	mov rcx, qword[timezone]
	mov rbx, qword[rbp-8]
	sub rbx, rcx
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
	mov rcx, qword[rbp-8]
	mov qword[rbp-24], rcx
	mov rsi, 0
	lea rbx, [rbp-32]
	mov rdi, rbx
	mov rax, 35
	mov r10, rcx
	syscall
	mov rbx, rax
.L0x1c9:
	mov rbx, rax
	xor rax, rax
___void_usleep_plong__return:
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
	mov rcx, qword[rbp-8]
	mov qword[rbp-40], rcx
	mov bl, byte[rbp-24]
	mov sil, bl
	mov rbx, qword[rbp-8]
	mov bl, byte[rbx]
	mov dil, bl
	call _bool_fixNegative_pcharbool
	mov rbx, rax
	mov byte[rbp-48], bl
	mov bl, byte[rbp-48]
	movsx eax, bl
	cdqe
	add qword[rbp-8], rax
	mov rbx, qword[rbp-8]
	mov bl, byte[rbx]
	mov byte[rbp-56], bl
	jmp .L0x1cb
.L0x1ca:
	sub byte[rbp-56], 48
	mov rbx, 10
	mov rax, qword[rbp-32]
	imul rax, rbx
	mov rcx, rax
	mov qword[rbp-32], rcx
	mov cl, 255
	mov bl, byte[rbp-56]
	and bl, cl
	movsx eax, bl
	cdqe
	add qword[rbp-32], rax
	add qword[rbp-8], 1
	mov rbx, qword[rbp-8]
	mov bl, byte[rbx]
	mov byte[rbp-56], bl
.L0x1cb:
	cmp byte[rbp-56], 57
	setle bl
	cmp byte[rbp-56], 48
	setge cl
	and bl, cl
	jnz .L0x1ca
.L0x1cc:
	cmp byte[rbp-48], 0
	jne .L0x1cd
	mov rbx, qword[rbp-16]
	mov r10, qword[rbp-32]
	mov [rbx], r10
	jmp .L0x1ce
.L0x1cd:
	mov rbx, qword[rbp-16]
	mov r10, qword[rbp-32]
	mov rcx, 0
	sub rcx, r10
	mov [rbx], rcx
.L0x1ce:
	mov rcx, qword[rbp-40]
	mov rbx, qword[rbp-8]
	sub rbx, rcx
	mov eax, ebx
___int_scanint_pchar.long.bool__return:
	leave
	ret
_int_scanstr_pchar.charchar.:
	push rbp
	mov rbp, rsp
	sub rsp, 24
	mov [rbp-8], rdx
	mov rcx, rdi
	mov qword[rbp-16], rcx
	jmp .L0x1d3
.L0x1d2:
	mov rbx, qword[rbp-8]
	mov rcx, rdi
	mov cl, byte[rcx]
	mov [rbx], cl
	inc rdi
	add qword[rbp-8], 1
.L0x1d3:
	mov rbx, rdi
	cmp byte[rbx], sil
	jne .L0x1d2
.L0x1d4:
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
	mov rcx, rax
	mov qword[rbp-40], rcx
	mov rcx, qword[rbp-40]
	add qword[rbp-8], rcx
	mov rbx, qword[rbp-8]
	cmp byte[rbx], 46
	je .L0x1d5
	mov rbx, qword[rbp-16]
	cvtsi2sd xmm7, qword[rbp-24]
	movsd [rbx], xmm7
	mov rax, qword[rbp-40]
	jmp ___int_scansd_pchar.double.__return
	jmp .L0x1d6
.L0x1d5:
.L0x1d6:
	add qword[rbp-8], 1
	xor dl, dl
	lea rbx, [rbp-32]
	mov rsi, rbx
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _int_scanint_pchar.long.bool
	mov rcx, rax
	mov qword[rbp-48], rcx
	mov rbx, qword[rbp-48]
	mov rsi, rbx
	mov rdi, 10
	call _long_pow_plonglong
	mov rcx, rax
	mov dword[rbp-56], ecx
	mov ebx, dword[rbp-56]
	mov rax, qword[rbp-24]
	movsxd rcx, ebx
	imul rax, rcx
	mov rcx, rax
	mov qword[rbp-24], rcx
	mov rcx, qword[rbp-32]
	mov rbx, qword[rbp-24]
	add rbx, rcx
	cvtsi2sd xmm7, rbx
	movsd qword[rbp-64], xmm7
	mov rbx, qword[rbp-16]
	mov ecx, dword[rbp-56]
	cvtsi2sd xmm7, ecx
	movsd xmm8, qword[rbp-64]
	divsd xmm8, xmm7
	movsd [rbx], xmm8
	mov rcx, qword[rbp-48]
	mov rbx, qword[rbp-40]
	add rbx, rcx
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
	mov rcx, qword[rbp-8]
	test rcx, rcx
	setz cl
	or bl, cl
	jz .L0x1d7
	xor eax, eax
	jmp ___int___SSCANF_pchar.char.void..__return
	jmp .L0x1d8
.L0x1d7:
.L0x1d8:
	jmp .L0x1da
.L0x1d9:
	mov rbx, qword[rbp-8]
	cmp byte[rbx], 37
	je .L0x1dc
	add qword[rbp-8], 1
	add qword[rbp-16], 1
	jmp .L0x1dd
.L0x1dc:
	add qword[rbp-8], 1
	mov rbx, qword[rbp-8]
	mov bl, byte[rbx]
	mov byte[rbp-40], bl
	cmp byte[rbp-40], 105
	jne .L0x1de
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
	mov rcx, rax
	mov qword[rbp-48], rcx
	mov rcx, qword[rbp-48]
	add qword[rbp-16], rcx
	add qword[rbp-8], 1
	jmp .L0x1df
.L0x1de:
	cmp byte[rbp-40], 117
	jne .L0x1e0
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
	mov rcx, rax
	mov qword[rbp-48], rcx
	mov rcx, qword[rbp-48]
	add qword[rbp-16], rcx
	add qword[rbp-8], 1
	jmp .L0x1e1
.L0x1e0:
	cmp byte[rbp-40], 99
	jne .L0x1e2
	mov ecx, dword[rbp-32]
	mov rbx, qword[rbp-24]
	mov eax, ecx
	cdqe
	mov rcx, [rbx+rax*8]
	mov qword[rbp-56], rcx
	mov rbx, qword[rbp-56]
	mov rcx, qword[rbp-16]
	mov cl, byte[rcx]
	mov [rbx], cl
	add qword[rbp-16], 1
	add qword[rbp-8], 1
	jmp .L0x1e3
.L0x1e2:
	cmp byte[rbp-40], 115
	jne .L0x1e4
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
	mov rcx, rax
	mov qword[rbp-48], rcx
	mov rcx, qword[rbp-48]
	add qword[rbp-16], rcx
	jmp .L0x1e5
.L0x1e4:
	cmp byte[rbp-40], 102
	sete bl
	cmp byte[rbp-40], 100
	sete cl
	or bl, cl
	jz .L0x1e6
	mov r10d, dword[rbp-32]
	mov rbx, qword[rbp-24]
	mov eax, r10d
	cdqe
	mov r10, [rbx+rax*8]
	mov rsi, r10
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	call _int_scansd_pchar.double.
	mov rcx, rax
	mov qword[rbp-48], rcx
	mov rcx, qword[rbp-48]
	add qword[rbp-16], rcx
	add qword[rbp-8], 1
	jmp .L0x1e7
.L0x1e6:
.L0x1e7:
.L0x1e5:
.L0x1e3:
.L0x1e1:
.L0x1df:
	add dword[rbp-32], 1
.L0x1dd:
.L0x1da:
	mov rbx, qword[rbp-8]
	mov bl, byte[rbx]
	test bl, bl
	setnz bl
	mov rcx, qword[rbp-16]
	mov cl, byte[rcx]
	test cl, cl
	setnz cl
	and bl, cl
	jnz .L0x1d9
.L0x1db:
	mov ebx, dword[rbp-32]
	mov eax, ebx
___int___SSCANF_pchar.char.void..__return:
	leave
	ret
sscanf:
	push rbp
	mov rbp, rsp
	sub rsp, 88
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push rbx
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	mov [rbp-24], rdx
	mov [rbp-32], rcx
	mov [rbp-40], r8
	mov [rbp-48], r9
	lea rbx, [rbp-80] 
	mov r10, qword[rbp-24]
	mov [rbx], r10
	lea rbx, [rbp-72]
	mov r10, qword[rbp-32]
	mov [rbx], r10
	lea rbx, [rbp-64]
	mov r10, qword[rbp-40]
	mov [rbx], r10
	lea rbx, [rbp-56]
	mov r10, qword[rbp-48]
	mov [rbx], r10
	lea rbx, [rbp-80]
	mov rdx, rbx
	mov rbx, qword[rbp-16]
	mov rsi, rbx
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _int___SSCANF_pchar.char.void..
	mov rbx, rax
	mov eax, ebx
	pop rbx
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
__sscanf__return:
	leave
	ret
_int_inet_aton_pchar.in_addr.:
	push rbp
	mov rbp, rsp
	sub rsp, 96
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
	mov al, 0
	enter 0, 0
	and rsp, -16
	call sscanf
	leave
	mov rbx, rax
	mov bl, [rbp-27]
	movsx eax, bl
	cdqe
	mov rcx, rax
	mov dword[rbp-35], ecx
	mov ecx, 255
	mov ebx, dword[rbp-35]
	and ebx, ecx
	mov bl, [rbp-26]
	movsx eax, bl
	cdqe
	mov rcx, rax
	mov dword[rbp-43], ecx
	mov ecx, 255
	mov ebx, dword[rbp-43]
	and ebx, ecx
	mov bl, [rbp-25]
	movsx eax, bl
	cdqe
	mov rcx, rax
	mov dword[rbp-51], ecx
	mov ecx, 255
	mov ebx, dword[rbp-51]
	and ebx, ecx
	mov bl, [rbp-24]
	movsx eax, bl
	cdqe
	mov rcx, rax
	mov dword[rbp-59], ecx
	mov ecx, 255
	mov ebx, dword[rbp-59]
	and ebx, ecx
	mov ebx, dword[rbp-35]
	sal ebx, 24
	mov ecx, dword[rbp-43]
	sal ecx, 16
	or ebx, ecx
	mov ecx, dword[rbp-51]
	sal ecx, 8
	or ebx, ecx
	mov ecx, dword[rbp-59]
	or ecx, ebx
	mov edi, ecx
	xor rax,rax
	bswap edi
	mov eax, edi
.L0x1ec:
	mov rbx, rax
	mov rcx, qword[rbp-16]
	mov [rcx], ebx
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
	mov rbx, rax
.L0x1f1:
	mov rbx, rax
	mov eax, ebx
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
	mov rbx, rax
.L0x1f5:
	mov rbx, rax
	mov eax, ebx
___int_send_pfd_tchar.size_tint__return:
	leave
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
_string_.operator32_pstring.char.:
	push rbp
	mov rbp, rsp
	sub rsp, 24
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	push rdi
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	call _size_t_strlen_pchar.
	pop rdi
	mov rbx, rax
	mov qword[rdi+8], rbx
	push rdi
	mov rbx, qword[rdi+8]
	mov rsi, rbx
	mov rdi, qword[rdi+0]
	call _void_maprealloc_pvoid.size_t
	pop rdi
	mov rbx, rax
	mov rbx, qword[rdi+8]
	inc rbx
	mov rcx, qword[rdi+0]
	mov byte[rcx+rbx*1], 0
	push rdi
	mov rbx, qword[rbp-16]
	mov rsi, rbx
	mov rbx, qword[rdi+0]
	mov rdi, rbx
	call _long_strcpy_pchar.char.
	pop rdi
	mov rbx, rax
	mov rbx, qword[rbp-8]
	mov rax, rbx
___string_.operator32_pstring.char.__return:
	leave
	ret
_string_.operator33_pstring.string:
	push rbp
	mov rbp, rsp
	sub rsp, 40
	mov [rbp-8], rdi
	movdqu [rbp-32], xmm0
	mov rcx, qword[rbp-24]
	add qword[rdi+8], rcx
	push rdi
	mov rbx, qword[rdi+8]
	inc rbx
	mov rsi, rbx
	mov rdi, qword[rdi+0]
	call _void_maprealloc_pvoid.size_t
	pop rdi
	mov rbx, rax
	push rdi
	mov rbx, qword[rbp-32]
	mov rsi, rbx
	mov r10, qword[rbp-24]
	mov rbx, qword[rdi+8]
	sub rbx, r10
	mov r10, qword[rdi+0]
	add r10, rbx
	mov rdi, r10
	call _long_strcpy_pchar.char.
	pop rdi
	mov rbx, rax
	mov rbx, qword[rbp-8]
	mov rax, rbx
___string_.operator33_pstring.string__return:
	leave
	ret
_string_.operator3_pstring.string:
	push rbp
	mov rbp, rsp
	sub rsp, 56
	movdqu [rbp-24], xmm0
	mov qword[rbp-40], 0
	push rdi
	lea rdi, [rbp-48]
	call _void__Cstring_pstring.
	pop rdi
	push rdi
	mov rsi, qword[rdi+0]
	lea rdi, [rbp-48]
	call _string_.operator32_pstring.char.
	movdqa xmm7, xmm0
	pop rdi
	push rdi
	movdqu xmm0, [rbp-24]
	lea rdi, [rbp-48]
	call _string_.operator33_pstring.string
	movdqa xmm7, xmm0
	pop rdi
	movdqu xmm0, [rbp-48]
___string_.operator3_pstring.string__return:
	leave
	ret
_string_.operator3_pstring.char.:
	push rbp
	mov rbp, rsp
	sub rsp, 32
	mov qword[rbp-16], 0
	push rdi
	lea rdi, [rbp-24]
	call _void__Cstring_pstring.
	pop rdi
	push rdi
	mov rsi, qword[rdi+0]
	lea rdi, [rbp-24]
	call _string_.operator32_pstring.char.
	movdqa xmm7, xmm0
	pop rdi
	push rdi
	lea rdi, [rbp-24]
	call _string_.operator33_pstring.char.
	movdqa xmm7, xmm0
	pop rdi
	movdqu xmm0, [rbp-24]
___string_.operator3_pstring.char.__return:
	leave
	ret
_string_.operator33_pstring.char.:
	push rbp
	mov rbp, rsp
	sub rsp, 32
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	push rdi
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	call _size_t_strlen_pchar.
	pop rdi
	mov rbx, rax
	mov qword[rbp-24], rbx
	push rdi
	mov r10, qword[rbp-24]
	mov rbx, qword[rdi+8]
	add rbx, r10
	inc rbx
	mov rsi, rbx
	mov rdi, qword[rdi+0]
	call _void_maprealloc_pvoid.size_t
	pop rdi
	mov rbx, rax
	push rdi
	mov rbx, qword[rbp-16]
	mov rsi, rbx
	mov r10, qword[rdi+8]
	mov rbx, qword[rdi+0]
	add rbx, r10
	mov rdi, rbx
	call _long_strcpy_pchar.char.
	pop rdi
	mov rbx, rax
	mov rcx, qword[rbp-24]
	add qword[rdi+8], rcx
	mov rbx, qword[rbp-8]
	mov rax, rbx
___string_.operator33_pstring.char.__return:
	leave
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
.L0x1fd:
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
.L0x205:
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
.L0x20d:
	pop rdi
	mov rbx, rax
	xor rax, rax
___void_get_pistream.char.__return:
	leave
	ret
_void_.operator32_postream.fd_t:
	mov rcx, rsi
	mov qword[rdi+0], rcx
	xor rax, rax
___void_.operator32_postream.fd_t__return:
	ret
_ostream_.operator18_postream.char.:
	push rbp
	mov rbp, rsp
	sub rsp, 24
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	push rdi
	mov rbx, qword[rbp-16]
	mov rsi, rbx
	mov rbx, qword[rdi+0]
	mov rdi, rbx
	call _size_t_fputs_pfd_tchar.
	pop rdi
	mov rbx, rax
	mov rbx, qword[rbp-8]
	mov rax, rbx
___ostream_.operator18_postream.char.__return:
	leave
	ret
_ostream_.operator18_postream.long:
	push rbp
	mov rbp, rsp
	sub rsp, 32
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	push rdi
	mov rdx, qword[rbp-16]
	mov rsi, __LC.S167
	mov rbx, qword[rdi+0]
	mov rdi, rbx
	mov al, 0
	enter 0, 0
	and rsp, -16
	call fprintf
	leave
	pop rdi
	mov rbx, rax
	mov rbx, qword[rbp-8]
	mov rax, rbx
___ostream_.operator18_postream.long__return:
	leave
	ret
_ostream_.operator18_postream.ulong:
	push rbp
	mov rbp, rsp
	sub rsp, 32
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	push rdi
	mov rdx, qword[rbp-16]
	mov rsi, __LC.S168
	mov rbx, qword[rdi+0]
	mov rdi, rbx
	mov al, 0
	enter 0, 0
	and rsp, -16
	call fprintf
	leave
	pop rdi
	mov rbx, rax
	mov rbx, qword[rbp-8]
	mov rax, rbx
___ostream_.operator18_postream.ulong__return:
	leave
	ret
_ostream_.operator18_postream.float:
	push rbp
	mov rbp, rsp
	sub rsp, 32
	mov [rbp-8], rdi
	movsd [rbp-16], xmm0
	push rdi
	mov edx, dword[rbp-16]
	mov rsi, __LC.S169
	mov rbx, qword[rdi+0]
	mov rdi, rbx
	mov al, 0
	enter 0, 0
	and rsp, -16
	call fprintf
	leave
	pop rdi
	mov rbx, rax
	mov rbx, qword[rbp-8]
	mov rax, rbx
___ostream_.operator18_postream.float__return:
	leave
	ret
_ostream_.operator18_postream.double:
	push rbp
	mov rbp, rsp
	sub rsp, 32
	mov [rbp-8], rdi
	movsd [rbp-16], xmm0
	push rdi
	mov rdx, qword[rbp-16]
	mov rsi, __LC.S170
	mov rbx, qword[rdi+0]
	mov rdi, rbx
	mov al, 0
	enter 0, 0
	and rsp, -16
	call fprintf
	leave
	pop rdi
	mov rbx, rax
	mov rbx, qword[rbp-8]
	mov rax, rbx
___ostream_.operator18_postream.double__return:
	leave
	ret
_ostream_.operator18_postream.char:
	push rbp
	mov rbp, rsp
	sub rsp, 32
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	push rdi
	movsx eax, byte[rbp-16]
	cdqe
	mov rdx, rax
	mov rsi, __LC.S171
	mov rbx, qword[rdi+0]
	mov rdi, rbx
	mov al, 0
	enter 0, 0
	and rsp, -16
	call fprintf
	leave
	pop rdi
	mov rbx, rax
	mov rbx, qword[rbp-8]
	mov rax, rbx
___ostream_.operator18_postream.char__return:
	leave
	ret
_ostream_.operator18_postream.int:
	push rbp
	mov rbp, rsp
	sub rsp, 32
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	push rdi
	movsxd rdx, dword[rbp-16]
	mov rsi, __LC.S172
	mov rbx, qword[rdi+0]
	mov rdi, rbx
	mov al, 0
	enter 0, 0
	and rsp, -16
	call fprintf
	leave
	pop rdi
	mov rbx, rax
	mov rbx, qword[rbp-8]
	mov rax, rbx
___ostream_.operator18_postream.int__return:
	leave
	ret
_ostream_.operator18_postream.string:
	push rbp
	mov rbp, rsp
	sub rsp, 40
	mov [rbp-8], rdi
	movdqu [rbp-32], xmm0
	push rdi
	mov rbx, qword[rbp-32]
	mov rsi, rbx
	mov rbx, qword[rdi+0]
	mov rdi, rbx
	call _size_t_fputs_pfd_tchar.
	pop rdi
	mov rbx, rax
	mov rbx, qword[rbp-8]
	mov rax, rbx
___ostream_.operator18_postream.string__return:
	leave
	ret
_void_feed_pStack.void.:
	mov rcx, rsi
	mov qword[rdi+8], rcx
	xor rax, rax
___void_feed_pStack.void.__return:
	ret
_void_alloc_pStack.size_t:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov [rbp-8], rsi
	mov rcx, qword[rbp-8]
	mov qword[rdi+16], rcx
	push rdi
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _mallocptr._mapalloc_psize_t
	pop rdi
	mov rbx, rax
	mov qword[rdi+8], rbx
	xor rax, rax
___void_alloc_pStack.size_t__return:
	leave
	ret
_void_destroy_pStack.:
	push rdi
	mov rbx, qword[rdi+8]
	mov rdi, rbx
	call _void_mapfree_pvoid.
	pop rdi
	mov rbx, rax
	xor rax, rax
___void_destroy_pStack.__return:
	ret
_void_set_pVec3f.doubledoubledouble:
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
___void_set_pVec3f.doubledoubledouble__return:
	leave
	ret
_void_add_pVec3f.Vec3f.:
	vmovdqu ymm0, [rdi]
	vaddpd ymm1, ymm0, [rsi]
	vmovdqu [rdi], ymm1
___void_add_pVec3f.Vec3f.__return:
	ret
_void_sub_pVec3f.Vec3f.:
	vmovdqu ymm0, [rdi]
	vsubpd ymm1, ymm0, [rsi]
	vmovdqu [rdi], ymm1
___void_sub_pVec3f.Vec3f.__return:
	ret
_void_mul_pVec3f.Vec3f.:
	vmovdqu ymm0, [rdi]
	vmulpd ymm1, ymm0, [rsi]
	vmovdqu [rdi], ymm1
___void_mul_pVec3f.Vec3f.__return:
	ret
_void_div_pVec3f.Vec3f.:
	vmovdqu ymm0, [rdi]
	vdivpd ymm1, ymm0, [rsi]
	vmovdqu [rdi], ymm1
___void_div_pVec3f.Vec3f.__return:
	ret
_void_sqrt_pVec3f.:
	sqrtsd xmm0, [rdi]  
	sqrtsd xmm1, [rdi+8] 
	sqrtsd xmm2, [rdi+16] 
	movsd [rdi], xmm0  
	movsd [rdi+8], xmm1  
	movsd [rdi+16], xmm2 
___void_sqrt_pVec3f.__return:
	ret
_double_dot_pVec3f.Vec3f.:
	movsd xmm0, [rdi]   
	movsd xmm1, [rdi+8]   
	mulsd xmm0, [rsi]   
	movsd xmm2, [rdi+16]  
	mulsd xmm1, [rsi+8]   
	mulsd xmm2, [rsi+16]  
	addsd xmm0, xmm1   
	addsd xmm0, xmm2   
___double_dot_pVec3f.Vec3f.__return:
	ret
_void_.operator33_pVec3f.Vec3f.:
	vmovdqu ymm0, [rdi]
	vaddpd ymm1, ymm0, [rsi]
	vmovdqu [rdi], ymm1
___void_.operator33_pVec3f.Vec3f.__return:
	ret
_void_.operator34_pVec3f.Vec3f.:
	vmovdqu ymm0, [rdi]
	vsubpd ymm1, ymm0, [rsi]
	vmovdqu [rdi], ymm1
___void_.operator34_pVec3f.Vec3f.__return:
	ret
_void_.operator36_pVec3f.Vec3f.:
	vmovdqu ymm0, [rdi]
	vdivpd ymm1, ymm0, [rsi]
	vmovdqu [rdi], ymm1
___void_.operator36_pVec3f.Vec3f.__return:
	ret
_void_.operator35_pVec3f.Vec3f.:
	vmovdqu ymm0, [rdi]
	vmulpd ymm1, ymm0, [rsi]
	vmovdqu [rdi], ymm1
___void_.operator35_pVec3f.Vec3f.__return:
	ret
_double_.operator20_pVec3f.Vec3f.:
	movsd xmm0, [rdi]   
	movsd xmm1, [rdi+8]   
	mulsd xmm0, [rsi]   
	movsd xmm2, [rdi+16]  
	mulsd xmm1, [rsi+8]   
	mulsd xmm2, [rsi+16]  
	addsd xmm0, xmm1   
	addsd xmm0, xmm2   
___double_.operator20_pVec3f.Vec3f.__return:
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
.L0x24b:
	pop rdi
	mov rbx, rax
	xor rax, rax
___void__DSocket_pSocket.__return:
	ret
_err_t_init_pSocket.:
	push rdi
	xor edx, edx
	mov esi, 1
	mov edi, 2
	mov rax, 41
	mov r10, rcx
	syscall
	mov rbx, rax
.L0x253:
	pop rdi
	mov rbx, rax
	mov qword[rdi+0], rbx
	mov rax, qword[rdi+0]
___err_t_init_pSocket.__return:
	ret
_err_t_init_pSocket.intintint:
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
	mov rbx, rax
.L0x25b:
	pop rdi
	mov rbx, rax
	mov qword[rdi+0], rbx
	mov rax, qword[rdi+0]
___err_t_init_pSocket.intintint__return:
	leave
	ret
_err_t_connect_pSocket.char.int:
	push rbp
	mov rbp, rsp
	sub rsp, 56
	mov [rbp-8], rsi
	mov [rbp-16], rdx
	mov qword[rbp-40], 0
	mov word[rbp-48], 2
	push rdi
	mov ebx, dword[rbp-16]
	mov ecx, ebx
	mov di, cx
	xor rax, rax
	bswap edi
	shr edi, 16
	mov eax, edi
.L0x26a:
	pop rdi
	mov rbx, rax
	mov word[rbp-46], bx
	push rdi
	lea rbx, [rbp-44]
	mov rsi, rbx
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _int_inet_aton_pchar.in_addr.
	pop rdi
	mov rbx, rax
	push rdi
	mov edx, 16
	lea rbx, [rbp-48]
	mov rsi, rbx
	mov rbx, qword[rdi+0]
	mov rdi, rbx
	mov rax, 42
	mov r10, rcx
	syscall
	mov rbx, rax
.L0x26f:
	pop rdi
	mov rbx, rax
	mov dword[rbp-24], ebx
	mov ebx, dword[rbp-24]
	mov eax, ebx
___err_t_connect_pSocket.char.int__return:
	leave
	ret
_ssize_t_send_pSocket.char.:
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
___ssize_t_send_pSocket.char.__return:
	leave
	ret
_ssize_t_send_pSocket.char.size_t:
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
	mov rbx, rax
.L0x277:
	pop rdi
___ssize_t_send_pSocket.char.size_t__return:
	leave
	ret
_err_t_close_pSocket.:
	push rdi
	mov esi, 1
	mov rbx, qword[rdi+0]
	mov rdi, rbx
	mov rax, 48
	mov r10, rcx
	syscall
	mov rbx, rax
.L0x27f:
	pop rdi
	mov rbx, rax
	mov eax, ebx
___err_t_close_pSocket.__return:
	ret
_ssize_t_recv_pSocket.char.size_t:
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
.L0x287:
	pop rdi
___ssize_t_recv_pSocket.char.size_t__return:
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
.L0x289:
	mov rbx, rax
	mov rdx, 40
	mov sil, 0
	lea rbx, [rbp-55]
	mov rdi, rbx
	call _void_memset_pvoid.ucharsize_t
	mov rbx, rax
	mov rdx, 40
	lea rbx, [rbp-55]
	mov rsi, rbx
	mov rdi, 0
	call _long_fgets_pfd_tchar.size_t
	mov rbx, rax
	mov sil, 1
	lea rbx, [rbp-55]
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
	sub rsp, 63
	mov [rbp-8], rdi
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _size_t_puts_pchar.
.L0x28c:
	mov rbx, rax
	mov rdx, 40
	mov sil, 0
	lea rbx, [rbp-55]
	mov rdi, rbx
	call _void_memset_pvoid.ucharsize_t
	mov rbx, rax
	mov rdx, 40
	lea rbx, [rbp-55]
	mov rsi, rbx
	mov rdi, 0
	call _long_fgets_pfd_tchar.size_t
	mov rbx, rax
	mov sil, 1
	lea rbx, [rbp-55]
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
	mov rbx, rax
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
.L0x28f:
	mov rbx, rax
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
	jmp .L0x29c
.L0x29b:
	inc rdi
.L0x29c:
	mov rbx, rdi
	cmp byte[rbx], 32
	je .L0x29b
.L0x29d:
	mov rbx, rdi
	mov bl, byte[rbx]
	mov byte[rbp-8], bl
	mov dword[rbp-16], 0
	mov byte[rbp-24], 0
	cmp byte[rbp-8], 45
	sete bl
	and bl, sil
	jz .L0x29e
	mov byte[rbp-24], 1
	inc rdi
	mov rbx, rdi
	mov bl, byte[rbx]
	mov byte[rbp-8], bl
	jmp .L0x29f
.L0x29e:
.L0x29f:
	jmp .L0x2a1
.L0x2a0:
	mov ebx, 10
	mov eax, dword[rbp-16]
	imul eax, ebx
	mov bl, byte[rbp-8]
	sub bl, 48
	mov ecx, eax
	add ecx, r10d
	mov dword[rbp-16], ecx
	inc rdi
	mov rbx, rdi
	mov bl, byte[rbx]
	mov byte[rbp-8], bl
.L0x2a1:
	mov bl, byte[rbp-8]
	test bl, bl
	setnz bl
	cmp byte[rbp-8], 10
	setne cl
	and bl, cl
	cmp byte[rbp-8], 32
	setne cl
	and bl, cl
	jnz .L0x2a0
.L0x2a2:
	mov al, byte[rbp-24]
	test al, al
	jz .L0x2a3
	mov ecx, dword[rbp-16]
	mov rbx, 0
	movsxd r10, ecx
	sub rbx, r10
	mov eax, ebx
	jmp ___int_toInteger_pchar.bool__return
	jmp .L0x2a4
.L0x2a3:
.L0x2a4:
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
	jz .L0x2a5
	mov rdi, 1000
	call _mallocptr._mapalloc_psize_t
	mov rbx, rax
	mov qword[rbp-40], rbx
	mov rdx, 1000
	mov rbx, qword[rbp-40]
	mov rsi, rbx
	mov rbx, qword[rbp-24]
	mov rdi, rbx
	call _long_fgets_pfd_tchar.size_t
	mov rbx, rax
	jmp .L0x2a6
.L0x2a5:
	mov rbx, qword[rbp-24]
	mov rdi, rbx
	call _void._floads_pfd_t
	mov rbx, rax
	mov qword[rbp-40], rbx
.L0x2a6:
	mov rbx, qword[rbp-16]
	mov rdx, rbx
	mov rbx, qword[rbp-40]
	mov rsi, rbx
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _int___SSCANF_pchar.char.void..
	mov rbx, rax
	mov dword[rbp-48], ebx
	mov rdi, qword[rbp-40]
	call _void_mapfree_pvoid.
	mov rbx, rax
	mov ebx, dword[rbp-48]
	mov eax, ebx
___int___scanf_pchar.void..fd_tbool__return:
	leave
	ret
scanf:
	push rbp
	mov rbp, rsp
	sub rsp, 96
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push rbx
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	mov [rbp-24], rdx
	mov [rbp-32], rcx
	mov [rbp-40], r8
	mov [rbp-48], r9
	lea rbx, [rbp-88] 
	mov r10, qword[rbp-16]
	mov [rbx], r10
	lea rbx, [rbp-80]
	mov r10, qword[rbp-24]
	mov [rbx], r10
	lea rbx, [rbp-72]
	mov r10, qword[rbp-32]
	mov [rbx], r10
	lea rbx, [rbp-64]
	mov r10, qword[rbp-40]
	mov [rbx], r10
	lea rbx, [rbp-56]
	mov r10, qword[rbp-48]
	mov [rbx], r10
	mov cl, 1
	mov rdx, 0
	lea rbx, [rbp-88]
	mov rsi, rbx
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _int___scanf_pchar.void..fd_tbool
	pop rbx
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
__scanf__return:
	leave
	ret
fscanf:
	push rbp
	mov rbp, rsp
	sub rsp, 88
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push rbx
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	mov [rbp-24], rdx
	mov [rbp-32], rcx
	mov [rbp-40], r8
	mov [rbp-48], r9
	lea rbx, [rbp-80] 
	mov r10, qword[rbp-24]
	mov [rbx], r10
	lea rbx, [rbp-72]
	mov r10, qword[rbp-32]
	mov [rbx], r10
	lea rbx, [rbp-64]
	mov r10, qword[rbp-40]
	mov [rbx], r10
	lea rbx, [rbp-56]
	mov r10, qword[rbp-48]
	mov [rbx], r10
	mov cl, 0
	mov rbx, qword[rbp-8]
	mov rdx, rbx
	lea rbx, [rbp-80]
	mov rsi, rbx
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	call _int___scanf_pchar.void..fd_tbool
	pop rbx
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
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
	mov rbx, rax
.L0x2aa:
	mov rbx, rax
	mov qword[rbp-16], rbx
	mov rbx, qword[rbp-16]
	test rbx, rbx
	jnz .L0x2ab
	mov cl, 2
	mov rbx, __systemcallargvconst
	movsx eax, cl
	cdqe
	lea rcx, [rbx+rax*8]
	mov r10, qword[rbp-8]
	mov [rcx], r10
	mov rdx, __emptyenv
	mov rsi, __systemcallargvconst
	mov rbx, qword[__systembashpath]
	mov rdi, rbx
	mov rax, 59
	mov r10, rcx
	syscall
	mov rbx, rax
.L0x2b0:
	mov rbx, rax
	mov qword[rbp-24], rbx
	mov rdi, qword[rbp-24]
	call _char._strerror_pvoid
	mov rdi, rax
	call _size_t_puts_pchar.
.L0x2b2:
	mov rbx, rax
	jmp .L0x2ac
.L0x2ab:
.L0x2ac:
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
	mov rbx, rax
.L0x2b9:
	pop rsi
.L0x2b5:
	mov rbx, rax
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
	jz .L0x2c0__end
	mov eax, [rdi]
	mov [rsi], eax
.L0x2c0__end:
.L0x2bf:
	mov rbx, rax
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
	mov rcx, rax
	mov dword[rbp-16], ecx
	mov ebx, dword[rbp-16]
	test ebx, ebx
	jz .L0x2c1
	jmp .L0x2c4
.L0x2c3:
	mov edx, 2
	mov esi, 1
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _void_mutex_cmpxchg_pmutex.intint
	mov rbx, rax
	cmp dword[rbp-16], 2
	sete bl
	or cl, bl
	jz .L0x2c6
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
	mov rbx, rax
.L0x2cd:
	pop rsi
.L0x2c9:
	mov rbx, rax
	jmp .L0x2c7
.L0x2c6:
.L0x2c7:
	mov edx, 2
	mov esi, 0
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _void_mutex_cmpxchg_pmutex.intint
	mov rcx, rax
	mov dword[rbp-16], ecx
	mov ebx, dword[rbp-16]
	test ebx, ebx
	jnz .L0x2cf
	mov rdi, __LC.S177
	call _size_t_puts_pchar.
.L0x2d2:
	mov rbx, rax
	jmp .L0x2c5
	jmp .L0x2d0
.L0x2cf:
.L0x2d0:
.L0x2c4:
	jmp .L0x2c3
.L0x2c5:
	jmp .L0x2c2
.L0x2c1:
.L0x2c2:
	xor rax, rax
___void_mlock_pmutex.__return:
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
.L0x2d8:
	mov rbx, rax
	cmp ebx, 1
	je .L0x2da
	xor esi, esi
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	lock xchg dword[rdi], esi
.L0x2e0:
	mov rbx, rax
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
	mov rbx, rax
.L0x2e7:
	pop rsi
.L0x2e3:
	mov rbx, rax
	jmp .L0x2db
.L0x2da:
.L0x2db:
	xor rax, rax
___void_munlock_pmutex.__return:
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
	pop rbx
.L0x2ed:
	push rax
	pop rbx
___void___thrdext_plong__return:
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
	jnz .L0x2ef__end
	mov rdi, r15
	mov rsi, r14
	mov rdx, r13
	call _long___enterthread_p__threadcallablethread_t.void.
	mov rdi, rax
	call _void___thrdext_plong
.L0x2ef__end:
___long_thrdcrt_pvoid.thread_t.void.__return:
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
	mov rbx, rax
.L0x2f3:
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
	mov rbx, rax
	mov qword[rbp-32], rbx
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	call _void_munlock_pmutex.
	mov rbx, rax
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
	mov rbx, rax
	mov rbx, qword[rbp-24]
	mov rdx, rbx
	mov rbx, qword[rbp-8]
	mov rsi, rbx
	mov rdi, qword[rbp-16]
	call _long_thrdcrt_pvoid.thread_t.void.
	mov rbx, rax
	mov rcx, qword[rbp-8]
	mov [rcx+12], rbx
	mov rbx, qword[rbp-8]
	lea rbx, [rbx+4]
	mov r10, qword[rbp-16]
	mov [rbx], r10
	xor rax, rax
___void_thread_create_pthread_t.__threadcallablevoid.__return:
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
	mov rbx, rax
	xor rax, rax
___void_thread_join_pthread_t.__return:
	leave
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
	mov rdi, __LC.S178
	call _size_t_puts_pchar.
	mov rbx, rax
	mov qword[rbp-48], 0
	jmp .L0x2f5
.L0x2f4:
	mov rsi, qword[rbp-48]
	lea rdi, [rbp-32]
	mov rbx, qword[rdi+0]
	mov ecx, [rbx+rsi*4]
	mov eax, ecx
.L0x37:
	mov rsi, rax
	mov rdi, __LC.S179
	mov al, 0
	enter 0, 0
	and rsp, -16
	call printf
	leave
	mov rbx, rax
.L0x2f6:
	add qword[rbp-48], 1
.L0x2f5:
	mov rbx, qword[rbp-40]
	dec rbx
	cmp qword[rbp-48], rbx
	jl .L0x2f4
.L0x2f7:
	mov rbx, qword[rbp-40]
	dec rbx
	mov rsi, rbx
	lea rdi, [rbp-32]
	call _int_at_pvectorint.size_t
	mov rsi, rax
	mov rdi, __LC.S180
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
	je .L0x2f8
	mov rdx, qword[rbp-24]
	mov rsi, qword[rbp-8]
	mov rdi, __LC.S181
	mov al, 0
	enter 0, 0
	and rsp, -16
	call printf
	leave
	mov rbx, rax
	jmp .L0x2f9
.L0x2f8:
.L0x2f9:
	xor rax, rax
___void_check_plong__return:
	leave
	ret
_void_testdivision_p:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov qword[rbp-8], -256
	jmp .L0x2fb
.L0x2fa:
	mov rax, qword[rbp-8]
	test rax, rax
	jz .L0x2fe
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _void_check_plong
	mov rbx, rax
	jmp .L0x2ff
.L0x2fe:
	jmp .L0x2fd
.L0x2ff:
.L0x2fc:
	add qword[rbp-8], 1
.L0x2fb:
	mov rcx, 9223372036854775807
	cmp qword[rbp-8], rcx
	jl .L0x2fa
.L0x2fd:
	xor rax, rax
___void_testdivision_p__return:
	leave
	ret
main:
	push rbp
	mov rbp, rsp
	sub rsp, 48
	lea rdi, [rbp-32]
	call _void__Cvector_pvector.
	mov qword[rbp-40], 0
	jmp .L0x301
.L0x300:
	mov rbx, qword[rbp-40]
	mov r10, rbx
	mov esi, r10d
	lea rdi, [rbp-32]
	call _void_push_back_pvectorint.int
	mov rbx, rax
.L0x302:
	add qword[rbp-40], 1
.L0x301:
	cmp qword[rbp-40], 100
	jl .L0x300
.L0x303:
	movq xmm0, [rbp-16]
	xor rax, rax
	mov rax, [rbp-8]
	movq xmm7, rax
	movlhps xmm0, xmm7
	vinsertf128 ymm0, ymm0, xmm0, 1
	movdqu xmm0, [rbp-32]
	call _void_printvec_pvectorint
	mov rbx, rax
	mov si, 5501
	mov rdi, __LC.S183
	call _void_nc_pchar.short
	mov rbx, rax
	xor eax, eax
__main__return:
	push rax
	lea rdi, [rbp-32]
	call _void__Dvector_pvector.
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
	jz .L0x304
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
.L0x309:
	mov rbx, rax
	jmp .L0x305
.L0x304:
.L0x305:
	mov rdi, 1024
	call _mallocptr._mapalloc_psize_t
	mov rbx, rax
	mov qword[rbp-48], rbx
	mov qword[rbp-56], 0
	jmp .L0x30b
.L0x30a:
	jmp .L0x30e
.L0x30d:
	mov rdx, 1024
	mov rbx, qword[rbp-48]
	mov rsi, rbx
	lea rdi, [rbp-32]
	call _ssize_t_recv_pSocket.char.size_t
	mov rbx, rax
	mov qword[rbp-56], rbx
.L0x30e:
	mov rbx, qword[rbp-56]
	test rbx, rbx
	jz .L0x30d
.L0x30f:
	xor rcx, rcx
	cmp qword[rbp-56], rcx
	jge .L0x310
	mov rdi, __LC.S184
	call _size_t_puts_pchar.
	mov rbx, rax
	mov rax, -1
	jmp ___void_nc_pchar.short__return
	jmp .L0x311
.L0x310:
.L0x311:
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
.L0x30b:
	jmp .L0x30a
.L0x30c:
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
	jmp .L0x313
.L0x312:
	mov r8, 1056964608
	mov rcx, __LC.S186
	mov rdx, 123
	mov rsi, __LC.S185
	lea rbx, [rbp-1007]
	mov rdi, rbx
	mov al, 0
	enter 0, 0
	and rsp, -16
	call sprintf
	leave
	mov rbx, rax
.L0x314:
	add qword[rbp-1015], 1
.L0x313:
	cmp qword[rbp-1015], 250
	jl .L0x312
.L0x315:
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
	