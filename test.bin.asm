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
global _void._munmap_pvoid.size_t:
global _void._qmmap_psize_t:
extern _bool_all_of_raw_piterablesize_tsize_tvoid.:
extern _bool_any_of_raw_piterablesize_tsize_tvoid.:
extern _bool_none_of_raw_piterablesize_tsize_tvoid.:
extern _FILE_fopen_pchar.char.:
extern _size_t_fputs_pFILEchar.:
extern _long_fgets_pFILEchar.size_t:
extern _void._floads_pFILE:
global _long_execl_pchar.char..:
global _long_system_pchar.:
global _void___assert_pboolchar.intchar.:
global _void_free_pvoid.:
global _void._malloc_psize_t:
global _void._realloc_pvoid.size_t:
global _void._calloc_psize_t:
global _void._mapalloc_psize_t:
global _void_mapfree_pvoid.:
global _void_memcpy_pvoid.void.size_t:
global _void_avx_memcpy_pvoid.void.size_t:
global _void_avx_memzer_pvoid.size_t:
global _void_memset_pvoid.ucharsize_t:
global _void_memzer_pvoid.size_t:
global _char._get_errstr_pint:
extern _int___sprintf_pchar.char.void.:
extern _int_sprintf_pchar.char.voidvoidvoidvoid:
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
	section .data
	align 8
