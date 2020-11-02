
global _char._get_errstr_pint:
global _long___inline__syscall_plong:
global _long_hton64_plong:
global _int_hton32_pint:
global _short_hton16_pshort:
extern malloc
extern calloc
extern realloc
extern free
global _void._mmap_pvoid.size_tintintintoff_t:
global _void._munmap_pvoid.size_t:
global _double_sqrt_pdouble:
global _double_sqrt_pint:
global _long_sqrt_plong:
global _long_pow_plonglong:
global _double_pow_plonglong:
global _double_pow_pdoublelong:
global _long_round_pdouble:
global _long_ceil_pdouble:
global _long_floor_pdouble:
global _long_abs_plong:
global _double_abs_pdouble:
global _long_log_plong:
global _long_log_plonglong:
global _long_log2_plong:
global _double_log2_pdouble:
global _long_divmod_plonglonglong.:
global _int___sprintf_pchar.char.void.:
global _int_sprintf_pchar.char.voidvoidvoidvoid:
extern _ssize_t_read_pfd_tchar.size_t:
extern _ssize_t_write_pfd_tchar.size_t:
extern _fd_t_open_pchar.intmode_t:
extern _int_close_pfd_t:
extern _int_mkdir_pchar.mode_t:
extern _int_rmdir_pchar.:
extern _int_creat_pchar.mode_t:
extern _int_chdir_pchar.:
extern _int_lseek_pfd_tintint:
global _void___printf_pchar.void.:
global _void_printf_pchar.voidvoidvoidvoidvoid:
extern printf
extern printf
extern printf
extern printf
global _void_printf_pchar.:
global _long_fork_p:
global _long_vfork_p:
global _long_execve_pchar.char..char..:
global _long_pause_p:
global _long_waitpid_ppid_tint.int:
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

section .data
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
STRING_CONSTANT_133: db `0123456789abcdef`, 0
STRING_CONSTANT_134: db `False`, 0
STRING_CONSTANT_135: db `True`, 0
STRING_CONSTANT_136: db `%i.%i.%i.%i`, 0
STRING_CONSTANT_137: db `/bin/bash`, 0
STRING_CONSTANT_138: db `PATH=/bin:/usr/bin:/sbin:/usr/sbin`, 0
STRING_CONSTANT_139: db `sudo`, 0
STRING_CONSTANT_140: db `-c`, 0
STRING_CONSTANT_141: db `%s`, 0
STRING_CONSTANT_142: db `%i`, 0
STRING_CONSTANT_143: db `position:%i\nvalue:%i`, 0
STRING_CONSTANT_144: db `%i`, 0
STRING_CONSTANT_145: db `%i\n`, 0
STRING_CONSTANT_146: db `\n%i\n`, 0
STRING_CONSTANT_147: db `\n\n%i\n`, 0
__linux_errstrlist: DQ STRING_CONSTANT_0, STRING_CONSTANT_1, STRING_CONSTANT_2, STRING_CONSTANT_3, STRING_CONSTANT_4, STRING_CONSTANT_5, STRING_CONSTANT_6, STRING_CONSTANT_7, STRING_CONSTANT_8, STRING_CONSTANT_9, STRING_CONSTANT_10, STRING_CONSTANT_11, STRING_CONSTANT_12, STRING_CONSTANT_13, STRING_CONSTANT_14, STRING_CONSTANT_15, STRING_CONSTANT_16, STRING_CONSTANT_17, STRING_CONSTANT_18, STRING_CONSTANT_19, STRING_CONSTANT_20, STRING_CONSTANT_21, STRING_CONSTANT_22, STRING_CONSTANT_23, STRING_CONSTANT_24, STRING_CONSTANT_25, STRING_CONSTANT_26, STRING_CONSTANT_27, STRING_CONSTANT_28, STRING_CONSTANT_29, STRING_CONSTANT_30, STRING_CONSTANT_31, STRING_CONSTANT_32, STRING_CONSTANT_33, STRING_CONSTANT_34, STRING_CONSTANT_35, STRING_CONSTANT_36, STRING_CONSTANT_37, STRING_CONSTANT_38, STRING_CONSTANT_39, STRING_CONSTANT_40, STRING_CONSTANT_41, STRING_CONSTANT_42, STRING_CONSTANT_43, STRING_CONSTANT_44, STRING_CONSTANT_45, STRING_CONSTANT_46, STRING_CONSTANT_47, STRING_CONSTANT_48, STRING_CONSTANT_49, STRING_CONSTANT_50, STRING_CONSTANT_51, STRING_CONSTANT_52, STRING_CONSTANT_53, STRING_CONSTANT_54, STRING_CONSTANT_55, STRING_CONSTANT_56, STRING_CONSTANT_57, STRING_CONSTANT_58, STRING_CONSTANT_59, STRING_CONSTANT_60, STRING_CONSTANT_61, STRING_CONSTANT_62, STRING_CONSTANT_63, STRING_CONSTANT_64, STRING_CONSTANT_65, STRING_CONSTANT_66, STRING_CONSTANT_67, STRING_CONSTANT_68, STRING_CONSTANT_69, STRING_CONSTANT_70, STRING_CONSTANT_71, STRING_CONSTANT_72, STRING_CONSTANT_73, STRING_CONSTANT_74, STRING_CONSTANT_75, STRING_CONSTANT_76, STRING_CONSTANT_77, STRING_CONSTANT_78, STRING_CONSTANT_79, STRING_CONSTANT_80, STRING_CONSTANT_81, STRING_CONSTANT_82, STRING_CONSTANT_83, STRING_CONSTANT_84, STRING_CONSTANT_85, STRING_CONSTANT_86, STRING_CONSTANT_87, STRING_CONSTANT_88, STRING_CONSTANT_89, STRING_CONSTANT_90, STRING_CONSTANT_91, STRING_CONSTANT_92, STRING_CONSTANT_93, STRING_CONSTANT_94, STRING_CONSTANT_95, STRING_CONSTANT_96, STRING_CONSTANT_97, STRING_CONSTANT_98, STRING_CONSTANT_99, STRING_CONSTANT_100, STRING_CONSTANT_101, STRING_CONSTANT_102, STRING_CONSTANT_103, STRING_CONSTANT_104, STRING_CONSTANT_105, STRING_CONSTANT_106, STRING_CONSTANT_107, STRING_CONSTANT_108, STRING_CONSTANT_109, STRING_CONSTANT_110, STRING_CONSTANT_111, STRING_CONSTANT_112, STRING_CONSTANT_113, STRING_CONSTANT_114, STRING_CONSTANT_115, STRING_CONSTANT_116, STRING_CONSTANT_117, STRING_CONSTANT_118, STRING_CONSTANT_119, STRING_CONSTANT_120, STRING_CONSTANT_121, STRING_CONSTANT_122, STRING_CONSTANT_123, STRING_CONSTANT_124, STRING_CONSTANT_125, STRING_CONSTANT_126, STRING_CONSTANT_127, STRING_CONSTANT_128, STRING_CONSTANT_129, STRING_CONSTANT_130, STRING_CONSTANT_131
errno: DQ 0
nullterm: DB 0
INLINE_SYSCALL: DQ 0
M_MINZERO_MEM: dq 0x0.0p+0
__numbercharactersbase1016: DQ "0123456789abcdef"
rand_next: DQ 1
__systembashpath: DQ "/bin/bash"
__emptyenv: DQ STRING_CONSTANT_138, 0
__systemcallargvconst: DQ STRING_CONSTANT_139, STRING_CONSTANT_140, 0
section .bss
align 16
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
mov r10d, 131
mov ebx, dword[rbp-8]
cmp ebx, r10d
setl bl
xor r11d, r11d
mov r10d, dword[rbp-8]
cmp r10d, r11d
setge r10b
and bl, r10b
mov al, bl
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
mov rax, rbx
jmp ___char._get_errstr_pint__return
___char._get_errstr_pint__return:
leave
ret
;[ function long __inline__syscall( [[long call @ 8]] ) ]

__inline__syscall:
push rbp
mov rbp, rsp
sub rsp, 16
;Load Parameter: [long call @ 8]
mov [rbp-8], rdi
syscall
____inline__syscall__return:
leave
ret
;[ function long hton64( [[long x @ 8]] ) ]

_long_hton64_plong:
push rbp
mov rbp, rsp
sub rsp, 16
;Load Parameter: [long x @ 8]
mov [rbp-8], rdi
bswap rdi
    mov rax, rdi
___long_hton64_plong__return:
leave
ret
;[ function int hton32( [[int x @ 8]] ) ]

_int_hton32_pint:
push rbp
mov rbp, rsp
sub rsp, 16
;Load Parameter: [int x @ 8]
mov [rbp-8], rdi
xor rax,rax
        bswap edi
        mov eax, edi
___int_hton32_pint__return:
leave
ret
;[ function short hton16( [[short x @ 8]] ) ]

_short_hton16_pshort:
push rbp
mov rbp, rsp
sub rsp, 16
;Load Parameter: [short x @ 8]
mov [rbp-8], rdi
xor rax, rax
    bswap edi
    shr edi, 16
    mov eax, edi
___short_hton16_pshort__return:
leave
ret
;[ function void. malloc( [[size_t size @ 0]] ) ]


;[ function void. calloc( [[size_t size @ 0]] ) ]


;[ function void. realloc( [[void. og @ 0], [size_t newsize @ 0]] ) ]


;[ function void free( [[void. ptr @ 0]] ) ]


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
mov r10d, 32
mov rbx, qword[rbp-24]
mov r11, r10
xor rdx, rdx
mov rax, rbx
idiv r11
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
jmp _LFORCMP_0x3
_LFORTOP_0x2:
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
_LFORUPDATE_0x4:
;[[ id : i]]
;[[ id : i]]
;[[ id : i], [ + : +], [ int : 4]]
mov r10d, dword[rbp-48]
add r10d, 4
mov dword[rbp-48], r10d
_LFORCMP_0x3:
;[[ id : i], [ < : <], [ id : avxcount]]
mov r10d, dword[rbp-48]
mov rbx, qword[rbp-40]
mov r11, r10
cmp r11, rbx
setl r11b
mov al, r11b
and al, 1
jnz _LFORTOP_0x2
_LFOREND_0x5:
;[[ id : offset], [ != : !=], [ int : 0]]
mov ebx, dword[rbp-32]
test ebx, ebx
setnz bl
mov al, bl
and al, 1
jz _LIFPOST_0x6
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
;[[ fn(x) : [ function void memcpy( [[void. dest @ 8], [void. source @ 16], [size_t bytes @ 24]] ) ] ]]
jmp _LIFELSE_0x7
_LIFPOST_0x6:
_LIFELSE_0x7:
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
;[ function void. mmap( [[void. addr @ 8], [size_t length @ 16], [int prot @ 24], [int flags @ 32], [int fd @ 40], [off_t offset @ 48]] ) ]

_void._mmap_pvoid.size_tintintintoff_t:
push rbp
mov rbp, rsp
sub rsp, 56
;Load Parameter: [void. addr @ 8]
mov [rbp-8], rdi
;Load Parameter: [size_t length @ 16]
mov [rbp-16], rsi
;Load Parameter: [int prot @ 24]
mov [rbp-24], rdx
;Load Parameter: [int flags @ 32]
mov [rbp-32], rcx
;Load Parameter: [int fd @ 40]
mov [rbp-40], r8
;Load Parameter: [off_t offset @ 48]
mov [rbp-48], r9
mov rax, 9
    syscall
___void._mmap_pvoid.size_tintintintoff_t__return:
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
;[[ fn(x) : [ function long pow( [[long base @ 8], [long exp @ 16]] ) ] ]]
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
cvttsd2si rax, xmm0
  inc rax
___long_ceil_pdouble__return:
leave
ret
;[ function long floor( [[double x @ 8]] ) ]

_long_floor_pdouble:
push rbp
mov rbp, rsp
sub rsp, 16
;Load Parameter: [double x @ 8]
movsd [rbp-8], xmm0
cvttsd2si rax, xmm0
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
movsd xmm1, xmm0
  mov rax, 1
  movq xmm2, rax
  xorpd xmm1, xmm2
  andpd xmm0, xmm1
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
xor rbx, rbx
  mov rax, rdi
  mov rcx, 10
  _int_log_pint_flp:
  xor rdx, rdx
  div rcx
  test rax, rax
  jnz _int_log_pint_inc
  jmp _int_log_pint_end
  _int_log_pint_inc:
  inc rbx
  jmp _int_log_pint_flp
  
  _int_log_pint_end:
  mov rax, rbx
___long_log_plong__return:
leave
ret
;[ function long log( [[long n @ 8], [long b @ 16]] ) ]

_long_log_plonglong:
push rbp
mov rbp, rsp
sub rsp, 24
;Load Parameter: [long n @ 8]
mov [rbp-8], rdi
;Load Parameter: [long b @ 16]
mov [rbp-16], rsi
xor rbx, rbx
  mov rax, rdi
  _int_log_pintint_flp:
  xor rdx, rdx
  div rsi
  test rax, rax
  jnz _int_log_pintint_inc
  jmp _int_log_pintint_end
  _int_log_pintint_inc:
  inc rbx
  jmp _int_log_pintint_flp
  _int_log_pintint_end:
  mov rax, rbx
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
  _long_lop2_plong_flp:
  sar rdi, 1
  inc rax
  test rdi, rdi
  jnz _long_lop2_plong_flp
  dec rax
___long_log2_plong__return:
leave
ret
;[ function double log2( [[double n @ 8]] ) ]

_double_log2_pdouble:
push rbp
mov rbp, rsp
sub rsp, 16
;Load Parameter: [double n @ 8]
movsd [rbp-8], xmm0
movq rax, xmm0
  shl rax, 1
  shr rax, 53
  shl rax, 53
  cvtsi2sd xmm1, rax
  mov rax, 2
  cvtsi2sd xmm3, rax
___double_log2_pdouble__return:
leave
ret
;[ function long divmod( [[long dividend @ 8], [long divisor @ 16], [long. modulus @ 24]] ) ]

