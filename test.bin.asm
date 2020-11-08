
global _char._get_errstr_pint:
global _void._malloc_psize_t:
global _void_free_pvoid.:
global _void._realloc_pvoid.size_t:
global _void._mmap_pvoid.size_tlonglonglongoff_t:
global _void._munmap_pvoid.size_t:
global _void._qmmap_psize_t:
global _int___sprintf_pchar.char.void.:
global _int_sprintf_pchar.char.voidvoidvoidvoid:
global _void___printf_pchar.void.fd_t:
global _void_printf_pchar.voidvoidvoidvoidvoid:
	extern printf
	extern printf
	extern printf
	extern printf
global _void_printf_pchar.:
global _void_eprintf_pchar.voidvoidvoidvoidvoid:
	extern eprintf
	extern eprintf
	extern eprintf
	extern eprintf
global _void_eprintf_pchar.:
global _void___assert_pboolchar.intchar.:
global _void_usleep_plong:
global _long_execl_pchar.char..:
global _long_system_pchar.:
global _int___SSCANF_pchar.char.void..:
global _int_sscanf_pchar.char.void.void.void.void.:
	extern sscanf
	extern sscanf
	extern sscanf
	extern sscanf
global _int___scanf_pchar.void..:
global _int_scanf_pchar.void.void.void.void.void.:
	extern scanf
	extern scanf
	extern scanf
	extern scanf
	extern scanf
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
STRING_CONSTANT_137: db `%i.%i.%i.%i`, 0
STRING_CONSTANT_138: db `/bin/bash`, 0
STRING_CONSTANT_139: db `PATH=/bin:/usr/bin:/sbin:/usr/sbin`, 0
STRING_CONSTANT_140: db `sudo`, 0
STRING_CONSTANT_141: db `-c`, 0
STRING_CONSTANT_142: db `LOCKED`, 0
STRING_CONSTANT_143: db `unlocked thread: %i\n`, 0
__linux_errstrlist: DQ STRING_CONSTANT_0, STRING_CONSTANT_1, STRING_CONSTANT_2, STRING_CONSTANT_3, STRING_CONSTANT_4, STRING_CONSTANT_5, STRING_CONSTANT_6, STRING_CONSTANT_7, STRING_CONSTANT_8, STRING_CONSTANT_9, STRING_CONSTANT_10, STRING_CONSTANT_11, STRING_CONSTANT_12, STRING_CONSTANT_13, STRING_CONSTANT_14, STRING_CONSTANT_15, STRING_CONSTANT_16, STRING_CONSTANT_17, STRING_CONSTANT_18, STRING_CONSTANT_19, STRING_CONSTANT_20, STRING_CONSTANT_21, STRING_CONSTANT_22, STRING_CONSTANT_23, STRING_CONSTANT_24, STRING_CONSTANT_25, STRING_CONSTANT_26, STRING_CONSTANT_27, STRING_CONSTANT_28, STRING_CONSTANT_29, STRING_CONSTANT_30, STRING_CONSTANT_31, STRING_CONSTANT_32, STRING_CONSTANT_33, STRING_CONSTANT_34, STRING_CONSTANT_35, STRING_CONSTANT_36, STRING_CONSTANT_37, STRING_CONSTANT_38, STRING_CONSTANT_39, STRING_CONSTANT_40, STRING_CONSTANT_41, STRING_CONSTANT_42, STRING_CONSTANT_43, STRING_CONSTANT_44, STRING_CONSTANT_45, STRING_CONSTANT_46, STRING_CONSTANT_47, STRING_CONSTANT_48, STRING_CONSTANT_49, STRING_CONSTANT_50, STRING_CONSTANT_51, STRING_CONSTANT_52, STRING_CONSTANT_53, STRING_CONSTANT_54, STRING_CONSTANT_55, STRING_CONSTANT_56, STRING_CONSTANT_57, STRING_CONSTANT_58, STRING_CONSTANT_59, STRING_CONSTANT_60, STRING_CONSTANT_61, STRING_CONSTANT_62, STRING_CONSTANT_63, STRING_CONSTANT_64, STRING_CONSTANT_65, STRING_CONSTANT_66, STRING_CONSTANT_67, STRING_CONSTANT_68, STRING_CONSTANT_69, STRING_CONSTANT_70, STRING_CONSTANT_71, STRING_CONSTANT_72, STRING_CONSTANT_73, STRING_CONSTANT_74, STRING_CONSTANT_75, STRING_CONSTANT_76, STRING_CONSTANT_77, STRING_CONSTANT_78, STRING_CONSTANT_79, STRING_CONSTANT_80, STRING_CONSTANT_81, STRING_CONSTANT_82, STRING_CONSTANT_83, STRING_CONSTANT_84, STRING_CONSTANT_85, STRING_CONSTANT_86, STRING_CONSTANT_87, STRING_CONSTANT_88, STRING_CONSTANT_89, STRING_CONSTANT_90, STRING_CONSTANT_91, STRING_CONSTANT_92, STRING_CONSTANT_93, STRING_CONSTANT_94, STRING_CONSTANT_95, STRING_CONSTANT_96, STRING_CONSTANT_97, STRING_CONSTANT_98, STRING_CONSTANT_99, STRING_CONSTANT_100, STRING_CONSTANT_101, STRING_CONSTANT_102, STRING_CONSTANT_103, STRING_CONSTANT_104, STRING_CONSTANT_105, STRING_CONSTANT_106, STRING_CONSTANT_107, STRING_CONSTANT_108, STRING_CONSTANT_109, STRING_CONSTANT_110, STRING_CONSTANT_111, STRING_CONSTANT_112, STRING_CONSTANT_113, STRING_CONSTANT_114, STRING_CONSTANT_115, STRING_CONSTANT_116, STRING_CONSTANT_117, STRING_CONSTANT_118, STRING_CONSTANT_119, STRING_CONSTANT_120, STRING_CONSTANT_121, STRING_CONSTANT_122, STRING_CONSTANT_123, STRING_CONSTANT_124, STRING_CONSTANT_125, STRING_CONSTANT_126, STRING_CONSTANT_127, STRING_CONSTANT_128, STRING_CONSTANT_129, STRING_CONSTANT_130, STRING_CONSTANT_131
errno: DQ 0
nullterm: DB 0
M_MINZERO_MEM: DQ 0x0.0p+0
__numbercharactersbase1016: DQ "0123456789abcdef"
rand_next: DQ 1
__systembashpath: DQ "/bin/bash"
__emptyenv: DQ STRING_CONSTANT_139, 0
__systemcallargvconst: DQ STRING_CONSTANT_140, STRING_CONSTANT_141, 0
clone_threadflags: DQ 17
	section .bss
	align 16
__heap_padding__: resz 1
	section .text
	align 8
	global main
_char._get_errstr_pint:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov [rbp-8], rdi
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
	jz .L0x0
	mov r10d, dword[rbp-8]
	mov rbx, __linux_errstrlist
	and r10, 0xffffffff
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
_void._malloc_psize_t:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov [rbp-8], rdi
	mov r10, qword[rbp-8]
	add r10, 8
	mov rdi, r10
	xor rax, rax
	call _void._qmmap_psize_t
	mov rbx, rax
	mov r10, rax
	mov r11, rbx
	mov r10, rbx
	mov r11, rbx
	mov r10, qword[rbp-8]
	mov qword[r11], r10
	mov r10, rbx
	add r10, 8
	mov rax, r10
	jmp ___void._malloc_psize_t__return
___void._malloc_psize_t__return:
	leave
	ret
_void_free_pvoid.:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov [rbp-8], rdi
	mov rbx, qword[rbp-8]
	sub rbx, 8
	mov r10, qword[rbx]
	mov rsi, r10
	mov rbx, qword[rbp-8]
	sub rbx, 8
	mov rdi, rbx
	xor rax, rax
	call _void._munmap_pvoid.size_t
	jmp ___void_free_pvoid.__return
___void_free_pvoid.__return:
	leave
	ret
