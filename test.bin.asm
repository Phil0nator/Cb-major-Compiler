
%ifndef IO_SYS
%define IO_SYS
%assign sasmMacroCount 0

%macro sasmMacroFunc 0.nolist ;func for debug
    %push sasmMacroFunc
    call %$sasmMacro
    jmp %$sasmMacroE
    %$sasmMacro:
    jmp %%after_data
section .data
    %$sasmRetAddr dq 0
section .text
    %%after_data:
    push rbx
    mov rbx, qword[rsp + 8]
    mov qword[%$sasmRetAddr], rbx
    mov rbx, qword[rsp]
    mov qword[rsp + 8], rbx
    pop rbx
    pop rbx
%endmacro

%macro sasmMacroFuncE 0.nolist ;exit
    push qword[%$sasmRetAddr]
    ret
    %$sasmMacroE:
    %pop
%endmacro

%macro CEXTERN 1.nolist
    extern %1
%endmacro
%define CMAIN main

CEXTERN printf
CEXTERN scanf
CEXTERN putchar
CEXTERN fgets
CEXTERN puts
CEXTERN fputs
CEXTERN fflush

CEXTERN get_stdin
CEXTERN get_stdout


CEXTERN malloc
CEXTERN strcat
CEXTERN realloc
CEXTERN calloc
CEXTERN free

CEXTERN fabsf
CEXTERN atoi


CEXTERN thrd_create
CEXTERN thrd_equal
CEXTERN thrd_detach
CEXTERN thrd_join



CEXTERN inet_aton

; Make stack be 16 bytes aligned
%macro ALIGN_STACK 0.nolist
    enter 0, 0
    and rsp, 0xfffffffffffffff0
%endmacro

%macro UNALIGN_STACK 0.nolist
    leave
%endmacro

%macro FFLUSH_STDOUT 0.nolist
    ALIGN_STACK
    call get_stdout
    mov rdi, rax
    call fflush
    UNALIGN_STACK
%endmacro

%macro IS_GPR 1.nolist
    %push IS_GPR
    %assign %$is_reg 0
    %assign %$reg_size 1
    %ifidni %1, ah
        %assign %$is_reg 1
    %elifidni %1, al
        %assign %$is_reg 1
    %elifidni %1, bl
        %assign %$is_reg 1
    %elifidni %1, bh
        %assign %$is_reg 1
    %elifidni %1, cl
        %assign %$is_reg 1
    %elifidni %1, ch
        %assign %$is_reg 1
    %elifidni %1, dl
        %assign %$is_reg 1
    %elifidni %1, dh
        %assign %$is_reg 1
    %elifidni %1, spl
        %assign %$is_reg 1
    %elifidni %1, bpl
        %assign %$is_reg 1
    %elifidni %1, dil
        %assign %$is_reg 1
    %elifidni %1, sil
        %assign %$is_reg 1
    %elifidni %1, ax
        %assign %$is_reg 1
        %assign %$reg_size 2
    %elifidni %1, bx
        %assign %$is_reg 1
        %assign %$reg_size 2
    %elifidni %1, cx
        %assign %$is_reg 1
        %assign %$reg_size 2
    %elifidni %1, dx
        %assign %$is_reg 1
        %assign %$reg_size 2
    %elifidni %1, sp
        %assign %$is_reg 1
        %assign %$reg_size 2
    %elifidni %1, bp
        %assign %$is_reg 1
        %assign %$reg_size 2
    %elifidni %1, si
        %assign %$is_reg 1
        %assign %$reg_size 2
    %elifidni %1, di
        %assign %$is_reg 1
        %assign %$reg_size 2
    %elifidni %1, eax
        %assign %$is_reg 1
        %assign %$reg_size 4
    %elifidni %1, ebx
        %assign %$is_reg 1
        %assign %$reg_size 4
    %elifidni %1, ecx
        %assign %$is_reg 1
        %assign %$reg_size 4
    %elifidni %1, edx
        %assign %$is_reg 1
        %assign %$reg_size 4
    %elifidni %1, esp
        %assign %$is_reg 1
        %assign %$reg_size 4
    %elifidni %1, ebp
        %assign %$is_reg 1
        %assign %$reg_size 4
    %elifidni %1, esi
        %assign %$is_reg 1
        %assign %$reg_size 4
    %elifidni %1, edi
        %assign %$is_reg 1
        %assign %$reg_size 4
    %elifidni %1, rax
        %assign %$is_reg 1
        %assign %$reg_size 8
    %elifidni %1, rbx
        %assign %$is_reg 1
        %assign %$reg_size 8
    %elifidni %1, rcx
        %assign %$is_reg 1
        %assign %$reg_size 8
    %elifidni %1, rdx
        %assign %$is_reg 1
        %assign %$reg_size 8
    %elifidni %1, rsp
        %assign %$is_reg 1
        %assign %$reg_size 8
    %elifidni %1, rbp
        %assign %$is_reg 1
        %assign %$reg_size 8
    %elifidni %1, rsi
        %assign %$is_reg 1
        %assign %$reg_size 8
    %elifidni %1, rdi
        %assign %$is_reg 1
        %assign %$reg_size 8
    %elifidni %1, r8
        %assign %$is_reg 1
        %assign %$reg_size 8
    %elifidni %1, r9
        %assign %$is_reg 1
        %assign %$reg_size 8
    %elifidni %1, r10
        %assign %$is_reg 1
        %assign %$reg_size 8
    %elifidni %1, r11
        %assign %$is_reg 1
        %assign %$reg_size 8
    %elifidni %1, r12
        %assign %$is_reg 1
        %assign %$reg_size 8
    %elifidni %1, r13
        %assign %$is_reg 1
        %assign %$reg_size 8
    %elifidni %1, r14
        %assign %$is_reg 1
        %assign %$reg_size 8
    %elifidni %1, r15
        %assign %$is_reg 1
        %assign %$reg_size 8
    %elifidni %1, r8d
        %assign %$is_reg 1
        %assign %$reg_size 4
    %elifidni %1, r9d
        %assign %$is_reg 1
        %assign %$reg_size 4
    %elifidni %1, r10d
        %assign %$is_reg 1
        %assign %$reg_size 4
    %elifidni %1, r11d
        %assign %$is_reg 1
        %assign %$reg_size 4
    %elifidni %1, r12d
        %assign %$is_reg 1
        %assign %$reg_size 4
    %elifidni %1, r13d
        %assign %$is_reg 1
        %assign %$reg_size 4
    %elifidni %1, r14d
        %assign %$is_reg 1
        %assign %$reg_size 4
    %elifidni %1, r15d
        %assign %$is_reg 1
        %assign %$reg_size 4
    %elifidni %1, r8w
        %assign %$is_reg 1
        %assign %$reg_size 2
    %elifidni %1, r9w
        %assign %$is_reg 1
        %assign %$reg_size 2
    %elifidni %1, r10w
        %assign %$is_reg 1
        %assign %$reg_size 2
    %elifidni %1, r11w
        %assign %$is_reg 1
        %assign %$reg_size 2
    %elifidni %1, r12w
        %assign %$is_reg 1
        %assign %$reg_size 2
    %elifidni %1, r13w
        %assign %$is_reg 1
        %assign %$reg_size 2
    %elifidni %1, r14w
        %assign %$is_reg 1
        %assign %$reg_size 2
    %elifidni %1, r15w
        %assign %$is_reg 1
        %assign %$reg_size 2
    %elifidni %1, r8b
        %assign %$is_reg 1
        %assign %$reg_size 1
    %elifidni %1, r9b
        %assign %$is_reg 1
        %assign %$reg_size 1
    %elifidni %1, r10b
        %assign %$is_reg 1
        %assign %$reg_size 1
    %elifidni %1, r11b
        %assign %$is_reg 1
        %assign %$reg_size 1
    %elifidni %1, r12b
        %assign %$is_reg 1
        %assign %$reg_size 1
    %elifidni %1, r13b
        %assign %$is_reg 1
        %assign %$reg_size 1
    %elifidni %1, r14b
        %assign %$is_reg 1
        %assign %$reg_size 1
    %elifidni %1, r15b
        %assign %$is_reg 1
        %assign %$reg_size 1
    %endif
%endmacro

%macro PRINT_STRING 1.nolist
    sasmMacroFunc
    IS_GPR %1
    %if %$is_reg = 1
        %error "Register as parameter is not supported"
    %endif
    %pop
%ifid %1
; variable
    pushfq
    push rax
    push rcx
    push rdx
    push r8
    push r9
    push r10
    push r11
    push rsi
    push rdi
    ALIGN_STACK
    call get_stdout
    mov rdi, %1
    mov rsi, rax
%elifstr %1
; string literal
    jmp %%after_str
section .data
    %%str db %1, 0
section .text
    %%after_str:
    pushfq
    push rax
    push rcx
    push rdx
    push r8
    push r9
    push r10
    push r11
    push rsi
    push rdi
    ALIGN_STACK
    call get_stdout
    mov rdi, %%str
    mov rsi, rax
%else
; address expression
    jmp %%after_data
section .data
    %%tmp dq 0
section .text
    %%after_data:
    mov qword[%%tmp], rbx
    lea rbx, %1
    pushfq
    push rax
    push rcx
    push rdx
    push r8
    push r9
    push r10
    push r11
    push rsi
    push rdi
    ALIGN_STACK
    call get_stdout
    mov rdi, rbx
    mov rsi, rax
    mov rbx, qword[%%tmp]
%endif
    call fputs
    UNALIGN_STACK
    FFLUSH_STDOUT
    pop rdi
    pop rsi
    pop r11
    pop r10
    pop r9
    pop r8
    pop rdx
    pop rcx
    pop rax
    popfq
    sasmMacroFuncE
%endmacro

%macro NEWLINE 0.nolist
    PRINT_STRING `\n`
%endmacro

; size baseformatletter ("d", "u", "x") varname (%%fmt)
%macro ___MAKE_FORMAT_STR 3.nolist
    jmp %%after_fmt
    %if %1 = 1
        %strcat fmts "%hh" %2
    %elif %1 = 2
        %strcat fmts "%h" %2
    %elif %1 = 4
        %strcat fmts "%" %2
    %elif %1 = 8
        %strcat fmts "%ll" %2
    %else
        %error "Expected numeric constant 1, 2, 4 or 8 as 1st argument"
    %endif
    %3 db fmts, 0
    %%after_fmt:
%endmacro

; size data baseformatletter ("d", "u", "x") signextendinst (movzx, movsx)
%macro ___PRINT_NUM_COMMON 4.nolist
    ___MAKE_FORMAT_STR %1, %3, %%fmt
    IS_GPR %2
%if %$is_reg = 1
; register
    jmp %%after_data
section .data
    %%tmp dq 0
section .text
    %%after_data:
    mov qword[%%tmp], rax    
    %if %$reg_size = 1
        %4 rax, %2
    %elif %$reg_size = 2
        %4 rax, %2
    %elif %$reg_size = 4
        movsx rax, %2
        %ifidni %4, movzx
            pushfq
            shl rax, 32
            shr rax, 32
            popfq
        %endif
    %else ; %$reg_size = 8
        mov rax, %2
    %endif
    pushfq
    push qword[%%tmp] ;rax
    push rcx
    push rdx
    push r8
    push r9
    push r10
    push r11
    push rsi
    push rdi
    ALIGN_STACK
    mov rsi, rax
%elifid %2
; variable (hope so)
    pushfq
    push rax
    push rcx
    push rdx
    push r8
    push r9
    push r10
    push r11
    push rsi
    push rdi
    %if %1 = 1
        %4 rax, byte [%2]
    %elif %1 = 2
        %4 rax, word [%2]
    %elif %1 = 4
        movsx rax, dword [%2]
        %ifidni %4, movzx
            pushfq
            shl rax, 32
            shr rax, 32
            popfq
        %endif
    %else ; %1 = 8
        mov rax, qword [%2]
    %endif
    mov rsi, rax
    ALIGN_STACK
%elifnum %2
    pushfq
    push rax
    push rcx
    push rdx
    push r8
    push r9
    push r10
    push r11
    push rsi
    push rdi
    mov rsi, %2
    ALIGN_STACK
%elifstr %2
    pushfq
    push rax
    push rcx
    push rdx
    push r8
    push r9
    push r10
    push r11
    push rsi
    push rdi
    mov rsi, %2
    ALIGN_STACK
%else
; may be, address expression?
jmp %%after_data
section .data
    %%tmp dq 0
section .text
    %%after_data:
    mov qword[%%tmp], rax
    %if %1 = 1
        %4 rax, byte %2
    %elif %1 = 2
        %4 rax, word %2
    %elif %1 = 4
        movsx rax, dword %2
        %ifidni %4, movzx
            pushfq
            shl rax, 32
            shr rax, 32
            popfq
        %endif
    %else ; %1 = 8
        mov rax, qword %2
    %endif
    pushfq
    push qword[%%tmp] ;rax
    push rcx
    push rdx
    push r8
    push r9
    push r10
    push r11
    push rsi
    push rdi
    ALIGN_STACK
    mov rsi, rax
%endif
    mov rdi, %%fmt
    call printf
    UNALIGN_STACK
    FFLUSH_STDOUT
    pop rdi
    pop rsi
    pop r11
    pop r10
    pop r9
    pop r8
    pop rdx
    pop rcx
    pop rax
    popfq 
    %pop ; IS_REG    
%endmacro

%macro PRINT_DEC 2.nolist
    sasmMacroFunc
    ___PRINT_NUM_COMMON %1, %2, "d", movsx
    sasmMacroFuncE
%endmacro

%macro PRINT_UDEC 2.nolist
    sasmMacroFunc
    ___PRINT_NUM_COMMON %1, %2, "u", movzx
    sasmMacroFuncE
%endmacro

%macro PRINT_HEX 2.nolist
    sasmMacroFunc
    ___PRINT_NUM_COMMON %1, %2, "x", movzx
    sasmMacroFuncE
%endmacro

%macro PRINT_CHAR 1.nolist
    sasmMacroFunc
    IS_GPR %1
%if %$is_reg = 1
; register
    jmp %%after_data
section .data
    %%tmp dq 0
section .text
    %%after_data:
    mov qword[%%tmp], rax    
    %if %$reg_size = 1
        movzx rax, %1
    %elif %$reg_size = 2
        movzx rax, %1
    %elif %$reg_size = 4
        movsx rax, %1
        pushfq
        shl rax, 32
        shr rax, 32
        popfq
    %else ; %$reg_size = 8
        mov rax, %1
    %endif
    pushfq
    push qword[%%tmp] ;rax
    push rcx
    push rdx
    push r8
    push r9
    push r10
    push r11
    push rsi
    push rdi
    and rax, 0xff
    mov rdi, rax
    ALIGN_STACK
%elifid %1
; variable (hope so)
    pushfq
    push rax
    push rcx
    push rdx
    push r8
    push r9
    push r10
    push r11
    push rsi
    push rdi
    movzx rax, byte [%1]
    mov rdi, rax
    ALIGN_STACK
%elifnum %1
    pushfq
    push rax
    push rcx
    push rdx
    push r8
    push r9
    push r10
    push r11
    push rsi
    push rdi
    mov rdi, %1
    and rdi, 0xff
    ALIGN_STACK
%elifstr %1
; string select only 1st byte
%substr tstr %1 1
    pushfq
    push rax
    push rcx
    push rdx
    push r8
    push r9
    push r10
    push r11
    push rsi
    push rdi
    mov rdi, tstr
    ALIGN_STACK
%else
; may be, address expression?
    jmp %%after_data
section .data
    %%tmp dq 0
section .text
    %%after_data:
    mov qword[%%tmp], rax
    movzx rax, byte %1
    pushfq
    push qword[%%tmp] ;rax
    push rcx
    push rdx
    push r8
    push r9
    push r10
    push r11
    push rsi
    push rdi
    mov rdi, rax
    ALIGN_STACK
%endif
    call putchar
    UNALIGN_STACK
    FFLUSH_STDOUT
    pop rdi
    pop rsi
    pop r11
    pop r10
    pop r9
    pop r8
    pop rdx
    pop rcx
    pop rax
    popfq
    %pop ; IS_REG
    sasmMacroFuncE
%endmacro

; size data baseformatletter ("d", "u", "x") signextendinst (movzx, movsx)
%macro ___GET_NUM_COMMON 4.nolist
    ___MAKE_FORMAT_STR %1, %3, %%fmt        
    jmp %%after_data
section .data
    %%read_tmp dq 0
    %%tmp dq 0
section .text
    %%after_data:
    IS_GPR %2
%if %$is_reg = 1
; register
    %ifidni %2, rsp
        %error "Won't read to rsp!" 
    %elifidni %2, esp
        %error "Won't read to esp!" 
    %elifidni %2, sp
        %error "Won't read to sp!"
    %elifidni %2, spl
        %error "Won't read to sp!" 
    %endif
    %if %$reg_size < %1
        %error "Too small register for requested data"
    %endif
; we will have to do postprocessing after scanf
    pushfq
    push rax
    push rcx
    push rdx
    push r8
    push r9
    push r10
    push r11
    push rsi
    push rdi
    mov rsi, %%read_tmp
    ALIGN_STACK
%elifid %2
; variable (hope so)
    pushfq
    push rax
    push rcx
    push rdx
    push r8
    push r9
    push r10
    push r11
    push rsi
    push rdi
    mov rsi, %2
    ALIGN_STACK
%elifnum %2
    %error "Incorrect parameter (number)"
%elifstr %2
    %error "Incorrect parameter (string)"
%else
; may be, address expression?
    mov qword[%%tmp], rax
    lea rax, %2
    pushfq
    push qword[%%tmp] ;rax
    push rcx
    push rdx
    push r8
    push r9
    push r10
    push r11
    push rsi
    push rdi
    ALIGN_STACK
    mov rsi, rax
%endif
    mov rdi, %%fmt
    call scanf
    UNALIGN_STACK
    pop rdi
    pop rsi
    pop r11
    pop r10
    pop r9
    pop r8
    pop rdx
    pop rcx
    pop rax
    popfq
%if %$is_reg = 1
    ; register postprocessing
    %if %$reg_size = %1
        mov %2, [%%read_tmp]
    %else ; extend bytes 1 -> 2, 1 -> 4, 1 -> 8, 2 -> 4, 2 -> 8, 4 -> 8
        %if %1 = 1
            %4 %2, byte [%%read_tmp]
        %elif %1 = 2
            %4 %2, word [%%read_tmp]
        %else ; 4
            movsx %2, dword [%%read_tmp]
            %ifidni %4, movzx
                pushfq
                shl %2, 32
                shr %2, 32
                popfq
            %endif
        %endif
    %endif
%endif
    %pop ; IS_REG
%endmacro

%macro GET_HEX 2.nolist
    sasmMacroFunc
    ___GET_NUM_COMMON %1, %2, "x", movzx
    sasmMacroFuncE
%endmacro

%macro GET_DEC 2.nolist
    sasmMacroFunc
    ___GET_NUM_COMMON %1, %2, "d", movsx
    sasmMacroFuncE
%endmacro

%macro GET_UDEC 2.nolist
    sasmMacroFunc
    ___GET_NUM_COMMON %1, %2, "u", movzx
    sasmMacroFuncE
%endmacro


%macro GET_CHAR 1.nolist
    sasmMacroFunc
    jmp %%after_data
section .data
    %%fmt db "%c", 0
    %%read_tmp db 0
    %%tmp dq 0
section .text
%%after_data:
    IS_GPR %1
%if %$is_reg = 1
; register
    %ifidni %1, rsp
        %error "Won't read to rsp!" 
    %elifidni %1, esp
        %error "Won't read to esp!" 
    %elifidni %1, sp
        %error "Won't read to sp!" 
    %elifidni %1, spl
        %error "Won't read to spl!" 
    %endif
; we will have to do postprocessing after scanf
    pushfq
    push rax
    push rcx
    push rdx
    push r8
    push r9
    push r10
    push r11
    push rsi
    push rdi
    mov rsi, %%read_tmp
    ALIGN_STACK
%elifid %1
; variable (hope so)
    pushfq
    push rax
    push rcx
    push rdx
    push r8
    push r9
    push r10
    push r11
    push rsi
    push rdi
    mov rsi, %1
    ALIGN_STACK    
%elifnum %1
    %error "Incorrect parameter (number)"
%elifstr %1
    %error "Incorrect parameter (string)"
%else
; may be, address expression?
    mov qword[%%tmp], rax
    lea rax, %1
    pushfq
    push qword[%%tmp] ;rax
    push rcx
    push rdx
    push r8
    push r9
    push r10
    push r11
    push rsi
    push rdi
    ALIGN_STACK
    mov rsi, rax
%endif
    mov rdi, %%fmt
    call scanf
    UNALIGN_STACK
    pop rdi
    pop rsi
    pop r11
    pop r10
    pop r9
    pop r8
    pop rdx
    pop rcx
    pop rax
    popfq
