
global _char._get_errstr_pint:
global _bool_cpuid_getfeature_pulong:
global _bool_cpuid_getextended_pulong:
global _void._munmap_pvoid.size_t:
global _void._qmmap_psize_t:
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
global _long_log2_pdouble:
global _double_fmod_pdoubledouble:
global _long_divmod_plonglonglong.:
global _long_divmods_plonglonglong.:
global _double_sin_pdouble:
global _double_cos_pdouble:
global _double_tan_pdouble:
global _double_cot_pdouble:
global _double_sec_pdouble:
global _double_csc_pdouble:
global _double_taylor_asin_pdouble:
global _double_asin_pdouble:
global _double_acos_pdouble:
global _double_atan_pdouble:
global _int___sprintf_pchar.char.void.:
global _int_sprintf_pchar.char.voidvoidvoidvoid:
global _void___printf_pchar.void.fd_t:
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
global _long_execl_pchar.char..:
global _long_system_pchar.:
global _void___assert_pboolchar.intchar.:
global _void_free_pvoid.:
global _void._malloc_psize_t:
global _void._realloc_pvoid.size_t:
global _void._calloc_psize_t:
global _void_memcpy_pvoid.void.size_t:
global _void_avx_memcpy_pvoid.void.size_t:
global _void_avx_memzer_pvoid.size_t:
global _void_memset_pvoid.ucharsize_t:
global _void_memzer_pvoid.size_t:
global _void_usleep_plong:
global _clock_t_clock_p:
global _tm._gmtime_ptime_t:
global _char._asctime_ptm.:
	extern timezone
	extern daylight
	extern tzname
	extern tzset
global _tm._localtime_ptime_t:
global _char._ctime_ptime_t:
global _int___SSCANF_pchar.char.void..:
	global sscanf
	extern sscanf
	extern sscanf
	extern sscanf
	extern sscanf
	global __scanf
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
global _void_mutex_cmpxchg_pmutex.intint:
global _void_mlock_pmutex.:
global _void_munlock_pmutex.:
	global __thrdext
global _long_thrdcrt_pvoid.thread_t.void.:
	global __crtstack
	global __enterthread
global _void_thread_create_pthread_t.__threadcallablevoid.:
global _void_thread_join_pthread_t.:
	section .data
	align 8
STRING_CONSTANT_0: db `Success`, 0
STRING_CONSTANT_1: db `Operation not permitted`, 0
STRING_CONSTANT_2: db `No such file or directory`, 0
STRING_CONSTANT_3: db `No such process`, 0
STRING_CONSTANT_4: db `Interrupted system call`, 0
STRING_CONSTANT_5: db `I/O error`, 0
STRING_CONSTANT_6: db `No such device or address`, 0
STRING_CONSTANT_7: db `Argument list too long`, 0
STRING_CONSTANT_8: db `Exec format error`, 0
STRING_CONSTANT_9: db `Bad file number`, 0
STRING_CONSTANT_10: db `No child processes`, 0
STRING_CONSTANT_11: db `Try again`, 0
STRING_CONSTANT_12: db `Out of memory`, 0
STRING_CONSTANT_13: db `Permission denied`, 0
STRING_CONSTANT_14: db `Bad address`, 0
STRING_CONSTANT_15: db `Block device required`, 0
STRING_CONSTANT_16: db `Device or resource busy`, 0
STRING_CONSTANT_17: db `File exists`, 0
STRING_CONSTANT_18: db `Cross-device link`, 0
STRING_CONSTANT_19: db `No such device`, 0
STRING_CONSTANT_20: db `Not a directory`, 0
STRING_CONSTANT_21: db `Is a directory`, 0
STRING_CONSTANT_22: db `Invalid argument`, 0
STRING_CONSTANT_23: db `File table overflow`, 0
STRING_CONSTANT_24: db `Too many open files`, 0
STRING_CONSTANT_25: db `Not a typewriter`, 0
STRING_CONSTANT_26: db `Text file busy`, 0
STRING_CONSTANT_27: db `File too large`, 0
STRING_CONSTANT_28: db `No space left on device`, 0
STRING_CONSTANT_29: db `Illegal seek`, 0
STRING_CONSTANT_30: db `Read-only file system`, 0
STRING_CONSTANT_31: db `Too many links`, 0
STRING_CONSTANT_32: db `Broken pipe`, 0
STRING_CONSTANT_33: db `Math argument out of domain of func`, 0
STRING_CONSTANT_34: db `Math result not representable`, 0
STRING_CONSTANT_35: db `Resource deadlock would occur`, 0
STRING_CONSTANT_36: db `File name too long`, 0
STRING_CONSTANT_37: db `No record locks available`, 0
STRING_CONSTANT_38: db `Function not implemented`, 0
STRING_CONSTANT_39: db `Directory not empty`, 0
STRING_CONSTANT_40: db `Too many symbolic links encountered`, 0
STRING_CONSTANT_41: db `Operation would block`, 0
STRING_CONSTANT_42: db `No message of desired type`, 0
STRING_CONSTANT_43: db `Identifier removed`, 0
STRING_CONSTANT_44: db `Channel number out of range`, 0
STRING_CONSTANT_45: db `Level 2 not synchronized`, 0
STRING_CONSTANT_46: db `Level 3 halted`, 0
STRING_CONSTANT_47: db `Level 3 reset`, 0
STRING_CONSTANT_48: db `Link number out of range`, 0
STRING_CONSTANT_49: db `Protocol driver not attached`, 0
STRING_CONSTANT_50: db `No CSI structure available`, 0
STRING_CONSTANT_51: db `Level 2 halted`, 0
STRING_CONSTANT_52: db `Invalid exchange`, 0
STRING_CONSTANT_53: db `Invalid request descriptor`, 0
STRING_CONSTANT_54: db `Exchange full`, 0
STRING_CONSTANT_55: db `No anode`, 0
STRING_CONSTANT_56: db `Invalid request code`, 0
STRING_CONSTANT_57: db `Invalid slot`, 0
STRING_CONSTANT_58: db `EDEADLK`, 0
STRING_CONSTANT_59: db `Bad font file format`, 0
STRING_CONSTANT_60: db `Device not a stream`, 0
STRING_CONSTANT_61: db `No data available`, 0
STRING_CONSTANT_62: db `Timer expired`, 0
STRING_CONSTANT_63: db `Out of streams resources`, 0
STRING_CONSTANT_64: db `Machine is not on the network`, 0
STRING_CONSTANT_65: db `Package not installed`, 0
STRING_CONSTANT_66: db `Object is remote`, 0
STRING_CONSTANT_67: db `Link has been severed`, 0
STRING_CONSTANT_68: db `Advertise error`, 0
STRING_CONSTANT_69: db `Srmount error`, 0
STRING_CONSTANT_70: db `Communication error on send`, 0
STRING_CONSTANT_71: db `Protocol error`, 0
STRING_CONSTANT_72: db `Multihop attempted`, 0
STRING_CONSTANT_73: db `RFS specific error`, 0
STRING_CONSTANT_74: db `Not a data message`, 0
STRING_CONSTANT_75: db `Value too large for defined data type`, 0
STRING_CONSTANT_76: db `Name not unique on network`, 0
STRING_CONSTANT_77: db `File descriptor in bad state`, 0
STRING_CONSTANT_78: db `Remote address changed`, 0
STRING_CONSTANT_79: db `Can not access a needed shared library`, 0
STRING_CONSTANT_80: db `Accessing a corrupted shared library`, 0
STRING_CONSTANT_81: db `.lib section in a.out corrupted`, 0
STRING_CONSTANT_82: db `Attempting to link in too many shared libraries`, 0
STRING_CONSTANT_83: db `Cannot exec a shared library directly`, 0
STRING_CONSTANT_84: db `Illegal byte sequence`, 0
STRING_CONSTANT_85: db `Interrupted system call should be restarted`, 0
STRING_CONSTANT_86: db `Streams pipe error`, 0
STRING_CONSTANT_87: db `Too many users`, 0
STRING_CONSTANT_88: db `Socket operation on non-socket`, 0
STRING_CONSTANT_89: db `Destination address required`, 0
STRING_CONSTANT_90: db `Message too long`, 0
STRING_CONSTANT_91: db `Protocol wrong type for socket`, 0
STRING_CONSTANT_92: db `Protocol not available`, 0
STRING_CONSTANT_93: db `Protocol not supported`, 0
STRING_CONSTANT_94: db `Socket type not supported`, 0
STRING_CONSTANT_95: db `Operation not supported on transport endpoint`, 0
STRING_CONSTANT_96: db `Protocol family not supported`, 0
STRING_CONSTANT_97: db `Address family not supported by protocol`, 0
STRING_CONSTANT_98: db `Address already in use`, 0
STRING_CONSTANT_99: db `Cannot assign requested address`, 0
STRING_CONSTANT_100: db `Network is down`, 0
STRING_CONSTANT_101: db `Network is unreachable`, 0
STRING_CONSTANT_102: db `Network dropped connection because of reset`, 0
STRING_CONSTANT_103: db `Software caused connection abort`, 0
STRING_CONSTANT_104: db `Connection reset by peer`, 0
STRING_CONSTANT_105: db `No buffer space available`, 0
STRING_CONSTANT_106: db `Transport endpoint is already connected`, 0
STRING_CONSTANT_107: db `Transport endpoint is not connected`, 0
STRING_CONSTANT_108: db `Cannot send after transport endpoint shutdown`, 0
STRING_CONSTANT_109: db `Too many references: cannot splice`, 0
STRING_CONSTANT_110: db `Connection timed out`, 0
STRING_CONSTANT_111: db `Connection refused`, 0
STRING_CONSTANT_112: db `Host is down`, 0
STRING_CONSTANT_113: db `No route to host`, 0
STRING_CONSTANT_114: db `Operation already in progress`, 0
STRING_CONSTANT_115: db `Operation now in progress`, 0
STRING_CONSTANT_116: db `Stale NFS file handle`, 0
STRING_CONSTANT_117: db `Structure needs cleaning`, 0
STRING_CONSTANT_118: db `Not a XENIX named type file`, 0
STRING_CONSTANT_119: db `No XENIX semaphores available`, 0
STRING_CONSTANT_120: db `Is a named type file`, 0
STRING_CONSTANT_121: db `Remote I/O error`, 0
STRING_CONSTANT_122: db `Quota exceeded`, 0
STRING_CONSTANT_123: db `No medium found`, 0
STRING_CONSTANT_124: db `Wrong medium type`, 0
STRING_CONSTANT_125: db `Operation Canceled`, 0
STRING_CONSTANT_126: db `Required key not available`, 0
STRING_CONSTANT_127: db `Key has expired`, 0
STRING_CONSTANT_128: db `Key has been revoked`, 0
STRING_CONSTANT_129: db `Key was rejected by service`, 0
STRING_CONSTANT_130: db `Owner died`, 0
STRING_CONSTANT_131: db `State not recoverable`, 0
STRING_CONSTANT_132: db `Unkown Error Code.`, 0
FLT_CONSTANT_0: dq 0x0.0p+0
FLT_CONSTANT_1: dq 0x1.0000000000000p-1
FLT_CONSTANT_2: dq 0x1.921fb54442d18p+1
FLT_CONSTANT_3: dq 0x1.921fb54442d18p+0
FLT_CONSTANT_4: dq 0x1.0000000000000p+0
FLT_CONSTANT_5: dq 0x1.0000000000000p+0
FLT_CONSTANT_6: dq 0x1.0000000000000p+0
FLT_CONSTANT_7: dq 0x1.0000000000000p-1
FLT_CONSTANT_8: dq 0x1.8000000000000p+1
FLT_CONSTANT_9: dq 0x1.8000000000000p-2
FLT_CONSTANT_10: dq 0x1.4000000000000p+2
FLT_CONSTANT_11: dq 0x1.4000000000000p-2
FLT_CONSTANT_12: dq 0x1.c000000000000p+2
FLT_CONSTANT_13: dq 0x1.1800000000000p-2
FLT_CONSTANT_14: dq 0x1.2000000000000p+3
FLT_CONSTANT_15: dq 0x1.921fb54442d18p-1
FLT_CONSTANT_16: dq 0x1.8000000000000p+1
FLT_CONSTANT_17: dq 0x1.4000000000000p+2
FLT_CONSTANT_18: dq 0x1.c000000000000p+2
FLT_CONSTANT_19: dq 0x1.2000000000000p+3
FLT_CONSTANT_20: dq 0x1.0000000000000p+0
FLT_CONSTANT_21: dq 0x1.8000000000000p+1
FLT_CONSTANT_22: dq 0x1.0000000000000p+0
FLT_CONSTANT_23: dq 0x1.4000000000000p+2
FLT_CONSTANT_24: dq 0x1.0000000000000p+0
FLT_CONSTANT_25: dq 0x1.8000000000000p+1
FLT_CONSTANT_26: dq 0x1.0000000000000p+0
FLT_CONSTANT_27: dq 0x1.4000000000000p+2
STRING_CONSTANT_133: db `0123456789abcdef`, 0
STRING_CONSTANT_134: db `QNaN`, 0
STRING_CONSTANT_135: db `SNaN`, 0
STRING_CONSTANT_136: db `NaN`, 0
STRING_CONSTANT_137: db `Inf`, 0
STRING_CONSTANT_138: db `-Inf`, 0
STRING_CONSTANT_139: db `False`, 0
STRING_CONSTANT_140: db `True`, 0
STRING_CONSTANT_141: db `/bin/bash`, 0
STRING_CONSTANT_142: db `PATH=/bin:/usr/bin:/sbin:/usr/sbin`, 0
STRING_CONSTANT_143: db `sudo`, 0
STRING_CONSTANT_144: db `-c`, 0
STRING_CONSTANT_145: db `%s:%i: Assertion '%s' failed.\n`, 0
STRING_CONSTANT_146: db `=======================\n`, 0
STRING_CONSTANT_147: db `EMPTY\n`, 0
STRING_CONSTANT_148: db `BLOCK: %i @ %x : %i\n`, 0
STRING_CONSTANT_149: db `Appends: %i, Deletions %i, Cache: %u\n`, 0
STRING_CONSTANT_150: db `=======================\n`, 0
FLT_CONSTANT_28: dq 0x1.6d40000000000p+8
FLT_CONSTANT_29: dq 0x1.6d40000000000p+8
STRING_CONSTANT_151: db `Sun`, 0
STRING_CONSTANT_152: db `Mon`, 0
STRING_CONSTANT_153: db `Tue`, 0
STRING_CONSTANT_154: db `Wed`, 0
STRING_CONSTANT_155: db `Thu`, 0
STRING_CONSTANT_156: db `Fri`, 0
STRING_CONSTANT_157: db `Sat`, 0
STRING_CONSTANT_158: db `Jan`, 0
STRING_CONSTANT_159: db `Feb`, 0
STRING_CONSTANT_160: db `Mar`, 0
STRING_CONSTANT_161: db `Apr`, 0
STRING_CONSTANT_162: db `May`, 0
STRING_CONSTANT_163: db `Jun`, 0
STRING_CONSTANT_164: db `Jul`, 0
STRING_CONSTANT_165: db `Aug`, 0
STRING_CONSTANT_166: db `Sep`, 0
STRING_CONSTANT_167: db `Oct`, 0
STRING_CONSTANT_168: db `Nov`, 0
STRING_CONSTANT_169: db `Dec`, 0
STRING_CONSTANT_170: db `%i `, 0
STRING_CONSTANT_171: db `%i:%i:%i %i`, 0
STRING_CONSTANT_172: db `%i.%i.%i.%i`, 0
STRING_CONSTANT_173: db `LOCKED`, 0
STRING_CONSTANT_174: db `unlocked thread: %i\n`, 0
__linux_errstrlist: DQ STRING_CONSTANT_0, STRING_CONSTANT_1, STRING_CONSTANT_2, STRING_CONSTANT_3, STRING_CONSTANT_4, STRING_CONSTANT_5, STRING_CONSTANT_6, STRING_CONSTANT_7, STRING_CONSTANT_8, STRING_CONSTANT_9, STRING_CONSTANT_10, STRING_CONSTANT_11, STRING_CONSTANT_12, STRING_CONSTANT_13, STRING_CONSTANT_14, STRING_CONSTANT_15, STRING_CONSTANT_16, STRING_CONSTANT_17, STRING_CONSTANT_18, STRING_CONSTANT_19, STRING_CONSTANT_20, STRING_CONSTANT_21, STRING_CONSTANT_22, STRING_CONSTANT_23, STRING_CONSTANT_24, STRING_CONSTANT_25, STRING_CONSTANT_26, STRING_CONSTANT_27, STRING_CONSTANT_28, STRING_CONSTANT_29, STRING_CONSTANT_30, STRING_CONSTANT_31, STRING_CONSTANT_32, STRING_CONSTANT_33, STRING_CONSTANT_34, STRING_CONSTANT_35, STRING_CONSTANT_36, STRING_CONSTANT_37, STRING_CONSTANT_38, STRING_CONSTANT_39, STRING_CONSTANT_40, STRING_CONSTANT_41, STRING_CONSTANT_42, STRING_CONSTANT_43, STRING_CONSTANT_44, STRING_CONSTANT_45, STRING_CONSTANT_46, STRING_CONSTANT_47, STRING_CONSTANT_48, STRING_CONSTANT_49, STRING_CONSTANT_50, STRING_CONSTANT_51, STRING_CONSTANT_52, STRING_CONSTANT_53, STRING_CONSTANT_54, STRING_CONSTANT_55, STRING_CONSTANT_56, STRING_CONSTANT_57, STRING_CONSTANT_58, STRING_CONSTANT_59, STRING_CONSTANT_60, STRING_CONSTANT_61, STRING_CONSTANT_62, STRING_CONSTANT_63, STRING_CONSTANT_64, STRING_CONSTANT_65, STRING_CONSTANT_66, STRING_CONSTANT_67, STRING_CONSTANT_68, STRING_CONSTANT_69, STRING_CONSTANT_70, STRING_CONSTANT_71, STRING_CONSTANT_72, STRING_CONSTANT_73, STRING_CONSTANT_74, STRING_CONSTANT_75, STRING_CONSTANT_76, STRING_CONSTANT_77, STRING_CONSTANT_78, STRING_CONSTANT_79, STRING_CONSTANT_80, STRING_CONSTANT_81, STRING_CONSTANT_82, STRING_CONSTANT_83, STRING_CONSTANT_84, STRING_CONSTANT_85, STRING_CONSTANT_86, STRING_CONSTANT_87, STRING_CONSTANT_88, STRING_CONSTANT_89, STRING_CONSTANT_90, STRING_CONSTANT_91, STRING_CONSTANT_92, STRING_CONSTANT_93, STRING_CONSTANT_94, STRING_CONSTANT_95, STRING_CONSTANT_96, STRING_CONSTANT_97, STRING_CONSTANT_98, STRING_CONSTANT_99, STRING_CONSTANT_100, STRING_CONSTANT_101, STRING_CONSTANT_102, STRING_CONSTANT_103, STRING_CONSTANT_104, STRING_CONSTANT_105, STRING_CONSTANT_106, STRING_CONSTANT_107, STRING_CONSTANT_108, STRING_CONSTANT_109, STRING_CONSTANT_110, STRING_CONSTANT_111, STRING_CONSTANT_112, STRING_CONSTANT_113, STRING_CONSTANT_114, STRING_CONSTANT_115, STRING_CONSTANT_116, STRING_CONSTANT_117, STRING_CONSTANT_118, STRING_CONSTANT_119, STRING_CONSTANT_120, STRING_CONSTANT_121, STRING_CONSTANT_122, STRING_CONSTANT_123, STRING_CONSTANT_124, STRING_CONSTANT_125, STRING_CONSTANT_126, STRING_CONSTANT_127, STRING_CONSTANT_128, STRING_CONSTANT_129, STRING_CONSTANT_130, STRING_CONSTANT_131
errno: DD 0
nullterm: DB 0
M_MINZERO_MEM: DQ 0x0.0p+0
__numbercharactersbase1016: DQ "0123456789abcdef"
__systembashpath: DQ "/bin/bash"
__emptyenv: DQ STRING_CONSTANT_142, 0, 0
__systemcallargvconst: DQ STRING_CONSTANT_143, STRING_CONSTANT_144, 0, 0
malloc_maxcache: DQ 524288
free_head: DQ 0
cached_size: DQ 0
appends: DQ 0
deletions: DQ 0
rand_next: DD 1
mdays: DD 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31
wday_name: DQ STRING_CONSTANT_151, STRING_CONSTANT_152, STRING_CONSTANT_153, STRING_CONSTANT_154, STRING_CONSTANT_155, STRING_CONSTANT_156, STRING_CONSTANT_157
mon_name: DQ STRING_CONSTANT_158, STRING_CONSTANT_159, STRING_CONSTANT_160, STRING_CONSTANT_161, STRING_CONSTANT_162, STRING_CONSTANT_163, STRING_CONSTANT_164, STRING_CONSTANT_165, STRING_CONSTANT_166, STRING_CONSTANT_167, STRING_CONSTANT_168, STRING_CONSTANT_169
asctime__result_buf: DB 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 0
clone_threadflags: DQ 4001553
	section .bss
	align 16