_void._realloc_pvoid.size_t:
	push rbp
	mov rbp, rsp
	sub rsp, 24
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	mov r10, qword[rbp-8]
	sub r10, 8
	mov r11, qword[r10]
	mov rbx, r11
	mov r11, qword[rbp-16]
	mov r10, rbx
	cmp r10, r11
	sete r10b
	mov al, r10b
	and al, 1
	jz .L0x2
	mov r10, qword[rbp-8]
	mov rax, r10
	jmp ___void._realloc_pvoid.size_t__return
	jmp .L0x3
.L0x2:
.L0x3:
	push rbx
	mov r11, qword[rbp-16]
	mov rdi, r11
	xor rax, rax
	call _void._malloc_psize_t
	mov r11, rax
	pop rbx
	mov rax, r11
	mov r10, r11
	push rbx
	push r10
	mov r11, qword[rbp-16]
	mov rdx, r11
	mov r11, qword[rbp-8]
	mov rsi, r11
	mov r11, r10
	mov rdi, r10
	xor rax, rax
	call _void_avx_memcpy_pvoid.void.size_t
	mov r11, rax
	pop r10
	pop rbx
	mov rax, r11
	push rbx
	push r10
	mov r11, qword[rbp-8]
	mov rdi, r11
	xor rax, rax
	call _void_free_pvoid.
	mov r11, rax
	pop r10
	pop rbx
	mov rax, r11
	mov r11, r10
	mov rax, r10
	jmp ___void._realloc_pvoid.size_t__return
___void._realloc_pvoid.size_t__return:
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
	mov r11, r10
	sub rbx, r11
	sar rbx, 2
	mov qword[rbp-40], rbx
	mov dword[rbp-48], 0
	jmp .L0x6
.L0x5:
	mov ebx, dword[rbp-48]
	shl rbx, 3
	add rbx, [rbp-16]
	vmovdqu ymm0, [rbx]
	mov ebx, dword[rbp-48]
	shl rbx, 3
	add rbx, [rbp-8]
	vmovdqu [rbx], ymm0
.L0x7:
	mov r10d, dword[rbp-48]
	add r10d, 4
	mov ebx, r10d
	mov dword[rbp-48], r10d
.L0x6:
	mov r10d, dword[rbp-48]
	mov rbx, qword[rbp-40]
	mov r11, r10
	cmp r11, rbx
	setl r11b
	mov al, r11b
	and al, 1
	jnz .L0x5
.L0x8:
	mov ebx, dword[rbp-32]
	test ebx, ebx
	setnz bl
	mov al, bl
	and al, 1
	jz .L0x9
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
	jmp .L0xa
.L0x9:
.L0xa:
___void_avx_memcpy_pvoid.void.size_t__return:
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
	and r9, 0xffffffff
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
	jmp .L0x11
.L0x10:
	mov r10, qword[rbp-8]
	and r11, 0xff
	mov r11b, byte[r10]
	mov r10b, byte[rbp-16]
	cmp r11b, r10b
	sete r11b
	mov al, r11b
	and al, 1
	jz .L0x13
	mov r10, qword[rbp-8]
	mov rax, r10
	jmp ___char._memchr_pchar.charsize_t__return
	jmp .L0x14
.L0x13:
.L0x14:
	inc qword[rbp-8]
.L0x11:
	mov r11, qword[rbp-8]
	mov r10, rbx
	cmp r11, r10
	setl r11b
	mov al, r11b
	and al, 1
	jnz .L0x10
.L0x12:
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
	jmp .L0x16
.L0x15:
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
	jz .L0x18
	dec ebx
	jmp .L0x19
.L0x18:
	inc ebx
.L0x19:
	inc qword[rbp-8]
	inc qword[rbp-16]
.L0x16:
	mov r12, qword[rbp-8]
	mov r11, r10
	cmp r12, r11
	setl r12b
	mov al, r12b
	and al, 1
	jnz .L0x15
.L0x17:
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
	jmp .L0x1b
.L0x1a:
	mov rbx, qword[rbp-8]
	and r10, 0xff
	mov r10b, byte[rbx]
	mov bl, byte[rbp-16]
	cmp r10b, bl
	sete r10b
	mov al, r10b
	and al, 1
	jz .L0x1d
	mov rbx, qword[rbp-8]
	mov rax, rbx
	jmp ___char._strchr_pchar.char__return
	jmp .L0x1e
.L0x1d:
.L0x1e:
	inc qword[rbp-8]
.L0x1b:
	mov rbx, qword[rbp-8]
	and r10, 0xff
	mov r10b, byte[rbx]
	test r10b, r10b
	setnz r10b
	mov al, r10b
	and al, 1
	jnz .L0x1a
.L0x1c:
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
	setge bl
	mov al, bl
	and al, 1
	jz .L0x1f
	mov rdi, qword[rbp-8]
	and rdi, 0xffffffff
	xor rax, rax
	call _char._get_errstr_pint
	jmp ___char._strerror_plong__return
	jmp .L0x20
.L0x1f:
	mov r10, qword[rbp-8]
	xor rbx, rbx
	sub rbx, r10
	mov edi, ebx
	and rdi, 0xffffffff
	xor rax, rax
	call _char._get_errstr_pint
	jmp ___char._strerror_plong__return
.L0x20:
	xor rax, rax
	jmp ___char._strerror_plong__return
___char._strerror_plong__return:
	leave
	ret
_long_toStr_plongchar.boolshort:
	push rbp
	mov rbp, rsp
	sub rsp, 144
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	mov [rbp-24], rdx
	mov [rbp-32], rcx
	mov rbx, qword[rbp-8]
	test rbx, rbx
	setz bl
	mov al, bl
	and al, 1
	jz .L0x21
	mov rbx, qword[rbp-16]
	mov r10, rbx
	mov rbx, qword[rbp-16]
	mov r10, rbx
	mov bl, 48
	mov byte[r10], 48
	mov rax, 1
	jmp ___long_toStr_plongchar.boolshort__return
	jmp .L0x22
.L0x21:
.L0x22:
	mov byte[rbp-40], 0
	xor r10, r10
	mov rbx, qword[rbp-8]
	cmp rbx, r10
	setl bl
	mov r10b, byte[rbp-24]
	and bl, r10b
	mov al, bl
	and al, 1
	jz .L0x23
	mov rbx, qword[rbp-16]
	mov r10, rbx
	mov rbx, qword[rbp-16]
	mov r10, rbx
	mov bl, 45
	mov byte[r10], 45
	mov rbx, 1
	mov r10, qword[rbp-16]
	add r10, rbx
	mov qword[rbp-16], r10
	mov r11, qword[rbp-8]
	xor r10, r10
	sub r10, r11
	mov rbx, r10
	mov qword[rbp-8], r10
	mov rbx, 1
	mov byte[rbp-40], bl
	jmp .L0x24
.L0x23:
.L0x24:
	mov rdx, 64
	xor rsi, rsi
	and rsi, 0xff
	lea rbx, [rbp-112]
	mov rdi, rbx
	xor rax, rax
	call _void_memset_pvoid.ucharsize_t
	mov dword[rbp-120], 0
	jmp .L0x26
.L0x25:
	lea r10, [rbp-128]
	mov rdx, r10
	mov si, word[rbp-32]
	mov r10, qword[rbp-8]
	mov rdi, r10
	xor rax, rax
	mov rbx, rdx
	xor rdx, rdx
	mov rax, rdi
	div rsi
	mov [rbx], rdx
.L0x29:
	mov rbx, rax
	mov qword[rbp-8], rax
	mov r10d, dword[rbp-120]
	lea rbx, [rbp-112] 
	and r10, 0xffffffff
	lea rbx, [rbx+r10*1]
	mov r10d, dword[rbp-120]
	lea rbx, [rbp-112] 
	and r10, 0xffffffff
	lea rbx, [rbx+r10*1]
	mov r12b, byte[rbp-128]
	mov r11, __numbercharactersbase1016
	and r12, 0xff
	lea r11, [r11+r12*1]
	mov r11b, byte[r11]
	and r11, 0xff
	mov r10b, r11b
	mov byte[rbx], r11b
	mov rbx, 1
	mov r10d, dword[rbp-120]
	add r10d, ebx
	mov dword[rbp-120], r10d
.L0x26:
	mov rbx, qword[rbp-8]
	test rbx, rbx
	setnz bl
	mov al, bl
	and al, 1
	jnz .L0x25