_long_divmod_plonglonglong.:
push rbp
mov rbp, rsp
sub rsp, 32
;Load Parameter: [long dividend @ 8]
mov [rbp-8], rdi
;Load Parameter: [long divisor @ 16]
mov [rbp-16], rsi
;Load Parameter: [long. modulus @ 24]
mov [rbp-24], rdx
mov rbx, rdx
  xor rdx, rdx
  mov rax, rdi
  div rsi
  mov [rbx], rdx
___long_divmod_plonglonglong.__return:
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
sub rsp, 40
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
jmp _LWHILECMP_0x9
_LWHILESTART_0x8:
;[[ @ : @], [ id : str], [ == : ==], [ id : c]]
mov r10, qword[rbp-8]
and r11, 0xff
mov r11b, byte[r10]
mov r10b, byte[rbp-16]
cmp r11b, r10b
sete r11b
mov al, r11b
and al, 1
jz _LIFPOST_0xb
;[[ id : str]]
mov r10, qword[rbp-8]
mov rax, r10
jmp ___char._memchr_pchar.charsize_t__return
jmp _LIFELSE_0xc
_LIFPOST_0xb:
_LIFELSE_0xc:
;[[ id : str], [ ++ : ++]]
inc qword[rbp-8]
_LWHILECMP_0x9:
;[[ id : str], [ < : <], [ id : finalptr]]
mov r11, qword[rbp-8]
mov r10, rbx
cmp r11, r10
setl r11b
mov al, r11b
and al, 1
jnz _LWHILESTART_0x8
_LWHILEEND_0xa:
;[[ int : 0]]
xor eax, eax
jmp ___char._memchr_pchar.charsize_t__return
___char._memchr_pchar.charsize_t__return:
leave
ret
;[ function int memcmp( [[char. str1 @ 8], [char. str2 @ 16], [size_t n @ 24]] ) ]

_int_memcmp_pchar.char.size_t:
push rbp
mov rbp, rsp
sub rsp, 48
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
jmp _LWHILECMP_0xe
_LWHILESTART_0xd:
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
jz _LIFPOST_0x10
;[[ id : value], [ -- : --]]
dec ebx
jmp _LIFELSE_0x11
_LIFPOST_0x10:
;[[ id : value], [ ++ : ++]]
inc ebx
_LIFELSE_0x11:
;[[ id : str1], [ ++ : ++]]
inc qword[rbp-8]
;[[ id : str2], [ ++ : ++]]
inc qword[rbp-16]
_LWHILECMP_0xe:
;[[ id : str1], [ < : <], [ id : maxstr]]
mov r12, qword[rbp-8]
mov r11, r10
cmp r12, r11
setl r12b
mov al, r12b
and al, 1
jnz _LWHILESTART_0xd
_LWHILEEND_0xf:
;[[ id : value]]
mov r11d, ebx
mov eax, r11d
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
jmp _LWHILECMP_0x13
_LWHILESTART_0x12:
;[[ @ : @], [ id : str], [ == : ==], [ id : c]]
mov rbx, qword[rbp-8]
and r10, 0xff
mov r10b, byte[rbx]
mov bl, byte[rbp-16]
cmp r10b, bl
sete r10b
mov al, r10b
and al, 1
jz _LIFPOST_0x15
;[[ id : str]]
mov rbx, qword[rbp-8]
mov rax, rbx
jmp ___char._strchr_pchar.char__return
jmp _LIFELSE_0x16
_LIFPOST_0x15:
_LIFELSE_0x16:
;[[ id : str], [ ++ : ++]]
inc qword[rbp-8]
_LWHILECMP_0x13:
;[[ @ : @], [ id : str], [ != : !=], [ int : 0]]
mov rbx, qword[rbp-8]
and r10, 0xff
mov r10b, byte[rbx]
test r10b, r10b
setnz r10b
mov al, r10b
and al, 1
jnz _LWHILESTART_0x12
_LWHILEEND_0x14:
;[[ int : 0]]
xor eax, eax
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
xor r10d, r10d
mov rbx, qword[rbp-8]
mov r11, r10
cmp rbx, r11
setge bl
mov al, bl
and al, 1
jz _LIFPOST_0x17
;[[ id : errnum]]
mov rdi, qword[rbp-8]
and rdi, 0xffffffff
xor rax, rax
call _char._get_errstr_pint
;[[ fn(x) : [ function char. get_errstr( [[int err @ 8]] ) ] ]]
jmp ___char._strerror_plong__return
jmp _LIFELSE_0x18
_LIFPOST_0x17:
;[[ int : 0], [ - : -], [ id : errnum]]
xor r10d, r10d
mov rbx, qword[rbp-8]
mov r11, r10
sub r11, rbx
mov edi, r11d
and rdi, 0xffffffff
xor rax, rax
call _char._get_errstr_pint
;[[ fn(x) : [ function char. get_errstr( [[int err @ 8]] ) ] ]]
jmp ___char._strerror_plong__return
_LIFELSE_0x18:
;[[ int : 0]]
xor eax, eax
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
jz _LIFPOST_0x19
;[[ @ : @], [ id : buffer]]
mov rbx, qword[rbp-16]
mov r10, rbx
;[[ @ : @], [ id : buffer]]
mov rbx, qword[rbp-16]
mov r10, rbx
;[[ char : 48]]
mov bl, 48
mov byte[r10], bl
;[[ int : 1]]
mov eax, 1
jmp ___long_toStr_plongchar.boolshort__return
jmp _LIFELSE_0x1a
_LIFPOST_0x19:
_LIFELSE_0x1a:
;[[ int : 0]]
mov byte[rbp-40], 0
;[[ id : val], [ < : <], [ int : 0], [ && : &&], [ id : signed]]
xor r10d, r10d
mov rbx, qword[rbp-8]
mov r11, r10
cmp rbx, r11
setl bl
mov r10b, byte[rbp-24]
and bl, r10b
mov al, bl
and al, 1
jz _LIFPOST_0x1b
;[[ @ : @], [ id : buffer]]
mov rbx, qword[rbp-16]
mov r10, rbx
;[[ @ : @], [ id : buffer]]
mov rbx, qword[rbp-16]
mov r10, rbx
;[[ char : 45]]
mov bl, 45
mov byte[r10], bl
;[[ id : buffer]]
;[[ id : buffer]]
;[[ int : 1]]
mov ebx, 1
mov r10, qword[rbp-16]
add r10, rbx
mov qword[rbp-16], r10
;[[ id : val]]
;[[ id : val]]
;[[ int : 0], [ - : -], [ id : val]]
xor r11d, r11d
mov r10, qword[rbp-8]
mov r12, r11
sub r12, r10
mov qword[rbp-8], r12
;[[ id : signspace]]
;[[ id : signspace]]
;[[ int : 1]]
mov ebx, 1
mov byte[rbp-40], bl
jmp _LIFELSE_0x1c
_LIFPOST_0x1b:
_LIFELSE_0x1c:
;[[ int : 64]]
mov edx, 64
;[[ int : 0]]
xor esi, esi
and rsi, 0xff
;[[ & : &], [ id : tmpbuf]]
lea rbx, [rbp-112]
mov rdi, rbx
xor rax, rax
call _void_memset_pvoid.ucharsize_t
;[[ fn(x) : [ function void memset( [[void. dest @ 8], [uchar value @ 16], [size_t bytes @ 24]] ) ] ]]
;[[ int : 1]]
mov dword[rbp-120], 1
jmp _LWHILECMP_0x1e
_LWHILESTART_0x1d:
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
call _long_divmod_plonglonglong.
mov qword[rbp-8], rax
;[[ fn(x) : [ function long divmod( [[long dividend @ 8], [long divisor @ 16], [long. modulus @ 24]] ) ] ]]
;[[ id : tmpbuf], [ [ : [], [ id : len], [ - : -], [ int : 1], [ ] : ]]]
mov ebx, dword[rbp-120]
dec ebx
lea r10, [rbp-112] 
and rbx, 0xffffffff
lea r10, [r10+rbx*1]
;[[ id : tmpbuf], [ [ : [], [ id : len], [ - : -], [ int : 1], [ ] : ]]]
mov ebx, dword[rbp-120]
dec ebx
lea r10, [rbp-112] 
and rbx, 0xffffffff
lea r10, [r10+rbx*1]
;[[ id : __numbercharactersbase1016], [ [ : [], [ id : mod], [ ] : ]]]
mov r12b, byte[rbp-128]
mov r11, __numbercharactersbase1016
and r12, 0xff
lea r11, [r11+r12*1]
mov r11b, byte[r11]
and r11, 0xff
mov byte[r10], r11b
;[[ id : len]]
;[[ id : len]]
;[[ int : 1]]
mov ebx, 1
mov r11d, dword[rbp-120]
add r11d, ebx
mov dword[rbp-120], r11d
_LWHILECMP_0x1e:
;[[ id : val], [ != : !=], [ int : 0]]
mov rbx, qword[rbp-8]
test rbx, rbx
setnz bl
mov al, bl
and al, 1
jnz _LWHILESTART_0x1d
_LWHILEEND_0x1f:
;[[ id : len]]
mov ebx, dword[rbp-120]
mov dword[rbp-136], ebx
jmp _LFORCMP_0x21
_LFORTOP_0x20:
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
mov byte[rbx], r12b
_LFORUPDATE_0x22:
;[[ id : i], [ -- : --]]
dec dword[rbp-136]
_LFORCMP_0x21:
;[[ id : i], [ >= : >=], [ int : 0]]
xor r10d, r10d
mov ebx, dword[rbp-136]
cmp ebx, r10d
setge bl
mov al, bl
and al, 1
jnz _LFORTOP_0x20
_LFOREND_0x23:
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
mov ecx, 10
and rcx, 0xffff
;[[ int : 1]]
mov edx, 1
and rdx, 0xff
;[[ id : buffer]]
mov rbx, qword[rbp-16]
mov rsi, rbx
;[[ id : integral]]
mov rbx, qword[rbp-32]
mov rdi, rbx
xor rax, rax
call _long_toStr_plongchar.boolshort
;[[ fn(x) : [ function long toStr( [[long val @ 8], [char. buffer @ 16], [bool signed @ 24], [short base @ 32]] ) ] ]]
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
;[[ fn(x) : [ function double abs( [[double x @ 8]] ) ] ]]
movq xmm7, rax
movsd qword[rbp-8], xmm7
;[[ id : val]]
;[[ id : val]]
;[[ id : integral]]
cvtsi2sd xmm7, qword[rbp-32]
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
mov r10, rbx
;[[ @ : @], [ id : buffer]]
mov rbx, qword[rbp-16]
mov r10, rbx
;[[ char : 46]]
mov bl, 46
mov byte[r10], bl
;[[ id : buffer], [ ++ : ++]]
inc qword[rbp-16]
;[[ id : l]]
;[[ id : l]]
;[[ int : 10]]
mov ecx, 10
and rcx, 0xffff
;[[ int : 0]]
xor edx, edx
and rdx, 0xff
;[[ id : buffer]]
mov r10, qword[rbp-16]
mov rsi, r10
;[[ id : val]]
movsd xmm7, qword[rbp-8]
movsd xmm0, xmm7
mov rax, 1
call _long_round_pdouble
mov rdi, rax
;[[ fn(x) : [ function long round( [[double x @ 8]] ) ] ]]
xor rax, rax
call _long_toStr_plongchar.boolshort
mov rbx, rax
;[[ fn(x) : [ function long toStr( [[long val @ 8], [char. buffer @ 16], [bool signed @ 24], [short base @ 32]] ) ] ]]
mov r11, qword[rbp-40]
add r11, rbx
mov qword[rbp-40], r11
;[[ id : l]]
mov rbx, qword[rbp-40]
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
jz _LIFPOST_0x24
;[[ int : 0]]
xor eax, eax
jmp ___int___sprintf_pchar.char.void.__return
jmp _LIFELSE_0x25
_LIFPOST_0x24:
_LIFELSE_0x25:
jmp _LWHILECMP_0x27
_LWHILESTART_0x26:
;[[ @ : @], [ id : fmt], [ != : !=], [ char : 37]]
mov rbx, qword[rbp-16]
and r10, 0xff
mov r10b, byte[rbx]
mov bl, 37
cmp r10b, bl
setne r10b
mov al, r10b
and al, 1
jz _LIFPOST_0x29
;[[ @ : @], [ id : str]]
mov rbx, qword[rbp-8]
mov r10, rbx
;[[ @ : @], [ id : str]]
mov rbx, qword[rbp-8]
mov r10, rbx
;[[ @ : @], [ id : fmt]]
mov r11, qword[rbp-16]
and r12, 0xff
mov r12b, byte[r11]
mov byte[r10], r12b
jmp _LIFELSE_0x2a
_LIFPOST_0x29:
;[[ id : fmt]]
;[[ id : fmt]]
;[[ int : 1]]
mov ebx, 1
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
je _LSWITCHCASE_0x2c
cmp bl, 99
je _LSWITCHCASE_0x2d
cmp bl, 120
je _LSWITCHCASE_0x2e
cmp bl, 111
je _LSWITCHCASE_0x2f
cmp bl, 117
je _LSWITCHCASE_0x30
cmp bl, 115
je _LSWITCHCASE_0x31
cmp bl, 98
je _LSWITCHCASE_0x32
cmp bl, 100
je _LSWITCHCASE_0x35
cmp bl, 102
je _LSWITCHCASE_0x36
jmp _LSWITCHEND_0x2b
_LSWITCHCASE_0x2c:
;[[ ( : (], [ id : args], [ [ : [], [ id : argc], [ ] : ]], [ ) : )]]
mov r11d, dword[rbp-32]
mov r10, qword[rbp-24]
and r11, 0xffffffff
lea r10, [r10+r11*8]
mov r10, qword[r10]
mov qword[rbp-56], r10
;[[ int : 10]]
mov ecx, 10
and rcx, 0xffff
;[[ int : 1]]
mov edx, 1
and rdx, 0xff
;[[ id : str]]
mov r10, qword[rbp-8]
mov rsi, r10
;[[ id : num]]
mov r10, qword[rbp-56]
mov rdi, r10
xor rax, rax
call _long_toStr_plongchar.boolshort
;[[ fn(x) : [ function long toStr( [[long val @ 8], [char. buffer @ 16], [bool signed @ 24], [short base @ 32]] ) ] ]]
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
jmp _LSWITCHEND_0x2b
_LSWITCHCASE_0x2d:
;[[ $ : char], [ id : args], [ [ : [], [ id : argc], [ ] : ]]]
mov r11d, dword[rbp-32]
mov r10, qword[rbp-24]
and r11, 0xffffffff
lea r10, [r10+r11*8]
mov r10, qword[r10]
mov r11, r10
and r12b, 0xff
mov byte[rbp-72], r11b
;[[ @ : @], [ id : str]]
mov r10, qword[rbp-8]
mov r11, r10
;[[ @ : @], [ id : str]]
mov r10, qword[rbp-8]
mov r11, r10
;[[ id : cf]]
mov r12b, byte[rbp-72]
mov byte[r11], r12b
jmp _LSWITCHEND_0x2b
_LSWITCHCASE_0x2e:
;[[ ( : (], [ id : args], [ [ : [], [ id : argc], [ ] : ]], [ ) : )]]
mov r11d, dword[rbp-32]
mov r10, qword[rbp-24]
and r11, 0xffffffff
lea r10, [r10+r11*8]
mov r10, qword[r10]
mov qword[rbp-80], r10
;[[ int : 16]]
mov ecx, 16
and rcx, 0xffff
;[[ int : 0]]
xor edx, edx
and rdx, 0xff
;[[ id : str]]
mov r10, qword[rbp-8]
mov rsi, r10
;[[ id : numx]]
mov r10, qword[rbp-80]
mov rdi, r10
xor rax, rax
call _long_toStr_plongchar.boolshort
;[[ fn(x) : [ function long toStr( [[long val @ 8], [char. buffer @ 16], [bool signed @ 24], [short base @ 32]] ) ] ]]
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
jmp _LSWITCHEND_0x2b
_LSWITCHCASE_0x2f:
;[[ ( : (], [ id : args], [ [ : [], [ id : argc], [ ] : ]], [ ) : )]]
mov r11d, dword[rbp-32]
mov r10, qword[rbp-24]
and r11, 0xffffffff
lea r10, [r10+r11*8]
mov r10, qword[r10]
mov qword[rbp-96], r10
;[[ int : 8]]
mov ecx, 8
and rcx, 0xffff
;[[ int : 0]]
xor edx, edx
and rdx, 0xff
;[[ id : str]]
mov r10, qword[rbp-8]
mov rsi, r10
;[[ id : numo]]
mov r10, qword[rbp-96]
mov rdi, r10
xor rax, rax
call _long_toStr_plongchar.boolshort
;[[ fn(x) : [ function long toStr( [[long val @ 8], [char. buffer @ 16], [bool signed @ 24], [short base @ 32]] ) ] ]]
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
jmp _LSWITCHEND_0x2b
_LSWITCHCASE_0x30:
;[[ ( : (], [ id : args], [ [ : [], [ id : argc], [ ] : ]], [ ) : )]]
mov r11d, dword[rbp-32]
mov r10, qword[rbp-24]
and r11, 0xffffffff
lea r10, [r10+r11*8]
mov r10, qword[r10]
mov qword[rbp-112], r10
;[[ int : 10]]
mov ecx, 10
and rcx, 0xffff
;[[ int : 0]]
xor edx, edx
and rdx, 0xff
;[[ id : str]]
mov r10, qword[rbp-8]
mov rsi, r10
;[[ id : unum]]
mov r10, qword[rbp-112]
mov rdi, r10
xor rax, rax
call _long_toStr_plongchar.boolshort
;[[ fn(x) : [ function long toStr( [[long val @ 8], [char. buffer @ 16], [bool signed @ 24], [short base @ 32]] ) ] ]]
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
jmp _LSWITCHEND_0x2b
_LSWITCHCASE_0x31:
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
;[[ fn(x) : [ function int strcpy( [[char. dest @ 8], [char. source @ 16]] ) ] ]]
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
jmp _LSWITCHEND_0x2b
_LSWITCHCASE_0x32:
;[[ id : args], [ [ : [], [ id : argc], [ ] : ]]]
mov r11d, dword[rbp-32]
mov r10, qword[rbp-24]
and r11, 0xffffffff
lea r10, [r10+r11*8]
mov r10, qword[r10]
mov byte[rbp-136], r10b
;[[ id : STRING_CONSTANT_134]]
mov qword[rbp-144], STRING_CONSTANT_134
;[[ id : b]]
mov r10b, byte[rbp-136]
mov al, r10b
and al, 1
jz _LIFPOST_0x33
;[[ id : boolean_string]]
;[[ id : boolean_string]]
;[[ id : STRING_CONSTANT_135]]
mov qword[rbp-144], STRING_CONSTANT_135
jmp _LIFELSE_0x34
_LIFPOST_0x33:
_LIFELSE_0x34:
;[[ id : boolean_string]]
mov r10, qword[rbp-144]
mov rsi, r10
;[[ id : str]]
mov r10, qword[rbp-8]
mov rdi, r10
xor rax, rax
call _int_strcpy_pchar.char.
;[[ fn(x) : [ function int strcpy( [[char. dest @ 8], [char. source @ 16]] ) ] ]]
mov dword[rbp-152], eax
;[[ id : str]]
;[[ id : str]]
;[[ id : bsize]]
mov r10d, dword[rbp-152]
mov r11, qword[rbp-8]
add r11, r10
mov qword[rbp-8], r11
jmp _LSWITCHEND_0x2b
_LSWITCHCASE_0x35:
;[[ id : args], [ [ : [], [ id : argc], [ ] : ]]]
mov r11d, dword[rbp-32]
mov r10, qword[rbp-24]
and r11, 0xffffffff
lea r10, [r10+r11*8]
mov r10, qword[r10]
movq xmm7, r10
movsd qword[rbp-160], xmm7
;[[ int : 1000000000]]
mov esi, 1000000000
;[[ id : str]]
mov r10, qword[rbp-8]
mov rdi, r10
;[[ id : d]]
movsd xmm7, qword[rbp-160]
movsd xmm0, xmm7
mov rax, 1
call _long_toStr_pdoublechar.long
;[[ fn(x) : [ function long toStr( [[double val @ 8], [char. buffer @ 16], [long multiplier @ 24]] ) ] ]]
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
jmp _LSWITCHEND_0x2b
_LSWITCHCASE_0x36:
;[[ id : args], [ [ : [], [ id : argc], [ ] : ]]]
mov r11d, dword[rbp-32]
mov r10, qword[rbp-24]
and r11, 0xffffffff
lea r10, [r10+r11*8]
mov r10, qword[r10]
movq xmm7, r10
movsd qword[rbp-176], xmm7
;[[ int : 10000000]]
mov esi, 10000000
;[[ id : str]]
mov r10, qword[rbp-8]
mov rdi, r10
;[[ id : f]]
movsd xmm7, qword[rbp-176]
movsd xmm0, xmm7
mov rax, 1
call _long_toStr_pdoublechar.long
;[[ fn(x) : [ function long toStr( [[double val @ 8], [char. buffer @ 16], [long multiplier @ 24]] ) ] ]]
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
jmp _LSWITCHEND_0x2b
_LSWITCHEND_0x2b:
;[[ id : argc]]
;[[ id : argc]]
;[[ int : 1]]
mov ebx, 1
mov r11d, dword[rbp-32]
add r11d, ebx
mov dword[rbp-32], r11d
_LIFELSE_0x2a:
;[[ id : fmt]]
;[[ id : fmt]]
;[[ int : 1]]
mov ebx, 1
mov r10, qword[rbp-16]
add r10, rbx
mov qword[rbp-16], r10
;[[ id : str]]
;[[ id : str]]
;[[ int : 1]]
mov ebx, 1
mov r10, qword[rbp-8]
add r10, rbx
mov qword[rbp-8], r10
_LWHILECMP_0x27:
;[[ @ : @], [ id : fmt], [ != : !=], [ int : 0]]
mov rbx, qword[rbp-16]
and r10, 0xff
mov r10b, byte[rbx]
test r10b, r10b
setnz r10b
mov al, r10b
and al, 1
jnz _LWHILESTART_0x26
_LWHILEEND_0x28:
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
mov edi, 32
xor rax, rax
call malloc
;[[ fn(x) : [ function void. malloc( [[size_t size @ 0]] ) ] ]]
mov qword[rbp-56], rax
;[[ id : args], [ [ : [], [ int : 0], [ ] : ]]]
mov rbx, qword[rbp-56]
;[[ id : args], [ [ : [], [ int : 0], [ ] : ]]]
mov rbx, qword[rbp-56]
;[[ id : arg1]]
mov r11, qword[rbp-24]
mov qword[rbx], r11
;[[ id : args], [ [ : [], [ int : 1], [ ] : ]]]
mov r10d, 1
mov rbx, qword[rbp-56]
and r10, 0xffffffff
lea rbx, [rbx+r10*8]
;[[ id : args], [ [ : [], [ int : 1], [ ] : ]]]
mov r10d, 1
mov rbx, qword[rbp-56]
and r10, 0xffffffff
lea rbx, [rbx+r10*8]
;[[ id : arg2]]
mov r11, qword[rbp-32]
mov qword[rbx], r11
;[[ id : args], [ [ : [], [ int : 2], [ ] : ]]]
mov r10d, 2
mov rbx, qword[rbp-56]
and r10, 0xffffffff
lea rbx, [rbx+r10*8]
;[[ id : args], [ [ : [], [ int : 2], [ ] : ]]]
mov r10d, 2
mov rbx, qword[rbp-56]
and r10, 0xffffffff
lea rbx, [rbx+r10*8]
;[[ id : arg3]]
mov r11, qword[rbp-40]
mov qword[rbx], r11
;[[ id : args], [ [ : [], [ int : 3], [ ] : ]]]
mov r10d, 3
mov rbx, qword[rbp-56]
and r10, 0xffffffff
lea rbx, [rbx+r10*8]
;[[ id : args], [ [ : [], [ int : 3], [ ] : ]]]
mov r10d, 3
mov rbx, qword[rbp-56]
and r10, 0xffffffff
lea rbx, [rbx+r10*8]
;[[ id : arg4]]
mov r11, qword[rbp-48]
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
;[[ fn(x) : [ function int __sprintf( [[char. str @ 8], [char. fmt @ 16], [void. args @ 24]] ) ] ]]
mov dword[rbp-64], eax
;[[ id : args]]
mov rbx, qword[rbp-56]
mov rdi, rbx
xor rax, rax
call free
;[[ fn(x) : [ function void free( [[void. ptr @ 0]] ) ] ]]
;[[ id : l]]
mov ebx, dword[rbp-64]
mov eax, ebx
jmp ___int_sprintf_pchar.char.voidvoidvoidvoid__return
___int_sprintf_pchar.char.voidvoidvoidvoid__return:
leave
ret
;[ function ssize_t read( [[fd_t fd @ 0], [char. buf @ 0], [size_t count @ 0]] ) ]