%if %$is_reg = 1
    ; register postprocessing
    %if %$reg_size = 1
        mov %1, byte [%%read_tmp]
    %else ; zero extend bytes 1 -> 2, 1 -> 4, 1 -> 8
        movzx %1, byte [%%read_tmp]
    %endif
%endif
    %pop ; IS_REG
    sasmMacroFuncE
%endmacro

%macro GET_STRING 2.nolist
    sasmMacroFunc
    IS_GPR %1
    %if %$is_reg = 1
        %error "Incorrect 1st parameter (register)"
    %endif    
    %pop ;IS_GPR
    IS_GPR %2    
    %if %$is_reg = 1
        ;
    %elifnum %2
        %if %2 <= 0
            %error "Second parameter must be positive"
        %endif
    %else
        %error "Second parameter must be numeric constant or register"
    %endif
    %pop ;IS_GPR
%ifid %1
; variable (hope so)
    pushfq
    push rax
    push rcx
    push rdx
    push r8
    push r9
    push r10
    push r11
    push rsi
    push rdi
    ;count
    IS_GPR %2
    %if %$is_reg = 1 
        %if %$reg_size = 1
            movzx rsi, %2
        %elif %$reg_size = 2
            movzx rsi, %2
        %elif %$reg_size = 4
            movsx rsi, %2
            pushfq
            shl rsi, 32
            shr rsi, 32
            popfq
        %else ; %$reg_size = 8
            mov rsi, %2
        %endif
    %else
        mov rsi, %2
    %endif
    %pop
    mov rdi, %1
    ALIGN_STACK
    call get_stdin
    mov rdx, rax
%elifnum %1
    %error "Incorrect 1st parameter (number)"
%elifstr %1
    %error "Incorrect 1st parameter (string)"
%else
; may be, address expression?
    jmp %%after_data
section .data
    %%tmp dq 0
section .text
%%after_data:
    mov qword[%%tmp], rbx
    lea rbx, %1
    pushfq
    push rax
    push rcx
    push rdx
    push r8
    push r9
    push r10
    push r11
    push rsi
    push rdi
    ;count
    IS_GPR %2
    %if %$is_reg = 1 
        %if %$reg_size = 1
            movzx rsi, %2
        %elif %$reg_size = 2
            movzx rsi, %2
        %elif %$reg_size = 4
            movsx rsi, %2
            pushfq
            shl rsi, 32
            shr rsi, 32
            popfq
        %else ; %$reg_size = 8
            mov rsi, %2
        %endif
    %else
        mov rsi, %2
    %endif
    %pop
    mov rdi, rbx
    ALIGN_STACK
    call get_stdin
    mov rdx, rax
    mov rbx, qword[%%tmp]
%endif
    call fgets
    UNALIGN_STACK
    pop rdi
    pop rsi
    pop r11
    pop r10
    pop r9
    pop r8
    pop rdx
    pop rcx
    pop rax
    popfq
    sasmMacroFuncE
%endmacro
%endif
%define SYS_mmap	9

%define CSIGNAL 0x000000ff
%define CLONE_VM 0x00000100
%define CLONE_FS 0x00000200
%define CLONE_FILES 0x00000400
%define CLONE_SIGHAND 0x00000800
%define CLONE_PTRACE 0x00002000
%define CLONE_VFORK 0x00004000
%define CLONE_PARENT 0x00008000
%define CLONE_THREAD 0x00010000
%define CLONE_NEWNS 0x00020000
%define CLONE_SYSVSEM 0x00040000
%define CLONE_SETTLS 0x00080000
%define CLONE_PARENT_SETTID 0x00100000
%define CLONE_CHILD_CLEARTID 0x00200000
%define CLONE_DETACHED 0x00400000 
%define CLONE_UNTRACED 0x00800000 
%define CLONE_CHILD_SETTID 0x01000000 
%define CLONE_NEWCGROUP 0x02000000 
%define CLONE_NEWUTS 0x04000000 
%define CLONE_NEWIPC 0x08000000 
%define CLONE_NEWUSER 0x10000000 
%define CLONE_NEWPID 0x20000000 
%define CLONE_NEWNET 0x40000000 
%define CLONE_IO 0x80000000 
%define THREAD_FLAGS CLONE_VM|CLONE_FS|CLONE_FILES|CLONE_SIGHAND|CLONE_PARENT|CLONE_THREAD|CLONE_IO

%define PROT_READ 1
%define PROT_WRITE 2
%define PROT_EXEC 4
%define PROT_NONE 0
%define PROT_GROWSDOWN 16777216
%define PROT_GROWSUP 33554432
%define MAP_SHARED 1
%define MAP_PRIVATE 2
%define MAP_SHARED_VALIDATE 3
%define MAP_TYPE 15
%define MAP_ANONYMOUS 32
%define MAP_GROWSDOWN 0x00100
%define MAP_STACK 0x20000

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;
;PROGRAM START
;
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


section .data
STRING_CONSTANT_0: db `%g`, 0
STRING_CONSTANT_1: db `True`, 0
STRING_CONSTANT_2: db `False`, 0
STRING_CONSTANT_3: db `Memory error encountered`, 0
FLT_CONSTANT_0: dq __float32__(-1.0)
FLT_CONSTANT_1: dq __float32__(1.0)
FLT_CONSTANT_2: dq __float32__(1.192092896e-32)
FLT_CONSTANT_3: dq __float32__(3.141592653589793)
FLT_CONSTANT_4: dq __float32__(2.718281828459045)
FLT_CONSTANT_5: dq __float32__(1.4426950408889634)
FLT_CONSTANT_6: dq __float32__(0.4342944819032518)
FLT_CONSTANT_7: dq __float32__(0.6931471805599453)
FLT_CONSTANT_8: dq __float32__(1.5707963267948966)
FLT_CONSTANT_9: dq __float32__(0.7853981633974483)
FLT_CONSTANT_10: dq __float32__(0.3183098861837907)
FLT_CONSTANT_11: dq __float32__(0.6366197723675814)
FLT_CONSTANT_12: dq __float32__(1.1283791670955126)
FLT_CONSTANT_13: dq __float32__(1.4142135623730951)
FLT_CONSTANT_14: dq __float32__(0.7071067811865476)
FLT_CONSTANT_15: dq __float32__(1.5708)
FLT_CONSTANT_16: dq __float32__(2147483646.0)
STRING_CONSTANT_4: db `@ `, 0
STRING_CONSTANT_5: db `%i, `, 0
STRING_CONSTANT_6: db `%i ]\n`, 0
STRING_CONSTANT_7: db `[ `, 0
STRING_CONSTANT_8: db ` %s ]`, 0
STRING_CONSTANT_9: db `%s, `, 0
STRING_CONSTANT_10: db `%s ]\n`, 0
STRING_CONSTANT_11: db ``, 0
FLT_CONSTANT_17: dq __float32__(32767.0)
STRING_CONSTANT_12: db `[ `, 0
STRING_CONSTANT_13: db `%i, `, 0
STRING_CONSTANT_14: db `%i ]\n`, 0
STRING_CONSTANT_15: db `[ `, 0
STRING_CONSTANT_16: db `%s, `, 0
STRING_CONSTANT_17: db `%s ]\n`, 0
STRING_CONSTANT_18: db `Stack: Error: StackOverflow.`, 0
STRING_CONSTANT_19: db `The number of commandline arguments is: %u\n`, 0
__FLT_STANDARD_1: dq __float32__(1.0)
__BOOL_STANDARD_TRUE: dq -0x1
__BOOL_STANDARD_FALSE: dq 0x0
__PRINTFFLOAT: db `%g`, 0
__PRINTTRUE: db `True`, 0
__PRINTFALSE: db `False`, 0
__isincluded__MEMORY_: dq 0x96c6
INF: dq 0x7fffffffffffffff
FLT_NEGATIVE1: dq __float32__(-1.0)
FLT_ONE: dq __float32__(1.0)
EPSILON: dq __float32__(1.192092896e-32)
M_PI: dq __float32__(3.141592653589793)
M_E: dq __float32__(2.718281828459045)
M_LOG2E: dq __float32__(1.4426950408889634)
M_LOG10E: dq __float32__(0.4342944819032518)
M_LN2: dq __float32__(0.6931471805599453)
M_PI_2: dq __float32__(1.5707963267948966)
M_PI_4: dq __float32__(0.7853981633974483)
M_1_PI: dq __float32__(0.3183098861837907)
M_2_PI: dq __float32__(0.6366197723675814)
M_2_SQRTPI: dq __float32__(1.1283791670955126)
M_SQRT2: dq __float32__(1.4142135623730951)
M_SQRT1_2: dq __float32__(0.7071067811865476)
RDN_90: dq __float32__(1.5708)
FLT_MAX: dq __float32__(2147483646.0)
INTMAX: dq 0x7fffffffffffffff
O_RDONLY: dq 0x0
O_WRONLY: dq 0x1
O_RDWR: dq 0x2
O_USRPERM: dq 0x1a4
WMODE_WRITE: dq 0x0
WMODE_APPEND: dq 0x400
WMODE_WPLUS: dq 0x41
WMODE_WPLUSA: dq 0x441
O_CREATE: dq 0x40
SEEK_CUR: dq 0x1
RAND_MAX: dq __float32__(32767.0)
CLOCK_MONOTONIC: dq 0x1
SOCK_STREAM: dq 0x1
SOCK_DGRAM: dq 0x2
SOCK_RAW: dq 0x3
SOCK_RDM: dq 0x4
SOCK_SEQPACKET: dq 0x5
SOCK_PACKET: dq 0xa
AF_UNSPEC: dq 0x0
AF_UNIX: dq 0x1
AF_INET: dq 0x2
AF_AX25: dq 0x3
AF_IPX: dq 0x4
AF_APPLETALK: dq 0x5
AF_NETROM: dq 0x6
AF_BRIDGE: dq 0x7
AF_AAL5: dq 0x8
AF_X25: dq 0x9
AF_INET6: dq 0xa
AF_MAX: dq 0xc
SOCK_NOPROT: dq 0x0
SOMAXCONN: dq 0x80
MSG_OOB: dq 0x1
MSG_PEEK: dq 0x2
MSG_DONTROUTE: dq 0x4
MSG_PROXY: dq 0x10
SOL_IP: dq 0x0
SOL_IPX: dq 0x100
SOL_AX25: dq 0x101
SOL_ATALK: dq 0x102
SOL_NETROM: dq 0x103
SOL_TCP: dq 0x6
SOL_UDP: dq 0x11
IP_TOS: dq 0x1
IPTOS_LOWDELAY: dq 0x10
IPTOS_THROUGHPUT: dq 0x8
IPTOS_RELIABILITY: dq 0x4
IP_TTL: dq 0x2
IP_HDRINCL: dq 0x3
IP_OPTIONS: dq 0x4
IP_MULTICAST_IF: dq 0x20
IP_MULTICAST_TTL: dq 0x21
IP_MULTICAST_LOOP: dq 0x22
IP_ADD_MEMBERSHIP: dq 0x23
IP_DROP_MEMBERSHIP: dq 0x24
IP_DEFAULT_MULTICAST_TTL: dq 0x1
IP_DEFAULT_MULTICAST_LOOP: dq 0x1
IP_MAX_MEMBERSHIPS: dq 0x14
IPX_TYPE: dq 0x1
TCP_NODELAY: dq 0x1
TCP_MAXSEG: dq 0x2
SOPRI_INTERACTIVE: dq 0x0
SOPRI_NORMAL: dq 0x1
SOPRI_BACKGROUND: dq 0x2
SIZEOF_SOCKADDR_IN: dq 0x20
FLT_STANDARD_ZERO: dq __float32__(0.0)
isFloat: dq 0x1



section .bss
__expstack_int0: resb 0x8
__expstack_flt0: resb 0x8
__expstack_int1: resb 0x8
__expstack_flt1: resb 0x8
__expstack_int2: resb 0x8
__expstack_flt2: resb 0x8
__expstack_int3: resb 0x8
__expstack_flt3: resb 0x8
__expstack_int4: resb 0x8
__expstack_flt4: resb 0x8
__expstack_int5: resb 0x8
__expstack_flt5: resb 0x8
__expstack_int6: resb 0x8
__expstack_flt6: resb 0x8
__expstack_int7: resb 0x8
__expstack_flt7: resb 0x8
__expstack_int8: resb 0x8
__expstack_flt8: resb 0x8
__expstack_int9: resb 0x8
__expstack_flt9: resb 0x8
__expstack_int10: resb 0x8
__expstack_flt10: resb 0x8
__expstack_int11: resb 0x8
__expstack_flt11: resb 0x8
__expstack_int12: resb 0x8
__expstack_flt12: resb 0x8
__expstack_int13: resb 0x8
__expstack_flt13: resb 0x8
__expstack_int14: resb 0x8
__expstack_flt14: resb 0x8
__expstack_int15: resb 0x8
__expstack_flt15: resb 0x8
__expstack_int16: resb 0x8
__expstack_flt16: resb 0x8
__expstack_int17: resb 0x8
__expstack_flt17: resb 0x8
__expstack_int18: resb 0x8
__expstack_flt18: resb 0x8
__expstack_int19: resb 0x8
__expstack_flt19: resb 0x8
__expstack_int20: resb 0x8
__expstack_flt20: resb 0x8
__expstack_int21: resb 0x8
__expstack_flt21: resb 0x8
__expstack_int22: resb 0x8
__expstack_flt22: resb 0x8
__expstack_int23: resb 0x8
__expstack_flt23: resb 0x8
__expstack_int24: resb 0x8
__expstack_flt24: resb 0x8
__expstack_int25: resb 0x8
__expstack_flt25: resb 0x8
__expstack_int26: resb 0x8
__expstack_flt26: resb 0x8
__expstack_int27: resb 0x8
__expstack_flt27: resb 0x8
__expstack_int28: resb 0x8
__expstack_flt28: resb 0x8
__expstack_int29: resb 0x8
__expstack_flt29: resb 0x8
__expstack_int30: resb 0x8
__expstack_flt30: resb 0x8
__expstack_int31: resb 0x8
__expstack_flt31: resb 0x8
currentVector: resb 0x8
current_filereader: resb 0x8



section .text
global CMAIN



Vector:

push rbp
mov rbp, rsp
sub rsp, 0x8

ALIGN_STACK
   xor r11, r11
   xor r12, r12
   mov rdi, 0x20
   call malloc
   xor r11, r11
   xor r12, r12
   test rax, rax ; check for error

   ;mov byte[rax+0x20], 0x0

   mov r8, rax
   UNALIGN_STACK
leave
ret

        
String:

push rbp
mov rbp, rsp
sub rsp, 0x8

ALIGN_STACK
   xor r11, r11
   xor r12, r12
   mov rdi, 0x10
   call malloc
   xor r11, r11
   xor r12, r12
   test rax, rax ; check for error

   ;mov byte[rax+0x10], 0x0

   mov r8, rax
   UNALIGN_STACK
leave
ret

        
FileReader:

push rbp
mov rbp, rsp
sub rsp, 0x8

ALIGN_STACK
   xor r11, r11
   xor r12, r12
   mov rdi, 0x28
   call malloc
   xor r11, r11
   xor r12, r12
   test rax, rax ; check for error

   ;mov byte[rax+0x28], 0x0

   mov r8, rax
   UNALIGN_STACK
leave
ret

        
FileWriter:

push rbp
mov rbp, rsp
sub rsp, 0x8

ALIGN_STACK
   xor r11, r11
   xor r12, r12
   mov rdi, 0x10
   call malloc
   xor r11, r11
   xor r12, r12
   test rax, rax ; check for error

   ;mov byte[rax+0x10], 0x0

   mov r8, rax
   UNALIGN_STACK
leave
ret

        
TimeSpec:

push rbp
mov rbp, rsp
sub rsp, 0x8

ALIGN_STACK
   xor r11, r11
   xor r12, r12
   mov rdi, 0x20
   call malloc
   xor r11, r11
   xor r12, r12
   test rax, rax ; check for error

   ;mov byte[rax+0x20], 0x0

   mov r8, rax
   UNALIGN_STACK
leave
ret

        
LLNode:

push rbp
mov rbp, rsp
sub rsp, 0x8

ALIGN_STACK
   xor r11, r11
   xor r12, r12
   mov rdi, 0x10
   call malloc
   xor r11, r11
   xor r12, r12
   test rax, rax ; check for error

   ;mov byte[rax+0x10], 0x0

   mov r8, rax
   UNALIGN_STACK
leave
ret

        
LinkedList:

push rbp
mov rbp, rsp
sub rsp, 0x8

ALIGN_STACK
   xor r11, r11
   xor r12, r12
   mov rdi, 0x18
   call malloc
   xor r11, r11
   xor r12, r12
   test rax, rax ; check for error

   ;mov byte[rax+0x18], 0x0

   mov r8, rax
   UNALIGN_STACK
leave
ret

        
Stack:

push rbp
mov rbp, rsp
sub rsp, 0x8

ALIGN_STACK
   xor r11, r11
   xor r12, r12
   mov rdi, 0x10
   call malloc
   xor r11, r11
   xor r12, r12
   test rax, rax ; check for error

   ;mov byte[rax+0x10], 0x0

   mov r8, rax
   UNALIGN_STACK
leave
ret

        
sockaddr_in:

push rbp
mov rbp, rsp
sub rsp, 0x8

ALIGN_STACK
   xor r11, r11
   xor r12, r12
   mov rdi, 0x20
   call malloc
   xor r11, r11
   xor r12, r12
   test rax, rax ; check for error

   ;mov byte[rax+0x20], 0x0

   mov r8, rax
   UNALIGN_STACK
leave
ret

        
in_addr:

push rbp
mov rbp, rsp
sub rsp, 0x8

ALIGN_STACK
   xor r11, r11
   xor r12, r12
   mov rdi, 0x8
   call malloc
   xor r11, r11
   xor r12, r12
   test rax, rax ; check for error

   ;mov byte[rax+0x8], 0x0

   mov r8, rax
   UNALIGN_STACK
leave
ret

        
TCPSocket:

push rbp
mov rbp, rsp
sub rsp, 0x8

ALIGN_STACK
   xor r11, r11
   xor r12, r12
   mov rdi, 0x20
   call malloc
   xor r11, r11
   xor r12, r12
   test rax, rax ; check for error

   ;mov byte[rax+0x20], 0x0

   mov r8, rax
   UNALIGN_STACK
leave
ret

        exit:
push rbp
mov rbp, rsp
sub rsp, 0x8
mov rax, 1  ; 1 = exit system call
mov rdi, r9 ; r9 = exit code given in parameter
int 0x80    ; interrupt

__exit__leave_ret_:
leave
ret

doInterrupt:
push rbp
mov rbp, rsp
sub rsp, 0x8
mov rax, r9;
mov rdi, r10;
int 0x80
mov r8, rax

__doInterrupt__leave_ret_:
leave
ret

permhang:
push rbp
mov rbp, rsp
sub rsp, 0x8
jmp $

__permhang__leave_ret_:
leave
ret

print_bool:
push rbp
mov rbp, rsp
sub rsp, 0x8
cmp r9, -1
je __pb_istrue
PRINT_STRING __PRINTFALSE
leave
ret
__pb_istrue:
PRINT_STRING __PRINTTRUE
leave
ret

__print_bool__leave_ret_:
leave
ret

print_char:
push rbp
mov rbp, rsp
sub rsp, 0x8
PRINT_CHAR r9
NEWLINE

__print_char__leave_ret_:
leave
ret

print_string:
push rbp
mov rbp, rsp
sub rsp, 0x8
PRINT_STRING [r9]
NEWLINE

__print_string__leave_ret_:
leave
ret

print_integer:
push rbp
mov rbp, rsp
sub rsp, 0x8
PRINT_DEC 8, r9
NEWLINE

__print_integer__leave_ret_:
leave
ret

print_uint:
push rbp
mov rbp, rsp
sub rsp, 0x8
PRINT_UDEC 8, r9
NEWLINE

__print_uint__leave_ret_:
leave
ret

printformat:
push rbp
mov rbp, rsp
sub rsp, 0x8
push rax
push rcx
mov     rdi, r9                ; set 1st parameter (format)
mov     rsi, r10                 ; set 2nd parameter (current_number)
xor     rax, rax                ; because printf is varargs
; Stack is already aligned because we pushed three 8 byte registers
call    printf                  ; printf(format, current_number)
pop     rcx                     ; restore caller-save register
pop     rax                     ; restore caller-save register
FFLUSH_STDOUT

__printformat__leave_ret_:
leave
ret

print_two_formats:
push rbp
mov rbp, rsp
sub rsp, 0x8
push rax
push rcx
mov     rdi, r9                ; set 1st parameter (value)
mov     rsi, r10                 ; set 2nd parameter (fa)
mov     rdx, r11                ; set 3rd parameter (fb)
xor     rax, rax                ; because printf is varargs
; Stack is already aligned because we pushed three 8 byte registers
call    printf                  ; printf(format, current_number)
pop     rcx                     ; restore caller-save register
pop     rax                     ; restore caller-save register
FFLUSH_STDOUT