__tmbuf: resb 36
__internaltime: resb 8
__heap.padding__: resz 1
	section .text
	align 8
	global main
_char._get_errstr_pint:
	push rbp
	mov rbp, rsp
	sub rsp, 8
	cmp edi, 131
	setl bl
	xor r11d, r11d
	cmp edi, r11d
	setge r10b
	and bl, r10b
	jz .L0x214
	mov r10d, edi
	mov rbx, __linux_errstrlist
	and r10, 0x7fffffff
	mov rbx, [rbx+r10*8]
	mov rax, rbx
	jmp ___char._get_errstr_pint__return
.L0x214:
.L0x215:
	mov rax, STRING_CONSTANT_132
	jmp ___char._get_errstr_pint__return
___char._get_errstr_pint__return:
	leave
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
.L0x20e:
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
	jmp ___bool_cpuid_getfeature_pulong__return
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
.L0x209:
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
	jmp ___bool_cpuid_getextended_pulong__return
___bool_cpuid_getextended_pulong__return:
	leave
	ret
_void._munmap_pvoid.size_t:
	push rbp
	mov rbp, rsp
	sub rsp, 8
	mov rax, 11
	syscall
___void._munmap_pvoid.size_t__return:
	leave
	ret
_void._qmmap_psize_t:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov [rbp-8], rdi
	mov r9, 0
	mov r8, 0
	mov rcx, 34
	mov rdx, 3
	mov rbx, qword[rbp-8]
	mov rsi, rbx
	mov rdi, 0
	mov rax, 9
	mov r10, rcx
	syscall
.L0x204:
	jmp ___void._qmmap_psize_t__return
___void._qmmap_psize_t__return:
	leave
	ret
_bool_all_of_raw_piterablesize_tsize_tvoid.:
	push rbp
	mov rbp, rsp
	sub rsp, 40
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
	mov r10, qword[rbp-8]
	mov qword[rbp-40], r10
	jmp .L0x1fe
.L0x1fd:
	push rbx
	mov r10, qword[rbp-40]
	mov r11, qword[r10]
	mov rdi, r11
	call qword[rbp-32]
	mov r10, rax
	pop rbx
	cmp rax, 0
	jne .L0x201
	xor rax, rax
	jmp ___bool_all_of_raw_piterablesize_tsize_tvoid.__return
.L0x201:
.L0x202:
.L0x1ff:
	mov r11, qword[rbp-16]
	add qword[rbp-40], r11
.L0x1fe:
	cmp qword[rbp-40], rbx
	jl .L0x1fd
.L0x200:
	mov rax, 1
	jmp ___bool_all_of_raw_piterablesize_tsize_tvoid.__return
___bool_all_of_raw_piterablesize_tsize_tvoid.__return:
	leave
	ret
_bool_any_of_raw_piterablesize_tsize_tvoid.:
	push rbp
	mov rbp, rsp
	sub rsp, 40
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
	mov r10, qword[rbp-8]
	mov qword[rbp-40], r10
	jmp .L0x1f8
.L0x1f7:
	push rbx
	mov r10, qword[rbp-40]
	mov r11, qword[r10]
	mov rdi, r11
	call qword[rbp-32]
	mov r10, rax
	pop rbx
	test r10, r10
	jz .L0x1fb
	mov rax, 1
	jmp ___bool_any_of_raw_piterablesize_tsize_tvoid.__return
.L0x1fb:
.L0x1fc:
.L0x1f9:
	mov r11, qword[rbp-16]
	add qword[rbp-40], r11
.L0x1f8:
	cmp qword[rbp-40], rbx
	jl .L0x1f7
.L0x1fa:
	xor rax, rax
	jmp ___bool_any_of_raw_piterablesize_tsize_tvoid.__return
___bool_any_of_raw_piterablesize_tsize_tvoid.__return:
	leave
	ret
_bool_none_of_raw_piterablesize_tsize_tvoid.:
	push rbp
	mov rbp, rsp
	sub rsp, 40
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
	mov r10, qword[rbp-8]
	mov qword[rbp-40], r10
	jmp .L0x1f2
.L0x1f1:
	push rbx
	mov r10, qword[rbp-40]
	mov r11, qword[r10]
	mov rdi, r11
	call qword[rbp-32]
	mov r10, rax
	pop rbx
	test r10, r10
	jz .L0x1f5
	xor rax, rax
	jmp ___bool_none_of_raw_piterablesize_tsize_tvoid.__return
.L0x1f5:
.L0x1f6:
.L0x1f3:
	mov r11, qword[rbp-16]
	add qword[rbp-40], r11
.L0x1f2:
	cmp qword[rbp-40], rbx
	jl .L0x1f1
.L0x1f4:
	mov rax, 1
	jmp ___bool_none_of_raw_piterablesize_tsize_tvoid.__return
___bool_none_of_raw_piterablesize_tsize_tvoid.__return:
	leave
	ret
_long_pow_plonglong:
	push rbp
	mov rbp, rsp
	sub rsp, 8
	mov rax, rdi
	dec rsi
	jz _int_pow_pintint_end
_int_pow_pintint_flp:
	mul rdi
	dec rsi
	jnz _int_pow_pintint_flp
_int_pow_pintint_end:
___long_pow_plonglong__return:
	leave
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
___double_pow_plonglong__return:
	leave
	ret
_double_pow_pdoublelong:
	push rbp
	mov rbp, rsp
	sub rsp, 8
	dec rdi
_double_pow_pdoubleint_flp:
	mulsd xmm0, xmm0
	dec rdi
	jnz _int_pow_pintint_flp
___double_pow_pdoublelong__return:
	leave
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
	jmp ___long_ceil_pdouble__return
___long_ceil_pdouble__return:
	leave
	ret
_long_floor_pdouble:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	movsd [rbp-8], xmm0
	movsd xmm8, qword[FLT_CONSTANT_1]
	movsd xmm7, qword[rbp-8]
	subsd xmm7, xmm8
	movsd xmm0, xmm7
	roundsd xmm0, xmm0, 0  
	cvttsd2si rax, xmm0
.L0x1ea:
	jmp ___long_floor_pdouble__return
___long_floor_pdouble__return:
	leave
	ret
_long_abs_plong:
	push rbp
	mov rbp, rsp
	sub rsp, 8
	mov rax, rdi
	sar rdi, 63
	xor rax, rdi
	sub rax, rdi
___long_abs_plong__return:
	leave
	ret
_double_abs_pdouble:
	push rbp
	mov rbp, rsp
	sub rsp, 8
	movq rax, xmm0
	shl rax, 1
	shr rax, 1
	movq xmm0, rax 
___double_abs_pdouble__return:
	leave
	ret