.L0x27:
	mov ebx, dword[rbp-120]
	mov dword[rbp-136], ebx
	jmp .L0x2c
.L0x2b:
	mov r10d, dword[rbp-136]
	mov rbx, qword[rbp-16]
	and r10, 0xffffffff
	lea rbx, [rbx+r10*1]
	mov r10d, dword[rbp-136]
	mov rbx, qword[rbp-16]
	and r10, 0xffffffff
	lea rbx, [rbx+r10*1]
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
.L0x2d:
	dec dword[rbp-136]
.L0x2c:
	mov r10d, dword[rbp-136]
	xor rbx, rbx
	mov r11, r10
	cmp r11, rbx
	setg r11b
	mov al, r11b
	and al, 1
	jnz .L0x2b
.L0x2e:
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
	and rcx, 0xffff
	mov rdx, 1
	and rdx, 0xff
	mov rbx, qword[rbp-16]
	mov rsi, rbx
	mov rbx, qword[rbp-32]
	mov rdi, rbx
	xor rax, rax
	call _long_toStr_plongchar.boolshort
	mov qword[rbp-40], rax
	mov rbx, qword[rbp-40]
	mov r10, qword[rbp-16]
	add r10, rbx
	mov qword[rbp-16], r10
	movsd xmm8, qword[rbp-8]
	movsd xmm0, xmm8
	mov rax, 1
	movq rax, xmm0
	shr rax, 1
	shl rax, 1
	movq xmm0, rax 
.L0x30:
	movq rax, xmm0
	movsd xmm7, xmm0
	movq qword[rbp-8], xmm0
	mov rbx, qword[rbp-32]
	mov rdi, rbx
	xor rax, rax
	mov rax, rdi
	sar rdi, 63
	xor rax, rdi
	sub rax, rdi
.L0x33:
	cvtsi2sd xmm7, rax
	movsd xmm8, qword[rbp-8]
	subsd xmm8, xmm7
	movsd qword[rbp-8], xmm8
	cvtsi2sd xmm7, qword[rbp-24]
	movsd xmm8, qword[rbp-8]
	mulsd xmm8, xmm7
	movsd qword[rbp-8], xmm8
	mov rbx, qword[rbp-16]
	mov r10, rbx
	mov rbx, qword[rbp-16]
	mov r10, rbx
	mov bl, 46
	mov byte[r10], 46
	inc qword[rbp-16]
	mov rcx, 10
	and rcx, 0xffff
	xor rdx, rdx
	and rdx, 0xff
	mov rbx, qword[rbp-16]
	mov rsi, rbx
	movsd xmm7, qword[rbp-8]
	movsd xmm0, xmm7
	mov rax, 1
	cvtsd2si rax, xmm0
.L0x39:
	mov rdi, rax
	xor rax, rax
	call _long_toStr_plongchar.boolshort
	mov rbx, rax
	mov r10, qword[rbp-40]
	add r10, rbx
	mov qword[rbp-40], r10
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
	mov al, bl
	and al, 1
	jz .L0x3b
	xor rax, rax
	jmp ___int___sprintf_pchar.char.void.__return
	jmp .L0x3c
.L0x3b:
.L0x3c:
	jmp .L0x3e
.L0x3d:
	mov rbx, qword[rbp-16]
	and r10, 0xff
	mov r10b, byte[rbx]
	mov bl, 37
	cmp r10b, bl
	setne r10b
	mov al, r10b
	and al, 1
	jz .L0x40
	mov rbx, qword[rbp-8]
	mov r10, rbx
	mov rbx, qword[rbp-8]
	mov r10, rbx
	mov r11, qword[rbp-16]
	and r12, 0xff
	mov r12b, byte[r11]
	mov bl, r12b
	mov byte[r10], r12b
	jmp .L0x41
.L0x40:
	mov rbx, 1
	mov r10, qword[rbp-16]
	add r10, rbx
	mov qword[rbp-16], r10
	mov rbx, qword[rbp-16]
	and r10, 0xff
	mov r10b, byte[rbx]
	mov byte[rbp-48], r10b
	mov r10b, byte[rbp-48]
	mov bl, r10b
	cmp bl, 105
	je .L0x43
	cmp bl, 99
	je .L0x44
	cmp bl, 120
	je .L0x45
	cmp bl, 111
	je .L0x46
	cmp bl, 117
	je .L0x47
	cmp bl, 115
	je .L0x48
	cmp bl, 98
	je .L0x49
	cmp bl, 100
	je .L0x4c
	cmp bl, 102
	je .L0x4d
	jmp .L0x42
.L0x43:
	mov r11d, dword[rbp-32]
	mov r10, qword[rbp-24]
	and r11, 0xffffffff
	lea r10, [r10+r11*8]
	mov r10, qword[r10]
	mov qword[rbp-56], r10
	mov rcx, 10
	and rcx, 0xffff
	mov rdx, 1
	and rdx, 0xff
	mov r10, qword[rbp-8]
	mov rsi, r10
	mov r10, qword[rbp-56]
	mov rdi, r10
	xor rax, rax
	call _long_toStr_plongchar.boolshort
	mov qword[rbp-64], rax
	mov r11, qword[rbp-64]
	dec r11
	mov r10, r11
	mov r11, qword[rbp-8]
	add r11, r10
	mov qword[rbp-8], r11
	jmp .L0x42
.L0x44:
	mov r11d, dword[rbp-32]
	mov r10, qword[rbp-24]
	and r11, 0xffffffff
	lea r10, [r10+r11*8]
	mov r10, qword[r10]
	mov r11, r10
	and r12b, 0xff
	mov r12b, r11b
	mov byte[rbp-72], r11b
	mov r10, qword[rbp-8]
	mov r11, r10
	mov r10, qword[rbp-8]
	mov r11, r10
	mov r12b, byte[rbp-72]
	mov r10b, r12b
	mov byte[r11], r12b
	jmp .L0x42
.L0x45:
	mov r11d, dword[rbp-32]
	mov r10, qword[rbp-24]
	and r11, 0xffffffff
	lea r10, [r10+r11*8]
	mov r10, qword[r10]
	mov qword[rbp-80], r10
	mov rcx, 16
	and rcx, 0xffff
	xor rdx, rdx
	and rdx, 0xff
	mov r10, qword[rbp-8]
	mov rsi, r10
	mov r10, qword[rbp-80]
	mov rdi, r10
	xor rax, rax
	call _long_toStr_plongchar.boolshort
	mov qword[rbp-88], rax
	mov r11, qword[rbp-88]
	dec r11
	mov r10, r11
	mov r11, qword[rbp-8]
	add r11, r10
	mov qword[rbp-8], r11
	jmp .L0x42
.L0x46:
	mov r11d, dword[rbp-32]
	mov r10, qword[rbp-24]
	and r11, 0xffffffff
	lea r10, [r10+r11*8]
	mov r10, qword[r10]
	mov qword[rbp-96], r10
	mov rcx, 8
	and rcx, 0xffff
	xor rdx, rdx
	and rdx, 0xff
	mov r10, qword[rbp-8]
	mov rsi, r10
	mov r10, qword[rbp-96]
	mov rdi, r10
	xor rax, rax
	call _long_toStr_plongchar.boolshort
	mov qword[rbp-104], rax
	mov r11, qword[rbp-104]
	dec r11
	mov r10, r11
	mov r11, qword[rbp-8]
	add r11, r10
	mov qword[rbp-8], r11
	jmp .L0x42
.L0x47:
	mov r11d, dword[rbp-32]
	mov r10, qword[rbp-24]
	and r11, 0xffffffff
	lea r10, [r10+r11*8]
	mov r10, qword[r10]
	mov qword[rbp-112], r10
	mov rcx, 10
	and rcx, 0xffff
	xor rdx, rdx
	and rdx, 0xff
	mov r10, qword[rbp-8]
	mov rsi, r10
	mov r10, qword[rbp-112]
	mov rdi, r10
	xor rax, rax
	call _long_toStr_plongchar.boolshort
	mov dword[rbp-120], eax
	mov r11d, dword[rbp-120]
	dec r11d
	mov r10, r11
	mov r11, qword[rbp-8]
	add r11, r10
	mov qword[rbp-8], r11
	jmp .L0x42