;[ function ssize_t write( [[fd_t fd @ 0], [char. buf @ 0], [size_t count @ 0]] ) ]


;[ function fd_t open( [[char. fname @ 0], [int flags @ 0], [mode_t mode @ 0]] ) ]


;[ function int close( [[fd_t fd @ 0]] ) ]


;[ function int mkdir( [[char. pathname @ 0], [mode_t mode @ 0]] ) ]


;[ function int rmdir( [[char. pathname @ 0]] ) ]


;[ function int creat( [[char. pathname @ 0], [mode_t mode @ 0]] ) ]


;[ function int chdir( [[char. pathname @ 0]] ) ]


;[ function int lseek( [[fd_t fd @ 0], [int offset @ 0], [int whence @ 0]] ) ]


;[ function void __printf( [[char. fmt @ 8], [void. args @ 16]] ) ]

_void___printf_pchar.void.:
push rbp
mov rbp, rsp
sub rsp, 40
;Load Parameter: [char. fmt @ 8]
mov [rbp-8], rdi
;Load Parameter: [void. args @ 16]
mov [rbp-16], rsi
;[[ int : 100000]]
mov edi, 100000
xor rax, rax
call malloc
;[[ fn(x) : [ function void. malloc( [[size_t size @ 0]] ) ] ]]
mov qword[rbp-24], rax
;[[ id : args]]
mov rbx, qword[rbp-16]
mov rdx, rbx
;[[ id : fmt]]
mov rbx, qword[rbp-8]
mov rsi, rbx
;[[ id : normform]]
mov rbx, qword[rbp-24]
mov rdi, rbx
xor rax, rax
call _int___sprintf_pchar.char.void.
;[[ fn(x) : [ function int __sprintf( [[char. str @ 8], [char. fmt @ 16], [void. args @ 24]] ) ] ]]
mov dword[rbp-32], eax
;[[ id : l]]
mov edx, dword[rbp-32]
;[[ id : normform]]
mov rbx, qword[rbp-24]
mov rsi, rbx
;[[ int : 1]]
mov edi, 1
and rdi, 0xffffffff
xor rax, rax
call _ssize_t_write_pfd_tchar.size_t
;[[ fn(x) : [ function ssize_t write( [[fd_t fd @ 0], [char. buf @ 0], [size_t count @ 0]] ) ] ]]
;[[ id : normform]]
mov rdi, qword[rbp-24]
xor rax, rax
call free
;[[ fn(x) : [ function void free( [[void. ptr @ 0]] ) ] ]]
___void___printf_pchar.void.__return:
leave
ret
;[ function void printf( [[char. fmt @ 8], [void arg1 @ 16], [void arg2 @ 24], [void arg3 @ 32], [void arg4 @ 40], [void arg5 @ 48]] ) ]