_long_log_plong:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov [rbp-8], rdi
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _long_log2_plong
	push rax
	mov r10, 3
	pop rbx
	xor rdx, rdx
	mov rax, rbx
	idiv r10
	jmp ___long_log_plong__return
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
	jmp ___long_log_plonglong__return
___long_log_plonglong__return:
	leave
	ret
_long_log2_plong:
	push rbp
	mov rbp, rsp
	sub rsp, 8
	xor rax, rax
.L0x1e4_long_lop2_plong_flp:
	sar rdi, 1
	inc rax
	test rdi, rdi
	jnz .L0x1e4_long_lop2_plong_flp
	dec rax
___long_log2_plong__return:
	leave
	ret
_long_log2_pdouble:
	push rbp
	mov rbp, rsp
	sub rsp, 8
	xor rax, rax
	mov rbx, 2
	cvtsi2sd xmm1, rbx
.L0x1e2_log2dbflp:
	divsd xmm0, xmm1
	inc rax
	comisd xmm0, xmm0
	jnz .L0x1e2_log2dbflp
	dec rax
___long_log2_pdouble__return:
	leave
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
	jmp ___double_fmod_pdoubledouble__return
___double_fmod_pdoubledouble__return:
	leave
	ret
_long_divmod_plonglonglong.:
	push rbp
	mov rbp, rsp
	sub rsp, 8
	mov rbx, rdx
	xor rdx, rdx
	mov rax, rdi
	div rsi
	mov [rbx], rdx
___long_divmod_plonglonglong.__return:
	leave
	ret
_long_divmods_plonglonglong.:
	push rbp
	mov rbp, rsp
	sub rsp, 8
	mov rbx, rdx
	xor rdx, rdx
	mov rax, rdi
	idiv rsi
	mov [rbx], rdx
___long_divmods_plonglonglong.__return:
	leave
	ret
_double_taylor_sin_pdouble:
	push rbp
	mov rbp, rsp
	sub rsp, 8
	movsd xmm8, xmm0
	movsd xmm7, xmm0
	mulsd xmm7, xmm8
	movsd xmm8, xmm0
	mulsd xmm7, xmm8
	mov rbx, 6
	cvtsi2sd xmm8, rbx
	divsd xmm7, xmm8
	movsd xmm8, xmm0
	subsd xmm8, xmm7
	movsd xmm9, xmm0
	movsd xmm7, xmm0
	mulsd xmm7, xmm9
	movsd xmm9, xmm0
	mulsd xmm7, xmm9
	movsd xmm9, xmm0
	mulsd xmm7, xmm9
	movsd xmm9, xmm0
	mulsd xmm7, xmm9
	mov rbx, 120
	cvtsi2sd xmm9, rbx
	divsd xmm7, xmm9
	addsd xmm8, xmm7
	movsd xmm9, xmm0
	movsd xmm7, xmm0
	mulsd xmm7, xmm9
	movsd xmm9, xmm0
	mulsd xmm7, xmm9
	movsd xmm9, xmm0
	mulsd xmm7, xmm9
	movsd xmm9, xmm0
	mulsd xmm7, xmm9
	movsd xmm9, xmm0
	mulsd xmm7, xmm9
	movsd xmm9, xmm0
	mulsd xmm7, xmm9
	mov rbx, 5040
	cvtsi2sd xmm9, rbx
	divsd xmm7, xmm9
	subsd xmm8, xmm7
	movsd xmm9, xmm0
	movsd xmm7, xmm0
	mulsd xmm7, xmm9
	movsd xmm9, xmm0
	mulsd xmm7, xmm9
	movsd xmm9, xmm0
	mulsd xmm7, xmm9
	movsd xmm9, xmm0
	mulsd xmm7, xmm9
	movsd xmm9, xmm0
	mulsd xmm7, xmm9
	movsd xmm9, xmm0
	mulsd xmm7, xmm9
	movsd xmm9, xmm0
	mulsd xmm7, xmm9
	movsd xmm9, xmm0
	mulsd xmm7, xmm9
	mov rbx, 362880
	cvtsi2sd xmm9, rbx
	divsd xmm7, xmm9
	addsd xmm8, xmm7
	movsd xmm0, xmm8
	jmp ___double_taylor_sin_pdouble__return
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
	je .L0x1db
	mov rbx, 2
	movsd xmm7, qword[FLT_CONSTANT_2]
	cvtsi2sd xmm8, rbx
	mulsd xmm8, xmm7
	movsd xmm1, xmm8
	movsd xmm7, qword[rbp-8]
	movsd xmm0, xmm7
	call _double_fmod_pdoubledouble
	movsd xmm8, xmm0
	movsd xmm7, qword[FLT_CONSTANT_2]
	subsd xmm7, xmm8
	movsd xmm0, xmm7
	call _double_taylor_sin_pdouble
	movsd xmm0, xmm0
	jmp ___double_sin_pdouble__return
.L0x1db:
.L0x1dc:
	xor rax, rax
	cvtsi2sd xmm0, rax
	jmp ___double_sin_pdouble__return
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
	je .L0x1d9
	movsd xmm8, qword[FLT_CONSTANT_3]
	movsd xmm7, qword[rbp-8]
	addsd xmm7, xmm8
	movsd xmm0, xmm7
	call _double_sin_pdouble
	movsd xmm0, xmm0
	jmp ___double_cos_pdouble__return
.L0x1d9:
.L0x1da:
	mov rax, 1
	cvtsi2sd xmm0, rax
	jmp ___double_cos_pdouble__return
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
	je .L0x1d7
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
.L0x1d7:
.L0x1d8:
	xor rax, rax
	cvtsi2sd xmm0, rax
	jmp ___double_tan_pdouble__return
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
	je .L0x1d5
	movsd xmm7, qword[rbp-8]
	movsd xmm0, xmm7
	call _double_tan_pdouble
	movsd xmm8, xmm0
	movsd xmm7, qword[FLT_CONSTANT_4]
	divsd xmm7, xmm8
	movsd xmm0, xmm7
	jmp ___double_cot_pdouble__return
.L0x1d5:
.L0x1d6:
	mov rax, 9221120237041090561
	movq xmm0, rax
	jmp ___double_cot_pdouble__return
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
	je .L0x1d3
	movsd xmm7, qword[rbp-8]
	movsd xmm0, xmm7
	call _double_cos_pdouble
	movsd xmm8, xmm0
	movsd xmm7, qword[FLT_CONSTANT_5]
	divsd xmm7, xmm8
	movsd xmm0, xmm7
	jmp ___double_sec_pdouble__return
.L0x1d3:
.L0x1d4:
	mov rax, 1
	cvtsi2sd xmm0, rax
	jmp ___double_sec_pdouble__return
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
	je .L0x1d1
	movsd xmm7, qword[rbp-8]
	movsd xmm0, xmm7
	call _double_sin_pdouble
	movsd xmm8, xmm0
	movsd xmm7, qword[FLT_CONSTANT_6]
	divsd xmm7, xmm8
	movsd xmm0, xmm7
	jmp ___double_csc_pdouble__return
.L0x1d1:
.L0x1d2:
	mov rax, 9221120237041090561
	movq xmm0, rax
	jmp ___double_csc_pdouble__return
___double_csc_pdouble__return:
	leave
	ret
_double_taylor_asin_pdouble:
	push rbp
	mov rbp, rsp
	sub rsp, 8
	movsd xmm8, xmm0
	movsd xmm7, xmm0
	mulsd xmm7, xmm8
	movsd xmm8, xmm0
	mulsd xmm7, xmm8
	movsd xmm8, qword[FLT_CONSTANT_8]
	divsd xmm7, xmm8
	movsd xmm8, qword[FLT_CONSTANT_7]
	mulsd xmm8, xmm7
	movsd xmm7, xmm0
	addsd xmm7, xmm8
	movsd xmm9, xmm0
	movsd xmm8, xmm0
	mulsd xmm8, xmm9
	movsd xmm9, xmm0
	mulsd xmm8, xmm9
	movsd xmm9, xmm0
	mulsd xmm8, xmm9
	movsd xmm9, xmm0
	mulsd xmm8, xmm9
	movsd xmm9, qword[FLT_CONSTANT_10]
	divsd xmm8, xmm9
	movsd xmm9, qword[FLT_CONSTANT_9]
	mulsd xmm9, xmm8
	addsd xmm7, xmm9
	movsd xmm9, xmm0
	movsd xmm8, xmm0
	mulsd xmm8, xmm9
	movsd xmm9, xmm0
	mulsd xmm8, xmm9
	movsd xmm9, xmm0
	mulsd xmm8, xmm9
	movsd xmm9, xmm0
	mulsd xmm8, xmm9
	movsd xmm9, xmm0
	mulsd xmm8, xmm9
	movsd xmm9, xmm0
	mulsd xmm8, xmm9
	movsd xmm9, qword[FLT_CONSTANT_12]
	divsd xmm8, xmm9
	movsd xmm9, qword[FLT_CONSTANT_11]
	mulsd xmm9, xmm8
	addsd xmm7, xmm9
	movsd xmm9, xmm0
	movsd xmm8, xmm0
	mulsd xmm8, xmm9
	movsd xmm9, xmm0
	mulsd xmm8, xmm9
	movsd xmm9, xmm0
	mulsd xmm8, xmm9
	movsd xmm9, xmm0
	mulsd xmm8, xmm9
	movsd xmm9, xmm0
	mulsd xmm8, xmm9
	movsd xmm9, xmm0
	mulsd xmm8, xmm9
	movsd xmm9, xmm0
	mulsd xmm8, xmm9
	movsd xmm9, xmm0
	mulsd xmm8, xmm9
	movsd xmm9, qword[FLT_CONSTANT_14]
	divsd xmm8, xmm9
	movsd xmm9, qword[FLT_CONSTANT_13]
	mulsd xmm9, xmm8
	addsd xmm7, xmm9
	movsd xmm0, xmm7
	jmp ___double_taylor_asin_pdouble__return
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
	jz .L0x1cf
	mov rax, 9221120237041090561
	movq xmm0, rax
	jmp ___double_asin_pdouble__return
.L0x1cf:
.L0x1d0:
	movsd xmm7, qword[rbp-8]
	movsd xmm0, xmm7
	call _double_taylor_asin_pdouble
	movsd xmm0, xmm0
	jmp ___double_asin_pdouble__return
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
	jz .L0x1cd
	mov rax, 9221120237041090561
	movq xmm0, rax
	jmp ___double_acos_pdouble__return
.L0x1cd:
.L0x1ce:
	movsd xmm7, qword[rbp-8]
	movsd xmm0, xmm7
	call _double_taylor_asin_pdouble
	movsd xmm8, xmm0
	movsd xmm7, qword[FLT_CONSTANT_3]
	subsd xmm7, xmm8
	movsd xmm0, xmm7
	jmp ___double_acos_pdouble__return
___double_acos_pdouble__return:
	leave
	ret
_double_atan_pdouble:
	push rbp
	mov rbp, rsp
	sub rsp, 8
	mov rbx, -1
	movsd xmm7, xmm0
	cvtsi2sd xmm8, rbx
	comisd xmm7, xmm8
	jne .L0x1c1
	xor rbx, rbx
	movsd xmm7, qword[FLT_CONSTANT_15]
	cvtsi2sd xmm8, rbx
	subsd xmm8, xmm7
	movsd xmm0, xmm8
	jmp ___double_atan_pdouble__return
.L0x1c1:
	mov rbx, 1
	movsd xmm7, xmm0
	cvtsi2sd xmm8, rbx
	comisd xmm7, xmm8
	jne .L0x1c3
	movsd xmm7, qword[FLT_CONSTANT_15]
	movsd xmm0, xmm7
	jmp ___double_atan_pdouble__return
.L0x1c3:
	xor rbx, rbx
	movsd xmm7, xmm0
	cvtsi2sd xmm8, rbx
	comisd xmm7, xmm8
	jne .L0x1c5
	xor rax, rax
	cvtsi2sd xmm0, rax
	jmp ___double_atan_pdouble__return
.L0x1c5:
	mov rbx, 1
	movsd xmm7, xmm0
	cvtsi2sd xmm8, rbx
	comisd xmm7, xmm8
	setle r10b
	mov rbx, -1
	movsd xmm7, xmm0
	cvtsi2sd xmm8, rbx
	comisd xmm7, xmm8
	setge r11b
	and r10b, r11b
	jz .L0x1c7
	movsd xmm8, xmm0
	movsd xmm7, xmm0
	mulsd xmm7, xmm8
	movsd xmm8, xmm0
	mulsd xmm7, xmm8
	movsd xmm8, qword[FLT_CONSTANT_16]
	divsd xmm7, xmm8
	movsd xmm8, xmm0
	subsd xmm8, xmm7
	movsd xmm9, xmm0
	movsd xmm7, xmm0
	mulsd xmm7, xmm9
	movsd xmm9, xmm0
	mulsd xmm7, xmm9
	movsd xmm9, xmm0
	mulsd xmm7, xmm9
	movsd xmm9, xmm0
	mulsd xmm7, xmm9
	movsd xmm9, qword[FLT_CONSTANT_17]
	divsd xmm7, xmm9
	addsd xmm8, xmm7
	movsd xmm9, xmm0
	movsd xmm7, xmm0
	mulsd xmm7, xmm9
	movsd xmm9, xmm0
	mulsd xmm7, xmm9
	movsd xmm9, xmm0
	mulsd xmm7, xmm9
	movsd xmm9, xmm0
	mulsd xmm7, xmm9
	movsd xmm9, xmm0
	mulsd xmm7, xmm9
	movsd xmm9, xmm0
	mulsd xmm7, xmm9
	movsd xmm9, qword[FLT_CONSTANT_18]
	divsd xmm7, xmm9
	subsd xmm8, xmm7
	movsd xmm9, xmm0
	movsd xmm7, xmm0
	mulsd xmm7, xmm9
	movsd xmm9, xmm0
	mulsd xmm7, xmm9
	movsd xmm9, xmm0
	mulsd xmm7, xmm9
	movsd xmm9, xmm0
	mulsd xmm7, xmm9
	movsd xmm9, xmm0
	mulsd xmm7, xmm9
	movsd xmm9, xmm0
	mulsd xmm7, xmm9
	movsd xmm9, xmm0
	mulsd xmm7, xmm9
	movsd xmm9, xmm0
	mulsd xmm7, xmm9
	movsd xmm9, qword[FLT_CONSTANT_19]
	divsd xmm7, xmm9
	addsd xmm8, xmm7
	movsd xmm0, xmm8
	jmp ___double_atan_pdouble__return