FLT_CONSTANT_0: dq 0x0.0p+0
STRING_CONSTANT_0: db `/bin/bash`, 0
STRING_CONSTANT_1: db `PATH=/bin:/usr/bin:/sbin:/usr/sbin`, 0
STRING_CONSTANT_2: db `sudo`, 0
STRING_CONSTANT_3: db `-c`, 0
STRING_CONSTANT_4: db `%s:%i: Assertion '%s' failed.\n`, 0
STRING_CONSTANT_5: db `=======================\n`, 0
STRING_CONSTANT_6: db `EMPTY\n`, 0
STRING_CONSTANT_7: db `BLOCK: %i @ %x : %i\n`, 0
STRING_CONSTANT_8: db `Appends: %i, Deletions %i, Cache: %u\n`, 0
STRING_CONSTANT_9: db `=======================\n`, 0
STRING_CONSTANT_10: db `Success`, 0
STRING_CONSTANT_11: db `Operation not permitted`, 0
STRING_CONSTANT_12: db `No such file or directory`, 0
STRING_CONSTANT_13: db `No such process`, 0
STRING_CONSTANT_14: db `Interrupted system call`, 0
STRING_CONSTANT_15: db `I/O error`, 0
STRING_CONSTANT_16: db `No such device or address`, 0
STRING_CONSTANT_17: db `Argument list too long`, 0
STRING_CONSTANT_18: db `Exec format error`, 0
STRING_CONSTANT_19: db `Bad file number`, 0
STRING_CONSTANT_20: db `No child processes`, 0
STRING_CONSTANT_21: db `Try again`, 0
STRING_CONSTANT_22: db `Out of memory`, 0
STRING_CONSTANT_23: db `Permission denied`, 0
STRING_CONSTANT_24: db `Bad address`, 0
STRING_CONSTANT_25: db `Block device required`, 0
STRING_CONSTANT_26: db `Device or resource busy`, 0
STRING_CONSTANT_27: db `File exists`, 0
STRING_CONSTANT_28: db `Cross-device link`, 0
STRING_CONSTANT_29: db `No such device`, 0
STRING_CONSTANT_30: db `Not a directory`, 0
STRING_CONSTANT_31: db `Is a directory`, 0
STRING_CONSTANT_32: db `Invalid argument`, 0
STRING_CONSTANT_33: db `File table overflow`, 0
STRING_CONSTANT_34: db `Too many open files`, 0
STRING_CONSTANT_35: db `Not a typewriter`, 0
STRING_CONSTANT_36: db `Text file busy`, 0
STRING_CONSTANT_37: db `File too large`, 0
STRING_CONSTANT_38: db `No space left on device`, 0
STRING_CONSTANT_39: db `Illegal seek`, 0
STRING_CONSTANT_40: db `Read-only file system`, 0
STRING_CONSTANT_41: db `Too many links`, 0
STRING_CONSTANT_42: db `Broken pipe`, 0
STRING_CONSTANT_43: db `Math argument out of domain of func`, 0
STRING_CONSTANT_44: db `Math result not representable`, 0
STRING_CONSTANT_45: db `Resource deadlock would occur`, 0
STRING_CONSTANT_46: db `File name too long`, 0
STRING_CONSTANT_47: db `No record locks available`, 0
STRING_CONSTANT_48: db `Function not implemented`, 0
STRING_CONSTANT_49: db `Directory not empty`, 0
STRING_CONSTANT_50: db `Too many symbolic links encountered`, 0
STRING_CONSTANT_51: db `Operation would block`, 0
STRING_CONSTANT_52: db `No message of desired type`, 0
STRING_CONSTANT_53: db `Identifier removed`, 0
STRING_CONSTANT_54: db `Channel number out of range`, 0
STRING_CONSTANT_55: db `Level 2 not synchronized`, 0
STRING_CONSTANT_56: db `Level 3 halted`, 0
STRING_CONSTANT_57: db `Level 3 reset`, 0
STRING_CONSTANT_58: db `Link number out of range`, 0
STRING_CONSTANT_59: db `Protocol driver not attached`, 0
STRING_CONSTANT_60: db `No CSI structure available`, 0
STRING_CONSTANT_61: db `Level 2 halted`, 0
STRING_CONSTANT_62: db `Invalid exchange`, 0
STRING_CONSTANT_63: db `Invalid request descriptor`, 0
STRING_CONSTANT_64: db `Exchange full`, 0
STRING_CONSTANT_65: db `No anode`, 0
STRING_CONSTANT_66: db `Invalid request code`, 0
STRING_CONSTANT_67: db `Invalid slot`, 0
STRING_CONSTANT_68: db `EDEADLK`, 0
STRING_CONSTANT_69: db `Bad font file format`, 0
STRING_CONSTANT_70: db `Device not a stream`, 0
STRING_CONSTANT_71: db `No data available`, 0
STRING_CONSTANT_72: db `Timer expired`, 0
STRING_CONSTANT_73: db `Out of streams resources`, 0
STRING_CONSTANT_74: db `Machine is not on the network`, 0
STRING_CONSTANT_75: db `Package not installed`, 0
STRING_CONSTANT_76: db `Object is remote`, 0
STRING_CONSTANT_77: db `Link has been severed`, 0
STRING_CONSTANT_78: db `Advertise error`, 0
STRING_CONSTANT_79: db `Srmount error`, 0
STRING_CONSTANT_80: db `Communication error on send`, 0
STRING_CONSTANT_81: db `Protocol error`, 0
STRING_CONSTANT_82: db `Multihop attempted`, 0
STRING_CONSTANT_83: db `RFS specific error`, 0
STRING_CONSTANT_84: db `Not a data message`, 0
STRING_CONSTANT_85: db `Value too large for defined data type`, 0
STRING_CONSTANT_86: db `Name not unique on network`, 0
STRING_CONSTANT_87: db `File descriptor in bad state`, 0
STRING_CONSTANT_88: db `Remote address changed`, 0
STRING_CONSTANT_89: db `Can not access a needed shared library`, 0
STRING_CONSTANT_90: db `Accessing a corrupted shared library`, 0
STRING_CONSTANT_91: db `.lib section in a.out corrupted`, 0
STRING_CONSTANT_92: db `Attempting to link in too many shared libraries`, 0
STRING_CONSTANT_93: db `Cannot exec a shared library directly`, 0
STRING_CONSTANT_94: db `Illegal byte sequence`, 0
STRING_CONSTANT_95: db `Interrupted system call should be restarted`, 0
STRING_CONSTANT_96: db `Streams pipe error`, 0
STRING_CONSTANT_97: db `Too many users`, 0
STRING_CONSTANT_98: db `Socket operation on non-socket`, 0
STRING_CONSTANT_99: db `Destination address required`, 0
STRING_CONSTANT_100: db `Message too long`, 0
STRING_CONSTANT_101: db `Protocol wrong type for socket`, 0
STRING_CONSTANT_102: db `Protocol not available`, 0
STRING_CONSTANT_103: db `Protocol not supported`, 0
STRING_CONSTANT_104: db `Socket type not supported`, 0
STRING_CONSTANT_105: db `Operation not supported on transport endpoint`, 0
STRING_CONSTANT_106: db `Protocol family not supported`, 0
STRING_CONSTANT_107: db `Address family not supported by protocol`, 0
STRING_CONSTANT_108: db `Address already in use`, 0
STRING_CONSTANT_109: db `Cannot assign requested address`, 0
STRING_CONSTANT_110: db `Network is down`, 0
STRING_CONSTANT_111: db `Network is unreachable`, 0
STRING_CONSTANT_112: db `Network dropped connection because of reset`, 0
STRING_CONSTANT_113: db `Software caused connection abort`, 0
STRING_CONSTANT_114: db `Connection reset by peer`, 0
STRING_CONSTANT_115: db `No buffer space available`, 0
STRING_CONSTANT_116: db `Transport endpoint is already connected`, 0
STRING_CONSTANT_117: db `Transport endpoint is not connected`, 0
STRING_CONSTANT_118: db `Cannot send after transport endpoint shutdown`, 0
STRING_CONSTANT_119: db `Too many references: cannot splice`, 0
STRING_CONSTANT_120: db `Connection timed out`, 0
STRING_CONSTANT_121: db `Connection refused`, 0
STRING_CONSTANT_122: db `Host is down`, 0
STRING_CONSTANT_123: db `No route to host`, 0
STRING_CONSTANT_124: db `Operation already in progress`, 0
STRING_CONSTANT_125: db `Operation now in progress`, 0
STRING_CONSTANT_126: db `Stale NFS file handle`, 0
STRING_CONSTANT_127: db `Structure needs cleaning`, 0
STRING_CONSTANT_128: db `Not a XENIX named type file`, 0
STRING_CONSTANT_129: db `No XENIX semaphores available`, 0
STRING_CONSTANT_130: db `Is a named type file`, 0
STRING_CONSTANT_131: db `Remote I/O error`, 0
STRING_CONSTANT_132: db `Quota exceeded`, 0
STRING_CONSTANT_133: db `No medium found`, 0
STRING_CONSTANT_134: db `Wrong medium type`, 0
STRING_CONSTANT_135: db `Operation Canceled`, 0
STRING_CONSTANT_136: db `Required key not available`, 0
STRING_CONSTANT_137: db `Key has expired`, 0
STRING_CONSTANT_138: db `Key has been revoked`, 0
STRING_CONSTANT_139: db `Key was rejected by service`, 0
STRING_CONSTANT_140: db `Owner died`, 0
STRING_CONSTANT_141: db `State not recoverable`, 0
STRING_CONSTANT_142: db `Unkown Error Code.`, 0
STRING_CONSTANT_143: db `%f\n`, 0
FLT_CONSTANT_1: dq 0x1.921fb54442d18p+0
M_MINZERO_MEM: DQ 0x0.0p+0
nullterm: DB 0
__systembashpath: DQ "/bin/bash"
__emptyenv: DQ STRING_CONSTANT_1, 0, 0
__systemcallargvconst: DQ STRING_CONSTANT_2, STRING_CONSTANT_3, 0, 0
malloc_maxcache: DQ 524288
free_head: DQ 0
cached_size: DQ 0
appends: DQ 0
deletions: DQ 0
__linux_errstrlist: DQ STRING_CONSTANT_10, STRING_CONSTANT_11, STRING_CONSTANT_12, STRING_CONSTANT_13, STRING_CONSTANT_14, STRING_CONSTANT_15, STRING_CONSTANT_16, STRING_CONSTANT_17, STRING_CONSTANT_18, STRING_CONSTANT_19, STRING_CONSTANT_20, STRING_CONSTANT_21, STRING_CONSTANT_22, STRING_CONSTANT_23, STRING_CONSTANT_24, STRING_CONSTANT_25, STRING_CONSTANT_26, STRING_CONSTANT_27, STRING_CONSTANT_28, STRING_CONSTANT_29, STRING_CONSTANT_30, STRING_CONSTANT_31, STRING_CONSTANT_32, STRING_CONSTANT_33, STRING_CONSTANT_34, STRING_CONSTANT_35, STRING_CONSTANT_36, STRING_CONSTANT_37, STRING_CONSTANT_38, STRING_CONSTANT_39, STRING_CONSTANT_40, STRING_CONSTANT_41, STRING_CONSTANT_42, STRING_CONSTANT_43, STRING_CONSTANT_44, STRING_CONSTANT_45, STRING_CONSTANT_46, STRING_CONSTANT_47, STRING_CONSTANT_48, STRING_CONSTANT_49, STRING_CONSTANT_50, STRING_CONSTANT_51, STRING_CONSTANT_52, STRING_CONSTANT_53, STRING_CONSTANT_54, STRING_CONSTANT_55, STRING_CONSTANT_56, STRING_CONSTANT_57, STRING_CONSTANT_58, STRING_CONSTANT_59, STRING_CONSTANT_60, STRING_CONSTANT_61, STRING_CONSTANT_62, STRING_CONSTANT_63, STRING_CONSTANT_64, STRING_CONSTANT_65, STRING_CONSTANT_66, STRING_CONSTANT_67, STRING_CONSTANT_68, STRING_CONSTANT_69, STRING_CONSTANT_70, STRING_CONSTANT_71, STRING_CONSTANT_72, STRING_CONSTANT_73, STRING_CONSTANT_74, STRING_CONSTANT_75, STRING_CONSTANT_76, STRING_CONSTANT_77, STRING_CONSTANT_78, STRING_CONSTANT_79, STRING_CONSTANT_80, STRING_CONSTANT_81, STRING_CONSTANT_82, STRING_CONSTANT_83, STRING_CONSTANT_84, STRING_CONSTANT_85, STRING_CONSTANT_86, STRING_CONSTANT_87, STRING_CONSTANT_88, STRING_CONSTANT_89, STRING_CONSTANT_90, STRING_CONSTANT_91, STRING_CONSTANT_92, STRING_CONSTANT_93, STRING_CONSTANT_94, STRING_CONSTANT_95, STRING_CONSTANT_96, STRING_CONSTANT_97, STRING_CONSTANT_98, STRING_CONSTANT_99, STRING_CONSTANT_100, STRING_CONSTANT_101, STRING_CONSTANT_102, STRING_CONSTANT_103, STRING_CONSTANT_104, STRING_CONSTANT_105, STRING_CONSTANT_106, STRING_CONSTANT_107, STRING_CONSTANT_108, STRING_CONSTANT_109, STRING_CONSTANT_110, STRING_CONSTANT_111, STRING_CONSTANT_112, STRING_CONSTANT_113, STRING_CONSTANT_114, STRING_CONSTANT_115, STRING_CONSTANT_116, STRING_CONSTANT_117, STRING_CONSTANT_118, STRING_CONSTANT_119, STRING_CONSTANT_120, STRING_CONSTANT_121, STRING_CONSTANT_122, STRING_CONSTANT_123, STRING_CONSTANT_124, STRING_CONSTANT_125, STRING_CONSTANT_126, STRING_CONSTANT_127, STRING_CONSTANT_128, STRING_CONSTANT_129, STRING_CONSTANT_130, STRING_CONSTANT_131, STRING_CONSTANT_132, STRING_CONSTANT_133, STRING_CONSTANT_134, STRING_CONSTANT_135, STRING_CONSTANT_136, STRING_CONSTANT_137, STRING_CONSTANT_138, STRING_CONSTANT_139, STRING_CONSTANT_140, STRING_CONSTANT_141
errno: DD 0
	section .bss
	align 16