.L0x48:
	mov r11d, dword[rbp-32]
	mov r10, qword[rbp-24]
	and r11, 0xffffffff
	lea r10, [r10+r11*8]
	mov r10, qword[r10]
	mov rsi, r10
	mov r10, qword[rbp-8]
	mov rdi, r10
	xor rax, rax
	call _int_strcpy_pchar.char.
	mov dword[rbp-128], eax
	mov r11d, dword[rbp-128]
	dec r11d
	mov r10, r11
	mov r11, qword[rbp-8]
	add r11, r10
	mov qword[rbp-8], r11
	jmp .L0x42
.L0x49:
	mov r11d, dword[rbp-32]
	mov r10, qword[rbp-24]
	and r11, 0xffffffff
	lea r10, [r10+r11*8]
	mov r10, qword[r10]
	mov byte[rbp-136], r10b
	mov r10, STRING_CONSTANT_134
	mov qword[rbp-144], STRING_CONSTANT_134
	mov r10b, byte[rbp-136]
	mov al, r10b
	and al, 1
	jz .L0x4a
	mov r11, STRING_CONSTANT_135
	mov r10, STRING_CONSTANT_135
	mov qword[rbp-144], r11
	jmp .L0x4b
.L0x4a:
.L0x4b:
	mov r10, qword[rbp-144]
	mov rsi, r10
	mov r10, qword[rbp-8]
	mov rdi, r10
	xor rax, rax
	call _int_strcpy_pchar.char.
	mov dword[rbp-152], eax
	mov r10d, dword[rbp-152]
	mov r11, qword[rbp-8]
	add r11, r10
	mov qword[rbp-8], r11
	jmp .L0x42
.L0x4c:
	mov r11d, dword[rbp-32]
	mov r10, qword[rbp-24]
	and r11, 0xffffffff
	lea r10, [r10+r11*8]
	mov r10, qword[r10]
	movq xmm7, r10
	movsd qword[rbp-160], xmm7
	mov rsi, 1000000000
	mov r10, qword[rbp-8]
	mov rdi, r10
	movsd xmm7, qword[rbp-160]
	movsd xmm0, xmm7
	mov rax, 1
	call _long_toStr_pdoublechar.long
	mov dword[rbp-168], eax
	mov r11d, dword[rbp-168]
	dec r11d
	mov r10, r11
	mov r11, qword[rbp-8]
	add r11, r10
	mov qword[rbp-8], r11
	jmp .L0x42
.L0x4d:
	mov r11d, dword[rbp-32]
	mov r10, qword[rbp-24]
	and r11, 0xffffffff
	lea r10, [r10+r11*8]
	mov r10, qword[r10]
	movq xmm7, r10
	movsd qword[rbp-176], xmm7
	mov rsi, 10000000
	mov r10, qword[rbp-8]
	mov rdi, r10
	movsd xmm7, qword[rbp-176]
	movsd xmm0, xmm7
	mov rax, 1
	call _long_toStr_pdoublechar.long
	mov dword[rbp-184], eax
	mov r11d, dword[rbp-184]
	dec r11d
	mov r10, r11
	mov r11, qword[rbp-8]
	add r11, r10
	mov qword[rbp-8], r11
	jmp .L0x42
.L0x42:
	mov rbx, 1
	mov r10d, dword[rbp-32]
	add r10d, ebx
	mov dword[rbp-32], r10d
.L0x41:
	mov rbx, 1
	mov r10, qword[rbp-16]
	add r10, rbx
	mov qword[rbp-16], r10
	mov rbx, 1
	mov r10, qword[rbp-8]
	add r10, rbx
	mov qword[rbp-8], r10
.L0x3e:
	mov rbx, qword[rbp-16]
	and r10, 0xff
	mov r10b, byte[rbx]
	test r10b, r10b
	setnz r10b
	mov al, r10b
	and al, 1
	jnz .L0x3d
.L0x3f:
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
	sub rsp, 72
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	mov [rbp-24], rdx
	mov [rbp-32], rcx
	mov [rbp-40], r8
	mov [rbp-48], r9
	mov rdi, 32
	xor rax, rax
	call _void._malloc_psize_t
	mov qword[rbp-56], rax
	mov rbx, qword[rbp-56]
	mov rbx, qword[rbp-56]
	mov r11, qword[rbp-24]
	mov r10, r11
	mov qword[rbx], r11
	mov r10, 1
	mov rbx, qword[rbp-56]
	lea rbx, [rbx+r10*8]
	mov r10, 1
	mov rbx, qword[rbp-56]
	lea rbx, [rbx+r10*8]
	mov r11, qword[rbp-32]
	mov r10, r11
	mov qword[rbx], r11
	mov r10, 2
	mov rbx, qword[rbp-56]
	lea rbx, [rbx+r10*8]
	mov r10, 2
	mov rbx, qword[rbp-56]
	lea rbx, [rbx+r10*8]
	mov r11, qword[rbp-40]
	mov r10, r11
	mov qword[rbx], r11
	mov r10, 3
	mov rbx, qword[rbp-56]
	lea rbx, [rbx+r10*8]
	mov r10, 3
	mov rbx, qword[rbp-56]
	lea rbx, [rbx+r10*8]
	mov r11, qword[rbp-48]
	mov r10, r11
	mov qword[rbx], r11
	mov rbx, qword[rbp-56]
	mov rdx, rbx
	mov rbx, qword[rbp-16]
	mov rsi, rbx
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	xor rax, rax
	call _int___sprintf_pchar.char.void.
	mov dword[rbp-64], eax
	mov rbx, qword[rbp-56]
	mov rdi, rbx
	xor rax, rax
	call _void_free_pvoid.
	mov ebx, dword[rbp-64]
	mov eax, ebx
	jmp ___int_sprintf_pchar.char.voidvoidvoidvoid__return
___int_sprintf_pchar.char.voidvoidvoidvoid__return:
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
	call _void._qmmap_psize_t
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
	mov rax, 1
	syscall
.L0x4f:
	mov rsi, 10000
	mov rdi, qword[rbp-32]
	xor rax, rax
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
	lea rbx, [rbp-104] 
	mov r10, qword[rbp-16]
	mov qword[rbx], r10
	mov r10, 1
	lea rbx, [rbp-104] 
	lea rbx, [rbx+r10*8]
	mov r10, 1
	lea rbx, [rbp-104] 
	lea rbx, [rbx+r10*8]
	mov r10, qword[rbp-24]
	mov qword[rbx], r10
	mov r10, 2
	lea rbx, [rbp-104] 
	lea rbx, [rbx+r10*8]
	mov r10, 2
	lea rbx, [rbp-104] 
	lea rbx, [rbx+r10*8]
	mov r10, qword[rbp-32]
	mov qword[rbx], r10
	mov r10, 3
	lea rbx, [rbp-104] 
	lea rbx, [rbx+r10*8]
	mov r10, 3
	lea rbx, [rbp-104] 
	lea rbx, [rbx+r10*8]
	mov r10, qword[rbp-40]
	mov qword[rbx], r10
	mov r10, 4
	lea rbx, [rbp-104] 
	lea rbx, [rbx+r10*8]
	mov r10, 4
	lea rbx, [rbp-104] 
	lea rbx, [rbx+r10*8]
	mov r10, qword[rbp-48]
	mov qword[rbx], r10
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
_void_printf_pchar.:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov [rbp-8], rdi
	mov rbx, qword[rbp-8]
	mov rsi, rbx
	mov rdi, 1
	xor rax, rax
	call _int_fputs_pfd_tchar.
