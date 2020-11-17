
global _char._get_errstr_pint:
global _void._mmap_pvoid.size_tlonglonglongoff_t:
global _void._munmap_pvoid.size_t:
global _void._qmmap_psize_t:
global _bool_all_of_raw_piterablesize_tsize_tvoid.:
global _bool_any_of_raw_piterablesize_tsize_tvoid.:
global _bool_none_of_raw_piterablesize_tsize_tvoid.:
global _double_sqrt_pdouble:
global _double_sqrt_pint:
global _long_sqrt_plong:
global _long_pow_plonglong:
global _double_pow_plonglong:
global _double_pow_pdoublelong:
global _long_round_pdouble:
global _long_ceil_pdouble:
global _long_trunc_pdouble:
global _long_floor_pdouble:
global _long_abs_plong:
global _double_abs_pdouble:
global _long_log_plong:
global _long_log_plonglong:
global _long_log2_plong:
global _double_fmod_pdoubledouble:
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
STRING_CONSTANT_133: db `0123456789abcdef`, 0
STRING_CONSTANT_134: db `False`, 0
STRING_CONSTANT_135: db `True`, 0
STRING_CONSTANT_136: db `/bin/bash`, 0
STRING_CONSTANT_137: db `PATH=/bin:/usr/bin:/sbin:/usr/sbin`, 0
STRING_CONSTANT_138: db `sudo`, 0
STRING_CONSTANT_139: db `-c`, 0
STRING_CONSTANT_140: db `%s:%i: Assertion '%s' failed.\n`, 0
STRING_CONSTANT_141: db `malloc.cb`, 0
STRING_CONSTANT_142: db `block != nullptr`, 0
STRING_CONSTANT_143: db `malloc.cb`, 0
STRING_CONSTANT_144: db `block != nullptr`, 0
STRING_CONSTANT_145: db `=======================\n`, 0
STRING_CONSTANT_146: db `EMPTY\n`, 0
STRING_CONSTANT_147: db `BLOCK: %i @ %x\n`, 0
STRING_CONSTANT_148: db `=======================\n`, 0
STRING_CONSTANT_149: db `malloc.cb`, 0
STRING_CONSTANT_150: db `destsize <= block -> size`, 0
FLT_CONSTANT_2: dq 0x1.6d40000000000p+8
FLT_CONSTANT_3: dq 0x1.6d40000000000p+8
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
__emptyenv: DQ STRING_CONSTANT_137, 0, 0
__systemcallargvconst: DQ STRING_CONSTANT_138, STRING_CONSTANT_139, 0, 0
malloc_maxcache: DQ 128
free_head: DQ 0
cached_size: DQ 0
rand_next: DD 1
mdays: DD 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31
wday_name: DQ STRING_CONSTANT_151, STRING_CONSTANT_152, STRING_CONSTANT_153, STRING_CONSTANT_154, STRING_CONSTANT_155, STRING_CONSTANT_156, STRING_CONSTANT_157
mon_name: DQ STRING_CONSTANT_158, STRING_CONSTANT_159, STRING_CONSTANT_160, STRING_CONSTANT_161, STRING_CONSTANT_162, STRING_CONSTANT_163, STRING_CONSTANT_164, STRING_CONSTANT_165, STRING_CONSTANT_166, STRING_CONSTANT_167, STRING_CONSTANT_168, STRING_CONSTANT_169
asctime__result_buf: DB 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 0
clone_threadflags: DQ 17
	section .bss
	align 16
__tmbuf: resb 36
__internaltime: resb 8
__heap_padding__: resz 1
	section .text
	align 8
	global main
_char._get_errstr_pint:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov [rbp-8], rdi
	mov r10d, 131
	mov ebx, dword[rbp-8]
	cmp ebx, r10d
	setl bl
	xor r11d, r11d
	mov r10d, dword[rbp-8]
	cmp r10d, r11d
	setge r10b
	and bl, r10b
	jz .L0x0
	mov r10d, dword[rbp-8]
	mov rbx, qword[__linux_errstrlist]
	and r10, 0x7fffffff
	lea rbx, [rbx+r10*8]
	mov rbx, qword[rbx]
	mov rax, rbx
	jmp ___char._get_errstr_pint__return
	jmp .L0x1
.L0x0:
.L0x1:
	mov rbx, STRING_CONSTANT_132
	mov rax, STRING_CONSTANT_132
	jmp ___char._get_errstr_pint__return
___char._get_errstr_pint__return:
	leave
	ret
_void._mmap_pvoid.size_tlonglonglongoff_t:
	push rbp
	mov rbp, rsp
	sub rsp, 56
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	mov [rbp-24], rdx
	mov [rbp-32], rcx
	mov [rbp-40], r8
	mov [rbp-48], r9
	mov rax, 9
	mov r10, rcx
	syscall
___void._mmap_pvoid.size_tlonglonglongoff_t__return:
	leave
	ret
_void._munmap_pvoid.size_t:
	push rbp
	mov rbp, rsp
	sub rsp, 24
	mov [rbp-8], rdi
	mov [rbp-16], rsi
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
	xor r9, r9
	xor r8, r8
	mov rcx, 34
	mov rdx, 3
	mov rbx, qword[rbp-8]
	mov rsi, rbx
	xor rdi, rdi
	xor rax, rax
	call _void._mmap_pvoid.size_tlonglonglongoff_t
	jmp ___void._qmmap_psize_t__return
___void._qmmap_psize_t__return:
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
	mov r10, qword[rbp-8]
	mov qword[rbp-40], r10
	jmp .L0x5
.L0x4:
	push rbx
	mov r10, qword[rbp-40]
	mov r11, qword[r10]
	mov rdi, r11
	xor rax, rax
	call qword[rbp-32]
	mov r10, rax
	pop rbx
	mov rax, r10
	test r10, r10
	jne .L0x8
	xor rax, rax
	jmp ___bool_all_of_raw_piterablesize_tsize_tvoid.__return
	jmp .L0x9
.L0x8:
.L0x9:
.L0x6:
	mov r11, qword[rbp-16]
	add qword[rbp-40], r11
.L0x5:
	mov r11, rbx
	mov r10, qword[rbp-40]
	cmp r10, r11
	jl .L0x4
.L0x7:
	mov rax, 1
	jmp ___bool_all_of_raw_piterablesize_tsize_tvoid.__return
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
	mov r10, qword[rbp-8]
	mov qword[rbp-40], r10
	jmp .L0xb
.L0xa:
	push rbx
	mov r10, qword[rbp-40]
	mov r11, qword[r10]
	mov rdi, r11
	xor rax, rax
	call qword[rbp-32]
	mov r10, rax
	pop rbx
	mov rax, r10
	test r10, r10
	jz .L0xe
	mov rax, 1
	jmp ___bool_any_of_raw_piterablesize_tsize_tvoid.__return
	jmp .L0xf
.L0xe:
.L0xf:
.L0xc:
	mov r11, qword[rbp-16]
	add qword[rbp-40], r11
.L0xb:
	mov r11, rbx
	mov r10, qword[rbp-40]
	cmp r10, r11
	jl .L0xa
.L0xd:
	xor rax, rax
	jmp ___bool_any_of_raw_piterablesize_tsize_tvoid.__return
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
	mov r10, qword[rbp-8]
	mov qword[rbp-40], r10
	jmp .L0x11
.L0x10:
	push rbx
	mov r10, qword[rbp-40]
	mov r11, qword[r10]
	mov rdi, r11
	xor rax, rax
	call qword[rbp-32]
	mov r10, rax
	pop rbx
	mov rax, r10
	test r10, r10
	jz .L0x14
	xor rax, rax
	jmp ___bool_none_of_raw_piterablesize_tsize_tvoid.__return
	jmp .L0x15
.L0x14:
.L0x15:
.L0x12:
	mov r11, qword[rbp-16]
	add qword[rbp-40], r11
.L0x11:
	mov r11, rbx
	mov r10, qword[rbp-40]
	cmp r10, r11
	jl .L0x10
.L0x13:
	mov rax, 1
	jmp ___bool_none_of_raw_piterablesize_tsize_tvoid.__return
___bool_none_of_raw_piterablesize_tsize_tvoid.__return:
	leave
	ret
_double_sqrt_pdouble:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	movsd [rbp-8], xmm0
	sqrtsd xmm0, xmm0
___double_sqrt_pdouble__return:
	leave
	ret
_double_sqrt_pint:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov [rbp-8], rdi
	cvtsi2sd xmm0, rdi
	sqrtsd xmm0, xmm0
___double_sqrt_pint__return:
	leave
	ret
_long_sqrt_plong:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov [rbp-8], rdi
	cvtsi2sd xmm0, rdi
	sqrtsd xmm0, xmm0
	cvttsd2si rax, xmm0
___long_sqrt_plong__return:
	leave
	ret
_long_pow_plonglong:
	push rbp
	mov rbp, rsp
	sub rsp, 24
	mov [rbp-8], rdi
	mov [rbp-16], rsi
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
	xor rax, rax
	call _long_pow_plonglong
	cvtsi2sd xmm0, rax
___double_pow_plonglong__return:
	leave
	ret
_double_pow_pdoublelong:
	push rbp
	mov rbp, rsp
	sub rsp, 24
	movsd [rbp-8], xmm0
	mov [rbp-16], rdi
	dec rdi
_double_pow_pdoubleint_flp:
	mulsd xmm0, xmm0
	dec rdi
	jnz _int_pow_pintint_flp
___double_pow_pdoublelong__return:
	leave
	ret
_long_round_pdouble:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	movsd [rbp-8], xmm0
	cvtsd2si rax, xmm0
___long_round_pdouble__return:
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
	mov rax, 1
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
_long_trunc_pdouble:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	movsd [rbp-8], xmm0
	cvttsd2si rax, xmm0
___long_trunc_pdouble__return:
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
	mov rax, 1
	call _long_round_pdouble
	jmp ___long_floor_pdouble__return
___long_floor_pdouble__return:
	leave
	ret