__heap.padding__: resz 1
	section .text
	align 8
	global main
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
.L0x97:
	jmp ___void._qmmap_psize_t__return
___void._qmmap_psize_t__return:
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
.L0x94:
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
.L0x8a:
	mov qword[rbp-16], rax
	mov rbx, qword[rbp-16]
	test rbx, rbx
	jnz .L0x8c
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
	call _size_t_fputs_pFILEchar.
	mov rbx, rax
	pop rdi
	mov rax, rbx
.L0x8f:
	jmp .L0x8d
.L0x8c:
.L0x8d:
	xor rdx, rdx
	xor rsi, rsi
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	mov rax, 61
	xor r8, r8
	syscall
.L0x91:
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
	jne .L0x84
	mov rcx, qword[rbp-32]
	mov edx, dword[rbp-24]
	mov rsi, qword[rbp-16]
	mov rdi, STRING_CONSTANT_4
	call eprintf
	mov rdi, 1
	mov rax , 60 
	mov r10 , rcx 
	syscall 
.L0x87:
	jmp .L0x85
.L0x84:
.L0x85:
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
	jz .L0x7c
	mov rbx, rdi
	lea rbx, [rbx+8]
	mov r10, rbx
	cmp qword[r10+24], 1
	jne .L0x7e
	mov rbx, rdi
	mov rbx, qword[rbx]
	mov r10, rdi
	add r10, rbx
	add r10, 32
	mov rbx, rdi
	cmp r10, qword[rbx]
	jne .L0x80
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
	jz .L0x82
	mov rbx, rdi
	lea rbx, [rbx+8]
	mov r10, rbx
	lea r10, [r10+16]
	mov r11, rdi
	mov [r10], r11
	jmp .L0x83