.L0x1c7:
	mov rbx, -1
	movsd xmm7, xmm0
	cvtsi2sd xmm8, rbx
	comisd xmm7, xmm8
	jge .L0x1c9
	xor rbx, rbx
	movsd xmm7, qword[FLT_CONSTANT_3]
	cvtsi2sd xmm8, rbx
	subsd xmm8, xmm7
	mov rbx, 1
	movsd xmm7, xmm0
	cvtsi2sd xmm9, rbx
	divsd xmm9, xmm7
	subsd xmm8, xmm9
	movsd xmm9, xmm0
	movsd xmm7, xmm0
	mulsd xmm7, xmm9
	movsd xmm9, xmm0
	mulsd xmm7, xmm9
	movsd xmm9, qword[FLT_CONSTANT_21]
	mulsd xmm9, xmm7
	movsd xmm7, qword[FLT_CONSTANT_20]
	divsd xmm7, xmm9
	addsd xmm8, xmm7
	movsd xmm9, xmm0
	movsd xmm7, xmm0
	mulsd xmm7, xmm9
	movsd xmm9, xmm0
	mulsd xmm7, xmm9
	movsd xmm9, xmm0
	mulsd xmm7, xmm9
	movsd xmm9, xmm0
	mulsd xmm7, xmm9
	movsd xmm9, qword[FLT_CONSTANT_23]
	mulsd xmm9, xmm7
	movsd xmm7, qword[FLT_CONSTANT_22]
	divsd xmm7, xmm9
	subsd xmm8, xmm7
	movsd xmm0, xmm8
	jmp ___double_atan_pdouble__return
.L0x1c9:
	mov rbx, 1
	movsd xmm7, xmm0
	cvtsi2sd xmm8, rbx
	comisd xmm7, xmm8
	jle .L0x1cb
	mov rbx, 1
	movsd xmm7, xmm0
	cvtsi2sd xmm8, rbx
	divsd xmm8, xmm7
	movsd xmm7, qword[FLT_CONSTANT_3]
	subsd xmm7, xmm8
	movsd xmm9, xmm0
	movsd xmm8, xmm0
	mulsd xmm8, xmm9
	movsd xmm9, xmm0
	mulsd xmm8, xmm9
	movsd xmm9, qword[FLT_CONSTANT_25]
	mulsd xmm9, xmm8
	movsd xmm8, qword[FLT_CONSTANT_24]
	divsd xmm8, xmm9
	addsd xmm7, xmm8
	movsd xmm9, xmm0
	movsd xmm8, xmm0
	mulsd xmm8, xmm9
	movsd xmm9, xmm0
	mulsd xmm8, xmm9
	movsd xmm9, xmm0
	mulsd xmm8, xmm9
	movsd xmm9, xmm0
	mulsd xmm8, xmm9
	movsd xmm9, qword[FLT_CONSTANT_27]
	mulsd xmm9, xmm8
	movsd xmm8, qword[FLT_CONSTANT_26]
	divsd xmm8, xmm9
	subsd xmm7, xmm8
	movsd xmm0, xmm7
	jmp ___double_atan_pdouble__return
.L0x1cb:
.L0x1cc:
.L0x1ca:
.L0x1c8:
.L0x1c6:
.L0x1c4:
.L0x1c2:
	mov rax, 9221120237041090561
	movq xmm0, rax
	jmp ___double_atan_pdouble__return
___double_atan_pdouble__return:
	leave
	ret
_int_strcpy_pchar.char.:
	push rbp
	mov rbp, rsp
	sub rsp, 8
	mov rax, -1
_void_strcpy_pchar.char._flp:
	inc rax
	mov bl, [rsi]
	mov [rdi], bl
	inc rdi
	inc rsi
	test bl, bl
	jnz _void_strcpy_pchar.char._flp
___int_strcpy_pchar.char.__return:
	leave
	ret
_size_t_strlen_pchar.:
	push rbp
	mov rbp, rsp
	sub rsp, 8
	mov rax, -1
_size_t_strlen_pchar._flp:
	mov bl, [rdi]
	inc rax
	inc rdi
	test bl, bl
	jnz _size_t_strlen_pchar._flp
___size_t_strlen_pchar.__return:
	leave
	ret
_char._memchr_pchar.charsize_t:
	push rbp
	mov rbp, rsp
	sub rsp, 8
	mov r11, rdi
	add r11, rdx
	mov rbx, r11
	jmp .L0x1ad
.L0x1ac:
	mov r10, rdi
	mov r10b, byte[r10]
	and r10, 0xff
	cmp r10b, sil
	jne .L0x1af
	mov rax, rdi
	jmp ___char._memchr_pchar.charsize_t__return
.L0x1af:
.L0x1b0:
	inc rdi
.L0x1ad:
	cmp rdi, rbx
	jl .L0x1ac
.L0x1ae:
	xor rax, rax
	jmp ___char._memchr_pchar.charsize_t__return
___char._memchr_pchar.charsize_t__return:
	leave
	ret
_int_memcmp_pchar.char.size_t:
	push rbp
	mov rbp, rsp
	sub rsp, 8
	xor ebx, ebx
	mov r12, rdi
	add r12, rdx
	mov r10, r12
	jmp .L0x1a3
.L0x1a2:
	mov r11, rdi
	mov r12, rsi
	mov r11b, byte[r11]
	and r11, 0xff
	mov r12b, byte[r12]
	and r12, 0xff
	cmp r11b, r12b
	jge .L0x1a5
	dec ebx
	jmp .L0x1a6
.L0x1a5:
	inc ebx
.L0x1a6:
	inc rdi
	inc rsi
.L0x1a3:
	cmp rdi, r10
	jl .L0x1a2
.L0x1a4:
	mov eax, ebx
	jmp ___int_memcmp_pchar.char.size_t__return
___int_memcmp_pchar.char.size_t__return:
	leave
	ret
_char._strchr_pchar.char:
	push rbp
	mov rbp, rsp
	sub rsp, 8
	jmp .L0x199
.L0x198:
	mov rbx, rdi
	mov bl, byte[rbx]
	and rbx, 0xff
	cmp bl, sil
	jne .L0x19b
	mov rax, rdi
	jmp ___char._strchr_pchar.char__return
.L0x19b:
.L0x19c:
	inc rdi
.L0x199:
	mov rbx, rdi
	mov bl, byte[rbx]
	and rbx, 0xff
	test bl, bl
	jnz .L0x198
.L0x19a:
	xor rax, rax
	jmp ___char._strchr_pchar.char__return
___char._strchr_pchar.char__return:
	leave
	ret
_char._strerror_plong:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov [rbp-8], rdi
	cmp qword[rbp-8], 0
	jl .L0x191
	mov rdi, qword[rbp-8]
	call _char._get_errstr_pint
	jmp ___char._strerror_plong__return
.L0x191:
	xor r10, r10
	sub r10, qword[rbp-8]
	mov edi, r10d
	call _char._get_errstr_pint
	jmp ___char._strerror_plong__return
.L0x192:
	xor rax, rax
	jmp ___char._strerror_plong__return
___char._strerror_plong__return:
	leave
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
	jnz .L0x186
	mov rbx, qword[rbp-16]
	mov byte[rbx], 48
	mov rax, 1
	jmp ___long_toStr_plongchar.boollong__return
.L0x186:
.L0x187:
	mov byte[rbp-40], 0
	cmp qword[rbp-8], 0
	setl bl
	and bl, byte[rbp-24]
	jz .L0x188
	mov rbx, qword[rbp-16]
	mov byte[rbx], 45
	inc qword[rbp-16]
	xor r10, r10
	sub r10, qword[rbp-8]
	mov qword[rbp-8], r10
	mov byte[rbp-40], 1
	jmp .L0x189
.L0x188:
.L0x189:
	mov rdx, 64
	mov rsi, 0
	lea rbx, [rbp-112]
	mov rdi, rbx
	call _void_memset_pvoid.ucharsize_t
	mov qword[rbp-120], 0
	jmp .L0x18b
.L0x18a:
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
.L0x18b:
	mov rbx, qword[rbp-8]
	test rbx, rbx
	jnz .L0x18a
.L0x18c:
	mov rbx, qword[rbp-120]
	mov dword[rbp-128], ebx
	jmp .L0x18e
.L0x18d:
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
.L0x18f:
	dec dword[rbp-128]
.L0x18e:
	cmp dword[rbp-128], 0
	jg .L0x18d
.L0x190:
	mov r10b, byte[rbp-40]
	mov rbx, qword[rbp-120]
	mov r11b, r10b
	add rbx, r11
	inc rbx
	mov rax, rbx
	jmp ___long_toStr_plongchar.boollong__return
___long_toStr_plongchar.boollong__return:
	leave
	ret
_size_t_toBinary_pchar.ulonglong:
	push rbp
	mov rbp, rsp
	sub rsp, 8
	add rdi, rdx
	mov dword[rbp-8], 0
	jmp .L0x181
.L0x180:
	mov r10, 1
	mov rbx, rsi
	and rbx, r10
	cmp rbx, 1
	jne .L0x184
	mov rbx, rdi
	mov byte[rbx], 49
	jmp .L0x185
.L0x184:
	mov rbx, rdi
	mov byte[rbx], 48
.L0x185:
	shr rsi, 1
	dec rdi
.L0x182:
	inc dword[rbp-8]
.L0x181:
	mov r10d, dword[rbp-8]
	mov rbx, rdx
	mov r11d, r10d
	cmp r11, rbx
	jl .L0x180
.L0x183:
	mov rax, rdx
	jmp ___size_t_toBinary_pchar.ulonglong__return
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
	jne .L0x152
	mov rsi, STRING_CONSTANT_134
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	call _int_strcpy_pchar.char.
	mov rax, 4
	jmp ___long_toStr_pdoublechar.long__return
.L0x152:
	movsd xmm7, qword[rbp-8]
	movq rbx, xmm7
	mov r10, 9218868437227405313
	cmp rbx, r10
	jne .L0x154
	mov rsi, STRING_CONSTANT_135
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	call _int_strcpy_pchar.char.
	mov rax, 4
	jmp ___long_toStr_pdoublechar.long__return
.L0x154:
	movsd xmm7, qword[rbp-8]
	movq rbx, xmm7
	mov r10, 9223372036854775807
	cmp rbx, r10
	jne .L0x156
	mov rsi, STRING_CONSTANT_136
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	call _int_strcpy_pchar.char.
	mov rax, 3
	jmp ___long_toStr_pdoublechar.long__return
.L0x156:
	mov rbx, 9218868437227405312
	movsd xmm7, qword[rbp-8]
	movq xmm8, rbx
	comisd xmm7, xmm8
	jne .L0x158
	mov rsi, STRING_CONSTANT_137
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	call _int_strcpy_pchar.char.
	mov rax, 3
	jmp ___long_toStr_pdoublechar.long__return
.L0x158:
	mov rbx, 18442240474082181120
	movsd xmm7, qword[rbp-8]
	movq xmm8, rbx
	comisd xmm7, xmm8
	jne .L0x15a
	mov rsi, STRING_CONSTANT_138
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	call _int_strcpy_pchar.char.
	mov rax, 4
	jmp ___long_toStr_pdoublechar.long__return
.L0x15a:
.L0x15b:
.L0x159:
.L0x157:
.L0x155:
.L0x153:
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
	jz .L0x15c
	mov rbx, qword[rbp-16]
	mov byte[rbx], 45
	inc qword[rbp-16]
	inc qword[rbp-40]
	jmp .L0x15d
.L0x15c:
.L0x15d:
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
.L0x168:
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
	jmp .L0x16b
.L0x16a:
	mov rbx, qword[rbp-16]
	mov byte[rbx], 48
	inc qword[rbp-16]
	inc qword[rbp-40]
.L0x16c:
	inc qword[rbp-56]
.L0x16b:
	mov r10, qword[rbp-48]
	cmp qword[rbp-56], r10
	jl .L0x16a
.L0x16d:
	dec qword[rbp-16]
	mov rcx, 10
	mov rdx, 1
	mov rbx, qword[rbp-16]
	mov rsi, rbx
	movsd xmm7, qword[rbp-8]
	movsd xmm0, xmm7
	roundsd xmm0, xmm0, 0  
	cvttsd2si rax, xmm0
.L0x178:
	mov rdi, rax
	call _long_abs_plong
	mov rdi, rax
	call _long_toStr_plongchar.boollong
	add qword[rbp-40], rax
	mov rbx, qword[rbp-40]
	inc rbx
	mov rax, rbx
	jmp ___long_toStr_pdoublechar.long__return
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
	mov rbx, qword[rbp-8]
	mov qword[rbp-40], rbx
	mov rbx, qword[rbp-8]
	test rbx, rbx
	setz bl
	mov r10, qword[rbp-16]
	test r10, r10
	setz r10b
	or bl, r10b
	jz .L0x136
	xor rax, rax
	jmp ___int___sprintf_pchar.char.void.__return
.L0x136:
.L0x137:
.L0x138:
	mov rbx, qword[rbp-16]
	mov bl, byte[rbx]
	and rbx, 0xff
	cmp bl, 37
	je .L0x13b
	mov rbx, qword[rbp-8]
	mov r10, qword[rbp-16]
	mov r10b, byte[r10]
	and r10, 0xff
	mov [rbx], r10b
	jmp .L0x13c