_long_abs_plong:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov [rbp-8], rdi
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
	sub rsp, 16
	movsd [rbp-8], xmm0
	movq rax, xmm0
	shr rax, 1
	shl rax, 1
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
	xor rax, rax
	call _long_log2_plong
	push rax
	mov r10, 3
	pop rbx
	xor rdx, rdx
	mov rax, rbx
	idiv r10
	mov rbx, rax
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
	xor rax, rax
	call _long_log2_plong
	push rax
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	xor rax, rax
	call _long_log2_plong
	mov r10, rax
	pop rbx
	xor rdx, rdx
	mov rax, rbx
	idiv r10
	mov rbx, rax
	jmp ___long_log_plonglong__return
___long_log_plonglong__return:
	leave
	ret
_long_log2_plong:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov [rbp-8], rdi
	xor rax, rax
.L0x20_long_lop2_plong_flp:
	sar rdi, 1
	inc rax
	test rdi, rdi
	jnz .L0x20_long_lop2_plong_flp
	dec rax
___long_log2_plong__return:
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
	mov rax, 1
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
_int_strcpy_pchar.char.:
	push rbp
	mov rbp, rsp
	sub rsp, 24
	mov [rbp-8], rdi
	mov [rbp-16], rsi
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
	sub rsp, 16
	mov [rbp-8], rdi
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
	sub rsp, 32
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	mov [rbp-24], rdx
	mov r11, qword[rbp-8]
	mov r10, qword[rbp-24]
	add r11, r10
	mov rbx, r11
	jmp .L0x24
.L0x23:
	mov r10, qword[rbp-8]
	mov r10b, byte[r10]
	and r10, 0xff
	mov r11b, byte[rbp-16]
	cmp r10b, r11b
	jne .L0x26
	mov r10, qword[rbp-8]
	mov rax, r10
	jmp ___char._memchr_pchar.charsize_t__return
	jmp .L0x27
.L0x26:
.L0x27:
	inc qword[rbp-8]
.L0x24:
	mov r11, qword[rbp-8]
	mov r10, rbx
	cmp r11, r10
	jl .L0x23
.L0x25:
	xor rax, rax
	jmp ___char._memchr_pchar.charsize_t__return
___char._memchr_pchar.charsize_t__return:
	leave
	ret
_int_memcmp_pchar.char.size_t:
	push rbp
	mov rbp, rsp
	sub rsp, 32
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	mov [rbp-24], rdx
	xor ebx, ebx
	mov r12, qword[rbp-8]
	mov r11, qword[rbp-24]
	add r12, r11
	mov r10, r12
	jmp .L0x29
.L0x28:
	mov r11, qword[rbp-8]
	mov r12, qword[rbp-16]
	mov r11b, byte[r11]
	and r11, 0xff
	mov r12b, byte[r12]
	and r12, 0xff
	cmp r11b, r12b
	jge .L0x2b
	dec ebx
	jmp .L0x2c
.L0x2b:
	inc ebx
.L0x2c:
	inc qword[rbp-8]
	inc qword[rbp-16]
.L0x29:
	mov r12, qword[rbp-8]
	mov r11, r10
	cmp r12, r11
	jl .L0x28
.L0x2a:
	mov r11d, ebx
	mov eax, ebx
	jmp ___int_memcmp_pchar.char.size_t__return
___int_memcmp_pchar.char.size_t__return:
	leave
	ret
_char._strchr_pchar.char:
	push rbp
	mov rbp, rsp
	sub rsp, 24
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	jmp .L0x2e
.L0x2d:
	mov rbx, qword[rbp-8]
	mov bl, byte[rbx]
	and rbx, 0xff
	mov r10b, byte[rbp-16]
	cmp bl, r10b
	jne .L0x30
	mov rbx, qword[rbp-8]
	mov rax, rbx
	jmp ___char._strchr_pchar.char__return
	jmp .L0x31
.L0x30:
.L0x31:
	inc qword[rbp-8]
.L0x2e:
	mov rbx, qword[rbp-8]
	mov bl, byte[rbx]
	and rbx, 0xff
	jnz .L0x2d
.L0x2f:
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
	xor r10, r10
	mov rbx, qword[rbp-8]
	cmp rbx, r10
	jl .L0x32
	mov rdi, qword[rbp-8]
	xor rax, rax
	call _char._get_errstr_pint
	jmp ___char._strerror_plong__return
	jmp .L0x33
.L0x32:
	xor r10, r10
	mov rbx, qword[rbp-8]
	sub r10, rbx
	mov edi, r10d
	xor rax, rax
	call _char._get_errstr_pint
	jmp ___char._strerror_plong__return
.L0x33:
	xor rax, rax
	jmp ___char._strerror_plong__return
___char._strerror_plong__return:
	leave
	ret
_long_toStr_plongchar.boollong:
	push rbp
	mov rbp, rsp
	sub rsp, 144
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	mov [rbp-24], rdx
	mov [rbp-32], rcx
	mov rbx, qword[rbp-8]
	test rbx, rbx
	jnz .L0x34
	mov rbx, qword[rbp-16]
	mov byte[rbx], 48
	mov rax, 1
	jmp ___long_toStr_plongchar.boollong__return
	jmp .L0x35
.L0x34:
.L0x35:
	mov byte[rbp-40], 0
	xor r10, r10
	mov rbx, qword[rbp-8]
	cmp rbx, r10
	setl bl
	mov r10b, byte[rbp-24]
	and bl, r10b
	jz .L0x36
	mov rbx, qword[rbp-16]
	mov byte[rbx], 45
	inc qword[rbp-16]
	xor r10, r10
	mov rbx, qword[rbp-8]
	sub r10, rbx
	mov qword[rbp-8], r10
	mov byte[rbp-40], 1
	jmp .L0x37
.L0x36:
.L0x37:
	mov rdx, 64
	xor rsi, rsi
	lea rbx, [rbp-112]
	mov rdi, rbx
	xor rax, rax
	call _void_memset_pvoid.ucharsize_t
	mov qword[rbp-120], 0
	jmp .L0x39
.L0x38:
	lea rbx, [rbp-128]
	mov rdx, rbx
	mov rbx, qword[rbp-32]
	mov rsi, rbx
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	xor rax, rax
	mov rbx, rdx
	xor rdx, rdx
	mov rax, rdi
	div rsi
	mov [rbx], rdx
.L0x3c:
	mov r10, rax
	mov qword[rbp-8], r10
	mov r10, qword[rbp-120]
	lea rbx, [rbp-112] 
	lea rbx, [rbx+r10*1]
	mov r11, qword[rbp-128]
	mov r10, __numbercharactersbase1016
	lea r10, [r10+r11*1]
	mov r10b, byte[r10]
	and r10, 0xff
	mov [rbx], r10b
	inc qword[rbp-120]
.L0x39:
	mov rbx, qword[rbp-8]
	test rbx, rbx
	jnz .L0x38
.L0x3a:
	mov rbx, qword[rbp-120]
	mov dword[rbp-136], ebx
	jmp .L0x3f
.L0x3e:
	mov r10d, dword[rbp-136]
	mov rbx, qword[rbp-16]
	and r10, 0x7fffffff
	lea rbx, [rbx+r10*1]
	mov r11d, dword[rbp-136]
	mov r10, qword[rbp-120]
	mov r12d, r11d
	sub r10, r12
	lea r11, [rbp-112] 
	lea r11, [r11+r10*1]
	mov r11b, byte[r11]
	and r11, 0xff
	mov [rbx], r11b
.L0x40:
	dec dword[rbp-136]
.L0x3f:
	xor r10d, r10d
	mov ebx, dword[rbp-136]
	cmp ebx, r10d
	jg .L0x3e
.L0x41:
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
_long_toStr_pdoublechar.long:
	push rbp
	mov rbp, rsp
	sub rsp, 48
	movsd [rbp-8], xmm0
	mov [rbp-16], rdi
	mov [rbp-24], rsi
	cvttsd2si rbx, qword[rbp-8]
	mov qword[rbp-32], rbx
	mov rcx, 10
	mov rdx, 1
	mov rbx, qword[rbp-16]
	mov rsi, rbx
	mov rbx, qword[rbp-32]
	mov rdi, rbx
	xor rax, rax
	call _long_toStr_plongchar.boollong
	mov qword[rbp-40], rax
	mov r10, qword[rbp-40]
	add qword[rbp-16], r10
	movsd xmm7, qword[rbp-8]
	movsd xmm0, xmm7
	mov rax, 1
	call _double_abs_pdouble
	movq rax, xmm0
	movsd xmm8, xmm0
	movsd qword[rbp-8], xmm8
	mov rbx, qword[rbp-32]
	mov rdi, rbx
	xor rax, rax
	call _long_abs_plong
	mov rbx, rax
	movsd xmm7, qword[rbp-8]
	cvtsi2sd xmm8, rbx
	subsd xmm7, xmm8
	movsd qword[rbp-8], xmm7
	mov rbx, qword[rbp-24]
	movsd xmm7, qword[rbp-8]
	cvtsi2sd xmm8, rbx
	mulsd xmm7, xmm8
	movsd qword[rbp-8], xmm7
	mov rbx, qword[rbp-16]
	mov byte[rbx], 46
	inc qword[rbp-16]
	mov rcx, 10
	xor rdx, rdx
	mov rbx, qword[rbp-16]
	mov rsi, rbx
	movsd xmm7, qword[rbp-8]
	movsd xmm0, xmm7
	mov rax, 1
	call _long_round_pdouble
	mov rdi, rax
	xor rax, rax
	call _long_toStr_plongchar.boollong
	mov r10, rax
	add qword[rbp-40], r10
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
	sub rsp, 192
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
	jz .L0x42
	xor rax, rax
	jmp ___int___sprintf_pchar.char.void.__return
	jmp .L0x43
.L0x42:
.L0x43:
	jmp .L0x45
.L0x44:
	mov rbx, qword[rbp-16]
	mov bl, byte[rbx]
	and rbx, 0xff
	mov r10b, 37
	cmp bl, r10b
	je .L0x47
	mov rbx, qword[rbp-8]
	mov r10, qword[rbp-16]
	mov r10b, byte[r10]
	and r10, 0xff
	mov [rbx], r10b
	jmp .L0x48
.L0x47:
	inc qword[rbp-16]
	mov rbx, qword[rbp-16]
	and r10, 0xff
	mov r10b, byte[rbx]
	mov byte[rbp-48], r10b
	cmp byte[rbp-48], 105
	je .L0x4a
	cmp byte[rbp-48], 99
	je .L0x4b
	cmp byte[rbp-48], 120
	je .L0x4c
	cmp byte[rbp-48], 111
	je .L0x4d
	cmp byte[rbp-48], 117
	je .L0x4e
	cmp byte[rbp-48], 115
	je .L0x4f
	cmp byte[rbp-48], 98
	je .L0x50
	cmp byte[rbp-48], 100
	je .L0x53
	cmp byte[rbp-48], 102
	je .L0x54
	jmp .L0x49