__print_two_formats__leave_ret_:
leave
ret

print_three_formats:
push rbp
mov rbp, rsp
sub rsp, 0x8
push rax
push rcx
mov     rdi, r9                ; set 1st parameter (value)
mov     rsi, r10                 ; set 2nd parameter (fa)
mov     rdx, r11                ; set 3rd parameter (fb)
mov     rcx, r12
xor     rax, rax                ; because printf is varargs
; Stack is already aligned because we pushed three 8 byte registers
call    printf                  ; printf(format, current_number)
pop     rcx                     ; restore caller-save register
pop     rax                     ; restore caller-save register
FFLUSH_STDOUT

__print_three_formats__leave_ret_:
leave
ret

print_formatfloat:
push rbp
mov rbp, rsp
sub rsp, 0x10
mov QWORD [rbp-0x8], 0x0
ALIGN_STACK
mov     rdi, r9                ; set 1st parameter (format)
cvtps2pd xmm0, xmm1
mov rax, 1
call    printf                  ; printf(format, current_number)
FFLUSH_STDOUT
;add rsp, 12
UNALIGN_STACK

__print_formatfloat__leave_ret_:
leave
ret

print_floatln:
push rbp
mov rbp, rsp
sub rsp, 0x10
mov QWORD [rbp-0x8], 0x0
ALIGN_STACK
mov     rdi, __PRINTFFLOAT                ; set 1st parameter (format)
cvtps2pd xmm0, xmm0
mov rax, 1
call    printf                  ; printf(format, current_number)
NEWLINE
;add rsp, 12
UNALIGN_STACK

__print_floatln__leave_ret_:
leave
ret

print_float:
push rbp
mov rbp, rsp
sub rsp, 0x10
mov QWORD [rbp-0x8], 0x0
ALIGN_STACK
mov     rdi, __PRINTFFLOAT                ; set 1st parameter (format)
cvtps2pd xmm0, xmm0
mov rax, 1
call    printf                  ; printf(format, current_number)
FFLUSH_STDOUT
;add rsp, 12
UNALIGN_STACK

__print_float__leave_ret_:
leave
ret

newline:
push rbp
mov rbp, rsp
sub rsp, 0x8
NEWLINE

__newline__leave_ret_:
leave
ret

Array:
push rbp
mov rbp, rsp
sub rsp, 0x18
mov QWORD [rbp-0x8], r9
mov QWORD [rbp-0x10], 0x0
mov rax, QWORD [rbp-0x8]
mov rcx, 0x8
imul rcx
mov r9,rax
call alloc
mov QWORD [rbp-0x10], r8
mov r8, QWORD [rbp-0x10]
cvtsi2ss xmm8,r8
jmp __Array__leave_ret_

__Array__leave_ret_:
leave
ret

putValue:
push rbp
mov rbp, rsp
sub rsp, 0x8
mov rax, r11
mov QWORD [r9+r10], rax

__putValue__leave_ret_:
leave
ret

getValue:
push rbp
mov rbp, rsp
sub rsp, 0x8
mov rax, QWORD [r9+r10]
mov r8, rax

__getValue__leave_ret_:
leave
ret

alloc:
push rbp
mov rbp, rsp
sub rsp, 0x8
ALIGN_STACK
xor r11, r11
xor r12, r12
mov rdi, r9
call malloc
xor r11, r11
xor r12, r12
test rax, rax ; check for error
;mov byte[rax+rdi], 0x0
mov r8, rax
UNALIGN_STACK

__alloc__leave_ret_:
leave
ret

memerror:
push rbp
mov rbp, rsp
sub rsp, 0x10
mov QWORD [rbp-0x8], r9
mov r9, STRING_CONSTANT_3
call print_string
mov r9, QWORD [rbp-0x8]
call exit

__memerror__leave_ret_:
leave
ret

destroy:
push rbp
mov rbp, rsp
sub rsp, 0x8
ALIGN_STACK
mov rdi, r9
call free
xor r10, r10
xor r11, r11 ;gc
xor r12, r12
UNALIGN_STACK

__destroy__leave_ret_:
leave
ret

reallocate:
push rbp
mov rbp, rsp
sub rsp, 0x8
ALIGN_STACK
mov rdi, r9
mov rsi, r10
xor r10, r10
xor r11, r11 ;gc
xor r12, r12
call realloc
test rax, rax
xor r10, r10
xor r11, r11 ;gc
xor r12, r12
mov r8, rax
UNALIGN_STACK

__reallocate__leave_ret_:
leave
ret

memcpy:
push rbp
mov rbp, rsp
sub rsp, 0x8
xor r8, r8
xor r12, r12
__memcpy_flp_0x0:
mov r12, [r10+r8]
mov [r9+r8], r12
inc r8
cmp r8, r11
jne __memcpy_flp_0x0
__memcpy_flp_0x0_endfinal:

__memcpy__leave_ret_:
leave
ret

memdup:
push rbp
mov rbp, rsp
sub rsp, 0x8
push r9
push r10
mov r9, r10
call alloc
pop r10
pop r9
mov r11, r10
mov r10, r9
mov r9, r8
call memcpy
mov r8, r9

__memdup__leave_ret_:
leave
ret

sqrtint:
push rbp
mov rbp, rsp
sub rsp, 0x8
mov r8, r9 ; copy initial value
xor r10, r10; count
xor r11, r11; sqrt
__sqrtint_flp_0x0:
sub r8, r10
inc r10
inc r10
inc r11
cmp r8, 0
js __sqrtint_flp_0x0_end
jnz __sqrtint_flp_0x0
__sqrtint_flp_0x0_end:
dec r11
mov r8, r11

__sqrtint__leave_ret_:
leave
ret

powint:
push rbp
mov rbp, rsp
sub rsp, 0x8
mov rax, r9
dec r10
__powint__flp_0x0:
mul r9
dec r10
cmp r10, 0
jne __powint__flp_0x0
mov r8, rax

__powint__leave_ret_:
leave
ret

floor:
push rbp
mov rbp, rsp
sub rsp, 0x8
cvttss2si r8, xmm0

__floor__leave_ret_:
leave
ret

round:
push rbp
mov rbp, rsp
sub rsp, 0x8
cvtss2si r8, xmm0

__round__leave_ret_:
leave
ret

toFloat:
push rbp
mov rbp, rsp
sub rsp, 0x8
cvtsi2ss xmm8, r9

__toFloat__leave_ret_:
leave
ret

ceil:
push rbp
mov rbp, rsp
sub rsp, 0x8
roundss xmm1, xmm0, 10B
cvttss2si r8, xmm1

__ceil__leave_ret_:
leave
ret

sqrtflt:
push rbp
mov rbp, rsp
sub rsp, 0x8
sqrtss xmm8, xmm0

__sqrtflt__leave_ret_:
leave
ret

__fmod:
push rbp
mov rbp, rsp
sub rsp, 0x30
movss [rbp-0x8], xmm0
movss [rbp-0x10], xmm1
movss xmm15, [rbp-0x8]
movss xmm14,  [rbp-0x10]
divss xmm15, xmm14
movss [rbp-0x18], xmm15
mov QWORD [rbp-0x20], 0x0
movss xmm0,  [rbp-0x18]
call floor
mov QWORD [rbp-0x20], r8
mov rax, QWORD [rbp-0x20]
movss xmm14,  [rbp-0x10]
cvtsi2ss xmm15, rax
mulss xmm15, xmm14
movss [__expstack_flt1], xmm15
movss xmm15, [rbp-0x8]
mov rcx, [__expstack_int1]
cvtsi2ss xmm14, rcx
subss xmm15, xmm14
movss [rbp-0x28], xmm15
movss xmm8,  [rbp-0x28]
cvttss2si r8, xmm8
jmp ____fmod__leave_ret_

____fmod__leave_ret_:
leave
ret

fmod:
push rbp
mov rbp, rsp
sub rsp, 0x8
movss xmm15, xmm0
divss xmm15, xmm1
cvttss2si rax, xmm15
cvtsi2ss xmm15, rax
mulss xmm15, xmm1
subss xmm0, xmm15
movss xmm8, xmm0

__fmod__leave_ret_:
leave
ret

absint:
push rbp
mov rbp, rsp
sub rsp, 0x8
mov rax, r9
sar rax, 63
xor r9, rax
sub r9, rax
mov r8, r9

__absint__leave_ret_:
leave
ret

fabs:
push rbp
mov rbp, rsp
sub rsp, 0x8
mov rax, 1
call fabsf
movss xmm8, xmm0

__fabs__leave_ret_:
leave
ret

sin_approx:
push rbp
mov rbp, rsp
sub rsp, 0x8
;numerator term 2:
;x/pi
movss xmm1, [M_PI]
movss xmm2, xmm0
divss xmm2, xmm1 ;          xmm2 = x/pi
;term2:
movss xmm3, [FLT_ONE]
subss xmm3, xmm2;           xmm3 = 1 - x/pi
;term1
mov rax, 16
cvtsi2ss xmm4, rax          ;xmm4 = 16.0
mulss xmm4, xmm2            ;xmm4 = 16(x/pi)
mulss xmm4, xmm3;           xmm4 = 16(x/pi)(1-x/pi)
;denominator
mov rax, 5
cvtsi2ss xmm5, rax;         xmm5 = 5.0
mov rax, 4
cvtsi2ss xmm6, rax;         xmm6 = 4.0
mulss xmm6, xmm2            ;xmm6 = 4(x/pi)
mulss xmm6, xmm3            ;xmm6 = 4(x/pi)(1-x/pi)
subss xmm5, xmm6            ;xmm5 = 5 - 4(x/pi)(1-x/pi)
divss xmm4, xmm5            ;xmm4 = ( 16(x/pi)(1-x/pi)  )   /   (5 - 4(x/pi)(1-x/pi))
movss xmm8, xmm4

__sin_approx__leave_ret_:
leave
ret

cos_approx:
push rbp
mov rbp, rsp
sub rsp, 0x8
movss xmm1, [RDN_90]
subss xmm1, xmm0
movss xmm0, xmm1
call sin_approx

__cos_approx__leave_ret_:
leave
ret

tan_approx:
push rbp
mov rbp, rsp
sub rsp, 0x8
movss xmm15, xmm0
call cos_approx
movss xmm14, xmm8
movss xmm0, xmm15
call sin_approx
divss xmm8, xmm14

__tan_approx__leave_ret_:
leave
ret

Vector.init:
push rbp
mov rbp, rsp
sub rsp, 0x20
mov QWORD [rbp-0x8], r9
mov QWORD [rbp-0x10], r10
mov QWORD [rbp-0x18], 0x0
mov rax, 0x1
mov rcx, QWORD [rbp-0x10]
imul rcx
mov r9,rax
call alloc
mov QWORD [rbp-0x18], r8
call Vector
mov QWORD [rbp-0x8], r8
mov r8, QWORD [rbp-0x8]
add r8, 0x8
mov rax, QWORD [rbp-0x18]
mov [r8], rax
mov r8, QWORD [rbp-0x8]
add r8, 0x10
mov rax, 0x0
mov [r8], rax
mov r8, QWORD [rbp-0x8]
add r8, 0x18
mov rax, 0x0
mov [r8], rax
mov r8, QWORD [rbp-0x8]
add r8, 0x20
mov rax, QWORD [rbp-0x10]
mov [r8], rax
mov r8, QWORD [rbp-0x8]
cvtsi2ss xmm8,r8
jmp __Vector.init__leave_ret_

__Vector.init__leave_ret_:
leave
ret

Vector.resize:
push rbp
mov rbp, rsp
sub rsp, 0x30
mov QWORD [rbp-0x8], r9
mov QWORD [rbp-0x10], r10
mov QWORD [rbp-0x18], 0x0
mov r8, QWORD [rbp-0x8]
add r8, 0x8
mov rcx, [r8]
mov QWORD [rbp-0x18], rcx
mov QWORD [rbp-0x20], 0x0
mov QWORD [rbp-0x28], 0x0
mov r8, QWORD [rbp-0x8]
add r8, 0x20
mov rcx, [r8]
mov QWORD [rbp-0x28], rcx
mov r9, QWORD [rbp-0x18]
mov rax, QWORD [rbp-0x10]
mov rcx, QWORD [rbp-0x28]
imul rcx
mov r10,rax
call reallocate
mov QWORD [rbp-0x20], r8
mov r14, QWORD [rbp-0x20]
mov r15, 0x0
cmp r14, r15
push __cmpblock__Vector.resize__0x1ba
je memerror
add rsp, 0x8
__cmpblock__Vector.resize__0x1ba:
mov r8, QWORD [rbp-0x8]
add r8, 0x8
mov rax, QWORD [rbp-0x20]
mov [r8], rax
mov r8, QWORD [rbp-0x8]
add r8, 0x10
mov rax, QWORD [rbp-0x10]
mov [r8], rax
mov r8, QWORD [rbp-0x8]
cvtsi2ss xmm8,r8
jmp __Vector.resize__leave_ret_

__Vector.resize__leave_ret_:
leave
ret

expand_current_vector:
push rbp
mov rbp, rsp
sub rsp, 0x8
mov r9, [currentVector]
call Vector.expand

__expand_current_vector__leave_ret_:
leave
ret

Vector.expand:
push rbp
mov rbp, rsp
sub rsp, 0x30
mov QWORD [rbp-0x8], r9
mov QWORD [rbp-0x10], 0x0
mov r8, QWORD [rbp-0x8]
add r8, 0x10
mov rcx, [r8]
mov QWORD [rbp-0x10], rcx
mov rbx, QWORD [rbp-0x10]
mov rcx, 0x1
add rbx, rcx
mov QWORD [rbp-0x10], rbx
mov r8, QWORD [rbp-0x8]
add r8, 0x10
mov rax, QWORD [rbp-0x10]
mov [r8], rax
mov QWORD [rbp-0x18], 0x0
mov r8, QWORD [rbp-0x8]
add r8, 0x8
mov rcx, [r8]
mov QWORD [rbp-0x18], rcx
mov QWORD [rbp-0x20], 0x0
mov QWORD [rbp-0x28], 0x0
mov r8, QWORD [rbp-0x8]
add r8, 0x20
mov rcx, [r8]
mov QWORD [rbp-0x28], rcx
mov r9, QWORD [rbp-0x18]
mov rax, QWORD [rbp-0x10]
mov rcx, QWORD [rbp-0x28]
imul rcx
mov r10,rax
call reallocate
mov QWORD [rbp-0x20], r8
mov r8, QWORD [rbp-0x8]
add r8, 0x8
mov rax, QWORD [rbp-0x20]
mov [r8], rax
mov r8, QWORD [rbp-0x10]
cvtsi2ss xmm8,r8
jmp __Vector.expand__leave_ret_

__Vector.expand__leave_ret_:
leave
ret

Vector.push:
push rbp
mov rbp, rsp
sub rsp, 0x38
mov QWORD [rbp-0x8], r9
mov QWORD [rbp-0x10], r10
mov rbx, QWORD [rbp-0x8]
mov [currentVector], rbx
mov QWORD [rbp-0x18], 0x0
mov r8, QWORD [rbp-0x8]
add r8, 0x8
mov rcx, [r8]
mov QWORD [rbp-0x18], rcx
mov QWORD [rbp-0x20], 0x0
mov QWORD [rbp-0x28], 0x0
mov r8, QWORD [rbp-0x8]
add r8, 0x20
mov rcx, [r8]
mov QWORD [rbp-0x28], rcx
mov QWORD [rbp-0x30], 0x0
mov r8, QWORD [rbp-0x8]
add r8, 0x18
mov rcx, [r8]
mov QWORD [rbp-0x20], rcx
mov r8, QWORD [rbp-0x8]
add r8, 0x10
mov rcx, [r8]
mov QWORD [rbp-0x30], rcx
mov r14, QWORD [rbp-0x20]
mov r15, QWORD [rbp-0x30]
cmp r14, r15
push __cmpblock__Vector.push__0x232
jge expand_current_vector
add rsp, 0x8
__cmpblock__Vector.push__0x232:
mov QWORD [rbp-0x30], r8
mov r8, QWORD [rbp-0x8]
add r8, 0x10
mov rax, QWORD [rbp-0x30]
mov [r8], rax
mov r8, QWORD [rbp-0x8]
add r8, 0x8
mov rcx, [r8]
mov QWORD [rbp-0x18], rcx
mov rax, QWORD [rbp-0x20]
mov rcx, QWORD [rbp-0x28]
imul rcx
mov rax,rax
mov rbx, QWORD [rbp-0x18]
mov r15, QWORD [rbp-0x10]
mov QWORD [rbx+rax], r15
mov rbx, QWORD [rbp-0x20]
mov rcx, 0x1
add rbx, rcx
mov QWORD [rbp-0x20], rbx
mov r8, QWORD [rbp-0x8]
add r8, 0x18
mov rax, QWORD [rbp-0x20]
mov [r8], rax
mov r8, QWORD [rbp-0x10]
cvtsi2ss xmm8,r8
jmp __Vector.push__leave_ret_

__Vector.push__leave_ret_:
leave
ret

Vector.pop:
push rbp
mov rbp, rsp
sub rsp, 0x30
mov QWORD [rbp-0x8], r9
mov rbx, QWORD [rbp-0x8]
mov [currentVector], rbx
mov QWORD [rbp-0x10], 0x0
mov QWORD [rbp-0x18], 0x0
mov r8, QWORD [rbp-0x8]
add r8, 0x20
mov rcx, [r8]
mov QWORD [rbp-0x18], rcx
mov r8, QWORD [rbp-0x8]
add r8, 0x8
mov rcx, [r8]
mov QWORD [rbp-0x10], rcx
mov QWORD [rbp-0x20], 0x0
mov r8, QWORD [rbp-0x8]
add r8, 0x18
mov rcx, [r8]
mov QWORD [rbp-0x20], rcx
mov rbx, QWORD [rbp-0x20]
mov QWORD [rbp-0x20], rbx
mov QWORD [rbp-0x28], 0x0
mov rax, QWORD [rbp-0x20]
mov rcx, QWORD [rbp-0x18]
imul rcx
mov rax,rax
mov rbx, QWORD [rbp-0x10]
mov r15,QWORD [rbx+rax]
mov QWORD [rbp-0x28], r15
mov r8, QWORD [rbp-0x8]
add r8, 0x18
mov rax, QWORD [rbp-0x20]
mov [r8], rax
mov r8, QWORD [rbp-0x28]
cvtsi2ss xmm8,r8
jmp __Vector.pop__leave_ret_

__Vector.pop__leave_ret_:
leave
ret

Vector.at:
push rbp
mov rbp, rsp
sub rsp, 0x30
mov QWORD [rbp-0x8], r9
mov QWORD [rbp-0x10], r10
mov QWORD [rbp-0x18], 0x0
mov r8, QWORD [rbp-0x8]
add r8, 0x8
mov rcx, [r8]
mov QWORD [rbp-0x18], rcx
mov QWORD [rbp-0x20], 0x0
mov QWORD [rbp-0x28], 0x0
mov r8, QWORD [rbp-0x8]
add r8, 0x20
mov rcx, [r8]
mov QWORD [rbp-0x28], rcx
mov rax, QWORD [rbp-0x10]
mov rcx, QWORD [rbp-0x28]
imul rcx
mov rax,rax
mov rbx, QWORD [rbp-0x18]
mov r15,QWORD [rbx+rax]
mov QWORD [rbp-0x20], r15
mov r8, QWORD [rbp-0x20]
cvtsi2ss xmm8,r8
jmp __Vector.at__leave_ret_

__Vector.at__leave_ret_:
leave
ret

Vector.set:
push rbp
mov rbp, rsp
sub rsp, 0x30
mov QWORD [rbp-0x8], r9
mov QWORD [rbp-0x10], r10
mov QWORD [rbp-0x18], r11
mov QWORD [rbp-0x20], 0x0
mov QWORD [rbp-0x28], 0x0
mov r8, QWORD [rbp-0x8]
add r8, 0x20
mov rcx, [r8]
mov QWORD [rbp-0x28], rcx
mov r8, QWORD [rbp-0x8]
add r8, 0x8
mov rcx, [r8]
mov QWORD [rbp-0x20], rcx
mov rax, QWORD [rbp-0x10]
mov rcx, QWORD [rbp-0x28]
imul rcx
mov rax,rax
mov rbx, QWORD [rbp-0x20]
mov r15, QWORD [rbp-0x18]
mov QWORD [rbx+rax], r15

__Vector.set__leave_ret_:
leave
ret

