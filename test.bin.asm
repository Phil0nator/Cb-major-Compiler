
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
global _void_printf_pchar.voidvoidvoidvoidvoid:
	extern printf
	extern printf
	extern printf
	extern printf
global _void_eprintf_pchar.voidvoidvoidvoidvoid:
	extern eprintf
	extern eprintf
	extern eprintf
	extern eprintf
global _void_fprintf_pfd_tchar.voidvoidvoidvoid:
	extern fprintf
	extern fprintf
	extern fprintf
global _void___assert_pboolchar.intchar.:
global _void._malloc_psize_t:
global _void_free_pvoid.:
global _void._realloc_pvoid.size_t:
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
global _long_execl_pchar.char..:
global _long_system_pchar.:
global _int___SSCANF_pchar.char.void..:
global _int_sscanf_pchar.char.void.void.void.void.:
	extern sscanf
	extern sscanf
	extern sscanf
	extern sscanf
global _int___scanf_pchar.void..fd_t:
global _size_t_scanf_pchar.void.void.void.void.void.:
	extern scanf
	extern scanf
	extern scanf
	extern scanf
	extern scanf
global _size_t_fscanf_pfd_tchar.void.void.void.void.:
	extern fscanf
	extern fscanf
	extern fscanf
	extern fscanf
global _void_mutex_cmpxchg_pmutex.intint:
global _void_mlock_pmutex.:
global _void_munlock_pmutex.:
global _void___thrdext_plong:
global _long_thrdcrt_pvoid.thread_t.void.:
global _void.___crtstack_p:
global _long___enterthread_p__threadcallablethread_t.void.:
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
STRING_CONSTANT_136: db `%s:%i: Assertion '%s' failed.\n`, 0
FLT_CONSTANT_2: dq 0x1.6d40000000000p+8
FLT_CONSTANT_3: dq 0x1.6d40000000000p+8
STRING_CONSTANT_137: db `Sun`, 0
STRING_CONSTANT_138: db `Mon`, 0
STRING_CONSTANT_139: db `Tue`, 0
STRING_CONSTANT_140: db `Wed`, 0
STRING_CONSTANT_141: db `Thu`, 0
STRING_CONSTANT_142: db `Fri`, 0
STRING_CONSTANT_143: db `Sat`, 0
STRING_CONSTANT_144: db `Jan`, 0
STRING_CONSTANT_145: db `Feb`, 0
STRING_CONSTANT_146: db `Mar`, 0
STRING_CONSTANT_147: db `Apr`, 0
STRING_CONSTANT_148: db `May`, 0
STRING_CONSTANT_149: db `Jun`, 0
STRING_CONSTANT_150: db `Jul`, 0
STRING_CONSTANT_151: db `Aug`, 0
STRING_CONSTANT_152: db `Sep`, 0
STRING_CONSTANT_153: db `Oct`, 0
STRING_CONSTANT_154: db `Nov`, 0
STRING_CONSTANT_155: db `Dec`, 0
STRING_CONSTANT_156: db `%i `, 0
STRING_CONSTANT_157: db `%i:%i:%i %i`, 0
STRING_CONSTANT_158: db `%i.%i.%i.%i`, 0
STRING_CONSTANT_159: db `/bin/bash`, 0
STRING_CONSTANT_160: db `PATH=/bin:/usr/bin:/sbin:/usr/sbin`, 0
STRING_CONSTANT_161: db `sudo`, 0
STRING_CONSTANT_162: db `-c`, 0
STRING_CONSTANT_163: db `LOCKED`, 0
STRING_CONSTANT_164: db `unlocked thread: %i\n`, 0
STRING_CONSTANT_165: db `%i\n`, 0
__linux_errstrlist: DQ STRING_CONSTANT_0, STRING_CONSTANT_1, STRING_CONSTANT_2, STRING_CONSTANT_3, STRING_CONSTANT_4, STRING_CONSTANT_5, STRING_CONSTANT_6, STRING_CONSTANT_7, STRING_CONSTANT_8, STRING_CONSTANT_9, STRING_CONSTANT_10, STRING_CONSTANT_11, STRING_CONSTANT_12, STRING_CONSTANT_13, STRING_CONSTANT_14, STRING_CONSTANT_15, STRING_CONSTANT_16, STRING_CONSTANT_17, STRING_CONSTANT_18, STRING_CONSTANT_19, STRING_CONSTANT_20, STRING_CONSTANT_21, STRING_CONSTANT_22, STRING_CONSTANT_23, STRING_CONSTANT_24, STRING_CONSTANT_25, STRING_CONSTANT_26, STRING_CONSTANT_27, STRING_CONSTANT_28, STRING_CONSTANT_29, STRING_CONSTANT_30, STRING_CONSTANT_31, STRING_CONSTANT_32, STRING_CONSTANT_33, STRING_CONSTANT_34, STRING_CONSTANT_35, STRING_CONSTANT_36, STRING_CONSTANT_37, STRING_CONSTANT_38, STRING_CONSTANT_39, STRING_CONSTANT_40, STRING_CONSTANT_41, STRING_CONSTANT_42, STRING_CONSTANT_43, STRING_CONSTANT_44, STRING_CONSTANT_45, STRING_CONSTANT_46, STRING_CONSTANT_47, STRING_CONSTANT_48, STRING_CONSTANT_49, STRING_CONSTANT_50, STRING_CONSTANT_51, STRING_CONSTANT_52, STRING_CONSTANT_53, STRING_CONSTANT_54, STRING_CONSTANT_55, STRING_CONSTANT_56, STRING_CONSTANT_57, STRING_CONSTANT_58, STRING_CONSTANT_59, STRING_CONSTANT_60, STRING_CONSTANT_61, STRING_CONSTANT_62, STRING_CONSTANT_63, STRING_CONSTANT_64, STRING_CONSTANT_65, STRING_CONSTANT_66, STRING_CONSTANT_67, STRING_CONSTANT_68, STRING_CONSTANT_69, STRING_CONSTANT_70, STRING_CONSTANT_71, STRING_CONSTANT_72, STRING_CONSTANT_73, STRING_CONSTANT_74, STRING_CONSTANT_75, STRING_CONSTANT_76, STRING_CONSTANT_77, STRING_CONSTANT_78, STRING_CONSTANT_79, STRING_CONSTANT_80, STRING_CONSTANT_81, STRING_CONSTANT_82, STRING_CONSTANT_83, STRING_CONSTANT_84, STRING_CONSTANT_85, STRING_CONSTANT_86, STRING_CONSTANT_87, STRING_CONSTANT_88, STRING_CONSTANT_89, STRING_CONSTANT_90, STRING_CONSTANT_91, STRING_CONSTANT_92, STRING_CONSTANT_93, STRING_CONSTANT_94, STRING_CONSTANT_95, STRING_CONSTANT_96, STRING_CONSTANT_97, STRING_CONSTANT_98, STRING_CONSTANT_99, STRING_CONSTANT_100, STRING_CONSTANT_101, STRING_CONSTANT_102, STRING_CONSTANT_103, STRING_CONSTANT_104, STRING_CONSTANT_105, STRING_CONSTANT_106, STRING_CONSTANT_107, STRING_CONSTANT_108, STRING_CONSTANT_109, STRING_CONSTANT_110, STRING_CONSTANT_111, STRING_CONSTANT_112, STRING_CONSTANT_113, STRING_CONSTANT_114, STRING_CONSTANT_115, STRING_CONSTANT_116, STRING_CONSTANT_117, STRING_CONSTANT_118, STRING_CONSTANT_119, STRING_CONSTANT_120, STRING_CONSTANT_121, STRING_CONSTANT_122, STRING_CONSTANT_123, STRING_CONSTANT_124, STRING_CONSTANT_125, STRING_CONSTANT_126, STRING_CONSTANT_127, STRING_CONSTANT_128, STRING_CONSTANT_129, STRING_CONSTANT_130, STRING_CONSTANT_131
errno: DD 0
nullterm: DB 0
M_MINZERO_MEM: DQ 0x0.0p+0
__numbercharactersbase1016: DQ "0123456789abcdef"
rand_next: DD 1
mdays: DD 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31
wday_name: DQ STRING_CONSTANT_137, STRING_CONSTANT_138, STRING_CONSTANT_139, STRING_CONSTANT_140, STRING_CONSTANT_141, STRING_CONSTANT_142, STRING_CONSTANT_143
mon_name: DQ STRING_CONSTANT_144, STRING_CONSTANT_145, STRING_CONSTANT_146, STRING_CONSTANT_147, STRING_CONSTANT_148, STRING_CONSTANT_149, STRING_CONSTANT_150, STRING_CONSTANT_151, STRING_CONSTANT_152, STRING_CONSTANT_153, STRING_CONSTANT_154, STRING_CONSTANT_155
asctime__result_buf: DB 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 0
__systembashpath: DQ "/bin/bash"
__emptyenv: DQ STRING_CONSTANT_160, 0
__systemcallargvconst: DQ STRING_CONSTANT_161, STRING_CONSTANT_162, 0
clone_threadflags: DQ 17
	section .bss
	align 16
__tmbuf: resb 36
__internaltime: resb 8
__heap_padding__: resz 1
	section .text
	align 8
	global main
	;[ function char. get_errstr( [[int err @ 8]] ) ]
_char._get_errstr_pint:
	push rbp
	mov rbp, rsp
	sub rsp, 16
;Load Parameter: [int err @ 8]
	mov [rbp-8], rdi
;[[ id : err], [ < : <], [ int : 131], [ && : &&], [ id : err], [ >= : >=], [ int : 0]]
	mov r10d, dword[rbp-8]
	mov rbx, 131
	mov r11, r10
	cmp r11, rbx
	setl r11b
	mov r10d, dword[rbp-8]
	xor rbx, rbx
	mov r12, r10
	cmp r12, rbx
	setge r12b
	and r11b, r12b
	mov al, r11b
	and al, 1
	jz _LIFPOST_0x0
;[[ id : __linux_errstrlist], [ [ : [], [ id : err], [ ] : ]]]
	mov r10d, dword[rbp-8]
	mov rbx, __linux_errstrlist
	and r10, 0xffffffff
	lea rbx, [rbx+r10*8]
	mov rbx, qword[rbx]
	mov rax, rbx
	jmp ___char._get_errstr_pint__return
	jmp _LIFELSE_0x1
_LIFPOST_0x0:
_LIFELSE_0x1:
;[[ id : STRING_CONSTANT_132]]
	mov rbx, STRING_CONSTANT_132
	mov rax, STRING_CONSTANT_132
	jmp ___char._get_errstr_pint__return
___char._get_errstr_pint__return:
	leave
	ret
	;[ function void. mmap( [[void. addr @ 8], [size_t length @ 16], [long prot @ 24], [long flags @ 32], [long fd @ 40], [off_t offset @ 48]] ) ]
_void._mmap_pvoid.size_tlonglonglongoff_t:
	push rbp
	mov rbp, rsp
	sub rsp, 56
;Load Parameter: [void. addr @ 8]
	mov [rbp-8], rdi
;Load Parameter: [size_t length @ 16]
	mov [rbp-16], rsi
;Load Parameter: [long prot @ 24]
	mov [rbp-24], rdx
;Load Parameter: [long flags @ 32]
	mov [rbp-32], rcx
;Load Parameter: [long fd @ 40]
	mov [rbp-40], r8
;Load Parameter: [off_t offset @ 48]
	mov [rbp-48], r9
	mov rax, 9
	mov r10, rcx
	syscall
___void._mmap_pvoid.size_tlonglonglongoff_t__return:
	leave
	ret
	;[ function void. munmap( [[void. addr @ 8], [size_t length @ 16]] ) ]
_void._munmap_pvoid.size_t:
	push rbp
	mov rbp, rsp
	sub rsp, 24
;Load Parameter: [void. addr @ 8]
	mov [rbp-8], rdi
;Load Parameter: [size_t length @ 16]
	mov [rbp-16], rsi
	mov rax, 11
	syscall
___void._munmap_pvoid.size_t__return:
	leave
	ret
	;[ function void. qmmap( [[size_t amt @ 8]] ) ]
_void._qmmap_psize_t:
	push rbp
	mov rbp, rsp
	sub rsp, 16
;Load Parameter: [size_t amt @ 8]
	mov [rbp-8], rdi
;[[ int : 0]]
	xor r9, r9
	and r9, 0xffffffff
;[[ int : 0]]
	xor r8, r8
;[[ int : 2], [ | : |], [ int : 32]]
	mov rcx, 34
;[[ int : 1], [ | : |], [ int : 2]]
	mov rdx, 3
;[[ id : amt]]
	mov rbx, qword[rbp-8]
	mov rsi, rbx
;[[ int : 0]]
	xor rdi, rdi
	xor rax, rax
	call _void._mmap_pvoid.size_tlonglonglongoff_t
	push rax
;[[ fn(x) : [ function void. mmap( [[void. addr @ 8], [size_t length @ 16], [long prot @ 24], [long flags @ 32], [long fd @ 40], [off_t offset @ 48]] ) ] ]]
	pop rax
	jmp ___void._qmmap_psize_t__return
___void._qmmap_psize_t__return:
	leave
	ret
	;[ function bool all_of_raw( [[iterable array @ 8], [size_t itemsize @ 16], [size_t itemcount @ 24], [void. cmpfn @ 32]] ) ]
_bool_all_of_raw_piterablesize_tsize_tvoid.:
	push rbp
	mov rbp, rsp
	sub rsp, 48
;Load Parameter: [iterable array @ 8]
	mov [rbp-8], rdi
;Load Parameter: [size_t itemsize @ 16]
	mov [rbp-16], rsi
;Load Parameter: [size_t itemcount @ 24]
	mov [rbp-24], rdx
;Load Parameter: [void. cmpfn @ 32]
	mov [rbp-32], rcx
;[[ id : array], [ + : +], [ ( : (], [ id : itemsize], [ * : *], [ id : itemcount], [ ) : )]]
	mov r11, qword[rbp-24]
	mov r10, qword[rbp-16]
	imul r10, r11
	mov r11, qword[rbp-8]
	add r11, r10
	mov rbx, r11
;[[ id : array]]
	mov r10, qword[rbp-8]
	mov qword[rbp-40], r10
	jmp _LFORCMP_0x5
_LFORTOP_0x4:
	push rbx
;[[ @ : @], [ id : a]]
	mov r10, qword[rbp-40]
	mov r11, qword[r10]
	mov rdi, r11
	xor rax, rax
	call qword[rbp-32]
	mov r10, rax
	pop rbx
	mov rax, r10
	push rax
;[[ ! : !], [ fn(x) : [ function void. cmpfn( [[iterable parameter @ 0]] ) ] ]]
	pop r10
	cmp r10, 0
	sete r10b
	mov al, r10b
	and al, 1
	jz _LIFPOST_0x8
;[[ int : 0]]
	xor rax, rax
	jmp ___bool_all_of_raw_piterablesize_tsize_tvoid.__return
	jmp _LIFELSE_0x9
_LIFPOST_0x8:
_LIFELSE_0x9:
_LFORUPDATE_0x6:
;[[ id : a]]
;[[ id : a]]
;[[ id : itemsize]]
	mov r10, qword[rbp-16]
	mov r11, qword[rbp-40]
	add r11, r10
	mov qword[rbp-40], r11
_LFORCMP_0x5:
;[[ id : a], [ < : <], [ id : max]]
	mov r11, rbx
	mov r10, qword[rbp-40]
	cmp r10, r11
	setl r10b
	mov al, r10b
	and al, 1
	jnz _LFORTOP_0x4
_LFOREND_0x7:
;[[ int : 1]]
	mov rax, 1
	jmp ___bool_all_of_raw_piterablesize_tsize_tvoid.__return
___bool_all_of_raw_piterablesize_tsize_tvoid.__return:
	leave
	ret
	;[ function bool any_of_raw( [[iterable array @ 8], [size_t itemsize @ 16], [size_t items @ 24], [void. cmpfn @ 32]] ) ]
_bool_any_of_raw_piterablesize_tsize_tvoid.:
	push rbp
	mov rbp, rsp
	sub rsp, 48
;Load Parameter: [iterable array @ 8]
	mov [rbp-8], rdi
;Load Parameter: [size_t itemsize @ 16]
	mov [rbp-16], rsi
;Load Parameter: [size_t items @ 24]
	mov [rbp-24], rdx
;Load Parameter: [void. cmpfn @ 32]
	mov [rbp-32], rcx
;[[ id : array], [ + : +], [ ( : (], [ id : itemsize], [ * : *], [ id : items], [ ) : )]]
	mov r11, qword[rbp-24]
	mov r10, qword[rbp-16]
	imul r10, r11
	mov r11, qword[rbp-8]
	add r11, r10
	mov rbx, r11
;[[ id : array]]
	mov r10, qword[rbp-8]
	mov qword[rbp-40], r10
	jmp _LFORCMP_0xb
_LFORTOP_0xa:
	push rbx
;[[ @ : @], [ id : a]]
	mov r10, qword[rbp-40]
	mov r11, qword[r10]
	mov rdi, r11
	xor rax, rax
	call qword[rbp-32]
	mov r10, rax
	pop rbx
	mov rax, r10
	push rax
;[[ fn(x) : [ function void. cmpfn( [[iterable parameter @ 0]] ) ] ]]
	pop rax
	and al, 1
	jz _LIFPOST_0xe
;[[ int : 1]]
	mov rax, 1
	jmp ___bool_any_of_raw_piterablesize_tsize_tvoid.__return
	jmp _LIFELSE_0xf
_LIFPOST_0xe:
_LIFELSE_0xf:
_LFORUPDATE_0xc:
;[[ id : a]]
;[[ id : a]]
;[[ id : itemsize]]
	mov r10, qword[rbp-16]
	mov r11, qword[rbp-40]
	add r11, r10
	mov qword[rbp-40], r11
_LFORCMP_0xb:
;[[ id : a], [ < : <], [ id : max]]
	mov r11, rbx
	mov r10, qword[rbp-40]
	cmp r10, r11
	setl r10b
	mov al, r10b
	and al, 1
	jnz _LFORTOP_0xa
_LFOREND_0xd:
;[[ int : 0]]
	xor rax, rax
	jmp ___bool_any_of_raw_piterablesize_tsize_tvoid.__return
___bool_any_of_raw_piterablesize_tsize_tvoid.__return:
	leave
	ret
	;[ function bool none_of_raw( [[iterable array @ 8], [size_t itemsize @ 16], [size_t items @ 24], [void. cmpfn @ 32]] ) ]
_bool_none_of_raw_piterablesize_tsize_tvoid.:
	push rbp
	mov rbp, rsp
	sub rsp, 48
;Load Parameter: [iterable array @ 8]
	mov [rbp-8], rdi
;Load Parameter: [size_t itemsize @ 16]
	mov [rbp-16], rsi
;Load Parameter: [size_t items @ 24]
	mov [rbp-24], rdx
;Load Parameter: [void. cmpfn @ 32]
	mov [rbp-32], rcx
;[[ id : array], [ + : +], [ ( : (], [ id : itemsize], [ * : *], [ id : items], [ ) : )]]
	mov r11, qword[rbp-24]
	mov r10, qword[rbp-16]
	imul r10, r11
	mov r11, qword[rbp-8]
	add r11, r10
	mov rbx, r11
;[[ id : array]]
	mov r10, qword[rbp-8]
	mov qword[rbp-40], r10
	jmp _LFORCMP_0x11
_LFORTOP_0x10:
	push rbx
;[[ @ : @], [ id : a]]
	mov r10, qword[rbp-40]
	mov r11, qword[r10]
	mov rdi, r11
	xor rax, rax
	call qword[rbp-32]
	mov r10, rax
	pop rbx
	mov rax, r10
	push rax
;[[ fn(x) : [ function void. cmpfn( [[iterable parameter @ 0]] ) ] ]]
	pop rax
	and al, 1
	jz _LIFPOST_0x14
;[[ int : 0]]
	xor rax, rax
	jmp ___bool_none_of_raw_piterablesize_tsize_tvoid.__return
	jmp _LIFELSE_0x15
_LIFPOST_0x14:
_LIFELSE_0x15:
_LFORUPDATE_0x12:
;[[ id : a]]
;[[ id : a]]
;[[ id : itemsize]]
	mov r10, qword[rbp-16]
	mov r11, qword[rbp-40]
	add r11, r10
	mov qword[rbp-40], r11
_LFORCMP_0x11:
;[[ id : a], [ < : <], [ id : max]]
	mov r11, rbx
	mov r10, qword[rbp-40]
	cmp r10, r11
	setl r10b
	mov al, r10b
	and al, 1
	jnz _LFORTOP_0x10
_LFOREND_0x13:
;[[ int : 1]]
	mov rax, 1
	jmp ___bool_none_of_raw_piterablesize_tsize_tvoid.__return
___bool_none_of_raw_piterablesize_tsize_tvoid.__return:
	leave
	ret
	;[ function double sqrt( [[double a @ 8]] ) ]
_double_sqrt_pdouble:
	push rbp
	mov rbp, rsp
	sub rsp, 16
;Load Parameter: [double a @ 8]
	movsd [rbp-8], xmm0
	sqrtsd xmm0, xmm0
___double_sqrt_pdouble__return:
	leave
	ret
	;[ function double sqrt( [[int a @ 8]] ) ]
_double_sqrt_pint:
	push rbp
	mov rbp, rsp
	sub rsp, 16
;Load Parameter: [int a @ 8]
	mov [rbp-8], rdi
	cvtsi2sd xmm0, rdi
	sqrtsd xmm0, xmm0
___double_sqrt_pint__return:
	leave
	ret
	;[ function long sqrt( [[long a @ 8]] ) ]
_long_sqrt_plong:
	push rbp
	mov rbp, rsp
	sub rsp, 16
;Load Parameter: [long a @ 8]
	mov [rbp-8], rdi
	cvtsi2sd xmm0, rdi
	sqrtsd xmm0, xmm0
	cvttsd2si rax, xmm0
___long_sqrt_plong__return:
	leave
	ret
	;[ function long pow( [[long base @ 8], [long exp @ 16]] ) ]
_long_pow_plonglong:
	push rbp
	mov rbp, rsp
	sub rsp, 24
;Load Parameter: [long base @ 8]
	mov [rbp-8], rdi
;Load Parameter: [long exp @ 16]
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
	;[ function double pow( [[long base @ 8], [long exp @ 16]] ) ]
_double_pow_plonglong:
	push rbp
	mov rbp, rsp
	sub rsp, 24
;Load Parameter: [long base @ 8]
	mov [rbp-8], rdi
;Load Parameter: [long exp @ 16]
	mov [rbp-16], rsi
;[[ id : exp]]
	mov rbx, qword[rbp-16]
	mov rsi, rbx
;[[ id : base]]
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	xor rax, rax
	call _long_pow_plonglong
	push rax
;[[ fn(x) : [ function long pow( [[long base @ 8], [long exp @ 16]] ) ] ]]
	pop rax
	cvtsi2sd xmm0, rax
___double_pow_plonglong__return:
	leave
	ret
	;[ function double pow( [[double base @ 8], [long exp @ 16]] ) ]
_double_pow_pdoublelong:
	push rbp
	mov rbp, rsp
	sub rsp, 24
;Load Parameter: [double base @ 8]
	movsd [rbp-8], xmm0
;Load Parameter: [long exp @ 16]
	mov [rbp-16], rdi
	dec rdi
_double_pow_pdoubleint_flp:
	mulsd xmm0, xmm0
	dec rdi
	jnz _int_pow_pintint_flp
___double_pow_pdoublelong__return:
	leave
	ret
	;[ function long round( [[double x @ 8]] ) ]
_long_round_pdouble:
	push rbp
	mov rbp, rsp
	sub rsp, 16
;Load Parameter: [double x @ 8]
	movsd [rbp-8], xmm0
	cvtsd2si rax, xmm0
___long_round_pdouble__return:
	leave
	ret
	;[ function long ceil( [[double x @ 8]] ) ]
_long_ceil_pdouble:
	push rbp
	mov rbp, rsp
	sub rsp, 16
;Load Parameter: [double x @ 8]
	movsd [rbp-8], xmm0
;[[ int : 0], [ - : -], [ id : x]]
	xor rbx, rbx
	movsd xmm7, qword[rbp-8]
	cvtsi2sd xmm8, rbx
	subsd xmm8, xmm7
	movsd xmm0, xmm8
	mov rax, 1
	call _long_floor_pdouble
	push rax
;[[ int : 0], [ - : -], [ fn(x) : [ function long floor( [[double x @ 0]] ) ] ]]
	pop r10
	xor rbx, rbx
	sub rbx, r10
	mov rax, rbx
	jmp ___long_ceil_pdouble__return
___long_ceil_pdouble__return:
	leave
	ret
	;[ function long trunc( [[double x @ 8]] ) ]
_long_trunc_pdouble:
	push rbp
	mov rbp, rsp
	sub rsp, 16
;Load Parameter: [double x @ 8]
	movsd [rbp-8], xmm0
	cvttsd2si rax, xmm0
___long_trunc_pdouble__return:
	leave
	ret
	;[ function long floor( [[double x @ 8]] ) ]
_long_floor_pdouble:
	push rbp
	mov rbp, rsp
	sub rsp, 16
;Load Parameter: [double x @ 8]
	movsd [rbp-8], xmm0
;[[ id : x], [ - : -], [ id : FLT_CONSTANT_1]]
	movsd xmm8, qword[FLT_CONSTANT_1]
	movsd xmm7, qword[rbp-8]
	subsd xmm7, xmm8
	movsd xmm0, xmm7
	mov rax, 1
	call _long_round_pdouble
	push rax
;[[ fn(x) : [ function long round( [[double x @ 8]] ) ] ]]
	pop rax
	jmp ___long_floor_pdouble__return
___long_floor_pdouble__return:
	leave
	ret
	;[ function long abs( [[long x @ 8]] ) ]
_long_abs_plong:
	push rbp
	mov rbp, rsp
	sub rsp, 16