.L0x4a:
	mov r10d, dword[rbp-32]
	mov rbx, qword[rbp-24]
	and r10, 0x7fffffff
	lea rbx, [rbx+r10*8]
	mov rbx, qword[rbx]
	mov qword[rbp-56], rbx
	mov rcx, 10
	mov rdx, 1
	mov rbx, qword[rbp-8]
	mov rsi, rbx
	mov rbx, qword[rbp-56]
	mov rdi, rbx
	xor rax, rax
	call _long_toStr_plongchar.boollong
	mov qword[rbp-64], rax
	mov rbx, qword[rbp-64]
	dec rbx
	add qword[rbp-8], rbx
	jmp .L0x49
.L0x4b:
	mov r10d, dword[rbp-32]
	mov rbx, qword[rbp-24]
	and r10, 0x7fffffff
	lea rbx, [rbx+r10*8]
	mov rbx, qword[rbx]
	mov r10, rbx
	and r11b, 0xff
	mov r11, r10
	mov byte[rbp-72], r11b
	mov rbx, qword[rbp-8]
	mov r11b, byte[rbp-72]
	mov [rbx], r11b
	jmp .L0x49
.L0x4c:
	mov r10d, dword[rbp-32]
	mov rbx, qword[rbp-24]
	and r10, 0x7fffffff
	lea rbx, [rbx+r10*8]
	mov rbx, qword[rbx]
	mov qword[rbp-80], rbx
	mov rcx, 16
	xor rdx, rdx
	mov rbx, qword[rbp-8]
	mov rsi, rbx
	mov rbx, qword[rbp-80]
	mov rdi, rbx
	xor rax, rax
	call _long_toStr_plongchar.boollong
	mov qword[rbp-88], rax
	mov rbx, qword[rbp-88]
	dec rbx
	add qword[rbp-8], rbx
	jmp .L0x49
.L0x4d:
	mov r10d, dword[rbp-32]
	mov rbx, qword[rbp-24]
	and r10, 0x7fffffff
	lea rbx, [rbx+r10*8]
	mov rbx, qword[rbx]
	mov qword[rbp-96], rbx
	mov rcx, 8
	xor rdx, rdx
	mov rbx, qword[rbp-8]
	mov rsi, rbx
	mov rbx, qword[rbp-96]
	mov rdi, rbx
	xor rax, rax
	call _long_toStr_plongchar.boollong
	mov qword[rbp-104], rax
	mov rbx, qword[rbp-104]
	dec rbx
	add qword[rbp-8], rbx
	jmp .L0x49
.L0x4e:
	mov r10d, dword[rbp-32]
	mov rbx, qword[rbp-24]
	and r10, 0x7fffffff
	lea rbx, [rbx+r10*8]
	mov rbx, qword[rbx]
	mov qword[rbp-112], rbx
	mov rcx, 10
	xor rdx, rdx
	mov rbx, qword[rbp-8]
	mov rsi, rbx
	mov rbx, qword[rbp-112]
	mov rdi, rbx
	xor rax, rax
	call _long_toStr_plongchar.boollong
	mov dword[rbp-120], eax
	mov ebx, dword[rbp-120]
	dec ebx
	mov r10d, ebx
	add qword[rbp-8], r10
	jmp .L0x49
.L0x4f:
	mov r10d, dword[rbp-32]
	mov rbx, qword[rbp-24]
	and r10, 0x7fffffff
	lea rbx, [rbx+r10*8]
	mov rbx, qword[rbx]
	mov rsi, rbx
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	xor rax, rax
	call _int_strcpy_pchar.char.
	mov dword[rbp-128], eax
	mov ebx, dword[rbp-128]
	dec ebx
	mov r10d, ebx
	add qword[rbp-8], r10
	jmp .L0x49
.L0x50:
	mov r10d, dword[rbp-32]
	mov rbx, qword[rbp-24]
	and r10, 0x7fffffff
	lea rbx, [rbx+r10*8]
	mov rbx, qword[rbx]
	mov byte[rbp-136], bl
	mov rbx, STRING_CONSTANT_134
	mov qword[rbp-144], rbx
	mov al, byte[rbp-136]
	test al, al
	jz .L0x51
	mov r10, STRING_CONSTANT_135
	mov qword[rbp-144], r10
	jmp .L0x52
.L0x51:
.L0x52:
	mov rbx, qword[rbp-144]
	mov rsi, rbx
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	xor rax, rax
	call _int_strcpy_pchar.char.
	mov dword[rbp-152], eax
	mov ebx, dword[rbp-152]
	add qword[rbp-8], rbx
	jmp .L0x49
.L0x53:
	mov r10d, dword[rbp-32]
	mov rbx, qword[rbp-24]
	and r10, 0x7fffffff
	lea rbx, [rbx+r10*8]
	mov rbx, qword[rbx]
	movq xmm7, rbx
	movsd qword[rbp-160], xmm7
	mov rsi, 1000000000
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	movsd xmm7, qword[rbp-160]
	movsd xmm0, xmm7
	mov rax, 1
	call _long_toStr_pdoublechar.long
	mov dword[rbp-168], eax
	mov ebx, dword[rbp-168]
	dec ebx
	mov r10d, ebx
	add qword[rbp-8], r10
	jmp .L0x49
.L0x54:
	mov r10d, dword[rbp-32]
	mov rbx, qword[rbp-24]
	and r10, 0x7fffffff
	lea rbx, [rbx+r10*8]
	mov rbx, qword[rbx]
	movq xmm7, rbx
	movsd qword[rbp-176], xmm7
	mov rsi, 10000000
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	movsd xmm7, qword[rbp-176]
	movsd xmm0, xmm7
	mov rax, 1
	call _long_toStr_pdoublechar.long
	mov dword[rbp-184], eax
	mov ebx, dword[rbp-184]
	dec ebx
	mov r10d, ebx
	add qword[rbp-8], r10
	jmp .L0x49
.L0x49:
	inc dword[rbp-32]
.L0x48:
	inc qword[rbp-16]
	inc qword[rbp-8]
.L0x45:
	mov rbx, qword[rbp-16]
	mov bl, byte[rbx]
	and rbx, 0xff
	jnz .L0x44
.L0x46:
	mov r10, qword[rbp-8]
	mov rbx, qword[rbp-40]
	sub r10, rbx
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
	xor rax, rax
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
	je .L0x56
	cmp qword[rbp-24], 119
	je .L0x57
	cmp qword[rbp-24], 97
	je .L0x58
	cmp qword[rbp-24], 157
	je .L0x59
	cmp qword[rbp-24], 162
	je .L0x5a
	cmp qword[rbp-24], 140
	je .L0x5b
	jmp .L0x55
.L0x56:
	mov qword[rbp-40], 0
	jmp .L0x55
.L0x57:
	mov qword[rbp-40], 1
	jmp .L0x55
.L0x58:
	mov qword[rbp-40], 1
	jmp .L0x55
.L0x59:
	mov qword[rbp-40], 2
	jmp .L0x55
.L0x5a:
	mov qword[rbp-40], 2
	jmp .L0x55
.L0x5b:
	mov qword[rbp-40], 2
	jmp .L0x55
.L0x55:
	mov rbx, qword[rbp-32]
	mov rdx, rbx
	mov rsi, qword[rbp-40]
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	xor rax, rax
	mov rax , 2 
	mov r10 , rcx 
	syscall 
.L0x5d:
	mov qword[rbp-48], rax
	mov r10, 140
	mov rbx, qword[rbp-24]
	cmp rbx, r10
	sete bl
	mov r11, 97
	mov r10, qword[rbp-24]
	cmp r10, r11
	sete r10b
	or bl, r10b
	jz .L0x5f
	mov rdx, 2
	xor rsi, rsi
	mov rdi, qword[rbp-48]
	xor rax, rax
	mov rax , 8 
	mov r10 , rcx 
	syscall 
.L0x62:
	jmp .L0x60
.L0x5f:
.L0x60:
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
	xor rax, rax
	call _size_t_strlen_pchar.
	mov qword[rbp-24], rax
	mov rbx, qword[rbp-24]
	mov rdx, rbx
	mov rbx, qword[rbp-16]
	mov rsi, rbx
	mov rdi, qword[rbp-8]
	xor rax, rax
	mov rax , 1 
	mov r10 , rcx 
	syscall 
.L0x65:
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
	xor rax, rax
	mov rax , 0 
	mov r10 , rcx 
	syscall 
.L0x68:
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
	xor rsi, rsi
	mov rdi, qword[rbp-8]
	xor rax, rax
	mov rax , 8 
	mov r10 , rcx 
	syscall 
.L0x6b:
	mov dword[rbp-16], eax
	mov rdx, 2
	xor r10d, r10d
	mov ebx, dword[rbp-16]
	sub r10d, ebx
	mov esi, r10d
	mov rdi, qword[rbp-8]
	xor rax, rax
	mov rax , 8 
	mov r10 , rcx 
	syscall 
.L0x6e:
	mov edi, dword[rbp-16]
	xor rax, rax
	call _void._malloc_psize_t
	mov qword[rbp-24], rax
	mov edx, dword[rbp-16]
	mov rbx, qword[rbp-24]
	mov rsi, rbx
	mov rdi, qword[rbp-8]
	xor rax, rax
	mov rax , 0 
	mov r10 , rcx 
	syscall 
.L0x71:
	mov qword[rbp-32], rax
	xor r10, r10
	mov rbx, qword[rbp-32]
	cmp rbx, r10
	jge .L0x73
	mov rax, qword[rbp-32]
	jmp ___void._floads_pFILE__return
	jmp .L0x74
.L0x73:
.L0x74:
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
	xor rax, rax
	call _void._malloc_psize_t
	mov qword[rbp-32], rax
	mov rbx, qword[rbp-16]
	mov rdx, rbx
	mov rbx, qword[rbp-8]
	mov rsi, rbx
	mov rbx, qword[rbp-32]
	mov rdi, rbx
	xor rax, rax
	call _int___sprintf_pchar.char.void.
	mov dword[rbp-40], eax
	mov edx, dword[rbp-40]
	mov rbx, qword[rbp-32]
	mov rsi, rbx
	mov rbx, qword[rbp-24]
	mov rdi, rbx
	xor rax, rax
	mov rax , 1 
	mov r10 , rcx 
	syscall 