.L0x13b:
	inc qword[rbp-16]
	mov rbx, qword[rbp-16]
	and r10, 0xff
	mov r10b, byte[rbx]
	mov byte[rbp-48], r10b
	cmp byte[rbp-48], 105
	je .L0x13e
	cmp byte[rbp-48], 99
	je .L0x13f
	cmp byte[rbp-48], 120
	je .L0x140
	cmp byte[rbp-48], 111
	je .L0x141
	cmp byte[rbp-48], 117
	je .L0x142
	cmp byte[rbp-48], 115
	je .L0x143
	cmp byte[rbp-48], 66
	je .L0x144
	cmp byte[rbp-48], 100
	je .L0x147
	cmp byte[rbp-48], 102
	je .L0x148
	cmp byte[rbp-48], 98
	je .L0x149
	jmp .L0x13d
.L0x13e:
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
	mov qword[rbp-64], rax
	mov rbx, qword[rbp-64]
	dec rbx
	add qword[rbp-8], rbx
	jmp .L0x13d
.L0x13f:
	mov r10d, dword[rbp-32]
	mov rbx, qword[rbp-24]
	and r10, 0x7fffffff
	mov rbx, [rbx+r10*8]
	mov r11, rbx
	mov byte[rbp-72], r11b
	mov rbx, qword[rbp-8]
	mov r11b, byte[rbp-72]
	mov [rbx], r11b
	jmp .L0x13d
.L0x140:
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
	mov qword[rbp-88], rax
	mov rbx, qword[rbp-88]
	dec rbx
	add qword[rbp-8], rbx
	jmp .L0x13d
.L0x141:
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
	mov qword[rbp-104], rax
	mov rbx, qword[rbp-104]
	dec rbx
	add qword[rbp-8], rbx
	jmp .L0x13d
.L0x142:
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
	mov dword[rbp-120], eax
	mov ebx, dword[rbp-120]
	dec ebx
	mov r10d, ebx
	add qword[rbp-8], r10
	jmp .L0x13d
.L0x143:
	mov r10d, dword[rbp-32]
	mov rbx, qword[rbp-24]
	and r10, 0x7fffffff
	mov rbx, [rbx+r10*8]
	mov rsi, rbx
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _int_strcpy_pchar.char.
	mov dword[rbp-128], eax
	mov ebx, dword[rbp-128]
	dec ebx
	mov r10d, ebx
	add qword[rbp-8], r10
	jmp .L0x13d
.L0x144:
	mov r10d, dword[rbp-32]
	mov rbx, qword[rbp-24]
	and r10, 0x7fffffff
	mov rbx, [rbx+r10*8]
	mov byte[rbp-136], bl
	mov rbx, STRING_CONSTANT_139
	mov qword[rbp-144], rbx
	mov al, byte[rbp-136]
	test al, al
	jz .L0x145
	mov r10, STRING_CONSTANT_140
	mov qword[rbp-144], r10
	jmp .L0x146
.L0x145:
.L0x146:
	mov rbx, qword[rbp-144]
	mov rsi, rbx
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _int_strcpy_pchar.char.
	mov dword[rbp-152], eax
	mov ebx, dword[rbp-152]
	add qword[rbp-8], rbx
	jmp .L0x13d
.L0x147:
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
	mov dword[rbp-168], eax
	mov ebx, dword[rbp-168]
	dec ebx
	mov r10d, ebx
	add qword[rbp-8], r10
	jmp .L0x13d
.L0x148:
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
	mov dword[rbp-184], eax
	mov ebx, dword[rbp-184]
	dec ebx
	mov r10d, ebx
	add qword[rbp-8], r10
	jmp .L0x13d
.L0x149:
	mov r10d, dword[rbp-32]
	mov rbx, qword[rbp-24]
	and r10, 0x7fffffff
	mov rbx, [rbx+r10*8]
	mov qword[rbp-192], rbx
	mov rbx, qword[rbp-16]
	inc rbx
	and r10, 0xff
	mov r10b, byte[rbx]
	mov byte[rbp-200], r10b
	mov qword[rbp-208], 64
	cmp byte[rbp-200], 56
	jne .L0x14a
	inc qword[rbp-16]
	jmp .L0x14b
.L0x14a:
	cmp byte[rbp-200], 52
	jne .L0x14c
	mov qword[rbp-208], 32
	inc qword[rbp-16]
	jmp .L0x14d
.L0x14c:
	cmp byte[rbp-200], 50
	jne .L0x14e
	mov qword[rbp-208], 16
	inc qword[rbp-16]
	jmp .L0x14f
.L0x14e:
	cmp byte[rbp-200], 49
	jne .L0x150
	mov qword[rbp-208], 8
	inc qword[rbp-16]
	jmp .L0x151
.L0x150:
.L0x151:
.L0x14f:
.L0x14d:
.L0x14b:
	mov rbx, qword[rbp-208]
	mov rdx, rbx
	mov rsi, qword[rbp-192]
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _size_t_toBinary_pchar.ulonglong
	mov qword[rbp-216], rax
	mov r10, qword[rbp-216]
	add qword[rbp-8], r10
	jmp .L0x13d
.L0x13d:
	inc dword[rbp-32]
.L0x13c:
	inc qword[rbp-16]
	inc qword[rbp-8]
.L0x139:
	mov rbx, qword[rbp-16]
	mov bl, byte[rbx]
	and rbx, 0xff
	test bl, bl
	jnz .L0x138
.L0x13a:
	mov r10, qword[rbp-8]
	sub r10, qword[rbp-40]
	mov eax, r10d
	jmp ___int___sprintf_pchar.char.void.__return
___int___sprintf_pchar.char.void.__return:
	leave
	ret
_int_sprintf_pchar.char.voidvoidvoidvoid:
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
	mov dword[rbp-96], eax
	mov ebx, dword[rbp-96]
	mov eax, ebx
	jmp ___int_sprintf_pchar.char.voidvoidvoidvoid__return
___int_sprintf_pchar.char.voidvoidvoidvoid__return:
	leave
	ret
_FILE_fopen_pchar.char.:
	push rbp
	mov rbp, rsp
	sub rsp, 56
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	mov rbx, qword[rbp-16]
	mov r11b, 1
	mov r10, qword[rbp-16]
	and r11, 0xff
	lea r10, [r10+r11*1]
	mov bl, byte[rbx]
	and rbx, 0xff
	mov r10b, byte[r10]
	and r10, 0xff
	add bl, r10b
	mov qword[rbp-24], rbx
	mov qword[rbp-32], 510
	mov qword[rbp-40], 0
	cmp qword[rbp-24], 114
	je .L0x128
	cmp qword[rbp-24], 119
	je .L0x129
	cmp qword[rbp-24], 97
	je .L0x12a
	cmp qword[rbp-24], 157
	je .L0x12b
	cmp qword[rbp-24], 162
	je .L0x12c
	cmp qword[rbp-24], 140
	je .L0x12d
	jmp .L0x127
.L0x128:
	mov qword[rbp-40], 0
	jmp .L0x127
.L0x129:
	mov qword[rbp-40], 1
	jmp .L0x127
.L0x12a:
	mov qword[rbp-40], 1
	jmp .L0x127
.L0x12b:
	mov qword[rbp-40], 2
	jmp .L0x127
.L0x12c:
	mov qword[rbp-40], 2
	jmp .L0x127
.L0x12d:
	mov qword[rbp-40], 2
	jmp .L0x127
.L0x127:
	mov rbx, qword[rbp-32]
	mov rdx, rbx
	mov rsi, qword[rbp-40]
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	mov rax , 2 
	mov r10 , rcx 
	syscall 
.L0x12f:
	mov qword[rbp-48], rax
	cmp qword[rbp-24], 140
	sete bl
	cmp qword[rbp-24], 97
	sete r10b
	or bl, r10b
	jz .L0x131
	mov rdx, 2
	mov rsi, 0
	mov rdi, qword[rbp-48]
	mov rax , 8 
	mov r10 , rcx 
	syscall 
.L0x134:
	jmp .L0x132
.L0x131:
.L0x132:
	mov rbx, qword[rbp-48]
	mov rax, rbx
	jmp ___FILE_fopen_pchar.char.__return
___FILE_fopen_pchar.char.__return:
	leave
	ret
_int_fputs_pFILEchar.:
	push rbp
	mov rbp, rsp
	sub rsp, 40
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	call _size_t_strlen_pchar.
	mov qword[rbp-24], rax
	mov rbx, qword[rbp-24]
	mov rdx, rbx
	mov rbx, qword[rbp-16]
	mov rsi, rbx
	mov rdi, qword[rbp-8]
	mov rax , 1 
	mov r10 , rcx 
	syscall 
.L0x125:
	mov qword[rbp-32], rax
	mov rax, qword[rbp-32]
	jmp ___int_fputs_pFILEchar.__return
___int_fputs_pFILEchar.__return:
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
.L0x122:
	mov qword[rbp-32], rax
	mov rbx, qword[rbp-32]
	mov rax, rbx
	jmp ___long_fgets_pFILEchar.size_t__return
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
.L0x117:
	mov dword[rbp-16], eax
	mov rdx, 2
	mov r10d, 0
	sub r10d, dword[rbp-16]
	mov esi, r10d
	mov rdi, qword[rbp-8]
	mov rax , 8 
	mov r10 , rcx 
	syscall 
.L0x11a:
	mov edi, dword[rbp-16]
	call _void._malloc_psize_t
	mov qword[rbp-24], rax
	mov edx, dword[rbp-16]
	mov rbx, qword[rbp-24]
	mov rsi, rbx
	mov rdi, qword[rbp-8]
	mov rax , 0 
	mov r10 , rcx 
	syscall 
.L0x11d:
	mov qword[rbp-32], rax
	cmp qword[rbp-32], 0
	jge .L0x11f
	mov rax, qword[rbp-32]
	jmp ___void._floads_pFILE__return
.L0x11f:
.L0x120:
	mov rax, qword[rbp-24]
	jmp ___void._floads_pFILE__return
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
	call _void._qmmap_psize_t
	mov qword[rbp-32], rax
	mov rbx, qword[rbp-16]
	mov rdx, rbx
	mov rbx, qword[rbp-8]
	mov rsi, rbx
	mov rbx, qword[rbp-32]
	mov rdi, rbx
	call _int___sprintf_pchar.char.void.
	mov dword[rbp-40], eax
	mov edx, dword[rbp-40]
	mov rbx, qword[rbp-32]
	mov rsi, rbx
	mov rbx, qword[rbp-24]
	mov rdi, rbx
	mov rax , 1 
	mov r10 , rcx 
	syscall 
.L0x114:
	mov rsi, 10000
	mov rdi, qword[rbp-32]
	call _void._munmap_pvoid.size_t
___void___printf_pchar.void.fd_t__return:
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
__printf__return:
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
__eprintf__return:
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
__fprintf__return:
	leave
	ret
_long_execl_pchar.char..:
	push rbp
	mov rbp, rsp
	sub rsp, 24
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	mov rdx, __emptyenv
	mov rbx, qword[rbp-16]
	mov rsi, rbx
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	mov rax , 59 
	mov r10 , rcx 
	syscall 
.L0x111:
	jmp ___long_execl_pchar.char..__return
___long_execl_pchar.char..__return:
	leave
	ret
_long_system_pchar.:
	push rbp
	mov rbp, rsp
	sub rsp, 24
	mov [rbp-8], rdi
	mov rax , 57 
	mov r10 , rcx 
	syscall 
.L0x107:
	mov qword[rbp-16], rax
	mov rbx, qword[rbp-16]
	test rbx, rbx
	jnz .L0x109
	mov r10b, 2
	mov rbx, __systemcallargvconst
	and r10, 0xff
	lea rbx, [rbx+r10*8]
	mov r11, qword[rbp-8]
	mov [rbx], r11
	mov rsi, __systemcallargvconst
	mov rdi, __systembashpath
	call _long_execl_pchar.char..
	mov qword[rbp-24], rax
	mov rbx, qword[rbp-24]
	mov rdi, rbx
	call _char._strerror_plong
	mov rdi, rax
	push rdi
	mov rsi, rdi
	mov rdi, 1
	call _int_fputs_pFILEchar.
	mov rbx, rax
	pop rdi
	mov rax, rbx
.L0x10c:
	jmp .L0x10a
.L0x109:
.L0x10a:
	xor rdx, rdx
	xor rsi, rsi
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	mov rax, 61
	xor r8, r8
	syscall
.L0x10e:
	xor rax, rax
	jmp ___long_system_pchar.__return
___long_system_pchar.__return:
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
	jne .L0x101
	mov rcx, qword[rbp-32]
	mov edx, dword[rbp-24]
	mov rsi, qword[rbp-16]
	mov rdi, STRING_CONSTANT_145
	call eprintf
	mov rdi, 1
	mov rax , 60 
	mov r10 , rcx 
	syscall 
.L0x104:
	jmp .L0x102
.L0x101:
.L0x102:
___void___assert_pboolchar.intchar.__return:
	leave
	ret
_void_merge_right_pmblock.:
	push rbp
	mov rbp, rsp
	sub rsp, 8
	mov rbx, rdi
	mov rbx, [rbx+8]
	test rbx, rbx
	jz .L0xf9
	mov rbx, rdi
	lea rbx, [rbx+8]
	mov r10, rbx
	cmp qword[r10+24], 1
	jne .L0xfb
	mov rbx, rdi
	mov rbx, qword[rbx]
	mov r10, rdi
	add r10, rbx
	add r10, 32
	mov rbx, rdi
	cmp r10, qword[rbx]
	jne .L0xfd
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
	jz .L0xff
	mov rbx, rdi
	lea rbx, [rbx+8]
	mov r10, rbx
	lea r10, [r10+16]
	mov r11, rdi
	mov [r10], r11
	jmp .L0x100
.L0xff:
.L0x100:
.L0xfd:
.L0xfe:
.L0xfb:
.L0xfc:
.L0xf9:
.L0xfa:
___void_merge_right_pmblock.__return:
	leave
	ret