;Load Parameter: [long x @ 8]
	mov [rbp-8], rdi
	mov rax, rdi
	sar rdi, 63
	xor rax, rdi
	sub rax, rdi
___long_abs_plong__return:
	leave
	ret
	;[ function double abs( [[double x @ 8]] ) ]
_double_abs_pdouble:
	push rbp
	mov rbp, rsp
	sub rsp, 16
;Load Parameter: [double x @ 8]
	movsd [rbp-8], xmm0
	movq rax, xmm0
	shr rax, 1
	shl rax, 1
	movq xmm0, rax 
___double_abs_pdouble__return:
	leave
	ret
	;[ function long log( [[long x @ 8]] ) ]
_long_log_plong:
	push rbp
	mov rbp, rsp
	sub rsp, 16
;Load Parameter: [long x @ 8]
	mov [rbp-8], rdi
;[[ id : x]]
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	xor rax, rax
	call _long_log2_plong
	push rax
;[[ fn(x) : [ function long log2( [[long n @ 0]] ) ] ], [ / : /], [ int : 3]]
	mov r10, 3
	pop rbx
	xor rdx, rdx
	mov rax, rbx
	idiv r10
	mov rbx, rax
	mov rax, rax
	jmp ___long_log_plong__return
___long_log_plong__return:
	leave
	ret
	;[ function long log( [[long base @ 8], [long n @ 16]] ) ]
_long_log_plonglong:
	push rbp
	mov rbp, rsp
	sub rsp, 24
;Load Parameter: [long base @ 8]
	mov [rbp-8], rdi
;Load Parameter: [long n @ 16]
	mov [rbp-16], rsi
;[[ id : n]]
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	xor rax, rax
	call _long_log2_plong
	push rax
;[[ id : base]]
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	xor rax, rax
	call _long_log2_plong
	push rax
;[[ fn(x) : [ function long log2( [[long n @ 0]] ) ] ], [ / : /], [ fn(x) : [ function long log2( [[long n @ 0]] ) ] ]]
	pop r10
	pop rbx
	xor rdx, rdx
	mov rax, rbx
	idiv r10
	mov rbx, rax
	mov rax, rax
	jmp ___long_log_plonglong__return
___long_log_plonglong__return:
	leave
	ret
	;[ function long log2( [[long n @ 8]] ) ]
_long_log2_plong:
	push rbp
	mov rbp, rsp
	sub rsp, 16
;Load Parameter: [long n @ 8]
	mov [rbp-8], rdi
	xor rax, rax
_L_0x20_long_lop2_plong_flp:
	sar rdi, 1
	inc rax
	test rdi, rdi
	jnz _L_0x20_long_lop2_plong_flp
	dec rax
___long_log2_plong__return:
	leave
	ret
	;[ function double fmod( [[double x @ 8], [double n @ 16]] ) ]
_double_fmod_pdoubledouble:
	push rbp
	mov rbp, rsp
	sub rsp, 24
;Load Parameter: [double x @ 8]
	movsd [rbp-8], xmm0
;Load Parameter: [double n @ 16]
	movsd [rbp-16], xmm1
;[[ id : x], [ / : /], [ id : n]]
	movsd xmm8, qword[rbp-16]
	movsd xmm7, qword[rbp-8]
	divsd xmm7, xmm8
	movsd xmm0, xmm7
	mov rax, 1
	call _long_floor_pdouble
	push rax
;[[ ( : (], [ int : 0], [ - : -], [ id : n], [ ) : )], [ * : *], [ ( : (], [ fn(x) : [ function long floor( [[double x @ 8]] ) ] ], [ ) : )], [ + : +], [ id : x]]
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
	;[ function int strcpy( [[char. dest @ 8], [char. source @ 16]] ) ]
_int_strcpy_pchar.char.:
	push rbp
	mov rbp, rsp
	sub rsp, 24
;Load Parameter: [char. dest @ 8]
	mov [rbp-8], rdi
;Load Parameter: [char. source @ 16]
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
	;[ function size_t strlen( [[char. str @ 8]] ) ]
_size_t_strlen_pchar.:
	push rbp
	mov rbp, rsp
	sub rsp, 16
;Load Parameter: [char. str @ 8]
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
	;[ function char. memchr( [[char. str @ 8], [char c @ 16], [size_t n @ 24]] ) ]
_char._memchr_pchar.charsize_t:
	push rbp
	mov rbp, rsp
	sub rsp, 32
;Load Parameter: [char. str @ 8]
	mov [rbp-8], rdi
;Load Parameter: [char c @ 16]
	mov [rbp-16], rsi
;Load Parameter: [size_t n @ 24]
	mov [rbp-24], rdx
;[[ id : str], [ + : +], [ id : n]]
	mov r11, qword[rbp-8]
	mov r10, qword[rbp-24]
	add r11, r10
	mov rbx, r11
	jmp _LWHILECMP_0x24
_LWHILESTART_0x23:
;[[ @ : @], [ id : str], [ == : ==], [ id : c]]
	mov r10, qword[rbp-8]
	and r11, 0xff
	mov r11b, byte[r10]
	mov r10b, byte[rbp-16]
	cmp r11b, r10b
	sete r11b
	mov al, r11b
	and al, 1
	jz _LIFPOST_0x26
;[[ id : str]]
	mov r10, qword[rbp-8]
	mov rax, r10
	jmp ___char._memchr_pchar.charsize_t__return
	jmp _LIFELSE_0x27
_LIFPOST_0x26:
_LIFELSE_0x27:
;[[ id : str], [ ++ : ++]]
	inc qword[rbp-8]
_LWHILECMP_0x24:
;[[ id : str], [ < : <], [ id : finalptr]]
	mov r11, qword[rbp-8]
	mov r10, rbx
	cmp r11, r10
	setl r11b
	mov al, r11b
	and al, 1
	jnz _LWHILESTART_0x23
_LWHILEEND_0x25:
;[[ int : 0]]
	xor rax, rax
	jmp ___char._memchr_pchar.charsize_t__return
___char._memchr_pchar.charsize_t__return:
	leave
	ret
	;[ function int memcmp( [[char. str1 @ 8], [char. str2 @ 16], [size_t n @ 24]] ) ]
_int_memcmp_pchar.char.size_t:
	push rbp
	mov rbp, rsp
	sub rsp, 32
;Load Parameter: [char. str1 @ 8]
	mov [rbp-8], rdi
;Load Parameter: [char. str2 @ 16]
	mov [rbp-16], rsi
;Load Parameter: [size_t n @ 24]
	mov [rbp-24], rdx
;[[ int : 0]]
	xor ebx, ebx
;[[ id : str1], [ + : +], [ id : n]]
	mov r12, qword[rbp-8]
	mov r11, qword[rbp-24]
	add r12, r11
	mov r10, r12
	jmp _LWHILECMP_0x29
_LWHILESTART_0x28:
;[[ @ : @], [ id : str1], [ < : <], [ @ : @], [ id : str2]]
	mov r11, qword[rbp-8]
	and r12, 0xff
	mov r12b, byte[r11]
	mov r11, qword[rbp-16]
	and r13, 0xff
	mov r13b, byte[r11]
	cmp r12b, r13b
	setl r12b
	mov al, r12b
	and al, 1
	jz _LIFPOST_0x2b
;[[ id : value], [ -- : --]]
	dec ebx
	jmp _LIFELSE_0x2c
_LIFPOST_0x2b:
;[[ id : value], [ ++ : ++]]
	inc ebx
_LIFELSE_0x2c:
;[[ id : str1], [ ++ : ++]]
	inc qword[rbp-8]
;[[ id : str2], [ ++ : ++]]
	inc qword[rbp-16]
_LWHILECMP_0x29:
;[[ id : str1], [ < : <], [ id : maxstr]]
	mov r12, qword[rbp-8]
	mov r11, r10
	cmp r12, r11
	setl r12b
	mov al, r12b
	and al, 1
	jnz _LWHILESTART_0x28
_LWHILEEND_0x2a:
;[[ id : value]]
	mov r11d, ebx
	mov eax, ebx
	jmp ___int_memcmp_pchar.char.size_t__return
___int_memcmp_pchar.char.size_t__return:
	leave
	ret
	;[ function char. strcat( [[char. dest @ 0], [char. source @ 0]] ) ]
	;[ function char. strncat( [[char. dest @ 0], [char. source @ 0], [size_t n @ 0]] ) ]
	;[ function char. strchr( [[char. str @ 8], [char c @ 16]] ) ]
_char._strchr_pchar.char:
	push rbp
	mov rbp, rsp
	sub rsp, 24
;Load Parameter: [char. str @ 8]
	mov [rbp-8], rdi
;Load Parameter: [char c @ 16]
	mov [rbp-16], rsi
	jmp _LWHILECMP_0x2e
_LWHILESTART_0x2d:
;[[ @ : @], [ id : str], [ == : ==], [ id : c]]
	mov rbx, qword[rbp-8]
	and r10, 0xff
	mov r10b, byte[rbx]
	mov bl, byte[rbp-16]
	cmp r10b, bl
	sete r10b
	mov al, r10b
	and al, 1
	jz _LIFPOST_0x30
;[[ id : str]]
	mov rbx, qword[rbp-8]
	mov rax, rbx
	jmp ___char._strchr_pchar.char__return
	jmp _LIFELSE_0x31
_LIFPOST_0x30:
_LIFELSE_0x31:
;[[ id : str], [ ++ : ++]]
	inc qword[rbp-8]
_LWHILECMP_0x2e:
;[[ @ : @], [ id : str], [ != : !=], [ int : 0]]
	mov rbx, qword[rbp-8]
	and r10, 0xff
	mov r10b, byte[rbx]
	test r10b, r10b
	setnz r10b
	mov al, r10b
	and al, 1
	jnz _LWHILESTART_0x2d
_LWHILEEND_0x2f:
;[[ int : 0]]
	xor rax, rax
	jmp ___char._strchr_pchar.char__return
___char._strchr_pchar.char__return:
	leave
	ret
	;[ function int strcmp( [[char. str1 @ 0], [char str2 @ 0]] ) ]
	;[ function size_t strcspn( [[char. str1 @ 0], [char. str2 @ 0]] ) ]
	;[ function char. strerror( [[long errnum @ 8]] ) ]
_char._strerror_plong:
	push rbp
	mov rbp, rsp
	sub rsp, 16
;Load Parameter: [long errnum @ 8]
	mov [rbp-8], rdi
;[[ id : errnum], [ >= : >=], [ int : 0]]
	xor r10, r10
	mov rbx, qword[rbp-8]
	cmp rbx, r10
	setge bl
	mov al, bl
	and al, 1
	jz _LIFPOST_0x32
;[[ id : errnum]]
	mov rdi, qword[rbp-8]
	and rdi, 0xffffffff
	xor rax, rax
	call _char._get_errstr_pint
	push rax
;[[ fn(x) : [ function char. get_errstr( [[int err @ 8]] ) ] ]]
	pop rax
	jmp ___char._strerror_plong__return
	jmp _LIFELSE_0x33
_LIFPOST_0x32:
;[[ int : 0], [ - : -], [ id : errnum]]
	mov r10, qword[rbp-8]
	xor rbx, rbx
	sub rbx, r10
	mov edi, ebx
	and rdi, 0xffffffff
	xor rax, rax
	call _char._get_errstr_pint
	push rax
;[[ fn(x) : [ function char. get_errstr( [[int err @ 8]] ) ] ]]
	pop rax
	jmp ___char._strerror_plong__return
_LIFELSE_0x33:
;[[ int : 0]]
	xor rax, rax
	jmp ___char._strerror_plong__return
___char._strerror_plong__return:
	leave
	ret
	;[ function char. strpbrk( [[char. str1 @ 0], [char. str2 @ 0]] ) ]
	;[ function char. strrchr( [[char. str @ 0], [char c @ 0]] ) ]
	;[ function size_t strspn( [[char. str1 @ 0], [char. str2 @ 0]] ) ]
	;[ function char. strstr( [[char. haystack @ 0], [char. needle @ 0]] ) ]
	;[ function char.. strtok( [[char. str @ 0], [char delim @ 0]] ) ]
	;[ function long toStr( [[long val @ 8], [char. buffer @ 16], [bool signed @ 24], [short base @ 32]] ) ]
_long_toStr_plongchar.boolshort:
	push rbp
	mov rbp, rsp
	sub rsp, 144
;Load Parameter: [long val @ 8]
	mov [rbp-8], rdi
;Load Parameter: [char. buffer @ 16]
	mov [rbp-16], rsi
;Load Parameter: [bool signed @ 24]
	mov [rbp-24], rdx
;Load Parameter: [short base @ 32]
	mov [rbp-32], rcx
;[[ id : val], [ == : ==], [ int : 0]]
	mov rbx, qword[rbp-8]
	test rbx, rbx
	setz bl
	mov al, bl
	and al, 1
	jz _LIFPOST_0x34
;[[ @ : @], [ id : buffer]]
	mov rbx, qword[rbp-16]
;[[ @ : @], [ id : buffer]]
	mov rbx, qword[rbp-16]
;[[ char : 48]]
	mov r10b, 48
	mov byte[rbx], 48
;[[ int : 1]]
	mov rax, 1
	jmp ___long_toStr_plongchar.boolshort__return
	jmp _LIFELSE_0x35
_LIFPOST_0x34:
_LIFELSE_0x35:
;[[ int : 0]]
	mov byte[rbp-40], 0
;[[ id : val], [ < : <], [ int : 0], [ && : &&], [ id : signed]]
	xor r10, r10
	mov rbx, qword[rbp-8]
	cmp rbx, r10
	setl bl
	mov r10b, byte[rbp-24]
	and bl, r10b
	mov al, bl
	and al, 1
	jz _LIFPOST_0x36
;[[ @ : @], [ id : buffer]]
	mov rbx, qword[rbp-16]
;[[ @ : @], [ id : buffer]]
	mov rbx, qword[rbp-16]
;[[ char : 45]]
	mov r10b, 45
	mov byte[rbx], 45
;[[ id : buffer]]
;[[ id : buffer]]
;[[ int : 1]]
	mov rbx, 1
	mov r10, qword[rbp-16]
	add r10, rbx
	mov qword[rbp-16], r10
;[[ id : val]]
;[[ id : val]]
;[[ int : 0], [ - : -], [ id : val]]
	mov r11, qword[rbp-8]
	xor r10, r10
	sub r10, r11
	mov rbx, r10
	mov qword[rbp-8], r10
;[[ id : signspace]]
;[[ id : signspace]]
;[[ int : 1]]
	mov rbx, 1
	mov byte[rbp-40], bl
	jmp _LIFELSE_0x37
_LIFPOST_0x36:
_LIFELSE_0x37:
;[[ int : 64]]
	mov rdx, 64
;[[ int : 0]]
	xor rsi, rsi
	and rsi, 0xff
;[[ & : &], [ id : tmpbuf]]
	lea rbx, [rbp-112]
	mov rdi, rbx
	xor rax, rax
	call _void_memset_pvoid.ucharsize_t
	push rax
;[[ fn(x) : [ function void memset( [[void. dest @ 0], [uchar value @ 0], [size_t bytes @ 0]] ) ] ]]
	pop rax
;[[ int : 0]]
	mov dword[rbp-120], 0
	jmp _LWHILECMP_0x39
_LWHILESTART_0x38:
;[[ id : val]]
;[[ id : val]]
;[[ & : &], [ id : mod]]
	lea r10, [rbp-128]
	mov rdx, r10
;[[ id : base]]
	mov si, word[rbp-32]
;[[ id : val]]
	mov r10, qword[rbp-8]
	mov rdi, r10
	xor rax, rax
	mov rbx, rdx
	xor rdx, rdx
	mov rax, rdi
	div rsi
	mov [rbx], rdx
_LINLINERETURN_0x3c:
	push rax
;[[ fn(x) : [ function long divmod( [[long dividend @ rdi], [long divisor @ rsi], [long. modulus @ rdx]] ) ] ]]
	pop rbx
	mov qword[rbp-8], rbx
;[[ id : tmpbuf], [ [ : [], [ id : len], [ ] : ]]]
	mov r10d, dword[rbp-120]
	lea rbx, [rbp-112] 
	and r10, 0xffffffff
	lea rbx, [rbx+r10*1]
;[[ id : tmpbuf], [ [ : [], [ id : len], [ ] : ]]]
	mov r10d, dword[rbp-120]
	lea rbx, [rbp-112] 
	and r10, 0xffffffff
	lea rbx, [rbx+r10*1]
;[[ id : __numbercharactersbase1016], [ [ : [], [ id : mod], [ ] : ]]]
	mov r12b, byte[rbp-128]
	mov r11, __numbercharactersbase1016
	and r12, 0xff
	lea r11, [r11+r12*1]
	mov r11b, byte[r11]
	and r11, 0xff
	mov r10b, r11b
	mov byte[rbx], r11b
;[[ id : len]]
;[[ id : len]]
;[[ int : 1]]
	mov rbx, 1
	mov r10d, dword[rbp-120]
	add r10d, ebx
	mov dword[rbp-120], r10d
_LWHILECMP_0x39:
;[[ id : val], [ != : !=], [ int : 0]]
	mov rbx, qword[rbp-8]
	test rbx, rbx
	setnz bl
	mov al, bl
	and al, 1
	jnz _LWHILESTART_0x38
_LWHILEEND_0x3a:
;[[ id : len]]
	mov ebx, dword[rbp-120]
	mov dword[rbp-136], ebx
	jmp _LFORCMP_0x3f
_LFORTOP_0x3e:
;[[ id : buffer], [ [ : [], [ id : i], [ ] : ]]]
	mov r10d, dword[rbp-136]
	mov rbx, qword[rbp-16]
	and r10, 0xffffffff
	lea rbx, [rbx+r10*1]
;[[ id : buffer], [ [ : [], [ id : i], [ ] : ]]]
	mov r10d, dword[rbp-136]
	mov rbx, qword[rbp-16]
	and r10, 0xffffffff
	lea rbx, [rbx+r10*1]
;[[ id : tmpbuf], [ [ : [], [ id : len], [ - : -], [ id : i], [ ] : ]]]
	mov r12d, dword[rbp-136]
	mov r11d, dword[rbp-120]
	sub r11d, r12d
	lea r12, [rbp-112] 
	and r11, 0xffffffff
	lea r12, [r12+r11*1]
	mov r12b, byte[r12]
	and r12, 0xff
	mov r10b, r12b
	mov byte[rbx], r12b
_LFORUPDATE_0x40:
;[[ id : i], [ -- : --]]
	dec dword[rbp-136]
_LFORCMP_0x3f:
;[[ id : i], [ > : >], [ int : 0]]
	mov r10d, dword[rbp-136]
	xor rbx, rbx
	mov r11, r10
	cmp r11, rbx
	setg r11b
	mov al, r11b
	and al, 1
	jnz _LFORTOP_0x3e
_LFOREND_0x41:
;[[ id : len], [ + : +], [ int : 1], [ + : +], [ id : signspace]]
	mov ebx, dword[rbp-120]
	inc ebx
	mov r10b, byte[rbp-40]
	and r11d, 0xffffffff
	mov r11d, r10d
	add ebx, r11d
	mov rax, rbx
	jmp ___long_toStr_plongchar.boolshort__return
___long_toStr_plongchar.boolshort__return:
	leave
	ret
	;[ function long toStr( [[double val @ 8], [char. buffer @ 16], [long multiplier @ 24]] ) ]
_long_toStr_pdoublechar.long:
	push rbp
	mov rbp, rsp
	sub rsp, 48
;Load Parameter: [double val @ 8]
	movsd [rbp-8], xmm0
;Load Parameter: [char. buffer @ 16]
	mov [rbp-16], rdi
;Load Parameter: [long multiplier @ 24]
	mov [rbp-24], rsi
;[[ id : val]]
	cvttsd2si rbx, qword[rbp-8]
	mov qword[rbp-32], rbx
;[[ int : 10]]
	mov rcx, 10
	and rcx, 0xffff
;[[ int : 1]]
	mov rdx, 1
	and rdx, 0xff
;[[ id : buffer]]
	mov rbx, qword[rbp-16]
	mov rsi, rbx
;[[ id : integral]]
	mov rbx, qword[rbp-32]
	mov rdi, rbx
	xor rax, rax
	call _long_toStr_plongchar.boolshort
	push rax
;[[ fn(x) : [ function long toStr( [[long val @ 8], [char. buffer @ 16], [bool signed @ 24], [short base @ 32]] ) ] ]]
	pop rax
	mov qword[rbp-40], rax
;[[ id : buffer]]
;[[ id : buffer]]
;[[ id : l]]
	mov rbx, qword[rbp-40]
	mov r10, qword[rbp-16]
	add r10, rbx
	mov qword[rbp-16], r10
;[[ id : val]]
;[[ id : val]]
;[[ id : val]]
	movsd xmm8, qword[rbp-8]
	movsd xmm0, xmm8
	mov rax, 1
	call _double_abs_pdouble
	movq rax, xmm0
	push rax
;[[ fn(x) : [ function double abs( [[double x @ 8]] ) ] ]]
	pop rax
	movq xmm7, rax
	movsd qword[rbp-8], xmm7
;[[ id : val]]
;[[ id : val]]
;[[ id : integral]]
	mov rbx, qword[rbp-32]
	mov rdi, rbx
	xor rax, rax
	call _long_abs_plong
	push rax
;[[ fn(x) : [ function long abs( [[long x @ 8]] ) ] ]]
	pop rax
	cvtsi2sd xmm7, rax
	movsd xmm8, qword[rbp-8]
	subsd xmm8, xmm7
	movsd qword[rbp-8], xmm8
;[[ id : val]]
;[[ id : val]]
;[[ id : multiplier]]
	cvtsi2sd xmm7, qword[rbp-24]
	movsd xmm8, qword[rbp-8]
	mulsd xmm8, xmm7
	movsd qword[rbp-8], xmm8
;[[ @ : @], [ id : buffer]]
	mov rbx, qword[rbp-16]
;[[ @ : @], [ id : buffer]]
	mov rbx, qword[rbp-16]
;[[ char : 46]]
	mov r10b, 46
	mov byte[rbx], 46
;[[ id : buffer], [ ++ : ++]]
	inc qword[rbp-16]
;[[ id : l]]
;[[ id : l]]
;[[ int : 10]]
	mov rcx, 10
	and rcx, 0xffff
;[[ int : 0]]
	xor rdx, rdx
	and rdx, 0xff
;[[ id : buffer]]
	mov r10, qword[rbp-16]
	mov rsi, r10
;[[ id : val]]
	movsd xmm7, qword[rbp-8]
	movsd xmm0, xmm7
	mov rax, 1
	call _long_round_pdouble
	push rax
;[[ fn(x) : [ function long round( [[double x @ 8]] ) ] ]]
	pop rdi
	xor rax, rax
	call _long_toStr_plongchar.boolshort
	push rax
;[[ fn(x) : [ function long toStr( [[long val @ 8], [char. buffer @ 16], [bool signed @ 24], [short base @ 32]] ) ] ]]
	pop rbx
	mov r11, qword[rbp-40]
	add r11, rbx
	mov qword[rbp-40], r11
;[[ id : l], [ + : +], [ int : 1]]
	mov rbx, qword[rbp-40]
	inc rbx
	mov rax, rbx
	jmp ___long_toStr_pdoublechar.long__return
___long_toStr_pdoublechar.long__return:
	leave
	ret
	;[ function int __sprintf( [[char. str @ 8], [char. fmt @ 16], [void. args @ 24]] ) ]
_int___sprintf_pchar.char.void.:
	push rbp
	mov rbp, rsp
	sub rsp, 192
;Load Parameter: [char. str @ 8]
	mov [rbp-8], rdi
;Load Parameter: [char. fmt @ 16]
	mov [rbp-16], rsi
;Load Parameter: [void. args @ 24]
	mov [rbp-24], rdx
;[[ int : 0]]
	mov dword[rbp-32], 0
;[[ id : str]]
	mov rbx, qword[rbp-8]
	mov qword[rbp-40], rbx
;[[ id : str], [ == : ==], [ int : 0], [ || : ||], [ id : fmt], [ == : ==], [ int : 0]]
	mov rbx, qword[rbp-8]
	test rbx, rbx
	setz bl
	mov r10, qword[rbp-16]
	test r10, r10
	setz r10b
	or bl, r10b
	mov al, bl
	and al, 1
	jz _LIFPOST_0x42
;[[ int : 0]]
	xor rax, rax
	jmp ___int___sprintf_pchar.char.void.__return
	jmp _LIFELSE_0x43
_LIFPOST_0x42:
_LIFELSE_0x43:
	jmp _LWHILECMP_0x45
_LWHILESTART_0x44:
;[[ @ : @], [ id : fmt], [ != : !=], [ char : 37]]
	mov rbx, qword[rbp-16]
	and r10, 0xff
	mov r10b, byte[rbx]
	mov bl, 37
	cmp r10b, bl
	setne r10b
	mov al, r10b
	and al, 1
	jz _LIFPOST_0x47
;[[ @ : @], [ id : str]]
	mov rbx, qword[rbp-8]
;[[ @ : @], [ id : str]]
	mov rbx, qword[rbp-8]
;[[ @ : @], [ id : fmt]]
	mov r11, qword[rbp-16]
	and r12, 0xff
	mov r12b, byte[r11]
	mov r10b, r12b
	mov byte[rbx], r12b
	jmp _LIFELSE_0x48
_LIFPOST_0x47:
;[[ id : fmt]]
;[[ id : fmt]]
;[[ int : 1]]
	mov rbx, 1
	mov r10, qword[rbp-16]
	add r10, rbx
	mov qword[rbp-16], r10
;[[ @ : @], [ id : fmt]]
	mov rbx, qword[rbp-16]
	and r10, 0xff
	mov r10b, byte[rbx]
	mov byte[rbp-48], r10b