___void_printf_pchar.__return:
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
	lea rbx, [rbp-104] 
	mov r10, qword[rbp-16]
	mov qword[rbx], r10
	mov r10, 1
	lea rbx, [rbp-104] 
	lea rbx, [rbx+r10*8]
	mov r10, 1
	lea rbx, [rbp-104] 
	lea rbx, [rbx+r10*8]
	mov r10, qword[rbp-24]
	mov qword[rbx], r10
	mov r10, 2
	lea rbx, [rbp-104] 
	lea rbx, [rbx+r10*8]
	mov r10, 2
	lea rbx, [rbp-104] 
	lea rbx, [rbx+r10*8]
	mov r10, qword[rbp-32]
	mov qword[rbx], r10
	mov r10, 3
	lea rbx, [rbp-104] 
	lea rbx, [rbx+r10*8]
	mov r10, 3
	lea rbx, [rbp-104] 
	lea rbx, [rbx+r10*8]
	mov r10, qword[rbp-40]
	mov qword[rbx], r10
	mov r10, 4
	lea rbx, [rbp-104] 
	lea rbx, [rbx+r10*8]
	mov r10, 4
	lea rbx, [rbp-104] 
	lea rbx, [rbx+r10*8]
	mov r10, qword[rbp-48]
	mov qword[rbx], r10
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
_void_eprintf_pchar.:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov [rbp-8], rdi
	mov rbx, qword[rbp-8]
	mov rsi, rbx
	mov rdi, 2
	xor rax, rax
	call _int_fputs_pfd_tchar.
___void_eprintf_pchar.__return:
	leave
	ret
_int_rand_p:
	push rbp
	mov rbp, rsp
	sub rsp, 8
	mov r10d, [rand_next]
	sal r10d, 13
	mov r11d, [rand_next]
	xor r11d, r10d
	mov ebx, r11d
	mov [rand_next], r11d
	mov r10d, [rand_next]
	sar r10d, 17
	mov r11d, [rand_next]
	xor r11d, r10d
	mov ebx, r11d
	mov [rand_next], r11d
	mov r10d, [rand_next]
	sal r10d, 5
	mov r11d, [rand_next]
	xor r11d, r10d
	mov ebx, r11d
	mov [rand_next], r11d
	mov ebx, [rand_next]
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
.L0x52:
	mov rbx, rax
	mov [rand_next], ebx
___void_srand_p__return:
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
	cmp bl, 0
	sete bl
	mov al, bl
	and al, 1
	jz .L0x54
	mov rcx, qword[rbp-32]
	mov edx, dword[rbp-24]
	mov rsi, qword[rbp-16]
	mov rbx, STRING_CONSTANT_136
	mov rdi, STRING_CONSTANT_136
	xor rax, rax
	call eprintf
	mov rdi, 1
	xor rax, rax
	mov rax,60
	syscall
.L0x57:
	jmp .L0x55
.L0x54:
.L0x55:
___void___assert_pboolchar.intchar.__return:
	leave
	ret
_void_usleep_plong:
	push rbp
	mov rbp, rsp
	sub rsp, 40
	mov [rbp-8], rdi
	mov qword[rbp-32], 0
	mov qword[rbp-24], 0
	xor rbx, rbx
	mov qword[rbp-32], 0
	mov r10, qword[rbp-8]
	mov rbx, r10
	mov qword[rbp-24], r10
	xor rsi, rsi
	lea rbx, [rbp-32]
	mov rdi, rbx
	xor rax, rax
	mov rax, 35
	syscall
.L0x5a:
___void_usleep_plong__return:
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
	mov rbx, STRING_CONSTANT_137
	mov rdi, STRING_CONSTANT_137
	xor rax, rax
	call sscanf
	mov dword[rbp-36], eax
	lea rbx, [rbp-28] 
	mov bl, byte[rbx]
	and bl, 0xff
	mov r10, 255
	mov r11, rbx
	and r11, r10
	mov dword[rbp-44], r11d
	mov r10, 1
	lea rbx, [rbp-28] 
	lea rbx, [rbx+r10*1]
	mov bl, byte[rbx]
	and rbx, 0xff
	mov r10, 255
	mov r11, rbx
	and r11, r10
	mov dword[rbp-52], r11d
	mov r10, 2
	lea rbx, [rbp-28] 
	lea rbx, [rbx+r10*1]
	mov bl, byte[rbx]
	and rbx, 0xff
	mov r10, 255
	mov r11, rbx
	and r11, r10
	mov dword[rbp-60], r11d
	mov r10, 3
	lea rbx, [rbp-28] 
	lea rbx, [rbx+r10*1]
	mov bl, byte[rbx]
	and rbx, 0xff
	mov r10, 255
	mov r11, rbx
	and r11, r10
	mov dword[rbp-68], r11d
	mov rbx, qword[rbp-16]
	mov r10, rbx
	mov rbx, qword[rbp-16]
	mov r10, rbx
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
.L0x5d:
	mov rbx, rax
	mov dword[r10], ebx
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
	and rcx, 0xffffffff
	mov rbx, qword[rbp-24]
	mov rdx, rbx
	mov rbx, qword[rbp-16]
	mov rsi, rbx
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	xor rax, rax
	mov rax, 45
	mov r10, rcx
	syscall
.L0x60:
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
	and rcx, 0xffffffff
	mov rbx, qword[rbp-24]
	mov rdx, rbx
	mov rsi, qword[rbp-16]
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	xor rax, rax
	mov rax, 44
	mov r10, rcx
	syscall
.L0x63:
	jmp ___int_send_pfd_tchar.size_tint__return
___int_send_pfd_tchar.size_tint__return:
	leave
	ret
_FILE_fopen_pchar.char.:
	push rbp
	mov rbp, rsp
	sub rsp, 56
	mov [rbp-8], rdi
	mov [rbp-16], rsi
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
	mov qword[rbp-32], 510
	mov qword[rbp-40], 0
	mov r10, qword[rbp-24]
	mov rbx, r10
	cmp rbx, 114
	je .L0x66
	cmp rbx, 119
	je .L0x67
	cmp rbx, 97
	je .L0x68
	cmp rbx, 157
	je .L0x69
	cmp rbx, 162
	je .L0x6a
	cmp rbx, 140
	je .L0x6b
	jmp .L0x65
.L0x66:
	xor r10, r10
	mov qword[rbp-40], 0
	jmp .L0x65
.L0x67:
	mov r10, 1
	mov qword[rbp-40], 1
	jmp .L0x65
.L0x68:
	mov r10, 1
	mov qword[rbp-40], 1
	jmp .L0x65
.L0x69:
	mov r10, 2
	mov qword[rbp-40], 2
	jmp .L0x65
.L0x6a:
	mov r10, 2
	mov qword[rbp-40], 2
	jmp .L0x65
.L0x6b:
	mov r10, 2
	mov qword[rbp-40], 2
	jmp .L0x65
.L0x65:
	mov rbx, qword[rbp-32]
	mov rdx, rbx
	mov rsi, qword[rbp-40]
	and rsi, 0xffffffff
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	xor rax, rax
	mov rax, 2
	syscall
.L0x6d:
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
	mov al, bl
	and al, 1
	jz .L0x6f
	mov rdx, 2
	and rdx, 0xffffffff
	xor rsi, rsi
	and rsi, 0xffffffff
	mov rbx, qword[rbp-48]
	mov rdi, rbx
	xor rax, rax
	mov rax, 8
	syscall
.L0x72:
	jmp .L0x70
.L0x6f:
.L0x70:
	mov rbx, qword[rbp-48]
	mov rax, rbx
	jmp ___FILE_fopen_pchar.char.__return
___FILE_fopen_pchar.char.__return:
	leave
	ret
_int_fputs_pfd_tchar.:
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
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	xor rax, rax
	mov rax, 1
	syscall
.L0x75:
	mov qword[rbp-32], rax
	mov rax, qword[rbp-32]
	jmp ___int_fputs_pfd_tchar.__return
___int_fputs_pfd_tchar.__return:
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
	xor rax, rax
	xor rax, rax
	syscall
.L0x78:
	mov qword[rbp-32], rax
	mov rbx, qword[rbp-32]
	mov rax, rbx
	jmp ___long_fgets_pfd_tchar.size_t__return
___long_fgets_pfd_tchar.size_t__return:
	leave
	ret
_void._floads_pfd_t:
	push rbp
	mov rbp, rsp
	sub rsp, 40
	mov [rbp-8], rdi
	mov rdx, 2
	and rdx, 0xffffffff
	xor rsi, rsi
	and rsi, 0xffffffff
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	xor rax, rax
	mov rax, 8
	syscall