printf:
push rbp
mov rbp, rsp
sub rsp, 64
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
;[[ int : 6], [ * : *], [ id : void]]
mov edi, 48
xor rax, rax
call malloc
;[[ fn(x) : [ function void. malloc( [[size_t size @ 0]] ) ] ]]
mov qword[rbp-56], rax
;[[ id : args], [ [ : [], [ int : 0], [ ] : ]]]
mov rbx, qword[rbp-56]
;[[ id : args], [ [ : [], [ int : 0], [ ] : ]]]
mov rbx, qword[rbp-56]
;[[ id : arg1]]
mov r11, qword[rbp-16]
mov qword[rbx], r11
;[[ id : args], [ [ : [], [ int : 1], [ ] : ]]]
mov r10d, 1
mov rbx, qword[rbp-56]
and r10, 0xffffffff
lea rbx, [rbx+r10*8]
;[[ id : args], [ [ : [], [ int : 1], [ ] : ]]]
mov r10d, 1
mov rbx, qword[rbp-56]
and r10, 0xffffffff
lea rbx, [rbx+r10*8]
;[[ id : arg2]]
mov r11, qword[rbp-24]
mov qword[rbx], r11
;[[ id : args], [ [ : [], [ int : 2], [ ] : ]]]
mov r10d, 2
mov rbx, qword[rbp-56]
and r10, 0xffffffff
lea rbx, [rbx+r10*8]
;[[ id : args], [ [ : [], [ int : 2], [ ] : ]]]
mov r10d, 2
mov rbx, qword[rbp-56]
and r10, 0xffffffff
lea rbx, [rbx+r10*8]
;[[ id : arg3]]
mov r11, qword[rbp-32]
mov qword[rbx], r11
;[[ id : args], [ [ : [], [ int : 3], [ ] : ]]]
mov r10d, 3
mov rbx, qword[rbp-56]
and r10, 0xffffffff
lea rbx, [rbx+r10*8]
;[[ id : args], [ [ : [], [ int : 3], [ ] : ]]]
mov r10d, 3
mov rbx, qword[rbp-56]
and r10, 0xffffffff
lea rbx, [rbx+r10*8]
;[[ id : arg4]]
mov r11, qword[rbp-40]
mov qword[rbx], r11
;[[ id : args], [ [ : [], [ int : 4], [ ] : ]]]
mov r10d, 4
mov rbx, qword[rbp-56]
and r10, 0xffffffff
lea rbx, [rbx+r10*8]
;[[ id : args], [ [ : [], [ int : 4], [ ] : ]]]
mov r10d, 4
mov rbx, qword[rbp-56]
and r10, 0xffffffff
lea rbx, [rbx+r10*8]
;[[ id : arg5]]
mov r11, qword[rbp-48]
mov qword[rbx], r11
;[[ id : args]]
mov rbx, qword[rbp-56]
mov rsi, rbx
;[[ id : fmt]]
mov rbx, qword[rbp-8]
mov rdi, rbx
xor rax, rax
call _void___printf_pchar.void.
;[[ fn(x) : [ function void __printf( [[char. fmt @ 8], [void. args @ 16]] ) ] ]]
;[[ id : args]]
mov rbx, qword[rbp-56]
mov rdi, rbx
xor rax, rax
call free
;[[ fn(x) : [ function void free( [[void. ptr @ 0]] ) ] ]]
__printf__return:
leave
ret
;[ function void printf( [[char. fmt @ 0], [void arg1 @ 0], [void arg2 @ 0], [void arg3 @ 0], [void arg4 @ 0]] ) ]


;[ function void printf( [[char. fmt @ 0], [void arg1 @ 0], [void arg2 @ 0], [void arg3 @ 0]] ) ]


;[ function void printf( [[char. fmt @ 0], [void arg1 @ 0], [void arg2 @ 0]] ) ]


;[ function void printf( [[char. fmt @ 0], [void arg1 @ 0]] ) ]


;[ function void printf( [[char. fmt @ 8]] ) ]

_void_printf_pchar.:
push rbp
mov rbp, rsp
sub rsp, 16
;Load Parameter: [char. fmt @ 8]
mov [rbp-8], rdi
;[[ id : fmt]]
mov rbx, qword[rbp-8]
mov rsi, rbx
;[[ int : 1]]
mov edi, 1
and rdi, 0xffffffff
xor rax, rax
call _int_fputs_pfd_tchar.
;[[ fn(x) : [ function int fputs( [[fd_t fd @ 0], [char. text @ 0]] ) ] ]]
___void_printf_pchar.__return:
leave
ret
;[ function int rdrand( [] ) ]

_int_rdrand_p:
push rbp
mov rbp, rsp
sub rsp, 8
rdrand rax
___int_rdrand_p__return:
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
mov r10d, [rand_next]
sal r10d, 13
mov r11d, [rand_next]
xor r11d, r10d
mov [rand_next], r11d
;[[ id : rand_next]]
;[[ id : rand_next]]
;[[ id : rand_next], [ ^ : ^], [ ( : (], [ id : rand_next], [ >> : >>], [ int : 17], [ ) : )]]
mov r10d, [rand_next]
sar r10d, 17
mov r11d, [rand_next]
xor r11d, r10d
mov [rand_next], r11d
;[[ id : rand_next]]
;[[ id : rand_next]]
;[[ id : rand_next], [ ^ : ^], [ ( : (], [ id : rand_next], [ << : <<], [ int : 5], [ ) : )]]
mov r10d, [rand_next]
sal r10d, 5
mov r11d, [rand_next]
xor r11d, r10d
mov [rand_next], r11d
;[[ id : rand_next]]
mov ebx, [rand_next]
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
call _int_rdrand_p
mov rbx, rax
;[[ fn(x) : [ function int rdrand( [] ) ] ]]
mov [rand_next], ebx
___void_srand_p__return:
leave
ret
;[ function int getitimer( [[int which @ 8], [itimerval_t. value @ 16]] ) ]

_int_getitimer_pintitimerval_t.:
push rbp
mov rbp, rsp
sub rsp, 24
;Load Parameter: [int which @ 8]
mov [rbp-8], rdi
;Load Parameter: [itimerval_t. value @ 16]
mov [rbp-16], rsi
mov rax, 36
        syscall
___int_getitimer_pintitimerval_t.__return:
leave
ret
;[ function int gettimeofday( [[timeval_t. tv @ 8], [timezone_t. tz @ 16]] ) ]

_int_gettimeofday_ptimeval_t.timezone_t.:
push rbp
mov rbp, rsp
sub rsp, 24
;Load Parameter: [timeval_t. tv @ 8]
mov [rbp-8], rdi
;Load Parameter: [timezone_t. tz @ 16]
mov [rbp-16], rsi
mov rax, 96
    syscall
___int_gettimeofday_ptimeval_t.timezone_t.__return:
leave
ret
;[ function int setitimer( [[int which @ 8], [itimerval_t. value @ 16], [itimerval_t. ovalue @ 24]] ) ]

_int_setitimer_pintitimerval_t.itimerval_t.:
push rbp
mov rbp, rsp
sub rsp, 32
;Load Parameter: [int which @ 8]
mov [rbp-8], rdi
;Load Parameter: [itimerval_t. value @ 16]
mov [rbp-16], rsi
;Load Parameter: [itimerval_t. ovalue @ 24]
mov [rbp-24], rdx
mov rax, 38
    syscall
___int_setitimer_pintitimerval_t.itimerval_t.__return:
leave
ret
;[ function int settimeofday( [[timeval_t. tv @ 8], [timezone_t. tz @ 16]] ) ]

_int_settimeofday_ptimeval_t.timezone_t.:
push rbp
mov rbp, rsp
sub rsp, 24
;Load Parameter: [timeval_t. tv @ 8]
mov [rbp-8], rdi
;Load Parameter: [timezone_t. tz @ 16]
mov [rbp-16], rsi
mov rax, 164
    syscall
___int_settimeofday_ptimeval_t.timezone_t.__return:
leave
ret
;[ function int utimes( [[char. filename @ 8], [timeval_t. utimes @ 16]] ) ]

_int_utimes_pchar.timeval_t.:
push rbp
mov rbp, rsp
sub rsp, 24
;Load Parameter: [char. filename @ 8]
mov [rbp-8], rdi
;Load Parameter: [timeval_t. utimes @ 16]
mov [rbp-16], rsi
mov rax, 235
    syscall
___int_utimes_pchar.timeval_t.__return:
leave
ret
;[ function time_t time( [[time_t. tloc @ 8]] ) ]

_time_t_time_ptime_t.:
push rbp
mov rbp, rsp
sub rsp, 16
;Load Parameter: [time_t. tloc @ 8]
mov [rbp-8], rdi
mov rax, 201
    syscall
___time_t_time_ptime_t.__return:
leave
ret
;[ function bool isdigit( [[char c @ 8]] ) ]

_bool_isdigit_pchar:
push rbp
mov rbp, rsp
sub rsp, 16
;Load Parameter: [char c @ 8]
mov [rbp-8], rdi
;[[ id : c], [ >= : >=], [ char : 48], [ && : &&], [ id : c], [ <= : <=], [ char : 57]]
mov r10b, 48
mov bl, byte[rbp-8]
cmp bl, r10b
setge bl
mov r11b, 57
mov r10b, byte[rbp-8]
cmp r10b, r11b
setle r10b
and bl, r10b
mov al, bl
jmp ___bool_isdigit_pchar__return
___bool_isdigit_pchar__return:
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
;[[ id : STRING_CONSTANT_136]]
mov rbx, STRING_CONSTANT_136
mov rdi, rbx
xor rax, rax
call sscanf
;[[ fn(x) : [ function int sscanf( [[char. fmt @ 0], [char. input @ 0], [void. a @ 0], [void. b @ 0], [void. c @ 0], [void. d @ 0]] ) ] ]]
mov dword[rbp-36], eax
;[[ id : p], [ [ : [], [ int : 0], [ ] : ]], [ && : &&], [ int : 255]]
lea rbx, [rbp-28] 
mov bl, byte[rbx]
and bl, 0xff
mov r10d, 255
and r11d, 0xffffffff
mov r11d, ebx
and r11d, r10d
mov dword[rbp-44], r11d
;[[ id : p], [ [ : [], [ int : 1], [ ] : ]], [ && : &&], [ int : 255]]
mov r10d, 1
lea rbx, [rbp-28] 
and r10, 0xffffffff
lea rbx, [rbx+r10*1]
mov bl, byte[rbx]
and rbx, 0xff
mov r10d, 255
and r11d, 0xffffffff
mov r11d, ebx
and r11d, r10d
mov dword[rbp-52], r11d
;[[ id : p], [ [ : [], [ int : 2], [ ] : ]], [ && : &&], [ int : 255]]
mov r10d, 2
lea rbx, [rbp-28] 
and r10, 0xffffffff
lea rbx, [rbx+r10*1]
mov bl, byte[rbx]
and rbx, 0xff
mov r10d, 255
and r11d, 0xffffffff
mov r11d, ebx
and r11d, r10d
mov dword[rbp-60], r11d
;[[ id : p], [ [ : [], [ int : 3], [ ] : ]], [ && : &&], [ int : 255]]
mov r10d, 3
lea rbx, [rbp-28] 
and r10, 0xffffffff
lea rbx, [rbx+r10*1]
mov bl, byte[rbx]
and rbx, 0xff
mov r10d, 255
and r11d, 0xffffffff
mov r11d, ebx
and r11d, r10d
mov dword[rbp-68], r11d
;[[ @ : @], [ id : addr]]
mov rbx, qword[rbp-16]
mov r10, rbx
;[[ @ : @], [ id : addr]]
mov rbx, qword[rbp-16]
mov r10, rbx
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
call _int_hton32_pint
mov rbx, rax
;[[ fn(x) : [ function int hton32( [[int x @ 8]] ) ] ]]
mov dword[r10], ebx
;[[ int : 1]]
mov eax, 1
jmp ___int_inet_aton_pchar.in_addr.__return
___int_inet_aton_pchar.in_addr.__return:
leave
ret
;[ function fd_t socket( [[int family @ 8], [int type @ 16], [int protocol @ 24]] ) ]

_fd_t_socket_pintintint:
push rbp
mov rbp, rsp
sub rsp, 32
;Load Parameter: [int family @ 8]
mov [rbp-8], rdi
;Load Parameter: [int type @ 16]
mov [rbp-16], rsi
;Load Parameter: [int protocol @ 24]
mov [rbp-24], rdx
mov rax, 41
    syscall
___fd_t_socket_pintintint__return:
leave
ret
;[ function int connect( [[fd_t fd @ 8], [sockaddr_in. uservaddr @ 16], [int addrlen @ 24]] ) ]

_int_connect_pfd_tsockaddr_in.int:
push rbp
mov rbp, rsp
sub rsp, 32
;Load Parameter: [fd_t fd @ 8]
mov [rbp-8], rdi
;Load Parameter: [sockaddr_in. uservaddr @ 16]
mov [rbp-16], rsi
;Load Parameter: [int addrlen @ 24]
mov [rbp-24], rdx
mov rax, 42
    syscall
___int_connect_pfd_tsockaddr_in.int__return:
leave
ret
;[ function int accept( [[fd_t fd @ 8], [sockaddr_in. uservaddr @ 16], [int addrlen @ 24]] ) ]

_int_accept_pfd_tsockaddr_in.int:
push rbp
mov rbp, rsp
sub rsp, 32
;Load Parameter: [fd_t fd @ 8]
mov [rbp-8], rdi
;Load Parameter: [sockaddr_in. uservaddr @ 16]
mov [rbp-16], rsi
;Load Parameter: [int addrlen @ 24]
mov [rbp-24], rdx
mov rax, 43
    syscall
___int_accept_pfd_tsockaddr_in.int__return:
leave
ret
;[ function int bind( [[fd_t fd @ 8], [sockaddr_in. umyaddr @ 16], [int addrlen @ 24]] ) ]

_int_bind_pfd_tsockaddr_in.int:
push rbp
mov rbp, rsp
sub rsp, 32
;Load Parameter: [fd_t fd @ 8]
mov [rbp-8], rdi
;Load Parameter: [sockaddr_in. umyaddr @ 16]
mov [rbp-16], rsi
;Load Parameter: [int addrlen @ 24]
mov [rbp-24], rdx
mov rax, 49
    syscall