.L0x76:
	mov rdi, qword[rbp-32]
	xor rax, rax
	call _void_free_pvoid.
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
	xor rax, rax
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
	xor rax, rax
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
	xor rax, rax
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
	mov rbx, qword[__emptyenv]
	mov rdx, rbx
	mov rbx, qword[rbp-16]
	mov rsi, rbx
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	xor rax, rax
	mov rax , 59 
	mov r10 , rcx 
	syscall 
.L0x79:
	jmp ___long_execl_pchar.char..__return
___long_execl_pchar.char..__return:
	leave
	ret
_long_system_pchar.:
	push rbp
	mov rbp, rsp
	sub rsp, 32
	mov [rbp-8], rdi
	xor rax, rax
	mov rax , 57 
	mov r10 , rcx 
	syscall 
.L0x7c:
	mov qword[rbp-16], rax
	mov rbx, qword[rbp-16]
	test rbx, rbx
	jnz .L0x7e
	mov r10b, 2
	mov rbx, qword[__systemcallargvconst]
	and r10, 0xff
	lea rbx, [rbx+r10*8]
	mov r11, qword[rbp-8]
	mov [rbx], r11
	mov rbx, qword[__systemcallargvconst]
	mov rsi, rbx
	mov rbx, __systembashpath
	mov rdi, __systembashpath
	xor rax, rax
	call _long_execl_pchar.char..
	mov qword[rbp-24], rax
	mov rbx, qword[rbp-24]
	mov rdi, rbx
	xor rax, rax
	call _char._strerror_plong
	mov rdi, rax
	xor rax, rax
	push rdi
	mov rbx, rdi
	mov rsi, rdi
	mov rdi, 1
	xor rax, rax
	call _int_fputs_pFILEchar.
	mov rbx, rax
	pop rdi
	mov rax, rbx
.L0x81:
	jmp .L0x7f
.L0x7e:
.L0x7f:
	xor rdx, rdx
	xor rsi, rsi
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	xor rax, rax
	mov rax, 61
	xor r8, r8
	syscall
.L0x83:
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
	mov bl, byte[rbp-8]
	test bl, bl
	jne .L0x85
	mov rcx, qword[rbp-32]
	mov edx, dword[rbp-24]
	mov rsi, qword[rbp-16]
	mov rbx, STRING_CONSTANT_140
	mov rdi, STRING_CONSTANT_140
	xor rax, rax
	call eprintf
	mov rdi, 1
	xor rax, rax
	mov rax , 60 
	mov r10 , rcx 
	syscall 
.L0x88:
	jmp .L0x86
.L0x85:
.L0x86:
___void___assert_pboolchar.intchar.__return:
	leave
	ret
_void_remove_block_pmblock.:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov [rbp-8], rdi
	mov rbx, STRING_CONSTANT_142
	mov rcx, STRING_CONSTANT_142
	mov rdx, 60
	mov rbx, STRING_CONSTANT_141
	mov rsi, STRING_CONSTANT_141
	mov rbx, qword[rbp-8]
	test rbx, rbx
	setnz bl
	mov dil, bl
	xor rax, rax
	call _void___assert_pboolchar.intchar.
	mov rbx, qword[rbp-8]
	mov rbx, qword[rbx]
	sub qword[cached_size], rbx
	mov r10, qword[free_head]
	mov rbx, qword[rbp-8]
	cmp rbx, r10
	jne .L0x8a
	mov rbx, qword[rbp-8]
	lea rbx, [rbx+8]
	mov rbx, qword[rbx]
	mov r10, rbx
	mov qword[free_head], r10
	jmp .L0x8b
.L0x8a:
.L0x8b:
	mov rbx, qword[rbp-8]
	lea rbx, [rbx+8]
	mov rbx, qword[rbx]
	test rbx, rbx
	jz .L0x8c
	mov rbx, qword[rbp-8]
	lea rbx, [rbx+8]
	mov r10, rbx
	lea r10, [r10+24]
	mov rbx, qword[rbp-8]
	lea rbx, [rbx+24]
	mov rbx, qword[rbx]
	mov [r10], rbx
	jmp .L0x8d
.L0x8c:
.L0x8d:
	mov rbx, qword[rbp-8]
	lea rbx, [rbx+24]
	mov rbx, qword[rbx]
	test rbx, rbx
	jz .L0x8e
	mov rbx, qword[rbp-8]
	lea rbx, [rbx+24]
	mov r10, rbx
	lea r10, [r10+8]
	mov rbx, qword[rbp-8]
	lea rbx, [rbx+8]
	mov rbx, qword[rbx]
	mov [r10], rbx
	jmp .L0x8f
.L0x8e:
.L0x8f:
	mov rbx, qword[rbp-8]
	lea rbx, [rbx+24]
	mov qword[rbx], 0
	mov rbx, qword[rbp-8]
	lea rbx, [rbx+8]
	mov qword[rbx], 0
___void_remove_block_pmblock.__return:
	leave
	ret
_bool_scan_merge_pmblock.:
	push rbp
	mov rbp, rsp
	sub rsp, 24
	mov [rbp-8], rdi
	mov r10, qword[malloc_maxcache]
	mov rbx, qword[cached_size]
	cmp rbx, r10
	jle .L0x90
	mov rbx, qword[rbp-8]
	mov rbx, qword[rbx]
	sub qword[cached_size], rbx
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	xor rax, rax
	push rdi
	mov rbx, rdi
	lea rbx, [rbx+0]
	mov rbx, qword[rbx]
	add rbx, 32
	mov rsi, rbx
	xor rax, rax
	call _void._munmap_pvoid.size_t
	mov rbx, rax
	pop rdi
	mov rax, rbx
	jmp .L0x93
.L0x93:
	xor rax, rax
	jmp ___bool_scan_merge_pmblock.__return
	jmp .L0x91
.L0x90:
.L0x91:
	mov rbx, qword[free_head]
	mov qword[rbp-16], rbx
	jmp .L0x95
.L0x94:
	mov rbx, qword[rbp-8]
	mov rbx, qword[rbx]
	mov r10, qword[rbp-8]
	add r10, rbx
	add r10, 32
	mov rbx, qword[rbp-16]
	cmp r10, rbx
	jne .L0x98
	jmp .L0x99
.L0x98:
.L0x99:
.L0x96:
	mov rbx, qword[rbp-16]
	lea rbx, [rbx+8]
	mov rbx, qword[rbx]
	mov r10, rbx
	mov qword[rbp-16], r10
.L0x95:
	mov rbx, qword[rbp-16]
	lea rbx, [rbx+8]
	mov rbx, qword[rbx]
	test rbx, rbx
	jnz .L0x94
.L0x97:
	mov rax, 1
	jmp ___bool_scan_merge_pmblock.__return
___bool_scan_merge_pmblock.__return:
	leave
	ret
_void_simple_add_pmblock.:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov [rbp-8], rdi
	mov rbx, qword[free_head]
	test rbx, rbx
	jnz .L0x9a
	mov r10, qword[rbp-8]
	mov qword[free_head], r10
	jmp ___void_simple_add_pmblock.__return
	jmp .L0x9b
.L0x9a:
.L0x9b:
	mov rbx, qword[free_head]
	lea rbx, [rbx+24]
	mov r10, qword[rbp-8]
	mov [rbx], r10
	mov rbx, qword[rbp-8]
	lea rbx, [rbx+8]
	mov r10, qword[free_head]
	mov [rbx], r10
	mov r10, qword[rbp-8]
	mov qword[free_head], r10
___void_simple_add_pmblock.__return:
	leave
	ret
_void_add_block_pmblock.:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov [rbp-8], rdi
	mov rbx, STRING_CONSTANT_144
	mov rcx, STRING_CONSTANT_144
	mov rdx, 129
	mov rbx, STRING_CONSTANT_143
	mov rsi, STRING_CONSTANT_143
	mov rbx, qword[rbp-8]
	test rbx, rbx
	setnz bl
	mov dil, bl
	xor rax, rax
	call _void___assert_pboolchar.intchar.
	mov rbx, qword[rbp-8]
	mov rbx, qword[rbx]
	add qword[cached_size], rbx
	mov rbx, qword[free_head]
	test rbx, rbx
	jnz .L0x9c
	mov r10, qword[rbp-8]
	mov qword[free_head], r10
	jmp ___void_add_block_pmblock.__return
	jmp .L0x9d
.L0x9c:
.L0x9d:
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	xor rax, rax
	call _bool_scan_merge_pmblock.
	mov rbx, rax
	test bl, bl
	jz .L0x9e
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	xor rax, rax
	call _void_simple_add_pmblock.
	jmp .L0x9f
.L0x9e:
.L0x9f:
___void_add_block_pmblock.__return:
	leave
	ret
_mblock._scan_existing_psize_t:
	push rbp
	mov rbp, rsp
	sub rsp, 24
	mov [rbp-8], rdi
	mov rbx, qword[free_head]
	test rbx, rbx
	jnz .L0xa0
	xor rax, rax
	jmp ___mblock._scan_existing_psize_t__return
	jmp .L0xa1
.L0xa0:
.L0xa1:
	mov rbx, qword[free_head]
	mov qword[rbp-16], rbx
	jmp .L0xa3
.L0xa2:
	mov rbx, qword[rbp-16]
	mov rbx, qword[rbx]
	mov r10, qword[rbp-8]
	cmp rbx, r10
	jl .L0xa6
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	xor rax, rax
	call _void_remove_block_pmblock.
	mov rbx, qword[rbp-8]
	mov rsi, rbx
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	xor rax, rax
	call _void_split_block_pmblock.size_t
	mov rbx, qword[rbp-16]
	mov rax, rbx
	jmp ___mblock._scan_existing_psize_t__return
	jmp .L0xa7
.L0xa6:
.L0xa7:
.L0xa4:
	mov rbx, qword[rbp-16]
	lea rbx, [rbx+8]
	mov rbx, qword[rbx]
	mov r10, rbx
	mov qword[rbp-16], r10