.L0x7b:
	mov dword[rbp-16], eax
	mov rdx, 2
	and rdx, 0xffffffff
	mov r10d, dword[rbp-16]
	xor rbx, rbx
	mov r11, r10
	sub rbx, r11
	mov esi, ebx
	and rsi, 0xffffffff
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	xor rax, rax
	mov rax, 8
	syscall
.L0x7e:
	mov edi, dword[rbp-16]
	xor rax, rax
	call _void._malloc_psize_t
	mov qword[rbp-24], rax
	mov edx, dword[rbp-16]
	mov rbx, qword[rbp-24]
	mov rsi, rbx
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	xor rax, rax
	xor rax, rax
	syscall
.L0x81:
	mov qword[rbp-32], rax
	xor r10, r10
	mov rbx, qword[rbp-32]
	cmp rbx, r10
	setl bl
	mov al, bl
	and al, 1
	jz .L0x83
	mov rax, qword[rbp-32]
	jmp ___void._floads_pfd_t__return
	jmp .L0x84
.L0x83:
.L0x84:
	mov rax, qword[rbp-24]
	jmp ___void._floads_pfd_t__return
___void._floads_pfd_t__return:
	leave
	ret
_long_execl_pchar.char..:
	push rbp
	mov rbp, rsp
	sub rsp, 24
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	mov rbx, __emptyenv
	mov rdx, __emptyenv
	mov rbx, qword[rbp-16]
	mov rsi, rbx
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	xor rax, rax
	mov rax, 59
	syscall
.L0x86:
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
	mov rax, 57
	syscall
.L0x89:
	mov qword[rbp-16], 0
	mov rbx, qword[rbp-16]
	test rbx, rbx
	setz bl
	mov al, bl
	and al, 1
	jz .L0x8b
	mov r10, 2
	mov rbx, __systemcallargvconst
	lea rbx, [rbx+r10*8]
	mov r10, 2
	mov rbx, __systemcallargvconst
	lea rbx, [rbx+r10*8]
	mov r11, qword[rbp-8]
	mov r10, r11
	mov qword[rbx], r11
	mov rbx, __systemcallargvconst
	mov rsi, __systemcallargvconst
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
	call _void_printf_pchar.
	jmp .L0x8c
.L0x8b:
.L0x8c:
	xor rdx, rdx
	and rdx, 0xffffffff
	xor rsi, rsi
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	xor rax, rax
	mov rax, 61
	xor r8, r8
	syscall
.L0x8e:
	xor rax, rax
	jmp ___long_system_pchar.__return
___long_system_pchar.__return:
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
	mov al, bl
	and al, 1
	jz .L0x90
	mov rbx, 1
	mov byte[rbp-48], bl
	mov rbx, 1
	mov r10, qword[rbp-8]
	add r10, rbx
	mov qword[rbp-8], r10
	mov r10, qword[rbp-8]
	and r11, 0xff
	mov r11b, byte[r10]
	mov bl, r11b
	mov byte[rbp-40], r11b
	jmp .L0x91
.L0x90:
.L0x91:
	jmp .L0x93
.L0x92:
	mov r11, 10
	mov r10, qword[rbp-32]
	imul r10, r11
	mov r11b, byte[rbp-40]
	sub r11b, 48
	mov r12, r11
	add r10, r12
	mov rbx, r10
	mov qword[rbp-32], r10
	mov rbx, 1
	mov r10, qword[rbp-8]
	add r10, rbx
	mov qword[rbp-8], r10
	mov r10, qword[rbp-8]
	and r11, 0xff
	mov r11b, byte[r10]
	mov bl, r11b
	mov byte[rbp-40], r11b
.L0x93:
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
	jnz .L0x92
.L0x94:
	mov bl, byte[rbp-48]
	cmp bl, 0
	sete bl
	mov al, bl
	and al, 1
	jz .L0x95
	mov rbx, qword[rbp-16]
	mov r10, rbx
	mov rbx, qword[rbp-16]
	mov r10, rbx
	mov r11, qword[rbp-32]
	mov rbx, r11
	mov qword[r10], r11
	jmp .L0x96
.L0x95:
	mov rbx, qword[rbp-16]
	mov r10, rbx
	mov rbx, qword[rbp-16]
	mov r10, rbx
	mov r12, qword[rbp-32]
	xor r11, r11
	sub r11, r12
	mov rbx, r11
	mov qword[r10], r11
.L0x96:
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
	jmp .L0x98
.L0x97:
	mov rbx, qword[rbp-24]
	mov r10, rbx
	mov rbx, qword[rbp-24]
	mov r10, rbx
	mov r11, qword[rbp-8]
	and r12, 0xff
	mov r12b, byte[r11]
	mov bl, r12b
	mov byte[r10], r12b
	inc qword[rbp-8]
	inc qword[rbp-24]
.L0x98:
	mov rbx, qword[rbp-8]
	and r10, 0xff
	mov r10b, byte[rbx]
	mov bl, byte[rbp-16]
	cmp r10b, bl
	setne r10b
	mov al, r10b
	and al, 1
	jnz .L0x97
.L0x99:
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
	and rdx, 0xff
	lea rbx, [rbp-32]
	mov rsi, rbx
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	xor rax, rax
	call _int_scanint_pchar.long.bool
	mov qword[rbp-48], rax
	mov rbx, qword[rbp-48]
	mov r10, qword[rbp-8]
	add r10, rbx
	mov qword[rbp-8], r10
	mov rbx, qword[rbp-8]
	and r10, 0xff
	mov r10b, byte[rbx]
	mov bl, 46
	cmp r10b, bl
	setne r10b
	mov al, r10b
	and al, 1
	jz .L0x9a
	mov rbx, qword[rbp-24]
	mov r10, rbx
	mov rbx, qword[rbp-24]
	mov r10, rbx
	cvtsi2sd xmm7, qword[rbp-32]
	movq qword[r10], xmm7
	mov rax, qword[rbp-48]
	jmp ___int_scansd_pchar.booldouble.__return
	jmp .L0x9b
.L0x9a:
.L0x9b:
	inc qword[rbp-8]
	xor rdx, rdx
	and rdx, 0xff
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
	mov rax, rdi
	dec rsi
	jz .L0x9e_int_pow_pintint_end
.L0x9e_int_pow_pintint_flp:
	mul rdi
	dec rsi
	jnz .L0x9e_int_pow_pintint_flp
.L0x9e_int_pow_pintint_end:
.L0x9d:
	mov dword[rbp-64], eax
	mov ebx, dword[rbp-64]
	mov r10, qword[rbp-32]
	imul r10, rbx
	mov qword[rbp-32], r10
	mov r10, qword[rbp-40]
	mov rbx, qword[rbp-32]
	add rbx, r10
	cvtsi2sd xmm7, rbx
	movsd qword[rbp-72], xmm7
	mov rbx, qword[rbp-24]
	mov r10, rbx
	mov rbx, qword[rbp-24]
	mov r10, rbx
	mov ebx, dword[rbp-64]
	cvtsi2sd xmm8, ebx
	movsd xmm9, qword[rbp-72]
	divsd xmm9, xmm8
	movsd xmm7, xmm9
	movq qword[r10], xmm7
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
	mov al, bl
	and al, 1
	jz .L0x9f
	xor rax, rax
	jmp ___int___SSCANF_pchar.char.void..__return
	jmp .L0xa0
.L0x9f:
.L0xa0:
	jmp .L0xa2
.L0xa1:
	mov rbx, qword[rbp-8]
	and r10, 0xff
	mov r10b, byte[rbx]
	mov bl, 37
	cmp r10b, bl
	setne r10b
	mov al, r10b
	and al, 1
	jz .L0xa4
	inc qword[rbp-8]
	inc qword[rbp-16]
	jmp .L0xa5