___int_bind_pfd_tsockaddr_in.int__return:
leave
ret
;[ function int listen( [[fd_t fd @ 8], [int backlog @ 16]] ) ]

_int_listen_pfd_tint:
push rbp
mov rbp, rsp
sub rsp, 24
;Load Parameter: [fd_t fd @ 8]
mov [rbp-8], rdi
;Load Parameter: [int backlog @ 16]
mov [rbp-16], rsi
mov rax, 50
    syscall
___int_listen_pfd_tint__return:
leave
ret
;[ function int shutdown( [[fd_t sockfd @ 8], [int how @ 16]] ) ]

_int_shutdown_pfd_tint:
push rbp
mov rbp, rsp
sub rsp, 24
;Load Parameter: [fd_t sockfd @ 8]
mov [rbp-8], rdi
;Load Parameter: [int how @ 16]
mov [rbp-16], rsi
mov rax, 48
    syscall
___int_shutdown_pfd_tint__return:
leave
ret
;[ function int recvfrom( [[fd_t sockfd @ 8], [char. buff @ 16], [size_t len @ 24], [int flags @ 32], [sockaddr_in. addr @ 40], [size_t addrsize @ 48]] ) ]

_int_recvfrom_pfd_tchar.size_tintsockaddr_in.size_t:
push rbp
mov rbp, rsp
sub rsp, 56
;Load Parameter: [fd_t sockfd @ 8]
mov [rbp-8], rdi
;Load Parameter: [char. buff @ 16]
mov [rbp-16], rsi
;Load Parameter: [size_t len @ 24]
mov [rbp-24], rdx
;Load Parameter: [int flags @ 32]
mov [rbp-32], rcx
;Load Parameter: [sockaddr_in. addr @ 40]
mov [rbp-40], r8
;Load Parameter: [size_t addrsize @ 48]
mov [rbp-48], r9
mov rax, 45
    syscall
___int_recvfrom_pfd_tchar.size_tintsockaddr_in.size_t__return:
leave
ret
;[ function int sendto( [[fd_t fd @ 8], [void. buff @ 16], [size_t len @ 24], [int flags @ 32], [sockaddr_in. addr @ 40], [size_t addrsize @ 48]] ) ]

_int_sendto_pfd_tvoid.size_tintsockaddr_in.size_t:
push rbp
mov rbp, rsp
sub rsp, 56
;Load Parameter: [fd_t fd @ 8]
mov [rbp-8], rdi
;Load Parameter: [void. buff @ 16]
mov [rbp-16], rsi
;Load Parameter: [size_t len @ 24]
mov [rbp-24], rdx
;Load Parameter: [int flags @ 32]
mov [rbp-32], rcx
;Load Parameter: [sockaddr_in. addr @ 40]
mov [rbp-40], r8
;Load Parameter: [size_t addrsize @ 48]
mov [rbp-48], r9
mov rax, 44
    syscall
___int_sendto_pfd_tvoid.size_tintsockaddr_in.size_t__return:
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
xor r9d, r9d
;[[ int : 0]]
xor r8d, r8d
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
mov ebx, dword[rbp-8]
mov edi, ebx
and rdi, 0xffffffff
xor rax, rax
call _int_recvfrom_pfd_tchar.size_tintsockaddr_in.size_t
;[[ fn(x) : [ function int recvfrom( [[fd_t sockfd @ 8], [char. buff @ 16], [size_t len @ 24], [int flags @ 32], [sockaddr_in. addr @ 40], [size_t addrsize @ 48]] ) ] ]]
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
xor r9d, r9d
;[[ int : 0]]
xor r8d, r8d
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
mov ebx, dword[rbp-8]
mov edi, ebx
and rdi, 0xffffffff
xor rax, rax
call _int_sendto_pfd_tvoid.size_tintsockaddr_in.size_t
;[[ fn(x) : [ function int sendto( [[fd_t fd @ 8], [void. buff @ 16], [size_t len @ 24], [int flags @ 32], [sockaddr_in. addr @ 40], [size_t addrsize @ 48]] ) ] ]]
jmp ___int_send_pfd_tchar.size_tint__return
___int_send_pfd_tchar.size_tint__return:
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
mov r11d, 1
mov r10, qword[rbp-16]
and r11, 0xffffffff
lea r10, [r10+r11*1]
mov bl, byte[rbx]
and rbx, 0xff
mov r10b, byte[r10]
and r10, 0xff
add bl, r10b
mov dword[rbp-24], ebx
;[[ int : 0]]
mov dword[rbp-32], 0
;[[ int : 0]]
mov dword[rbp-40], 0
;[[ id : modehash], [ == : ==], [ int : 114]]
mov r10d, 114
mov ebx, dword[rbp-24]
cmp ebx, r10d
sete bl
mov al, bl
and al, 1
jz _LIFPOST_0x37
;[[ id : f]]
;[[ id : f]]
;[[ int : 0]]
xor ebx, ebx
mov dword[rbp-40], ebx
jmp _LIFELSE_0x38
_LIFPOST_0x37:
;[[ id : modehash], [ == : ==], [ int : 119]]
mov r10d, 119
mov ebx, dword[rbp-24]
cmp ebx, r10d
sete bl
mov al, bl
and al, 1
jz _LIFPOST_0x39
;[[ id : f]]
;[[ id : f]]
;[[ int : 1]]
mov ebx, 1
mov dword[rbp-40], ebx
jmp _LIFELSE_0x3a
_LIFPOST_0x39:
;[[ id : modehash], [ == : ==], [ int : 97]]
mov r10d, 97
mov ebx, dword[rbp-24]
cmp ebx, r10d
sete bl
mov al, bl
and al, 1
jz _LIFPOST_0x3b
;[[ id : f]]
;[[ id : f]]
;[[ int : 1], [ || : ||], [ int : 8]]
mov ebx, 1
mov dword[rbp-40], ebx
jmp _LIFELSE_0x3c
_LIFPOST_0x3b:
;[[ id : modehash], [ == : ==], [ int : 157]]
mov r10d, 157
mov ebx, dword[rbp-24]
cmp ebx, r10d
sete bl
mov al, bl
and al, 1
jz _LIFPOST_0x3d
;[[ id : f]]
;[[ id : f]]
;[[ int : 2]]
mov ebx, 2
mov dword[rbp-40], ebx
jmp _LIFELSE_0x3e
_LIFPOST_0x3d:
;[[ id : modehash], [ == : ==], [ int : 162]]
mov r10d, 162
mov ebx, dword[rbp-24]
cmp ebx, r10d
sete bl
mov al, bl
and al, 1
jz _LIFPOST_0x3f
;[[ id : m]]
;[[ id : m]]
;[[ int : 1792]]
mov ebx, 1792
mov dword[rbp-32], ebx
;[[ id : f]]
;[[ id : f]]
;[[ int : 2], [ || : ||], [ int : 64]]
mov ebx, 2
mov dword[rbp-40], ebx
jmp _LIFELSE_0x40
_LIFPOST_0x3f:
;[[ id : m]]
;[[ id : m]]
;[[ int : 1792]]
mov ebx, 1792
mov dword[rbp-32], ebx
;[[ id : f]]
;[[ id : f]]
;[[ int : 2], [ || : ||], [ int : 8], [ || : ||], [ int : 64]]
mov ebx, 2
mov dword[rbp-40], ebx
_LIFELSE_0x40:
_LIFELSE_0x3e:
_LIFELSE_0x3c:
_LIFELSE_0x3a:
_LIFELSE_0x38:
;[[ id : m]]
mov ebx, dword[rbp-32]
mov edx, ebx
and rdx, 0xffffffff
;[[ id : f]]
mov ebx, dword[rbp-40]
mov esi, ebx
and rsi, 0xffffffff
;[[ id : fname]]
mov rbx, qword[rbp-8]
mov rdi, rbx
xor rax, rax
call _fd_t_open_pchar.intmode_t
;[[ fn(x) : [ function fd_t open( [[char. fname @ 0], [int flags @ 0], [mode_t mode @ 0]] ) ] ]]
mov dword[rbp-48], eax
;[[ id : modehash], [ == : ==], [ int : 140], [ || : ||], [ id : modehash], [ == : ==], [ int : 87]]
mov r10d, 140
mov ebx, dword[rbp-24]
cmp ebx, r10d
sete bl
mov r11d, 87
mov r10d, dword[rbp-24]
cmp r10d, r11d
sete r10b
or bl, r10b
mov al, bl
and al, 1
jz _LIFPOST_0x41
;[[ int : 2]]
mov edx, 2
and rdx, 0xffffffff
;[[ int : 0]]
xor esi, esi
and rsi, 0xffffffff
;[[ id : out]]
mov ebx, dword[rbp-48]
mov edi, ebx
and rdi, 0xffffffff
xor rax, rax
call _int_lseek_pfd_tintint
;[[ fn(x) : [ function int lseek( [[fd_t fd @ 0], [int offset @ 0], [int whence @ 0]] ) ] ]]
jmp _LIFELSE_0x42
_LIFPOST_0x41:
_LIFELSE_0x42:
;[[ id : out]]
mov ebx, dword[rbp-48]
mov eax, ebx
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
;[[ fn(x) : [ function size_t strlen( [[char. str @ 8]] ) ] ]]
mov dword[rbp-24], eax
;[[ id : l]]
mov edx, dword[rbp-24]
;[[ id : text]]
mov rbx, qword[rbp-16]
mov rsi, rbx
;[[ id : fd]]
mov ebx, dword[rbp-8]
mov edi, ebx
and rdi, 0xffffffff
xor rax, rax
call _ssize_t_write_pfd_tchar.size_t
;[[ fn(x) : [ function ssize_t write( [[fd_t fd @ 0], [char. buf @ 0], [size_t count @ 0]] ) ] ]]
mov dword[rbp-32], eax
;[[ int : 1]]
mov edx, 1
and rdx, 0xffffffff
;[[ id : l]]
mov ebx, dword[rbp-24]
mov esi, ebx
and rsi, 0xffffffff
;[[ id : fd]]
mov ebx, dword[rbp-8]
mov edi, ebx
and rdi, 0xffffffff
xor rax, rax
call _int_lseek_pfd_tintint
;[[ fn(x) : [ function int lseek( [[fd_t fd @ 0], [int offset @ 0], [int whence @ 0]] ) ] ]]
;[[ id : out]]
mov ebx, dword[rbp-32]
mov eax, ebx
jmp ___int_fputs_pfd_tchar.__return
___int_fputs_pfd_tchar.__return:
leave
ret
;[ function bool fgets( [[fd_t fd @ 8], [char. buffer @ 16], [size_t amt @ 24]] ) ]

_bool_fgets_pfd_tchar.size_t:
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
mov ebx, dword[rbp-8]
mov edi, ebx
and rdi, 0xffffffff
xor rax, rax
call _ssize_t_read_pfd_tchar.size_t
push rax
;[[ fn(x) : [ function ssize_t read( [[fd_t fd @ 0], [char. buf @ 0], [size_t count @ 0]] ) ] ], [ > : >], [ int : 0]]
xor r10d, r10d
pop rbx
mov r11, r10
cmp rbx, r11
setg bl
mov byte[rbp-32], bl
;[[ int : 1]]
mov edx, 1
and rdx, 0xffffffff
;[[ id : amt]]
mov rsi, qword[rbp-24]
and rsi, 0xffffffff
;[[ id : fd]]
mov ebx, dword[rbp-8]
mov edi, ebx
and rdi, 0xffffffff
xor rax, rax
call _int_lseek_pfd_tintint
;[[ fn(x) : [ function int lseek( [[fd_t fd @ 0], [int offset @ 0], [int whence @ 0]] ) ] ]]
;[[ id : out]]
mov bl, byte[rbp-32]
mov al, bl
jmp ___bool_fgets_pfd_tchar.size_t__return
___bool_fgets_pfd_tchar.size_t__return:
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
mov edx, 2
and rdx, 0xffffffff
;[[ int : 0]]
xor esi, esi
and rsi, 0xffffffff
;[[ id : fd]]
mov ebx, dword[rbp-8]
mov edi, ebx
and rdi, 0xffffffff
xor rax, rax
call _int_lseek_pfd_tintint
;[[ fn(x) : [ function int lseek( [[fd_t fd @ 0], [int offset @ 0], [int whence @ 0]] ) ] ]]
mov dword[rbp-16], eax
;[[ int : 2]]
mov edx, 2
and rdx, 0xffffffff
;[[ int : 0], [ - : -], [ id : fsize]]
mov r10d, dword[rbp-16]
xor ebx, ebx
sub ebx, r10d
mov esi, ebx
and rsi, 0xffffffff
;[[ id : fd]]
mov ebx, dword[rbp-8]
mov edi, ebx
and rdi, 0xffffffff
xor rax, rax
call _int_lseek_pfd_tintint
;[[ fn(x) : [ function int lseek( [[fd_t fd @ 0], [int offset @ 0], [int whence @ 0]] ) ] ]]
;[[ id : fsize]]
mov edi, dword[rbp-16]
xor rax, rax
call malloc
;[[ fn(x) : [ function void. malloc( [[size_t size @ 0]] ) ] ]]
mov qword[rbp-24], rax
;[[ id : fsize]]
mov edx, dword[rbp-16]
;[[ id : buffer]]
mov rbx, qword[rbp-24]
mov rsi, rbx
;[[ id : fd]]
mov ebx, dword[rbp-8]
mov edi, ebx
and rdi, 0xffffffff
xor rax, rax
call _ssize_t_read_pfd_tchar.size_t
push rax
;[[ fn(x) : [ function ssize_t read( [[fd_t fd @ 0], [char. buf @ 0], [size_t count @ 0]] ) ] ], [ < : <], [ int : 0]]
xor r10d, r10d
pop rbx
mov r11, r10
cmp rbx, r11
setl bl
mov byte[rbp-32], bl
;[[ id : out]]
mov bl, byte[rbp-32]
mov al, bl
and al, 1
jz _LIFPOST_0x43
;[[ int : 0]]
xor eax, eax
jmp ___void._floads_pfd_t__return
jmp _LIFELSE_0x44
_LIFPOST_0x43:
_LIFELSE_0x44:
;[[ id : buffer]]
mov rax, qword[rbp-24]
jmp ___void._floads_pfd_t__return
___void._floads_pfd_t__return:
leave
ret
;[ function long fork( [] ) ]