;[[ ( : (], [ id : c], [ ) : )]]
	mov r10b, byte[rbp-48]
	mov bl, r10b
	cmp bl, 105
	je _LSWITCHCASE_0x4a
	cmp bl, 99
	je _LSWITCHCASE_0x4b
	cmp bl, 120
	je _LSWITCHCASE_0x4c
	cmp bl, 111
	je _LSWITCHCASE_0x4d
	cmp bl, 117
	je _LSWITCHCASE_0x4e
	cmp bl, 115
	je _LSWITCHCASE_0x4f
	cmp bl, 98
	je _LSWITCHCASE_0x50
	cmp bl, 100
	je _LSWITCHCASE_0x53
	cmp bl, 102
	je _LSWITCHCASE_0x54
	jmp _LSWITCHEND_0x49
_LSWITCHCASE_0x4a:
;[[ ( : (], [ id : args], [ [ : [], [ id : argc], [ ] : ]], [ ) : )]]
	mov r11d, dword[rbp-32]
	mov r10, qword[rbp-24]
	and r11, 0xffffffff
	lea r10, [r10+r11*8]
	mov r10, qword[r10]
	mov qword[rbp-56], r10
;[[ int : 10]]
	mov rcx, 10
	and rcx, 0xffff
;[[ int : 1]]
	mov rdx, 1
	and rdx, 0xff
;[[ id : str]]
	mov r10, qword[rbp-8]
	mov rsi, r10
;[[ id : num]]
	mov r10, qword[rbp-56]
	mov rdi, r10
	xor rax, rax
	call _long_toStr_plongchar.boolshort
	push rax
;[[ fn(x) : [ function long toStr( [[long val @ 8], [char. buffer @ 16], [bool signed @ 24], [short base @ 32]] ) ] ]]
	pop rax
	mov qword[rbp-64], rax
;[[ id : str]]
;[[ id : str]]
;[[ id : size], [ - : -], [ int : 1]]
	mov r11, qword[rbp-64]
	dec r11
	mov r10, r11
	mov r11, qword[rbp-8]
	add r11, r10
	mov qword[rbp-8], r11
	jmp _LSWITCHEND_0x49
_LSWITCHCASE_0x4b:
;[[ $ : char], [ id : args], [ [ : [], [ id : argc], [ ] : ]]]
	mov r11d, dword[rbp-32]
	mov r10, qword[rbp-24]
	and r11, 0xffffffff
	lea r10, [r10+r11*8]
	mov r10, qword[r10]
	mov r11, r10
	and r12b, 0xff
	mov r12b, r11b
	mov byte[rbp-72], r11b
;[[ @ : @], [ id : str]]
	mov r10, qword[rbp-8]
;[[ @ : @], [ id : str]]
	mov r10, qword[rbp-8]
;[[ id : cf]]
	mov r12b, byte[rbp-72]
	mov r11b, r12b
	mov byte[r10], r12b
	jmp _LSWITCHEND_0x49
_LSWITCHCASE_0x4c:
;[[ ( : (], [ id : args], [ [ : [], [ id : argc], [ ] : ]], [ ) : )]]
	mov r11d, dword[rbp-32]
	mov r10, qword[rbp-24]
	and r11, 0xffffffff
	lea r10, [r10+r11*8]
	mov r10, qword[r10]
	mov qword[rbp-80], r10
;[[ int : 16]]
	mov rcx, 16
	and rcx, 0xffff
;[[ int : 0]]
	xor rdx, rdx
	and rdx, 0xff
;[[ id : str]]
	mov r10, qword[rbp-8]
	mov rsi, r10
;[[ id : numx]]
	mov r10, qword[rbp-80]
	mov rdi, r10
	xor rax, rax
	call _long_toStr_plongchar.boolshort
	push rax
;[[ fn(x) : [ function long toStr( [[long val @ 8], [char. buffer @ 16], [bool signed @ 24], [short base @ 32]] ) ] ]]
	pop rax
	mov qword[rbp-88], rax
;[[ id : str]]
;[[ id : str]]
;[[ id : sx], [ - : -], [ int : 1]]
	mov r11, qword[rbp-88]
	dec r11
	mov r10, r11
	mov r11, qword[rbp-8]
	add r11, r10
	mov qword[rbp-8], r11
	jmp _LSWITCHEND_0x49
_LSWITCHCASE_0x4d:
;[[ ( : (], [ id : args], [ [ : [], [ id : argc], [ ] : ]], [ ) : )]]
	mov r11d, dword[rbp-32]
	mov r10, qword[rbp-24]
	and r11, 0xffffffff
	lea r10, [r10+r11*8]
	mov r10, qword[r10]
	mov qword[rbp-96], r10
;[[ int : 8]]
	mov rcx, 8
	and rcx, 0xffff
;[[ int : 0]]
	xor rdx, rdx
	and rdx, 0xff
;[[ id : str]]
	mov r10, qword[rbp-8]
	mov rsi, r10
;[[ id : numo]]
	mov r10, qword[rbp-96]
	mov rdi, r10
	xor rax, rax
	call _long_toStr_plongchar.boolshort
	push rax
;[[ fn(x) : [ function long toStr( [[long val @ 8], [char. buffer @ 16], [bool signed @ 24], [short base @ 32]] ) ] ]]
	pop rax
	mov qword[rbp-104], rax
;[[ id : str]]
;[[ id : str]]
;[[ id : so], [ - : -], [ int : 1]]
	mov r11, qword[rbp-104]
	dec r11
	mov r10, r11
	mov r11, qword[rbp-8]
	add r11, r10
	mov qword[rbp-8], r11
	jmp _LSWITCHEND_0x49
_LSWITCHCASE_0x4e:
;[[ ( : (], [ id : args], [ [ : [], [ id : argc], [ ] : ]], [ ) : )]]
	mov r11d, dword[rbp-32]
	mov r10, qword[rbp-24]
	and r11, 0xffffffff
	lea r10, [r10+r11*8]
	mov r10, qword[r10]
	mov qword[rbp-112], r10
;[[ int : 10]]
	mov rcx, 10
	and rcx, 0xffff
;[[ int : 0]]
	xor rdx, rdx
	and rdx, 0xff
;[[ id : str]]
	mov r10, qword[rbp-8]
	mov rsi, r10
;[[ id : unum]]
	mov r10, qword[rbp-112]
	mov rdi, r10
	xor rax, rax
	call _long_toStr_plongchar.boolshort
	push rax
;[[ fn(x) : [ function long toStr( [[long val @ 8], [char. buffer @ 16], [bool signed @ 24], [short base @ 32]] ) ] ]]
	pop rax
	mov dword[rbp-120], eax
;[[ id : str]]
;[[ id : str]]
;[[ id : usize], [ - : -], [ int : 1]]
	mov r11d, dword[rbp-120]
	dec r11d
	mov r10, r11
	mov r11, qword[rbp-8]
	add r11, r10
	mov qword[rbp-8], r11
	jmp _LSWITCHEND_0x49
_LSWITCHCASE_0x4f:
;[[ id : args], [ [ : [], [ id : argc], [ ] : ]]]
	mov r11d, dword[rbp-32]
	mov r10, qword[rbp-24]
	and r11, 0xffffffff
	lea r10, [r10+r11*8]
	mov r10, qword[r10]
	mov rsi, r10
;[[ id : str]]
	mov r10, qword[rbp-8]
	mov rdi, r10
	xor rax, rax
	call _int_strcpy_pchar.char.
	push rax
;[[ fn(x) : [ function int strcpy( [[char. dest @ 8], [char. source @ 16]] ) ] ]]
	pop rax
	mov dword[rbp-128], eax
;[[ id : str]]
;[[ id : str]]
;[[ id : ssize], [ - : -], [ int : 1]]
	mov r11d, dword[rbp-128]
	dec r11d
	mov r10, r11
	mov r11, qword[rbp-8]
	add r11, r10
	mov qword[rbp-8], r11
	jmp _LSWITCHEND_0x49
_LSWITCHCASE_0x50:
;[[ id : args], [ [ : [], [ id : argc], [ ] : ]]]
	mov r11d, dword[rbp-32]
	mov r10, qword[rbp-24]
	and r11, 0xffffffff
	lea r10, [r10+r11*8]
	mov r10, qword[r10]
	mov byte[rbp-136], r10b
;[[ id : STRING_CONSTANT_134]]
	mov r10, STRING_CONSTANT_134
	mov qword[rbp-144], STRING_CONSTANT_134
;[[ id : b]]
	mov r10b, byte[rbp-136]
	mov al, r10b
	and al, 1
	jz _LIFPOST_0x51
;[[ id : boolean_string]]
;[[ id : boolean_string]]
;[[ id : STRING_CONSTANT_135]]
	mov r11, STRING_CONSTANT_135
	mov r10, STRING_CONSTANT_135
	mov qword[rbp-144], r11
	jmp _LIFELSE_0x52
_LIFPOST_0x51:
_LIFELSE_0x52:
;[[ id : boolean_string]]
	mov r10, qword[rbp-144]
	mov rsi, r10
;[[ id : str]]
	mov r10, qword[rbp-8]
	mov rdi, r10
	xor rax, rax
	call _int_strcpy_pchar.char.
	push rax
;[[ fn(x) : [ function int strcpy( [[char. dest @ 8], [char. source @ 16]] ) ] ]]
	pop rax
	mov dword[rbp-152], eax
;[[ id : str]]
;[[ id : str]]
;[[ id : bsize]]
	mov r10d, dword[rbp-152]
	mov r11, qword[rbp-8]
	add r11, r10
	mov qword[rbp-8], r11
	jmp _LSWITCHEND_0x49
_LSWITCHCASE_0x53:
;[[ id : args], [ [ : [], [ id : argc], [ ] : ]]]
	mov r11d, dword[rbp-32]
	mov r10, qword[rbp-24]
	and r11, 0xffffffff
	lea r10, [r10+r11*8]
	mov r10, qword[r10]
	movq xmm7, r10
	movsd qword[rbp-160], xmm7
;[[ int : 1000000000]]
	mov rsi, 1000000000
;[[ id : str]]
	mov r10, qword[rbp-8]
	mov rdi, r10
;[[ id : d]]
	movsd xmm7, qword[rbp-160]
	movsd xmm0, xmm7
	mov rax, 1
	call _long_toStr_pdoublechar.long
	push rax
;[[ fn(x) : [ function long toStr( [[double val @ 8], [char. buffer @ 16], [long multiplier @ 24]] ) ] ]]
	pop rax
	mov dword[rbp-168], eax
;[[ id : str]]
;[[ id : str]]
;[[ id : dsize], [ - : -], [ int : 1]]
	mov r11d, dword[rbp-168]
	dec r11d
	mov r10, r11
	mov r11, qword[rbp-8]
	add r11, r10
	mov qword[rbp-8], r11
	jmp _LSWITCHEND_0x49
_LSWITCHCASE_0x54:
;[[ id : args], [ [ : [], [ id : argc], [ ] : ]]]
	mov r11d, dword[rbp-32]
	mov r10, qword[rbp-24]
	and r11, 0xffffffff
	lea r10, [r10+r11*8]
	mov r10, qword[r10]
	movq xmm7, r10
	movsd qword[rbp-176], xmm7
;[[ int : 10000000]]
	mov rsi, 10000000
;[[ id : str]]
	mov r10, qword[rbp-8]
	mov rdi, r10
;[[ id : f]]
	movsd xmm7, qword[rbp-176]
	movsd xmm0, xmm7
	mov rax, 1
	call _long_toStr_pdoublechar.long
	push rax
;[[ fn(x) : [ function long toStr( [[double val @ 8], [char. buffer @ 16], [long multiplier @ 24]] ) ] ]]
	pop rax
	mov dword[rbp-184], eax
;[[ id : str]]
;[[ id : str]]
;[[ id : fsize], [ - : -], [ int : 1]]
	mov r11d, dword[rbp-184]
	dec r11d
	mov r10, r11
	mov r11, qword[rbp-8]
	add r11, r10
	mov qword[rbp-8], r11
	jmp _LSWITCHEND_0x49
_LSWITCHEND_0x49:
;[[ id : argc]]
;[[ id : argc]]
;[[ int : 1]]
	mov rbx, 1
	mov r10d, dword[rbp-32]
	add r10d, ebx
	mov dword[rbp-32], r10d
_LIFELSE_0x48:
;[[ id : fmt]]
;[[ id : fmt]]
;[[ int : 1]]
	mov rbx, 1
	mov r10, qword[rbp-16]
	add r10, rbx
	mov qword[rbp-16], r10
;[[ id : str]]
;[[ id : str]]
;[[ int : 1]]
	mov rbx, 1
	mov r10, qword[rbp-8]
	add r10, rbx
	mov qword[rbp-8], r10
_LWHILECMP_0x45:
;[[ @ : @], [ id : fmt], [ != : !=], [ int : 0]]
	mov rbx, qword[rbp-16]
	and r10, 0xff
	mov r10b, byte[rbx]
	test r10b, r10b
	setnz r10b
	mov al, r10b
	and al, 1
	jnz _LWHILESTART_0x44
_LWHILEEND_0x46:
;[[ ( : (], [ $ : long], [ id : str], [ ) : )], [ - : -], [ id : og]]
	mov r10, qword[rbp-8]
	mov rbx, qword[rbp-40]
	sub r10, rbx
	mov eax, r10d
	jmp ___int___sprintf_pchar.char.void.__return
___int___sprintf_pchar.char.void.__return:
	leave
	ret
	;[ function int sprintf( [[char. dest @ 8], [char. fmt @ 16], [void arg1 @ 24], [void arg2 @ 32], [void arg3 @ 40], [void arg4 @ 48]] ) ]
_int_sprintf_pchar.char.voidvoidvoidvoid:
	push rbp
	mov rbp, rsp
	sub rsp, 72
;Load Parameter: [char. dest @ 8]
	mov [rbp-8], rdi
;Load Parameter: [char. fmt @ 16]
	mov [rbp-16], rsi
;Load Parameter: [void arg1 @ 24]
	mov [rbp-24], rdx
;Load Parameter: [void arg2 @ 32]
	mov [rbp-32], rcx
;Load Parameter: [void arg3 @ 40]
	mov [rbp-40], r8
;Load Parameter: [void arg4 @ 48]
	mov [rbp-48], r9
;[[ int : 4], [ * : *], [ id : void]]
	mov rdi, 32
	xor rax, rax
	call _void._malloc_psize_t
	push rax
;[[ fn(x) : [ function void. malloc( [[size_t size @ 0]] ) ] ]]
	pop rax
	mov qword[rbp-56], rax
;[[ id : args], [ [ : [], [ int : 0], [ ] : ]]]
	mov rbx, qword[rbp-56]
;[[ id : args], [ [ : [], [ int : 0], [ ] : ]]]
	mov rbx, qword[rbp-56]
;[[ id : arg1]]
	mov r11, qword[rbp-24]
	mov r10, r11
	mov qword[rbx], r11
;[[ id : args], [ [ : [], [ int : 1], [ ] : ]]]
	mov r10, 1
	mov rbx, qword[rbp-56]
	lea rbx, [rbx+r10*8]
;[[ id : args], [ [ : [], [ int : 1], [ ] : ]]]
	mov r10, 1
	mov rbx, qword[rbp-56]
	lea rbx, [rbx+r10*8]
;[[ id : arg2]]
	mov r11, qword[rbp-32]
	mov r10, r11
	mov qword[rbx], r11
;[[ id : args], [ [ : [], [ int : 2], [ ] : ]]]
	mov r10, 2
	mov rbx, qword[rbp-56]
	lea rbx, [rbx+r10*8]
;[[ id : args], [ [ : [], [ int : 2], [ ] : ]]]
	mov r10, 2
	mov rbx, qword[rbp-56]
	lea rbx, [rbx+r10*8]
;[[ id : arg3]]
	mov r11, qword[rbp-40]
	mov r10, r11
	mov qword[rbx], r11
;[[ id : args], [ [ : [], [ int : 3], [ ] : ]]]
	mov r10, 3
	mov rbx, qword[rbp-56]
	lea rbx, [rbx+r10*8]
;[[ id : args], [ [ : [], [ int : 3], [ ] : ]]]
	mov r10, 3
	mov rbx, qword[rbp-56]
	lea rbx, [rbx+r10*8]
;[[ id : arg4]]
	mov r11, qword[rbp-48]
	mov r10, r11
	mov qword[rbx], r11
;[[ id : args]]
	mov rbx, qword[rbp-56]
	mov rdx, rbx
;[[ id : fmt]]
	mov rbx, qword[rbp-16]
	mov rsi, rbx
;[[ id : dest]]
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	xor rax, rax
	call _int___sprintf_pchar.char.void.
	push rax
;[[ fn(x) : [ function int __sprintf( [[char. str @ 8], [char. fmt @ 16], [void. args @ 24]] ) ] ]]
	pop rax
	mov dword[rbp-64], eax
;[[ id : args]]
	mov rbx, qword[rbp-56]
	mov rdi, rbx
	xor rax, rax
	call _void_free_pvoid.
	push rax
;[[ fn(x) : [ function void free( [[void. addr @ 0]] ) ] ]]
	pop rax
;[[ id : l]]
	mov ebx, dword[rbp-64]
	mov eax, ebx
	jmp ___int_sprintf_pchar.char.voidvoidvoidvoid__return
___int_sprintf_pchar.char.voidvoidvoidvoid__return:
	leave
	ret
	;[ function FILE fopen( [[char. fname @ 8], [char. mode @ 16]] ) ]
_FILE_fopen_pchar.char.:
	push rbp
	mov rbp, rsp
	sub rsp, 56
;Load Parameter: [char. fname @ 8]
	mov [rbp-8], rdi
;Load Parameter: [char. mode @ 16]
	mov [rbp-16], rsi
;[[ id : mode], [ [ : [], [ int : 0], [ ] : ]], [ + : +], [ id : mode], [ [ : [], [ int : 1], [ ] : ]]]
	mov rbx, qword[rbp-16]
	mov r11, 1
	mov r10, qword[rbp-16]
	lea r10, [r10+r11*1]
	mov bl, byte[rbx]
	and rbx, 0xff
	mov r10b, byte[r10]
	and r10, 0xff
	add bl, r10b
	mov qword[rbp-24], rbx
;[[ ( : (], [ int : 400], [ | : |], [ int : 200], [ | : |], [ int : 40], [ | : |], [ int : 20], [ | : |], [ int : 4], [ | : |], [ int : 2], [ ) : )]]
	mov qword[rbp-32], 510
;[[ int : 0]]
	mov qword[rbp-40], 0
;[[ ( : (], [ id : modehash], [ ) : )]]
	mov r10, qword[rbp-24]
	mov rbx, r10
	cmp rbx, 114
	je _LSWITCHCASE_0x56
	cmp rbx, 119
	je _LSWITCHCASE_0x57
	cmp rbx, 97
	je _LSWITCHCASE_0x58
	cmp rbx, 157
	je _LSWITCHCASE_0x59
	cmp rbx, 162
	je _LSWITCHCASE_0x5a
	cmp rbx, 140
	je _LSWITCHCASE_0x5b
	jmp _LSWITCHEND_0x55
_LSWITCHCASE_0x56:
;[[ id : f]]
;[[ id : f]]
;[[ int : 0]]
	xor r10, r10
	mov qword[rbp-40], 0
	jmp _LSWITCHEND_0x55
_LSWITCHCASE_0x57:
;[[ id : f]]
;[[ id : f]]
;[[ int : 1], [ || : ||], [ int : 64], [ || : ||], [ int : 512]]
	mov r10, 1
	mov qword[rbp-40], 1
	jmp _LSWITCHEND_0x55
_LSWITCHCASE_0x58:
;[[ id : f]]
;[[ id : f]]
;[[ int : 1], [ || : ||], [ int : 64], [ || : ||], [ int : 8]]
	mov r10, 1
	mov qword[rbp-40], 1
	jmp _LSWITCHEND_0x55
_LSWITCHCASE_0x59:
;[[ id : f]]
;[[ id : f]]
;[[ int : 2]]
	mov r10, 2
	mov qword[rbp-40], 2
	jmp _LSWITCHEND_0x55
_LSWITCHCASE_0x5a:
;[[ id : f]]
;[[ id : f]]
;[[ int : 2], [ || : ||], [ int : 64], [ || : ||], [ int : 512]]
	mov r10, 2
	mov qword[rbp-40], 2
	jmp _LSWITCHEND_0x55
_LSWITCHCASE_0x5b:
;[[ id : f]]
;[[ id : f]]
;[[ int : 2], [ || : ||], [ int : 8], [ || : ||], [ int : 64]]
	mov r10, 2
	mov qword[rbp-40], 2
	jmp _LSWITCHEND_0x55
_LSWITCHEND_0x55:
;[[ id : m]]
	mov rbx, qword[rbp-32]
	mov rdx, rbx
;[[ id : f]]
	mov rsi, qword[rbp-40]
	and rsi, 0xffffffff
;[[ id : fname]]
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	xor rax, rax
	mov rax , 2 
	mov r10 , rcx 
	syscall 
_LINLINERETURN_0x5d:
	push rax
;[[ fn(x) : [ function fd_t open( [[char. fname @ rdi], [int flags @ rsi], [mode_t mode @ rdx]] ) ] ]]
	pop rax
	mov qword[rbp-48], rax
;[[ id : modehash], [ == : ==], [ int : 140], [ || : ||], [ id : modehash], [ == : ==], [ int : 97]]
	mov r10, 140
	mov rbx, qword[rbp-24]
	cmp rbx, r10
	sete bl
	mov r11, 97
	mov r10, qword[rbp-24]
	cmp r10, r11
	sete r10b
	or bl, r10b
	mov al, bl
	and al, 1
	jz _LIFPOST_0x5f
;[[ int : 2]]
	mov rdx, 2
	and rdx, 0xffffffff
;[[ int : 0]]
	xor rsi, rsi
	and rsi, 0xffffffff
;[[ id : out]]
	mov rbx, qword[rbp-48]
	mov rdi, rbx
	xor rax, rax
	mov rax , 8 
	mov r10 , rcx 
	syscall 
_LINLINERETURN_0x62:
	push rax
;[[ fn(x) : [ function int lseek( [[fd_t fd @ rdi], [int offset @ rsi], [int whence @ rdx]] ) ] ]]
	pop rax
	jmp _LIFELSE_0x60
_LIFPOST_0x5f:
_LIFELSE_0x60:
;[[ id : out]]
	mov rbx, qword[rbp-48]
	mov rax, rbx
	jmp ___FILE_fopen_pchar.char.__return
___FILE_fopen_pchar.char.__return:
	leave
	ret
	;[ function int fputs( [[fd_t fd @ 8], [char. text @ 16]] ) ]
_int_fputs_pfd_tchar.:
	push rbp
	mov rbp, rsp
	sub rsp, 40
;Load Parameter: [fd_t fd @ 8]
	mov [rbp-8], rdi
;Load Parameter: [char. text @ 16]
	mov [rbp-16], rsi
;[[ id : text]]
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	xor rax, rax
	call _size_t_strlen_pchar.
	push rax
;[[ fn(x) : [ function size_t strlen( [[char. str @ 8]] ) ] ]]
	pop rax
	mov qword[rbp-24], rax
;[[ id : l]]
	mov rbx, qword[rbp-24]
	mov rdx, rbx
;[[ id : text]]
	mov rbx, qword[rbp-16]
	mov rsi, rbx
;[[ id : fd]]
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	xor rax, rax
	mov rax , 1 
	mov r10 , rcx 
	syscall 
_LINLINERETURN_0x65:
	push rax
;[[ fn(x) : [ function ssize_t write( [[fd_t fd @ rdi], [char. buf @ rsi], [size_t count @ rdx]] ) ] ]]
	pop rax
	mov qword[rbp-32], rax
;[[ id : out]]
	mov rax, qword[rbp-32]
	jmp ___int_fputs_pfd_tchar.__return
___int_fputs_pfd_tchar.__return:
	leave
	ret
	;[ function long fgets( [[fd_t fd @ 8], [char. buffer @ 16], [size_t amt @ 24]] ) ]
_long_fgets_pfd_tchar.size_t:
	push rbp
	mov rbp, rsp
	sub rsp, 40
;Load Parameter: [fd_t fd @ 8]
	mov [rbp-8], rdi
;Load Parameter: [char. buffer @ 16]
	mov [rbp-16], rsi
;Load Parameter: [size_t amt @ 24]
	mov [rbp-24], rdx
;[[ id : amt]]
	mov rbx, qword[rbp-24]
	mov rdx, rbx
;[[ id : buffer]]
	mov rbx, qword[rbp-16]
	mov rsi, rbx
;[[ id : fd]]
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	xor rax, rax
	mov rax , 0 
	mov r10 , rcx 
	syscall 
_LINLINERETURN_0x68:
	push rax
;[[ fn(x) : [ function ssize_t read( [[fd_t fd @ rdi], [char. buf @ rsi], [size_t count @ rdx]] ) ] ]]
	pop rax
	mov qword[rbp-32], rax
;[[ id : out]]
	mov rbx, qword[rbp-32]
	mov rax, rbx
	jmp ___long_fgets_pfd_tchar.size_t__return
___long_fgets_pfd_tchar.size_t__return:
	leave
	ret
	;[ function void. floads( [[fd_t fd @ 8]] ) ]
_void._floads_pfd_t:
	push rbp
	mov rbp, rsp
	sub rsp, 40
;Load Parameter: [fd_t fd @ 8]
	mov [rbp-8], rdi
;[[ int : 2]]
	mov rdx, 2
	and rdx, 0xffffffff
;[[ int : 0]]
	xor rsi, rsi
	and rsi, 0xffffffff
;[[ id : fd]]
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	xor rax, rax
	mov rax , 8 
	mov r10 , rcx 
	syscall 
_LINLINERETURN_0x6b:
	push rax
;[[ fn(x) : [ function int lseek( [[fd_t fd @ rdi], [int offset @ rsi], [int whence @ rdx]] ) ] ]]
	pop rax
	mov dword[rbp-16], eax
;[[ int : 2]]
	mov rdx, 2
	and rdx, 0xffffffff
;[[ int : 0], [ - : -], [ id : fsize]]
	mov r10d, dword[rbp-16]
	xor rbx, rbx
	mov r11, r10
	sub rbx, r11
	mov esi, ebx
	and rsi, 0xffffffff