.L0x82:
.L0x83:
.L0x80:
.L0x81:
.L0x7e:
.L0x7f:
.L0x7c:
.L0x7d:
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
	jle .L0x70
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
	jmp .L0x73
.L0x73:
	xor rax, rax
	jmp ___bool_scan_merge_pmblock.__return
.L0x70:
.L0x71:
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
	jnz .L0x6e
	mov r10, rdi
	mov qword[free_head], r10
	mov rbx, rdi
	lea rbx, [rbx+16]
	mov r11, rdi
	mov [rbx], r11
	mov rbx, rdi
	mov qword[rbx+8], 0
	jmp ___void_add_block_pmblock.__return
.L0x6e:
.L0x6f:
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
	jnz .L0x62
	xor rax, rax
	jmp ___mblock._scan_existing_psize_t__return
.L0x62:
.L0x63:
	mov rbx, qword[free_head]
	mov qword[rbp-16], rbx
	jmp .L0x65
.L0x64:
	mov rbx, qword[rbp-16]
	cmp qword[rbx+24], 1
	jne .L0x68
	mov rbx, qword[rbp-16]
	mov rbx, qword[rbx]
	cmp rbx, qword[rbp-8]
	jl .L0x6a
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
.L0x6a:
.L0x6b:
.L0x68:
.L0x69:
.L0x66:
	mov rbx, qword[rbp-16]
	mov rbx, [rbx+8]
	mov qword[rbp-16], rbx