_bool_scan_merge_pmblock.:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov [rbp-8], rdi
	mov r10, qword[malloc_maxcache]
	cmp qword[cached_size], r10
	jle .L0xed
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
	add rbx, 32
	mov rsi, rbx
	mov rdi, rdi
	call _void._munmap_pvoid.size_t
	mov rbx, rax
	pop rdi
	mov rax, rbx
	jmp .L0xf0
.L0xf0:
	xor rax, rax
	jmp ___bool_scan_merge_pmblock.__return
.L0xed:
.L0xee:
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _void_merge_right_pmblock.
	mov rbx, qword[rbp-8]
	mov rbx, [rbx+16]
	mov rdi, rbx
	call _void_merge_right_pmblock.
	mov rax, 1
	jmp ___bool_scan_merge_pmblock.__return
___bool_scan_merge_pmblock.__return:
	leave
	ret
_void_add_block_pmblock.:
	push rbp
	mov rbp, rsp
	sub rsp, 8
	mov rbx, qword[free_head]
	test rbx, rbx
	jnz .L0xeb
	mov r10, rdi
	mov qword[free_head], r10
	mov rbx, rdi
	lea rbx, [rbx+16]
	mov r11, rdi
	mov [rbx], r11
	mov rbx, rdi
	mov qword[rbx+8], 0
	jmp ___void_add_block_pmblock.__return
.L0xeb:
.L0xec:
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
	leave
	ret
_mblock._scan_existing_psize_t:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov [rbp-8], rdi
	mov rbx, qword[free_head]
	test rbx, rbx
	jnz .L0xdf
	xor rax, rax
	jmp ___mblock._scan_existing_psize_t__return
.L0xdf:
.L0xe0:
	mov rbx, qword[free_head]
	mov qword[rbp-16], rbx
	jmp .L0xe2
.L0xe1:
	mov rbx, qword[rbp-16]
	cmp qword[rbx+24], 1
	jne .L0xe5
	mov rbx, qword[rbp-16]
	mov rbx, qword[rbx]
	cmp rbx, qword[rbp-8]
	jl .L0xe7
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
.L0xe7:
.L0xe8:
.L0xe5:
.L0xe6:
.L0xe3:
	mov rbx, qword[rbp-16]
	mov rbx, [rbx+8]
	mov qword[rbp-16], rbx
.L0xe2:
	mov rbx, qword[rbp-16]
	test rbx, rbx
	jnz .L0xe1
.L0xe4:
	xor rax, rax
	jmp ___mblock._scan_existing_psize_t__return
___mblock._scan_existing_psize_t__return:
	leave
	ret
_void_printstate_p:
	push rbp
	mov rbp, rsp
	sub rsp, 8
	mov rdi, STRING_CONSTANT_146
	push rdi
	mov rsi, rdi
	mov rdi, 1
	call _int_fputs_pFILEchar.
	mov rbx, rax
	pop rdi
	mov rax, rbx
.L0xd4:
	mov rbx, qword[free_head]
	test rbx, rbx
	jnz .L0xd5
	mov rdi, STRING_CONSTANT_147
	push rdi
	mov rsi, rdi
	mov rdi, 1
	call _int_fputs_pFILEchar.
	mov rbx, rax
	pop rdi
	mov rax, rbx
.L0xd8:
	jmp .L0xd6
.L0xd5:
	mov rbx, qword[free_head]
	mov qword[rbp-8], rbx
	jmp .L0xda
.L0xd9:
	mov rbx, qword[rbp-8]
	mov rbx, [rbx+24]
	mov rcx, rbx
	mov rdx, qword[rbp-8]
	mov rbx, qword[rbp-8]
	mov rbx, qword[rbx]
	mov rsi, rbx
	mov rdi, STRING_CONSTANT_148
	call printf
.L0xdb:
	mov rbx, qword[rbp-8]
	mov rbx, [rbx+8]
	mov qword[rbp-8], rbx
.L0xda:
	mov rbx, qword[rbp-8]
	test rbx, rbx
	jnz .L0xd9
.L0xdc:
.L0xd6:
	mov rcx, qword[cached_size]
	mov rdx, qword[deletions]
	mov rsi, qword[appends]
	mov rdi, STRING_CONSTANT_149
	call printf
	mov rdi, STRING_CONSTANT_150
	push rdi
	mov rsi, rdi
	mov rdi, 1
	call _int_fputs_pFILEchar.
	mov rbx, rax
	pop rdi
	mov rax, rbx
.L0xde:
___void_printstate_p__return:
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
	jg .L0xcf
	jmp ___void_split_block_pmblock.size_t__return
.L0xcf:
.L0xd0:
	mov r10, rsi
	mov rbx, rdi
	add rbx, r10
	add rbx, 32
	mov qword[rbp-8], rbx
	mov rbx, qword[rbp-8]
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
	jz .L0xd1
	mov rbx, rdi
	lea rbx, [rbx+8]
	mov r10, rbx
	lea r10, [r10+16]
	mov r11, qword[rbp-8]
	mov [r10], r11
	jmp .L0xd2
.L0xd1:
.L0xd2:
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
	sub rbx, 32
	mov qword[rbp-16], rbx
	mov rbx, qword[rbp-16]
	cmp qword[rbx], 4096
	jl .L0xc7
	mov rbx, qword[rbp-16]
	add qword[rbx], 32
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	push rdi
	mov rbx, rdi
	mov rbx, qword[rbx]
	add rbx, 32
	mov rsi, rbx
	mov rdi, rdi
	call _void._munmap_pvoid.size_t
	mov rbx, rax
	pop rdi
	mov rax, rbx
	jmp .L0xca
.L0xca:
.L0xc7:
.L0xc8:
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
	jl .L0xbd
	mov rbx, qword[rbp-8]
	add rbx, 32
	mov rdi, rbx
	push rdi
	call _void._qmmap_psize_t
	mov rbx, rax
	pop rdi
	mov rax, rbx
	jmp .L0xc0
.L0xc0:
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
.L0xbd:
.L0xbe:
	mov rbx, qword[free_head]
	test rbx, rbx
	jz .L0xc1
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _mblock._scan_existing_psize_t
	mov r10, rax
	mov qword[rbp-16], r10
	mov rax, qword[rbp-16]
	test rax, rax
	jz .L0xc3
	mov rbx, qword[rbp-16]
	mov qword[rbx+24], 0
	mov rbx, qword[rbp-16]
	add rbx, 32
	mov rax, rbx
	jmp ___void._malloc_psize_t__return
.L0xc3:
.L0xc4:
.L0xc1:
.L0xc2:
	mov rdi, 4096
	push rdi
	call _void._qmmap_psize_t
	mov rbx, rax
	pop rdi
	mov rax, rbx
	jmp .L0xc6
.L0xc6:
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
	jmp ___void._malloc_psize_t__return
___void._malloc_psize_t__return:
	leave
	ret
_void._realloc_pvoid.size_t:
	push rbp
	mov rbp, rsp
	sub rsp, 40
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	mov rbx, qword[rbp-8]
	sub rbx, 32
	mov qword[rbp-24], rbx
	mov rbx, qword[rbp-24]
	mov rbx, qword[rbx]
	mov qword[rbp-32], rbx
	cmp qword[rbp-32], 4096
	jge .L0xb6
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _void_free_pvoid.
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	call _void._malloc_psize_t
	mov qword[rbp-40], rax
	mov r10, qword[rbp-40]
	cmp qword[rbp-8], r10
	jne .L0xb8
	mov rbx, qword[rbp-8]
	mov rax, rbx
	jmp ___void._realloc_pvoid.size_t__return
.L0xb8:
.L0xb9:
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
.L0xb6:
.L0xb7:
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
.L0xbb:
	mov rbx, qword[rbp-8]
	mov rax, rbx
	jmp ___void._realloc_pvoid.size_t__return
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
	mov qword[rbp-16], rax
	mov rbx, qword[rbp-8]
	mov rsi, rbx
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	call _void_memzer_pvoid.size_t
	mov rbx, qword[rbp-16]
	mov rax, rbx
	jmp ___void._calloc_psize_t__return
___void._calloc_psize_t__return:
	leave
	ret
_void_memcpy_pvoid.void.size_t:
	push rbp
	mov rbp, rsp
	sub rsp, 8

_void_memcpy_pvoid.void.int_flp:
	mov bl, [rsi]
	mov [rdi], bl
	inc rsi
	inc rdi
	dec rdx
	jnz _void_memcpy_pvoid.void.int_flp
___void_memcpy_pvoid.void.size_t__return:
	leave
	ret
_void_avx_memcpy_pvoid.void.size_t:
	push rbp
	mov rbp, rsp
	sub rsp, 48
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	mov [rbp-24], rdx
	mov r10, 32
	mov rbx, qword[rbp-24]
	xor rdx, rdx
	mov rax, rbx
	idiv r10
	mov rbx, rdx
	mov dword[rbp-32], ebx
	mov r10d, dword[rbp-32]
	mov rbx, qword[rbp-24]
	mov r11d, r10d
	sub rbx, r11
	sar rbx, 2
	mov qword[rbp-40], rbx
	mov dword[rbp-48], 0
	jmp .L0xaf
.L0xae:
	mov ebx, dword[rbp-48]
	shl rbx, 3
	add rbx, [rbp-16]
	vmovdqu ymm0, [rbx]
	mov ebx, dword[rbp-48]
	shl rbx, 3
	add rbx, [rbp-8]
	vmovdqu [rbx], ymm0
.L0xb0:
	mov ebx, dword[rbp-48]
	add ebx, 4
	mov dword[rbp-48], ebx
.L0xaf:
	mov r10d, dword[rbp-48]
	mov rbx, qword[rbp-40]
	mov r11d, r10d
	cmp r11, rbx
	jl .L0xae
.L0xb1:
	mov ebx, dword[rbp-32]
	test ebx, ebx
	jz .L0xb2
	mov edx, dword[rbp-32]
	mov r10, qword[rbp-16]
	add r10, qword[rbp-40]
	mov rsi, r10
	mov r10, qword[rbp-8]
	add r10, qword[rbp-40]
	mov rdi, r10
	call _void_memcpy_pvoid.void.size_t
	jmp .L0xb3
.L0xb2:
.L0xb3:
___void_avx_memcpy_pvoid.void.size_t__return:
	leave
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
	mov rbx, rdx
	mov dword[rbp-24], ebx
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
	vxorpd ymm0, ymm0, ymm0
.L0xabavxmemzeraligned_lp:
	vmovdqu [rdi], ymm0
	add rdi, 4
	sub rsi, 4
	jnz .L0xabavxmemzeraligned_lp
.L0xaa:
	mov ebx, dword[rbp-24]
	test ebx, ebx
	jz .L0xac
	mov edx, dword[rbp-24]
	mov rsi, 0
	mov r10, qword[rbp-8]
	add r10, qword[rbp-32]
	mov rdi, r10
	call _void_memset_pvoid.ucharsize_t
	jmp .L0xad
.L0xac:
.L0xad:
___void_avx_memzer_pvoid.size_t__return:
	leave
	ret
_void_memset_pvoid.ucharsize_t:
	push rbp
	mov rbp, rsp
	sub rsp, 8
_void_memset_pvoid.ucharsize_t_flp:
	dec rdx
	mov [rdi+rdx], sil
	jnz _void_memset_pvoid.ucharsize_t_flp
___void_memset_pvoid.ucharsize_t__return:
	leave
	ret
_void_memzer_pvoid.size_t:
	push rbp
	mov rbp, rsp
	sub rsp, 8
	xor bl, bl
.L0xa6:
	mov [rdi+rsi], bl
	dec rsi
	jnz .L0xa6
___void_memzer_pvoid.size_t__return:
	leave
	ret
_int_rand_p:
	push rbp
	mov rbp, rsp
	sub rsp, 8
	mov ebx, dword[rand_next]
	sal ebx, 13
	mov r10d, dword[rand_next]
	xor r10d, ebx
	mov dword[rand_next], r10d
	mov ebx, dword[rand_next]
	sar ebx, 17
	mov r10d, dword[rand_next]
	xor r10d, ebx
	mov dword[rand_next], r10d
	mov ebx, dword[rand_next]
	sal ebx, 5
	mov r10d, dword[rand_next]
	xor r10d, ebx
	mov dword[rand_next], r10d
	mov ebx, dword[rand_next]
	mov eax, ebx
	jmp ___int_rand_p__return
___int_rand_p__return:
	leave
	ret
_void_srand_p:
	push rbp
	mov rbp, rsp
	sub rsp, 8
	rdrand rax
.L0xa3:
	mov r10, rax
	mov dword[rand_next], r10d
___void_srand_p__return:
	leave
	ret
_void_usleep_plong:
	push rbp
	mov rbp, rsp
	sub rsp, 40
	mov [rbp-8], rdi
	mov qword[rbp-32], 0
	mov qword[rbp-24], 0
	mov qword[rbp-32], 0
	mov r10, qword[rbp-8]
	mov qword[rbp-24], r10
	mov rsi, 0
	lea rbx, [rbp-32]
	mov rdi, rbx
	mov rax , 35 
	mov r10 , rcx 
	syscall 
.L0xa0:
___void_usleep_plong__return:
	leave
	ret
_clock_t_clock_p:
	push rbp
	mov rbp, rsp
	sub rsp, 32
	mov qword[rbp-24], 0
	mov qword[rbp-16], 0
	lea rbx, [rbp-24]
	mov rsi, rbx
	mov rdi, 2
	mov rax , 228 
	mov r10 , rcx 
	syscall 
.L0x99:
	mov rbx, rax
	test rbx, rbx
	jz .L0x9b
	mov rax, -1
	jmp ___clock_t_clock_p__return
.L0x9b:
.L0x9c:
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
	imul r12, r11
	mov r11, 9223372036854775807
	sub r11, r12
	cmp r10, r11
	setg r10b
	or bl, r10b
	jz .L0x9d
	mov rax, -1
	jmp ___clock_t_clock_p__return
.L0x9d:
.L0x9e:
	mov r10, 1000000
	mov rbx, qword[rbp-24]
	imul rbx, r10
	mov r11, 1000
	mov r10, qword[rbp-16]
	xor rdx, rdx
	mov rax, r10
	idiv r11
	add rbx, rax
	mov rax, rbx
	jmp ___clock_t_clock_p__return