.L0xa3:
	mov rbx, qword[rbp-16]
	lea rbx, [rbx+8]
	mov rbx, qword[rbx]
	test rbx, rbx
	jnz .L0xa2
.L0xa5:
	xor rax, rax
	jmp ___mblock._scan_existing_psize_t__return
___mblock._scan_existing_psize_t__return:
	leave
	ret
_void_printstate_p:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov rbx, STRING_CONSTANT_145
	mov rdi, STRING_CONSTANT_145
	xor rax, rax
	push rdi
	mov rbx, rdi
	mov rsi, rdi
	mov rdi, 1
	xor rax, rax
	call _int_fputs_pFILEchar.
	mov rbx, rax
	pop rdi
	mov rax, rbx
.L0xa9:
	mov rbx, qword[free_head]
	test rbx, rbx
	jnz .L0xaa
	mov rbx, STRING_CONSTANT_146
	mov rdi, STRING_CONSTANT_146
	xor rax, rax
	push rdi
	mov rbx, rdi
	mov rsi, rdi
	mov rdi, 1
	xor rax, rax
	call _int_fputs_pFILEchar.
	mov rbx, rax
	pop rdi
	mov rax, rbx
.L0xad:
	jmp .L0xab
.L0xaa:
	mov rbx, qword[free_head]
	mov qword[rbp-8], rbx
	jmp .L0xaf
.L0xae:
	mov rdx, qword[rbp-8]
	mov rbx, qword[rbp-8]
	lea rbx, [rbx+0]
	mov rbx, qword[rbx]
	mov rsi, rbx
	mov rbx, STRING_CONSTANT_147
	mov rdi, STRING_CONSTANT_147
	xor rax, rax
	call printf
.L0xb0:
	mov rbx, qword[rbp-8]
	lea rbx, [rbx+8]
	mov rbx, qword[rbx]
	mov r10, rbx
	mov qword[rbp-8], r10
.L0xaf:
	mov rbx, qword[rbp-8]
	lea rbx, [rbx+8]
	mov rbx, qword[rbx]
	test rbx, rbx
	jnz .L0xae
.L0xb1:
.L0xab:
	mov rbx, STRING_CONSTANT_148
	mov rdi, STRING_CONSTANT_148
	xor rax, rax
	push rdi
	mov rbx, rdi
	mov rsi, rdi
	mov rdi, 1
	xor rax, rax
	call _int_fputs_pFILEchar.
	mov rbx, rax
	pop rdi
	mov rax, rbx
.L0xb3:
___void_printstate_p__return:
	leave
	ret
_void_split_block_pmblock.size_t:
	push rbp
	mov rbp, rsp
	sub rsp, 40
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	mov rbx, STRING_CONSTANT_150
	mov rcx, STRING_CONSTANT_150
	mov rdx, 224
	mov rbx, STRING_CONSTANT_149
	mov rsi, STRING_CONSTANT_149
	mov rbx, qword[rbp-8]
	lea rbx, [rbx+0]
	mov rbx, qword[rbx]
	mov r10, qword[rbp-16]
	cmp r10, rbx
	setle r10b
	mov dil, r10b
	xor rax, rax
	call _void___assert_pboolchar.intchar.
	mov rbx, qword[rbp-8]
	mov rbx, qword[rbx]
	mov r10, qword[rbp-16]
	cmp rbx, r10
	jne .L0xb4
	jmp ___void_split_block_pmblock.size_t__return
	jmp .L0xb5
.L0xb4:
.L0xb5:
	mov rbx, qword[rbp-8]
	lea rbx, [rbx+0]
	mov rbx, qword[rbx]
	mov r10, qword[rbp-16]
	sub rbx, r10
	mov qword[rbp-24], rbx
	mov r10, 32
	mov rbx, qword[rbp-24]
	cmp rbx, r10
	jge .L0xb6
	jmp ___void_split_block_pmblock.size_t__return
	jmp .L0xb7
.L0xb6:
.L0xb7:
	mov r10, qword[rbp-16]
	mov rbx, qword[rbp-8]
	add rbx, r10
	add rbx, 32
	mov qword[rbp-32], rbx
	mov rbx, qword[rbp-32]
	mov r10, qword[rbp-24]
	sub r10, 32
	mov [rbx], r10
	mov rbx, qword[rbp-32]
	lea rbx, [rbx+8]
	mov qword[rbx], 0
	mov rbx, qword[rbp-32]
	lea rbx, [rbx+24]
	mov qword[rbx], 0
	mov rbx, qword[rbp-8]
	mov r11, qword[rbp-16]
	mov [rbx], r11
	mov rbx, qword[rbp-32]
	mov rdi, rbx
	xor rax, rax
	call _void_add_block_pmblock.
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
	mov rdi, rbx
	xor rax, rax
	call _void_add_block_pmblock.
___void_free_pvoid.__return:
	leave
	ret
_void._malloc_psize_t:
	push rbp
	mov rbp, rsp
	sub rsp, 32
	mov [rbp-8], rdi
	mov r10, qword[malloc_maxcache]
	mov rbx, qword[rbp-8]
	cmp rbx, r10
	jle .L0xb8
	mov r10, qword[rbp-8]
	add qword[malloc_maxcache], r10
	jmp .L0xb9
.L0xb8:
.L0xb9:
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	xor rax, rax
	call _mblock._scan_existing_psize_t
	mov qword[rbp-16], rax
	mov rbx, qword[rbp-16]
	test rbx, rbx
	jz .L0xba
	mov rbx, qword[rbp-16]
	add rbx, 32
	mov rax, rbx
	jmp ___void._malloc_psize_t__return
	jmp .L0xbb
.L0xba:
.L0xbb:
	mov r10, 4064
	mov rbx, qword[rbp-8]
	cmp rbx, r10
	jge .L0xbc
	mov qword[rbp-24], 4096
	jmp .L0xbd
.L0xbc:
	mov rbx, qword[rbp-8]
	add rbx, 32
	mov qword[rbp-24], rbx
.L0xbd:
	mov rbx, qword[rbp-24]
	mov rdi, rbx
	xor rax, rax
	push rdi
	mov rbx, rdi
	xor rax, rax
	call _void._qmmap_psize_t
	mov rbx, rax
	pop rdi
	mov rax, rbx
	jmp .L0xbf
.L0xbf:
	mov r10, rax
	mov qword[rbp-16], r10
	mov rbx, qword[rbp-16]
	mov r11, qword[rbp-24]
	mov [rbx], r11
	mov rbx, qword[rbp-16]
	lea rbx, [rbx+24]
	mov qword[rbx], 0
	mov rbx, qword[rbp-16]
	lea rbx, [rbx+8]
	mov qword[rbx], 0
	mov rbx, qword[rbp-8]
	mov rsi, rbx
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	xor rax, rax
	call _void_split_block_pmblock.size_t
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
	sub rsp, 48
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	mov rbx, qword[rbp-8]
	test rbx, rbx
	jnz .L0xc0
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	xor rax, rax
	call _void._malloc_psize_t
	jmp ___void._realloc_pvoid.size_t__return
	jmp .L0xc1
.L0xc0:
.L0xc1:
	mov rbx, qword[rbp-8]
	sub rbx, 32
	mov qword[rbp-24], rbx
	mov rbx, qword[rbp-24]
	lea rbx, [rbx+0]
	mov rbx, qword[rbx]
	mov qword[rbp-32], rbx
	mov r10, qword[rbp-16]
	mov rbx, qword[rbp-32]
	cmp rbx, r10
	jne .L0xc2
	mov rbx, qword[rbp-8]
	mov rax, rbx
	jmp ___void._realloc_pvoid.size_t__return
	jmp .L0xc3
.L0xc2:
.L0xc3:
	mov rbx, qword[rbp-24]
	mov rdi, rbx
	xor rax, rax
	call _void_add_block_pmblock.
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	xor rax, rax
	call _void._malloc_psize_t
	mov qword[rbp-40], rax
	mov rbx, qword[rbp-32]
	mov rdx, rbx
	mov rbx, qword[rbp-8]
	mov rsi, rbx
	mov rbx, qword[rbp-40]
	mov rdi, rbx
	xor rax, rax
	call _void_avx_memcpy_pvoid.void.size_t
	mov r10, qword[rbp-32]
	mov rbx, qword[rbp-16]
	sub rbx, r10
	mov rdx, rbx
	xor rsi, rsi
	mov r10, qword[rbp-40]
	mov rbx, qword[rbp-32]
	add r10, rbx
	mov rdi, r10
	xor rax, rax
	call _void_memset_pvoid.ucharsize_t
	mov rbx, qword[rbp-40]
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
	xor rax, rax
	call _void._malloc_psize_t
	mov qword[rbp-16], rax
	mov rbx, qword[rbp-8]
	mov rsi, rbx
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	xor rax, rax
	call _void_avx_memzer_pvoid.size_t
	mov rbx, qword[rbp-16]
	mov rax, rbx
	jmp ___void._calloc_psize_t__return
___void._calloc_psize_t__return:
	leave
	ret
_void_memcpy_pvoid.void.size_t:
	push rbp
	mov rbp, rsp
	sub rsp, 32
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	mov [rbp-24], rdx

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
	sub rsp, 56
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
	jmp .L0xc6
.L0xc5:
	mov ebx, dword[rbp-48]
	shl rbx, 3
	add rbx, [rbp-16]
	vmovdqu ymm0, [rbx]
	mov ebx, dword[rbp-48]
	shl rbx, 3
	add rbx, [rbp-8]
	vmovdqu [rbx], ymm0
.L0xc7:
	mov ebx, dword[rbp-48]
	add ebx, 4
	mov dword[rbp-48], ebx
.L0xc6:
	mov r10d, dword[rbp-48]
	mov rbx, qword[rbp-40]
	mov r11d, r10d
	cmp r11, rbx
	jl .L0xc5
.L0xc8:
	mov ebx, dword[rbp-32]
	test ebx, ebx
	jz .L0xc9
	mov edx, dword[rbp-32]
	mov r10, qword[rbp-16]
	mov rbx, qword[rbp-40]
	add r10, rbx
	mov rsi, r10
	mov r10, qword[rbp-8]
	mov rbx, qword[rbp-40]
	add r10, rbx
	mov rdi, r10
	xor rax, rax
	call _void_memcpy_pvoid.void.size_t
	jmp .L0xca