.L0x65:
	mov rbx, qword[rbp-16]
	test rbx, rbx
	jnz .L0x64
.L0x67:
	xor rax, rax
	jmp ___mblock._scan_existing_psize_t__return
___mblock._scan_existing_psize_t__return:
	leave
	ret
_void_printstate_p:
	push rbp
	mov rbp, rsp
	sub rsp, 8
	mov rdi, STRING_CONSTANT_5
	push rdi
	mov rsi, rdi
	mov rdi, 1
	call _size_t_fputs_pFILEchar.
	mov rbx, rax
	pop rdi
	mov rax, rbx
.L0x57:
	mov rbx, qword[free_head]
	test rbx, rbx
	jnz .L0x58
	mov rdi, STRING_CONSTANT_6
	push rdi
	mov rsi, rdi
	mov rdi, 1
	call _size_t_fputs_pFILEchar.
	mov rbx, rax
	pop rdi
	mov rax, rbx
.L0x5b:
	jmp .L0x59
.L0x58:
	mov rbx, qword[free_head]
	mov qword[rbp-8], rbx
	jmp .L0x5d
.L0x5c:
	mov rbx, qword[rbp-8]
	mov rbx, [rbx+24]
	mov rcx, rbx
	mov rdx, qword[rbp-8]
	mov rbx, qword[rbp-8]
	mov rbx, qword[rbx]
	mov rsi, rbx
	mov rdi, STRING_CONSTANT_7
	call printf
.L0x5e:
	mov rbx, qword[rbp-8]
	mov rbx, [rbx+8]
	mov qword[rbp-8], rbx
.L0x5d:
	mov rbx, qword[rbp-8]
	test rbx, rbx
	jnz .L0x5c