Vector.print:
push rbp
mov rbp, rsp
sub rsp, 0x40
mov QWORD [rbp-0x8], r9
mov QWORD [rbp-0x10], 0x0
mov r8, QWORD [rbp-0x8]
add r8, 0x8
mov rcx, [r8]
mov QWORD [rbp-0x10], rcx
mov QWORD [rbp-0x18], 0x0
mov r8, QWORD [rbp-0x8]
add r8, 0x20
mov rcx, [r8]
mov QWORD [rbp-0x18], rcx
mov QWORD [rbp-0x20], 0x0
mov r8, QWORD [rbp-0x8]
add r8, 0x10
mov rcx, [r8]
mov QWORD [rbp-0x20], rcx
mov r9, STRING_CONSTANT_4
mov r10, 0x0
call printformat
mov QWORD [rbp-0x28], 0x0
mov rbx, 0x0
mov QWORD [rbp-0x30], rbx
__Vector.print__flp0x30:
mov rax, QWORD [rbp-0x30]
mov rcx, QWORD [rbp-0x18]
imul rcx
mov rax,rax
mov rbx, QWORD [rbp-0x10]
mov r15,QWORD [rbx+rax]
mov QWORD [rbp-0x28], r15
mov r9, STRING_CONSTANT_5
mov r10, QWORD [rbp-0x28]
call printformat
__Vector.print__flp_end_0x30:
mov rbx, QWORD [rbp-0x20]
mov rcx, 0x1
sub rbx, rcx
mov [__expstack_int1],rbx
mov rbx, QWORD [rbp-0x30]
mov rcx, [__expstack_int1]
cmp rbx, rcx
mov rbx, 0
jg __blncmpncnd_Vector.print_0x0
mov rbx, -1
__blncmpncnd_Vector.print_0x0:
mov QWORD [rbp-0x38], rbx
mov rax, QWORD [rbp-0x30]
inc rax
mov QWORD [rbp-0x30], rax
mov rdi, QWORD [rbp-0x38]
mov rsi, -1
cmp rdi, rsi
je __Vector.print__flp0x30
__Vector.print__flp_end_final0x30:
mov rbx, QWORD [rbp-0x20]
mov rcx, 0x1
sub rbx, rcx
mov QWORD [rbp-0x20], rbx
mov rax, QWORD [rbp-0x20]
mov rcx, QWORD [rbp-0x18]
imul rcx
mov rax,rax
mov rbx, QWORD [rbp-0x10]
mov r15,QWORD [rbx+rax]
mov QWORD [rbp-0x28], r15
mov r9, STRING_CONSTANT_6
mov r10, QWORD [rbp-0x28]
call printformat

__Vector.print__leave_ret_:
leave
ret

Vector.printstrs:
push rbp
mov rbp, rsp
sub rsp, 0x40
mov QWORD [rbp-0x8], r9
mov QWORD [rbp-0x10], 0x0
mov r8, QWORD [rbp-0x8]
add r8, 0x8
mov rcx, [r8]
mov QWORD [rbp-0x10], rcx
mov QWORD [rbp-0x18], 0x0
mov r8, QWORD [rbp-0x8]
add r8, 0x20
mov rcx, [r8]
mov QWORD [rbp-0x18], rcx
mov QWORD [rbp-0x20], 0x0
mov r8, QWORD [rbp-0x8]
add r8, 0x10
mov rcx, [r8]
mov QWORD [rbp-0x20], rcx
mov r9, STRING_CONSTANT_7
mov r10, 0x0
call printformat
mov QWORD [rbp-0x28], 0x0
mov rbx, QWORD [rbp-0x20]
mov rcx, 0x1
cmp rbx, rcx
mov rbx, 0
jne __blncmpncnd_Vector.printstrs_0x0
mov rbx, -1
__blncmpncnd_Vector.printstrs_0x0:
mov r14,rbx
mov r15, -1
cmp r14, r15
jne __ifntrue_Vector.printstrs_0x1
mov rax, 0x0
mov rbx, QWORD [rbp-0x10]
mov r15,QWORD [rbx+rax]
mov QWORD [rbp-0x28], r15
mov r9, STRING_CONSTANT_8
mov r10, QWORD [rbp-0x28]
call printformat
mov r8, 0x0
cvtsi2ss xmm8,r8
jmp __Vector.printstrs__leave_ret_
jmp __ifntrue_Vector.printstrs_0x1
__ifntrue_Vector.printstrs_0x1:
mov rbx, 0x0
mov QWORD [rbp-0x30], rbx
__Vector.printstrs__flp0x30:
mov rax, QWORD [rbp-0x30]
mov rcx, QWORD [rbp-0x18]
imul rcx
mov rax,rax
mov rbx, QWORD [rbp-0x10]
mov r15,QWORD [rbx+rax]
mov QWORD [rbp-0x28], r15
mov r9, STRING_CONSTANT_9
mov r10, QWORD [rbp-0x28]
call printformat
__Vector.printstrs__flp_end_0x30:
mov rbx, QWORD [rbp-0x20]
mov rcx, 0x2
sub rbx, rcx
mov [__expstack_int1],rbx
mov rbx, QWORD [rbp-0x30]
mov rcx, [__expstack_int1]
cmp rbx, rcx
mov rbx, 0
jge __blncmpncnd_Vector.printstrs_0x1
mov rbx, -1
__blncmpncnd_Vector.printstrs_0x1:
mov QWORD [rbp-0x38], rbx
mov rax, QWORD [rbp-0x30]
inc rax
mov QWORD [rbp-0x30], rax
mov rdi, QWORD [rbp-0x38]
mov rsi, -1
cmp rdi, rsi
je __Vector.printstrs__flp0x30
__Vector.printstrs__flp_end_final0x30:
mov rbx, QWORD [rbp-0x20]
mov [__expstack_int1],rbx
mov rax, [__expstack_int1]
mov rcx, QWORD [rbp-0x18]
imul rcx
mov rax,rax
mov rbx, QWORD [rbp-0x10]
mov r15,QWORD [rbx+rax]
mov QWORD [rbp-0x28], r15
mov r9, STRING_CONSTANT_10
mov r10, QWORD [rbp-0x28]
call printformat

__Vector.printstrs__leave_ret_:
leave
ret

Vector.size:
push rbp
mov rbp, rsp
sub rsp, 0x18
mov QWORD [rbp-0x8], r9
mov QWORD [rbp-0x10], 0x0
mov r8, QWORD [rbp-0x8]
add r8, 0x10
mov rcx, [r8]
mov QWORD [rbp-0x10], rcx
mov r8, QWORD [rbp-0x10]
cvtsi2ss xmm8,r8
jmp __Vector.size__leave_ret_

__Vector.size__leave_ret_:
leave
ret

Vector.pushes:
push rbp
mov rbp, rsp
sub rsp, 0x48
mov QWORD [rbp-0x8], r9
mov QWORD [rbp-0x10], r10
mov QWORD [rbp-0x18], r11
mov QWORD [rbp-0x20], 0x0
mov QWORD [rbp-0x28], 0x0
mov QWORD [rbp-0x30], 0x0
mov r8, QWORD [rbp-0x8]
add r8, 0x20
mov rcx, [r8]
mov QWORD [rbp-0x30], rcx
mov QWORD [rbp-0x38], 0x0
__Vector.pushes__flp0x38:
mov rax, QWORD [rbp-0x38]
mov rcx, QWORD [rbp-0x30]
imul rcx
mov QWORD [rbp-0x28], rax
mov rax, QWORD [rbp-0x28]
mov rbx, QWORD [rbp-0x10]
mov r15,QWORD [rbx+rax]
mov QWORD [rbp-0x20], r15
mov r9, QWORD [rbp-0x8]
mov r10, QWORD [rbp-0x20]
call Vector.push
__Vector.pushes__flp_end_0x38:
mov rbx, QWORD [rbp-0x38]
mov rcx, QWORD [rbp-0x18]
cmp rbx, rcx
mov rbx, 0
jge __blncmpncnd_Vector.pushes_0x0
mov rbx, -1
__blncmpncnd_Vector.pushes_0x0:
mov QWORD [rbp-0x40], rbx
mov rax, QWORD [rbp-0x38]
inc rax
mov QWORD [rbp-0x38], rax
mov rdi, QWORD [rbp-0x40]
mov rsi, -1
cmp rdi, rsi
je __Vector.pushes__flp0x38
__Vector.pushes__flp_end_final0x38:

__Vector.pushes__leave_ret_:
leave
ret

Vector.destroy:
push rbp
mov rbp, rsp
sub rsp, 0x18
mov QWORD [rbp-0x8], r9
mov QWORD [rbp-0x10], 0x0
mov r8, QWORD [rbp-0x8]
add r8, 0x8
mov rcx, [r8]
mov QWORD [rbp-0x10], rcx
mov r9, QWORD [rbp-0x10]
call destroy
mov r9, QWORD [rbp-0x8]
call destroy
mov r8, 0x0
cvtsi2ss xmm8,r8
jmp __Vector.destroy__leave_ret_

__Vector.destroy__leave_ret_:
leave
ret

vectorize_args:
push rbp
mov rbp, rsp
sub rsp, 0x38
mov QWORD [rbp-0x8], r9
mov QWORD [rbp-0x10], r10
mov QWORD [rbp-0x18], 0x0
mov r9, QWORD [rbp-0x18]
mov r10, 0x8
call Vector.init
mov QWORD [rbp-0x18], r8
mov r9, QWORD [rbp-0x18]
mov rbx, QWORD [rbp-0x10]
mov rcx, 0x1
add rbx, rcx
mov r10,rbx
call Vector.resize
mov QWORD [rbp-0x20], 0x0
mov QWORD [rbp-0x28], 0x0
__vectorize_args__flp0x28:
mov rax, QWORD [rbp-0x28]
mov r15, 0x8
mul r15
mov rbx, QWORD [rbp-0x8]
mov r15,QWORD [rbx+rax]
mov QWORD [rbp-0x20], r15
mov r9, QWORD [rbp-0x18]
mov r10, QWORD [rbp-0x28]
mov r11, QWORD [rbp-0x20]
call Vector.set
__vectorize_args__flp_end_0x28:
mov rbx, QWORD [rbp-0x28]
mov rcx, QWORD [rbp-0x10]
cmp rbx, rcx
mov rbx, 0
jg __blncmpncnd_vectorize_args_0x0
mov rbx, -1
__blncmpncnd_vectorize_args_0x0:
mov QWORD [rbp-0x30], rbx
mov rax, QWORD [rbp-0x28]
inc rax
mov QWORD [rbp-0x28], rax
mov rdi, QWORD [rbp-0x30]
mov rsi, -1
cmp rdi, rsi
je __vectorize_args__flp0x28
__vectorize_args__flp_end_final0x28:
mov r8, QWORD [rbp-0x18]
cvtsi2ss xmm8,r8
jmp __vectorize_args__leave_ret_

__vectorize_args__leave_ret_:
leave
ret

toInt:
push rbp
mov rbp, rsp
sub rsp, 0x8
ALIGN_STACK
mov rdi, r9
call atoi
mov r8, rax
UNALIGN_STACK

__toInt__leave_ret_:
leave
ret

char:
push rbp
mov rbp, rsp
sub rsp, 0x8
mov rax, r9
xor rbx, rbx
mov bl, al
mov r8, rbx

__char__leave_ret_:
leave
ret

String.init:
push rbp
mov rbp, rsp
sub rsp, 0x28
mov QWORD [rbp-0x8], r9
mov QWORD [rbp-0x10], r10
call String
mov QWORD [rbp-0x8], r8
mov QWORD [rbp-0x18], 0x0
mov QWORD [rbp-0x20], 0x0
mov r9, QWORD [rbp-0x10]
call strlen
mov QWORD [rbp-0x20], r8
mov r9, QWORD [rbp-0x20]
call alloc
mov QWORD [rbp-0x18], r8
mov r14, QWORD [rbp-0x18]
mov r15, 0x0
cmp r14, r15
push __cmpblock__String.init__0x10c
je memerror
add rsp, 0x8
__cmpblock__String.init__0x10c:
mov r9, QWORD [rbp-0x18]
mov r10, QWORD [rbp-0x10]
call strcpy
mov r8, QWORD [rbp-0x8]
add r8, 0x8
mov rax, QWORD [rbp-0x18]
mov [r8], rax
mov r8, QWORD [rbp-0x8]
add r8, 0x10
mov rax, QWORD [rbp-0x20]
mov [r8], rax
mov r8, QWORD [rbp-0x8]
cvtsi2ss xmm8,r8
jmp __String.init__leave_ret_

__String.init__leave_ret_:
leave
ret

String.charAt:
push rbp
mov rbp, rsp
sub rsp, 0x28
mov QWORD [rbp-0x8], r9
mov QWORD [rbp-0x10], r10
mov QWORD [rbp-0x18], 0x0
mov r8, QWORD [rbp-0x8]
add r8, 0x8
mov rcx, [r8]
mov QWORD [rbp-0x18], rcx
mov QWORD [rbp-0x20], 0x0
mov rax, QWORD [rbp-0x10]
mov rbx, QWORD [rbp-0x18]
mov r15,QWORD [rbx+rax]
mov QWORD [rbp-0x20], r15
mov r9, QWORD [rbp-0x20]
call char
mov QWORD [rbp-0x20], r8
mov r8, QWORD [rbp-0x20]
cvtsi2ss xmm8,r8
jmp __String.charAt__leave_ret_

__String.charAt__leave_ret_:
leave
ret

String.printable:
push rbp
mov rbp, rsp
sub rsp, 0x18
mov QWORD [rbp-0x8], r9
mov QWORD [rbp-0x10], 0x0
mov r8, QWORD [rbp-0x8]
add r8, 0x8
mov rcx, [r8]
mov QWORD [rbp-0x10], rcx
mov r8, QWORD [rbp-0x10]
cvtsi2ss xmm8,r8
jmp __String.printable__leave_ret_

__String.printable__leave_ret_:
leave
ret

String.append_string:
push rbp
mov rbp, rsp
sub rsp, 0x30
mov QWORD [rbp-0x8], r9
mov QWORD [rbp-0x10], r10
mov QWORD [rbp-0x18], 0x0
mov r8, QWORD [rbp-0x8]
add r8, 0x8
mov rcx, [r8]
mov QWORD [rbp-0x18], rcx
mov QWORD [rbp-0x20], 0x0
mov r8, QWORD [rbp-0x10]
add r8, 0x8
mov rcx, [r8]
mov QWORD [rbp-0x20], rcx
mov r9, QWORD [rbp-0x18]
mov r10, QWORD [rbp-0x20]
call strAppend
mov QWORD [rbp-0x18], r8
mov r8, QWORD [rbp-0x8]
add r8, 0x8
mov rax, QWORD [rbp-0x18]
mov [r8], rax
mov QWORD [rbp-0x28], 0x0
mov r9, QWORD [rbp-0x18]
call strlen
mov QWORD [rbp-0x28], r8
mov r8, QWORD [rbp-0x8]
add r8, 0x10
mov rax, QWORD [rbp-0x28]
mov [r8], rax
mov r8, QWORD [rbp-0x18]
cvtsi2ss xmm8,r8
jmp __String.append_string__leave_ret_

__String.append_string__leave_ret_:
leave
ret

String.append_chars:
push rbp
mov rbp, rsp
sub rsp, 0x28
mov QWORD [rbp-0x8], r9
mov QWORD [rbp-0x10], r10
mov QWORD [rbp-0x18], 0x0
mov r8, QWORD [rbp-0x8]
add r8, 0x8
mov rcx, [r8]
mov QWORD [rbp-0x18], rcx
mov r9, QWORD [rbp-0x18]
mov r10, QWORD [rbp-0x10]
call strAppend
mov QWORD [rbp-0x18], r8
mov r8, QWORD [rbp-0x8]
add r8, 0x8
mov rax, QWORD [rbp-0x18]
mov [r8], rax
mov QWORD [rbp-0x20], 0x0
mov r9, QWORD [rbp-0x18]
call strlen
mov QWORD [rbp-0x20], r8
mov r8, QWORD [rbp-0x8]
add r8, 0x10
mov rax, QWORD [rbp-0x20]
mov [r8], rax
mov r8, QWORD [rbp-0x18]
cvtsi2ss xmm8,r8
jmp __String.append_chars__leave_ret_

__String.append_chars__leave_ret_:
leave
ret

String.destroy:
push rbp
mov rbp, rsp
sub rsp, 0x18
mov QWORD [rbp-0x8], r9
mov QWORD [rbp-0x10], 0x0
mov r8, QWORD [rbp-0x8]
add r8, 0x8
mov rcx, [r8]
mov QWORD [rbp-0x10], rcx
mov r9, QWORD [rbp-0x10]
call destroy
mov r9, QWORD [rbp-0x8]
call destroy
mov r8, 0x0
cvtsi2ss xmm8,r8
jmp __String.destroy__leave_ret_

__String.destroy__leave_ret_:
leave
ret

String.length:
push rbp
mov rbp, rsp
sub rsp, 0x18
mov QWORD [rbp-0x8], r9
mov QWORD [rbp-0x10], 0x0
mov r8, QWORD [rbp-0x8]
add r8, 0x10
mov rcx, [r8]
mov QWORD [rbp-0x10], rcx
mov r8, QWORD [rbp-0x10]
cvtsi2ss xmm8,r8
jmp __String.length__leave_ret_

__String.length__leave_ret_:
leave
ret

String.print:
push rbp
mov rbp, rsp
sub rsp, 0x18
mov QWORD [rbp-0x8], r9
mov QWORD [rbp-0x10], 0x0
mov r8, QWORD [rbp-0x8]
add r8, 0x8
mov rcx, [r8]
mov QWORD [rbp-0x10], rcx
mov r9, QWORD [rbp-0x10]
mov r10, 0x0
call printformat

__String.print__leave_ret_:
leave
ret

String.println:
push rbp
mov rbp, rsp
sub rsp, 0x18
mov QWORD [rbp-0x8], r9
mov QWORD [rbp-0x10], 0x0
mov r8, QWORD [rbp-0x8]
add r8, 0x8
mov rcx, [r8]
mov QWORD [rbp-0x10], rcx
mov r9, QWORD [rbp-0x10]
call print_string

__String.println__leave_ret_:
leave
ret

String.substring:
push rbp
mov rbp, rsp
sub rsp, 0x40
mov QWORD [rbp-0x8], r9
mov QWORD [rbp-0x10], r10
mov QWORD [rbp-0x18], r11
mov QWORD [rbp-0x20], 0x0
mov r8, QWORD [rbp-0x8]
add r8, 0x8
mov rcx, [r8]
mov QWORD [rbp-0x20], rcx
mov QWORD [rbp-0x28], 0x0
mov rax, QWORD [rbp-0x18]
mov rbx, QWORD [rbp-0x20]
mov r15,QWORD [rbx+rax]
mov QWORD [rbp-0x28], r15
mov rax, QWORD [rbp-0x18]
mov rbx, QWORD [rbp-0x20]
mov r15, 0x0
mov QWORD [rbx+rax], r15
mov rbx, QWORD [rbp-0x20]
mov rcx, QWORD [rbp-0x10]
add rbx, rcx
mov QWORD [rbp-0x30], rbx
mov QWORD [rbp-0x38], 0x0
mov r9, QWORD [rbp-0x38]
mov r10, QWORD [rbp-0x30]
call String.init
mov QWORD [rbp-0x38], r8
mov rax, QWORD [rbp-0x18]
mov rbx, QWORD [rbp-0x20]
mov r15, QWORD [rbp-0x28]
mov QWORD [rbx+rax], r15
mov r8, QWORD [rbp-0x38]
cvtsi2ss xmm8,r8
jmp __String.substring__leave_ret_

__String.substring__leave_ret_:
leave
ret

String.substringend:
push rbp
mov rbp, rsp
sub rsp, 0x30
mov QWORD [rbp-0x8], r9
mov QWORD [rbp-0x10], r10
mov QWORD [rbp-0x18], 0x0
mov r8, QWORD [rbp-0x8]
add r8, 0x8
mov rcx, [r8]
mov QWORD [rbp-0x18], rcx
mov rbx, QWORD [rbp-0x18]
mov rcx, QWORD [rbp-0x10]
add rbx, rcx
mov QWORD [rbp-0x20], rbx
mov QWORD [rbp-0x28], 0x0
mov r9, QWORD [rbp-0x28]
mov r10, QWORD [rbp-0x20]
call String.init
mov QWORD [rbp-0x28], r8
mov r8, QWORD [rbp-0x28]
cvtsi2ss xmm8,r8
jmp __String.substringend__leave_ret_

__String.substringend__leave_ret_:
leave
ret