_long_fork_p:
push rbp
mov rbp, rsp
sub rsp, 8
mov rax, 57
    syscall
___long_fork_p__return:
leave
ret
;[ function long vfork( [] ) ]

_long_vfork_p:
push rbp
mov rbp, rsp
sub rsp, 8
mov rax, 58
    syscall
___long_vfork_p__return:
leave
ret
;[ function long execve( [[char. pathname @ 8], [char.. args @ 16], [char.. env @ 24]] ) ]

_long_execve_pchar.char..char..:
push rbp
mov rbp, rsp
sub rsp, 32
;Load Parameter: [char. pathname @ 8]
mov [rbp-8], rdi
;Load Parameter: [char.. args @ 16]
mov [rbp-16], rsi
;Load Parameter: [char.. env @ 24]
mov [rbp-24], rdx
mov rax, 59
    syscall
___long_execve_pchar.char..char..__return:
leave
ret
;[ function long pause( [] ) ]

_long_pause_p:
push rbp
mov rbp, rsp
sub rsp, 8
mov rax, 34
    syscall
___long_pause_p__return:
leave
ret
;[ function long waitpid( [[pid_t pid @ 8], [int. wstatus @ 16], [int options @ 24]] ) ]

_long_waitpid_ppid_tint.int:
push rbp
mov rbp, rsp
sub rsp, 32
;Load Parameter: [pid_t pid @ 8]
mov [rbp-8], rdi
;Load Parameter: [int. wstatus @ 16]
mov [rbp-16], rsi
;Load Parameter: [int options @ 24]
mov [rbp-24], rdx
mov rax, 61
    xor r8, r8
    syscall
___long_waitpid_ppid_tint.int__return:
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
mov rdx, rbx
;[[ id : args]]
mov rbx, qword[rbp-16]
mov rsi, rbx
;[[ id : path]]
mov rbx, qword[rbp-8]
mov rdi, rbx
xor rax, rax
call _long_execve_pchar.char..char..
;[[ fn(x) : [ function long execve( [[char. pathname @ 8], [char.. args @ 16], [char.. env @ 24]] ) ] ]]
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
mov rax, 0
call _long_fork_p
;[[ fn(x) : [ function long fork( [] ) ] ]]
mov qword[rbp-16], rax
;[[ id : pid], [ == : ==], [ int : 0]]
mov rbx, qword[rbp-16]
test rbx, rbx
setz bl
mov al, bl
and al, 1
jz _LIFPOST_0x45
;[[ id : __systemcallargvconst], [ [ : [], [ int : 2], [ ] : ]]]
mov r10d, 2
mov rbx, __systemcallargvconst
and r10, 0xffffffff
lea rbx, [rbx+r10*8]
;[[ id : __systemcallargvconst], [ [ : [], [ int : 2], [ ] : ]]]
mov r10d, 2
mov rbx, __systemcallargvconst
and r10, 0xffffffff
lea rbx, [rbx+r10*8]
;[[ id : command]]
mov r11, qword[rbp-8]
mov qword[rbx], r11
;[[ id : __systemcallargvconst]]
mov rbx, __systemcallargvconst
mov rsi, rbx
;[[ id : __systembashpath]]
mov rbx, __systembashpath
mov rdi, rbx
xor rax, rax
call _long_execl_pchar.char..
;[[ fn(x) : [ function long execl( [[char. path @ 8], [char.. args @ 16]] ) ] ]]
mov qword[rbp-24], rax
;[[ id : err]]
mov rbx, qword[rbp-24]
mov rdi, rbx
xor rax, rax
call _char._strerror_plong
mov rdi, rax
;[[ fn(x) : [ function char. strerror( [[long errnum @ 8]] ) ] ]]
xor rax, rax
call _void_printf_pchar.
;[[ fn(x) : [ function void printf( [[char. fmt @ 8]] ) ] ]]
jmp _LIFELSE_0x46
_LIFPOST_0x45:
_LIFELSE_0x46:
;[[ int : 0]]
xor edx, edx
and rdx, 0xffffffff
;[[ int : 0]]
xor esi, esi
;[[ id : pid]]
mov rbx, qword[rbp-16]
mov rdi, rbx
xor rax, rax
call _long_waitpid_ppid_tint.int
;[[ fn(x) : [ function long waitpid( [[pid_t pid @ 8], [int. wstatus @ 16], [int options @ 24]] ) ] ]]
;[[ int : 0]]
xor eax, eax
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
;[[ $ : bool], [ int : 0]]
xor ebx, ebx
and r10b, 0xff
mov byte[rbp-48], bl
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
jz _LIFPOST_0x47
;[[ id : negative]]
;[[ id : negative]]
;[[ $ : bool], [ int : 1]]
mov r10d, 1
and r11b, 0xff
mov byte[rbp-48], r10b
;[[ id : str]]
;[[ id : str]]
;[[ int : 1]]
mov ebx, 1
mov r10, qword[rbp-8]
add r10, rbx
mov qword[rbp-8], r10
;[[ id : c]]
;[[ id : c]]
;[[ $ : char], [ ( : (], [ @ : @], [ id : str], [ ) : )]]
mov r10, qword[rbp-8]
and r11, 0xff
mov r11b, byte[r10]
mov byte[rbp-40], r11b
jmp _LIFELSE_0x48
_LIFPOST_0x47:
_LIFELSE_0x48:
jmp _LWHILECMP_0x4a
_LWHILESTART_0x49:
;[[ id : val]]
;[[ id : val]]
;[[ ( : (], [ id : val], [ * : *], [ int : 10], [ ) : )], [ + : +], [ ( : (], [ id : c], [ - : -], [ char : 48], [ ) : )]]
mov r11d, 10
mov r10, qword[rbp-32]
mov r12, r11
imul r10, r12
mov r11b, byte[rbp-40]
sub r11b, 48
mov r12, r11
add r10, r12
mov qword[rbp-32], r10
;[[ id : str]]
;[[ id : str]]
;[[ int : 1]]
mov ebx, 1
mov r10, qword[rbp-8]
add r10, rbx
mov qword[rbp-8], r10
;[[ id : c]]
;[[ id : c]]
;[[ $ : char], [ ( : (], [ @ : @], [ id : str], [ ) : )]]
mov r10, qword[rbp-8]
and r11, 0xff
mov r11b, byte[r10]
mov byte[rbp-40], r11b
_LWHILECMP_0x4a:
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
jnz _LWHILESTART_0x49
_LWHILEEND_0x4b:
;[[ ! : !], [ id : negative]]
mov bl, byte[rbp-48]
cmp bl, 0
sete bl
mov al, bl
and al, 1
jz _LIFPOST_0x4c
;[[ @ : @], [ id : dest]]
mov rbx, qword[rbp-16]
mov r10, rbx
;[[ @ : @], [ id : dest]]
mov rbx, qword[rbp-16]
mov r10, rbx
;[[ id : val]]
mov r11, qword[rbp-32]
mov qword[r10], r11
jmp _LIFELSE_0x4d
_LIFPOST_0x4c:
;[[ @ : @], [ id : dest]]
mov rbx, qword[rbp-16]
mov r10, rbx
;[[ @ : @], [ id : dest]]
mov rbx, qword[rbp-16]
mov r10, rbx
;[[ int : 0], [ - : -], [ id : val]]
xor r12d, r12d
mov r11, qword[rbp-32]
mov r13, r12
sub r13, r11
mov qword[r10], r13
_LIFELSE_0x4d:
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
jmp _LWHILECMP_0x4f
_LWHILESTART_0x4e:
;[[ @ : @], [ id : dest]]
mov rbx, qword[rbp-24]
mov r10, rbx
;[[ @ : @], [ id : dest]]
mov rbx, qword[rbp-24]
mov r10, rbx
;[[ @ : @], [ id : str]]
mov r11, qword[rbp-8]
and r12, 0xff
mov r12b, byte[r11]
mov byte[r10], r12b
;[[ id : str], [ ++ : ++]]
inc qword[rbp-8]
;[[ id : dest], [ ++ : ++]]
inc qword[rbp-24]
_LWHILECMP_0x4f:
;[[ @ : @], [ id : str], [ != : !=], [ id : delim]]
mov rbx, qword[rbp-8]
and r10, 0xff
mov r10b, byte[rbx]
mov bl, byte[rbp-16]
cmp r10b, bl
setne r10b
mov al, r10b
and al, 1
jnz _LWHILESTART_0x4e
_LWHILEEND_0x50:
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
;[[ $ : bool], [ int : 1]]
mov ebx, 1
and r10b, 0xff
mov r10b, bl
mov dl, r10b
and rdx, 0xff
;[[ & : &], [ id : integral]]
lea rbx, [rbp-32]
mov rsi, rbx
;[[ id : str]]
mov rbx, qword[rbp-8]
mov rdi, rbx
xor rax, rax
call _int_scanint_pchar.long.bool
;[[ fn(x) : [ function int scanint( [[char. str @ 8], [long. dest @ 16], [bool signed @ 24]] ) ] ]]
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
jz _LIFPOST_0x51
;[[ @ : @], [ id : dest]]
mov rbx, qword[rbp-24]
mov r10, rbx
;[[ @ : @], [ id : dest]]
mov rbx, qword[rbp-24]
mov r10, rbx
;[[ id : integral]]
cvtsi2sd xmm7, qword[rbp-32]
movq qword[r10], xmm7
;[[ id : diff]]
mov rax, qword[rbp-48]
jmp ___int_scansd_pchar.booldouble.__return
jmp _LIFELSE_0x52
_LIFPOST_0x51:
_LIFELSE_0x52:
;[[ id : str], [ ++ : ++]]
inc qword[rbp-8]
;[[ $ : bool], [ int : 0]]
xor ebx, ebx
and r10b, 0xff
mov r10b, bl
mov dl, r10b
and rdx, 0xff
;[[ & : &], [ id : decimal]]
lea rbx, [rbp-40]
mov rsi, rbx
;[[ id : str]]
mov rbx, qword[rbp-8]
mov rdi, rbx
xor rax, rax
call _int_scanint_pchar.long.bool
;[[ fn(x) : [ function int scanint( [[char. str @ 8], [long. dest @ 16], [bool signed @ 24]] ) ] ]]
mov qword[rbp-56], rax
;[[ id : dif2]]
mov rbx, qword[rbp-56]
mov rsi, rbx
;[[ int : 10]]
mov edi, 10
xor rax, rax
call _long_pow_plonglong
;[[ fn(x) : [ function long pow( [[long base @ 8], [long exp @ 16]] ) ] ]]
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
mov r10, rbx
;[[ @ : @], [ id : dest]]
mov rbx, qword[rbp-24]
mov r10, rbx
;[[ id : num], [ / : /], [ id : n]]
mov ebx, dword[rbp-64]
movsd xmm8, qword[rbp-72]
cvtsi2sd xmm9, ebx
divsd xmm8, xmm9
movsd xmm7, xmm8
movq qword[r10], xmm7
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
jz _LIFPOST_0x53
;[[ int : 0]]
xor eax, eax
jmp ___int___SSCANF_pchar.char.void..__return
jmp _LIFELSE_0x54
_LIFPOST_0x53:
_LIFELSE_0x54:
jmp _LWHILECMP_0x56
_LWHILESTART_0x55:
;[[ @ : @], [ id : format], [ != : !=], [ char : 37]]
mov rbx, qword[rbp-8]
and r10, 0xff
mov r10b, byte[rbx]
mov bl, 37
cmp r10b, bl
setne r10b
mov al, r10b
and al, 1
jz _LIFPOST_0x58
;[[ id : format], [ ++ : ++]]
inc qword[rbp-8]
;[[ id : input], [ ++ : ++]]
inc qword[rbp-16]
jmp _LIFELSE_0x59
_LIFPOST_0x58:
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
jz _LIFPOST_0x5a
;[[ id : diff]]
;[[ id : diff]]
;[[ $ : bool], [ int : 1]]
mov r10d, 1
and r11b, 0xff
mov r11b, r10b
mov dl, r11b
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
mov qword[rbp-48], rax
;[[ fn(x) : [ function int scanint( [[char. str @ 8], [long. dest @ 16], [bool signed @ 24]] ) ] ]]
;[[ id : input]]
;[[ id : input]]
;[[ id : diff]]
mov rbx, qword[rbp-48]
mov r10, qword[rbp-16]
add r10, rbx
mov qword[rbp-16], r10
;[[ id : format], [ ++ : ++]]
inc qword[rbp-8]
jmp _LIFELSE_0x5b
_LIFPOST_0x5a:
;[[ id : c], [ == : ==], [ char : 117]]
mov r10b, 117
mov bl, byte[rbp-40]
cmp bl, r10b
sete bl
mov al, bl
and al, 1
jz _LIFPOST_0x5c
;[[ id : diff]]
;[[ id : diff]]
;[[ $ : bool], [ int : 0]]
xor r10d, r10d
and r11b, 0xff
mov r11b, r10b
mov dl, r11b
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
mov qword[rbp-48], rax
;[[ fn(x) : [ function int scanint( [[char. str @ 8], [long. dest @ 16], [bool signed @ 24]] ) ] ]]
;[[ id : input]]
;[[ id : input]]
;[[ id : diff]]
mov rbx, qword[rbp-48]
mov r10, qword[rbp-16]
add r10, rbx
mov qword[rbp-16], r10
;[[ id : format], [ ++ : ++]]
inc qword[rbp-8]
jmp _LIFELSE_0x5d
_LIFPOST_0x5c:
;[[ id : c], [ == : ==], [ char : 99]]
mov r10b, 99
mov bl, byte[rbp-40]
cmp bl, r10b
sete bl
mov al, bl
and al, 1
jz _LIFPOST_0x5e
;[[ id : args], [ [ : [], [ id : argc], [ ] : ]]]
mov r10d, dword[rbp-32]
mov rbx, qword[rbp-24]
and r10, 0xffffffff
lea rbx, [rbx+r10*8]
mov rbx, qword[rbx]
mov qword[rbp-56], rbx
;[[ @ : @], [ id : ptr]]
mov rbx, qword[rbp-56]
mov r10, rbx
;[[ @ : @], [ id : ptr]]
mov rbx, qword[rbp-56]
mov r10, rbx
;[[ @ : @], [ id : input]]
mov r11, qword[rbp-16]
and r12, 0xff
mov r12b, byte[r11]
mov byte[r10], r12b
;[[ id : input], [ ++ : ++]]
inc qword[rbp-16]
;[[ id : format], [ ++ : ++]]
inc qword[rbp-8]
jmp _LIFELSE_0x5f
_LIFPOST_0x5e:
;[[ id : c], [ == : ==], [ char : 115]]
mov r10b, 115
mov bl, byte[rbp-40]
cmp bl, r10b
sete bl
mov al, bl
and al, 1
jz _LIFPOST_0x60
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
mov qword[rbp-48], rax
;[[ fn(x) : [ function int scanstr( [[char. str @ 8], [char delim @ 16], [char. dest @ 24]] ) ] ]]
;[[ id : input]]
;[[ id : input]]
;[[ id : diff]]
mov rbx, qword[rbp-48]
mov r10, qword[rbp-16]
add r10, rbx
mov qword[rbp-16], r10
jmp _LIFELSE_0x61
_LIFPOST_0x60:
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
jz _LIFPOST_0x62
;[[ id : diff]]
;[[ id : diff]]
;[[ id : args], [ [ : [], [ id : argc], [ ] : ]]]
mov r11d, dword[rbp-32]
mov r10, qword[rbp-24]
and r11, 0xffffffff
lea r10, [r10+r11*8]
mov r10, qword[r10]
mov rdx, r10
;[[ $ : bool], [ int : 0]]
xor r10d, r10d
and r11b, 0xff
mov r11b, r10b
mov sil, r11b
and rsi, 0xff
;[[ id : input]]
mov r10, qword[rbp-16]
mov rdi, r10
xor rax, rax
call _int_scansd_pchar.booldouble.
mov qword[rbp-48], rax
;[[ fn(x) : [ function int scansd( [[char. str @ 8], [bool double @ 16], [double. dest @ 24]] ) ] ]]
;[[ id : input]]
;[[ id : input]]
;[[ id : diff]]
mov rbx, qword[rbp-48]
mov r10, qword[rbp-16]
add r10, rbx
mov qword[rbp-16], r10
;[[ id : format], [ ++ : ++]]
inc qword[rbp-8]
jmp _LIFELSE_0x63
_LIFPOST_0x62:
_LIFELSE_0x63:
_LIFELSE_0x61:
_LIFELSE_0x5f:
_LIFELSE_0x5d:
_LIFELSE_0x5b:
;[[ id : argc], [ ++ : ++]]
inc dword[rbp-32]
_LIFELSE_0x59:
_LWHILECMP_0x56:
;[[ @ : @], [ id : format], [ != : !=], [ int : 0]]
mov rbx, qword[rbp-8]
and r10, 0xff
mov r10b, byte[rbx]
test r10b, r10b
setnz r10b
mov al, r10b
and al, 1
jnz _LWHILESTART_0x55
_LWHILEEND_0x57:
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
mov r10d, 1
lea rbx, [rbp-88] 
and r10, 0xffffffff
lea rbx, [rbx+r10*8]
;[[ id : args], [ [ : [], [ int : 1], [ ] : ]]]
mov r10d, 1
lea rbx, [rbp-88] 
and r10, 0xffffffff
lea rbx, [rbx+r10*8]
;[[ id : b]]
mov r10, qword[rbp-32]
mov qword[rbx], r10
;[[ id : args], [ [ : [], [ int : 2], [ ] : ]]]
mov r10d, 2
lea rbx, [rbp-88] 
and r10, 0xffffffff
lea rbx, [rbx+r10*8]
;[[ id : args], [ [ : [], [ int : 2], [ ] : ]]]
mov r10d, 2
lea rbx, [rbp-88] 
and r10, 0xffffffff
lea rbx, [rbx+r10*8]
;[[ id : c]]
mov r10, qword[rbp-40]
mov qword[rbx], r10
;[[ id : args], [ [ : [], [ int : 3], [ ] : ]]]
mov r10d, 3
lea rbx, [rbp-88] 
and r10, 0xffffffff
lea rbx, [rbx+r10*8]
;[[ id : args], [ [ : [], [ int : 3], [ ] : ]]]
mov r10d, 3
lea rbx, [rbp-88] 
and r10, 0xffffffff
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
;[[ fn(x) : [ function int __SSCANF( [[char. format @ 8], [char. input @ 16], [void.. args @ 24]] ) ] ]]
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
call _void_printf_pchar.
;[[ fn(x) : [ function void printf( [[char. fmt @ 8]] ) ] ]]
;[[ int : 40]]
mov edx, 40
;[[ int : 0]]
xor esi, esi
and rsi, 0xff
;[[ & : &], [ id : buff]]
lea rbx, [rbp-56]
mov rdi, rbx
xor rax, rax
call _void_memset_pvoid.ucharsize_t
;[[ fn(x) : [ function void memset( [[void. dest @ 8], [uchar value @ 16], [size_t bytes @ 24]] ) ] ]]
;[[ int : 40]]
mov edx, 40
;[[ & : &], [ id : buff]]
lea rbx, [rbp-56]
mov rsi, rbx
;[[ int : 0]]
xor edi, edi
and rdi, 0xffffffff
xor rax, rax
call _bool_fgets_pfd_tchar.size_t
;[[ fn(x) : [ function bool fgets( [[fd_t fd @ 8], [char. buffer @ 16], [size_t amt @ 24]] ) ] ]]
;[[ $ : bool], [ int : 1]]
mov ebx, 1
and r10b, 0xff
mov r10b, bl
mov sil, r10b
and rsi, 0xff
;[[ & : &], [ id : buff]]
lea rbx, [rbp-56]
mov rdi, rbx
xor rax, rax
call _int_toInteger_pchar.bool
;[[ fn(x) : [ function int toInteger( [[char. str @ 0], [bool signed @ 0]] ) ] ]]
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
call _void_printf_pchar.
;[[ fn(x) : [ function void printf( [[char. fmt @ 8]] ) ] ]]
;[[ int : 40]]
mov edx, 40
;[[ int : 0]]
xor esi, esi
and rsi, 0xff
;[[ & : &], [ id : buff]]
lea rbx, [rbp-56]
mov rdi, rbx
xor rax, rax
call _void_memset_pvoid.ucharsize_t
;[[ fn(x) : [ function void memset( [[void. dest @ 8], [uchar value @ 16], [size_t bytes @ 24]] ) ] ]]
;[[ int : 40]]
mov edx, 40
;[[ & : &], [ id : buff]]
lea rbx, [rbp-56]
mov rsi, rbx
;[[ int : 0]]
xor edi, edi
and rdi, 0xffffffff
xor rax, rax
call _bool_fgets_pfd_tchar.size_t
;[[ fn(x) : [ function bool fgets( [[fd_t fd @ 8], [char. buffer @ 16], [size_t amt @ 24]] ) ] ]]
;[[ $ : bool], [ int : 1]]
mov ebx, 1
and r10b, 0xff
mov r10b, bl
mov sil, r10b
and rsi, 0xff
;[[ & : &], [ id : buff]]
lea rbx, [rbp-56]
mov rdi, rbx
xor rax, rax
call _int_toInteger_pchar.bool
;[[ fn(x) : [ function int toInteger( [[char. str @ 0], [bool signed @ 0]] ) ] ]]
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
mov edx, 1
;[[ & : &], [ id : c]]
lea rbx, [rbp-8]
mov rsi, rbx
;[[ int : 0]]
xor edi, edi
and rdi, 0xffffffff
xor rax, rax
call _bool_fgets_pfd_tchar.size_t
;[[ fn(x) : [ function bool fgets( [[fd_t fd @ 8], [char. buffer @ 16], [size_t amt @ 24]] ) ] ]]
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
xor eax, eax
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
call _void_printf_pchar.
;[[ fn(x) : [ function void printf( [[char. fmt @ 8]] ) ] ]]
;[[ id : maxlen]]
mov edx, dword[rbp-16]
;[[ id : buffer]]
mov rbx, qword[rbp-8]
mov rsi, rbx
;[[ int : 0]]
xor edi, edi
and rdi, 0xffffffff
xor rax, rax
call _bool_fgets_pfd_tchar.size_t
;[[ fn(x) : [ function bool fgets( [[fd_t fd @ 8], [char. buffer @ 16], [size_t amt @ 24]] ) ] ]]
___void_getString_pchar.intchar.__return:
leave
ret
;[ function char. getString( [[char. msg @ 8]] ) ]