.L0x5f:
.L0x59:
	mov rcx, qword[cached_size]
	mov rdx, qword[deletions]
	mov rsi, qword[appends]
	mov rdi, STRING_CONSTANT_8
	call printf
	mov rdi, STRING_CONSTANT_9
	push rdi
	mov rsi, rdi
	mov rdi, 1
	call _size_t_fputs_pFILEchar.
	mov rbx, rax
	pop rdi
	mov rax, rbx
.L0x61:
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
	jg .L0x52
	jmp ___void_split_block_pmblock.size_t__return
.L0x52:
.L0x53:
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
	jz .L0x54
	mov rbx, rdi
	lea rbx, [rbx+8]
	mov r10, rbx
	lea r10, [r10+16]
	mov r11, qword[rbp-8]
	mov [r10], r11
	jmp .L0x55
.L0x54:
.L0x55:
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
	jl .L0x4a
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
	jmp .L0x4d
.L0x4d:
.L0x4a:
.L0x4b:
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
	jl .L0x40
	mov rbx, qword[rbp-8]
	add rbx, 32
	mov rdi, rbx
	push rdi
	call _void._qmmap_psize_t
	mov rbx, rax
	pop rdi
	mov rax, rbx
	jmp .L0x43
.L0x43:
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
.L0x40:
.L0x41:
	mov rbx, qword[free_head]
	test rbx, rbx
	jz .L0x44
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _mblock._scan_existing_psize_t
	mov r10, rax
	mov qword[rbp-16], r10
	mov rax, qword[rbp-16]
	test rax, rax
	jz .L0x46
	mov rbx, qword[rbp-16]
	mov qword[rbx+24], 0
	mov rbx, qword[rbp-16]
	add rbx, 32
	mov rax, rbx
	jmp ___void._malloc_psize_t__return
.L0x46:
.L0x47:
.L0x44:
.L0x45:
	mov rdi, 4096
	push rdi
	call _void._qmmap_psize_t
	mov rbx, rax
	pop rdi
	mov rax, rbx
	jmp .L0x49
.L0x49:
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
	jge .L0x39
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _void_free_pvoid.
	mov rbx, qword[rbp-16]
	mov rdi, rbx
	call _void._malloc_psize_t
	mov qword[rbp-40], rax
	mov r10, qword[rbp-40]
	cmp qword[rbp-8], r10
	jne .L0x3b
	mov rbx, qword[rbp-8]
	mov rax, rbx
	jmp ___void._realloc_pvoid.size_t__return
.L0x3b:
.L0x3c:
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
.L0x39:
.L0x3a:
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
.L0x3e:
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
_void._mapalloc_psize_t:
	push rbp
	mov rbp, rsp
	sub rsp, 24
	mov [rbp-8], rdi
	mov rbx, qword[rbp-8]
	add rbx, 8
	mov rdi, rbx
	call _void._qmmap_psize_t
	mov qword[rbp-16], rax
	mov rbx, qword[rbp-16]
	mov r11, qword[rbp-8]
	mov [rbx], r11
	mov rbx, qword[rbp-16]
	add rbx, 8
	mov rax, rbx
	jmp ___void._mapalloc_psize_t__return
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
	mov r10, qword[rbx]
	mov qword[rbp-16], r10
	mov rbx, qword[rbp-16]
	mov rsi, rbx
	mov rbx, qword[rbp-8]
	mov rdi, rbx
	call _void._munmap_pvoid.size_t
___void_mapfree_pvoid.__return:
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
	jmp .L0x32
.L0x31:
	mov ebx, dword[rbp-48]
	shl rbx, 3
	add rbx, [rbp-16]
	vmovdqu ymm0, [rbx]
	mov ebx, dword[rbp-48]
	shl rbx, 3
	add rbx, [rbp-8]
	vmovdqu [rbx], ymm0
.L0x33:
	mov ebx, dword[rbp-48]
	add ebx, 4
	mov dword[rbp-48], ebx
.L0x32:
	mov r10d, dword[rbp-48]
	mov rbx, qword[rbp-40]
	mov r11d, r10d
	cmp r11, rbx
	jl .L0x31