.L0xa4:
	inc qword[rbp-8]
	mov rbx, qword[rbp-8]
	and r10, 0xff
	mov r10b, byte[rbx]
	mov byte[rbp-40], r10b
	mov r10b, 105
	mov bl, byte[rbp-40]
	cmp bl, r10b
	sete bl
	mov al, bl
	and al, 1
	jz .L0xa6
	mov rdx, 1
	and rdx, 0xff
	mov r11d, dword[rbp-32]
	mov r10, qword[rbp-24]
	and r11, 0xffffffff
	lea r10, [r10+r11*8]
	mov r10, qword[r10]
	mov rsi, r10
	mov r10, qword[rbp-16]
	mov rdi, r10
	xor rax, rax
	call _int_scanint_pchar.long.bool
	mov rbx, rax
	mov qword[rbp-48], rax
	mov rbx, qword[rbp-48]
	mov r10, qword[rbp-16]
	add r10, rbx
	mov qword[rbp-16], r10
	inc qword[rbp-8]
	jmp .L0xa7
.L0xa6:
	mov r10b, 117
	mov bl, byte[rbp-40]
	cmp bl, r10b
	sete bl
	mov al, bl
	and al, 1
	jz .L0xa8
	xor rdx, rdx
	and rdx, 0xff
	mov r11d, dword[rbp-32]
	mov r10, qword[rbp-24]
	and r11, 0xffffffff
	lea r10, [r10+r11*8]
	mov r10, qword[r10]
	mov rsi, r10
	mov r10, qword[rbp-16]
	mov rdi, r10
	xor rax, rax
	call _int_scanint_pchar.long.bool
	mov rbx, rax
	mov qword[rbp-48], rax
	mov rbx, qword[rbp-48]
	mov r10, qword[rbp-16]
	add r10, rbx
	mov qword[rbp-16], r10
	inc qword[rbp-8]
	jmp .L0xa9
.L0xa8:
	mov r10b, 99
	mov bl, byte[rbp-40]
	cmp bl, r10b
	sete bl
	mov al, bl
	and al, 1
	jz .L0xaa
	mov r10d, dword[rbp-32]
	mov rbx, qword[rbp-24]
	and r10, 0xffffffff
	lea rbx, [rbx+r10*8]
	mov rbx, qword[rbx]
	mov qword[rbp-56], rbx
	mov rbx, qword[rbp-56]
	mov r10, rbx
	mov rbx, qword[rbp-56]
	mov r10, rbx
	mov r11, qword[rbp-16]
	and r12, 0xff
	mov r12b, byte[r11]
	mov bl, r12b
	mov byte[r10], r12b
	inc qword[rbp-16]
	inc qword[rbp-8]
	jmp .L0xab
.L0xaa:
	mov r10b, 115
	mov bl, byte[rbp-40]
	cmp bl, r10b
	sete bl
	mov al, bl
	and al, 1
	jz .L0xac
	inc qword[rbp-8]
	mov r11d, dword[rbp-32]
	mov r10, qword[rbp-24]
	and r11, 0xffffffff
	lea r10, [r10+r11*8]
	mov r10, qword[r10]
	mov rdx, r10
	mov r10, qword[rbp-8]
	and r11, 0xff
	mov r11b, byte[r10]
	mov sil, r11b
	and rsi, 0xff
	mov r10, qword[rbp-16]
	mov rdi, r10
	xor rax, rax
	call _int_scanstr_pchar.charchar.
	mov rbx, rax
	mov qword[rbp-48], rax
	mov rbx, qword[rbp-48]
	mov r10, qword[rbp-16]
	add r10, rbx
	mov qword[rbp-16], r10
	jmp .L0xad
.L0xac:
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
	jz .L0xae
	mov r11d, dword[rbp-32]
	mov r10, qword[rbp-24]
	and r11, 0xffffffff
	lea r10, [r10+r11*8]
	mov r10, qword[r10]
	mov rdx, r10
	xor rsi, rsi
	and rsi, 0xff
	mov r10, qword[rbp-16]
	mov rdi, r10
	xor rax, rax
	call _int_scansd_pchar.booldouble.
	mov rbx, rax
	mov qword[rbp-48], rax
	mov rbx, qword[rbp-48]
	mov r10, qword[rbp-16]
	add r10, rbx
	mov qword[rbp-16], r10
	inc qword[rbp-8]
	jmp .L0xaf
.L0xae:
.L0xaf:
.L0xad:
.L0xab:
.L0xa9:
.L0xa7:
	inc dword[rbp-32]
.L0xa5:
.L0xa2:
	mov rbx, qword[rbp-8]
	and r10, 0xff
	mov r10b, byte[rbx]
	test r10b, r10b
	setnz r10b
	mov al, r10b
	and al, 1
	jnz .L0xa1
.L0xa3:
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
	lea rbx, [rbp-88] 
	mov r10, qword[rbp-24]
	mov qword[rbx], r10
	mov r10, 1
	lea rbx, [rbp-88] 
	lea rbx, [rbx+r10*8]
	mov r10, 1
	lea rbx, [rbp-88] 
	lea rbx, [rbx+r10*8]
	mov r10, qword[rbp-32]
	mov qword[rbx], r10
	mov r10, 2
	lea rbx, [rbp-88] 
	lea rbx, [rbx+r10*8]
	mov r10, 2
	lea rbx, [rbp-88] 
	lea rbx, [rbx+r10*8]
	mov r10, qword[rbp-40]
	mov qword[rbx], r10
	mov r10, 3
	lea rbx, [rbp-88] 
	lea rbx, [rbx+r10*8]
	mov r10, 3
	lea rbx, [rbp-88] 
	lea rbx, [rbx+r10*8]
	mov r10, qword[rbp-48]
	mov qword[rbx], r10
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
	call _void_printf_pchar.
	mov rdx, 40
	xor rsi, rsi
	and rsi, 0xff
	lea rbx, [rbp-56]
	mov rdi, rbx
	xor rax, rax
	call _void_memset_pvoid.ucharsize_t
	mov rdx, 40
	lea rbx, [rbp-56]
	mov rsi, rbx
	xor rdi, rdi
	xor rax, rax
	call _long_fgets_pfd_tchar.size_t
	mov rsi, 1
	and rsi, 0xff
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
	call _void_printf_pchar.
	mov rdx, 40
	xor rsi, rsi
	and rsi, 0xff
	lea rbx, [rbp-56]
	mov rdi, rbx
	xor rax, rax
	call _void_memset_pvoid.ucharsize_t
	mov rdx, 40
	lea rbx, [rbp-56]
	mov rsi, rbx
	xor rdi, rdi
	xor rax, rax
	call _long_fgets_pfd_tchar.size_t
	mov rsi, 1
	and rsi, 0xff
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
	call _long_fgets_pfd_tchar.size_t
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
	call _void_printf_pchar.
	mov edx, dword[rbp-16]
	mov rbx, qword[rbp-8]
	mov rsi, rbx
	xor rdi, rdi
	xor rax, rax
	call _long_fgets_pfd_tchar.size_t
___void_getString_pchar.intchar.__return:
	leave
	ret
_int_toInteger_pchar.bool:
	push rbp
	mov rbp, rsp
	sub rsp, 48
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	jmp .L0xb1
.L0xb0:
	mov rbx, 1
	mov r10, qword[rbp-8]
	add r10, rbx
	mov qword[rbp-8], r10
.L0xb1:
	mov rbx, qword[rbp-8]
	and r10, 0xff
	mov r10b, byte[rbx]
	mov bl, 32
	cmp r10b, bl
	sete r10b
	mov al, r10b
	and al, 1
	jnz .L0xb0
.L0xb2:
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
	mov al, bl
	and al, 1
	jz .L0xb3
	mov rbx, 1
	mov byte[rbp-40], bl
	mov rbx, 1
	mov r10, qword[rbp-8]
	add r10, rbx
	mov qword[rbp-8], r10
	mov r10, qword[rbp-8]
	and r11, 0xff
	mov r11b, byte[r10]
	mov bl, r11b
	mov byte[rbp-24], r11b
	jmp .L0xb4
.L0xb3:
.L0xb4:
	jmp .L0xb6
.L0xb5:
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
	mov rbx, 1
	mov r10, qword[rbp-8]
	add r10, rbx
	mov qword[rbp-8], r10
	mov r10, qword[rbp-8]
	and r11, 0xff
	mov r11b, byte[r10]
	mov bl, r11b
	mov byte[rbp-24], r11b
.L0xb6:
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
	jnz .L0xb5