String.find_str:
push rbp
mov rbp, rsp
sub rsp, 0x60
mov QWORD [rbp-0x8], r9
mov QWORD [rbp-0x10], r10
mov QWORD [rbp-0x18], 0x0
mov r8, QWORD [rbp-0x8]
add r8, 0x10
mov rcx, [r8]
mov QWORD [rbp-0x18], rcx
mov QWORD [rbp-0x20], 0x0
mov r8, QWORD [rbp-0x10]
add r8, 0x10
mov rcx, [r8]
mov QWORD [rbp-0x20], rcx
mov QWORD [rbp-0x28], 0x0
mov QWORD [rbp-0x30], 0x0
mov rbx, 0x0
mov QWORD [rbp-0x38], rbx
mov rax, QWORD [rbp-0x20]
dec rax
mov QWORD [rbp-0x20], rax
mov QWORD [rbp-0x40], 0x0
__String.find_str__flp0x40:
mov rbx, 0x0
mov QWORD [rbp-0x50], rbx
__String.find_str__flp0x50:
mov r9, QWORD [rbp-0x8]
mov rbx, QWORD [rbp-0x40]
mov rcx, QWORD [rbp-0x50]
add rbx, rcx
mov r10,rbx
call String.charAt
mov QWORD [rbp-0x28], r8
mov r9, QWORD [rbp-0x10]
mov r10, QWORD [rbp-0x50]
call String.charAt
mov QWORD [rbp-0x30], r8
mov rbx, QWORD [rbp-0x28]
mov rcx, QWORD [rbp-0x30]
cmp rbx, rcx
mov rbx, 0
jne __blncmpncnd_String.find_str_0x2
mov rbx, -1
__blncmpncnd_String.find_str_0x2:
mov r14,rbx
mov r15, -1
cmp r14, r15
jne __ifntrue_String.find_str_0x1
mov rax, QWORD [rbp-0x38]
inc rax
mov QWORD [rbp-0x38], rax
jmp __ifntrue_String.find_str_0x1
__ifntrue_String.find_str_0x1:
mov r9, QWORD [rbp-0x30]
call print_char
__String.find_str__flp_end_0x50:
mov rbx, QWORD [rbp-0x50]
mov rcx, QWORD [rbp-0x20]
cmp rbx, rcx
mov rbx, 0
jge __blncmpncnd_String.find_str_0x1
mov rbx, -1
__blncmpncnd_String.find_str_0x1:
mov QWORD [rbp-0x58], rbx
mov rax, QWORD [rbp-0x50]
inc rax
mov QWORD [rbp-0x50], rax
mov rdi, QWORD [rbp-0x58]
mov rsi, -1
cmp rdi, rsi
je __String.find_str__flp0x50
__String.find_str__flp_end_final0x50:
mov rbx, QWORD [rbp-0x20]
mov rcx, 0x1
add rbx, rcx
mov [__expstack_int1],rbx
mov rbx, QWORD [rbp-0x38]
mov rcx, [__expstack_int1]
cmp rbx, rcx
mov rbx, 0
jne __blncmpncnd_String.find_str_0x3
mov rbx, -1
__blncmpncnd_String.find_str_0x3:
mov r14,rbx
mov r15, -1
cmp r14, r15
jne __ifntrue_String.find_str_0x2
mov r8, QWORD [rbp-0x40]
cvtsi2ss xmm8,r8
jmp __String.find_str__leave_ret_
jmp __ifntrue_String.find_str_0x2
__ifntrue_String.find_str_0x2:
mov rbx, 0x0
mov QWORD [rbp-0x38], rbx
__String.find_str__flp_end_0x40:
mov rbx, QWORD [rbp-0x40]
mov rcx, QWORD [rbp-0x18]
cmp rbx, rcx
mov rbx, 0
jge __blncmpncnd_String.find_str_0x0
mov rbx, -1
__blncmpncnd_String.find_str_0x0:
mov QWORD [rbp-0x48], rbx
mov rax, QWORD [rbp-0x40]
inc rax
mov QWORD [rbp-0x40], rax
mov rdi, QWORD [rbp-0x48]
mov rsi, -1
cmp rdi, rsi
je __String.find_str__flp0x40
__String.find_str__flp_end_final0x40:
mov r8, -0x1
cvtsi2ss xmm8,r8
jmp __String.find_str__leave_ret_

__String.find_str__leave_ret_:
leave
ret

String.find_chars:
push rbp
mov rbp, rsp
sub rsp, 0x28
mov QWORD [rbp-0x8], r9
mov QWORD [rbp-0x10], r10
mov QWORD [rbp-0x18], 0x0
mov r9, QWORD [rbp-0x18]
mov r10, QWORD [rbp-0x10]
call String.init
mov QWORD [rbp-0x18], r8
mov QWORD [rbp-0x20], 0x0
mov r9, QWORD [rbp-0x8]
mov r10, QWORD [rbp-0x18]
call String.find_str
mov QWORD [rbp-0x20], r8
mov r9, QWORD [rbp-0x18]
call String.destroy
mov r8, QWORD [rbp-0x20]
cvtsi2ss xmm8,r8
jmp __String.find_chars__leave_ret_

__String.find_chars__leave_ret_:
leave
ret

String.count_str:
push rbp
mov rbp, rsp
sub rsp, 0x68
mov QWORD [rbp-0x8], r9
mov QWORD [rbp-0x10], r10
mov QWORD [rbp-0x18], 0x0
mov r8, QWORD [rbp-0x8]
add r8, 0x10
mov rcx, [r8]
mov QWORD [rbp-0x18], rcx
mov QWORD [rbp-0x20], 0x0
mov r8, QWORD [rbp-0x10]
add r8, 0x10
mov rcx, [r8]
mov QWORD [rbp-0x20], rcx
mov QWORD [rbp-0x28], 0x0
mov QWORD [rbp-0x30], 0x0
mov rbx, 0x0
mov QWORD [rbp-0x38], rbx
mov rax, QWORD [rbp-0x20]
dec rax
mov QWORD [rbp-0x20], rax
mov QWORD [rbp-0x40], 0x0
mov QWORD [rbp-0x48], 0x0
__String.count_str__flp0x48:
mov rbx, 0x0
mov QWORD [rbp-0x58], rbx
__String.count_str__flp0x58:
mov r9, QWORD [rbp-0x8]
mov rbx, QWORD [rbp-0x48]
mov rcx, QWORD [rbp-0x58]
add rbx, rcx
mov r10,rbx
call String.charAt
mov QWORD [rbp-0x28], r8
mov r9, QWORD [rbp-0x10]
mov r10, QWORD [rbp-0x58]
call String.charAt
mov QWORD [rbp-0x30], r8
mov rbx, QWORD [rbp-0x28]
mov rcx, QWORD [rbp-0x30]
cmp rbx, rcx
mov rbx, 0
jne __blncmpncnd_String.count_str_0x2
mov rbx, -1
__blncmpncnd_String.count_str_0x2:
mov r14,rbx
mov r15, -1
cmp r14, r15
jne __ifntrue_String.count_str_0x1
mov rax, QWORD [rbp-0x38]
inc rax
mov QWORD [rbp-0x38], rax
jmp __ifntrue_String.count_str_0x1
__ifntrue_String.count_str_0x1:
__String.count_str__flp_end_0x58:
mov rbx, QWORD [rbp-0x58]
mov rcx, QWORD [rbp-0x20]
cmp rbx, rcx
mov rbx, 0
jge __blncmpncnd_String.count_str_0x1
mov rbx, -1
__blncmpncnd_String.count_str_0x1:
mov QWORD [rbp-0x60], rbx
mov rax, QWORD [rbp-0x58]
inc rax
mov QWORD [rbp-0x58], rax
mov rdi, QWORD [rbp-0x60]
mov rsi, -1
cmp rdi, rsi
je __String.count_str__flp0x58
__String.count_str__flp_end_final0x58:
mov rbx, QWORD [rbp-0x20]
mov rcx, 0x1
add rbx, rcx
mov [__expstack_int1],rbx
mov rbx, QWORD [rbp-0x38]
mov rcx, [__expstack_int1]
cmp rbx, rcx
mov rbx, 0
jne __blncmpncnd_String.count_str_0x3
mov rbx, -1
__blncmpncnd_String.count_str_0x3:
mov r14,rbx
mov r15, -1
cmp r14, r15
jne __ifntrue_String.count_str_0x2
mov rax, QWORD [rbp-0x40]
inc rax
mov QWORD [rbp-0x40], rax
jmp __ifntrue_String.count_str_0x2
__ifntrue_String.count_str_0x2:
mov rbx, 0x0
mov QWORD [rbp-0x38], rbx
__String.count_str__flp_end_0x48:
mov rbx, QWORD [rbp-0x48]
mov rcx, QWORD [rbp-0x18]
cmp rbx, rcx
mov rbx, 0
jge __blncmpncnd_String.count_str_0x0
mov rbx, -1
__blncmpncnd_String.count_str_0x0:
mov QWORD [rbp-0x50], rbx
mov rax, QWORD [rbp-0x48]
inc rax
mov QWORD [rbp-0x48], rax
mov rdi, QWORD [rbp-0x50]
mov rsi, -1
cmp rdi, rsi
je __String.count_str__flp0x48
__String.count_str__flp_end_final0x48:
mov r8, QWORD [rbp-0x40]
cvtsi2ss xmm8,r8
jmp __String.count_str__leave_ret_

__String.count_str__leave_ret_:
leave
ret

String.copy:
push rbp
mov rbp, rsp
sub rsp, 0x20
mov QWORD [rbp-0x8], r9
mov QWORD [rbp-0x10], 0x0
mov r8, QWORD [rbp-0x8]
add r8, 0x8
mov rcx, [r8]
mov QWORD [rbp-0x10], rcx
mov QWORD [rbp-0x18], 0x0
mov r9, QWORD [rbp-0x18]
mov r10, QWORD [rbp-0x10]
call String.init
mov QWORD [rbp-0x18], r8
mov r8, QWORD [rbp-0x18]
cvtsi2ss xmm8,r8
jmp __String.copy__leave_ret_

__String.copy__leave_ret_:
leave
ret

String.replace:
push rbp
mov rbp, rsp
sub rsp, 0x70
mov QWORD [rbp-0x8], r9
mov QWORD [rbp-0x10], r10
mov QWORD [rbp-0x18], r11
mov QWORD [rbp-0x20], 0x0
mov QWORD [rbp-0x28], 0x0
mov r8, QWORD [rbp-0x8]
add r8, 0x10
mov rcx, [r8]
mov QWORD [rbp-0x28], rcx
mov QWORD [rbp-0x30], 0x0
mov r9, QWORD [rbp-0x10]
call strlen
mov QWORD [rbp-0x30], r8
mov QWORD [rbp-0x38], 0x0
mov QWORD [rbp-0x40], 0x0
mov QWORD [rbp-0x48], 0x0
mov QWORD [rbp-0x50], 0x0
__String.replace__flp0x50:
mov r9, QWORD [rbp-0x8]
mov r10, QWORD [rbp-0x50]
call String.charAt
mov QWORD [rbp-0x40], r8
mov rax, QWORD [rbp-0x38]
mov rbx, QWORD [rbp-0x10]
mov r15,QWORD [rbx+rax]
mov QWORD [rbp-0x48], r15
mov r9, QWORD [rbp-0x48]
call char
mov QWORD [rbp-0x48], r8
mov rbx, QWORD [rbp-0x40]
mov rcx, QWORD [rbp-0x48]
cmp rbx, rcx
mov rbx, 0
jne __blncmpncnd_String.replace_0x1
mov rbx, -1
__blncmpncnd_String.replace_0x1:
mov r14,rbx
mov r15, -1
cmp r14, r15
jne __ifntrue_String.replace_0x1
mov rax, QWORD [rbp-0x38]
inc rax
mov QWORD [rbp-0x38], rax
mov rbx, QWORD [rbp-0x30]
mov [__expstack_int1],rbx
mov rbx, QWORD [rbp-0x38]
mov rcx, [__expstack_int1]
cmp rbx, rcx
mov rbx, 0
jne __blncmpncnd_String.replace_0x2
mov rbx, -1
__blncmpncnd_String.replace_0x2:
mov r14,rbx
mov r15, -1
cmp r14, r15
jne __ifntrue_String.replace_0x2
jmp __String.replace__flp_end_final0x50
jmp __ifntrue_String.replace_0x2
__ifntrue_String.replace_0x2:
jmp __ifntrue_String.replace_0x1
__ifntrue_String.replace_0x1:
mov rbx, QWORD [rbp-0x40]
mov rcx, QWORD [rbp-0x48]
cmp rbx, rcx
mov rbx, 0
je __blncmpncnd_String.replace_0x3
mov rbx, -1
__blncmpncnd_String.replace_0x3:
mov r14,rbx
mov r15, -1
cmp r14, r15
jne __ifntrue_String.replace_0x3
mov rbx, 0x0
mov QWORD [rbp-0x38], rbx
jmp __ifntrue_String.replace_0x3
__ifntrue_String.replace_0x3:
__String.replace__flp_end_0x50:
mov rbx, QWORD [rbp-0x28]
mov rcx, QWORD [rbp-0x30]
sub rbx, rcx
mov [__expstack_int1],rbx
mov rbx, QWORD [rbp-0x50]
mov rcx, [__expstack_int1]
cmp rbx, rcx
mov rbx, 0
jge __blncmpncnd_String.replace_0x0
mov rbx, -1
__blncmpncnd_String.replace_0x0:
mov QWORD [rbp-0x58], rbx
mov rax, QWORD [rbp-0x50]
inc rax
mov QWORD [rbp-0x50], rax
mov rdi, QWORD [rbp-0x58]
mov rsi, -1
cmp rdi, rsi
je __String.replace__flp0x50
__String.replace__flp_end_final0x50:
mov QWORD [rbp-0x60], 0x0
mov rax, QWORD [rbp-0x50]
inc rax
mov QWORD [rbp-0x50], rax
mov r9, QWORD [rbp-0x8]
mov r10, 0x0
mov rbx, QWORD [rbp-0x50]
mov rcx, QWORD [rbp-0x30]
sub rbx, rcx
mov r11,rbx
call String.substring
mov QWORD [rbp-0x60], r8
mov QWORD [rbp-0x68], 0x0
mov r9, QWORD [rbp-0x8]
mov r10, QWORD [rbp-0x50]
call String.substringend
mov QWORD [rbp-0x68], r8
mov r9, QWORD [rbp-0x60]
mov r10, QWORD [rbp-0x18]
call String.append_chars
mov r9, QWORD [rbp-0x60]
mov r10, QWORD [rbp-0x68]
call String.append_string
mov r9, QWORD [rbp-0x68]
call String.destroy
mov r8, QWORD [rbp-0x60]
cvtsi2ss xmm8,r8
jmp __String.replace__leave_ret_

__String.replace__leave_ret_:
leave
ret

stringcat:
push rbp
mov rbp, rsp
sub rsp, 0x8
ALIGN_STACK
mov rdi, r9 ;reallocated
mov rsi, r10;strb
call strcat
xor r10, r10
xor r11, r11 ;gc
xor r12, r12
mov r8, rax
UNALIGN_STACK

__stringcat__leave_ret_:
leave
ret

strcpy:
push rbp
mov rbp, rsp
sub rsp, 0x8
xor r8, r8
xor rax, rax
_strcpy_top_loop:
mov al, [r10 + r8]
cmp al, 0
je _strcpy_end_loop
mov  [r9+r8],al
inc r8
jmp _strcpy_top_loop
_strcpy_end_loop  :

__strcpy__leave_ret_:
leave
ret

strlen:
push rbp
mov rbp, rsp
sub rsp, 0x8
xor r8,r8
xor rax, rax
_strlen_top_loop:
mov al, [r9+r8]
cmp al,0
je _strlen_end_loop
inc r8
jmp _strlen_top_loop
_strlen_end_loop:

__strlen__leave_ret_:
leave
ret

strAppend:
push rbp
mov rbp, rsp
sub rsp, 0x38
mov QWORD [rbp-0x8], r9
mov QWORD [rbp-0x10], r10
mov QWORD [rbp-0x18], 0x0
mov QWORD [rbp-0x20], 0x0
mov r9, QWORD [rbp-0x8]
call strlen
mov QWORD [rbp-0x18], r8
mov r9, QWORD [rbp-0x10]
call strlen
mov QWORD [rbp-0x20], r8
mov rbx, QWORD [rbp-0x18]
mov rcx, QWORD [rbp-0x20]
add rbx, rcx
mov [__expstack_int1],rbx
mov rbx, [__expstack_int1]
mov QWORD [rbp-0x28], rbx
mov QWORD [rbp-0x30], 0x0
mov r9, QWORD [rbp-0x8]
mov r10, QWORD [rbp-0x28]
call reallocate
mov QWORD [rbp-0x30], r8
mov r14, QWORD [rbp-0x30]
mov r15, 0x0
cmp r14, r15
push __cmpblock__strAppend__0x1ee
je memerror
add rsp, 0x8
__cmpblock__strAppend__0x1ee:
mov r9, QWORD [rbp-0x30]
mov r10, QWORD [rbp-0x10]
call stringcat
mov QWORD [rbp-0x30], r8
mov r8, QWORD [rbp-0x30]
cvtsi2ss xmm8,r8
jmp __strAppend__leave_ret_

__strAppend__leave_ret_:
leave
ret

rename:
push rbp
mov rbp, rsp
sub rsp, 0x8
mov rax, 82
mov rdi, r9
mov rsi, r10
syscall
mov r8, rax

__rename__leave_ret_:
leave
ret

mkdir:
push rbp
mov rbp, rsp
sub rsp, 0x8
mov rax, 83
mov rdi, r9
mov rsi, 420
syscall
mov r8, rax

__mkdir__leave_ret_:
leave
ret

mkfile:
push rbp
mov rbp, rsp
sub rsp, 0x8
mov rax, 85
mov rdi, r9
mov rsi, 420
syscall
mov r8, rax

__mkfile__leave_ret_:
leave
ret

rmdir:
push rbp
mov rbp, rsp
sub rsp, 0x8
mov rax, 84
mov rdi, r9
syscall
mov r8, rax

__rmdir__leave_ret_:
leave
ret

chdir:
push rbp
mov rbp, rsp
sub rsp, 0x8
mov rax, 80
mov rdi, r9
syscall
mov r8, rax

__chdir__leave_ret_:
leave
ret

openFile:
push rbp
mov rbp, rsp
sub rsp, 0x8
mov rax, 2
mov rdi, r9
mov rsi, r11
mov rdx, r10
or rdx, 64
syscall
mov r8, rax

__openFile__leave_ret_:
leave
ret

readFile:
push rbp
mov rbp, rsp
sub rsp, 0x8
xor rax, rax
mov rdi, r9
mov rsi, r10
mov rdx, r11
syscall
mov r8, rax

__readFile__leave_ret_:
leave
ret

writeFile:
push rbp
mov rbp, rsp
sub rsp, 0x8
mov rax, 1
mov rdi, r9
mov rsi, r10
mov rdx, r11
syscall
mov r8, rax

__writeFile__leave_ret_:
leave
ret

closeFile:
push rbp
mov rbp, rsp
sub rsp, 0x8
mov rax, 3
mov rdi, r9
syscall

__closeFile__leave_ret_:
leave
ret

lseek:
push rbp
mov rbp, rsp
sub rsp, 0x20
mov QWORD [rbp-0x8], r9
mov QWORD [rbp-0x10], r10
mov QWORD [rbp-0x18], r11
mov rax, 8
mov rdi, r9
mov rsi, r10
mov rdx, r11
syscall
mov r8, r9

__lseek__leave_ret_:
leave
ret

FileReader.init:
push rbp
mov rbp, rsp
sub rsp, 0x38
mov QWORD [rbp-0x8], r9
mov QWORD [rbp-0x10], r10
mov QWORD [rbp-0x18], r11
call FileReader
mov QWORD [rbp-0x8], r8
mov QWORD [rbp-0x20], 0x0
mov r9, QWORD [rbp-0x10]
mov r10, [O_RDONLY]
mov r11, 0x0
call openFile
mov QWORD [rbp-0x20], r8
mov QWORD [rbp-0x28], 0x0
mov r9, QWORD [rbp-0x18]
call alloc
mov QWORD [rbp-0x28], r8
mov r9, QWORD [rbp-0x20]
mov r10, QWORD [rbp-0x28]
mov rbx, QWORD [rbp-0x18]
mov r11,rbx
call readFile
mov QWORD [rbp-0x30], 0x0
mov r9, QWORD [rbp-0x28]
call strlen
mov QWORD [rbp-0x30], r8
mov r9, QWORD [rbp-0x28]
mov r10, QWORD [rbp-0x30]
call reallocate
mov QWORD [rbp-0x28], r8
mov r8, QWORD [rbp-0x8]
add r8, 0x20
mov rax, QWORD [rbp-0x20]
mov [r8], rax
mov r8, QWORD [rbp-0x8]
add r8, 0x8
mov rax, QWORD [rbp-0x28]
mov [r8], rax
mov r8, QWORD [rbp-0x8]
add r8, 0x18
mov rax, 0x0
mov [r8], rax
mov r8, QWORD [rbp-0x8]
add r8, 0x10
mov rax, 0x0
mov [r8], rax
mov r8, QWORD [rbp-0x8]
add r8, 0x28
mov rax, QWORD [rbp-0x30]
mov [r8], rax
mov r8, QWORD [rbp-0x8]
cvtsi2ss xmm8,r8
jmp __FileReader.init__leave_ret_