.L0xc9:
.L0xca:
___void_avx_memcpy_pvoid.void.size_t__return:
	leave
	ret
_void_avx_memzer_pvoid.size_t:
	push rbp
	mov rbp, rsp
	sub rsp, 80
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
	mov qword[rbp-72], 0
	mov qword[rbp-64], 0
	mov qword[rbp-56], 0
	mov qword[rbp-48], 0
	mov rbx, qword[rbp-32]
	mov rsi, rbx
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	xor rax, rax
	vxorpd ymm0, ymm0, ymm0
.L0xcdavxmemzeraligned_lp:
	vmovdqu [rdi], ymm0
	add rdi, 4
	sub rsi, 4
	jnz .L0xcdavxmemzeraligned_lp
.L0xcc:
	mov ebx, dword[rbp-24]
	test ebx, ebx
	jz .L0xce
	mov edx, dword[rbp-24]
	xor rsi, rsi
	mov r10, qword[rbp-8]
	mov rbx, qword[rbp-32]
	add r10, rbx
	mov rdi, r10
	xor rax, rax
	call _void_memset_pvoid.ucharsize_t
	jmp .L0xcf
.L0xce:
.L0xcf:
___void_avx_memzer_pvoid.size_t__return:
	leave
	ret
_void_memset_pvoid.ucharsize_t:
	push rbp
	mov rbp, rsp
	sub rsp, 32
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	mov [rbp-24], rdx
_void_memset_pvoid.ucharsize_t_flp:
	dec rdx
	mov [rdi+rdx], sil
	jnz _void_memset_pvoid.ucharsize_t_flp
___void_memset_pvoid.ucharsize_t__return:
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
	xor rax, rax
	rdrand rax
.L0xd2:
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
	xor rsi, rsi
	lea rbx, [rbp-32]
	mov rdi, rbx
	xor rax, rax
	mov rax , 35 
	mov r10 , rcx 
	syscall 
.L0xd5:
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
	xor rax, rax
	mov rax , 228 
	mov r10 , rcx 
	syscall 
.L0xd8:
	mov rbx, rax
	test rbx, rbx
	jz .L0xda
	mov rax, -1
	jmp ___clock_t_clock_p__return
	jmp .L0xdb
.L0xda:
.L0xdb:
	mov r10, 9223372036854
	mov rbx, qword[rbp-24]
	cmp rbx, r10
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
	jz .L0xdc
	mov rax, -1
	jmp ___clock_t_clock_p__return
	jmp .L0xdd
.L0xdc:
.L0xdd:
	mov r10, 1000000
	mov rbx, qword[rbp-24]
	imul rbx, r10
	mov r11, 1000
	mov r10, qword[rbp-16]
	xor rdx, rdx
	mov rax, r10
	idiv r11
	mov r10, rax
	add rbx, r10
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
	xor rax, rax
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
	xor rax, rax
	mov rbx, rdx
	xor rdx, rdx
	mov rax, rdi
	div rsi
	mov [rbx], rdx
.L0xdf:
	mov r10, rax
	mov qword[rbp-8], r10
	lea rbx, [rbp-40]
	mov rdx, rbx
	mov rsi, 60
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	xor rax, rax
	mov rbx, rdx
	xor rdx, rdx
	mov rax, rdi
	div rsi
	mov [rbx], rdx
.L0xe2:
	mov r10, rax
	mov qword[rbp-8], r10
	lea rbx, [rbp-48]
	mov rdx, rbx
	mov rsi, 24
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	xor rax, rax
	mov rbx, rdx
	xor rdx, rdx
	mov rax, rdi
	div rsi
	mov [rbx], rdx
.L0xe5:
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
	mov rbx, rax
	and r10, 0x7fffffff
	mov r10, rbx
	mov dword[rbp-56], r10d
	mov ebx, dword[rbp-56]
	movsd xmm7, qword[FLT_CONSTANT_2]
	cvtsi2sd xmm8, ebx
	divsd xmm8, xmm7
	movsd xmm0, xmm8
	mov rax, 1
	call _long_floor_pdouble
	push rax
	and rbx, 0x7fffffff
	pop rbx
	mov dword[rbp-64], ebx
	mov ebx, dword[rbp-64]
	movsd xmm7, qword[FLT_CONSTANT_3]
	cvtsi2sd xmm8, ebx
	mulsd xmm8, xmm7
	movsd xmm0, xmm8
	mov rax, 1
	call _long_floor_pdouble
	push rax
	mov r10d, dword[rbp-56]
	pop rbx
	mov r11d, r10d
	sub r11, rbx
	and rbx, 0x7fffffff
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
	jmp .L0xe8
.L0xe7:
	mov r10d, dword[rbp-96]
	mov rbx, qword[mdays]
	and r10, 0x7fffffff
	lea rbx, [rbx+r10*4]
	mov ebx, dword[rbx]
	and rbx, 0x7fffffff
	mov r10d, dword[rbp-88]
	cmp r10d, ebx
	jle .L0xeb
	mov r10d, dword[rbp-96]
	mov rbx, qword[mdays]
	and r10, 0x7fffffff
	lea rbx, [rbx+r10*4]
	mov ebx, dword[rbx]
	and rbx, 0x7fffffff
	mov r10d, dword[rbp-88]
	sub r10d, ebx
	mov dword[rbp-88], r10d
	jmp .L0xec
.L0xeb:
	jmp .L0xea
.L0xec:
.L0xe9:
	inc dword[rbp-96]
.L0xe8:
	jmp .L0xe7
.L0xea:
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
	xor rax, rax
	call _void_memset_pvoid.ucharsize_t
	mov rbx, qword[rbp-8]
	lea rbx, [rbx+24]
	mov ebx, dword[rbx]
	and rbx, 0x7fffffff
	mov r10, qword[wday_name]
	lea r10, [r10+rbx*8]
	mov r10, qword[r10]
	mov rsi, r10
	mov rbx, qword[asctime__result_buf]
	mov rdi, rbx
	xor rax, rax
	call _int_strcpy_pchar.char.
	mov r10b, 3
	mov rbx, qword[asctime__result_buf]
	and r10, 0xff
	lea rbx, [rbx+r10*1]
	mov byte[rbx], 32
	mov rbx, qword[rbp-8]
	lea rbx, [rbx+16]
	mov ebx, dword[rbx]
	and rbx, 0x7fffffff
	mov r10, qword[mon_name]
	lea r10, [r10+rbx*8]
	mov r10, qword[r10]
	mov rsi, r10
	mov rbx, qword[asctime__result_buf]
	add rbx, 4
	mov rdi, rbx
	xor rax, rax
	call _int_strcpy_pchar.char.
	mov r10b, 7
	mov rbx, qword[asctime__result_buf]
	and r10, 0xff
	lea rbx, [rbx+r10*1]
	mov byte[rbx], 32
	xor r9, r9
	xor r8, r8
	xor rcx, rcx
	mov rbx, qword[rbp-8]
	lea rbx, [rbx+12]
	mov ebx, dword[rbx]
	and rbx, 0x7fffffff
	mov rdx, rbx
	mov rbx, STRING_CONSTANT_170
	mov rsi, STRING_CONSTANT_170
	mov rbx, qword[asctime__result_buf]
	add rbx, 7
	mov rdi, rbx
	xor rax, rax
	call _int_sprintf_pchar.char.voidvoidvoidvoid
	mov rbx, qword[rbp-8]
	lea rbx, [rbx+20]
	mov ebx, dword[rbx]
	and rbx, 0x7fffffff
	mov r10d, 1900
	add r10d, ebx
	mov r9, r10
	mov rbx, qword[rbp-8]
	lea rbx, [rbx+0]
	mov ebx, dword[rbx]
	and rbx, 0x7fffffff
	mov r8, rbx
	mov rbx, qword[rbp-8]
	lea rbx, [rbx+4]
	mov ebx, dword[rbx]
	and rbx, 0x7fffffff
	mov rcx, rbx
	mov rbx, qword[rbp-8]
	lea rbx, [rbx+8]
	mov ebx, dword[rbx]
	and rbx, 0x7fffffff
	mov rdx, rbx
	mov rbx, STRING_CONSTANT_171
	mov rsi, STRING_CONSTANT_171
	mov rbx, qword[asctime__result_buf]
	add rbx, 10
	mov rdi, rbx
	xor rax, rax
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
	xor rax, rax
	call tzset
	mov r10, qword[timezone]
	mov rbx, qword[rbp-8]
	sub rbx, r10
	mov rdi, rbx
	xor rax, rax
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
	xor rax, rax
	call _tm._localtime_ptime_t
	mov rdi, rax
	xor rax, rax
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
	mov rbx, STRING_CONSTANT_172
	mov rdi, STRING_CONSTANT_172
	xor rax, rax
	call sscanf
	mov dword[rbp-36], eax
	lea rbx, [rbp-28] 
	mov bl, byte[rbx]
	and bl, 0xff
	mov r10b, 255
	and bl, r10b
	mov dword[rbp-44], ebx
	mov r10b, 1
	lea rbx, [rbp-28] 
	and r10, 0xff
	lea rbx, [rbx+r10*1]
	mov bl, byte[rbx]
	and rbx, 0xff
	mov r10b, 255
	and bl, r10b
	mov dword[rbp-52], ebx
	mov r10b, 2
	lea rbx, [rbp-28] 
	and r10, 0xff
	lea rbx, [rbx+r10*1]
	mov bl, byte[rbx]
	and rbx, 0xff
	mov r10b, 255
	and bl, r10b
	mov dword[rbp-60], ebx
	mov r10b, 3
	lea rbx, [rbp-28] 
	and r10, 0xff
	lea rbx, [rbx+r10*1]
	mov bl, byte[rbx]
	and rbx, 0xff
	mov r10b, 255
	and bl, r10b
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
	xor rax, rax
	xor rax,rax
	bswap edi
	mov eax, edi
.L0xee:
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
	xor r9, r9
	xor r8, r8
	mov ebx, dword[rbp-32]
	mov ecx, ebx
	mov rbx, qword[rbp-24]
	mov rdx, rbx
	mov rbx, qword[rbp-16]
	mov rsi, rbx
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	xor rax, rax
	mov rax , 45 
	mov r10 , rcx 
	syscall 