;[[ id : fd]]
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	xor rax, rax
	mov rax , 8 
	mov r10 , rcx 
	syscall 
_LINLINERETURN_0x6e:
	push rax
;[[ fn(x) : [ function int lseek( [[fd_t fd @ rdi], [int offset @ rsi], [int whence @ rdx]] ) ] ]]
	pop rax
;[[ id : fsize]]
	mov edi, dword[rbp-16]
	xor rax, rax
	call _void._malloc_psize_t
	push rax
;[[ fn(x) : [ function void. malloc( [[size_t size @ 0]] ) ] ]]
	pop rax
	mov qword[rbp-24], rax
;[[ id : fsize]]
	mov edx, dword[rbp-16]
;[[ id : buffer]]
	mov rbx, qword[rbp-24]
	mov rsi, rbx
;[[ id : fd]]
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	xor rax, rax
	mov rax , 0 
	mov r10 , rcx 
	syscall 
_LINLINERETURN_0x71:
	push rax
;[[ fn(x) : [ function ssize_t read( [[fd_t fd @ rdi], [char. buf @ rsi], [size_t count @ rdx]] ) ] ]]
	pop rax
	mov qword[rbp-32], rax
;[[ id : out], [ < : <], [ int : 0]]
	xor r10, r10
	mov rbx, qword[rbp-32]
	cmp rbx, r10
	setl bl
	mov al, bl
	and al, 1
	jz _LIFPOST_0x73
;[[ id : out]]
	mov rax, qword[rbp-32]
	jmp ___void._floads_pfd_t__return
	jmp _LIFELSE_0x74
_LIFPOST_0x73:
_LIFELSE_0x74:
;[[ id : buffer]]
	mov rax, qword[rbp-24]
	jmp ___void._floads_pfd_t__return
___void._floads_pfd_t__return:
	leave
	ret
	;[ function void __printf( [[char. fmt @ 8], [void. args @ 16], [fd_t ostream @ 24]] ) ]
_void___printf_pchar.void.fd_t:
	push rbp
	mov rbp, rsp
	sub rsp, 48
;Load Parameter: [char. fmt @ 8]
	mov [rbp-8], rdi
;Load Parameter: [void. args @ 16]
	mov [rbp-16], rsi
;Load Parameter: [fd_t ostream @ 24]
	mov [rbp-24], rdx
;[[ int : 10000]]
	mov rdi, 10000
	xor rax, rax
	call _void._qmmap_psize_t
	push rax
;[[ fn(x) : [ function void. qmmap( [[size_t amt @ 8]] ) ] ]]
	pop rax
	mov qword[rbp-32], rax
;[[ id : args]]
	mov rbx, qword[rbp-16]
	mov rdx, rbx
;[[ id : fmt]]
	mov rbx, qword[rbp-8]
	mov rsi, rbx
;[[ id : normform]]
	mov rbx, qword[rbp-32]
	mov rdi, rbx
	xor rax, rax
	call _int___sprintf_pchar.char.void.
	push rax
;[[ fn(x) : [ function int __sprintf( [[char. str @ 8], [char. fmt @ 16], [void. args @ 24]] ) ] ]]
	pop rax
	mov dword[rbp-40], eax
;[[ id : l]]
	mov edx, dword[rbp-40]
;[[ id : normform]]
	mov rbx, qword[rbp-32]
	mov rsi, rbx
;[[ id : ostream]]
	mov rbx, qword[rbp-24]
	mov rdi, rbx
	xor rax, rax
	mov rax , 1 
	mov r10 , rcx 
	syscall 
_LINLINERETURN_0x76:
	push rax
;[[ fn(x) : [ function ssize_t write( [[fd_t fd @ rdi], [char. buf @ rsi], [size_t count @ rdx]] ) ] ]]
	pop rax
;[[ int : 10000]]
	mov rsi, 10000
;[[ id : normform]]
	mov rdi, qword[rbp-32]
	xor rax, rax
	call _void._munmap_pvoid.size_t
	push rax
;[[ fn(x) : [ function void. munmap( [[void. addr @ 8], [size_t length @ 16]] ) ] ]]
	pop rax
___void___printf_pchar.void.fd_t__return:
	leave
	ret
	;[ function void printf( [[char. fmt @ 8], [void arg1 @ 16], [void arg2 @ 24], [void arg3 @ 32], [void arg4 @ 40], [void arg5 @ 48]] ) ]
printf:
	push rbp
	mov rbp, rsp
	sub rsp, 112
;Load Parameter: [char. fmt @ 8]
	mov [rbp-8], rdi
;Load Parameter: [void arg1 @ 16]
	mov [rbp-16], rsi
;Load Parameter: [void arg2 @ 24]
	mov [rbp-24], rdx
;Load Parameter: [void arg3 @ 32]
	mov [rbp-32], rcx
;Load Parameter: [void arg4 @ 40]
	mov [rbp-40], r8
;Load Parameter: [void arg5 @ 48]
	mov [rbp-48], r9
;[[ id : args], [ [ : [], [ int : 0], [ ] : ]]]
	lea rbx, [rbp-104] 
;[[ id : args], [ [ : [], [ int : 0], [ ] : ]]]
	lea rbx, [rbp-104] 
;[[ id : arg1]]
	mov r11, qword[rbp-16]
	mov r10, r11
	mov qword[rbx], r11
;[[ id : args], [ [ : [], [ int : 1], [ ] : ]]]
	mov r10, 1
	lea rbx, [rbp-104] 
	lea rbx, [rbx+r10*8]
;[[ id : args], [ [ : [], [ int : 1], [ ] : ]]]
	mov r10, 1
	lea rbx, [rbp-104] 
	lea rbx, [rbx+r10*8]
;[[ id : arg2]]
	mov r11, qword[rbp-24]
	mov r10, r11
	mov qword[rbx], r11
;[[ id : args], [ [ : [], [ int : 2], [ ] : ]]]
	mov r10, 2
	lea rbx, [rbp-104] 
	lea rbx, [rbx+r10*8]
;[[ id : args], [ [ : [], [ int : 2], [ ] : ]]]
	mov r10, 2
	lea rbx, [rbp-104] 
	lea rbx, [rbx+r10*8]
;[[ id : arg3]]
	mov r11, qword[rbp-32]
	mov r10, r11
	mov qword[rbx], r11
;[[ id : args], [ [ : [], [ int : 3], [ ] : ]]]
	mov r10, 3
	lea rbx, [rbp-104] 
	lea rbx, [rbx+r10*8]
;[[ id : args], [ [ : [], [ int : 3], [ ] : ]]]
	mov r10, 3
	lea rbx, [rbp-104] 
	lea rbx, [rbx+r10*8]
;[[ id : arg4]]
	mov r11, qword[rbp-40]
	mov r10, r11
	mov qword[rbx], r11
;[[ id : args], [ [ : [], [ int : 4], [ ] : ]]]
	mov r10, 4
	lea rbx, [rbp-104] 
	lea rbx, [rbx+r10*8]
;[[ id : args], [ [ : [], [ int : 4], [ ] : ]]]
	mov r10, 4
	lea rbx, [rbp-104] 
	lea rbx, [rbx+r10*8]
;[[ id : arg5]]
	mov r11, qword[rbp-48]
	mov r10, r11
	mov qword[rbx], r11
;[[ int : 1]]
	mov rdx, 1
;[[ & : &], [ id : args]]
	lea rbx, [rbp-104]
	mov rsi, rbx
;[[ id : fmt]]
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	xor rax, rax
	call _void___printf_pchar.void.fd_t
	push rax
;[[ fn(x) : [ function void __printf( [[char. fmt @ 8], [void. args @ 16], [fd_t ostream @ 24]] ) ] ]]
	pop rax
__printf__return:
	leave
	ret
	;[ function void printf( [[char. fmt @ 0], [void arg1 @ 0], [void arg2 @ 0], [void arg3 @ 0], [void arg4 @ 0]] ) ]
	;[ function void printf( [[char. fmt @ 0], [void arg1 @ 0], [void arg2 @ 0], [void arg3 @ 0]] ) ]
	;[ function void printf( [[char. fmt @ 0], [void arg1 @ 0], [void arg2 @ 0]] ) ]
	;[ function void printf( [[char. fmt @ 0], [void arg1 @ 0]] ) ]
	;[ function void eprintf( [[char. fmt @ 8], [void arg1 @ 16], [void arg2 @ 24], [void arg3 @ 32], [void arg4 @ 40], [void arg5 @ 48]] ) ]
eprintf:
	push rbp
	mov rbp, rsp
	sub rsp, 112
;Load Parameter: [char. fmt @ 8]
	mov [rbp-8], rdi
;Load Parameter: [void arg1 @ 16]
	mov [rbp-16], rsi
;Load Parameter: [void arg2 @ 24]
	mov [rbp-24], rdx
;Load Parameter: [void arg3 @ 32]
	mov [rbp-32], rcx
;Load Parameter: [void arg4 @ 40]
	mov [rbp-40], r8
;Load Parameter: [void arg5 @ 48]
	mov [rbp-48], r9
;[[ id : args], [ [ : [], [ int : 0], [ ] : ]]]
	lea rbx, [rbp-104] 
;[[ id : args], [ [ : [], [ int : 0], [ ] : ]]]
	lea rbx, [rbp-104] 
;[[ id : arg1]]
	mov r11, qword[rbp-16]
	mov r10, r11
	mov qword[rbx], r11
;[[ id : args], [ [ : [], [ int : 1], [ ] : ]]]
	mov r10, 1
	lea rbx, [rbp-104] 
	lea rbx, [rbx+r10*8]
;[[ id : args], [ [ : [], [ int : 1], [ ] : ]]]
	mov r10, 1
	lea rbx, [rbp-104] 
	lea rbx, [rbx+r10*8]
;[[ id : arg2]]
	mov r11, qword[rbp-24]
	mov r10, r11
	mov qword[rbx], r11
;[[ id : args], [ [ : [], [ int : 2], [ ] : ]]]
	mov r10, 2
	lea rbx, [rbp-104] 
	lea rbx, [rbx+r10*8]
;[[ id : args], [ [ : [], [ int : 2], [ ] : ]]]
	mov r10, 2
	lea rbx, [rbp-104] 
	lea rbx, [rbx+r10*8]
;[[ id : arg3]]
	mov r11, qword[rbp-32]
	mov r10, r11
	mov qword[rbx], r11
;[[ id : args], [ [ : [], [ int : 3], [ ] : ]]]
	mov r10, 3
	lea rbx, [rbp-104] 
	lea rbx, [rbx+r10*8]
;[[ id : args], [ [ : [], [ int : 3], [ ] : ]]]
	mov r10, 3
	lea rbx, [rbp-104] 
	lea rbx, [rbx+r10*8]
;[[ id : arg4]]
	mov r11, qword[rbp-40]
	mov r10, r11
	mov qword[rbx], r11
;[[ id : args], [ [ : [], [ int : 4], [ ] : ]]]
	mov r10, 4
	lea rbx, [rbp-104] 
	lea rbx, [rbx+r10*8]
;[[ id : args], [ [ : [], [ int : 4], [ ] : ]]]
	mov r10, 4
	lea rbx, [rbp-104] 
	lea rbx, [rbx+r10*8]
;[[ id : arg5]]
	mov r11, qword[rbp-48]
	mov r10, r11
	mov qword[rbx], r11
;[[ int : 2]]
	mov rdx, 2
;[[ & : &], [ id : args]]
	lea rbx, [rbp-104]
	mov rsi, rbx
;[[ id : fmt]]
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	xor rax, rax
	call _void___printf_pchar.void.fd_t
	push rax
;[[ fn(x) : [ function void __printf( [[char. fmt @ 8], [void. args @ 16], [fd_t ostream @ 24]] ) ] ]]
	pop rax
__eprintf__return:
	leave
	ret
	;[ function void eprintf( [[char. fmt @ 0], [void arg1 @ 0], [void arg2 @ 0], [void arg3 @ 0], [void arg4 @ 0]] ) ]
	;[ function void eprintf( [[char. fmt @ 0], [void arg1 @ 0], [void arg2 @ 0], [void arg3 @ 0]] ) ]
	;[ function void eprintf( [[char. fmt @ 0], [void arg1 @ 0], [void arg2 @ 0]] ) ]
	;[ function void eprintf( [[char. fmt @ 0], [void arg1 @ 0]] ) ]
	;[ function void fprintf( [[fd_t file @ 8], [char. fmt @ 16], [void arg1 @ 24], [void arg2 @ 32], [void arg3 @ 40], [void arg4 @ 48]] ) ]
fprintf:
	push rbp
	mov rbp, rsp
	sub rsp, 96
;Load Parameter: [fd_t file @ 8]
	mov [rbp-8], rdi
;Load Parameter: [char. fmt @ 16]
	mov [rbp-16], rsi
;Load Parameter: [void arg1 @ 24]
	mov [rbp-24], rdx
;Load Parameter: [void arg2 @ 32]
	mov [rbp-32], rcx
;Load Parameter: [void arg3 @ 40]
	mov [rbp-40], r8
;Load Parameter: [void arg4 @ 48]
	mov [rbp-48], r9
;[[ id : args], [ [ : [], [ int : 0], [ ] : ]]]
	lea rbx, [rbp-88] 
;[[ id : args], [ [ : [], [ int : 0], [ ] : ]]]
	lea rbx, [rbp-88] 
;[[ id : arg1]]
	mov r11, qword[rbp-24]
	mov r10, r11
	mov qword[rbx], r11
;[[ id : args], [ [ : [], [ int : 1], [ ] : ]]]
	mov r10, 1
	lea rbx, [rbp-88] 
	lea rbx, [rbx+r10*8]
;[[ id : args], [ [ : [], [ int : 1], [ ] : ]]]
	mov r10, 1
	lea rbx, [rbp-88] 
	lea rbx, [rbx+r10*8]
;[[ id : arg2]]
	mov r11, qword[rbp-32]
	mov r10, r11
	mov qword[rbx], r11
;[[ id : args], [ [ : [], [ int : 2], [ ] : ]]]
	mov r10, 2
	lea rbx, [rbp-88] 
	lea rbx, [rbx+r10*8]
;[[ id : args], [ [ : [], [ int : 2], [ ] : ]]]
	mov r10, 2
	lea rbx, [rbp-88] 
	lea rbx, [rbx+r10*8]
;[[ id : arg3]]
	mov r11, qword[rbp-40]
	mov r10, r11
	mov qword[rbx], r11
;[[ id : args], [ [ : [], [ int : 3], [ ] : ]]]
	mov r10, 3
	lea rbx, [rbp-88] 
	lea rbx, [rbx+r10*8]
;[[ id : args], [ [ : [], [ int : 3], [ ] : ]]]
	mov r10, 3
	lea rbx, [rbp-88] 
	lea rbx, [rbx+r10*8]
;[[ id : arg4]]
	mov r11, qword[rbp-48]
	mov r10, r11
	mov qword[rbx], r11
;[[ id : file]]
	mov rbx, qword[rbp-8]
	mov rdx, rbx
;[[ & : &], [ id : args]]
	lea rbx, [rbp-88]
	mov rsi, rbx
;[[ id : fmt]]
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	xor rax, rax
	call _void___printf_pchar.void.fd_t
	push rax
;[[ fn(x) : [ function void __printf( [[char. fmt @ 8], [void. args @ 16], [fd_t ostream @ 24]] ) ] ]]
	pop rax
__fprintf__return:
	leave
	ret
	;[ function void fprintf( [[fd_t file @ 0], [char. fmt @ 0], [void arg1 @ 0], [void arg2 @ 0], [void arg3 @ 0]] ) ]
	;[ function void fprintf( [[fd_t file @ 0], [char. fmt @ 0], [void arg1 @ 0], [void arg2 @ 0]] ) ]
	;[ function void fprintf( [[fd_t file @ 0], [char. fmt @ 0], [void arg1 @ 0]] ) ]
	;[ function void __assert( [[bool condition @ 8], [char. fname @ 16], [int line @ 24], [char. assertion @ 32]] ) ]
_void___assert_pboolchar.intchar.:
	push rbp
	mov rbp, rsp
	sub rsp, 40
;Load Parameter: [bool condition @ 8]
	mov [rbp-8], rdi
;Load Parameter: [char. fname @ 16]
	mov [rbp-16], rsi
;Load Parameter: [int line @ 24]
	mov [rbp-24], rdx
;Load Parameter: [char. assertion @ 32]
	mov [rbp-32], rcx
;[[ ! : !], [ id : condition]]
	mov bl, byte[rbp-8]
	cmp bl, 0
	sete bl
	mov al, bl
	and al, 1
	jz _LIFPOST_0x78
;[[ id : assertion]]
	mov rcx, qword[rbp-32]
;[[ id : line]]
	mov edx, dword[rbp-24]
;[[ id : fname]]
	mov rsi, qword[rbp-16]
;[[ id : STRING_CONSTANT_136]]
	mov rbx, STRING_CONSTANT_136
	mov rdi, STRING_CONSTANT_136
	xor rax, rax
	call eprintf
	push rax
;[[ fn(x) : [ function void eprintf( [[char. fmt @ 0], [void arg1 @ 0], [void arg2 @ 0], [void arg3 @ 0]] ) ] ]]
	pop rax
;[[ int : 1]]
	mov rdi, 1
	xor rax, rax
	mov rax , 60 
	mov r10 , rcx 
	syscall 
_LINLINERETURN_0x7b:
	push rax
;[[ fn(x) : [ function void exit( [[long c @ rdi]] ) ] ]]
	pop rax
	jmp _LIFELSE_0x79
_LIFPOST_0x78:
_LIFELSE_0x79:
___void___assert_pboolchar.intchar.__return:
	leave
	ret
	;[ function void. malloc( [[size_t size @ 8]] ) ]
_void._malloc_psize_t:
	push rbp
	mov rbp, rsp
	sub rsp, 16
;Load Parameter: [size_t size @ 8]
	mov [rbp-8], rdi
;[[ id : size], [ + : +], [ int : 8]]
	mov r10, qword[rbp-8]
	add r10, 8
	mov rdi, r10
	xor rax, rax
	call _void._qmmap_psize_t
	push rax
;[[ fn(x) : [ function void. qmmap( [[size_t amt @ 8]] ) ] ]]
	pop rax
	mov rbx, rax
;[[ @ : @], [ id : out]]
	mov r10, rbx
;[[ @ : @], [ id : out]]
	mov r10, rbx
;[[ id : size]]
	mov r11, qword[rbp-8]
	mov qword[r10], r11
;[[ id : out], [ + : +], [ int : 8]]
	mov r10, rbx
	add r10, 8
	mov rax, r10
	jmp ___void._malloc_psize_t__return
___void._malloc_psize_t__return:
	leave
	ret
	;[ function void free( [[void. addr @ 8]] ) ]
_void_free_pvoid.:
	push rbp
	mov rbp, rsp
	sub rsp, 16
;Load Parameter: [void. addr @ 8]
	mov [rbp-8], rdi
;[[ @ : @], [ ( : (], [ id : addr], [ - : -], [ int : 8], [ ) : )]]
	mov rbx, qword[rbp-8]
	sub rbx, 8
	mov r10, qword[rbx]
	mov rsi, r10
;[[ id : addr], [ - : -], [ int : 8]]
	mov rbx, qword[rbp-8]
	sub rbx, 8
	mov rdi, rbx
	xor rax, rax
	call _void._munmap_pvoid.size_t
	push rax
;[[ fn(x) : [ function void. munmap( [[void. addr @ 8], [size_t length @ 16]] ) ] ]]
	pop rax
	jmp ___void_free_pvoid.__return
___void_free_pvoid.__return:
	leave
	ret
	;[ function void. realloc( [[void. addr @ 8], [size_t newsize @ 16]] ) ]
_void._realloc_pvoid.size_t:
	push rbp
	mov rbp, rsp
	sub rsp, 24
;Load Parameter: [void. addr @ 8]
	mov [rbp-8], rdi
;Load Parameter: [size_t newsize @ 16]
	mov [rbp-16], rsi
;[[ id : addr], [ == : ==], [ int : 0]]
	mov rbx, qword[rbp-8]
	test rbx, rbx
	setz bl
	mov al, bl
	and al, 1
	jz _LIFPOST_0x7d
;[[ id : newsize]]
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	xor rax, rax
	call _void._malloc_psize_t
	push rax
;[[ fn(x) : [ function void. malloc( [[size_t size @ 8]] ) ] ]]
	pop rax
	jmp ___void._realloc_pvoid.size_t__return
	jmp _LIFELSE_0x7e
_LIFPOST_0x7d:
_LIFELSE_0x7e:
;[[ @ : @], [ ( : (], [ id : addr], [ - : -], [ int : 8], [ ) : )]]
	mov r10, qword[rbp-8]
	sub r10, 8
	mov r11, qword[r10]
	mov rbx, r11
;[[ id : oldsize], [ == : ==], [ id : newsize]]
	mov r11, qword[rbp-16]
	mov r10, rbx
	cmp r10, r11
	sete r10b
	mov al, r10b
	and al, 1
	jz _LIFPOST_0x7f
;[[ id : addr]]
	mov r10, qword[rbp-8]
	mov rax, r10
	jmp ___void._realloc_pvoid.size_t__return
	jmp _LIFELSE_0x80
_LIFPOST_0x7f:
_LIFELSE_0x80:
	push rbx
;[[ id : newsize]]
	mov r11, qword[rbp-16]
	mov rdi, r11
	xor rax, rax
	call _void._malloc_psize_t
	mov r11, rax
	pop rbx
	mov rax, r11
	push rax
;[[ fn(x) : [ function void. malloc( [[size_t size @ 8]] ) ] ]]
	pop rax
	mov r10, rax
	push rbx
	push r10
;[[ id : newsize]]
	mov r11, qword[rbp-16]
	mov rdx, r11
;[[ id : addr]]
	mov r11, qword[rbp-8]
	mov rsi, r11
;[[ id : out]]
	mov r11, r10
	mov rdi, r10
	xor rax, rax
	call _void_avx_memcpy_pvoid.void.size_t
	mov r11, rax
	pop r10
	pop rbx
	mov rax, r11
	push rax
;[[ fn(x) : [ function void avx_memcpy( [[void. dest @ 0], [void. source @ 0], [size_t bytes @ 0]] ) ] ]]
	pop rax
	push rbx
	push r10
;[[ id : addr]]
	mov r11, qword[rbp-8]
	mov rdi, r11
	xor rax, rax
	call _void_free_pvoid.
	mov r11, rax
	pop r10
	pop rbx
	mov rax, r11
	push rax
;[[ fn(x) : [ function void free( [[void. addr @ 8]] ) ] ]]
	pop rax
;[[ id : out]]
	mov r11, r10
	mov rax, r10
	jmp ___void._realloc_pvoid.size_t__return
___void._realloc_pvoid.size_t__return:
	leave
	ret
	;[ function void memcpy( [[void. dest @ 8], [void. source @ 16], [size_t bytes @ 24]] ) ]
_void_memcpy_pvoid.void.size_t:
	push rbp
	mov rbp, rsp
	sub rsp, 32
;Load Parameter: [void. dest @ 8]
	mov [rbp-8], rdi
;Load Parameter: [void. source @ 16]
	mov [rbp-16], rsi
;Load Parameter: [size_t bytes @ 24]
	mov [rbp-24], rdx
; rax = final dest:
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
	;[ function void avx_memcpy( [[void. dest @ 8], [void. source @ 16], [size_t bytes @ 24]] ) ]
_void_avx_memcpy_pvoid.void.size_t:
	push rbp
	mov rbp, rsp
	sub rsp, 56
;Load Parameter: [void. dest @ 8]
	mov [rbp-8], rdi
;Load Parameter: [void. source @ 16]
	mov [rbp-16], rsi
;Load Parameter: [size_t bytes @ 24]
	mov [rbp-24], rdx
;[[ id : bytes], [ % : %], [ int : 32]]
	mov r10, 32
	mov rbx, qword[rbp-24]
	xor rdx, rdx
	mov rax, rbx
	idiv r10
	mov rbx, rdx
	mov dword[rbp-32], ebx
;[[ ( : (], [ id : bytes], [ - : -], [ id : offset], [ ) : )], [ / : /], [ int : 4]]
	mov r10d, dword[rbp-32]
	mov rbx, qword[rbp-24]
	mov r11, r10
	sub rbx, r11
	sar rbx, 2
	mov qword[rbp-40], rbx
;[[ int : 0]]
	mov dword[rbp-48], 0
	jmp _LFORCMP_0x83
_LFORTOP_0x82:
;[[ id : i]]
	mov ebx, dword[rbp-48]
	shl rbx, 3
	add rbx, [rbp-16]
	vmovdqu ymm0, [rbx]
;[[ id : i]]
	mov ebx, dword[rbp-48]
	shl rbx, 3
	add rbx, [rbp-8]
	vmovdqu [rbx], ymm0
_LFORUPDATE_0x84:
;[[ id : i]]
;[[ id : i]]
;[[ id : i], [ + : +], [ int : 4]]
	mov r10d, dword[rbp-48]
	add r10d, 4
	mov ebx, r10d
	mov dword[rbp-48], r10d
_LFORCMP_0x83:
;[[ id : i], [ < : <], [ id : avxcount]]
	mov r10d, dword[rbp-48]
	mov rbx, qword[rbp-40]
	mov r11, r10
	cmp r11, rbx
	setl r11b
	mov al, r11b
	and al, 1
	jnz _LFORTOP_0x82
_LFOREND_0x85:
;[[ id : offset], [ != : !=], [ int : 0]]
	mov ebx, dword[rbp-32]
	test ebx, ebx
	setnz bl
	mov al, bl
	and al, 1
	jz _LIFPOST_0x86
;[[ id : offset]]
	mov edx, dword[rbp-32]
;[[ id : source], [ + : +], [ id : avxcount]]
	mov r10, qword[rbp-16]
	mov rbx, qword[rbp-40]
	add r10, rbx
	mov rsi, r10