___clock_t_clock_p__return:
	leave
	ret
_tm._gmtime_ptime_t:
	push rbp
	mov rbp, rsp
	sub rsp, 104
	mov [rbp-8], rdi
	call tzset
	mov rbx, qword[rbp-8]
	mov qword[rbp-16], rbx
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
	movsd xmm7, qword[FLT_CONSTANT_28]
	cvtsi2sd xmm8, ebx
	divsd xmm8, xmm7
	movsd xmm0, xmm8
	call _long_floor_pdouble
	mov rbx, rax
	mov dword[rbp-64], ebx
	mov ebx, dword[rbp-64]
	movsd xmm7, qword[FLT_CONSTANT_29]
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
	mov r10d, 7
	xor rdx, rdx
	mov eax, ebx
	idiv r10d
	mov ebx, edx
	mov dword[rbp-72], ebx
	mov r10d, dword[rbp-56]
	mov dword[rbp-88], r10d
	mov dword[rbp-96], 0
	jmp .L0x93
.L0x92:
	mov r10d, dword[rbp-96]
	mov rbx, qword[mdays]
	and r10, 0x7fffffff
	mov ebx, [rbx+r10*4]
	and rbx, 0x7fffffff
	cmp dword[rbp-88], ebx
	jle .L0x96
	mov r10d, dword[rbp-96]
	mov rbx, qword[mdays]
	and r10, 0x7fffffff
	mov ebx, [rbx+r10*4]
	and rbx, 0x7fffffff
	mov r10d, dword[rbp-88]
	sub r10d, ebx
	mov dword[rbp-88], r10d
	jmp .L0x97
.L0x96:
.L0x97:
.L0x94:
	inc dword[rbp-96]
.L0x93:
	jmp .L0x92
.L0x95:
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
	jmp ___tm._gmtime_ptime_t__return
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
	call _int_strcpy_pchar.char.
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
	add rbx, 4
	mov rdi, rbx
	call _int_strcpy_pchar.char.
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
	mov rsi, STRING_CONSTANT_170
	mov rbx, qword[asctime__result_buf]
	add rbx, 7
	mov rdi, rbx
	call _int_sprintf_pchar.char.voidvoidvoidvoid
	mov rbx, qword[rbp-8]
	mov ebx, [rbx+20]
	and rbx, 0x7fffffff
	mov r10d, 1900
	add r10d, ebx
	mov r9, r10
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
	mov rsi, STRING_CONSTANT_171
	mov rbx, qword[asctime__result_buf]
	add rbx, 10
	mov rdi, rbx
	call _int_sprintf_pchar.char.voidvoidvoidvoid
	mov rbx, qword[asctime__result_buf]
	mov rax, rbx
	jmp ___char._asctime_ptm.__return
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
	jmp ___tm._localtime_ptime_t__return
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
	jmp ___char._ctime_ptime_t__return
___char._ctime_ptime_t__return:
	leave
	ret
_int_inet_aton_pchar.in_addr.:
	push rbp
	mov rbp, rsp
	sub rsp, 76
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	lea rbx, [rbp-28]
	add rbx, 3
	mov r9, rbx
	lea rbx, [rbp-28]
	add rbx, 2
	mov r8, rbx
	lea rbx, [rbp-28]
	inc rbx
	mov rcx, rbx
	lea rbx, [rbp-28]
	mov rdx, rbx
	mov rbx, qword[rbp-8]
	mov rsi, rbx
	mov rdi, STRING_CONSTANT_172
	call sscanf
	mov dword[rbp-36], eax
	mov bl, [rbp-28]
	and bl, 0xff
	and bl, 255
	mov dword[rbp-44], ebx
	mov r10b, 1
	lea rbx, [rbp-28] 
	and r10, 0xff
	mov bl, [rbx+r10*1]
	and rbx, 0xff
	and bl, 255
	mov dword[rbp-52], ebx
	mov r10b, 2
	lea rbx, [rbp-28] 
	and r10, 0xff
	mov bl, [rbx+r10*1]
	and rbx, 0xff
	and bl, 255
	mov dword[rbp-60], ebx
	mov r10b, 3
	lea rbx, [rbp-28] 
	and r10, 0xff
	mov bl, [rbx+r10*1]
	and rbx, 0xff
	and bl, 255
	mov dword[rbp-68], ebx
	mov ebx, dword[rbp-44]
	sal ebx, 24
	mov r10d, dword[rbp-52]
	sal r10d, 16
	or ebx, r10d
	mov r10d, dword[rbp-60]
	sal r10d, 8
	or ebx, r10d
	mov r10d, dword[rbp-68]
	or r10d, ebx
	mov edi, r10d
	xor rax,rax
	bswap edi
	mov eax, edi
.L0x90:
	push rax
	mov rbx, qword[rbp-16]
	pop r11
	mov [rbx], r11d
	mov rax, 1
	jmp ___int_inet_aton_pchar.in_addr.__return
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
	mov rax , 45 
	mov r10 , rcx 
	syscall 
.L0x8d:
	jmp ___int_recv_pfd_tchar.size_tint__return
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
	mov rax , 44 
	mov r10 , rcx 
	syscall 
.L0x8a:
	jmp ___int_send_pfd_tchar.size_tint__return
___int_send_pfd_tchar.size_tint__return:
	leave
	ret
_void_feed_pStackvoid.:
	push rbp
	mov rbp, rsp
	sub rsp, 8
	mov rbx, rdi
	mov r11, rsi
	mov [rbx], r11
___void_feed_pStackvoid.__return:
	leave
	ret
_void_alloc_pStacksize_t:
	push rbp
	mov rbp, rsp
	sub rsp, 48
	mov [rbp-8], rdi
	mov [rbp-40], rsi
	mov rbx, qword[rbp-8]
	lea rbx, [rbx+16]
	mov r11, qword[rbp-40]
	mov [rbx], r11
	mov rbx, qword[rbp-40]
	mov rdi, rbx
	call _void._qmmap_psize_t
	push rax
	mov rbx, qword[rbp-8]
	pop r11
	mov [rbx], r11
___void_alloc_pStacksize_t__return:
	leave
	ret
_void_destroy_pStack:
	push rbp
	mov rbp, rsp
	sub rsp, 40
	mov [rbp-8], rdi
	mov rbx, qword[rbp-8]
	mov rbx, [rbx+16]
	mov rsi, rbx
	mov rbx, qword[rbp-8]
	mov rbx, qword[rbx]
	mov rdi, rbx
	call _void._munmap_pvoid.size_t
___void_destroy_pStack__return:
	leave
	ret
_void_push_pStackvoid:
	push rbp
	mov rbp, rsp
	sub rsp, 8
___void_push_pStackvoid__return:
	leave
	ret
_void_pop_pStack:
	push rbp
	mov rbp, rsp
	sub rsp, 8
___void_pop_pStack__return:
	leave
	ret
_void_pop_pStackvoid.:
	push rbp
	mov rbp, rsp
	sub rsp, 8
___void_pop_pStackvoid.__return:
	leave
	ret
_void_append_pListvoid:
	push rbp
	mov rbp, rsp
	sub rsp, 48
	mov [rbp-8], rdi
	mov [rbp-32], rsi
	mov rdi, 24
	call _void._malloc_psize_t
	mov qword[rbp-40], rax
	mov rbx, qword[rbp-40]
	mov r11, qword[rbp-32]
	mov [rbx], r11
	mov rbx, qword[rbp-40]
	mov qword[rbx+16], 0
	mov rbx, qword[rbp-40]
	mov qword[rbx+8], 0
	mov rbx, qword[rbp-8]
	mov rbx, qword[rbx]
	test rbx, rbx
	jz .L0x87
	mov rbx, qword[rbp-8]
	lea rbx, [rbx+8]
	mov r10, rbx
	lea r10, [r10+8]
	mov r11, qword[rbp-40]
	mov [r10], r11
	mov rbx, qword[rbp-40]
	lea rbx, [rbx+16]
	mov r10, qword[rbp-8]
	mov r10, [r10+8]
	mov [rbx], r10
	mov rbx, qword[rbp-8]
	lea rbx, [rbx+8]
	mov r11, qword[rbp-40]
	mov [rbx], r11
	jmp .L0x88
.L0x87:
	mov rbx, qword[rbp-8]
	mov r11, qword[rbp-40]
	mov [rbx], r11
	mov rbx, qword[rbp-8]
	lea rbx, [rbx+8]
	mov r11, qword[rbp-40]
	mov [rbx], r11
.L0x88:
___void_append_pListvoid__return:
	leave
	ret
_void_set_pVec3fdoubledoubledouble:
	push rbp
	mov rbp, rsp
	sub rsp, 8
	mov rbx, rdi
	movsd xmm8, xmm0
	movsd [rbx], xmm8
	mov rbx, rdi
	lea rbx, [rbx+8]
	movsd xmm8, xmm1
	movsd [rbx], xmm8
	mov rbx, rdi
	lea rbx, [rbx+16]
	movsd xmm8, xmm2
	movsd [rbx], xmm8
___void_set_pVec3fdoubledoubledouble__return:
	leave
	ret
_void_add_pVec3fVec3f.:
	push rbp
	mov rbp, rsp
	sub rsp, 8
	vmovdqu ymm0, [rdi]
	vaddpd ymm1, ymm0, [rsi]
	vmovdqu [rdi], ymm1
___void_add_pVec3fVec3f.__return:
	leave
	ret
_void_sub_pVec3fVec3f.:
	push rbp
	mov rbp, rsp
	sub rsp, 8
	vmovdqu ymm0, [rdi]
	vsubpd ymm1, ymm0, [rsi]
	vmovdqu [rdi], ymm1
___void_sub_pVec3fVec3f.__return:
	leave
	ret
_void_mul_pVec3fVec3f.:
	push rbp
	mov rbp, rsp
	sub rsp, 8
	vmovdqu ymm0, [rdi]
	vmulpd ymm1, ymm0, [rsi]
	vmovdqu [rdi], ymm1
___void_mul_pVec3fVec3f.__return:
	leave
	ret
_void_div_pVec3fVec3f.:
	push rbp
	mov rbp, rsp
	sub rsp, 8
	vmovdqu ymm0, [rdi]
	vdivpd ymm1, ymm0, [rsi]
	vmovdqu [rdi], ymm1
___void_div_pVec3fVec3f.__return:
	leave
	ret
_void_sqrt_pVec3f:
	push rbp
	mov rbp, rsp
	sub rsp, 8
	sqrtsd xmm0, [rdi]  
	sqrtsd xmm1, [rdi+8] 
	sqrtsd xmm2, [rdi+16] 
	movsd [rdi], xmm0  
	movsd [rdi+8], xmm1  
	movsd [rdi+16], xmm2 
___void_sqrt_pVec3f__return:
	leave
	ret
_double_dot_pVec3fVec3f.:
	push rbp
	mov rbp, rsp
	sub rsp, 8
	movsd xmm0, [rdi]   
	movsd xmm1, [rdi+8]   
	mulsd xmm0, [rsi]   
	movsd xmm2, [rdi+16]  
	mulsd xmm1, [rsi+8]   
	mulsd xmm2, [rsi+16]  
	addsd xmm0, xmm1   
	addsd xmm0, xmm2   
___double_dot_pVec3fVec3f.__return:
	leave
	ret
_int_scanint_pchar.long.bool:
	push rbp
	mov rbp, rsp
	sub rsp, 40
	mov qword[rbp-8], 0
	mov rbx, rdi
	and r10, 0xff
	mov r10b, byte[rbx]
	mov byte[rbp-16], r10b
	mov byte[rbp-24], 0
	mov rbx, rdi
	mov qword[rbp-32], rbx
	cmp byte[rbp-16], 45
	sete bl
	and bl, dl
	jz .L0x64
	mov byte[rbp-24], 1
	inc rdi
	mov rbx, rdi
	mov bl, byte[rbx]
	and rbx, 0xff
	mov byte[rbp-16], bl
	jmp .L0x65
.L0x64:
.L0x65:
.L0x66:
	mov r10, 10
	mov rbx, qword[rbp-8]
	imul rbx, r10
	mov r10b, byte[rbp-16]
	sub r10b, 48
	mov r11b, r10b
	add rbx, r11
	mov qword[rbp-8], rbx
	inc rdi
	mov rbx, rdi
	mov bl, byte[rbx]
	and rbx, 0xff
	mov byte[rbp-16], bl
.L0x67:
	cmp byte[rbp-16], 57
	setle bl
	cmp byte[rbp-16], 48
	setge r10b
	and bl, r10b
	jnz .L0x66
.L0x68:
	cmp byte[rbp-24], 0
	jne .L0x69
	mov rbx, rsi
	mov r11, qword[rbp-8]
	mov [rbx], r11
	jmp .L0x6a
.L0x69:
	mov rbx, rsi
	mov r11, 0
	sub r11, qword[rbp-8]
	mov [rbx], r11
.L0x6a:
	mov r10, qword[rbp-32]
	mov rbx, rdi
	sub rbx, r10
	mov eax, ebx
	jmp ___int_scanint_pchar.long.bool__return
___int_scanint_pchar.long.bool__return:
	leave
	ret
_int_scanstr_pchar.charchar.:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov rbx, rdi
	mov qword[rbp-8], rbx
	jmp .L0x5b
.L0x5a:
	mov rbx, rdx
	mov r10, rdi
	mov r10b, byte[r10]
	and r10, 0xff
	mov [rbx], r10b
	inc rdi
	inc rdx
.L0x5b:
	mov rbx, rdi
	mov bl, byte[rbx]
	and rbx, 0xff
	cmp bl, sil
	jne .L0x5a
.L0x5c:
	mov r10, qword[rbp-8]
	mov rbx, rdi
	sub rbx, r10
	mov eax, ebx
	jmp ___int_scanstr_pchar.charchar.__return