__FileReader.init__leave_ret_:
leave
ret

FileReader.destroy:
push rbp
mov rbp, rsp
sub rsp, 0x20
mov QWORD [rbp-0x8], r9
mov QWORD [rbp-0x10], 0x0
mov r8, QWORD [rbp-0x8]
add r8, 0x20
mov rcx, [r8]
mov QWORD [rbp-0x10], rcx
mov r9, QWORD [rbp-0x10]
call closeFile
mov QWORD [rbp-0x18], 0x0
mov r8, QWORD [rbp-0x8]
add r8, 0x8
mov rcx, [r8]
mov QWORD [rbp-0x18], rcx
mov r9, QWORD [rbp-0x18]
call destroy
mov r9, QWORD [rbp-0x8]
call destroy
mov r8, 0x0
cvtsi2ss xmm8,r8
jmp __FileReader.destroy__leave_ret_

__FileReader.destroy__leave_ret_:
leave
ret

FileReader.incline:
push rbp
mov rbp, rsp
sub rsp, 0x10
mov QWORD [rbp-0x8], 0x0
mov r8, [current_filereader]
add r8, 0x10
mov rcx, [r8]
mov QWORD [rbp-0x8], rcx
mov rbx, QWORD [rbp-0x8]
mov rcx, 0x1
add rbx, rcx
mov QWORD [rbp-0x8], rbx
mov r8, [current_filereader]
add r8, 0x10
mov rax, QWORD [rbp-0x8]
mov [r8], rax

__FileReader.incline__leave_ret_:
leave
ret

FileReader.nextChar:
push rbp
mov rbp, rsp
sub rsp, 0x28
mov QWORD [rbp-0x8], r9
mov rbx, QWORD [rbp-0x8]
mov [current_filereader], rbx
mov QWORD [rbp-0x10], 0x0
mov r8, QWORD [rbp-0x8]
add r8, 0x18
mov rcx, [r8]
mov QWORD [rbp-0x10], rcx
mov QWORD [rbp-0x18], 0x0
mov r8, QWORD [rbp-0x8]
add r8, 0x8
mov rcx, [r8]
mov QWORD [rbp-0x18], rcx
mov QWORD [rbp-0x20], 0x0
mov rax, QWORD [rbp-0x10]
mov rbx, QWORD [rbp-0x18]
mov r15,QWORD [rbx+rax]
mov QWORD [rbp-0x20], r15
mov rbx, QWORD [rbp-0x10]
mov rcx, 0x1
add rbx, rcx
mov QWORD [rbp-0x10], rbx
mov r8, QWORD [rbp-0x8]
add r8, 0x18
mov rax, QWORD [rbp-0x10]
mov [r8], rax
mov r14, QWORD [rbp-0x20]
mov r15, 0xa
cmp r14, r15
push __cmpblock__FileReader.nextChar__0x274
je FileReader.incline
add rsp, 0x8
__cmpblock__FileReader.nextChar__0x274:
mov r8, QWORD [rbp-0x20]
cvtsi2ss xmm8,r8
jmp __FileReader.nextChar__leave_ret_

__FileReader.nextChar__leave_ret_:
leave
ret

FileReader.asString:
push rbp
mov rbp, rsp
sub rsp, 0x20
mov QWORD [rbp-0x8], r9
mov QWORD [rbp-0x10], 0x0
call String
mov QWORD [rbp-0x10], r8
mov QWORD [rbp-0x18], 0x0
mov r8, QWORD [rbp-0x8]
add r8, 0x8
mov rcx, [r8]
mov QWORD [rbp-0x18], rcx
mov r9, QWORD [rbp-0x10]
mov r10, QWORD [rbp-0x18]
call String.init
mov r8, QWORD [rbp-0x10]
cvtsi2ss xmm8,r8
jmp __FileReader.asString__leave_ret_

__FileReader.asString__leave_ret_:
leave
ret

FileWriter.init:
push rbp
mov rbp, rsp
sub rsp, 0x30
mov QWORD [rbp-0x8], r9
mov QWORD [rbp-0x10], r10
mov QWORD [rbp-0x18], r11
call FileWriter
mov QWORD [rbp-0x8], r8
mov QWORD [rbp-0x20], 0x0
mov r9, QWORD [rbp-0x10]
mov r10, [O_USRPERM]
mov r11, [WMODE_WPLUSA]
call openFile
mov QWORD [rbp-0x20], r8
mov r8, QWORD [rbp-0x8]
add r8, 0x8
mov rax, QWORD [rbp-0x20]
mov [r8], rax
mov QWORD [rbp-0x28], 0x0
call String
mov QWORD [rbp-0x28], r8
mov r9, QWORD [rbp-0x28]
mov r10, STRING_CONSTANT_11
call String.init
mov QWORD [rbp-0x28], r8
mov r8, QWORD [rbp-0x8]
add r8, 0x10
mov rax, QWORD [rbp-0x28]
mov [r8], rax
mov r8, QWORD [rbp-0x8]
cvtsi2ss xmm8,r8
jmp __FileWriter.init__leave_ret_

__FileWriter.init__leave_ret_:
leave
ret

FileWriter.write:
push rbp
mov rbp, rsp
sub rsp, 0x28
mov QWORD [rbp-0x8], r9
mov QWORD [rbp-0x10], r10
mov QWORD [rbp-0x18], 0x0
mov QWORD [rbp-0x20], 0x0
mov r8, QWORD [rbp-0x8]
add r8, 0x8
mov rcx, [r8]
mov QWORD [rbp-0x18], rcx
mov r9, QWORD [rbp-0x10]
call strlen
mov QWORD [rbp-0x20], r8
mov r9, QWORD [rbp-0x18]
mov r10, QWORD [rbp-0x10]
mov r11, QWORD [rbp-0x20]
call writeFile

__FileWriter.write__leave_ret_:
leave
ret

FileWriter.destroy:
push rbp
mov rbp, rsp
sub rsp, 0x20
mov QWORD [rbp-0x8], r9
mov QWORD [rbp-0x10], 0x0
mov r8, QWORD [rbp-0x8]
add r8, 0x10
mov rcx, [r8]
mov QWORD [rbp-0x10], rcx
mov r9, QWORD [rbp-0x10]
call String.destroy
mov QWORD [rbp-0x18], 0x0
mov r8, QWORD [rbp-0x8]
add r8, 0x8
mov rcx, [r8]
mov QWORD [rbp-0x18], rcx
mov r9, QWORD [rbp-0x18]
call closeFile
mov r9, QWORD [rbp-0x8]
call destroy
mov r8, 0x0
cvtsi2ss xmm8,r8
jmp __FileWriter.destroy__leave_ret_

__FileWriter.destroy__leave_ret_:
leave
ret

getChar:
push rbp
mov rbp, rsp
sub rsp, 0x8
GET_CHAR r8

__getChar__leave_ret_:
leave
ret

getInt:
push rbp
mov rbp, rsp
sub rsp, 0x8
GET_DEC 8, r8

__getInt__leave_ret_:
leave
ret

getString:
push rbp
mov rbp, rsp
sub rsp, 0x10
mov QWORD [rbp-0x8], r9
call alloc
GET_STRING [r8], r9

__getString__leave_ret_:
leave
ret

input_int:
push rbp
mov rbp, rsp
sub rsp, 0x10
mov QWORD [rbp-0x8], r9
PRINT_STRING [r9]
GET_DEC 8, r8
NEWLINE

__input_int__leave_ret_:
leave
ret

randint:
push rbp
mov rbp, rsp
sub rsp, 0x8
rdrand r8

__randint__leave_ret_:
leave
ret

randrange:
push rbp
mov rbp, rsp
sub rsp, 0x8
rdrand rax
;range:
sub r10, r9
;r10 = range, r9 = min
xor rdx, rdx
idiv r10 ; rand() % range
add rdx, r9
mov r8, rdx

__randrange__leave_ret_:
leave
ret

randflt:
push rbp
mov rbp, rsp
sub rsp, 0x8
rdrand rax
cvtsi2ss xmm8, rax
rdrand rax
cvtsi2ss xmm9, rax
divss xmm8, xmm9
mulss xmm8, [RAND_MAX]

__randflt__leave_ret_:
leave
ret

randflt_range:
push rbp
mov rbp, rsp
sub rsp, 0x8
rdrand rax
cvtsi2ss xmm8, rax
rdrand rax
cvtsi2ss xmm9, rax
divss xmm8, xmm9
mulss xmm8, [RAND_MAX]
subss xmm1, xmm0
movss xmm0, xmm8
call fmod
movss xmm0, xmm8
call fabs

__randflt_range__leave_ret_:
leave
ret

systime:
push rbp
mov rbp, rsp
sub rsp, 0x8
mov rax, 201 ;sys_time
xor rdi, rdi
syscall
mov r8, rax

__systime__leave_ret_:
leave
ret

sys_get_time:
push rbp
mov rbp, rsp
sub rsp, 0x8
mov rax, 228
mov rdi, [CLOCK_MONOTONIC]
mov rsi, r9
syscall
mov r8, rax

__sys_get_time__leave_ret_:
leave
ret

TimeSpec.init:
push rbp
mov rbp, rsp
sub rsp, 0x10
mov QWORD [rbp-0x8], r9
call TimeSpec
mov QWORD [rbp-0x8], r8
mov r9, QWORD [rbp-0x8]
call sys_get_time
mov r8, QWORD [rbp-0x8]
cvtsi2ss xmm8,r8
jmp __TimeSpec.init__leave_ret_

__TimeSpec.init__leave_ret_:
leave
ret

TimeSpec.update:
push rbp
mov rbp, rsp
sub rsp, 0x10
mov QWORD [rbp-0x8], r9
mov rbx, QWORD [rbp-0x8]
mov rcx, 0x18
add rbx, rcx
mov r9,rbx
call sys_get_time
mov r8, QWORD [rbp-0x8]
cvtsi2ss xmm8,r8
jmp __TimeSpec.update__leave_ret_

__TimeSpec.update__leave_ret_:
leave
ret

TimeSpec.getSeconds:
push rbp
mov rbp, rsp
sub rsp, 0x18
mov QWORD [rbp-0x8], r9
mov QWORD [rbp-0x10], 0x0
mov r8, QWORD [rbp-0x8]
add r8, 0x8
mov rcx, [r8]
mov QWORD [rbp-0x10], rcx
mov r8, QWORD [rbp-0x10]
cvtsi2ss xmm8,r8
jmp __TimeSpec.getSeconds__leave_ret_

__TimeSpec.getSeconds__leave_ret_:
leave
ret

TimeSpec.getSubs_nano:
push rbp
mov rbp, rsp
sub rsp, 0x18
mov QWORD [rbp-0x8], r9
mov QWORD [rbp-0x10], 0x0
mov r8, QWORD [rbp-0x8]
add r8, 0x10
mov rcx, [r8]
mov QWORD [rbp-0x10], rcx
mov r8, QWORD [rbp-0x10]
cvtsi2ss xmm8,r8
jmp __TimeSpec.getSubs_nano__leave_ret_

__TimeSpec.getSubs_nano__leave_ret_:
leave
ret

TimeSpec.getSubs_milli:
push rbp
mov rbp, rsp
sub rsp, 0x18
mov QWORD [rbp-0x8], r9
mov QWORD [rbp-0x10], 0x0
mov r8, QWORD [rbp-0x8]
add r8, 0x10
mov rcx, [r8]
mov QWORD [rbp-0x10], rcx
mov rax, QWORD [rbp-0x10]
mov rcx, 0xf4240
xor rdx, rdx
idiv rcx
mov r8,rax
cvtsi2ss xmm8,r8
jmp __TimeSpec.getSubs_milli__leave_ret_

__TimeSpec.getSubs_milli__leave_ret_:
leave
ret

TimeSpec.equals:
push rbp
mov rbp, rsp
sub rsp, 0x38
mov QWORD [rbp-0x8], r9
mov QWORD [rbp-0x10], r10
mov QWORD [rbp-0x18], 0x0
mov QWORD [rbp-0x20], 0x0
mov QWORD [rbp-0x28], 0x0
mov QWORD [rbp-0x30], 0x0
mov r8, QWORD [rbp-0x8]
add r8, 0x8
mov rcx, [r8]
mov QWORD [rbp-0x18], rcx
mov r8, QWORD [rbp-0x10]
add r8, 0x8
mov rcx, [r8]
mov QWORD [rbp-0x18], rcx
mov r8, QWORD [rbp-0x8]
add r8, 0x10
mov rcx, [r8]
mov QWORD [rbp-0x28], rcx
mov r8, QWORD [rbp-0x10]
add r8, 0x10
mov rcx, [r8]
mov QWORD [rbp-0x30], rcx
mov rbx, QWORD [rbp-0x18]
mov rcx, QWORD [rbp-0x20]
sub rbx, rcx
mov QWORD [rbp-0x18], rbx
mov rbx, QWORD [rbp-0x30]
mov rcx, QWORD [rbp-0x30]
sub rbx, rcx
mov QWORD [rbp-0x28], rbx
mov r8, 0
mov r14, QWORD [rbp-0x18]
mov r15, 0x0
cmp r14, r15
push __cmpblock__TimeSpec.equals__0x2be
jne __TimeSpec.equals__leave_ret_
add rsp, 0x8
__cmpblock__TimeSpec.equals__0x2be:
mov r14, QWORD [rbp-0x28]
mov r15, 0x0
cmp r14, r15
push __cmpblock__TimeSpec.equals__0x36d
jne __TimeSpec.equals__leave_ret_
add rsp, 0x8
__cmpblock__TimeSpec.equals__0x36d:
mov r8, 0x1
cvtsi2ss xmm8,r8
jmp __TimeSpec.equals__leave_ret_

__TimeSpec.equals__leave_ret_:
leave
ret

TimeSpec.isLaterThan:
push rbp
mov rbp, rsp
sub rsp, 0x38
mov QWORD [rbp-0x8], r9
mov QWORD [rbp-0x10], r10
mov QWORD [rbp-0x18], 0x0
mov QWORD [rbp-0x20], 0x0
mov QWORD [rbp-0x28], 0x0
mov QWORD [rbp-0x30], 0x0
mov r8, QWORD [rbp-0x8]
add r8, 0x8
mov rcx, [r8]
mov QWORD [rbp-0x18], rcx
mov r8, QWORD [rbp-0x10]
add r8, 0x8
mov rcx, [r8]
mov QWORD [rbp-0x18], rcx
mov r8, QWORD [rbp-0x8]
add r8, 0x10
mov rcx, [r8]
mov QWORD [rbp-0x28], rcx
mov r8, QWORD [rbp-0x10]
add r8, 0x10
mov rcx, [r8]
mov QWORD [rbp-0x30], rcx
mov rbx, QWORD [rbp-0x18]
mov rcx, QWORD [rbp-0x20]
sub rbx, rcx
mov QWORD [rbp-0x18], rbx
mov rbx, QWORD [rbp-0x30]
mov rcx, QWORD [rbp-0x30]
sub rbx, rcx
mov QWORD [rbp-0x28], rbx
mov r8, 1
mov r14, QWORD [rbp-0x18]
mov r15, 0x0
cmp r14, r15
push __cmpblock__TimeSpec.isLaterThan__0x2be
jg __TimeSpec.isLaterThan__leave_ret_
add rsp, 0x8
__cmpblock__TimeSpec.isLaterThan__0x2be:
mov r8, 0
mov r14, QWORD [rbp-0x28]
mov r15, 0x0
cmp r14, r15
push __cmpblock__TimeSpec.isLaterThan__0x38f
jl __TimeSpec.isLaterThan__leave_ret_
add rsp, 0x8
__cmpblock__TimeSpec.isLaterThan__0x38f:
mov r14, QWORD [rbp-0x18]
mov r15, 0x0
cmp r14, r15
push __cmpblock__TimeSpec.isLaterThan__0x44c
jne __TimeSpec.isLaterThan__leave_ret_
add rsp, 0x8
__cmpblock__TimeSpec.isLaterThan__0x44c:
mov r8, 0x1
cvtsi2ss xmm8,r8
jmp __TimeSpec.isLaterThan__leave_ret_

__TimeSpec.isLaterThan__leave_ret_:
leave
ret

delay:
push rbp
mov rbp, rsp
sub rsp, 0x30
mov QWORD [rbp-0x8], r9
mov QWORD [rbp-0x10], 0x0
call systime
mov QWORD [rbp-0x10], r8
mov rbx, QWORD [rbp-0x10]
mov rcx, QWORD [rbp-0x8]
add rbx, rcx
mov QWORD [rbp-0x10], rbx
mov QWORD [rbp-0x18], 0x0
mov QWORD [rbp-0x20], 0x0
__delay__flp0x20:
call systime
mov QWORD [rbp-0x18], r8
mov r14, QWORD [rbp-0x18]
mov r15, QWORD [rbp-0x10]
cmp r14, r15
push __cmpblock__delay__0x14c
jge __delay__leave_ret_
add rsp, 0x8
__cmpblock__delay__0x14c:
__delay__flp_end_0x20:
mov rbx, QWORD [rbp-0x20]
mov rcx, 0x1
cmp rbx, rcx
mov rbx, 0
jge __blncmpncnd_delay_0x0
mov rbx, -1
__blncmpncnd_delay_0x0:
mov QWORD [rbp-0x28], rbx
mov rbx, 0x0
mov QWORD [rbp-0x20], rbx
mov rdi, QWORD [rbp-0x28]
mov rsi, -1
cmp rdi, rsi
je __delay__flp0x20
__delay__flp_end_final0x20:

__delay__leave_ret_:
leave
ret

LLNode.init:
push rbp
mov rbp, rsp
sub rsp, 0x18
mov QWORD [rbp-0x8], r9
mov QWORD [rbp-0x10], 0x0
call LLNode
mov QWORD [rbp-0x10], r8
mov r8, QWORD [rbp-0x10]
add r8, 0x8
mov rax, QWORD [rbp-0x8]
mov [r8], rax
mov r8, QWORD [rbp-0x10]
add r8, 0x10
mov rax, 0x0
mov [r8], rax
mov r8, QWORD [rbp-0x10]
cvtsi2ss xmm8,r8
jmp __LLNode.init__leave_ret_

__LLNode.init__leave_ret_:
leave
ret

LLNode.setValue:
push rbp
mov rbp, rsp
sub rsp, 0x18
mov QWORD [rbp-0x8], r9
mov QWORD [rbp-0x10], r10
mov r8, QWORD [rbp-0x8]
add r8, 0x8
mov rax, QWORD [rbp-0x10]
mov [r8], rax

__LLNode.setValue__leave_ret_:
leave
ret

LLNode.buildNext:
push rbp
mov rbp, rsp
sub rsp, 0x20
mov QWORD [rbp-0x8], r9
mov QWORD [rbp-0x10], r10
mov QWORD [rbp-0x18], 0x0
mov r8, QWORD [rbp-0x8]
add r8, 0x10
mov rcx, [r8]
mov QWORD [rbp-0x18], rcx
mov r9, QWORD [rbp-0x10]
call LLNode.init
mov QWORD [rbp-0x18], r8
mov r8, QWORD [rbp-0x8]
add r8, 0x10
mov rax, QWORD [rbp-0x18]
mov [r8], rax

__LLNode.buildNext__leave_ret_:
leave
ret

LLNode.value:
push rbp
mov rbp, rsp
sub rsp, 0x18
mov QWORD [rbp-0x8], r9
mov QWORD [rbp-0x10], 0x0
mov r8, QWORD [rbp-0x8]
add r8, 0x8
mov rcx, [r8]
mov QWORD [rbp-0x10], rcx
mov r8, QWORD [rbp-0x10]
cvtsi2ss xmm8,r8
jmp __LLNode.value__leave_ret_

__LLNode.value__leave_ret_:
leave
ret

LLNode.next:
push rbp
mov rbp, rsp
sub rsp, 0x18
mov QWORD [rbp-0x8], r9
mov QWORD [rbp-0x10], 0x0
mov r8, QWORD [rbp-0x8]
add r8, 0x10
mov rcx, [r8]
mov QWORD [rbp-0x10], rcx
mov r8, QWORD [rbp-0x10]
cvtsi2ss xmm8,r8
jmp __LLNode.next__leave_ret_

__LLNode.next__leave_ret_:
leave
ret

LLNode.setConnection:
push rbp
mov rbp, rsp
sub rsp, 0x20
mov QWORD [rbp-0x8], r9
mov QWORD [rbp-0x10], r10
mov QWORD [rbp-0x18], 0x0
mov r8, QWORD [rbp-0x8]
add r8, 0x10
mov rax, QWORD [rbp-0x10]
mov [r8], rax
mov r8, QWORD [rbp-0x18]
cvtsi2ss xmm8,r8
jmp __LLNode.setConnection__leave_ret_

__LLNode.setConnection__leave_ret_:
leave
ret