.L0xb7:
	mov bl, byte[rbp-40]
	mov al, bl
	and al, 1
	jz .L0xb8
	mov r10d, dword[rbp-32]
	xor rbx, rbx
	mov r11, r10
	sub rbx, r11
	mov eax, ebx
	jmp ___int_toInteger_pchar.bool__return
	jmp .L0xb9
.L0xb8:
.L0xb9:
	mov ebx, dword[rbp-32]
	mov eax, ebx
	jmp ___int_toInteger_pchar.bool__return
___int_toInteger_pchar.bool__return:
	leave
	ret
__scanf:
	push rbp
	mov rbp, rsp
	sub rsp, 24
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	xor rdi, rdi
	xor rax, rax
	call _void._floads_pfd_t
	mov rbx, rax
	push rbx
	mov r11, qword[rbp-16]
	mov rdx, r11
	mov r11, rbx
	mov rsi, rbx
	mov r11, qword[rbp-8]
	mov rdi, r11
	xor rax, rax
	call _int___SSCANF_pchar.char.void..
	mov r11, rax
	pop rbx
	mov rax, r11
	mov r10d, eax
	push rbx
	push r10
	mov rdi, rbx
	xor rax, rax
	call _void_free_pvoid.
	mov r11, rax
	pop r10
	pop rbx
	mov rax, r11
	mov r11d, r10d
	mov eax, r10d
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
	lea rbx, [rbp-96] 
	mov r10, qword[rbp-16]
	mov qword[rbx], r10
	mov r10, 1
	lea rbx, [rbp-96] 
	lea rbx, [rbx+r10*8]
	mov r10, 1
	lea rbx, [rbp-96] 
	lea rbx, [rbx+r10*8]
	mov r10, qword[rbp-24]
	mov qword[rbx], r10
	mov r10, 2
	lea rbx, [rbp-96] 
	lea rbx, [rbx+r10*8]
	mov r10, 2
	lea rbx, [rbp-96] 
	lea rbx, [rbx+r10*8]
	mov r10, qword[rbp-32]
	mov qword[rbx], r10
	mov r10, 3
	lea rbx, [rbp-96] 
	lea rbx, [rbx+r10*8]
	mov r10, 3
	lea rbx, [rbp-96] 
	lea rbx, [rbx+r10*8]
	mov r10, qword[rbp-40]
	mov qword[rbx], r10
	mov r10, 4
	lea rbx, [rbp-96] 
	lea rbx, [rbx+r10*8]
	mov r10, 4
	lea rbx, [rbp-96] 
	lea rbx, [rbx+r10*8]
	mov r10, qword[rbp-48]
	mov qword[rbx], r10
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
	and rdx, 0xffffffff
	mov rbx, qword[rbp-32]
	mov rsi, rbx
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	xor rax, rax
	mov eax, [rsi]
	lock cmpxchg dword[rdi], edx
	jz .L0xbc__end
	mov eax, [rdi]
	mov [rsi], eax
.L0xbc__end:
.L0xbb:
	mov rbx, qword[rbp-32]
	and r10, 0xffffffff
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
	and rdx, 0xffffffff
	xor rsi, rsi
	and rsi, 0xffffffff
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	xor rax, rax
	call _void_mutex_cmpxchg_pmutex.intint
	mov dword[rbp-16], eax
	mov ebx, dword[rbp-16]
	test ebx, ebx
	setnz bl
	mov al, bl
	and al, 1
	jz .L0xbd
	jmp .L0xc0
.L0xbf:
	mov rdx, 2
	and rdx, 0xffffffff
	mov rsi, 1
	and rsi, 0xffffffff
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	xor rax, rax
	call _void_mutex_cmpxchg_pmutex.intint
	push rax
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
	jz .L0xc2
	mov rdx, 2
	and rdx, 0xffffffff
	xor rsi, rsi
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	xor rax, rax
	push rdi
	push rsi
	push rdx
	xor r9, r9
	and r9, 0xffffffff
	xor r8, r8
	xor rcx, rcx
	mov ebx, edx
	mov edx, edx
	and rdx, 0xffffffff
	mov rbx, rsi
	mov rsi, rsi
	mov rbx, rdi
	mov rdi, rdi
	xor rax, rax
	mov rax, 202
	mov r10, rcx
	syscall
.L0xc7:
	xor rbx, rbx
	pop rdx
	pop rsi
	pop rdi
	mov rax, rbx
	jmp .L0xc5
.L0xc5:
	jmp .L0xc3
.L0xc2:
.L0xc3:
	mov rdx, 2
	and rdx, 0xffffffff
	xor rsi, rsi
	and rsi, 0xffffffff
	mov r10, qword[rbp-8]
	mov rdi, r10
	xor rax, rax
	call _void_mutex_cmpxchg_pmutex.intint
	mov rbx, rax
	mov dword[rbp-16], ebx
	mov ebx, dword[rbp-16]
	test ebx, ebx
	setz bl
	mov al, bl
	and al, 1
	jz .L0xc9
	mov rbx, STRING_CONSTANT_142
	mov rdi, STRING_CONSTANT_142
	xor rax, rax
	call _void_printf_pchar.
	jmp .L0xc1
	jmp .L0xca
.L0xc9:
.L0xca:
.L0xc0:
	mov rax, 1
	and al, 1
	jnz .L0xbf
.L0xc1:
	jmp .L0xbe
.L0xbd:
.L0xbe:
___void_mlock_pmutex.__return:
	leave
	ret
_void_munlock_pmutex.:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov [rbp-8], rdi
	mov rsi, 1
	and rsi, 0xffffffff
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	xor rax, rax
	xor rax, rax
	mov eax, [rdi]
	lock sub dword[rdi], esi
.L0xcc:
	mov r10, rax
	mov rbx, 1
	mov r11, r10
	cmp r11, rbx
	setne r11b
	mov al, r11b
	and al, 1
	jz .L0xce
	xor rsi, rsi
	and rsi, 0xffffffff
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	xor rax, rax
	lock xchg dword[rdi], esi
.L0xd1:
	mov rdx, 2
	and rdx, 0xffffffff
	xor rsi, rsi
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	xor rax, rax
	push rdi
	push rsi
	push rdx
	xor r9, r9
	and r9, 0xffffffff
	xor r8, r8
	xor rcx, rcx
	mov ebx, edx
	mov edx, edx
	and rdx, 0xffffffff
	mov rbx, rsi
	mov rsi, rsi
	mov rbx, rdi
	mov rdi, rdi
	xor rax, rax
	mov rax, 202
	mov r10, rcx
	syscall
.L0xd6:
	xor rbx, rbx
	pop rdx
	pop rsi
	pop rdi
	mov rax, rbx
	jmp .L0xd4
.L0xd4:
	jmp .L0xcf
.L0xce:
.L0xcf:
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
	mov rax,60
	syscall
.L0xda:
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
	jnz .L0xdc__end
	mov rdi, r15
	mov rsi, r14
	mov rdx, r13
	call __enterthread
	mov rdi, rax
	call __thrdext
.L0xdc__end:
___long_thrdcrt_pvoid.thread_t.void.__return:
	leave
	ret
__crtstack:
	push rbp
	mov rbp, rsp
	sub rsp, 8
	xor r9, r9
	and r9, 0xffffffff
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
	and rbx, 0xffffffff
	mov rsi, rbx
	mov rbx, STRING_CONSTANT_143
	mov rdi, STRING_CONSTANT_143
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
	mov rbx, qword[rbp-8]
	lea rbx, [rbx+12]
	mov rbx, qword[rbp-8]
	lea rbx, [rbx+12]
	mov r11, qword[rbp-24]
	mov rdx, r11
	mov r11, qword[rbp-8]
	mov rsi, r11
	mov rdi, qword[rbp-16]
	xor rax, rax
	call _long_thrdcrt_pvoid.thread_t.void.
	mov r10, rax
	mov qword[rbx], rax
	mov rbx, qword[rbp-8]
	lea rbx, [rbx+4]
	mov rbx, qword[rbp-8]
	lea rbx, [rbx+4]
	mov r11, qword[rbp-16]
	mov r10, r11
	mov qword[rbx], r11
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
	sub rsp, 16
	mov [rbp-8], rdi
	xor rax, rax
	jmp __main__return
__main__return:
	leave
	ret
	