___int_scanstr_pchar.charchar.__return:
	leave
	ret
_int_scansd_pchar.booldouble.:
	push rbp
	mov rbp, rsp
	sub rsp, 80
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	mov [rbp-24], rdx
	mov rdx, 1
	lea rbx, [rbp-32]
	mov rsi, rbx
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _int_scanint_pchar.long.bool
	mov qword[rbp-48], rax
	mov r10, qword[rbp-48]
	add qword[rbp-8], r10
	mov rbx, qword[rbp-8]
	mov bl, byte[rbx]
	and rbx, 0xff
	cmp bl, 46
	je .L0x55
	mov rbx, qword[rbp-24]
	cvtsi2sd xmm7, qword[rbp-32]
	movsd [rbx], xmm7
	mov rax, qword[rbp-48]
	jmp ___int_scansd_pchar.booldouble.__return
.L0x55:
.L0x56:
	inc qword[rbp-8]
	xor rdx, rdx
	lea rbx, [rbp-40]
	mov rsi, rbx
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _int_scanint_pchar.long.bool
	mov qword[rbp-56], rax
	mov rbx, qword[rbp-56]
	mov rsi, rbx
	mov rdi, 10
	call _long_pow_plonglong
	mov dword[rbp-64], eax
	mov r10d, dword[rbp-64]
	mov rbx, qword[rbp-32]
	mov r11d, r10d
	imul rbx, r11
	mov qword[rbp-32], rbx
	mov r10, qword[rbp-40]
	mov rbx, qword[rbp-32]
	add rbx, r10
	cvtsi2sd xmm7, rbx
	movsd qword[rbp-72], xmm7
	mov rbx, qword[rbp-24]
	mov r10d, dword[rbp-64]
	cvtsi2sd xmm7, r10d
	movsd xmm8, qword[rbp-72]
	divsd xmm8, xmm7
	movsd [rbx], xmm8
	mov r10, qword[rbp-56]
	mov rbx, qword[rbp-48]
	add rbx, r10
	mov eax, ebx
	jmp ___int_scansd_pchar.booldouble.__return
___int_scansd_pchar.booldouble.__return:
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
	jz .L0x44
	xor rax, rax
	jmp ___int___SSCANF_pchar.char.void..__return
.L0x44:
.L0x45:
.L0x46:
	mov rbx, qword[rbp-8]
	mov bl, byte[rbx]
	and rbx, 0xff
	cmp bl, 37
	je .L0x49
	inc qword[rbp-8]
	inc qword[rbp-16]
	jmp .L0x4a
.L0x49:
	inc qword[rbp-8]
	mov rbx, qword[rbp-8]
	and r10, 0xff
	mov r10b, byte[rbx]
	mov byte[rbp-40], r10b
	cmp byte[rbp-40], 105
	jne .L0x4b
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
	jmp .L0x4c
.L0x4b:
	cmp byte[rbp-40], 117
	jne .L0x4d
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
	jmp .L0x4e
.L0x4d:
	cmp byte[rbp-40], 99
	jne .L0x4f
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
	jmp .L0x50
.L0x4f:
	cmp byte[rbp-40], 115
	jne .L0x51
	inc qword[rbp-8]
	mov r10d, dword[rbp-32]
	mov rbx, qword[rbp-24]
	and r10, 0x7fffffff
	mov rbx, [rbx+r10*8]
	mov rdx, rbx
	mov rbx, qword[rbp-8]
	and r10, 0xff
	mov r10b, byte[rbx]
	mov sil, r10b
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	call _int_scanstr_pchar.charchar.
	mov rbx, rax
	mov qword[rbp-48], rbx
	mov r10, qword[rbp-48]
	add qword[rbp-16], r10
	jmp .L0x52
.L0x51:
	cmp byte[rbp-40], 102
	sete bl
	cmp byte[rbp-40], 100
	sete r10b
	or bl, r10b
	jz .L0x53
	mov r10d, dword[rbp-32]
	mov rbx, qword[rbp-24]
	and r10, 0x7fffffff
	mov rbx, [rbx+r10*8]
	mov rdx, rbx
	mov rsi, 0
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	call _int_scansd_pchar.booldouble.
	mov rbx, rax
	mov qword[rbp-48], rbx
	mov r10, qword[rbp-48]
	add qword[rbp-16], r10
	inc qword[rbp-8]
	jmp .L0x54
.L0x53:
.L0x54:
.L0x52:
.L0x50:
.L0x4e:
.L0x4c:
	inc dword[rbp-32]
.L0x4a:
.L0x47:
	mov rbx, qword[rbp-8]
	mov bl, byte[rbx]
	and rbx, 0xff
	test bl, bl
	jnz .L0x46
.L0x48:
	mov ebx, dword[rbp-32]
	mov eax, ebx
	jmp ___int___SSCANF_pchar.char.void..__return
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
	call _int___SSCANF_pchar.char.void..
	jmp __sscanf__return
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
	push rdi
	mov rsi, rdi
	mov rdi, 1
	call _int_fputs_pFILEchar.
	mov rbx, rax
	pop rdi
	mov rax, rbx
.L0x43:
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
	jmp ___int_getInt_pchar.__return
___int_getInt_pchar.__return:
	leave
	ret
_uint_getUint_pchar.:
	push rbp
	mov rbp, rsp
	sub rsp, 64
	mov [rbp-8], rdi
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	push rdi
	mov rsi, rdi
	mov rdi, 1
	call _int_fputs_pFILEchar.
	mov rbx, rax
	pop rdi
	mov rax, rbx
.L0x41:
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
	jmp ___uint_getUint_pchar.__return
___uint_getUint_pchar.__return:
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
	jmp ___char_getchar_p__return
___char_getchar_p__return:
	leave
	ret
_int_getHex_pchar.:
	push rbp
	mov rbp, rsp
	sub rsp, 8
	xor rax, rax
	jmp ___int_getHex_pchar.__return
___int_getHex_pchar.__return:
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
	mov rsi, rdi
	mov rdi, 1
	call _int_fputs_pFILEchar.
	mov rbx, rax
	pop rdi
	mov rax, rbx
.L0x3f:
	mov edx, dword[rbp-16]
	mov rbx, qword[rbp-8]
	mov rsi, rbx
	mov rdi, 0
	call _long_fgets_pFILEchar.size_t
___void_getString_pchar.intchar.__return:
	leave
	ret
_int_toInteger_pchar.bool:
	push rbp
	mov rbp, rsp
	sub rsp, 32
	jmp .L0x35
.L0x34:
	inc rdi
.L0x35:
	mov rbx, rdi
	mov bl, byte[rbx]
	and rbx, 0xff
	cmp bl, 32
	je .L0x34
.L0x36:
	mov rbx, rdi
	and r10, 0xff
	mov r10b, byte[rbx]
	mov byte[rbp-8], r10b
	mov dword[rbp-16], 0
	mov byte[rbp-24], 0
	cmp byte[rbp-8], 45
	sete bl
	and bl, sil
	jz .L0x37
	mov byte[rbp-24], 1
	inc rdi
	mov rbx, rdi
	mov bl, byte[rbx]
	and rbx, 0xff
	mov byte[rbp-8], bl
	jmp .L0x38
.L0x37:
.L0x38:
.L0x39:
	mov r10d, 10
	mov ebx, dword[rbp-16]
	imul ebx, r10d
	mov r10b, byte[rbp-8]
	sub r10b, 48
	mov r11b, r10b
	add ebx, r11d
	mov dword[rbp-16], ebx
	inc rdi
	mov rbx, rdi
	mov bl, byte[rbx]
	and rbx, 0xff
	mov byte[rbp-8], bl
.L0x3a:
	mov bl, byte[rbp-8]
	test bl, bl
	setnz bl
	cmp byte[rbp-8], 10
	setne r10b
	and bl, r10b
	cmp byte[rbp-8], 32
	setne r10b
	and bl, r10b
	jnz .L0x39
.L0x3b:
	mov al, byte[rbp-24]
	test al, al
	jz .L0x3c
	xor r10d, r10d
	sub r10d, dword[rbp-16]
	mov eax, r10d
	jmp ___int_toInteger_pchar.bool__return
.L0x3c:
.L0x3d:
	mov ebx, dword[rbp-16]
	mov eax, ebx
	jmp ___int_toInteger_pchar.bool__return
___int_toInteger_pchar.bool__return:
	leave
	ret
__scanf:
	push rbp
	mov rbp, rsp
	sub rsp, 64
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	mov [rbp-24], rdx
	mov qword[rbp-32], 0
	mov qword[rbp-40], 0
	mov qword[rbp-48], 0
.L0x29:
	add qword[rbp-40], 1000
	mov rbx, qword[rbp-40]
	mov rsi, rbx
	mov rdi, qword[rbp-32]
	call _void._realloc_pvoid.size_t
	mov r10, rax
	mov qword[rbp-32], r10
	mov rdx, 1000
	mov r10, qword[rbp-32]
	add r10, qword[rbp-40]
	sub r10, 1000
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
	jge .L0x29
	mov rbx, qword[rbp-16]
	mov rdx, rbx
	mov rbx, qword[rbp-32]
	mov rsi, rbx
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _int___SSCANF_pchar.char.void..
	mov dword[rbp-56], eax
	mov rdi, qword[rbp-32]
	call _void_free_pvoid.
	mov ebx, dword[rbp-56]
	mov eax, ebx
	jmp ____scanf__return
____scanf__return:
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
	lea rbx, [rbx+r10*8]
	mov r11, qword[rbp-24]
	mov [rbx], r11
	mov r10, 2
	lea rbx, [rbp-96] 
	lea rbx, [rbx+r10*8]
	mov r11, qword[rbp-32]
	mov [rbx], r11
	mov r10, 3
	lea rbx, [rbp-96] 
	lea rbx, [rbx+r10*8]
	mov r11, qword[rbp-40]
	mov [rbx], r11
	mov r10, 4
	lea rbx, [rbp-96] 
	lea rbx, [rbx+r10*8]
	mov r11, qword[rbp-48]
	mov [rbx], r11
	mov rdx, 0
	lea rbx, [rbp-96]
	mov rsi, rbx
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call __scanf
	jmp __scanf__return
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
	call __scanf
	jmp __fscanf__return
__fscanf__return:
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
	jz .L0x28__end
	mov eax, [rdi]
	mov [rsi], eax
.L0x28__end:
.L0x27:
	mov rbx, qword[rbp-32]
	and r10, 0x7fffffff
	mov r10d, dword[rbx]
	mov rax, r10
	jmp ___void_mutex_cmpxchg_pmutex.intint__return
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
	mov dword[rbp-16], eax
	mov ebx, dword[rbp-16]
	test ebx, ebx
	jz .L0x16
	jmp .L0x19
.L0x18:
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
	jz .L0x1b
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
.L0x20:
	mov rbx, rax
	pop rdx
	pop rsi
	pop rdi
	mov rax, rbx
	jmp .L0x1e
.L0x1e:
.L0x1b:
.L0x1c:
	mov rdx, 2
	mov rsi, 0
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _void_mutex_cmpxchg_pmutex.intint
	mov rbx, rax
	mov dword[rbp-16], ebx
	mov ebx, dword[rbp-16]
	test ebx, ebx
	jnz .L0x22
	mov rdi, STRING_CONSTANT_173
	push rdi
	mov rsi, rdi
	mov rdi, 1
	call _int_fputs_pFILEchar.
	mov rbx, rax
	pop rdi
	mov rax, rbx
.L0x25:
	jmp .L0x1a
.L0x22:
.L0x23:
.L0x19:
.L0x1a:
.L0x16:
.L0x17:
___void_mlock_pmutex.__return:
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
.L0xa:
	push rax
	mov r10d, 1
	pop rbx
	cmp ebx, r10d
	je .L0xc
	xor rsi, rsi
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	lock xchg dword[rdi], esi
.L0xf:
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
.L0x14:
	mov rbx, rax
	pop rdx
	pop rsi
	pop rdi
	mov rax, rbx
	jmp .L0x12
.L0x12:
.L0xc:
.L0xd:
___void_munlock_pmutex.__return:
	leave
	ret
__thrdext:
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
.L0x7:
____thrdext__return:
	leave
	ret
_long_thrdcrt_pvoid.thread_t.void.:
	push rbp
	mov rbp, rsp
	sub rsp, 8
	mov r15, rdi
	mov r14, rsi
	mov r13, rdx
	call __crtstack
	lea rsi, [rax + 65536 - 8]
	mov rdi, [clone_threadflags]
	mov rax, 56
	syscall
	test rax, rax
	jnz .L0x4__end
	mov rdi, r15
	mov rsi, r14
	mov rdx, r13
	call __enterthread
	mov rdi, rax
	call __thrdext
.L0x4__end:
___long_thrdcrt_pvoid.thread_t.void.__return:
	leave
	ret
__crtstack:
	push rbp
	mov rbp, rsp
	sub rsp, 8
	xor r9, r9
	xor r8, r8
	mov rcx, 16777250
	mov rdx, 3
	mov rsi, 65536
	mov rdi, 0
	mov rax, 9
	mov r10, rcx
	syscall
.L0x1:
	jmp ____crtstack__return
____crtstack__return:
	leave
	ret
__enterthread:
	push rbp
	mov rbp, rsp
	sub rsp, 40
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	mov [rbp-24], rdx
	mov rbx, qword[rbp-24]
	mov rdi, rbx
	call qword[rbp-8]
	mov qword[rbp-32], rax
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	call _void_munlock_pmutex.
	mov rbx, qword[rbp-16]
	mov ebx, dword[rbx]
	and rbx, 0x7fffffff
	mov rsi, rbx
	mov rdi, STRING_CONSTANT_174
	call printf
	mov rbx, qword[rbp-32]
	mov rax, rbx
	jmp ____enterthread__return
____enterthread__return:
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
___void_thread_join_pthread_t.__return:
	leave
	ret
main:
	push rbp
	mov rbp, rsp
	sub rsp, 8
	xor rax, rax
	jmp __main__return
__main__return:
	leave
	ret
	