.L0x34:
	mov ebx, dword[rbp-32]
	test ebx, ebx
	jz .L0x35
	mov edx, dword[rbp-32]
	mov r10, qword[rbp-16]
	add r10, qword[rbp-40]
	mov rsi, r10
	mov r10, qword[rbp-8]
	add r10, qword[rbp-40]
	mov rdi, r10
	call _void_memcpy_pvoid.void.size_t
	jmp .L0x36
.L0x35:
.L0x36:
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
.L0x2eavxmemzeraligned_lp:
	vmovdqu [rdi], ymm0
	add rdi, 4
	sub rsi, 4
	jnz .L0x2eavxmemzeraligned_lp
.L0x2d:
	mov ebx, dword[rbp-24]
	test ebx, ebx
	jz .L0x2f
	mov edx, dword[rbp-24]
	mov rsi, 0
	mov r10, qword[rbp-8]
	add r10, qword[rbp-32]
	mov rdi, r10
	call _void_memset_pvoid.ucharsize_t
	jmp .L0x30
.L0x2f:
.L0x30:
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
.L0x29:
	mov [rdi+rsi], bl
	dec rsi
	jnz .L0x29
___void_memzer_pvoid.size_t__return:
	leave
	ret
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
	jz .L0x26
	mov r10d, edi
	mov rbx, __linux_errstrlist
	and r10, 0x7fffffff
	mov rbx, [rbx+r10*8]
	mov rax, rbx
	jmp ___char._get_errstr_pint__return
.L0x26:
.L0x27:
	mov rax, STRING_CONSTANT_142
	jmp ___char._get_errstr_pint__return
___char._get_errstr_pint__return:
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
	jmp .L0x1c
.L0x1b:
	mov r10, rdi
	mov r10b, byte[r10]
	and r10, 0xff
	cmp r10b, sil
	jne .L0x1e
	mov rax, rdi
	jmp ___char._memchr_pchar.charsize_t__return
.L0x1e:
.L0x1f:
	inc rdi
.L0x1c:
	cmp rdi, rbx
	jl .L0x1b
.L0x1d:
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
	jmp .L0x12
.L0x11:
	mov r11, rdi
	mov r12, rsi
	mov r11b, byte[r11]
	and r11, 0xff
	mov r12b, byte[r12]
	and r12, 0xff
	cmp r11b, r12b
	jge .L0x14
	dec ebx
	jmp .L0x15
.L0x14:
	inc ebx
.L0x15:
	inc rdi
	inc rsi
.L0x12:
	cmp rdi, r10
	jl .L0x11
.L0x13:
	mov eax, ebx
	jmp ___int_memcmp_pchar.char.size_t__return
___int_memcmp_pchar.char.size_t__return:
	leave
	ret
_char._strchr_pchar.char:
	push rbp
	mov rbp, rsp
	sub rsp, 8
	jmp .L0x8
.L0x7:
	mov rbx, rdi
	mov bl, byte[rbx]
	and rbx, 0xff
	cmp bl, sil
	jne .L0xa
	mov rax, rdi
	jmp ___char._strchr_pchar.char__return
.L0xa:
.L0xb:
	inc rdi
.L0x8:
	mov rbx, rdi
	mov bl, byte[rbx]
	and rbx, 0xff
	test bl, bl
	jnz .L0x7
.L0x9:
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
	jl .L0x0
	mov rdi, qword[rbp-8]
	call _char._get_errstr_pint
	jmp ___char._strerror_plong__return
.L0x0:
	xor r10, r10
	sub r10, qword[rbp-8]
	mov edi, r10d
	call _char._get_errstr_pint
	jmp ___char._strerror_plong__return
.L0x1:
	xor rax, rax
	jmp ___char._strerror_plong__return
___char._strerror_plong__return:
	leave
	ret
main:
	push rbp
	mov rbp, rsp
	sub rsp, 24
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	movsd xmm7, qword[FLT_CONSTANT_1]
	movsd xmm0, xmm7
	call _double_sin_pdouble
	movq rax, xmm0
	mov rsi, rax
	mov rdi, STRING_CONSTANT_143
	call printf
	xor rax, rax
	jmp __main__return
__main__return:
	leave
	ret
	