;[[ id : dest], [ + : +], [ id : avxcount]]
	mov r10, qword[rbp-8]
	mov rbx, qword[rbp-40]
	add r10, rbx
	mov rdi, r10
	xor rax, rax
	call _void_memcpy_pvoid.void.size_t
	push rax
;[[ fn(x) : [ function void memcpy( [[void. dest @ 8], [void. source @ 16], [size_t bytes @ 24]] ) ] ]]
	pop rax
	jmp _LIFELSE_0x87
_LIFPOST_0x86:
_LIFELSE_0x87:
___void_avx_memcpy_pvoid.void.size_t__return:
	leave
	ret
	;[ function void memset( [[void. dest @ 8], [uchar value @ 16], [size_t bytes @ 24]] ) ]
_void_memset_pvoid.ucharsize_t:
	push rbp
	mov rbp, rsp
	sub rsp, 32
;Load Parameter: [void. dest @ 8]
	mov [rbp-8], rdi
;Load Parameter: [uchar value @ 16]
	mov [rbp-16], rsi
;Load Parameter: [size_t bytes @ 24]
	mov [rbp-24], rdx
_void_memset_pvoid.ucharsize_t_flp:
	dec rdx
	mov [rdi+rdx], sil
	jnz _void_memset_pvoid.ucharsize_t_flp
___void_memset_pvoid.ucharsize_t__return:
	leave
	ret
	;[ function int rand( [] ) ]
_int_rand_p:
	push rbp
	mov rbp, rsp
	sub rsp, 8
;[[ id : rand_next]]
;[[ id : rand_next]]
;[[ id : rand_next], [ ^ : ^], [ ( : (], [ id : rand_next], [ << : <<], [ int : 13], [ ) : )]]
	mov r10d, dword[rand_next]
	sal r10d, 13
	mov r11d, dword[rand_next]
	xor r11d, r10d
	mov ebx, r11d
	mov dword[rand_next], r11d
;[[ id : rand_next]]
;[[ id : rand_next]]
;[[ id : rand_next], [ ^ : ^], [ ( : (], [ id : rand_next], [ >> : >>], [ int : 17], [ ) : )]]
	mov r10d, dword[rand_next]
	sar r10d, 17
	mov r11d, dword[rand_next]
	xor r11d, r10d
	mov ebx, r11d
	mov dword[rand_next], r11d
;[[ id : rand_next]]
;[[ id : rand_next]]
;[[ id : rand_next], [ ^ : ^], [ ( : (], [ id : rand_next], [ << : <<], [ int : 5], [ ) : )]]
	mov r10d, dword[rand_next]
	sal r10d, 5
	mov r11d, dword[rand_next]
	xor r11d, r10d
	mov ebx, r11d
	mov dword[rand_next], r11d
;[[ id : rand_next]]
	mov ebx, dword[rand_next]
	mov eax, ebx
	jmp ___int_rand_p__return
___int_rand_p__return:
	leave
	ret
	;[ function void srand( [] ) ]
_void_srand_p:
	push rbp
	mov rbp, rsp
	sub rsp, 8
;[[ id : rand_next]]
;[[ id : rand_next]]
	xor rax, rax
	rdrand rax
_LINLINERETURN_0x8a:
	push rax
;[[ fn(x) : [ function int rdrand( [] ) ] ]]
	pop rbx
	mov dword[rand_next], ebx
___void_srand_p__return:
	leave
	ret
	;[ function void usleep( [[long nanoseconds @ 8]] ) ]
_void_usleep_plong:
	push rbp
	mov rbp, rsp
	sub rsp, 40
;Load Parameter: [long nanoseconds @ 8]
	mov [rbp-8], rdi
	mov qword[rbp-32], 0
	mov qword[rbp-24], 0
;[[ id : req.tv_sec]]
;[[ id : req.tv_sec]]
;[[ int : 0]]
	xor rbx, rbx
	mov qword[rbp-32], 0
;[[ id : req.tv_usec]]
;[[ id : req.tv_usec]]
;[[ id : nanoseconds]]
	mov r10, qword[rbp-8]
	mov rbx, r10
	mov qword[rbp-24], r10
;[[ int : 0]]
	xor rsi, rsi
;[[ & : &], [ id : req]]
	lea rbx, [rbp-32]
	mov rdi, rbx
	xor rax, rax
	mov rax , 35 
	mov r10 , rcx 
	syscall 
_LINLINERETURN_0x8d:
	push rax
;[[ fn(x) : [ function void nanosleep( [[timeval_t. req @ rdi], [timeval_t. rem @ rsi]] ) ] ]]
	pop rax
___void_usleep_plong__return:
	leave
	ret
	;[ function clock_t clock( [] ) ]
_clock_t_clock_p:
	push rbp
	mov rbp, rsp
	sub rsp, 32
	mov qword[rbp-24], 0
	mov qword[rbp-16], 0
;[[ & : &], [ id : ts]]
	lea rbx, [rbp-24]
	mov rsi, rbx
;[[ int : 2]]
	mov rdi, 2
	xor rax, rax
	mov rax , 228 
	mov r10 , rcx 
	syscall 
_LINLINERETURN_0x90:
	push rax
;[[ fn(x) : [ function long clock_gettime( [[long which @ rdi], [timespec. tp @ rsi]] ) ] ]]
	pop rax
	and al, 1
	jz _LIFPOST_0x92
;[[ int : -1]]
	mov rax, -1
	jmp ___clock_t_clock_p__return
	jmp _LIFELSE_0x93
_LIFPOST_0x92:
_LIFELSE_0x93:
;[[ id : ts.tv_sec], [ > : >], [ int : 9223372036854775807], [ / : /], [ int : 1000000], [ || : ||], [ id : ts.tv_usec], [ / : /], [ int : 1000], [ > : >], [ int : 9223372036854775807], [ - : -], [ int : 1000000], [ * : *], [ id : ts.tv_sec]]
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
	mov r12, qword[rbp-24]
	mov r11, 1000000
	imul r11, r12
	mov r12, 9223372036854775807
	sub r12, r11
	cmp r10, r12
	setg r10b
	or bl, r10b
	mov al, bl
	and al, 1
	jz _LIFPOST_0x94
;[[ int : -1]]
	mov rax, -1
	jmp ___clock_t_clock_p__return
	jmp _LIFELSE_0x95
_LIFPOST_0x94:
_LIFELSE_0x95:
;[[ id : ts.tv_sec], [ * : *], [ int : 1000000], [ + : +], [ id : ts.tv_usec], [ / : /], [ int : 1000]]
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
	;[ function tm. gmtime( [[time_t timer @ 8]] ) ]
_tm._gmtime_ptime_t:
	push rbp
	mov rbp, rsp
	sub rsp, 104
;Load Parameter: [time_t timer @ 8]
	mov [rbp-8], rdi
	xor rax, rax
	call tzset
	push rax
;[[ fn(x) : [ function void tzset( [] ) ] ]]
	pop rax
;[[ id : timer]]
	mov rbx, qword[rbp-8]
	mov qword[rbp-16], rbx
;[[ & : &], [ id : __tmbuf]]
	mov rbx, __tmbuf
	mov qword[rbp-24], __tmbuf
;[[ int : 0]]
	mov dword[rbp-80], 0
;[[ int : 0]]
	mov dword[rbp-88], 0
;[[ id : timer]]
;[[ id : timer]]
;[[ & : &], [ id : seconds]]
	lea r10, [rbp-32]
	mov rdx, r10
;[[ int : 60]]
	mov rsi, 60
;[[ id : timer]]
	mov r10, qword[rbp-8]
	mov rdi, r10
	xor rax, rax
	mov rbx, rdx
	xor rdx, rdx
	mov rax, rdi
	div rsi
	mov [rbx], rdx
_LINLINERETURN_0x97:
	push rax
;[[ fn(x) : [ function long divmod( [[long dividend @ rdi], [long divisor @ rsi], [long. modulus @ rdx]] ) ] ]]
	pop rbx
	mov qword[rbp-8], rbx
;[[ id : timer]]
;[[ id : timer]]
;[[ & : &], [ id : minutes]]
	lea r10, [rbp-40]
	mov rdx, r10
;[[ int : 60]]
	mov rsi, 60
;[[ id : timer]]
	mov r10, qword[rbp-8]
	mov rdi, r10
	xor rax, rax
	mov rbx, rdx
	xor rdx, rdx
	mov rax, rdi
	div rsi
	mov [rbx], rdx
_LINLINERETURN_0x9a:
	push rax
;[[ fn(x) : [ function long divmod( [[long dividend @ rdi], [long divisor @ rsi], [long. modulus @ rdx]] ) ] ]]
	pop rbx
	mov qword[rbp-8], rbx
;[[ id : timer]]
;[[ id : timer]]
;[[ & : &], [ id : hours]]
	lea r10, [rbp-48]
	mov rdx, r10
;[[ int : 24]]
	mov rsi, 24
;[[ id : timer]]
	mov r10, qword[rbp-8]
	mov rdi, r10
	xor rax, rax
	mov rbx, rdx
	xor rdx, rdx
	mov rax, rdi
	div rsi
	mov [rbx], rdx
_LINLINERETURN_0x9d:
	push rax
;[[ fn(x) : [ function long divmod( [[long dividend @ rdi], [long divisor @ rsi], [long. modulus @ rdx]] ) ] ]]
	pop rbx
	mov qword[rbp-8], rbx
;[[ id : yday]]
;[[ id : yday]]
;[[ ( : (], [ ( : (], [ id : ogt], [ / : /], [ int : 60], [ ) : )], [ / : /], [ int : 60], [ ) : )], [ / : /], [ int : 24]]
	mov r11, 60
	mov r10, qword[rbp-16]
	xor rdx, rdx
	mov rax, r10
	idiv r11
	mov r10, rax
	mov r11, 60
	xor rdx, rdx
	mov rax, r10
	idiv r11
	mov r10, rax
	mov r11, 24
	xor rdx, rdx
	mov rax, r10
	idiv r11
	mov r10, rax
	mov ebx, r10d
	mov dword[rbp-56], r10d
;[[ id : years]]
;[[ id : years]]
;[[ id : yday], [ / : /], [ id : FLT_CONSTANT_2]]
	mov r10d, dword[rbp-56]
	movsd xmm7, qword[FLT_CONSTANT_2]
	cvtsi2sd xmm8, r10d
	divsd xmm8, xmm7
	movsd xmm0, xmm8
	mov rax, 1
	call _long_floor_pdouble
	push rax
;[[ fn(x) : [ function long floor( [[double x @ 8]] ) ] ]]
	pop rbx
	mov dword[rbp-64], ebx
;[[ id : yday]]
;[[ id : yday]]
;[[ ( : (], [ id : years], [ * : *], [ id : FLT_CONSTANT_3], [ ) : )]]
	mov r10d, dword[rbp-64]
	movsd xmm7, qword[FLT_CONSTANT_3]
	cvtsi2sd xmm8, r10d
	mulsd xmm8, xmm7
	movsd xmm0, xmm8
	mov rax, 1
	call _long_floor_pdouble
	push rax
;[[ id : yday], [ - : -], [ fn(x) : [ function long floor( [[double x @ 8]] ) ] ]]
	mov r11d, dword[rbp-56]
	pop r10
	mov r12, r11
	sub r12, r10
	mov ebx, r12d
	mov dword[rbp-56], r12d
;[[ id : wday]]
;[[ id : wday]]
;[[ ( : (], [ id : yday], [ + : +], [ int : 4], [ ) : )], [ % : %], [ int : 7]]
	mov r10d, dword[rbp-56]
	add r10d, 4
	mov r11, 7
	mov r12, r10
	xor rdx, rdx
	mov rax, r12
	idiv r11
	mov r12, rdx
	mov ebx, r12d
	mov dword[rbp-72], r12d
;[[ id : mday]]
;[[ id : mday]]
;[[ id : yday]]
	mov r10d, dword[rbp-56]
	mov ebx, r10d
	mov dword[rbp-88], r10d
;[[ int : 0]]
	mov dword[rbp-96], 0
	jmp _LFORCMP_0xa0
_LFORTOP_0x9f:
;[[ id : mday], [ > : >], [ id : mdays], [ [ : [], [ id : mi], [ ] : ]]]
	mov r10d, dword[rbp-96]
	mov rbx, mdays
	and r10, 0xffffffff
	lea rbx, [rbx+r10*4]
	mov ebx, dword[rbx]
	and rbx, 0xffffffff
	mov r10d, dword[rbp-88]
	cmp r10d, ebx
	setg r10b
	mov al, r10b
	and al, 1
	jz _LIFPOST_0xa3
;[[ id : mday]]
;[[ id : mday]]
;[[ id : mday], [ - : -], [ id : mdays], [ [ : [], [ id : mi], [ ] : ]]]
	mov r11d, dword[rbp-96]
	mov r10, mdays
	and r11, 0xffffffff
	lea r10, [r10+r11*4]
	mov r10d, dword[r10]
	and r10, 0xffffffff
	mov r11d, dword[rbp-88]
	sub r11d, r10d
	mov ebx, r11d
	mov dword[rbp-88], r11d
	jmp _LIFELSE_0xa4
_LIFPOST_0xa3:
	jmp _LFOREND_0xa2
_LIFELSE_0xa4:
_LFORUPDATE_0xa1:
;[[ id : mi], [ ++ : ++]]
	inc dword[rbp-96]
_LFORCMP_0xa0:
;[[ int : 1]]
	mov rax, 1
	and al, 1
	jnz _LFORTOP_0x9f
_LFOREND_0xa2:
;[[ id : month]]
;[[ id : month]]
;[[ id : mi], [ ++ : ++]]
	mov r10d, dword[rbp-96]
	inc r10d
	mov ebx, r10d
	mov dword[rbp-80], r10d
;[[ id : tmd], [ -> : ->], [ id : tm_sec]]
	mov rbx, qword[rbp-24]
;[[ id : tmd], [ -> : ->], [ id : tm_sec]]
	mov rbx, qword[rbp-24]
;[[ id : seconds]]
	mov r11d, dword[rbp-32]
	mov r10d, r11d
	mov dword[rbx], r11d
;[[ id : tmd], [ -> : ->], [ id : tm_min]]
	mov rbx, qword[rbp-24]
	lea rbx, [rbx+4]
;[[ id : tmd], [ -> : ->], [ id : tm_min]]
	mov rbx, qword[rbp-24]
	lea rbx, [rbx+4]
;[[ id : minutes]]
	mov r11d, dword[rbp-40]
	mov r10d, r11d
	mov dword[rbx], r11d
;[[ id : tmd], [ -> : ->], [ id : tm_hour]]
	mov rbx, qword[rbp-24]
	lea rbx, [rbx+8]
;[[ id : tmd], [ -> : ->], [ id : tm_hour]]
	mov rbx, qword[rbp-24]
	lea rbx, [rbx+8]
;[[ id : hours]]
	mov r11d, dword[rbp-48]
	mov r10d, r11d
	mov dword[rbx], r11d
;[[ id : tmd], [ -> : ->], [ id : tm_yday]]
	mov rbx, qword[rbp-24]
	lea rbx, [rbx+28]
;[[ id : tmd], [ -> : ->], [ id : tm_yday]]
	mov rbx, qword[rbp-24]
	lea rbx, [rbx+28]
;[[ id : yday]]
	mov r11d, dword[rbp-56]
	mov r10d, r11d
	mov dword[rbx], r11d
;[[ id : tmd], [ -> : ->], [ id : tm_year]]
	mov rbx, qword[rbp-24]
	lea rbx, [rbx+20]
;[[ id : tmd], [ -> : ->], [ id : tm_year]]
	mov rbx, qword[rbp-24]
	lea rbx, [rbx+20]
;[[ id : years], [ + : +], [ int : 70]]
	mov r11d, dword[rbp-64]
	add r11d, 70
	mov r10d, r11d
	mov dword[rbx], r11d
;[[ id : tmd], [ -> : ->], [ id : tm_wday]]
	mov rbx, qword[rbp-24]
	lea rbx, [rbx+24]
;[[ id : tmd], [ -> : ->], [ id : tm_wday]]
	mov rbx, qword[rbp-24]
	lea rbx, [rbx+24]
;[[ id : wday]]
	mov r11d, dword[rbp-72]
	mov r10d, r11d
	mov dword[rbx], r11d
;[[ id : tmd], [ -> : ->], [ id : tm_mday]]
	mov rbx, qword[rbp-24]
	lea rbx, [rbx+12]
;[[ id : tmd], [ -> : ->], [ id : tm_mday]]
	mov rbx, qword[rbp-24]
	lea rbx, [rbx+12]
;[[ id : mday]]
	mov r11d, dword[rbp-88]
	mov r10d, r11d
	mov dword[rbx], r11d
;[[ id : tmd], [ -> : ->], [ id : tm_mon]]
	mov rbx, qword[rbp-24]
	lea rbx, [rbx+16]
;[[ id : tmd], [ -> : ->], [ id : tm_mon]]
	mov rbx, qword[rbp-24]
	lea rbx, [rbx+16]
;[[ id : month]]
	mov r11d, dword[rbp-80]
	mov r10d, r11d
	mov dword[rbx], r11d
;[[ id : tmd]]
	mov rbx, qword[rbp-24]
	mov rax, rbx
	jmp ___tm._gmtime_ptime_t__return
___tm._gmtime_ptime_t__return:
	leave
	ret
	;[ function char. asctime( [[tm. timeptr @ 8]] ) ]
_char._asctime_ptm.:
	push rbp
	mov rbp, rsp
	sub rsp, 16
;Load Parameter: [tm. timeptr @ 8]
	mov [rbp-8], rdi
;[[ int : 28]]
	mov rdx, 28
;[[ char : 32]]
	mov sil, 32
	and rsi, 0xff
;[[ id : asctime__result_buf]]
	mov rdi, asctime__result_buf
	xor rax, rax
	call _void_memset_pvoid.ucharsize_t
	push rax
;[[ fn(x) : [ function void memset( [[void. dest @ 8], [uchar value @ 16], [size_t bytes @ 24]] ) ] ]]
	pop rax
;[[ id : wday_name], [ [ : [], [ id : timeptr], [ -> : ->], [ id : tm_wday], [ ] : ]]]
	mov rbx, qword[rbp-8]
	lea rbx, [rbx+24]
	mov ebx, dword[rbx]
	and rbx, 0xffffffff
	mov r10, wday_name
	lea r10, [r10+rbx*8]
	mov r10, qword[r10]
	mov rsi, r10
;[[ id : asctime__result_buf]]
	mov rbx, asctime__result_buf
	mov rdi, asctime__result_buf
	xor rax, rax
	call _int_strcpy_pchar.char.
	push rax
;[[ fn(x) : [ function int strcpy( [[char. dest @ 8], [char. source @ 16]] ) ] ]]
	pop rax
;[[ id : asctime__result_buf], [ [ : [], [ int : 3], [ ] : ]]]
	mov r10, 3
	mov rbx, asctime__result_buf
	lea rbx, [rbx+r10*1]
;[[ id : asctime__result_buf], [ [ : [], [ int : 3], [ ] : ]]]
	mov r10, 3
	mov rbx, asctime__result_buf
	lea rbx, [rbx+r10*1]
;[[ char : 32]]
	mov r10b, 32
	mov byte[rbx], 32
;[[ id : mon_name], [ [ : [], [ id : timeptr], [ -> : ->], [ id : tm_mon], [ ] : ]]]
	mov rbx, qword[rbp-8]
	lea rbx, [rbx+16]
	mov ebx, dword[rbx]
	and rbx, 0xffffffff
	mov r10, mon_name
	lea r10, [r10+rbx*8]
	mov r10, qword[r10]
	mov rsi, r10
;[[ id : asctime__result_buf], [ + : +], [ int : 4]]
	mov rbx, asctime__result_buf
	add rbx, 4
	mov rdi, rbx
	xor rax, rax
	call _int_strcpy_pchar.char.
	push rax
;[[ fn(x) : [ function int strcpy( [[char. dest @ 8], [char. source @ 16]] ) ] ]]
	pop rax
;[[ id : asctime__result_buf], [ [ : [], [ int : 7], [ ] : ]]]
	mov r10, 7
	mov rbx, asctime__result_buf
	lea rbx, [rbx+r10*1]
;[[ id : asctime__result_buf], [ [ : [], [ int : 7], [ ] : ]]]
	mov r10, 7
	mov rbx, asctime__result_buf
	lea rbx, [rbx+r10*1]
;[[ char : 32]]
	mov r10b, 32
	mov byte[rbx], 32
;[[ int : 0]]
	xor r9, r9
;[[ int : 0]]
	xor r8, r8
;[[ int : 0]]
	xor rcx, rcx
;[[ id : timeptr], [ -> : ->], [ id : tm_mday]]
	mov rbx, qword[rbp-8]
	lea rbx, [rbx+12]
	mov ebx, dword[rbx]
	and rbx, 0xffffffff
	mov rdx, rbx
;[[ id : STRING_CONSTANT_156]]
	mov rbx, STRING_CONSTANT_156
	mov rsi, STRING_CONSTANT_156
;[[ id : asctime__result_buf], [ + : +], [ int : 7]]
	mov rbx, asctime__result_buf
	add rbx, 7
	mov rdi, rbx
	xor rax, rax
	call _int_sprintf_pchar.char.voidvoidvoidvoid
	push rax
;[[ fn(x) : [ function int sprintf( [[char. dest @ 8], [char. fmt @ 16], [void arg1 @ 24], [void arg2 @ 32], [void arg3 @ 40], [void arg4 @ 48]] ) ] ]]
	pop rax
;[[ int : 1900], [ + : +], [ ( : (], [ id : timeptr], [ -> : ->], [ id : tm_year], [ ) : )]]
	mov rbx, qword[rbp-8]
	lea rbx, [rbx+20]
	mov ebx, dword[rbx]
	and rbx, 0xffffffff
	mov r10, 1900
	mov r11, rbx
	add r10, r11
	mov r9, r10
;[[ id : timeptr], [ -> : ->], [ id : tm_sec]]
	mov rbx, qword[rbp-8]
	lea rbx, [rbx+0]
	mov ebx, dword[rbx]
	and rbx, 0xffffffff
	mov r8, rbx
;[[ id : timeptr], [ -> : ->], [ id : tm_min]]
	mov rbx, qword[rbp-8]
	lea rbx, [rbx+4]
	mov ebx, dword[rbx]
	and rbx, 0xffffffff
	mov rcx, rbx
;[[ id : timeptr], [ -> : ->], [ id : tm_hour]]
	mov rbx, qword[rbp-8]
	lea rbx, [rbx+8]
	mov ebx, dword[rbx]
	and rbx, 0xffffffff
	mov rdx, rbx
;[[ id : STRING_CONSTANT_157]]
	mov rbx, STRING_CONSTANT_157
	mov rsi, STRING_CONSTANT_157
;[[ id : asctime__result_buf], [ + : +], [ int : 10]]
	mov rbx, asctime__result_buf
	add rbx, 10
	mov rdi, rbx
	xor rax, rax
	call _int_sprintf_pchar.char.voidvoidvoidvoid
	push rax
;[[ fn(x) : [ function int sprintf( [[char. dest @ 8], [char. fmt @ 16], [void arg1 @ 24], [void arg2 @ 32], [void arg3 @ 40], [void arg4 @ 48]] ) ] ]]
	pop rax
;[[ id : asctime__result_buf]]
	mov rbx, asctime__result_buf
	mov rax, asctime__result_buf
	jmp ___char._asctime_ptm.__return
___char._asctime_ptm.__return:
	leave
	ret
	;[ function void tzset( [] ) ]
	;[ function tm. localtime( [[time_t timer @ 8]] ) ]
_tm._localtime_ptime_t:
	push rbp
	mov rbp, rsp
	sub rsp, 16
;Load Parameter: [time_t timer @ 8]
	mov [rbp-8], rdi
	xor rax, rax
	call tzset
	push rax
;[[ fn(x) : [ function void tzset( [] ) ] ]]
	pop rax
;[[ id : timer], [ - : -], [ id : timezone]]
	mov r10, qword[timezone]
	mov rbx, qword[rbp-8]
	sub rbx, r10
	mov rdi, rbx
	xor rax, rax
	call _tm._gmtime_ptime_t
	push rax
;[[ fn(x) : [ function tm. gmtime( [[time_t timer @ 8]] ) ] ]]
	pop rax
	jmp ___tm._localtime_ptime_t__return
___tm._localtime_ptime_t__return:
	leave
	ret
	;[ function char. ctime( [[time_t timer @ 8]] ) ]
_char._ctime_ptime_t:
	push rbp
	mov rbp, rsp
	sub rsp, 16
;Load Parameter: [time_t timer @ 8]
	mov [rbp-8], rdi
;[[ id : timer]]
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	xor rax, rax
	call _tm._localtime_ptime_t
	push rax
;[[ fn(x) : [ function tm. localtime( [[time_t timer @ 8]] ) ] ]]
	pop rdi
	xor rax, rax
	call _char._asctime_ptm.
	push rax
;[[ fn(x) : [ function char. asctime( [[tm. timeptr @ 8]] ) ] ]]
	pop rax
	jmp ___char._ctime_ptime_t__return
___char._ctime_ptime_t__return:
	leave
	ret
	;[ function int inet_aton( [[char. cp @ 8], [in_addr. addr @ 16]] ) ]
_int_inet_aton_pchar.in_addr.:
	push rbp
	mov rbp, rsp
	sub rsp, 76
;Load Parameter: [char. cp @ 8]
	mov [rbp-8], rdi
;Load Parameter: [in_addr. addr @ 16]
	mov [rbp-16], rsi
;[[ & : &], [ id : p], [ + : +], [ int : 3]]
	lea rbx, [rbp-28]
	add rbx, 3
	mov r9, rbx
;[[ & : &], [ id : p], [ + : +], [ int : 2]]
	lea rbx, [rbp-28]
	add rbx, 2
	mov r8, rbx
;[[ & : &], [ id : p], [ + : +], [ int : 1]]
	lea rbx, [rbp-28]
	inc rbx
	mov rcx, rbx