_char._getString_pchar.:
push rbp
mov rbp, rsp
sub rsp, 48
;Load Parameter: [char. msg @ 8]
mov [rbp-8], rdi
;[[ int : 80]]
mov qword[rbp-16], 80
;[[ id : size]]
mov rbx, qword[rbp-16]
mov rdi, rbx
xor rax, rax
call malloc
;[[ fn(x) : [ function void. malloc( [[size_t size @ 0]] ) ] ]]
mov qword[rbp-24], rax
;[[ int : 0]]
mov qword[rbp-40], 0
;[[ id : msg]]
mov rsi, qword[rbp-8]
;[[ id : STRING_CONSTANT_141]]
mov rbx, STRING_CONSTANT_141
mov rdi, rbx
xor rax, rax
call printf
;[[ fn(x) : [ function void printf( [[char. fmt @ 0], [void arg1 @ 0]] ) ] ]]
;[[ int : 1]]
mov edx, 1
;[[ & : &], [ id : c]]
lea rbx, [rbp-32]
mov rsi, rbx
;[[ int : 0]]
xor edi, edi
and rdi, 0xffffffff
xor rax, rax
call _bool_fgets_pfd_tchar.size_t
;[[ fn(x) : [ function bool fgets( [[fd_t fd @ 8], [char. buffer @ 16], [size_t amt @ 24]] ) ] ]]
jmp _LWHILECMP_0x65
_LWHILESTART_0x64:
;[[ id : len], [ == : ==], [ id : size]]
mov r10, qword[rbp-16]
mov rbx, qword[rbp-40]
cmp rbx, r10
sete bl
mov al, bl
and al, 1
jz _LIFPOST_0x67
;[[ id : size]]
;[[ id : size]]
;[[ id : size], [ * : *], [ int : 2]]
mov r10, qword[rbp-16]
sal r10, 1
mov qword[rbp-16], r10
;[[ id : str]]
;[[ id : str]]
;[[ id : size]]
mov r10, qword[rbp-16]
mov rsi, r10
;[[ id : str]]
mov rdi, qword[rbp-24]
xor rax, rax
call realloc
mov qword[rbp-24], rax
;[[ fn(x) : [ function void. realloc( [[void. og @ 0], [size_t newsize @ 0]] ) ] ]]
jmp _LIFELSE_0x68
_LIFPOST_0x67:
_LIFELSE_0x68:
;[[ id : str], [ [ : [], [ id : len], [ ] : ]]]
mov r10, qword[rbp-40]
mov rbx, qword[rbp-24]
lea rbx, [rbx+r10*1]
;[[ id : str], [ [ : [], [ id : len], [ ] : ]]]
mov r10, qword[rbp-40]
mov rbx, qword[rbp-24]
lea rbx, [rbx+r10*1]
;[[ id : c]]
mov r10d, dword[rbp-32]
mov byte[rbx], r10b
;[[ int : 1]]
mov edx, 1
;[[ & : &], [ id : c]]
lea rbx, [rbp-32]
mov rsi, rbx
;[[ int : 0]]
xor edi, edi
and rdi, 0xffffffff
xor rax, rax
call _bool_fgets_pfd_tchar.size_t
;[[ fn(x) : [ function bool fgets( [[fd_t fd @ 8], [char. buffer @ 16], [size_t amt @ 24]] ) ] ]]
;[[ id : len]]
;[[ id : len]]
;[[ id : len], [ + : +], [ int : 1]]
mov r10, qword[rbp-40]
inc r10
mov qword[rbp-40], r10
_LWHILECMP_0x65:
;[[ id : c], [ != : !=], [ int : 10]]
mov r10d, 10
mov ebx, dword[rbp-32]
cmp ebx, r10d
setne bl
mov al, bl
and al, 1
jnz _LWHILESTART_0x64
_LWHILEEND_0x66:
;[[ id : str], [ [ : [], [ id : len], [ + : +], [ int : 1], [ ] : ]]]
mov rbx, qword[rbp-40]
inc rbx
mov r10, qword[rbp-24]
lea r10, [r10+rbx*1]
;[[ id : str], [ [ : [], [ id : len], [ + : +], [ int : 1], [ ] : ]]]
mov rbx, qword[rbp-40]
inc rbx
mov r10, qword[rbp-24]
lea r10, [r10+rbx*1]
;[[ int : 0]]
xor ebx, ebx
mov byte[r10], bl
;[[ id : len]]
mov rbx, qword[rbp-40]
mov rsi, rbx
;[[ id : str]]
mov rdi, qword[rbp-24]
xor rax, rax
call realloc
;[[ fn(x) : [ function void. realloc( [[void. og @ 0], [size_t newsize @ 0]] ) ] ]]
jmp ___char._getString_pchar.__return
___char._getString_pchar.__return:
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
jmp _LWHILECMP_0x6a
_LWHILESTART_0x69:
;[[ id : str]]
;[[ id : str]]
;[[ int : 1]]
mov ebx, 1
mov r10, qword[rbp-8]
add r10, rbx
mov qword[rbp-8], r10
_LWHILECMP_0x6a:
;[[ @ : @], [ id : str], [ == : ==], [ char : 32]]
mov rbx, qword[rbp-8]
and r10, 0xff
mov r10b, byte[rbx]
mov bl, 32
cmp r10b, bl
sete r10b
mov al, r10b
and al, 1
jnz _LWHILESTART_0x69
_LWHILEEND_0x6b:
;[[ $ : char], [ ( : (], [ @ : @], [ id : str], [ ) : )]]
mov rbx, qword[rbp-8]
and r10, 0xff
mov r10b, byte[rbx]
mov byte[rbp-24], r10b
;[[ int : 0]]
mov dword[rbp-32], 0
;[[ $ : bool], [ int : 0]]
xor ebx, ebx
and r10b, 0xff
mov byte[rbp-40], bl
;[[ id : c], [ == : ==], [ char : 45], [ && : &&], [ id : signed]]
mov r10b, 45
mov bl, byte[rbp-24]
cmp bl, r10b
sete bl
mov r10b, byte[rbp-16]
and bl, r10b
mov al, bl
and al, 1
jz _LIFPOST_0x6c
;[[ id : negative]]
;[[ id : negative]]
;[[ $ : bool], [ int : 1]]
mov r10d, 1
and r11b, 0xff
mov byte[rbp-40], r10b
;[[ id : str]]
;[[ id : str]]
;[[ int : 1]]
mov ebx, 1
mov r10, qword[rbp-8]
add r10, rbx
mov qword[rbp-8], r10
;[[ id : c]]
;[[ id : c]]
;[[ $ : char], [ ( : (], [ @ : @], [ id : str], [ ) : )]]
mov r10, qword[rbp-8]
and r11, 0xff
mov r11b, byte[r10]
mov byte[rbp-24], r11b
jmp _LIFELSE_0x6d
_LIFPOST_0x6c:
_LIFELSE_0x6d:
jmp _LWHILECMP_0x6f
_LWHILESTART_0x6e:
;[[ id : val]]
;[[ id : val]]
;[[ ( : (], [ id : val], [ * : *], [ int : 10], [ ) : )], [ + : +], [ ( : (], [ id : c], [ - : -], [ char : 48], [ ) : )]]
mov r11d, 10
mov r10d, dword[rbp-32]
imul r10d, r11d
mov r11b, byte[rbp-24]
sub r11b, 48
and r12d, 0xffffffff
mov r12d, r11d
add r10d, r12d
mov dword[rbp-32], r10d
;[[ id : str]]
;[[ id : str]]
;[[ int : 1]]
mov ebx, 1
mov r10, qword[rbp-8]
add r10, rbx
mov qword[rbp-8], r10
;[[ id : c]]
;[[ id : c]]
;[[ $ : char], [ ( : (], [ @ : @], [ id : str], [ ) : )]]
mov r10, qword[rbp-8]
and r11, 0xff
mov r11b, byte[r10]
mov byte[rbp-24], r11b
_LWHILECMP_0x6f:
;[[ id : c], [ != : !=], [ int : 0], [ && : &&], [ id : c], [ != : !=], [ int : 10], [ && : &&], [ id : c], [ != : !=], [ char : 32]]
mov bl, byte[rbp-24]
test bl, bl
setnz bl
mov r11b, byte[rbp-24]
mov r10d, 10
and r12d, 0xffffffff
mov r12d, r11d
cmp r12d, r10d
setne r12b
and bl, r12b
mov r11b, 32
mov r10b, byte[rbp-24]
cmp r10b, r11b
setne r10b
and bl, r10b
mov al, bl
and al, 1
jnz _LWHILESTART_0x6e
_LWHILEEND_0x70:
;[[ id : negative]]
mov bl, byte[rbp-40]
mov al, bl
and al, 1
jz _LIFPOST_0x71
;[[ int : 0], [ - : -], [ id : val]]
mov r10d, dword[rbp-32]
xor ebx, ebx
sub ebx, r10d
mov eax, ebx
jmp ___int_toInteger_pchar.bool__return
jmp _LIFELSE_0x72
_LIFPOST_0x71:
_LIFELSE_0x72:
;[[ id : val]]
mov ebx, dword[rbp-32]
mov eax, ebx
jmp ___int_toInteger_pchar.bool__return
___int_toInteger_pchar.bool__return:
leave
ret
;[ function int __scanf( [[char. format @ 8], [void.. args @ 16]] ) ]