.L0xf1:
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
	xor r9, r9
	xor r8, r8
	mov ebx, dword[rbp-32]
	mov ecx, ebx
	mov rbx, qword[rbp-24]
	mov rdx, rbx
	mov rsi, qword[rbp-16]
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	xor rax, rax
	mov rax , 44 
	mov r10 , rcx 
	syscall 
.L0xf4:
	jmp ___int_send_pfd_tchar.size_tint__return
___int_send_pfd_tchar.size_tint__return:
	leave
	ret
_int_scanint_pchar.long.bool:
	push rbp
	mov rbp, rsp
	sub rsp, 64
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	mov [rbp-24], rdx
	mov qword[rbp-32], 0
	mov rbx, qword[rbp-8]
	and r10, 0xff
	mov r10b, byte[rbx]
	mov byte[rbp-40], r10b
	mov byte[rbp-48], 0
	mov rbx, qword[rbp-8]
	mov qword[rbp-56], rbx
	mov r10b, 45
	mov bl, byte[rbp-40]
	cmp bl, r10b
	sete bl
	mov r10b, byte[rbp-24]
	and bl, r10b
	jz .L0xf6
	mov byte[rbp-48], 1
	inc qword[rbp-8]
	mov rbx, qword[rbp-8]
	mov bl, byte[rbx]
	and rbx, 0xff
	mov byte[rbp-40], bl
	jmp .L0xf7
.L0xf6:
.L0xf7:
	jmp .L0xf9
.L0xf8:
	mov r10, 10
	mov rbx, qword[rbp-32]
	imul rbx, r10
	mov r10b, byte[rbp-40]
	sub r10b, 48
	mov r11b, r10b
	add rbx, r11
	mov qword[rbp-32], rbx
	inc qword[rbp-8]
	mov rbx, qword[rbp-8]
	mov bl, byte[rbx]
	and rbx, 0xff
	mov byte[rbp-40], bl
.L0xf9:
	mov r10b, 57
	mov bl, byte[rbp-40]
	cmp bl, r10b
	setle bl
	mov r11b, 48
	mov r10b, byte[rbp-40]
	cmp r10b, r11b
	setge r10b
	and bl, r10b
	jnz .L0xf8
.L0xfa:
	mov bl, byte[rbp-48]
	test bl, bl
	jne .L0xfb
	mov rbx, qword[rbp-16]
	mov r11, qword[rbp-32]
	mov [rbx], r11
	jmp .L0xfc
.L0xfb:
	mov rbx, qword[rbp-16]
	xor r11, r11
	mov r10, qword[rbp-32]
	sub r11, r10
	mov [rbx], r11
.L0xfc:
	mov r10, qword[rbp-56]
	mov rbx, qword[rbp-8]
	sub rbx, r10
	mov eax, ebx
	jmp ___int_scanint_pchar.long.bool__return
___int_scanint_pchar.long.bool__return:
	leave
	ret
_int_scanstr_pchar.charchar.:
	push rbp
	mov rbp, rsp
	sub rsp, 40
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	mov [rbp-24], rdx
	mov rbx, qword[rbp-8]
	mov qword[rbp-32], rbx
	jmp .L0xfe
.L0xfd:
	mov rbx, qword[rbp-24]
	mov r10, qword[rbp-8]
	mov r10b, byte[r10]
	and r10, 0xff
	mov [rbx], r10b
	inc qword[rbp-8]
	inc qword[rbp-24]
.L0xfe:
	mov rbx, qword[rbp-8]
	mov bl, byte[rbx]
	and rbx, 0xff
	mov r10b, byte[rbp-16]
	cmp bl, r10b
	jne .L0xfd
.L0xff:
	mov r10, qword[rbp-32]
	mov rbx, qword[rbp-8]
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
	xor rax, rax
	call _int_scanint_pchar.long.bool
	mov qword[rbp-48], rax
	mov r10, qword[rbp-48]
	add qword[rbp-8], r10
	mov rbx, qword[rbp-8]
	mov bl, byte[rbx]
	and rbx, 0xff
	mov r10b, 46
	cmp bl, r10b
	je .L0x100
	mov rbx, qword[rbp-24]
	cvtsi2sd xmm7, qword[rbp-32]
	movsd [rbx], xmm7
	mov rax, qword[rbp-48]
	jmp ___int_scansd_pchar.booldouble.__return
	jmp .L0x101
.L0x100:
.L0x101:
	inc qword[rbp-8]
	xor rdx, rdx
	lea rbx, [rbp-40]
	mov rsi, rbx
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	xor rax, rax
	call _int_scanint_pchar.long.bool
	mov qword[rbp-56], rax
	mov rbx, qword[rbp-56]
	mov rsi, rbx
	mov rdi, 10
	xor rax, rax
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
	sub rsp, 64
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
	jz .L0x102
	xor rax, rax
	jmp ___int___SSCANF_pchar.char.void..__return
	jmp .L0x103
.L0x102:
.L0x103:
	jmp .L0x105
.L0x104:
	mov rbx, qword[rbp-8]
	mov bl, byte[rbx]
	and rbx, 0xff
	mov r10b, 37
	cmp bl, r10b
	je .L0x107
	inc qword[rbp-8]
	inc qword[rbp-16]
	jmp .L0x108
.L0x107:
	inc qword[rbp-8]
	mov rbx, qword[rbp-8]
	and r10, 0xff
	mov r10b, byte[rbx]
	mov byte[rbp-40], r10b
	mov r10b, 105
	mov bl, byte[rbp-40]
	cmp bl, r10b
	jne .L0x109
	mov rdx, 1
	mov r10d, dword[rbp-32]
	mov rbx, qword[rbp-24]
	and r10, 0x7fffffff
	lea rbx, [rbx+r10*8]
	mov rbx, qword[rbx]
	mov rsi, rbx
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	xor rax, rax
	call _int_scanint_pchar.long.bool
	mov rbx, rax
	mov qword[rbp-48], rbx
	mov r10, qword[rbp-48]
	add qword[rbp-16], r10
	inc qword[rbp-8]
	jmp .L0x10a
.L0x109:
	mov r10b, 117
	mov bl, byte[rbp-40]
	cmp bl, r10b
	jne .L0x10b
	xor rdx, rdx
	mov r10d, dword[rbp-32]
	mov rbx, qword[rbp-24]
	and r10, 0x7fffffff
	lea rbx, [rbx+r10*8]
	mov rbx, qword[rbx]
	mov rsi, rbx
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	xor rax, rax
	call _int_scanint_pchar.long.bool
	mov rbx, rax
	mov qword[rbp-48], rbx
	mov r10, qword[rbp-48]
	add qword[rbp-16], r10
	inc qword[rbp-8]
	jmp .L0x10c
.L0x10b:
	mov r10b, 99
	mov bl, byte[rbp-40]
	cmp bl, r10b
	jne .L0x10d
	mov r10d, dword[rbp-32]
	mov rbx, qword[rbp-24]
	and r10, 0x7fffffff
	lea rbx, [rbx+r10*8]
	mov rbx, qword[rbx]
	mov qword[rbp-56], rbx
	mov rbx, qword[rbp-56]
	mov r10, qword[rbp-16]
	mov r10b, byte[r10]
	and r10, 0xff
	mov [rbx], r10b
	inc qword[rbp-16]
	inc qword[rbp-8]
	jmp .L0x10e
.L0x10d:
	mov r10b, 115
	mov bl, byte[rbp-40]
	cmp bl, r10b
	jne .L0x10f
	inc qword[rbp-8]
	mov r10d, dword[rbp-32]
	mov rbx, qword[rbp-24]
	and r10, 0x7fffffff
	lea rbx, [rbx+r10*8]
	mov rbx, qword[rbx]
	mov rdx, rbx
	mov rbx, qword[rbp-8]
	and r10, 0xff
	mov r10b, byte[rbx]
	mov sil, r10b
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	xor rax, rax
	call _int_scanstr_pchar.charchar.
	mov rbx, rax
	mov qword[rbp-48], rbx
	mov r10, qword[rbp-48]
	add qword[rbp-16], r10
	jmp .L0x110
.L0x10f:
	mov r10b, 102
	mov bl, byte[rbp-40]
	cmp bl, r10b
	sete bl
	mov r11b, 100
	mov r10b, byte[rbp-40]
	cmp r10b, r11b
	sete r10b
	or bl, r10b
	jz .L0x111
	mov r10d, dword[rbp-32]
	mov rbx, qword[rbp-24]
	and r10, 0x7fffffff
	lea rbx, [rbx+r10*8]
	mov rbx, qword[rbx]
	mov rdx, rbx
	xor rsi, rsi
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	xor rax, rax
	call _int_scansd_pchar.booldouble.
	mov rbx, rax
	mov qword[rbp-48], rbx
	mov r10, qword[rbp-48]
	add qword[rbp-16], r10
	inc qword[rbp-8]
	jmp .L0x112
.L0x111:
.L0x112:
.L0x110:
.L0x10e:
.L0x10c:
.L0x10a:
	inc dword[rbp-32]
.L0x108:
.L0x105:
	mov rbx, qword[rbp-8]
	mov bl, byte[rbx]
	and rbx, 0xff
	jnz .L0x104
.L0x106:
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
	xor rax, rax
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
	xor rax, rax
	push rdi
	mov rbx, rdi
	mov rsi, rdi
	mov rdi, 1
	xor rax, rax
	call _int_fputs_pFILEchar.
	mov rbx, rax
	pop rdi
	mov rax, rbx
.L0x114:
	mov rdx, 40
	xor rsi, rsi
	lea rbx, [rbp-56]
	mov rdi, rbx
	xor rax, rax
	call _void_memset_pvoid.ucharsize_t
	mov rdx, 40
	lea rbx, [rbp-56]
	mov rsi, rbx
	xor rdi, rdi
	xor rax, rax
	call _long_fgets_pFILEchar.size_t
	mov rsi, 1
	lea rbx, [rbp-56]
	mov rdi, rbx
	xor rax, rax
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
	xor rax, rax
	push rdi
	mov rbx, rdi
	mov rsi, rdi
	mov rdi, 1
	xor rax, rax
	call _int_fputs_pFILEchar.
	mov rbx, rax
	pop rdi
	mov rax, rbx