;[[ & : &], [ id : p]]
	lea rbx, [rbp-28]
	mov rdx, rbx
;[[ id : cp]]
	mov rbx, qword[rbp-8]
	mov rsi, rbx
;[[ id : STRING_CONSTANT_158]]
	mov rbx, STRING_CONSTANT_158
	mov rdi, STRING_CONSTANT_158
	xor rax, rax
	call sscanf
	push rax
;[[ fn(x) : [ function int sscanf( [[char. fmt @ 0], [char. input @ 0], [void. a @ 0], [void. b @ 0], [void. c @ 0], [void. d @ 0]] ) ] ]]
	pop rax
	mov dword[rbp-36], eax
;[[ id : p], [ [ : [], [ int : 0], [ ] : ]], [ && : &&], [ int : 255]]
	lea rbx, [rbp-28] 
	mov bl, byte[rbx]
	and bl, 0xff
	mov r10, 255
	mov r11, rbx
	and r11, r10
	mov dword[rbp-44], r11d
;[[ id : p], [ [ : [], [ int : 1], [ ] : ]], [ && : &&], [ int : 255]]
	mov r10, 1
	lea rbx, [rbp-28] 
	lea rbx, [rbx+r10*1]
	mov bl, byte[rbx]
	and rbx, 0xff
	mov r10, 255
	mov r11, rbx
	and r11, r10
	mov dword[rbp-52], r11d
;[[ id : p], [ [ : [], [ int : 2], [ ] : ]], [ && : &&], [ int : 255]]
	mov r10, 2
	lea rbx, [rbp-28] 
	lea rbx, [rbx+r10*1]
	mov bl, byte[rbx]
	and rbx, 0xff
	mov r10, 255
	mov r11, rbx
	and r11, r10
	mov dword[rbp-60], r11d
;[[ id : p], [ [ : [], [ int : 3], [ ] : ]], [ && : &&], [ int : 255]]
	mov r10, 3
	lea rbx, [rbp-28] 
	lea rbx, [rbx+r10*1]
	mov bl, byte[rbx]
	and rbx, 0xff
	mov r10, 255
	mov r11, rbx
	and r11, r10
	mov dword[rbp-68], r11d
;[[ @ : @], [ id : addr]]
	mov rbx, qword[rbp-16]
;[[ @ : @], [ id : addr]]
	mov rbx, qword[rbp-16]
;[[ ( : (], [ id : d], [ ) : )], [ || : ||], [ ( : (], [ ( : (], [ id : a], [ << : <<], [ int : 24], [ ) : )], [ || : ||], [ ( : (], [ id : b], [ << : <<], [ int : 16], [ ) : )], [ || : ||], [ ( : (], [ id : c], [ << : <<], [ int : 8], [ ) : )], [ ) : )]]
	mov r11d, dword[rbp-44]
	sal r11d, 24
	mov r12d, dword[rbp-52]
	sal r12d, 16
	or r11d, r12d
	mov r12d, dword[rbp-60]
	sal r12d, 8
	or r11d, r12d
	mov r12d, dword[rbp-68]
	or r12d, r11d
	mov edi, r12d
	and rdi, 0xffffffff
	xor rax, rax
	xor rax,rax
	bswap edi
	mov eax, edi
_LINLINERETURN_0xa6:
	push rax
;[[ fn(x) : [ function int hton32( [[int x @ rdi]] ) ] ]]
	pop r10
	mov dword[rbx], r10d
;[[ int : 1]]
	mov rax, 1
	jmp ___int_inet_aton_pchar.in_addr.__return
___int_inet_aton_pchar.in_addr.__return:
	leave
	ret
	;[ function int recv( [[fd_t sockfd @ 8], [char. buff @ 16], [size_t len @ 24], [int flags @ 32]] ) ]
_int_recv_pfd_tchar.size_tint:
	push rbp
	mov rbp, rsp
	sub rsp, 40
;Load Parameter: [fd_t sockfd @ 8]
	mov [rbp-8], rdi
;Load Parameter: [char. buff @ 16]
	mov [rbp-16], rsi
;Load Parameter: [size_t len @ 24]
	mov [rbp-24], rdx
;Load Parameter: [int flags @ 32]
	mov [rbp-32], rcx
;[[ int : 0]]
	xor r9, r9
;[[ int : 0]]
	xor r8, r8
;[[ id : flags]]
	mov ebx, dword[rbp-32]
	mov ecx, ebx
	and rcx, 0xffffffff
;[[ id : len]]
	mov rbx, qword[rbp-24]
	mov rdx, rbx
;[[ id : buff]]
	mov rbx, qword[rbp-16]
	mov rsi, rbx
;[[ id : sockfd]]
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	xor rax, rax
	mov rax , 45 
	mov r10 , rcx 
	syscall 
_LINLINERETURN_0xa9:
	push rax
;[[ fn(x) : [ function int recvfrom( [[fd_t sockfd @ rdi], [char. buff @ rsi], [size_t len @ rdx], [int flags @ rcx], [sockaddr_in. addr @ r8], [size_t addrsize @ r9]] ) ] ]]
	pop rax
	jmp ___int_recv_pfd_tchar.size_tint__return
___int_recv_pfd_tchar.size_tint__return:
	leave
	ret
	;[ function int send( [[fd_t sockfd @ 8], [char. buff @ 16], [size_t len @ 24], [int flags @ 32]] ) ]
_int_send_pfd_tchar.size_tint:
	push rbp
	mov rbp, rsp
	sub rsp, 40
;Load Parameter: [fd_t sockfd @ 8]
	mov [rbp-8], rdi
;Load Parameter: [char. buff @ 16]
	mov [rbp-16], rsi
;Load Parameter: [size_t len @ 24]
	mov [rbp-24], rdx
;Load Parameter: [int flags @ 32]
	mov [rbp-32], rcx
;[[ int : 0]]
	xor r9, r9
;[[ int : 0]]
	xor r8, r8
;[[ id : flags]]
	mov ebx, dword[rbp-32]
	mov ecx, ebx
	and rcx, 0xffffffff
;[[ id : len]]
	mov rbx, qword[rbp-24]
	mov rdx, rbx
;[[ id : buff]]
	mov rsi, qword[rbp-16]
;[[ id : sockfd]]
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	xor rax, rax
	mov rax , 44 
	mov r10 , rcx 
	syscall 
_LINLINERETURN_0xac:
	push rax
;[[ fn(x) : [ function int sendto( [[fd_t fd @ rdi], [void. buff @ rsi], [size_t len @ rdx], [int flags @ rcx], [sockaddr_in. addr @ r8], [size_t addrsize @ r9]] ) ] ]]
	pop rax
	jmp ___int_send_pfd_tchar.size_tint__return
___int_send_pfd_tchar.size_tint__return:
	leave
	ret
	;[ function long execl( [[char. path @ 8], [char.. args @ 16]] ) ]
_long_execl_pchar.char..:
	push rbp
	mov rbp, rsp
	sub rsp, 24
;Load Parameter: [char. path @ 8]
	mov [rbp-8], rdi
;Load Parameter: [char.. args @ 16]
	mov [rbp-16], rsi
;[[ id : __emptyenv]]
	mov rbx, __emptyenv
	mov rdx, __emptyenv
;[[ id : args]]
	mov rbx, qword[rbp-16]
	mov rsi, rbx
;[[ id : path]]
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	xor rax, rax
	mov rax , 59 
	mov r10 , rcx 
	syscall 
_LINLINERETURN_0xaf:
	push rax
;[[ fn(x) : [ function long execve( [[char. pathname @ rdi], [char.. args @ rsi], [char.. env @ rdx]] ) ] ]]
	pop rax
	jmp ___long_execl_pchar.char..__return
___long_execl_pchar.char..__return:
	leave
	ret
	;[ function long system( [[char. command @ 8]] ) ]
_long_system_pchar.:
	push rbp
	mov rbp, rsp
	sub rsp, 32
;Load Parameter: [char. command @ 8]
	mov [rbp-8], rdi
	xor rax, rax
	mov rax , 57 
	mov r10 , rcx 
	syscall 
_LINLINERETURN_0xb2:
	push rax
;[[ fn(x) : [ function long fork( [] ) ] ]]
	pop rax
	mov qword[rbp-16], rax
;[[ id : pid], [ == : ==], [ int : 0]]
	mov rbx, qword[rbp-16]
	test rbx, rbx
	setz bl
	mov al, bl
	and al, 1
	jz _LIFPOST_0xb4
;[[ id : __systemcallargvconst], [ [ : [], [ int : 2], [ ] : ]]]
	mov r10, 2
	mov rbx, __systemcallargvconst
	lea rbx, [rbx+r10*8]
;[[ id : __systemcallargvconst], [ [ : [], [ int : 2], [ ] : ]]]
	mov r10, 2
	mov rbx, __systemcallargvconst
	lea rbx, [rbx+r10*8]
;[[ id : command]]
	mov r11, qword[rbp-8]
	mov r10, r11
	mov qword[rbx], r11
;[[ id : __systemcallargvconst]]
	mov rbx, __systemcallargvconst
	mov rsi, __systemcallargvconst
;[[ id : __systembashpath]]
	mov rbx, __systembashpath
	mov rdi, __systembashpath
	xor rax, rax
	call _long_execl_pchar.char..
	push rax
;[[ fn(x) : [ function long execl( [[char. path @ 8], [char.. args @ 16]] ) ] ]]
	pop rax
	mov qword[rbp-24], rax
;[[ id : err]]
	mov rbx, qword[rbp-24]
	mov rdi, rbx
	xor rax, rax
	call _char._strerror_plong
	push rax
;[[ fn(x) : [ function char. strerror( [[long errnum @ 8]] ) ] ]]
	pop rdi
	xor rax, rax
	push rdi
;[[ id : fmt]]
	mov rbx, rdi
	mov rsi, rdi
;[[ int : 1]]
	mov rdi, 1
	xor rax, rax
	call _int_fputs_pfd_tchar.
	mov rbx, rax
	pop rdi
	mov rax, rbx
	push rax
;[[ fn(x) : [ function int fputs( [[fd_t fd @ 8], [char. text @ 16]] ) ] ]]
	pop rax
_LINLINERETURN_0xb7:
	push rax
;[[ fn(x) : [ function void printf( [[char. fmt @ rdi]] ) ] ]]
	pop rax
	jmp _LIFELSE_0xb5
_LIFPOST_0xb4:
_LIFELSE_0xb5:
;[[ int : 0]]
	xor rdx, rdx
	and rdx, 0xffffffff
;[[ int : 0]]
	xor rsi, rsi
;[[ id : pid]]
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	xor rax, rax
	mov rax, 61
	xor r8, r8
	syscall
_LINLINERETURN_0xb9:
	push rax
;[[ fn(x) : [ function long waitpid( [[pid_t pid @ rdi], [int. wstatus @ rsi], [int options @ rdx]] ) ] ]]
	pop rax
;[[ int : 0]]
	xor rax, rax
	jmp ___long_system_pchar.__return
___long_system_pchar.__return:
	leave
	ret
	;[ function int scanint( [[char. str @ 8], [long. dest @ 16], [bool signed @ 24]] ) ]
_int_scanint_pchar.long.bool:
	push rbp
	mov rbp, rsp
	sub rsp, 64
;Load Parameter: [char. str @ 8]
	mov [rbp-8], rdi
;Load Parameter: [long. dest @ 16]
	mov [rbp-16], rsi
;Load Parameter: [bool signed @ 24]
	mov [rbp-24], rdx
;[[ int : 0]]
	mov qword[rbp-32], 0
;[[ $ : char], [ ( : (], [ @ : @], [ id : str], [ ) : )]]
	mov rbx, qword[rbp-8]
	and r10, 0xff
	mov r10b, byte[rbx]
	mov byte[rbp-40], r10b
;[[ int : 0]]
	mov byte[rbp-48], 0
;[[ id : str]]
	mov rbx, qword[rbp-8]
	mov qword[rbp-56], rbx
;[[ id : c], [ == : ==], [ char : 45], [ && : &&], [ id : signed]]
	mov r10b, 45
	mov bl, byte[rbp-40]
	cmp bl, r10b
	sete bl
	mov r10b, byte[rbp-24]
	and bl, r10b
	mov al, bl
	and al, 1
	jz _LIFPOST_0xbb
;[[ id : negative]]
;[[ id : negative]]
;[[ int : 1]]
	mov rbx, 1
	mov byte[rbp-48], bl
;[[ id : str]]
;[[ id : str]]
;[[ int : 1]]
	mov rbx, 1
	mov r10, qword[rbp-8]
	add r10, rbx
	mov qword[rbp-8], r10
;[[ id : c]]
;[[ id : c]]
;[[ $ : char], [ ( : (], [ @ : @], [ id : str], [ ) : )]]
	mov r10, qword[rbp-8]
	and r11, 0xff
	mov r11b, byte[r10]
	mov bl, r11b
	mov byte[rbp-40], r11b
	jmp _LIFELSE_0xbc
_LIFPOST_0xbb:
_LIFELSE_0xbc:
	jmp _LWHILECMP_0xbe
_LWHILESTART_0xbd:
;[[ id : val]]
;[[ id : val]]
;[[ ( : (], [ id : val], [ * : *], [ int : 10], [ ) : )], [ + : +], [ ( : (], [ id : c], [ - : -], [ char : 48], [ ) : )]]
	mov r11, 10
	mov r10, qword[rbp-32]
	imul r10, r11
	mov r11b, byte[rbp-40]
	sub r11b, 48
	mov r12, r11
	add r10, r12
	mov rbx, r10
	mov qword[rbp-32], r10
;[[ id : str]]
;[[ id : str]]
;[[ int : 1]]
	mov rbx, 1
	mov r10, qword[rbp-8]
	add r10, rbx
	mov qword[rbp-8], r10
;[[ id : c]]
;[[ id : c]]
;[[ $ : char], [ ( : (], [ @ : @], [ id : str], [ ) : )]]
	mov r10, qword[rbp-8]
	and r11, 0xff
	mov r11b, byte[r10]
	mov bl, r11b
	mov byte[rbp-40], r11b
_LWHILECMP_0xbe:
;[[ id : c], [ <= : <=], [ char : 57], [ && : &&], [ id : c], [ >= : >=], [ char : 48]]
	mov r10b, 57
	mov bl, byte[rbp-40]
	cmp bl, r10b
	setle bl
	mov r11b, 48
	mov r10b, byte[rbp-40]
	cmp r10b, r11b
	setge r10b
	and bl, r10b
	mov al, bl
	and al, 1
	jnz _LWHILESTART_0xbd
_LWHILEEND_0xbf:
;[[ ! : !], [ id : negative]]
	mov bl, byte[rbp-48]
	cmp bl, 0
	sete bl
	mov al, bl
	and al, 1
	jz _LIFPOST_0xc0
;[[ @ : @], [ id : dest]]
	mov rbx, qword[rbp-16]
;[[ @ : @], [ id : dest]]
	mov rbx, qword[rbp-16]
;[[ id : val]]
	mov r11, qword[rbp-32]
	mov r10, r11
	mov qword[rbx], r11
	jmp _LIFELSE_0xc1
_LIFPOST_0xc0:
;[[ @ : @], [ id : dest]]
	mov rbx, qword[rbp-16]
;[[ @ : @], [ id : dest]]
	mov rbx, qword[rbp-16]
;[[ int : 0], [ - : -], [ id : val]]
	mov r12, qword[rbp-32]
	xor r11, r11
	sub r11, r12
	mov r10, r11
	mov qword[rbx], r11
_LIFELSE_0xc1:
;[[ id : str], [ - : -], [ id : ogstr]]
	mov r10, qword[rbp-56]
	mov rbx, qword[rbp-8]
	sub rbx, r10
	mov eax, ebx
	jmp ___int_scanint_pchar.long.bool__return
___int_scanint_pchar.long.bool__return:
	leave
	ret
	;[ function int scanstr( [[char. str @ 8], [char delim @ 16], [char. dest @ 24]] ) ]
_int_scanstr_pchar.charchar.:
	push rbp
	mov rbp, rsp
	sub rsp, 40
;Load Parameter: [char. str @ 8]
	mov [rbp-8], rdi
;Load Parameter: [char delim @ 16]
	mov [rbp-16], rsi
;Load Parameter: [char. dest @ 24]
	mov [rbp-24], rdx
;[[ id : str]]
	mov rbx, qword[rbp-8]
	mov qword[rbp-32], rbx
	jmp _LWHILECMP_0xc3
_LWHILESTART_0xc2:
;[[ @ : @], [ id : dest]]
	mov rbx, qword[rbp-24]
;[[ @ : @], [ id : dest]]
	mov rbx, qword[rbp-24]
;[[ @ : @], [ id : str]]
	mov r11, qword[rbp-8]
	and r12, 0xff
	mov r12b, byte[r11]
	mov r10b, r12b
	mov byte[rbx], r12b
;[[ id : str], [ ++ : ++]]
	inc qword[rbp-8]
;[[ id : dest], [ ++ : ++]]
	inc qword[rbp-24]
_LWHILECMP_0xc3:
;[[ @ : @], [ id : str], [ != : !=], [ id : delim]]
	mov rbx, qword[rbp-8]
	and r10, 0xff
	mov r10b, byte[rbx]
	mov bl, byte[rbp-16]
	cmp r10b, bl
	setne r10b
	mov al, r10b
	and al, 1
	jnz _LWHILESTART_0xc2
_LWHILEEND_0xc4:
;[[ id : str], [ - : -], [ id : ogstr]]
	mov r10, qword[rbp-32]
	mov rbx, qword[rbp-8]
	sub rbx, r10
	mov eax, ebx
	jmp ___int_scanstr_pchar.charchar.__return
___int_scanstr_pchar.charchar.__return:
	leave
	ret
	;[ function int scansd( [[char. str @ 8], [bool double @ 16], [double. dest @ 24]] ) ]
_int_scansd_pchar.booldouble.:
	push rbp
	mov rbp, rsp
	sub rsp, 80
;Load Parameter: [char. str @ 8]
	mov [rbp-8], rdi
;Load Parameter: [bool double @ 16]
	mov [rbp-16], rsi
;Load Parameter: [double. dest @ 24]
	mov [rbp-24], rdx
;[[ int : 1]]
	mov rdx, 1
	and rdx, 0xff
;[[ & : &], [ id : integral]]
	lea rbx, [rbp-32]
	mov rsi, rbx
;[[ id : str]]
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	xor rax, rax
	call _int_scanint_pchar.long.bool
	push rax
;[[ fn(x) : [ function int scanint( [[char. str @ 8], [long. dest @ 16], [bool signed @ 24]] ) ] ]]
	pop rax
	mov qword[rbp-48], rax
;[[ id : str]]
;[[ id : str]]
;[[ id : diff]]
	mov rbx, qword[rbp-48]
	mov r10, qword[rbp-8]
	add r10, rbx
	mov qword[rbp-8], r10
;[[ @ : @], [ id : str], [ != : !=], [ char : 46]]
	mov rbx, qword[rbp-8]
	and r10, 0xff
	mov r10b, byte[rbx]
	mov bl, 46
	cmp r10b, bl
	setne r10b
	mov al, r10b
	and al, 1
	jz _LIFPOST_0xc5
;[[ @ : @], [ id : dest]]
	mov rbx, qword[rbp-24]
;[[ @ : @], [ id : dest]]
	mov rbx, qword[rbp-24]
;[[ id : integral]]
	cvtsi2sd xmm7, qword[rbp-32]
	movq qword[rbx], xmm7
;[[ id : diff]]
	mov rax, qword[rbp-48]
	jmp ___int_scansd_pchar.booldouble.__return
	jmp _LIFELSE_0xc6
_LIFPOST_0xc5:
_LIFELSE_0xc6:
;[[ id : str], [ ++ : ++]]
	inc qword[rbp-8]
;[[ int : 0]]
	xor rdx, rdx
	and rdx, 0xff
;[[ & : &], [ id : decimal]]
	lea rbx, [rbp-40]
	mov rsi, rbx
;[[ id : str]]
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	xor rax, rax
	call _int_scanint_pchar.long.bool
	push rax
;[[ fn(x) : [ function int scanint( [[char. str @ 8], [long. dest @ 16], [bool signed @ 24]] ) ] ]]
	pop rax
	mov qword[rbp-56], rax
;[[ id : dif2]]
	mov rbx, qword[rbp-56]
	mov rsi, rbx
;[[ int : 10]]
	mov rdi, 10
	xor rax, rax
	call _long_pow_plonglong
	push rax
;[[ fn(x) : [ function long pow( [[long base @ 8], [long exp @ 16]] ) ] ]]
	pop rax
	mov dword[rbp-64], eax
;[[ id : integral]]
;[[ id : integral]]
;[[ id : n]]
	mov ebx, dword[rbp-64]
	mov r10, qword[rbp-32]
	imul r10, rbx
	mov qword[rbp-32], r10
;[[ id : integral], [ + : +], [ id : decimal]]
	mov r10, qword[rbp-40]
	mov rbx, qword[rbp-32]
	add rbx, r10
	cvtsi2sd xmm7, rbx
	movsd qword[rbp-72], xmm7
;[[ @ : @], [ id : dest]]
	mov rbx, qword[rbp-24]
;[[ @ : @], [ id : dest]]
	mov rbx, qword[rbp-24]
;[[ id : num], [ / : /], [ ( : (], [ $ : double], [ id : n], [ ) : )]]
	mov r10d, dword[rbp-64]
	cvtsi2sd xmm8, r10d
	movsd xmm9, qword[rbp-72]
	divsd xmm9, xmm8
	movsd xmm7, xmm9
	movq qword[rbx], xmm7
;[[ id : diff], [ + : +], [ id : dif2]]
	mov r10, qword[rbp-56]
	mov rbx, qword[rbp-48]
	add rbx, r10
	mov eax, ebx
	jmp ___int_scansd_pchar.booldouble.__return
___int_scansd_pchar.booldouble.__return:
	leave
	ret
	;[ function int __SSCANF( [[char. format @ 8], [char. input @ 16], [void.. args @ 24]] ) ]
_int___SSCANF_pchar.char.void..:
	push rbp
	mov rbp, rsp
	sub rsp, 64
;Load Parameter: [char. format @ 8]
	mov [rbp-8], rdi
;Load Parameter: [char. input @ 16]
	mov [rbp-16], rsi
;Load Parameter: [void.. args @ 24]
	mov [rbp-24], rdx
;[[ int : 0]]
	mov dword[rbp-32], 0
;[[ id : input], [ == : ==], [ int : 0], [ || : ||], [ id : format], [ == : ==], [ int : 0]]
	mov rbx, qword[rbp-16]
	test rbx, rbx
	setz bl
	mov r10, qword[rbp-8]
	test r10, r10
	setz r10b
	or bl, r10b
	mov al, bl
	and al, 1
	jz _LIFPOST_0xc7
;[[ int : 0]]
	xor rax, rax
	jmp ___int___SSCANF_pchar.char.void..__return
	jmp _LIFELSE_0xc8
_LIFPOST_0xc7:
_LIFELSE_0xc8:
	jmp _LWHILECMP_0xca
_LWHILESTART_0xc9:
;[[ @ : @], [ id : format], [ != : !=], [ char : 37]]
	mov rbx, qword[rbp-8]
	and r10, 0xff
	mov r10b, byte[rbx]
	mov bl, 37
	cmp r10b, bl
	setne r10b
	mov al, r10b
	and al, 1
	jz _LIFPOST_0xcc
;[[ id : format], [ ++ : ++]]
	inc qword[rbp-8]
;[[ id : input], [ ++ : ++]]
	inc qword[rbp-16]
	jmp _LIFELSE_0xcd
_LIFPOST_0xcc:
;[[ id : format], [ ++ : ++]]
	inc qword[rbp-8]
;[[ @ : @], [ id : format]]
	mov rbx, qword[rbp-8]
	and r10, 0xff
	mov r10b, byte[rbx]
	mov byte[rbp-40], r10b
;[[ id : c], [ == : ==], [ char : 105]]
	mov r10b, 105
	mov bl, byte[rbp-40]
	cmp bl, r10b
	sete bl
	mov al, bl
	and al, 1
	jz _LIFPOST_0xce
;[[ id : diff]]
;[[ id : diff]]
;[[ int : 1]]
	mov rdx, 1
	and rdx, 0xff
;[[ id : args], [ [ : [], [ id : argc], [ ] : ]]]
	mov r11d, dword[rbp-32]
	mov r10, qword[rbp-24]
	and r11, 0xffffffff
	lea r10, [r10+r11*8]
	mov r10, qword[r10]
	mov rsi, r10
;[[ id : input]]
	mov r10, qword[rbp-16]
	mov rdi, r10
	xor rax, rax
	call _int_scanint_pchar.long.bool
	push rax
;[[ fn(x) : [ function int scanint( [[char. str @ 8], [long. dest @ 16], [bool signed @ 24]] ) ] ]]
	pop rbx
	mov qword[rbp-48], rbx
;[[ id : input]]
;[[ id : input]]
;[[ id : diff]]
	mov rbx, qword[rbp-48]
	mov r10, qword[rbp-16]
	add r10, rbx
	mov qword[rbp-16], r10
;[[ id : format], [ ++ : ++]]
	inc qword[rbp-8]
	jmp _LIFELSE_0xcf
_LIFPOST_0xce:
;[[ id : c], [ == : ==], [ char : 117]]
	mov r10b, 117
	mov bl, byte[rbp-40]
	cmp bl, r10b
	sete bl
	mov al, bl
	and al, 1
	jz _LIFPOST_0xd0
;[[ id : diff]]
;[[ id : diff]]
;[[ int : 0]]
	xor rdx, rdx
	and rdx, 0xff
;[[ id : args], [ [ : [], [ id : argc], [ ] : ]]]
	mov r11d, dword[rbp-32]
	mov r10, qword[rbp-24]
	and r11, 0xffffffff
	lea r10, [r10+r11*8]
	mov r10, qword[r10]
	mov rsi, r10
;[[ id : input]]
	mov r10, qword[rbp-16]
	mov rdi, r10
	xor rax, rax
	call _int_scanint_pchar.long.bool
	push rax