LLNode.destroy:
push rbp
mov rbp, rsp
sub rsp, 0x18
mov QWORD [rbp-0x8], r9
mov QWORD [rbp-0x10], 0x0
mov r8, QWORD [rbp-0x8]
add r8, 0x10
mov rcx, [r8]
mov QWORD [rbp-0x10], rcx
mov r9, QWORD [rbp-0x8]
call destroy
mov r8, QWORD [rbp-0x10]
cvtsi2ss xmm8,r8
jmp __LLNode.destroy__leave_ret_

__LLNode.destroy__leave_ret_:
leave
ret

LinkedList.init:
push rbp
mov rbp, rsp
sub rsp, 0x20
mov QWORD [rbp-0x8], r9
mov QWORD [rbp-0x10], 0x0
call LinkedList
mov QWORD [rbp-0x10], r8
mov QWORD [rbp-0x18], 0x0
mov r9, QWORD [rbp-0x8]
call LLNode.init
mov QWORD [rbp-0x18], r8
mov r8, QWORD [rbp-0x10]
add r8, 0x8
mov rax, QWORD [rbp-0x18]
mov [r8], rax
mov r8, QWORD [rbp-0x10]
cvtsi2ss xmm8,r8
jmp __LinkedList.init__leave_ret_

__LinkedList.init__leave_ret_:
leave
ret

LinkedList.push:
push rbp
mov rbp, rsp
sub rsp, 0x20
mov QWORD [rbp-0x8], r9
mov QWORD [rbp-0x10], r10
mov QWORD [rbp-0x18], 0x0
mov r9, QWORD [rbp-0x8]
call LinkedList.getLastNode
mov QWORD [rbp-0x18], r8
mov r9, QWORD [rbp-0x18]
mov r10, QWORD [rbp-0x10]
call LLNode.buildNext

__LinkedList.push__leave_ret_:
leave
ret

LinkedList.getLastNode:
push rbp
mov rbp, rsp
sub rsp, 0x30
mov QWORD [rbp-0x8], r9
mov QWORD [rbp-0x10], 0x0
mov r8, QWORD [rbp-0x8]
add r8, 0x8
mov rcx, [r8]
mov QWORD [rbp-0x10], rcx
mov QWORD [rbp-0x18], 0x0
mov QWORD [rbp-0x20], 0x0
__LinkedList.getLastNode__flp0x20:
mov r9, QWORD [rbp-0x10]
call LLNode.next
mov QWORD [rbp-0x18], r8
mov rbx, QWORD [rbp-0x18]
mov rcx, 0x0
cmp rbx, rcx
mov rbx, 0
jne __blncmpncnd_LinkedList.getLastNode_0x0
mov rbx, -1
__blncmpncnd_LinkedList.getLastNode_0x0:
mov r14,rbx
mov r15, -1
cmp r14, r15
jne __ifntrue_LinkedList.getLastNode_0x1
jmp __LinkedList.getLastNode__flp_end_final0x20
jmp __ifntrue_LinkedList.getLastNode_0x1
__ifntrue_LinkedList.getLastNode_0x1:
mov rbx, QWORD [rbp-0x18]
mov QWORD [rbp-0x10], rbx
__LinkedList.getLastNode__flp_end_0x20:
mov rbx, -0x1
mov QWORD [rbp-0x28], rbx
mov rax, QWORD [rbp-0x20]
inc rax
mov QWORD [rbp-0x20], rax
mov rdi, QWORD [rbp-0x28]
mov rsi, -1
cmp rdi, rsi
je __LinkedList.getLastNode__flp0x20
__LinkedList.getLastNode__flp_end_final0x20:
mov r8, QWORD [rbp-0x10]
cvtsi2ss xmm8,r8
jmp __LinkedList.getLastNode__leave_ret_

__LinkedList.getLastNode__leave_ret_:
leave
ret

LinkedList.at:
push rbp
mov rbp, rsp
sub rsp, 0x38
mov QWORD [rbp-0x8], r9
mov QWORD [rbp-0x10], r10
mov QWORD [rbp-0x18], 0x0
mov r8, QWORD [rbp-0x8]
add r8, 0x8
mov rcx, [r8]
mov QWORD [rbp-0x18], rcx
mov QWORD [rbp-0x20], 0x0
__LinkedList.at__flp0x20:
mov r9, QWORD [rbp-0x18]
call LLNode.next
mov QWORD [rbp-0x18], r8
__LinkedList.at__flp_end_0x20:
mov rbx, QWORD [rbp-0x20]
mov rcx, QWORD [rbp-0x10]
cmp rbx, rcx
mov rbx, 0
jge __blncmpncnd_LinkedList.at_0x0
mov rbx, -1
__blncmpncnd_LinkedList.at_0x0:
mov QWORD [rbp-0x28], rbx
mov rax, QWORD [rbp-0x20]
inc rax
mov QWORD [rbp-0x20], rax
mov rdi, QWORD [rbp-0x28]
mov rsi, -1
cmp rdi, rsi
je __LinkedList.at__flp0x20
__LinkedList.at__flp_end_final0x20:
mov QWORD [rbp-0x30], 0x0
mov r9, QWORD [rbp-0x18]
call LLNode.value
mov QWORD [rbp-0x30], r8
mov r8, QWORD [rbp-0x30]
cvtsi2ss xmm8,r8
jmp __LinkedList.at__leave_ret_

__LinkedList.at__leave_ret_:
leave
ret

LinkedList.nodeAt:
push rbp
mov rbp, rsp
sub rsp, 0x30
mov QWORD [rbp-0x8], r9
mov QWORD [rbp-0x10], r10
mov QWORD [rbp-0x18], 0x0
mov r8, QWORD [rbp-0x8]
add r8, 0x8
mov rcx, [r8]
mov QWORD [rbp-0x18], rcx
mov rbx, QWORD [rbp-0x10]
mov rcx, 0x0
cmp rbx, rcx
mov rbx, 0
jne __blncmpncnd_LinkedList.nodeAt_0x0
mov rbx, -1
__blncmpncnd_LinkedList.nodeAt_0x0:
mov r14,rbx
mov r15, -1
cmp r14, r15
jne __ifntrue_LinkedList.nodeAt_0x1
mov r8, QWORD [rbp-0x18]
cvtsi2ss xmm8,r8
jmp __LinkedList.nodeAt__leave_ret_
jmp __ifntrue_LinkedList.nodeAt_0x1
__ifntrue_LinkedList.nodeAt_0x1:
mov QWORD [rbp-0x20], 0x0
__LinkedList.nodeAt__flp0x20:
mov r9, QWORD [rbp-0x18]
call LLNode.next
mov QWORD [rbp-0x18], r8
__LinkedList.nodeAt__flp_end_0x20:
mov rbx, QWORD [rbp-0x20]
mov rcx, QWORD [rbp-0x10]
cmp rbx, rcx
mov rbx, 0
jge __blncmpncnd_LinkedList.nodeAt_0x1
mov rbx, -1
__blncmpncnd_LinkedList.nodeAt_0x1:
mov QWORD [rbp-0x28], rbx
mov rax, QWORD [rbp-0x20]
inc rax
mov QWORD [rbp-0x20], rax
mov rdi, QWORD [rbp-0x28]
mov rsi, -1
cmp rdi, rsi
je __LinkedList.nodeAt__flp0x20
__LinkedList.nodeAt__flp_end_final0x20:
mov r8, QWORD [rbp-0x18]
cvtsi2ss xmm8,r8
jmp __LinkedList.nodeAt__leave_ret_

__LinkedList.nodeAt__leave_ret_:
leave
ret

LinkedList.set:
push rbp
mov rbp, rsp
sub rsp, 0x38
mov QWORD [rbp-0x8], r9
mov QWORD [rbp-0x10], r10
mov QWORD [rbp-0x18], r11
mov QWORD [rbp-0x20], 0x0
mov r8, QWORD [rbp-0x8]
add r8, 0x8
mov rcx, [r8]
mov QWORD [rbp-0x20], rcx
mov rbx, QWORD [rbp-0x10]
mov rcx, 0x0
cmp rbx, rcx
mov rbx, 0
jne __blncmpncnd_LinkedList.set_0x0
mov rbx, -1
__blncmpncnd_LinkedList.set_0x0:
mov r14,rbx
mov r15, -1
cmp r14, r15
jne __ifntrue_LinkedList.set_0x1
mov r9, QWORD [rbp-0x20]
mov r10, QWORD [rbp-0x18]
call LLNode.setValue
mov r8, 0x0
cvtsi2ss xmm8,r8
jmp __LinkedList.set__leave_ret_
jmp __ifntrue_LinkedList.set_0x1
__ifntrue_LinkedList.set_0x1:
mov rax, QWORD [rbp-0x10]
dec rax
mov QWORD [rbp-0x10], rax
mov QWORD [rbp-0x28], 0x0
__LinkedList.set__flp0x28:
mov r9, QWORD [rbp-0x20]
call LLNode.next
mov QWORD [rbp-0x20], r8
__LinkedList.set__flp_end_0x28:
mov rbx, QWORD [rbp-0x28]
mov rcx, QWORD [rbp-0x10]
cmp rbx, rcx
mov rbx, 0
jge __blncmpncnd_LinkedList.set_0x1
mov rbx, -1
__blncmpncnd_LinkedList.set_0x1:
mov QWORD [rbp-0x30], rbx
mov rax, QWORD [rbp-0x28]
inc rax
mov QWORD [rbp-0x28], rax
mov rdi, QWORD [rbp-0x30]
mov rsi, -1
cmp rdi, rsi
je __LinkedList.set__flp0x28
__LinkedList.set__flp_end_final0x28:
mov r9, QWORD [rbp-0x20]
mov r10, QWORD [rbp-0x18]
call LLNode.setValue

__LinkedList.set__leave_ret_:
leave
ret

LinkedList.insertItem:
push rbp
mov rbp, rsp
sub rsp, 0x40
mov QWORD [rbp-0x8], r9
mov QWORD [rbp-0x10], r10
mov QWORD [rbp-0x18], r11
mov QWORD [rbp-0x20], 0x0
mov r8, QWORD [rbp-0x8]
add r8, 0x8
mov rcx, [r8]
mov QWORD [rbp-0x20], rcx
mov QWORD [rbp-0x28], 0x0
mov rbx, QWORD [rbp-0x10]
mov rcx, 0x0
cmp rbx, rcx
mov rbx, 0
jne __blncmpncnd_LinkedList.insertItem_0x0
mov rbx, -1
__blncmpncnd_LinkedList.insertItem_0x0:
mov r14,rbx
mov r15, -1
cmp r14, r15
jne __ifntrue_LinkedList.insertItem_0x1
mov r9, QWORD [rbp-0x20]
call LLNode.next
mov QWORD [rbp-0x28], r8
mov r9, QWORD [rbp-0x20]
mov r10, QWORD [rbp-0x18]
call LLNode.buildNext
mov r9, QWORD [rbp-0x20]
call LLNode.next
mov QWORD [rbp-0x20], r8
mov r9, QWORD [rbp-0x20]
mov r10, QWORD [rbp-0x28]
call LLNode.setConnection
mov r8, 0x0
cvtsi2ss xmm8,r8
jmp __LinkedList.insertItem__leave_ret_
jmp __ifntrue_LinkedList.insertItem_0x1
__ifntrue_LinkedList.insertItem_0x1:
mov rax, QWORD [rbp-0x10]
dec rax
mov QWORD [rbp-0x10], rax
mov QWORD [rbp-0x30], 0x0
__LinkedList.insertItem__flp0x30:
mov r9, QWORD [rbp-0x20]
call LLNode.next
mov QWORD [rbp-0x20], r8
__LinkedList.insertItem__flp_end_0x30:
mov rbx, QWORD [rbp-0x30]
mov rcx, QWORD [rbp-0x10]
cmp rbx, rcx
mov rbx, 0
jge __blncmpncnd_LinkedList.insertItem_0x1
mov rbx, -1
__blncmpncnd_LinkedList.insertItem_0x1:
mov QWORD [rbp-0x38], rbx
mov rax, QWORD [rbp-0x30]
inc rax
mov QWORD [rbp-0x30], rax
mov rdi, QWORD [rbp-0x38]
mov rsi, -1
cmp rdi, rsi
je __LinkedList.insertItem__flp0x30
__LinkedList.insertItem__flp_end_final0x30:
mov r9, QWORD [rbp-0x20]
call LLNode.next
mov QWORD [rbp-0x28], r8
mov r9, QWORD [rbp-0x20]
mov r10, QWORD [rbp-0x18]
call LLNode.buildNext
mov r9, QWORD [rbp-0x20]
call LLNode.next
mov QWORD [rbp-0x20], r8
mov r9, QWORD [rbp-0x20]
mov r10, QWORD [rbp-0x28]
call LLNode.setConnection

__LinkedList.insertItem__leave_ret_:
leave
ret

LinkedList.insertOther:
push rbp
mov rbp, rsp
sub rsp, 0x60
mov QWORD [rbp-0x8], r9
mov QWORD [rbp-0x10], r10
mov QWORD [rbp-0x18], r11
mov QWORD [rbp-0x20], 0x0
mov r8, QWORD [rbp-0x8]
add r8, 0x8
mov rcx, [r8]
mov QWORD [rbp-0x20], rcx
mov QWORD [rbp-0x28], 0x0
mov rbx, QWORD [rbp-0x10]
mov rcx, 0x0
cmp rbx, rcx
mov rbx, 0
jne __blncmpncnd_LinkedList.insertOther_0x0
mov rbx, -1
__blncmpncnd_LinkedList.insertOther_0x0:
mov r14,rbx
mov r15, -1
cmp r14, r15
jne __ifntrue_LinkedList.insertOther_0x1
mov r8, 0x0
cvtsi2ss xmm8,r8
jmp __LinkedList.insertOther__leave_ret_
jmp __ifntrue_LinkedList.insertOther_0x1
__ifntrue_LinkedList.insertOther_0x1:
mov QWORD [rbp-0x30], 0x0
__LinkedList.insertOther__flp0x30:
mov r9, QWORD [rbp-0x20]
call LLNode.next
mov QWORD [rbp-0x20], r8
__LinkedList.insertOther__flp_end_0x30:
mov rbx, QWORD [rbp-0x30]
mov rcx, QWORD [rbp-0x10]
cmp rbx, rcx
mov rbx, 0
jge __blncmpncnd_LinkedList.insertOther_0x1
mov rbx, -1
__blncmpncnd_LinkedList.insertOther_0x1:
mov QWORD [rbp-0x38], rbx
mov rax, QWORD [rbp-0x30]
inc rax
mov QWORD [rbp-0x30], rax
mov rdi, QWORD [rbp-0x38]
mov rsi, -1
cmp rdi, rsi
je __LinkedList.insertOther__flp0x30
__LinkedList.insertOther__flp_end_final0x30:
mov r9, QWORD [rbp-0x20]
call LLNode.next
mov QWORD [rbp-0x28], r8
mov QWORD [rbp-0x40], 0x0
mov r9, QWORD [rbp-0x18]
mov r10, 0x0
call LinkedList.nodeAt
mov QWORD [rbp-0x40], r8
mov QWORD [rbp-0x48], 0x0
mov QWORD [rbp-0x50], 0x0
__LinkedList.insertOther__flp0x50:
mov r9, QWORD [rbp-0x40]
call LLNode.value
mov QWORD [rbp-0x48], r8
mov r9, QWORD [rbp-0x20]
mov r10, QWORD [rbp-0x48]
call LLNode.buildNext
mov r9, QWORD [rbp-0x20]
call LLNode.next
mov QWORD [rbp-0x20], r8
mov r9, QWORD [rbp-0x40]
call LLNode.next
mov QWORD [rbp-0x40], r8
mov rbx, QWORD [rbp-0x40]
mov rcx, 0x0
cmp rbx, rcx
mov rbx, 0
jne __blncmpncnd_LinkedList.insertOther_0x2
mov rbx, -1
__blncmpncnd_LinkedList.insertOther_0x2:
mov r14,rbx
mov r15, -1
cmp r14, r15
jne __ifntrue_LinkedList.insertOther_0x2
jmp __LinkedList.insertOther__flp_end_final0x50
jmp __ifntrue_LinkedList.insertOther_0x2
__ifntrue_LinkedList.insertOther_0x2:
__LinkedList.insertOther__flp_end_0x50:
mov rbx, -0x1
mov QWORD [rbp-0x58], rbx
mov rax, QWORD [rbp-0x50]
inc rax
mov QWORD [rbp-0x50], rax
mov rdi, QWORD [rbp-0x58]
mov rsi, -1
cmp rdi, rsi
je __LinkedList.insertOther__flp0x50
__LinkedList.insertOther__flp_end_final0x50:
mov r9, QWORD [rbp-0x20]
mov r10, QWORD [rbp-0x28]
call LLNode.setConnection

__LinkedList.insertOther__leave_ret_:
leave
ret

LinkedList.printints:
push rbp
mov rbp, rsp
sub rsp, 0x38
mov QWORD [rbp-0x8], r9
mov QWORD [rbp-0x10], 0x0
mov r8, QWORD [rbp-0x8]
add r8, 0x8
mov rcx, [r8]
mov QWORD [rbp-0x10], rcx
mov QWORD [rbp-0x18], 0x0
mov QWORD [rbp-0x20], 0x0
mov r9, STRING_CONSTANT_12
call printformat
mov QWORD [rbp-0x28], 0x0
__LinkedList.printints__flp0x28:
mov r9, QWORD [rbp-0x10]
call LLNode.next
mov QWORD [rbp-0x20], r8
mov rbx, QWORD [rbp-0x20]
mov rcx, 0x0
cmp rbx, rcx
mov rbx, 0
jne __blncmpncnd_LinkedList.printints_0x0
mov rbx, -1
__blncmpncnd_LinkedList.printints_0x0:
mov r14,rbx
mov r15, -1
cmp r14, r15
jne __ifntrue_LinkedList.printints_0x1
jmp __LinkedList.printints__flp_end_final0x28
jmp __ifntrue_LinkedList.printints_0x1
__ifntrue_LinkedList.printints_0x1:
mov r9, QWORD [rbp-0x10]
call LLNode.value
mov QWORD [rbp-0x18], r8
mov r9, STRING_CONSTANT_13
mov r10, QWORD [rbp-0x18]
call printformat
mov rbx, QWORD [rbp-0x20]
mov QWORD [rbp-0x10], rbx
__LinkedList.printints__flp_end_0x28:
mov rbx, -0x1
mov QWORD [rbp-0x30], rbx
mov rax, QWORD [rbp-0x28]
inc rax
mov QWORD [rbp-0x28], rax
mov rdi, QWORD [rbp-0x30]
mov rsi, -1
cmp rdi, rsi
je __LinkedList.printints__flp0x28
__LinkedList.printints__flp_end_final0x28:
mov r9, QWORD [rbp-0x10]
call LLNode.value
mov QWORD [rbp-0x18], r8
mov r9, STRING_CONSTANT_14
mov r10, QWORD [rbp-0x18]
call printformat

__LinkedList.printints__leave_ret_:
leave
ret

LinkedList.printstrs:
push rbp
mov rbp, rsp
sub rsp, 0x38
mov QWORD [rbp-0x8], r9
mov QWORD [rbp-0x10], 0x0
mov r8, QWORD [rbp-0x8]
add r8, 0x8
mov rcx, [r8]
mov QWORD [rbp-0x10], rcx
mov QWORD [rbp-0x18], 0x0
mov QWORD [rbp-0x20], 0x0
mov r9, STRING_CONSTANT_15
call printformat
mov QWORD [rbp-0x28], 0x0
__LinkedList.printstrs__flp0x28:
mov r9, QWORD [rbp-0x10]
call LLNode.next
mov QWORD [rbp-0x20], r8
mov rbx, QWORD [rbp-0x20]
mov rcx, 0x0
cmp rbx, rcx
mov rbx, 0
jne __blncmpncnd_LinkedList.printstrs_0x0
mov rbx, -1
__blncmpncnd_LinkedList.printstrs_0x0:
mov r14,rbx
mov r15, -1
cmp r14, r15
jne __ifntrue_LinkedList.printstrs_0x1
jmp __LinkedList.printstrs__flp_end_final0x28
jmp __ifntrue_LinkedList.printstrs_0x1
__ifntrue_LinkedList.printstrs_0x1:
mov r9, QWORD [rbp-0x10]
call LLNode.value
mov QWORD [rbp-0x18], r8
mov r9, STRING_CONSTANT_16
mov r10, QWORD [rbp-0x18]
call printformat
mov rbx, QWORD [rbp-0x20]
mov QWORD [rbp-0x10], rbx
__LinkedList.printstrs__flp_end_0x28:
mov rbx, -0x1
mov QWORD [rbp-0x30], rbx
mov rax, QWORD [rbp-0x28]
inc rax
mov QWORD [rbp-0x28], rax
mov rdi, QWORD [rbp-0x30]
mov rsi, -1
cmp rdi, rsi
je __LinkedList.printstrs__flp0x28
__LinkedList.printstrs__flp_end_final0x28:
mov r9, QWORD [rbp-0x10]
call LLNode.value
mov QWORD [rbp-0x18], r8
mov r9, STRING_CONSTANT_17
mov r10, QWORD [rbp-0x18]
call printformat