.L0x116:
	mov rdx, 40
	xor rsi, rsi
	lea rbx, [rbp-56]
	mov rdi, rbx
	xor rax, rax
	call _void_memset_pvoid.ucharsize_t
	mov rdx, 40
	lea rbx, [rbp-56]
	mov rsi, rbx
	xor rdi, rdi
	xor rax, rax
	call _long_fgets_pFILEchar.size_t
	mov rsi, 1
	lea rbx, [rbp-56]
	mov rdi, rbx
	xor rax, rax
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
	xor rdi, rdi
	xor rax, rax
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
	sub rsp, 16
	mov [rbp-8], rdi
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
	xor rax, rax
	push rdi
	mov rbx, rdi
	mov rsi, rdi
	mov rdi, 1
	xor rax, rax
	call _int_fputs_pFILEchar.
	mov rbx, rax
	pop rdi
	mov rax, rbx
.L0x118:
	mov edx, dword[rbp-16]
	mov rbx, qword[rbp-8]
	mov rsi, rbx
	xor rdi, rdi
	xor rax, rax
	call _long_fgets_pFILEchar.size_t
___void_getString_pchar.intchar.__return:
	leave
	ret
_int_toInteger_pchar.bool:
	push rbp
	mov rbp, rsp
	sub rsp, 48
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	jmp .L0x11a
.L0x119:
	inc qword[rbp-8]
.L0x11a:
	mov rbx, qword[rbp-8]
	mov bl, byte[rbx]
	and rbx, 0xff
	mov r10b, 32
	cmp bl, r10b
	je .L0x119
.L0x11b:
	mov rbx, qword[rbp-8]
	and r10, 0xff
	mov r10b, byte[rbx]
	mov byte[rbp-24], r10b
	mov dword[rbp-32], 0
	mov byte[rbp-40], 0
	mov r10b, 45
	mov bl, byte[rbp-24]
	cmp bl, r10b
	sete bl
	mov r10b, byte[rbp-16]
	and bl, r10b
	jz .L0x11c
	mov byte[rbp-40], 1
	inc qword[rbp-8]
	mov rbx, qword[rbp-8]
	mov bl, byte[rbx]
	and rbx, 0xff
	mov byte[rbp-24], bl
	jmp .L0x11d
.L0x11c:
.L0x11d:
	jmp .L0x11f
.L0x11e:
	mov r10d, 10
	mov ebx, dword[rbp-32]
	imul ebx, r10d
	mov r10b, byte[rbp-24]
	sub r10b, 48
	and r11d, 0x7fffffff
	mov r11b, r10b
	add ebx, r11d
	mov dword[rbp-32], ebx
	inc qword[rbp-8]
	mov rbx, qword[rbp-8]
	mov bl, byte[rbx]
	and rbx, 0xff
	mov byte[rbp-24], bl
.L0x11f:
	mov bl, byte[rbp-24]
	test bl, bl
	setnz bl
	mov r11b, 10
	mov r10b, byte[rbp-24]
	cmp r10b, r11b
	setne r10b
	and bl, r10b
	mov r11b, 32
	mov r10b, byte[rbp-24]
	cmp r10b, r11b
	setne r10b
	and bl, r10b
	jnz .L0x11e
.L0x120:
	mov al, byte[rbp-40]
	test al, al
	jz .L0x121
	xor r10d, r10d
	mov ebx, dword[rbp-32]
	sub r10d, ebx
	mov eax, r10d
	jmp ___int_toInteger_pchar.bool__return
	jmp .L0x122
.L0x121:
.L0x122:
	mov ebx, dword[rbp-32]
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
.L0x123:
	add qword[rbp-40], 1000
	mov rbx, qword[rbp-40]
	mov rsi, rbx
	mov rdi, qword[rbp-32]
	xor rax, rax
	call _void._realloc_pvoid.size_t
	mov r10, rax
	mov qword[rbp-32], r10
	mov rdx, 1000
	mov r10, qword[rbp-32]
	mov rbx, qword[rbp-40]
	add r10, rbx
	sub r10, 1000
	mov rsi, r10
	mov rdi, qword[rbp-24]
	xor rax, rax
	call _long_fgets_pFILEchar.size_t
	mov r10, rax
	mov qword[rbp-48], r10
	mov rbx, qword[rbp-40]
	sub rbx, 1000
	mov r10, qword[rbp-48]
	add rbx, r10
	mov r10, qword[rbp-32]
	lea r10, [r10+rbx*1]
	mov byte[r10], 0
	mov r10, 1000
	mov rbx, qword[rbp-48]
	cmp rbx, r10
	jge .L0x123
	mov rbx, qword[rbp-16]
	mov rdx, rbx
	mov rbx, qword[rbp-32]
	mov rsi, rbx
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	xor rax, rax
	call _int___SSCANF_pchar.char.void..
	mov dword[rbp-56], eax
	mov rdi, qword[rbp-32]
	xor rax, rax
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
	xor rdx, rdx
	lea rbx, [rbp-96]
	mov rsi, rbx
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	xor rax, rax
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
	xor rax, rax
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
	xor rax, rax
	mov eax, [rsi]
	lock cmpxchg dword[rdi], edx
	jz .L0x126__end
	mov eax, [rdi]
	mov [rsi], eax
.L0x126__end:
.L0x125:
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
	xor rsi, rsi
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	xor rax, rax
	call _void_mutex_cmpxchg_pmutex.intint
	mov dword[rbp-16], eax
	mov ebx, dword[rbp-16]
	test ebx, ebx
	jz .L0x127
	jmp .L0x12a
.L0x129:
	mov rdx, 2
	mov rsi, 1
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	xor rax, rax
	call _void_mutex_cmpxchg_pmutex.intint
	push rax
	mov r10d, 2
	mov ebx, dword[rbp-16]
	cmp ebx, r10d
	sete bl
	pop r10
	test r10, r10
	setnz r10b
	or bl, r10b
	jz .L0x12c
	mov rdx, 2
	xor rsi, rsi
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	xor rax, rax
	push rdi
	push rsi
	push rdx
	xor r9, r9
	xor r8, r8
	xor rcx, rcx
	mov ebx, edx
	mov rbx, rsi
	mov rbx, rdi
	xor rax, rax
	mov rax , 202 
	mov r10 , rcx 
	syscall 
.L0x131:
	mov rbx, rax
	pop rdx
	pop rsi
	pop rdi
	mov rax, rbx
	jmp .L0x12f
.L0x12f:
	jmp .L0x12d
.L0x12c:
.L0x12d:
	mov rdx, 2
	xor rsi, rsi
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	xor rax, rax
	call _void_mutex_cmpxchg_pmutex.intint
	push rax
	and rbx, 0x7fffffff
	pop rbx
	mov dword[rbp-16], ebx
	mov ebx, dword[rbp-16]
	test ebx, ebx
	jnz .L0x133
	mov rbx, STRING_CONSTANT_173
	mov rdi, STRING_CONSTANT_173
	xor rax, rax
	push rdi
	mov rbx, rdi
	mov rsi, rdi
	mov rdi, 1
	xor rax, rax
	call _int_fputs_pFILEchar.
	mov rbx, rax
	pop rdi
	mov rax, rbx
.L0x136:
	jmp .L0x12b
	jmp .L0x134
.L0x133:
.L0x134:
.L0x12a:
	jmp .L0x129
.L0x12b:
	jmp .L0x128
.L0x127:
.L0x128:
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
	xor rax, rax
	xchg eax, [rdi]
	lock sub dword[rdi], esi
.L0x138:
	push rax
	mov r10d, 1
	pop rbx
	cmp ebx, r10d
	je .L0x13a
	xor rsi, rsi
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	xor rax, rax
	lock xchg dword[rdi], esi
.L0x13d:
	mov rdx, 2
	xor rsi, rsi
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	xor rax, rax
	push rdi
	push rsi
	push rdx
	xor r9, r9
	xor r8, r8
	xor rcx, rcx
	mov ebx, edx
	mov rbx, rsi
	mov rbx, rdi
	xor rax, rax
	mov rax , 202 
	mov r10 , rcx 
	syscall 
.L0x142:
	mov rbx, rax
	pop rdx
	pop rsi
	pop rdi
	mov rax, rbx
	jmp .L0x140
.L0x140:
	jmp .L0x13b
.L0x13a:
.L0x13b:
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
	xor rax, rax
	mov rax , 60 
	mov r10 , rcx 
	syscall 
.L0x146:
____thrdext__return:
	leave
	ret
_long_thrdcrt_pvoid.thread_t.void.:
	push rbp
	mov rbp, rsp
	sub rsp, 32
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	mov [rbp-24], rdx
	mov r15, rdi
	mov r14, rsi
	mov r13, rdx
	call __crtstack
	lea rsi, [rax + 65536 - 8]
	mov rdi, [clone_threadflags]
	mov rax, 56
	syscall
	test rax, rax
	jnz .L0x148__end
	mov rdi, r15
	mov rsi, r14
	mov rdx, r13
	call __enterthread
	mov rdi, rax
	call __thrdext
.L0x148__end:
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
	xor rdi, rdi
	xor rax, rax
	call _void._mmap_pvoid.size_tlonglonglongoff_t
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
	xor rax, rax
	call qword[rbp-8]
	mov qword[rbp-32], rax
	mov rbx, qword[rbp-16]
	lea rbx, [rbx+0]
	mov rdi, rbx
	xor rax, rax
	call _void_munlock_pmutex.
	mov rbx, qword[rbp-16]
	lea rbx, [rbx+0]
	mov ebx, dword[rbx]
	and rbx, 0x7fffffff
	mov rsi, rbx
	mov rbx, STRING_CONSTANT_174
	mov rdi, STRING_CONSTANT_174
	xor rax, rax
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
	lea rbx, [rbx+0]
	mov rdi, rbx
	xor rax, rax
	call _void_mlock_pmutex.
	mov rbx, qword[rbp-24]
	mov rdx, rbx
	mov rbx, qword[rbp-8]
	mov rsi, rbx
	mov rdi, qword[rbp-16]
	xor rax, rax
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
	lea rbx, [rbx+0]
	mov rdi, rbx
	xor rax, rax
	call _void_mlock_pmutex.
___void_thread_join_pthread_t.__return:
	leave
	ret
main:
	push rbp
	mov rbp, rsp
	sub rsp, 24
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	xor rax, rax
	jmp __main__return
__main__return:
	leave
	ret
	