__scanf:
push rbp
mov rbp, rsp
sub rsp, 40
;Load Parameter: [char. format @ 8]
mov [rbp-8], rdi
;Load Parameter: [void.. args @ 16]
mov [rbp-16], rsi
;[[ int : 0]]
xor edi, edi
and rdi, 0xffffffff
xor rax, rax
call _void._floads_pfd_t
;[[ fn(x) : [ function void. floads( [[fd_t fd @ 8]] ) ] ]]
mov rbx, rax
push rbx
;[[ id : args]]
mov r11, qword[rbp-16]
mov rdx, r11
;[[ id : inp]]
mov r11, rbx
mov rsi, r11
;[[ id : format]]
mov r11, qword[rbp-8]
mov rdi, r11
xor rax, rax
call _int___SSCANF_pchar.char.void..
pop rbx
;[[ fn(x) : [ function int __SSCANF( [[char. format @ 8], [char. input @ 16], [void.. args @ 24]] ) ] ]]
mov r10d, eax
push rbx
push r10
;[[ id : inp]]
mov rdi, rbx
xor rax, rax
call free
pop r10
pop rbx
;[[ fn(x) : [ function void free( [[void. ptr @ 0]] ) ] ]]
;[[ id : retval]]
mov r11d, r10d
mov eax, r11d
jmp ____scanf__return
____scanf__return:
leave
ret
;[ function int scanf( [[char. format @ 8], [void. a @ 16], [void. b @ 24], [void. c @ 32], [void. d @ 40], [void. e @ 48]] ) ]

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
mov r10d, 1
lea rbx, [rbp-96] 
and r10, 0xffffffff
lea rbx, [rbx+r10*8]
;[[ id : args], [ [ : [], [ int : 1], [ ] : ]]]
mov r10d, 1
lea rbx, [rbp-96] 
and r10, 0xffffffff
lea rbx, [rbx+r10*8]
;[[ id : b]]
mov r10, qword[rbp-24]
mov qword[rbx], r10
;[[ id : args], [ [ : [], [ int : 2], [ ] : ]]]
mov r10d, 2
lea rbx, [rbp-96] 
and r10, 0xffffffff
lea rbx, [rbx+r10*8]
;[[ id : args], [ [ : [], [ int : 2], [ ] : ]]]
mov r10d, 2
lea rbx, [rbp-96] 
and r10, 0xffffffff
lea rbx, [rbx+r10*8]
;[[ id : c]]
mov r10, qword[rbp-32]
mov qword[rbx], r10
;[[ id : args], [ [ : [], [ int : 3], [ ] : ]]]
mov r10d, 3
lea rbx, [rbp-96] 
and r10, 0xffffffff
lea rbx, [rbx+r10*8]
;[[ id : args], [ [ : [], [ int : 3], [ ] : ]]]
mov r10d, 3
lea rbx, [rbp-96] 
and r10, 0xffffffff
lea rbx, [rbx+r10*8]
;[[ id : d]]
mov r10, qword[rbp-40]
mov qword[rbx], r10
;[[ id : args], [ [ : [], [ int : 4], [ ] : ]]]
mov r10d, 4
lea rbx, [rbp-96] 
and r10, 0xffffffff
lea rbx, [rbx+r10*8]
;[[ id : args], [ [ : [], [ int : 4], [ ] : ]]]
mov r10d, 4
lea rbx, [rbp-96] 
and r10, 0xffffffff
lea rbx, [rbx+r10*8]
;[[ id : e]]
mov r10, qword[rbp-48]
mov qword[rbx], r10
;[[ & : &], [ id : args]]
lea rbx, [rbp-96]
mov rsi, rbx
;[[ id : format]]
mov rbx, qword[rbp-8]
mov rdi, rbx
xor rax, rax
call __scanf
;[[ fn(x) : [ function int __scanf( [[char. format @ 8], [void.. args @ 16]] ) ] ]]
jmp __scanf__return
__scanf__return:
leave
ret
;[ function int scanf( [[char. format @ 0], [void. a @ 0], [void. b @ 0], [void. c @ 0], [void. d @ 0]] ) ]


;[ function int scanf( [[char. format @ 0], [void. a @ 0], [void. b @ 0], [void. c @ 0]] ) ]


;[ function int scanf( [[char. format @ 0], [void. a @ 0], [void. b @ 0]] ) ]


;[ function int scanf( [[char. format @ 0], [void. a @ 0]] ) ]


;[ function int scanf( [[char. format @ 0]] ) ]


;[ function int isprime( [[ulong data @ 8]] ) ]

_int_isprime_pulong:
push rbp
mov rbp, rsp
sub rsp, 56
;Load Parameter: [ulong data @ 8]
mov [rbp-8], rdi
;[[ id : data]]
mov rsi, qword[rbp-8]
;[[ id : STRING_CONSTANT_142]]
mov rbx, STRING_CONSTANT_142
mov rdi, rbx
xor rax, rax
call printf
;[[ fn(x) : [ function void printf( [[char. fmt @ 0], [void arg1 @ 0]] ) ] ]]
;[[ id : data], [ && : &&], [ int : 15]]
mov r10d, 15
mov rbx, qword[rbp-8]
mov r11, r10
and rbx, r11
mov dword[rbp-16], ebx
;[[ id : data], [ >> : >>], [ int : 4]]
mov rbx, qword[rbp-8]
shr rbx, 4
mov qword[rbp-24], rbx
;[[ id : test]]
mov rdx, qword[rbp-24]
;[[ id : position]]
mov esi, dword[rbp-16]
;[[ id : STRING_CONSTANT_143]]
mov rbx, STRING_CONSTANT_143
mov rdi, rbx
xor rax, rax
call printf
;[[ fn(x) : [ function void printf( [[char. fmt @ 0], [void arg1 @ 0], [void arg2 @ 0]] ) ] ]]
;[[ int : 2]]
mov qword[rbp-32], 2
;[[ id : testn], [ + : +], [ int : 1]]
mov rbx, qword[rbp-32]
inc rbx
mov qword[rbp-40], rbx
jmp _LWHILECMP_0x74
_LWHILESTART_0x73:
;[[ id : divOut]]
;[[ id : divOut]]
;[[ id : test], [ / : /], [ id : testn]]
mov r11, qword[rbp-24]
mov r10, qword[rbp-32]
xor rdx, rdx
mov rax, r11
idiv r10
mov qword[rbp-40], rax
;[[ id : divMod]]
;[[ id : divMod]]
;[[ id : test], [ % : %], [ id : testn]]
mov r11, qword[rbp-24]
mov r10, qword[rbp-32]
xor rdx, rdx
mov rax, r11
idiv r10
mov qword[rbp-48], rdx
;[[ id : divMod], [ == : ==], [ int : 0]]
mov rbx, qword[rbp-48]
test rbx, rbx
setz bl
mov al, bl
and al, 1
jz _LIFPOST_0x76
;[[ ( : (], [ int : 0], [ ) : )]]
xor eax, eax
jmp ___int_isprime_pulong__return
jmp _LIFELSE_0x77
_LIFPOST_0x76:
_LIFELSE_0x77:
;[[ id : testn], [ ++ : ++]]
inc qword[rbp-32]
_LWHILECMP_0x74:
;[[ id : divOut], [ > : >], [ id : testn]]
mov r10, qword[rbp-32]
mov rbx, qword[rbp-40]
cmp rbx, r10
setg bl
mov al, bl
and al, 1
jnz _LWHILESTART_0x73
_LWHILEEND_0x75:
;[[ id : test]]
mov rsi, qword[rbp-24]
;[[ id : STRING_CONSTANT_144]]
mov rbx, STRING_CONSTANT_144
mov rdi, rbx
xor rax, rax
call printf
;[[ fn(x) : [ function void printf( [[char. fmt @ 0], [void arg1 @ 0]] ) ] ]]
;[[ ( : (], [ int : 1], [ ) : )]]
mov eax, 1
jmp ___int_isprime_pulong__return
___int_isprime_pulong__return:
leave
ret
;[ function int main( [] ) ]

main:
push rbp
mov rbp, rsp
sub rsp, 32
;[[ int : 16]]
mov qword[rbp-8], 16
;[[ int : 2]]
mov dword[rbp-16], 2
;[[ ( : (], [ id : val], [ << : <<], [ int : 4], [ ) : )], [ + : +], [ id : position]]
mov rbx, qword[rbp-8]
shl rbx, 4
mov r10d, dword[rbp-16]
mov r11, r10
add rbx, r11
mov qword[rbp-24], rbx
;[[ id : data]]
mov rsi, qword[rbp-24]
;[[ id : STRING_CONSTANT_145]]
mov rbx, STRING_CONSTANT_145
mov rdi, rbx
xor rax, rax
call printf
;[[ fn(x) : [ function void printf( [[char. fmt @ 0], [void arg1 @ 0]] ) ] ]]
;[[ int : 0]]
xor esi, esi
;[[ id : STRING_CONSTANT_146]]
mov rbx, STRING_CONSTANT_146
mov rdi, rbx
xor rax, rax
call printf
;[[ fn(x) : [ function void printf( [[char. fmt @ 0], [void arg1 @ 0]] ) ] ]]
;[[ id : data]]
mov rbx, qword[rbp-24]
mov rdi, rbx
xor rax, rax
call _int_isprime_pulong
mov rsi, rax
;[[ fn(x) : [ function int isprime( [[ulong data @ 8]] ) ] ]]
;[[ id : STRING_CONSTANT_147]]
mov rbx, STRING_CONSTANT_147
mov rdi, rbx
xor rax, rax
call printf
;[[ fn(x) : [ function void printf( [[char. fmt @ 0], [void arg1 @ 0]] ) ] ]]
__main__return:
leave
ret