;[[ fn(x) : [ function int scanint( [[char. str @ 8], [long. dest @ 16], [bool signed @ 24]] ) ] ]]
	pop rbx
	mov qword[rbp-48], rbx
;[[ id : input]]
;[[ id : input]]
;[[ id : diff]]
	mov rbx, qword[rbp-48]
	mov r10, qword[rbp-16]
	add r10, rbx
	mov qword[rbp-16], r10
;[[ id : format], [ ++ : ++]]
	inc qword[rbp-8]
	jmp _LIFELSE_0xd1
_LIFPOST_0xd0:
;[[ id : c], [ == : ==], [ char : 99]]
	mov r10b, 99
	mov bl, byte[rbp-40]
	cmp bl, r10b
	sete bl
	mov al, bl
	and al, 1
	jz _LIFPOST_0xd2
;[[ id : args], [ [ : [], [ id : argc], [ ] : ]]]
	mov r10d, dword[rbp-32]
	mov rbx, qword[rbp-24]
	and r10, 0xffffffff
	lea rbx, [rbx+r10*8]
	mov rbx, qword[rbx]
	mov qword[rbp-56], rbx
;[[ @ : @], [ id : ptr]]
	mov rbx, qword[rbp-56]
;[[ @ : @], [ id : ptr]]
	mov rbx, qword[rbp-56]
;[[ @ : @], [ id : input]]
	mov r11, qword[rbp-16]
	and r12, 0xff
	mov r12b, byte[r11]
	mov r10b, r12b
	mov byte[rbx], r12b
;[[ id : input], [ ++ : ++]]
	inc qword[rbp-16]
;[[ id : format], [ ++ : ++]]
	inc qword[rbp-8]
	jmp _LIFELSE_0xd3
_LIFPOST_0xd2:
;[[ id : c], [ == : ==], [ char : 115]]
	mov r10b, 115
	mov bl, byte[rbp-40]
	cmp bl, r10b
	sete bl
	mov al, bl
	and al, 1
	jz _LIFPOST_0xd4
;[[ id : format], [ ++ : ++]]
	inc qword[rbp-8]
;[[ id : diff]]
;[[ id : diff]]
;[[ id : args], [ [ : [], [ id : argc], [ ] : ]]]
	mov r11d, dword[rbp-32]
	mov r10, qword[rbp-24]
	and r11, 0xffffffff
	lea r10, [r10+r11*8]
	mov r10, qword[r10]
	mov rdx, r10
;[[ @ : @], [ id : format]]
	mov r10, qword[rbp-8]
	and r11, 0xff
	mov r11b, byte[r10]
	mov sil, r11b
	and rsi, 0xff
;[[ id : input]]
	mov r10, qword[rbp-16]
	mov rdi, r10
	xor rax, rax
	call _int_scanstr_pchar.charchar.
	push rax
;[[ fn(x) : [ function int scanstr( [[char. str @ 8], [char delim @ 16], [char. dest @ 24]] ) ] ]]
	pop rbx
	mov qword[rbp-48], rbx
;[[ id : input]]
;[[ id : input]]
;[[ id : diff]]
	mov rbx, qword[rbp-48]
	mov r10, qword[rbp-16]
	add r10, rbx
	mov qword[rbp-16], r10
	jmp _LIFELSE_0xd5
_LIFPOST_0xd4:
;[[ id : c], [ == : ==], [ char : 102], [ || : ||], [ id : c], [ == : ==], [ char : 100]]
	mov r10b, 102
	mov bl, byte[rbp-40]
	cmp bl, r10b
	sete bl
	mov r11b, 100
	mov r10b, byte[rbp-40]
	cmp r10b, r11b
	sete r10b
	or bl, r10b
	mov al, bl
	and al, 1
	jz _LIFPOST_0xd6
;[[ id : diff]]
;[[ id : diff]]
;[[ id : args], [ [ : [], [ id : argc], [ ] : ]]]
	mov r11d, dword[rbp-32]
	mov r10, qword[rbp-24]
	and r11, 0xffffffff
	lea r10, [r10+r11*8]
	mov r10, qword[r10]
	mov rdx, r10
;[[ int : 0]]
	xor rsi, rsi
	and rsi, 0xff
;[[ id : input]]
	mov r10, qword[rbp-16]
	mov rdi, r10
	xor rax, rax
	call _int_scansd_pchar.booldouble.
	push rax
;[[ fn(x) : [ function int scansd( [[char. str @ 8], [bool double @ 16], [double. dest @ 24]] ) ] ]]
	pop rbx
	mov qword[rbp-48], rbx
;[[ id : input]]
;[[ id : input]]
;[[ id : diff]]
	mov rbx, qword[rbp-48]
	mov r10, qword[rbp-16]
	add r10, rbx
	mov qword[rbp-16], r10
;[[ id : format], [ ++ : ++]]
	inc qword[rbp-8]
	jmp _LIFELSE_0xd7
_LIFPOST_0xd6:
_LIFELSE_0xd7:
_LIFELSE_0xd5:
_LIFELSE_0xd3:
_LIFELSE_0xd1:
_LIFELSE_0xcf:
;[[ id : argc], [ ++ : ++]]
	inc dword[rbp-32]
_LIFELSE_0xcd:
_LWHILECMP_0xca:
;[[ @ : @], [ id : format], [ != : !=], [ int : 0]]
	mov rbx, qword[rbp-8]
	and r10, 0xff
	mov r10b, byte[rbx]
	test r10b, r10b
	setnz r10b
	mov al, r10b
	and al, 1
	jnz _LWHILESTART_0xc9
_LWHILEEND_0xcb:
;[[ id : argc]]
	mov ebx, dword[rbp-32]
	mov eax, ebx
	jmp ___int___SSCANF_pchar.char.void..__return
___int___SSCANF_pchar.char.void..__return:
	leave
	ret
	;[ function int sscanf( [[char. fmt @ 8], [char. input @ 16], [void. a @ 24], [void. b @ 32], [void. c @ 40], [void. d @ 48]] ) ]
sscanf:
	push rbp
	mov rbp, rsp
	sub rsp, 96
;Load Parameter: [char. fmt @ 8]
	mov [rbp-8], rdi
;Load Parameter: [char. input @ 16]
	mov [rbp-16], rsi
;Load Parameter: [void. a @ 24]
	mov [rbp-24], rdx
;Load Parameter: [void. b @ 32]
	mov [rbp-32], rcx
;Load Parameter: [void. c @ 40]
	mov [rbp-40], r8
;Load Parameter: [void. d @ 48]
	mov [rbp-48], r9
;[[ id : args], [ [ : [], [ int : 0], [ ] : ]]]
	lea rbx, [rbp-88] 
;[[ id : args], [ [ : [], [ int : 0], [ ] : ]]]
	lea rbx, [rbp-88] 
;[[ id : a]]
	mov r10, qword[rbp-24]
	mov qword[rbx], r10
;[[ id : args], [ [ : [], [ int : 1], [ ] : ]]]
	mov r10, 1
	lea rbx, [rbp-88] 
	lea rbx, [rbx+r10*8]
;[[ id : args], [ [ : [], [ int : 1], [ ] : ]]]
	mov r10, 1
	lea rbx, [rbp-88] 
	lea rbx, [rbx+r10*8]
;[[ id : b]]
	mov r10, qword[rbp-32]
	mov qword[rbx], r10
;[[ id : args], [ [ : [], [ int : 2], [ ] : ]]]
	mov r10, 2
	lea rbx, [rbp-88] 
	lea rbx, [rbx+r10*8]
;[[ id : args], [ [ : [], [ int : 2], [ ] : ]]]
	mov r10, 2
	lea rbx, [rbp-88] 
	lea rbx, [rbx+r10*8]
;[[ id : c]]
	mov r10, qword[rbp-40]
	mov qword[rbx], r10
;[[ id : args], [ [ : [], [ int : 3], [ ] : ]]]
	mov r10, 3
	lea rbx, [rbp-88] 
	lea rbx, [rbx+r10*8]
;[[ id : args], [ [ : [], [ int : 3], [ ] : ]]]
	mov r10, 3
	lea rbx, [rbp-88] 
	lea rbx, [rbx+r10*8]
;[[ id : d]]
	mov r10, qword[rbp-48]
	mov qword[rbx], r10
;[[ & : &], [ id : args]]
	lea rbx, [rbp-88]
	mov rdx, rbx
;[[ id : input]]
	mov rbx, qword[rbp-16]
	mov rsi, rbx
;[[ id : fmt]]
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	xor rax, rax
	call _int___SSCANF_pchar.char.void..
	push rax
;[[ fn(x) : [ function int __SSCANF( [[char. format @ 8], [char. input @ 16], [void.. args @ 24]] ) ] ]]
	pop rax
	jmp __sscanf__return
__sscanf__return:
	leave
	ret
	;[ function int sscanf( [[char. fmt @ 0], [char. input @ 0], [void. a @ 0], [void. b @ 0], [void. c @ 0]] ) ]
	;[ function int sscanf( [[char. fmt @ 0], [char. input @ 0], [void. a @ 0], [void. b @ 0]] ) ]
	;[ function int sscanf( [[char. fmt @ 0], [char. input @ 0], [void. a @ 0]] ) ]
	;[ function int sscanf( [[char. fmt @ 0], [char. input @ 0]] ) ]
	;[ function int getInt( [[char. msg @ 8]] ) ]
_int_getInt_pchar.:
	push rbp
	mov rbp, rsp
	sub rsp, 64
;Load Parameter: [char. msg @ 8]
	mov [rbp-8], rdi
;[[ id : msg]]
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	xor rax, rax
	push rdi
;[[ id : fmt]]
	mov rbx, rdi
	mov rsi, rdi
;[[ int : 1]]
	mov rdi, 1
	xor rax, rax
	call _int_fputs_pfd_tchar.
	mov rbx, rax
	pop rdi
	mov rax, rbx
	push rax
;[[ fn(x) : [ function int fputs( [[fd_t fd @ 8], [char. text @ 16]] ) ] ]]
	pop rax
_LINLINERETURN_0xd9:
	push rax
;[[ fn(x) : [ function void printf( [[char. fmt @ rdi]] ) ] ]]
	pop rax
;[[ int : 40]]
	mov rdx, 40
;[[ int : 0]]
	xor rsi, rsi
	and rsi, 0xff
;[[ & : &], [ id : buff]]
	lea rbx, [rbp-56]
	mov rdi, rbx
	xor rax, rax
	call _void_memset_pvoid.ucharsize_t
	push rax
;[[ fn(x) : [ function void memset( [[void. dest @ 8], [uchar value @ 16], [size_t bytes @ 24]] ) ] ]]
	pop rax
;[[ int : 40]]
	mov rdx, 40
;[[ & : &], [ id : buff]]
	lea rbx, [rbp-56]
	mov rsi, rbx
;[[ int : 0]]
	xor rdi, rdi
	xor rax, rax
	call _long_fgets_pfd_tchar.size_t
	push rax
;[[ fn(x) : [ function long fgets( [[fd_t fd @ 8], [char. buffer @ 16], [size_t amt @ 24]] ) ] ]]
	pop rax
;[[ int : 1]]
	mov rsi, 1
	and rsi, 0xff
;[[ & : &], [ id : buff]]
	lea rbx, [rbp-56]
	mov rdi, rbx
	xor rax, rax
	call _int_toInteger_pchar.bool
	push rax
;[[ fn(x) : [ function int toInteger( [[char. str @ 0], [bool signed @ 0]] ) ] ]]
	pop rax
	jmp ___int_getInt_pchar.__return
___int_getInt_pchar.__return:
	leave
	ret
	;[ function uint getUint( [[char. msg @ 8]] ) ]
_uint_getUint_pchar.:
	push rbp
	mov rbp, rsp
	sub rsp, 64
;Load Parameter: [char. msg @ 8]
	mov [rbp-8], rdi
;[[ id : msg]]
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	xor rax, rax
	push rdi
;[[ id : fmt]]
	mov rbx, rdi
	mov rsi, rdi
;[[ int : 1]]
	mov rdi, 1
	xor rax, rax
	call _int_fputs_pfd_tchar.
	mov rbx, rax
	pop rdi
	mov rax, rbx
	push rax
;[[ fn(x) : [ function int fputs( [[fd_t fd @ 8], [char. text @ 16]] ) ] ]]
	pop rax
_LINLINERETURN_0xdb:
	push rax
;[[ fn(x) : [ function void printf( [[char. fmt @ rdi]] ) ] ]]
	pop rax
;[[ int : 40]]
	mov rdx, 40
;[[ int : 0]]
	xor rsi, rsi
	and rsi, 0xff
;[[ & : &], [ id : buff]]
	lea rbx, [rbp-56]
	mov rdi, rbx
	xor rax, rax
	call _void_memset_pvoid.ucharsize_t
	push rax
;[[ fn(x) : [ function void memset( [[void. dest @ 8], [uchar value @ 16], [size_t bytes @ 24]] ) ] ]]
	pop rax
;[[ int : 40]]
	mov rdx, 40
;[[ & : &], [ id : buff]]
	lea rbx, [rbp-56]
	mov rsi, rbx
;[[ int : 0]]
	xor rdi, rdi
	xor rax, rax
	call _long_fgets_pfd_tchar.size_t
	push rax
;[[ fn(x) : [ function long fgets( [[fd_t fd @ 8], [char. buffer @ 16], [size_t amt @ 24]] ) ] ]]
	pop rax
;[[ int : 1]]
	mov rsi, 1
	and rsi, 0xff
;[[ & : &], [ id : buff]]
	lea rbx, [rbp-56]
	mov rdi, rbx
	xor rax, rax
	call _int_toInteger_pchar.bool
	push rax
;[[ fn(x) : [ function int toInteger( [[char. str @ 0], [bool signed @ 0]] ) ] ]]
	pop rax
	jmp ___uint_getUint_pchar.__return
___uint_getUint_pchar.__return:
	leave
	ret
	;[ function char getchar( [] ) ]
_char_getchar_p:
	push rbp
	mov rbp, rsp
	sub rsp, 16
;[[ int : 1]]
	mov rdx, 1
;[[ & : &], [ id : c]]
	lea rbx, [rbp-8]
	mov rsi, rbx
;[[ int : 0]]
	xor rdi, rdi
	xor rax, rax
	call _long_fgets_pfd_tchar.size_t
	push rax
;[[ fn(x) : [ function long fgets( [[fd_t fd @ 8], [char. buffer @ 16], [size_t amt @ 24]] ) ] ]]
	pop rax
;[[ id : c]]
	mov bl, byte[rbp-8]
	mov al, bl
	jmp ___char_getchar_p__return
___char_getchar_p__return:
	leave
	ret
	;[ function int getHex( [[char. msg @ 8]] ) ]
_int_getHex_pchar.:
	push rbp
	mov rbp, rsp
	sub rsp, 16
;Load Parameter: [char. msg @ 8]
	mov [rbp-8], rdi
;[[ int : 0]]
	xor rax, rax
	jmp ___int_getHex_pchar.__return
___int_getHex_pchar.__return:
	leave
	ret
	;[ function void getString( [[char. buffer @ 8], [int maxlen @ 16], [char. msg @ 24]] ) ]
_void_getString_pchar.intchar.:
	push rbp
	mov rbp, rsp
	sub rsp, 32
;Load Parameter: [char. buffer @ 8]
	mov [rbp-8], rdi
;Load Parameter: [int maxlen @ 16]
	mov [rbp-16], rsi
;Load Parameter: [char. msg @ 24]
	mov [rbp-24], rdx
;[[ id : msg]]
	mov rbx, qword[rbp-24]
	mov rdi, rbx
	xor rax, rax
	push rdi
;[[ id : fmt]]
	mov rbx, rdi
	mov rsi, rdi
;[[ int : 1]]
	mov rdi, 1
	xor rax, rax
	call _int_fputs_pfd_tchar.
	mov rbx, rax
	pop rdi
	mov rax, rbx
	push rax
;[[ fn(x) : [ function int fputs( [[fd_t fd @ 8], [char. text @ 16]] ) ] ]]
	pop rax
_LINLINERETURN_0xdd:
	push rax
;[[ fn(x) : [ function void printf( [[char. fmt @ rdi]] ) ] ]]
	pop rax
;[[ id : maxlen]]
	mov edx, dword[rbp-16]
;[[ id : buffer]]
	mov rbx, qword[rbp-8]
	mov rsi, rbx
;[[ int : 0]]
	xor rdi, rdi
	xor rax, rax
	call _long_fgets_pfd_tchar.size_t
	push rax
;[[ fn(x) : [ function long fgets( [[fd_t fd @ 8], [char. buffer @ 16], [size_t amt @ 24]] ) ] ]]
	pop rax
___void_getString_pchar.intchar.__return:
	leave
	ret
	;[ function int toInteger( [[char. str @ 8], [bool signed @ 16]] ) ]
_int_toInteger_pchar.bool:
	push rbp
	mov rbp, rsp
	sub rsp, 48
;Load Parameter: [char. str @ 8]
	mov [rbp-8], rdi
;Load Parameter: [bool signed @ 16]
	mov [rbp-16], rsi
	jmp _LWHILECMP_0xdf
_LWHILESTART_0xde:
;[[ id : str]]
;[[ id : str]]
;[[ int : 1]]
	mov rbx, 1
	mov r10, qword[rbp-8]
	add r10, rbx
	mov qword[rbp-8], r10
_LWHILECMP_0xdf:
;[[ @ : @], [ id : str], [ == : ==], [ char : 32]]
	mov rbx, qword[rbp-8]
	and r10, 0xff
	mov r10b, byte[rbx]
	mov bl, 32
	cmp r10b, bl
	sete r10b
	mov al, r10b
	and al, 1
	jnz _LWHILESTART_0xde
_LWHILEEND_0xe0:
;[[ $ : char], [ ( : (], [ @ : @], [ id : str], [ ) : )]]
	mov rbx, qword[rbp-8]
	and r10, 0xff
	mov r10b, byte[rbx]
	mov byte[rbp-24], r10b
;[[ int : 0]]
	mov dword[rbp-32], 0
;[[ int : 0]]
	mov byte[rbp-40], 0
;[[ id : c], [ == : ==], [ char : 45], [ && : &&], [ id : signed]]
	mov r10b, 45
	mov bl, byte[rbp-24]
	cmp bl, r10b
	sete bl
	mov r10b, byte[rbp-16]
	and bl, r10b
	mov al, bl
	and al, 1
	jz _LIFPOST_0xe1
;[[ id : negative]]
;[[ id : negative]]
;[[ int : 1]]
	mov rbx, 1
	mov byte[rbp-40], bl
;[[ id : str]]
;[[ id : str]]
;[[ int : 1]]
	mov rbx, 1
	mov r10, qword[rbp-8]
	add r10, rbx
	mov qword[rbp-8], r10
;[[ id : c]]
;[[ id : c]]
;[[ $ : char], [ ( : (], [ @ : @], [ id : str], [ ) : )]]
	mov r10, qword[rbp-8]
	and r11, 0xff
	mov r11b, byte[r10]
	mov bl, r11b
	mov byte[rbp-24], r11b
	jmp _LIFELSE_0xe2
_LIFPOST_0xe1:
_LIFELSE_0xe2:
	jmp _LWHILECMP_0xe4
_LWHILESTART_0xe3:
;[[ id : val]]
;[[ id : val]]
;[[ ( : (], [ id : val], [ * : *], [ int : 10], [ ) : )], [ + : +], [ ( : (], [ id : c], [ - : -], [ char : 48], [ ) : )]]
	mov r11d, dword[rbp-32]
	mov r10, 10
	mov r12, r11
	imul r12, r10
	mov r10b, byte[rbp-24]
	sub r10b, 48
	mov r11, r10
	add r12, r11
	mov ebx, r12d
	mov dword[rbp-32], r12d
;[[ id : str]]
;[[ id : str]]
;[[ int : 1]]
	mov rbx, 1
	mov r10, qword[rbp-8]
	add r10, rbx
	mov qword[rbp-8], r10
;[[ id : c]]
;[[ id : c]]
;[[ $ : char], [ ( : (], [ @ : @], [ id : str], [ ) : )]]
	mov r10, qword[rbp-8]
	and r11, 0xff
	mov r11b, byte[r10]
	mov bl, r11b
	mov byte[rbp-24], r11b
_LWHILECMP_0xe4:
;[[ id : c], [ != : !=], [ int : 0], [ && : &&], [ id : c], [ != : !=], [ int : 10], [ && : &&], [ id : c], [ != : !=], [ char : 32]]
	mov bl, byte[rbp-24]
	test bl, bl
	setnz bl
	mov r11b, byte[rbp-24]
	mov r10, 10
	mov r12, r11
	cmp r12, r10
	setne r12b
	and bl, r12b
	mov r11b, 32
	mov r10b, byte[rbp-24]
	cmp r10b, r11b
	setne r10b
	and bl, r10b
	mov al, bl
	and al, 1
	jnz _LWHILESTART_0xe3
_LWHILEEND_0xe5:
;[[ id : negative]]
	mov bl, byte[rbp-40]
	mov al, bl
	and al, 1
	jz _LIFPOST_0xe6
;[[ int : 0], [ - : -], [ id : val]]
	mov r10d, dword[rbp-32]
	xor rbx, rbx
	mov r11, r10
	sub rbx, r11
	mov eax, ebx
	jmp ___int_toInteger_pchar.bool__return
	jmp _LIFELSE_0xe7
_LIFPOST_0xe6:
_LIFELSE_0xe7:
;[[ id : val]]
	mov ebx, dword[rbp-32]
	mov eax, ebx
	jmp ___int_toInteger_pchar.bool__return
___int_toInteger_pchar.bool__return:
	leave
	ret
	;[ function int __scanf( [[char. format @ 8], [void.. args @ 16], [fd_t file @ 24]] ) ]
__scanf:
	push rbp
	mov rbp, rsp
	sub rsp, 64
;Load Parameter: [char. format @ 8]
	mov [rbp-8], rdi
;Load Parameter: [void.. args @ 16]
	mov [rbp-16], rsi
;Load Parameter: [fd_t file @ 24]
	mov [rbp-24], rdx
;[[ int : 0]]
	mov qword[rbp-32], 0
;[[ int : 0]]
	mov qword[rbp-40], 0
;[[ int : 0]]
	mov qword[rbp-48], 0
_LDOWHILE_0xe8:
;[[ id : len]]
;[[ id : len]]
;[[ int : 1000]]
	mov rbx, 1000
	mov r11, qword[rbp-40]
	add r11, rbx
	mov qword[rbp-40], r11
;[[ id : inp]]
;[[ id : inp]]
;[[ id : len]]
	mov r10, qword[rbp-40]
	mov rsi, r10
;[[ id : inp]]
	mov rdi, qword[rbp-32]
	xor rax, rax
	call _void._realloc_pvoid.size_t
	push rax
;[[ fn(x) : [ function void. realloc( [[void. addr @ 8], [size_t newsize @ 16]] ) ] ]]
	pop rbx
	mov qword[rbp-32], rbx
;[[ id : gotten]]
;[[ id : gotten]]
;[[ int : 1000]]
	mov rdx, 1000
;[[ id : inp], [ + : +], [ id : len], [ - : -], [ int : 1000]]
	mov r11, qword[rbp-32]
	mov r10, qword[rbp-40]
	add r11, r10
	sub r11, 1000
	mov rsi, r11
;[[ id : file]]
	mov r10, qword[rbp-24]
	mov rdi, r10
	xor rax, rax
	call _long_fgets_pfd_tchar.size_t
	push rax
;[[ fn(x) : [ function long fgets( [[fd_t fd @ 8], [char. buffer @ 16], [size_t amt @ 24]] ) ] ]]
	pop rbx
	mov qword[rbp-48], rbx
;[[ id : inp], [ [ : [], [ id : len], [ - : -], [ int : 1000], [ + : +], [ id : gotten], [ ] : ]]]
	mov rbx, qword[rbp-40]
	sub rbx, 1000
	mov r10, qword[rbp-48]
	add rbx, r10
	mov r10, qword[rbp-32]
	lea r10, [r10+rbx*1]
;[[ id : inp], [ [ : [], [ id : len], [ - : -], [ int : 1000], [ + : +], [ id : gotten], [ ] : ]]]
	mov rbx, qword[rbp-40]
	sub rbx, 1000
	mov r10, qword[rbp-48]
	add rbx, r10
	mov r10, qword[rbp-32]
	lea r10, [r10+rbx*1]
;[[ int : 0]]
	xor rbx, rbx
	mov byte[r10], bl
;[[ ( : (], [ id : gotten], [ >= : >=], [ int : 1000], [ ) : )]]
	mov r10, 1000
	mov rbx, qword[rbp-48]
	cmp rbx, r10
	setge bl
	mov rax, rbx
	and al, 1
	jnz _LDOWHILE_0xe8
;[[ id : args]]
	mov rbx, qword[rbp-16]
	mov rdx, rbx
;[[ id : inp]]
	mov rbx, qword[rbp-32]
	mov rsi, rbx
;[[ id : format]]
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	xor rax, rax
	call _int___SSCANF_pchar.char.void..
	push rax
;[[ fn(x) : [ function int __SSCANF( [[char. format @ 8], [char. input @ 16], [void.. args @ 24]] ) ] ]]
	pop rax
	mov dword[rbp-56], eax
;[[ id : inp]]
	mov rdi, qword[rbp-32]
	xor rax, rax
	call _void_free_pvoid.
	push rax
;[[ fn(x) : [ function void free( [[void. addr @ 8]] ) ] ]]
	pop rax
;[[ id : retval]]
	mov ebx, dword[rbp-56]
	mov eax, ebx
	jmp ____scanf__return
____scanf__return:
	leave
	ret
	;[ function size_t scanf( [[char. format @ 8], [void. a @ 16], [void. b @ 24], [void. c @ 32], [void. d @ 40], [void. e @ 48]] ) ]
scanf:
	push rbp
	mov rbp, rsp
	sub rsp, 104