__LinkedList.printstrs__leave_ret_:
leave
ret

LinkedList.destroy:
push rbp
mov rbp, rsp
sub rsp, 0x28
mov QWORD [rbp-0x8], r9
mov QWORD [rbp-0x10], 0x0
mov r8, QWORD [rbp-0x8]
add r8, 0x8
mov rcx, [r8]
mov QWORD [rbp-0x10], rcx
mov QWORD [rbp-0x18], 0x0
__LinkedList.destroy__flp0x18:
mov r9, QWORD [rbp-0x10]
call LLNode.destroy
mov QWORD [rbp-0x10], r8
mov rbx, QWORD [rbp-0x10]
mov rcx, 0x0
cmp rbx, rcx
mov rbx, 0
jne __blncmpncnd_LinkedList.destroy_0x0
mov rbx, -1
__blncmpncnd_LinkedList.destroy_0x0:
mov r14,rbx
mov r15, -1
cmp r14, r15
jne __ifntrue_LinkedList.destroy_0x1
jmp __LinkedList.destroy__flp_end_final0x18
jmp __ifntrue_LinkedList.destroy_0x1
__ifntrue_LinkedList.destroy_0x1:
__LinkedList.destroy__flp_end_0x18:
mov rbx, -0x1
mov QWORD [rbp-0x20], rbx
mov rax, QWORD [rbp-0x18]
inc rax
mov QWORD [rbp-0x18], rax
mov rdi, QWORD [rbp-0x20]
mov rsi, -1
cmp rdi, rsi
je __LinkedList.destroy__flp0x18
__LinkedList.destroy__flp_end_final0x18:
mov r9, QWORD [rbp-0x8]
call destroy

__LinkedList.destroy__leave_ret_:
leave
ret

Stack.init:
push rbp
mov rbp, rsp
sub rsp, 0x20
mov QWORD [rbp-0x8], r9
mov QWORD [rbp-0x10], 0x0
call Stack
mov QWORD [rbp-0x10], r8
mov QWORD [rbp-0x18], 0x0
mov r9, QWORD [rbp-0x8]
call alloc
mov QWORD [rbp-0x18], r8
mov r8, QWORD [rbp-0x10]
add r8, 0x8
mov rax, QWORD [rbp-0x18]
mov [r8], rax
mov r8, QWORD [rbp-0x10]
add r8, 0x10
mov rbx, QWORD [rbp-0x8]
mov rax,rbx
mov [r8], rax
mov r8, QWORD [rbp-0x10]
cvtsi2ss xmm8,r8
jmp __Stack.init__leave_ret_

__Stack.init__leave_ret_:
leave
ret

Stack.push:
push rbp
mov rbp, rsp
sub rsp, 0x28
mov QWORD [rbp-0x8], r9
mov QWORD [rbp-0x10], r10
mov QWORD [rbp-0x18], 0x0
mov r8, QWORD [rbp-0x8]
add r8, 0x10
mov rcx, [r8]
mov QWORD [rbp-0x18], rcx
mov rbx, QWORD [rbp-0x18]
mov rcx, 0x1
sub rbx, rcx
mov QWORD [rbp-0x18], rbx
mov rbx, QWORD [rbp-0x18]
mov rcx, 0x0
cmp rbx, rcx
mov rbx, 0
jge __blncmpncnd_Stack.push_0x0
mov rbx, -1
__blncmpncnd_Stack.push_0x0:
mov r14,rbx
mov r15, -1
cmp r14, r15
jne __ifntrue_Stack.push_0x1
mov r9, STRING_CONSTANT_18
call print_string
mov r9, 0x1
call exit
jmp __ifntrue_Stack.push_0x1
__ifntrue_Stack.push_0x1:
mov QWORD [rbp-0x20], 0x0
mov r8, QWORD [rbp-0x8]
add r8, 0x8
mov rcx, [r8]
mov QWORD [rbp-0x20], rcx
mov rax, QWORD [rbp-0x18]
mov r15, 0x8
mul r15
mov rbx, QWORD [rbp-0x20]
mov r15, QWORD [rbp-0x10]
mov QWORD [rbx+rax], r15
mov r8, QWORD [rbp-0x8]
add r8, 0x10
mov rax, QWORD [rbp-0x18]
mov [r8], rax

__Stack.push__leave_ret_:
leave
ret

Stack.pop:
push rbp
mov rbp, rsp
sub rsp, 0x28
mov QWORD [rbp-0x8], r9
mov QWORD [rbp-0x10], 0x0
mov r8, QWORD [rbp-0x8]
add r8, 0x10
mov rcx, [r8]
mov QWORD [rbp-0x10], rcx
mov QWORD [rbp-0x18], 0x0
mov r8, QWORD [rbp-0x8]
add r8, 0x8
mov rcx, [r8]
mov QWORD [rbp-0x18], rcx
mov QWORD [rbp-0x20], 0x0
mov rax, QWORD [rbp-0x10]
mov r15, 0x8
mul r15
mov rbx, QWORD [rbp-0x18]
mov r15,QWORD [rbx+rax]
mov QWORD [rbp-0x20], r15
mov r8, QWORD [rbp-0x8]
add r8, 0x10
mov rbx, QWORD [rbp-0x10]
mov rcx, 0x1
add rbx, rcx
mov rax,rbx
mov [r8], rax
mov r8, QWORD [rbp-0x20]
cvtsi2ss xmm8,r8
jmp __Stack.pop__leave_ret_

__Stack.pop__leave_ret_:
leave
ret

Stack.getraw:
push rbp
mov rbp, rsp
sub rsp, 0x18
mov QWORD [rbp-0x8], r9
mov QWORD [rbp-0x10], 0x0
mov r8, QWORD [rbp-0x8]
add r8, 0x8
mov rcx, [r8]
mov QWORD [rbp-0x10], rcx
mov r8, QWORD [rbp-0x10]
cvtsi2ss xmm8,r8
jmp __Stack.getraw__leave_ret_

__Stack.getraw__leave_ret_:
leave
ret

Stack.getrawptr:
push rbp
mov rbp, rsp
sub rsp, 0x20
mov QWORD [rbp-0x8], r9
mov QWORD [rbp-0x10], 0x0
mov r8, QWORD [rbp-0x8]
add r8, 0x8
mov rcx, [r8]
mov QWORD [rbp-0x10], rcx
mov QWORD [rbp-0x18], 0x0
mov r8, QWORD [rbp-0x8]
add r8, 0x10
mov rcx, [r8]
mov QWORD [rbp-0x18], rcx
mov rbx, QWORD [rbp-0x10]
mov rcx, QWORD [rbp-0x18]
add rbx, rcx
mov r8,rbx
cvtsi2ss xmm8,r8
jmp __Stack.getrawptr__leave_ret_

__Stack.getrawptr__leave_ret_:
leave
ret

Stack.destroy:
push rbp
mov rbp, rsp
sub rsp, 0x18
mov QWORD [rbp-0x8], r9
mov QWORD [rbp-0x10], 0x0
mov r8, QWORD [rbp-0x8]
add r8, 0x8
mov rcx, [r8]
mov QWORD [rbp-0x10], rcx
mov r9, QWORD [rbp-0x10]
call destroy
mov r9, QWORD [rbp-0x8]
call destroy

__Stack.destroy__leave_ret_:
leave
ret

sockaddr_in.init:
push rbp
mov rbp, rsp
sub rsp, 0x30
mov QWORD [rbp-0x8], r9
mov QWORD [rbp-0x10], r10
mov QWORD [rbp-0x18], r11
mov QWORD [rbp-0x20], 0x0
mov QWORD [rbp-0x28], 0x0
mov r9, QWORD [rbp-0x10]
call addres_to_inet
mov QWORD [rbp-0x20], r8
call sockaddr_in
mov QWORD [rbp-0x28], r8
mov r8, QWORD [rbp-0x28]
add r8, 0x8
mov rax, QWORD [rbp-0x8]
mov [r8], rax
mov r8, QWORD [rbp-0x28]
add r8, 0x10
mov rax, QWORD [rbp-0x18]
mov [r8], rax
mov r8, QWORD [rbp-0x28]
add r8, 0x20
mov rax, 0x0
mov [r8], rax
mov r8, QWORD [rbp-0x28]
add r8, 0x18
mov rax, QWORD [rbp-0x20]
mov [r8], rax
mov r8, QWORD [rbp-0x28]
cvtsi2ss xmm8,r8
jmp __sockaddr_in.init__leave_ret_

__sockaddr_in.init__leave_ret_:
leave
ret

sockaddr_in.destroy:
push rbp
mov rbp, rsp
sub rsp, 0x18
mov QWORD [rbp-0x8], r9
mov QWORD [rbp-0x10], 0x0
mov r8, QWORD [rbp-0x8]
add r8, 0x18
mov rcx, [r8]
mov QWORD [rbp-0x10], rcx
mov r9, QWORD [rbp-0x10]
call destroy
mov r9, QWORD [rbp-0x8]
call destroy

__sockaddr_in.destroy__leave_ret_:
leave
ret

addres_to_inet:
push rbp
mov rbp, rsp
sub rsp, 0x10
mov QWORD [rbp-0x8], r9
push r9
mov r9, 8
call alloc
mov rsi, r8
pop r9
mov rdi, r9
call inet_aton

__addres_to_inet__leave_ret_:
leave
ret

sys_socket:
push rbp
mov rbp, rsp
sub rsp, 0x8
mov rax, 41; sys_socket syscall
mov rdi, r9
mov rsi, r10
mov rdx, r11
syscall
mov r8, rax

__sys_socket__leave_ret_:
leave
ret

sys_connect:
push rbp
mov rbp, rsp
sub rsp, 0x8
mov rax, 42 ; sys_connect
mov rdi, r9
mov rsi, r10
mov rdx, r11
syscall
mov r8, rax

__sys_connect__leave_ret_:
leave
ret

sys_accept:
push rbp
mov rbp, rsp
sub rsp, 0x8
mov rax, 43 ;sys_accept
mov rdi, r9
mov rsi, r10
mov rdx, r11
syscall
mov r8, rax

__sys_accept__leave_ret_:
leave
ret

sys_bind:
push rbp
mov rbp, rsp
sub rsp, 0x8
mov rax, 49
mov rdi, r9
mov rsi, r10
mov rdx, r11
syscall
mov r8, rax

__sys_bind__leave_ret_:
leave
ret

sys_listen:
push rbp
mov rbp, rsp
sub rsp, 0x8
mov rax, 50
mov rdi, r9
mov rsi, r10
syscall
mov r8, rax

__sys_listen__leave_ret_:
leave
ret

sys_shutdown:
push rbp
mov rbp, rsp
sub rsp, 0x8
mov rax, 48
mov rdi, r9
mov rsi, r10
syscall
mov r8, rax

__sys_shutdown__leave_ret_:
leave
ret

socketsend:
push rbp
mov rbp, rsp
sub rsp, 0x20
mov QWORD [rbp-0x8], r9
mov QWORD [rbp-0x10], r10
mov QWORD [rbp-0x18], r11
mov r9, QWORD [rbp-0x8]
mov r10, QWORD [rbp-0x10]
mov r11, QWORD [rbp-0x18]
call writeFile

__socketsend__leave_ret_:
leave
ret

socketrecv:
push rbp
mov rbp, rsp
sub rsp, 0x20
mov QWORD [rbp-0x8], r9
mov QWORD [rbp-0x10], r10
mov QWORD [rbp-0x18], r11
mov r9, QWORD [rbp-0x8]
mov r10, QWORD [rbp-0x10]
mov r11, QWORD [rbp-0x18]
call readFile

__socketrecv__leave_ret_:
leave
ret

TCPSocket.init:
push rbp
mov rbp, rsp
sub rsp, 0x30
mov QWORD [rbp-0x8], r9
mov QWORD [rbp-0x10], r10
mov QWORD [rbp-0x18], 0x0
call TCPSocket
mov QWORD [rbp-0x18], r8
mov QWORD [rbp-0x20], 0x0
mov r9, [AF_INET]
mov r10, QWORD [rbp-0x8]
mov r11, QWORD [rbp-0x10]
call sockaddr_in.init
mov QWORD [rbp-0x20], r8
mov r8, QWORD [rbp-0x18]
add r8, 0x20
mov rax, QWORD [rbp-0x20]
mov [r8], rax
mov r8, QWORD [rbp-0x18]
add r8, 0x10
mov rax, QWORD [rbp-0x8]
mov [r8], rax
mov r8, QWORD [rbp-0x18]
add r8, 0x18
mov rax, QWORD [rbp-0x10]
mov [r8], rax
mov QWORD [rbp-0x28], 0x0
mov r9, [AF_INET]
mov r10, [SOCK_STREAM]
mov r11, [SOCK_NOPROT]
call sys_socket
mov QWORD [rbp-0x28], r8
mov r8, QWORD [rbp-0x18]
add r8, 0x8
mov rax, QWORD [rbp-0x28]
mov [r8], rax
mov r8, QWORD [rbp-0x18]
cvtsi2ss xmm8,r8
jmp __TCPSocket.init__leave_ret_

__TCPSocket.init__leave_ret_:
leave
ret

TCPSocket.bind:
push rbp
mov rbp, rsp
sub rsp, 0x28
mov QWORD [rbp-0x8], r9
mov QWORD [rbp-0x10], 0x0
mov r8, QWORD [rbp-0x8]
add r8, 0x20
mov rcx, [r8]
mov QWORD [rbp-0x10], rcx
mov QWORD [rbp-0x18], 0x0
mov r8, QWORD [rbp-0x8]
add r8, 0x8
mov rcx, [r8]
mov QWORD [rbp-0x18], rcx
mov QWORD [rbp-0x20], 0x0
mov r9, QWORD [rbp-0x18]
mov r10, QWORD [rbp-0x10]
mov r11, [SIZEOF_SOCKADDR_IN]
call sys_bind
mov QWORD [rbp-0x20], r8
mov r8, QWORD [rbp-0x20]
cvtsi2ss xmm8,r8
jmp __TCPSocket.bind__leave_ret_

__TCPSocket.bind__leave_ret_:
leave
ret

TCPSocket.listen:
push rbp
mov rbp, rsp
sub rsp, 0x20
mov QWORD [rbp-0x8], r9
mov QWORD [rbp-0x10], 0x0
mov r8, QWORD [rbp-0x8]
add r8, 0x8
mov rcx, [r8]
mov QWORD [rbp-0x10], rcx
mov QWORD [rbp-0x18], 0x0
mov r9, QWORD [rbp-0x10]
mov r10, 0x1
call sys_listen
mov QWORD [rbp-0x18], r8
mov r8, QWORD [rbp-0x18]
cvtsi2ss xmm8,r8
jmp __TCPSocket.listen__leave_ret_

__TCPSocket.listen__leave_ret_:
leave
ret

TCPSocket.accept:
push rbp
mov rbp, rsp
sub rsp, 0x40
mov QWORD [rbp-0x8], r9
mov QWORD [rbp-0x10], 0x0
mov QWORD [rbp-0x18], 0x0
call sockaddr_in
mov QWORD [rbp-0x18], r8
call TCPSocket
mov QWORD [rbp-0x10], r8
mov QWORD [rbp-0x20], 0x0
mov r8, QWORD [rbp-0x8]
add r8, 0x8
mov rcx, [r8]
mov QWORD [rbp-0x20], rcx
mov QWORD [rbp-0x28], 0x0
mov r9, QWORD [rbp-0x20]
mov r10, QWORD [rbp-0x18]
mov rbx, SIZEOF_SOCKADDR_IN
mov r11,rbx
call sys_accept
mov QWORD [rbp-0x28], r8
mov r8, QWORD [rbp-0x10]
add r8, 0x8
mov rax, QWORD [rbp-0x28]
mov [r8], rax
mov r8, QWORD [rbp-0x10]
add r8, 0x20
mov rax, QWORD [rbp-0x18]
mov [r8], rax
mov QWORD [rbp-0x30], 0x0
mov rax, 0x2
mov r15, 0x8
mul r15
mov rbx, QWORD [rbp-0x18]
mov r15,QWORD [rbx+rax]
mov QWORD [rbp-0x30], r15
mov QWORD [rbp-0x38], 0x0
mov rax, 0x1
mov r15, 0x8
mul r15
mov rbx, QWORD [rbp-0x18]
mov r15,QWORD [rbx+rax]
mov QWORD [rbp-0x38], r15
mov r8, QWORD [rbp-0x10]
add r8, 0x10
mov rax, QWORD [rbp-0x30]
mov [r8], rax
mov r8, QWORD [rbp-0x10]
add r8, 0x18
mov rax, QWORD [rbp-0x38]
mov [r8], rax
mov r8, QWORD [rbp-0x10]
cvtsi2ss xmm8,r8
jmp __TCPSocket.accept__leave_ret_

__TCPSocket.accept__leave_ret_:
leave
ret

TCPSocket.send:
push rbp
mov rbp, rsp
sub rsp, 0x30
mov QWORD [rbp-0x8], r9
mov QWORD [rbp-0x10], r10
mov QWORD [rbp-0x18], r11
mov QWORD [rbp-0x20], 0x0
mov r8, QWORD [rbp-0x8]
add r8, 0x8
mov rcx, [r8]
mov QWORD [rbp-0x20], rcx
mov QWORD [rbp-0x28], 0x0
mov r9, QWORD [rbp-0x20]
mov r10, QWORD [rbp-0x10]
mov r11, QWORD [rbp-0x18]
call socketsend
mov QWORD [rbp-0x28], r8
mov r8, QWORD [rbp-0x28]
cvtsi2ss xmm8,r8
jmp __TCPSocket.send__leave_ret_

__TCPSocket.send__leave_ret_:
leave
ret

TCPSocket.recv:
push rbp
mov rbp, rsp
sub rsp, 0x30
mov QWORD [rbp-0x8], r9
mov QWORD [rbp-0x10], r10
mov QWORD [rbp-0x18], r11
mov QWORD [rbp-0x20], 0x0
mov r8, QWORD [rbp-0x8]
add r8, 0x8
mov rcx, [r8]
mov QWORD [rbp-0x20], rcx
mov QWORD [rbp-0x28], 0x0
mov r9, QWORD [rbp-0x20]
mov r10, QWORD [rbp-0x10]
mov r11, QWORD [rbp-0x18]
call socketrecv
mov QWORD [rbp-0x28], r8
mov r8, QWORD [rbp-0x28]
cvtsi2ss xmm8,r8
jmp __TCPSocket.recv__leave_ret_

__TCPSocket.recv__leave_ret_:
leave
ret

TCPSocket.getaddr:
push rbp
mov rbp, rsp
sub rsp, 0x18
mov QWORD [rbp-0x8], r9
mov QWORD [rbp-0x10], 0x0
mov r8, QWORD [rbp-0x8]
add r8, 0x10
mov rcx, [r8]
mov QWORD [rbp-0x10], rcx
mov r8, QWORD [rbp-0x10]
cvtsi2ss xmm8,r8
jmp __TCPSocket.getaddr__leave_ret_

__TCPSocket.getaddr__leave_ret_:
leave
ret

TCPSocket.getport:
push rbp
mov rbp, rsp
sub rsp, 0x18
mov QWORD [rbp-0x8], r9
mov QWORD [rbp-0x10], 0x0
mov r8, QWORD [rbp-0x8]
add r8, 0x18
mov rcx, [r8]
mov QWORD [rbp-0x10], rcx
mov r8, QWORD [rbp-0x10]
cvtsi2ss xmm8,r8
jmp __TCPSocket.getport__leave_ret_

__TCPSocket.getport__leave_ret_:
leave
ret

TCPSocket.destroy:
push rbp
mov rbp, rsp
sub rsp, 0x18
mov QWORD [rbp-0x8], r9
mov QWORD [rbp-0x10], 0x0
mov r8, QWORD [rbp-0x8]
add r8, 0x20
mov rcx, [r8]
mov QWORD [rbp-0x10], rcx
mov r9, QWORD [rbp-0x10]
call sockaddr_in.destroy
mov r9, QWORD [rbp-0x8]
call destroy

__TCPSocket.destroy__leave_ret_:
leave
ret

m:
push rbp
mov rbp, rsp
sub rsp, 0x18
mov QWORD [rbp-0x8], r9
mov QWORD [rbp-0x10], r10
mov r9, STRING_CONSTANT_19
mov r10, QWORD [rbp-0x10]
call printformat

__m__leave_ret_:
leave
ret







CMAIN:
mov rbp, rsp
xor rax, rax


mov r9, rsi     ;commandline args
mov r10, rdi
align 16
mov QWORD [currentVector], 0x0
mov QWORD [current_filereader], 0x0
call m
NEWLINE
ret