;Load Parameter: [char. format @ 8]
	mov [rbp-8], rdi
;Load Parameter: [void. a @ 16]
	mov [rbp-16], rsi
;Load Parameter: [void. b @ 24]
	mov [rbp-24], rdx
;Load Parameter: [void. c @ 32]
	mov [rbp-32], rcx
;Load Parameter: [void. d @ 40]
	mov [rbp-40], r8
;Load Parameter: [void. e @ 48]
	mov [rbp-48], r9
;[[ id : args], [ [ : [], [ int : 0], [ ] : ]]]
	lea rbx, [rbp-96] 
;[[ id : args], [ [ : [], [ int : 0], [ ] : ]]]
	lea rbx, [rbp-96] 
;[[ id : a]]
	mov r10, qword[rbp-16]
	mov qword[rbx], r10
;[[ id : args], [ [ : [], [ int : 1], [ ] : ]]]
	mov r10, 1
	lea rbx, [rbp-96] 
	lea rbx, [rbx+r10*8]
;[[ id : args], [ [ : [], [ int : 1], [ ] : ]]]
	mov r10, 1
	lea rbx, [rbp-96] 
	lea rbx, [rbx+r10*8]
;[[ id : b]]
	mov r10, qword[rbp-24]
	mov qword[rbx], r10
;[[ id : args], [ [ : [], [ int : 2], [ ] : ]]]
	mov r10, 2
	lea rbx, [rbp-96] 
	lea rbx, [rbx+r10*8]
;[[ id : args], [ [ : [], [ int : 2], [ ] : ]]]
	mov r10, 2
	lea rbx, [rbp-96] 
	lea rbx, [rbx+r10*8]
;[[ id : c]]
	mov r10, qword[rbp-32]
	mov qword[rbx], r10
;[[ id : args], [ [ : [], [ int : 3], [ ] : ]]]
	mov r10, 3
	lea rbx, [rbp-96] 
	lea rbx, [rbx+r10*8]
;[[ id : args], [ [ : [], [ int : 3], [ ] : ]]]
	mov r10, 3
	lea rbx, [rbp-96] 
	lea rbx, [rbx+r10*8]
;[[ id : d]]
	mov r10, qword[rbp-40]
	mov qword[rbx], r10
;[[ id : args], [ [ : [], [ int : 4], [ ] : ]]]
	mov r10, 4
	lea rbx, [rbp-96] 
	lea rbx, [rbx+r10*8]
;[[ id : args], [ [ : [], [ int : 4], [ ] : ]]]
	mov r10, 4
	lea rbx, [rbp-96] 
	lea rbx, [rbx+r10*8]
;[[ id : e]]
	mov r10, qword[rbp-48]
	mov qword[rbx], r10
;[[ int : 0]]
	xor rdx, rdx
;[[ & : &], [ id : args]]
	lea rbx, [rbp-96]
	mov rsi, rbx
;[[ id : format]]
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	xor rax, rax
	call __scanf
	push rax
;[[ fn(x) : [ function int __scanf( [[char. format @ 8], [void.. args @ 16], [fd_t file @ 24]] ) ] ]]
	pop rax
	jmp __scanf__return
__scanf__return:
	leave
	ret
	;[ function size_t scanf( [[char. format @ 0], [void. a @ 0], [void. b @ 0], [void. c @ 0], [void. d @ 0]] ) ]
	;[ function size_t scanf( [[char. format @ 0], [void. a @ 0], [void. b @ 0], [void. c @ 0]] ) ]
	;[ function size_t scanf( [[char. format @ 0], [void. a @ 0], [void. b @ 0]] ) ]
	;[ function size_t scanf( [[char. format @ 0], [void. a @ 0]] ) ]
	;[ function size_t scanf( [[char. format @ 0]] ) ]
	;[ function size_t fscanf( [[fd_t file @ 8], [char. format @ 16], [void. a @ 24], [void. b @ 32], [void. c @ 40], [void. d @ 48]] ) ]
fscanf:
	push rbp
	mov rbp, rsp
	sub rsp, 96
;Load Parameter: [fd_t file @ 8]
	mov [rbp-8], rdi
;Load Parameter: [char. format @ 16]
	mov [rbp-16], rsi
;Load Parameter: [void. a @ 24]
	mov [rbp-24], rdx
;Load Parameter: [void. b @ 32]
	mov [rbp-32], rcx
;Load Parameter: [void. c @ 40]
	mov [rbp-40], r8
;Load Parameter: [void. d @ 48]
	mov [rbp-48], r9
;[[ id : args], [ [ : [], [ int : 0], [ ] : ]]]
	lea rbx, [rbp-88] 
;[[ id : args], [ [ : [], [ int : 0], [ ] : ]]]
	lea rbx, [rbp-88] 
;[[ id : a]]
	mov r10, qword[rbp-24]
	mov qword[rbx], r10
;[[ id : args], [ [ : [], [ int : 1], [ ] : ]]]
	mov r10, 1
	lea rbx, [rbp-88] 
	lea rbx, [rbx+r10*8]
;[[ id : args], [ [ : [], [ int : 1], [ ] : ]]]
	mov r10, 1
	lea rbx, [rbp-88] 
	lea rbx, [rbx+r10*8]
;[[ id : b]]
	mov r10, qword[rbp-32]
	mov qword[rbx], r10
;[[ id : args], [ [ : [], [ int : 2], [ ] : ]]]
	mov r10, 2
	lea rbx, [rbp-88] 
	lea rbx, [rbx+r10*8]
;[[ id : args], [ [ : [], [ int : 2], [ ] : ]]]
	mov r10, 2
	lea rbx, [rbp-88] 
	lea rbx, [rbx+r10*8]
;[[ id : c]]
	mov r10, qword[rbp-40]
	mov qword[rbx], r10
;[[ id : args], [ [ : [], [ int : 3], [ ] : ]]]
	mov r10, 3
	lea rbx, [rbp-88] 
	lea rbx, [rbx+r10*8]
;[[ id : args], [ [ : [], [ int : 3], [ ] : ]]]
	mov r10, 3
	lea rbx, [rbp-88] 
	lea rbx, [rbx+r10*8]
;[[ id : d]]
	mov r10, qword[rbp-48]
	mov qword[rbx], r10
;[[ id : file]]
	mov rbx, qword[rbp-8]
	mov rdx, rbx
;[[ & : &], [ id : args]]
	lea rbx, [rbp-88]
	mov rsi, rbx
;[[ id : format]]
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	xor rax, rax
	call __scanf
	push rax
;[[ fn(x) : [ function int __scanf( [[char. format @ 8], [void.. args @ 16], [fd_t file @ 24]] ) ] ]]
	pop rax
	jmp __fscanf__return
__fscanf__return:
	leave
	ret
	;[ function size_t fscanf( [[fd_t file @ 0], [char. format @ 0], [void. a @ 0], [void. b @ 0], [void. c @ 0]] ) ]
	;[ function size_t fscanf( [[fd_t file @ 0], [char. format @ 0], [void. a @ 0], [void. b @ 0]] ) ]
	;[ function size_t fscanf( [[fd_t file @ 0], [char. format @ 0], [void. a @ 0]] ) ]
	;[ function size_t fscanf( [[fd_t file @ 0], [char. format @ 0]] ) ]
	;[ function void mutex_cmpxchg( [[mutex. mut @ 8], [int expect @ 16], [int desire @ 24]] ) ]
_void_mutex_cmpxchg_pmutex.intint:
	push rbp
	mov rbp, rsp
	sub rsp, 40
;Load Parameter: [mutex. mut @ 8]
	mov [rbp-8], rdi
;Load Parameter: [int expect @ 16]
	mov [rbp-16], rsi
;Load Parameter: [int desire @ 24]
	mov [rbp-24], rdx
;[[ & : &], [ id : expect]]
	lea rbx, [rbp-16]
	mov qword[rbp-32], rbx
;[[ id : desire]]
	mov ebx, dword[rbp-24]
	mov edx, ebx
	and rdx, 0xffffffff
;[[ id : ep]]
	mov rbx, qword[rbp-32]
	mov rsi, rbx
;[[ id : mut]]
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	xor rax, rax
	mov eax, [rsi]
	lock cmpxchg dword[rdi], edx
	jz _L_0xeb__end
	mov eax, [rdi]
	mov [rsi], eax
_L_0xeb__end:
_LINLINERETURN_0xea:
	push rax
;[[ fn(x) : [ function int _atomic_cmpxchg( [[int. atom @ rdi], [int. expected @ rsi], [int desired @ rdx]] ) ] ]]
	pop rax
;[[ @ : @], [ id : ep]]
	mov rbx, qword[rbp-32]
	and r10, 0xffffffff
	mov r10d, dword[rbx]
	mov rax, r10
	jmp ___void_mutex_cmpxchg_pmutex.intint__return
___void_mutex_cmpxchg_pmutex.intint__return:
	leave
	ret
	;[ function void mlock( [[mutex. mut @ 8]] ) ]
_void_mlock_pmutex.:
	push rbp
	mov rbp, rsp
	sub rsp, 24
;Load Parameter: [mutex. mut @ 8]
	mov [rbp-8], rdi
;[[ int : 1]]
	mov rdx, 1
	and rdx, 0xffffffff
;[[ int : 0]]
	xor rsi, rsi
	and rsi, 0xffffffff
;[[ id : mut]]
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	xor rax, rax
	call _void_mutex_cmpxchg_pmutex.intint
	push rax
;[[ fn(x) : [ function void mutex_cmpxchg( [[mutex. mut @ 8], [int expect @ 16], [int desire @ 24]] ) ] ]]
	pop rax
	mov dword[rbp-16], eax
;[[ id : c], [ != : !=], [ int : 0]]
	mov ebx, dword[rbp-16]
	test ebx, ebx
	setnz bl
	mov al, bl
	and al, 1
	jz _LIFPOST_0xec
	jmp _LWHILECMP_0xef
_LWHILESTART_0xee:
;[[ int : 2]]
	mov rdx, 2
	and rdx, 0xffffffff
;[[ int : 1]]
	mov rsi, 1
	and rsi, 0xffffffff
;[[ id : mut]]
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	xor rax, rax
	call _void_mutex_cmpxchg_pmutex.intint
	push rax
;[[ id : c], [ == : ==], [ int : 2], [ || : ||], [ fn(x) : [ function void mutex_cmpxchg( [[mutex. mut @ 8], [int expect @ 16], [int desire @ 24]] ) ] ], [ != : !=], [ int : 0]]
	mov r10d, dword[rbp-16]
	mov rbx, 2
	mov r11, r10
	cmp r11, rbx
	sete r11b
	pop rbx
	test rbx, rbx
	setnz bl
	or r11b, bl
	mov al, r11b
	and al, 1
	jz _LIFPOST_0xf1
;[[ int : 2]]
	mov rdx, 2
	and rdx, 0xffffffff
;[[ int : 0]]
	xor rsi, rsi
;[[ id : mut]]
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	xor rax, rax
	push rdi
	push rsi
	push rdx
;[[ int : 0]]
	xor r9, r9
	and r9, 0xffffffff
;[[ int : 0]]
	xor r8, r8
;[[ int : 0]]
	xor rcx, rcx
;[[ id : val]]
	mov ebx, edx
	mov edx, edx
	and rdx, 0xffffffff
;[[ id : op]]
	mov rbx, rsi
	mov rsi, rsi
;[[ id : uaddr]]
	mov rbx, rdi
	mov rdi, rdi
	xor rax, rax
	mov rax , 202 
	mov r10 , rcx 
	syscall 
_LINLINERETURN_0xf6:
	mov rbx, rax
	pop rdx
	pop rsi
	pop rdi
	mov rax, rbx
	push rax
;[[ fn(x) : [ function long futex( [[int. uaddr @ rdi], [long op @ rsi], [int val @ rdx], [timeval_t. utime @ rcx], [int. uaddr2 @ r8], [int val3 @ r9]] ) ] ]]
	pop rax
	jmp _LINLINERETURN_0xf4
_LINLINERETURN_0xf4:
	push rax
;[[ fn(x) : [ function long nfutex( [[int. uaddr @ rdi], [long op @ rsi], [int val @ rdx]] ) ] ]]
	pop rax
	jmp _LIFELSE_0xf2
_LIFPOST_0xf1:
_LIFELSE_0xf2:
;[[ id : c]]
;[[ id : c]]
;[[ int : 2]]
	mov rdx, 2
	and rdx, 0xffffffff
;[[ int : 0]]
	xor rsi, rsi
	and rsi, 0xffffffff
;[[ id : mut]]
	mov r10, qword[rbp-8]
	mov rdi, r10
	xor rax, rax
	call _void_mutex_cmpxchg_pmutex.intint
	push rax
;[[ fn(x) : [ function void mutex_cmpxchg( [[mutex. mut @ 8], [int expect @ 16], [int desire @ 24]] ) ] ]]
	pop rbx
	mov dword[rbp-16], ebx
;[[ id : c], [ == : ==], [ int : 0]]
	mov ebx, dword[rbp-16]
	test ebx, ebx
	setz bl
	mov al, bl
	and al, 1
	jz _LIFPOST_0xf8
;[[ id : STRING_CONSTANT_163]]
	mov rbx, STRING_CONSTANT_163
	mov rdi, STRING_CONSTANT_163
	xor rax, rax
	push rdi
;[[ id : fmt]]
	mov rbx, rdi
	mov rsi, rdi
;[[ int : 1]]
	mov rdi, 1
	xor rax, rax
	call _int_fputs_pfd_tchar.
	mov rbx, rax
	pop rdi
	mov rax, rbx
	push rax
;[[ fn(x) : [ function int fputs( [[fd_t fd @ 8], [char. text @ 16]] ) ] ]]
	pop rax
_LINLINERETURN_0xfb:
	push rax
;[[ fn(x) : [ function void printf( [[char. fmt @ rdi]] ) ] ]]
	pop rax
	jmp _LWHILEEND_0xf0
	jmp _LIFELSE_0xf9
_LIFPOST_0xf8:
_LIFELSE_0xf9:
_LWHILECMP_0xef:
;[[ int : 1]]
	mov rax, 1
	and al, 1
	jnz _LWHILESTART_0xee
_LWHILEEND_0xf0:
	jmp _LIFELSE_0xed
_LIFPOST_0xec:
_LIFELSE_0xed:
___void_mlock_pmutex.__return:
	leave
	ret
	;[ function void munlock( [[mutex. mut @ 8]] ) ]
_void_munlock_pmutex.:
	push rbp
	mov rbp, rsp
	sub rsp, 16
;Load Parameter: [mutex. mut @ 8]
	mov [rbp-8], rdi
;[[ int : 1]]
	mov rsi, 1
	and rsi, 0xffffffff
;[[ id : mut]]
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	xor rax, rax
	xor rax, rax
	xchg eax, [rdi]
	lock sub dword[rdi], esi
_LINLINERETURN_0xfd:
	push rax
;[[ fn(x) : [ function int _atomic_sub( [[int. atom @ rdi], [int subtractor @ rsi]] ) ] ], [ != : !=], [ int : 1]]
	pop r10
	mov rbx, 1
	mov r11, r10
	cmp r11, rbx
	setne r11b
	mov al, r11b
	and al, 1
	jz _LIFPOST_0xff
;[[ int : 0]]
	xor rsi, rsi
	and rsi, 0xffffffff
;[[ id : mut]]
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	xor rax, rax
	lock xchg dword[rdi], esi
_LINLINERETURN_0x102:
	push rax
;[[ fn(x) : [ function void _atomic_store( [[int. atom @ rdi], [int newval @ rsi]] ) ] ]]
	pop rax
;[[ int : 2]]
	mov rdx, 2
	and rdx, 0xffffffff
;[[ int : 0]]
	xor rsi, rsi
;[[ id : mut]]
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	xor rax, rax
	push rdi
	push rsi
	push rdx
;[[ int : 0]]
	xor r9, r9
	and r9, 0xffffffff
;[[ int : 0]]
	xor r8, r8
;[[ int : 0]]
	xor rcx, rcx
;[[ id : val]]
	mov ebx, edx
	mov edx, edx
	and rdx, 0xffffffff
;[[ id : op]]
	mov rbx, rsi
	mov rsi, rsi
;[[ id : uaddr]]
	mov rbx, rdi
	mov rdi, rdi
	xor rax, rax
	mov rax , 202 
	mov r10 , rcx 
	syscall 
_LINLINERETURN_0x107:
	mov rbx, rax
	pop rdx
	pop rsi
	pop rdi
	mov rax, rbx
	push rax
;[[ fn(x) : [ function long futex( [[int. uaddr @ rdi], [long op @ rsi], [int val @ rdx], [timeval_t. utime @ rcx], [int. uaddr2 @ r8], [int val3 @ r9]] ) ] ]]
	pop rax
	jmp _LINLINERETURN_0x105
_LINLINERETURN_0x105:
	push rax
;[[ fn(x) : [ function long nfutex( [[int. uaddr @ rdi], [long op @ rsi], [int val @ rdx]] ) ] ]]
	pop rax
	jmp _LIFELSE_0x100
_LIFPOST_0xff:
_LIFELSE_0x100:
___void_munlock_pmutex.__return:
	leave
	ret
	;[ function void __thrdext( [[long ext @ 8]] ) ]
__thrdext:
	push rbp
	mov rbp, rsp
	sub rsp, 16
;Load Parameter: [long ext @ 8]
	mov [rbp-8], rdi
	mov rdi, rsp
	call _void_free_pvoid.
;[[ id : ext]]
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	xor rax, rax
	mov rax , 60 
	mov r10 , rcx 
	syscall 
_LINLINERETURN_0x10b:
	push rax
;[[ fn(x) : [ function void exit( [[long c @ rdi]] ) ] ]]
	pop rax
____thrdext__return:
	leave
	ret
	;[ function long thrdcrt( [[void. fn @ 8], [thread_t. dest @ 16], [void. arg @ 24]] ) ]
_long_thrdcrt_pvoid.thread_t.void.:
	push rbp
	mov rbp, rsp
	sub rsp, 32
;Load Parameter: [void. fn @ 8]
	mov [rbp-8], rdi
;Load Parameter: [thread_t. dest @ 16]
	mov [rbp-16], rsi
;Load Parameter: [void. arg @ 24]
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
	jnz _L_0x10d__end
	mov rdi, r15
	mov rsi, r14
	mov rdx, r13
	call __enterthread
	mov rdi, rax
	call __thrdext
_L_0x10d__end:
___long_thrdcrt_pvoid.thread_t.void.__return:
	leave
	ret
	;[ function void. __crtstack( [] ) ]
__crtstack:
	push rbp
	mov rbp, rsp
	sub rsp, 8
;[[ int : 0]]
	xor r9, r9
	and r9, 0xffffffff
;[[ int : 0]]
	xor r8, r8
;[[ int : 2], [ | : |], [ int : 32], [ | : |], [ int : 16777216]]
	mov rcx, 16777250
;[[ int : 1], [ | : |], [ int : 2]]
	mov rdx, 3
;[[ int : 65536]]
	mov rsi, 65536
;[[ int : 0]]
	xor rdi, rdi
	xor rax, rax
	call _void._mmap_pvoid.size_tlonglonglongoff_t
	push rax
;[[ fn(x) : [ function void. mmap( [[void. addr @ 8], [size_t length @ 16], [long prot @ 24], [long flags @ 32], [long fd @ 40], [off_t offset @ 48]] ) ] ]]
	pop rax
	jmp ____crtstack__return
____crtstack__return:
	leave
	ret
	;[ function long __enterthread( [[__threadcallable fn @ 8], [thread_t. t @ 16], [void. arg @ 24]] ) ]
__enterthread:
	push rbp
	mov rbp, rsp
	sub rsp, 40
;Load Parameter: [__threadcallable fn @ 8]
	mov [rbp-8], rdi
;Load Parameter: [thread_t. t @ 16]
	mov [rbp-16], rsi
;Load Parameter: [void. arg @ 24]
	mov [rbp-24], rdx
;[[ id : arg]]
	mov rbx, qword[rbp-24]
	mov rdi, rbx
	xor rax, rax
	call qword[rbp-8]
	push rax
;[[ fn(x) : [ function __threadcallable fn( [[void. parameter @ 0]] ) ] ]]
	pop rax
	mov qword[rbp-32], rax
;[[ & : &], [ id : t], [ -> : ->], [ id : mut]]
	mov rbx, qword[rbp-16]
	lea rbx, [rbx+0]
	mov rdi, rbx
	xor rax, rax
	call _void_munlock_pmutex.
	push rax
;[[ fn(x) : [ function void munlock( [[mutex. mut @ 8]] ) ] ]]
	pop rax
;[[ id : t], [ -> : ->], [ id : mut]]
	mov rbx, qword[rbp-16]
	lea rbx, [rbx+0]
	mov ebx, dword[rbx]
	and rbx, 0xffffffff
	mov rsi, rbx
;[[ id : STRING_CONSTANT_164]]
	mov rbx, STRING_CONSTANT_164
	mov rdi, STRING_CONSTANT_164
	xor rax, rax
	call printf
	push rax
;[[ fn(x) : [ function void printf( [[char. fmt @ 0], [void arg1 @ 0]] ) ] ]]
	pop rax
;[[ id : retval]]
	mov rbx, qword[rbp-32]
	mov rax, rbx
	jmp ____enterthread__return
____enterthread__return:
	leave
	ret
	;[ function void thread_create( [[thread_t. dest @ 8], [__threadcallable fn @ 16], [void. arg @ 24]] ) ]
_void_thread_create_pthread_t.__threadcallablevoid.:
	push rbp
	mov rbp, rsp
	sub rsp, 32
;Load Parameter: [thread_t. dest @ 8]
	mov [rbp-8], rdi
;Load Parameter: [__threadcallable fn @ 16]
	mov [rbp-16], rsi
;Load Parameter: [void. arg @ 24]
	mov [rbp-24], rdx
;[[ & : &], [ id : dest], [ -> : ->], [ id : mut]]
	mov rbx, qword[rbp-8]
	lea rbx, [rbx+0]
	mov rdi, rbx
	xor rax, rax
	call _void_mlock_pmutex.
	push rax
;[[ fn(x) : [ function void mlock( [[mutex. mut @ 8]] ) ] ]]
	pop rax
;[[ id : dest], [ -> : ->], [ id : tid]]
	mov rbx, qword[rbp-8]
	lea rbx, [rbx+12]
;[[ id : dest], [ -> : ->], [ id : tid]]
	mov rbx, qword[rbp-8]
	lea rbx, [rbx+12]
;[[ id : arg]]
	mov r11, qword[rbp-24]
	mov rdx, r11
;[[ id : dest]]
	mov r11, qword[rbp-8]
	mov rsi, r11
;[[ id : fn]]
	mov rdi, qword[rbp-16]
	xor rax, rax
	call _long_thrdcrt_pvoid.thread_t.void.
	push rax
;[[ fn(x) : [ function long thrdcrt( [[void. fn @ 8], [thread_t. dest @ 16], [void. arg @ 24]] ) ] ]]
	pop r10
	mov qword[rbx], r10
;[[ id : dest], [ -> : ->], [ id : callback]]
	mov rbx, qword[rbp-8]
	lea rbx, [rbx+4]
;[[ id : dest], [ -> : ->], [ id : callback]]
	mov rbx, qword[rbp-8]
	lea rbx, [rbx+4]
;[[ id : fn]]
	mov r11, qword[rbp-16]
	mov r10, r11
	mov qword[rbx], r11
___void_thread_create_pthread_t.__threadcallablevoid.__return:
	leave
	ret
	;[ function void thread_join( [[thread_t. thread @ 8]] ) ]
_void_thread_join_pthread_t.:
	push rbp
	mov rbp, rsp
	sub rsp, 16
;Load Parameter: [thread_t. thread @ 8]
	mov [rbp-8], rdi
;[[ & : &], [ id : thread], [ -> : ->], [ id : mut]]
	mov rbx, qword[rbp-8]
	lea rbx, [rbx+0]
	mov rdi, rbx
	xor rax, rax
	call _void_mlock_pmutex.
	push rax
;[[ fn(x) : [ function void mlock( [[mutex. mut @ 8]] ) ] ]]
	pop rax
___void_thread_join_pthread_t.__return:
	leave
	ret
	;[ function int main( [[long argc @ 8]] ) ]
main:
	push rbp
	mov rbp, rsp
	sub rsp, 40
;Load Parameter: [long argc @ 8]
	mov [rbp-8], rdi
;[[ id : void]]
	mov rdi, 8
	xor rax, rax
	call _void._malloc_psize_t
	push rax
;[[ fn(x) : [ function void. malloc( [[size_t size @ 8]] ) ] ]]
	pop rax
	mov qword[rbp-16], rax
;[[ id : int]]
	mov rdi, 4
	xor rax, rax
	call _void._malloc_psize_t
	push rax
;[[ fn(x) : [ function void. malloc( [[size_t size @ 8]] ) ] ]]
	pop rax
	mov qword[rbp-24], rax
;[[ id : ptra]]
	mov rbx, qword[rbp-16]
	mov qword[rbp-32], rbx
;[[ @ : @], [ id : a]]
	mov rbx, qword[rbp-32]
;[[ @ : @], [ id : a]]
	mov rbx, qword[rbp-32]
;[[ id : ptrb]]
	mov r10, qword[rbp-24]
	mov qword[rbx], r10
;[[ @ : @], [ ( : (], [ @ : @], [ id : a], [ ) : )]]
	mov rbx, qword[rbp-32]
	mov r10, qword[rbx]
	and rbx, 0xffffffff
	mov ebx, dword[r10]
	mov rsi, rbx
;[[ id : STRING_CONSTANT_165]]
	mov rbx, STRING_CONSTANT_165
	mov rdi, STRING_CONSTANT_165
	xor rax, rax
	call printf
	push rax
;[[ fn(x) : [ function void printf( [[char. fmt @ 0], [void arg1 @ 0]] ) ] ]]
	pop rax
;[[ int : 0]]
	xor rax, rax
	jmp __main__return
__main__return:
	leave
	ret
	