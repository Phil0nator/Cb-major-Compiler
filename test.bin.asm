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
CEXTERN sscanf
CEXTERN getchar
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
global _long___inline__syscall_plong
extern _ssize_t_read_pfd_tchar.size_t
extern _ssize_t_write_pfd_tchar.size_t
extern _fd_t_open_pchar.intmode_t
extern _int_close_pfd_t
extern _int_mkdir_pchar.mode_t
extern _int_rmdir_pchar.
extern _int_creat_pchar.mode_t
extern _int_chdir_pchar.
extern _int_lseek_pfd_tintint
global _void._mmap_pvoid.size_tintintintoff_t
global _void._mlc_psize_t
global _void_fr_pvoid.
global _double_sqrt_pdouble
global _double_sqrt_pint
global _long_sqrt_plong
global _long_pow_plonglong
global _double_pow_plonglong
global _double_pow_pdoublelong
global _long_round_pdouble
global _long_ceil_pdouble
global _long_floor_pdouble
global _long_abs_plong
global _double_abs_pdouble
global _long_log_plong
global _int___sprintf_pchar.char.void.
global _int_sprintf_pchar.char.voidvoidvoidvoid
global _void___printf_pchar.void.
global _void_printf_pchar.voidvoidvoidvoidvoid
extern print
extern print
extern print
extern print
global _void_printf_pchar.

section .data
STRING_CONSTANT_0: db `/dev/zero`, 0
STRING_CONSTANT_1: db `r+`, 0
STRING_CONSTANT_2: db `HERE: %u\n`, 0
FLT_CONSTANT_0: dq 0x0.0p+0
STRING_CONSTANT_3: db `False`, 0
STRING_CONSTANT_4: db `True`, 0
STRING_CONSTANT_5: db `%s`, 0
STRING_CONSTANT_6: db `THINGS\n`, 0
nullterm: DQ 0
INLINE_SYSCALL: DQ __inline__syscall
free_memory: DQ 0
zerofd: DQ 0
M_MINZERO_MEM: DQ 0
rand_next: DQ 1
section .bss
align 16
__heap_padding__: resz 1
section .text
align 8
global CMAIN
__inline__syscall:
push rbp
mov rbp, rsp
sub rsp, 16
mov [rbp-8], rdi
syscall
____inline__syscall__return:
leave
ret
_int_bitswap64_pint:
push rbp
mov rbp, rsp
sub rsp, 16
mov [rbp-8], rdi
mov rbx, 18374686479671623680
mov r10, QWORD[rbp-8]
and r10d, ebx
shr r10d, 56
mov rbx, 71776119061217280
mov r10, QWORD[rbp-8]
and r10d, ebx
shr r10d, 40
or r10d, r10d
mov rbx, 280375465082880
mov r10, QWORD[rbp-8]
and r10d, ebx
shr r10d, 24
or r10d, r10d
mov rbx, 1095216660480
mov r10, QWORD[rbp-8]
and r10d, ebx
shr r10d, 8
or r10d, r10d
mov rbx, 4278190080
mov r10, QWORD[rbp-8]
and r10d, ebx
shl r10d, 8
or r10d, r10d
mov rbx, 16711680
mov r10, QWORD[rbp-8]
and r10d, ebx
shl r10d, 24
or r10d, r10d
mov rbx, 65280
mov r10, QWORD[rbp-8]
and r10d, ebx
shl r10d, 40
or r10d, r10d
mov rbx, 255
mov r10, QWORD[rbp-8]
and r10d, ebx
shl r10d, 56
or r10d, r10d
mov rax, r10
jmp ___int_bitswap64_pint__return
___int_bitswap64_pint__return:
leave
ret
_uint32_bitswap32_puint32:
push rbp
mov rbp, rsp
sub rsp, 16
mov [rbp-8], rdi
mov rbx, 4278190080
mov r10, rbx
mov rbx, QWORD[rbp-8]
and bx, r10w
shr bx, 24
mov rbx, 16711680
mov r10, rbx
mov rbx, QWORD[rbp-8]
and bx, r10w
shr bx, 8
or bx, bx
mov rbx, 65280
mov r10, rbx
mov rbx, QWORD[rbp-8]
and bx, r10w
shl bx, 8
or bx, bx
mov rbx, 255
mov r10, rbx
mov rbx, QWORD[rbp-8]
and bx, r10w
shl bx, 24
or bx, bx
mov rax, rbx
jmp ___uint32_bitswap32_puint32__return
___uint32_bitswap32_puint32__return:
leave
ret
_void._malloc_psize_t:
push rbp
mov rbp, rsp
sub rsp, 16
mov [rbp-8], rdi
ALIGN_STACK
    call malloc
    UNALIGN_STACK
___void._malloc_psize_t__return:
leave
ret
_void._calloc_psize_t:
push rbp
mov rbp, rsp
sub rsp, 16
mov [rbp-8], rdi
ALIGN_STACK
    call calloc
    UNALIGN_STACK
___void._calloc_psize_t__return:
leave
ret
_void._realloc_pvoid.size_t:
push rbp
mov rbp, rsp
sub rsp, 24
mov [rbp-8], rdi
mov [rbp-16], rsi
ALIGN_STACK
    call realloc
    UNALIGN_STACK
___void._realloc_pvoid.size_t__return:
leave
ret
_void_free_pvoid.:
push rbp
mov rbp, rsp
sub rsp, 16
mov [rbp-8], rdi
ALIGN_STACK
    call free
    UNALIGN_STACK
___void_free_pvoid.__return:
leave
ret
_void_memcpy_pvoid.void.size_t:
push rbp
mov rbp, rsp
sub rsp, 32
mov [rbp-8], rdi
mov [rbp-16], rsi
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
_void_avx_memcpy_pvoid.void.size_t:
push rbp
mov rbp, rsp
sub rsp, 56
mov [rbp-8], rdi
mov [rbp-16], rsi
mov [rbp-24], rdx
mov rbx, QWORD[rbp-24]
mov r10, 32
mov r11, r10
xor rdx, rdx
mov rax, rbx
idiv r11
mov QWORD[rbp-32], rdx
mov rbx, QWORD[rbp-24]
mov r10, QWORD[rbp-32]
mov r11, r10
sub rbx, r11
sar rbx, 2
mov QWORD[rbp-40], rbx
mov QWORD[rbp-48], 0
jmp .L0x1
.L0x0:
mov r10, QWORD[rbp-48]
mov rbx, r10
shl rbx, 3
add rbx, [rbp-16]
vmovdqu ymm0, [rbx]
mov r10, QWORD[rbp-48]
mov rbx, r10
shl rbx, 3
add rbx, [rbp-8]
vmovdqu [rbx], ymm0
.L0x2:
mov r10, QWORD[rbp-48]
add r10d, 4
mov QWORD[rbp-48], r10
.L0x1:
mov rbx, QWORD[rbp-40]
mov r10, QWORD[rbp-48]
mov r11, r10
cmp r11, rbx
setl r11b
mov rax, r11
and al, 1
jnz .L0x0
.L0x3:
mov rbx, QWORD[rbp-32]
test ebx, ebx
setnz bl
mov rax, rbx
and al, 1
jz .L0x4
mov rdx, QWORD[rbp-32]
mov rbx, QWORD[rbp-40]
mov r10, QWORD[rbp-16]
add r10, rbx
mov rsi, r10
mov rbx, QWORD[rbp-40]
mov r10, QWORD[rbp-8]
add r10, rbx
mov rdi, r10
xor rax, rax
call _void_memcpy_pvoid.void.size_t
push rax
jmp .L0x5
.L0x4:
.L0x5:
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


_FILE_fopen_pchar.char.:
push rbp
mov rbp, rsp
sub rsp, 56
mov [rbp-8], rdi
mov [rbp-16], rsi
mov rbx, QWORD[rbp-16]
mov r11, 1
mov r10, QWORD[rbp-16]
lea r10, [r10+r11*1]
mov bl, byte[rbx]
and rbx, 0xff
mov r10b, byte[r10]
and r10, 0xff
add bl, r10b
mov QWORD[rbp-24], rbx
mov QWORD[rbp-32], 0
mov QWORD[rbp-40], 0
mov r10, 114
mov rbx, QWORD[rbp-24]
cmp ebx, r10d
sete bl
mov rax, rbx
and al, 1
jz .L0x6
mov rbx, 0
mov QWORD[rbp-40], rbx
jmp .L0x7
.L0x6:
mov r10, 119
mov rbx, QWORD[rbp-24]
cmp ebx, r10d
sete bl
mov rax, rbx
and al, 1
jz .L0x8
mov rbx, 1
mov QWORD[rbp-40], rbx
jmp .L0x9
.L0x8:
mov r10, 97
mov rbx, QWORD[rbp-24]
cmp ebx, r10d
sete bl
mov rax, rbx
and al, 1
jz .L0xa
mov rbx, 1
mov QWORD[rbp-40], rbx
jmp .L0xb
.L0xa:
mov r10, 157
mov rbx, QWORD[rbp-24]
cmp ebx, r10d
sete bl
mov rax, rbx
and al, 1
jz .L0xc
mov rbx, 2
mov QWORD[rbp-40], rbx
jmp .L0xd
.L0xc:
mov r10, 162
mov rbx, QWORD[rbp-24]
cmp ebx, r10d
sete bl
mov rax, rbx
and al, 1
jz .L0xe
mov rbx, 1792
mov QWORD[rbp-32], rbx
mov rbx, 2
mov QWORD[rbp-40], rbx
jmp .L0xf
.L0xe:
mov rbx, 1792
mov QWORD[rbp-32], rbx
mov rbx, 2
mov QWORD[rbp-40], rbx
.L0xf:
.L0xd:
.L0xb:
.L0x9:
.L0x7:
mov r10, QWORD[rbp-32]
mov rbx, r10
mov edx, ebx
mov r10, QWORD[rbp-40]
mov rbx, r10
mov esi, ebx
mov rbx, QWORD[rbp-8]
mov rdi, rbx
xor rax, rax
call _fd_t_open_pchar.intmode_t
mov QWORD[rbp-48], rax
mov r10, 140
mov rbx, QWORD[rbp-24]
cmp ebx, r10d
sete bl
mov r11, 87
mov r10, QWORD[rbp-24]
cmp r10d, r11d
sete r10b
or bl, r10b
mov rax, rbx
and al, 1
jz .L0x10
mov rbx, 2
mov edx, ebx
xor rbx, rbx
mov esi, ebx
mov r10, QWORD[rbp-48]
mov rbx, r10
mov edi, ebx
xor rax, rax
call _int_lseek_pfd_tintint
push rax
jmp .L0x11
.L0x10:
.L0x11:
mov rax, QWORD[rbp-48]
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
mov rbx, QWORD[rbp-16]
mov rdi, rbx
xor rax, rax
call _size_t_strlen_pchar.
mov QWORD[rbp-24], rax
mov rdx, QWORD[rbp-24]
mov rbx, QWORD[rbp-16]
mov rsi, rbx
mov r10, QWORD[rbp-8]
mov rbx, r10
mov edi, ebx
xor rax, rax
call _ssize_t_write_pfd_tchar.size_t
mov QWORD[rbp-32], rax
mov rbx, 1
mov edx, ebx
mov r10, QWORD[rbp-24]
mov rbx, r10
mov esi, ebx
mov r10, QWORD[rbp-8]
mov rbx, r10
mov edi, ebx
xor rax, rax
call _int_lseek_pfd_tintint
push rax
mov rbx, QWORD[rbp-32]
mov rax, rbx
jmp ___int_fputs_pfd_tchar.__return
___int_fputs_pfd_tchar.__return:
leave
ret
_bool_fgets_pfd_tchar.size_t:
push rbp
mov rbp, rsp
sub rsp, 40
mov [rbp-8], rdi
mov [rbp-16], rsi
mov [rbp-24], rdx
mov rbx, QWORD[rbp-24]
mov rdx, rbx
mov rbx, QWORD[rbp-16]
mov rsi, rbx
mov r10, QWORD[rbp-8]
mov rbx, r10
mov edi, ebx
xor rax, rax
call _ssize_t_read_pfd_tchar.size_t
mov rbx, rax
xor r10, r10
mov r11, r10
cmp rbx, r11
setg bl
mov QWORD[rbp-32], rbx
mov rbx, 1
mov edx, ebx
mov rbx, QWORD[rbp-24]
mov esi, ebx
mov r10, QWORD[rbp-8]
mov rbx, r10
mov edi, ebx
xor rax, rax
call _int_lseek_pfd_tintint
push rax
mov rax, QWORD[rbp-32]
jmp ___bool_fgets_pfd_tchar.size_t__return
___bool_fgets_pfd_tchar.size_t__return:
leave
ret
_void._floads_pfd_t:
push rbp
mov rbp, rsp
sub rsp, 40
mov [rbp-8], rdi
mov rbx, 2
mov edx, ebx
xor rbx, rbx
mov esi, ebx
mov r10, QWORD[rbp-8]
mov rbx, r10
mov edi, ebx
xor rax, rax
call _int_lseek_pfd_tintint
mov QWORD[rbp-16], rax
mov rbx, 2
mov edx, ebx
mov r11, QWORD[rbp-16]
xor r10, r10
sub r10d, r11d
mov rbx, r10
mov esi, ebx
mov r10, QWORD[rbp-8]
mov rbx, r10
mov edi, ebx
xor rax, rax
call _int_lseek_pfd_tintint
push rax
mov rdi, QWORD[rbp-16]
xor rax, rax
call _void._malloc_psize_t
mov QWORD[rbp-24], rax
mov rdx, QWORD[rbp-16]
mov rbx, QWORD[rbp-24]
mov rsi, rbx
mov r10, QWORD[rbp-8]
mov rbx, r10
mov edi, ebx
xor rax, rax
call _ssize_t_read_pfd_tchar.size_t
mov rbx, rax
xor r10, r10
mov r11, r10
cmp rbx, r11
setl bl
mov QWORD[rbp-32], rbx
mov rbx, QWORD[rbp-32]
mov rax, rbx
and al, 1
jz .L0x12
mov rax, 0
jmp ___void._floads_pfd_t__return
jmp .L0x13
.L0x12:
.L0x13:
mov rax, QWORD[rbp-24]
jmp ___void._floads_pfd_t__return
___void._floads_pfd_t__return:
leave
ret
_void._mmap_pvoid.size_tintintintoff_t:
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
    syscall
___void._mmap_pvoid.size_tintintintoff_t__return:
leave
ret
_void_remove_page_pblock_t.:
push rbp
mov rbp, rsp
sub rsp, 16
mov [rbp-8], rdi
mov rbx, QWORD[rbp-8]
lea rbx, [rbx+16]
mov r10, rbx
lea r10, [r10+8]
mov rbx, QWORD[rbp-8]
lea rbx, [rbx+16]
mov r10, rbx
lea r10, [r10+8]
mov r11, QWORD[rbp-8]
lea r11, [r11+8]
mov r11, qword[r11]
mov qword[r10], r11
mov rbx, QWORD[rbp-8]
lea rbx, [rbx+8]
mov r10, rbx
lea r10, [r10+16]
mov rbx, QWORD[rbp-8]
lea rbx, [rbx+8]
mov r10, rbx
lea r10, [r10+16]
mov r11, QWORD[rbp-8]
lea r11, [r11+16]
mov r11, qword[r11]
mov qword[r10], r11
___void_remove_page_pblock_t.__return:
leave
ret
_void_add_page_pblock_t.:
push rbp
mov rbp, rsp
sub rsp, 16
mov [rbp-8], rdi
mov rbx, [free_memory]
test ebx, ebx
setz bl
mov rax, rbx
and al, 1
jz .L0x14
mov rbx, QWORD[rbp-8]
mov [free_memory], rbx
jmp ___void_add_page_pblock_t.__return
jmp .L0x15
.L0x14:
.L0x15:
mov rbx, QWORD[rbp-8]
lea rbx, [rbx+8]
mov rbx, QWORD[rbp-8]
lea rbx, [rbx+8]
mov r10, [free_memory]
mov qword[rbx], r10
mov rbx, QWORD[rbp-8]
lea rbx, [rbx+8]
mov r10, rbx
lea r10, [r10+16]
mov rbx, QWORD[rbp-8]
lea rbx, [rbx+8]
mov r10, rbx
lea r10, [r10+16]
mov r11, QWORD[rbp-8]
mov qword[r10], r11
mov rbx, QWORD[rbp-8]
mov [free_memory], rbx
___void_add_page_pblock_t.__return:
leave
ret
_void_populate_zerofd_p:
push rbp
mov rbp, rsp
sub rsp, 8
mov r10, STRING_CONSTANT_1
mov rsi, r10
mov r10, STRING_CONSTANT_0
mov rdi, r10
xor rax, rax
call _FILE_fopen_pchar.char.
mov [zerofd], rax
___void_populate_zerofd_p__return:
leave
ret
_void.__scan_psize_t:
push rbp
mov rbp, rsp
sub rsp, 24
mov [rbp-8], rdi
mov rbx, [free_memory]
test ebx, ebx
setz bl
mov rax, rbx
and al, 1
jz .L0x16
mov rax, 0
jmp ___void.__scan_psize_t__return
jmp .L0x17
.L0x16:
.L0x17:
mov rbx, [free_memory]
mov QWORD[rbp-16], rbx
jmp .L0x19
.L0x18:
mov rbx, QWORD[rbp-16]
lea rbx, [rbx+0]
mov rbx, qword[rbx]
mov rsi, rbx
mov rbx, STRING_CONSTANT_2
mov rdi, rbx
xor rax, rax
call printf
push rax
mov rbx, QWORD[rbp-16]
lea rbx, [rbx+0]
mov rbx, qword[rbx]
mov r10, QWORD[rbp-8]
cmp rbx, r10
setge bl
mov rax, rbx
and al, 1
jz .L0x1b
mov rbx, QWORD[rbp-16]
mov rdi, rbx
xor rax, rax
call _void_remove_page_pblock_t.
push rax
mov rbx, QWORD[rbp-16]
add rbx, 24
mov rax, rbx
jmp ___void.__scan_psize_t__return
jmp .L0x1c
.L0x1b:
.L0x1c:
mov r10, QWORD[rbp-16]
lea r10, [r10+8]
mov r10, qword[r10]
mov QWORD[rbp-16], r10
.L0x19:
mov rbx, QWORD[rbp-16]
lea rbx, [rbx+8]
test rbx, rbx
setnz bl
mov rax, rbx
and al, 1
jnz .L0x18
.L0x1a:
mov rax, 0
jmp ___void.__scan_psize_t__return
___void.__scan_psize_t__return:
leave
ret
_void._mlc_psize_t:
push rbp
mov rbp, rsp
sub rsp, 72
mov [rbp-8], rdi
mov rbx, 24
mov r10, QWORD[rbp-8]
add r10, rbx
mov QWORD[rbp-8], r10
mov rbx, QWORD[rbp-8]
mov r10, 12288
mov r11, r10
cmp rbx, r11
setl bl
mov rax, rbx
and al, 1
jz .L0x1d
mov rbx, 12288
mov QWORD[rbp-16], rbx
jmp .L0x1e
.L0x1d:
mov r10, QWORD[rbp-8]
mov r11, 4096
mov r12, r11
xor rdx, rdx
mov rax, r10
idiv r12
mov r10, rdx
mov r11, QWORD[rbp-8]
add r11, r10
mov QWORD[rbp-16], r11
.L0x1e:
mov rbx, QWORD[rbp-16]
mov rdi, rbx
xor rax, rax
call _void.__scan_psize_t
mov QWORD[rbp-24], rax
mov rbx, QWORD[rbp-24]
test rbx, rbx
setz bl
mov rax, rbx
and al, 1
jz .L0x1f
mov rbx, [zerofd]
cmp rbx, 0
sete bl
mov rax, rbx
and al, 1
jz .L0x21
mov rax, 0
call _void_populate_zerofd_p
push rax
jmp .L0x22
.L0x21:
.L0x22:
mov rbx, QWORD[rbp-8]
mov QWORD[rbp-32], rbx
mov r10, 0
mov r9d, r10d
mov r11, [zerofd]
mov r10, r11
mov r8d, r10d
mov r10, 34
mov ecx, r10d
mov r10, 3
mov edx, r10d
mov rsi, QWORD[rbp-32]
xor rdi, rdi
xor rax, rax
call _void._mmap_pvoid.size_tintintintoff_t
mov QWORD[rbp-24], rax
mov QWORD[rbp-64], 0
mov QWORD[rbp-56], 0
mov QWORD[rbp-48], 0
mov r10, QWORD[rbp-8]
mov QWORD[rbp-64], r10
mov rbx, 0
mov QWORD[rbp-56], rbx
mov rbx, 0
mov QWORD[rbp-48], rbx
mov rdx, 24
lea rbx, [rbp-64]
mov rsi, rbx
mov rbx, QWORD[rbp-24]
mov rdi, rbx
xor rax, rax
call _void_memcpy_pvoid.void.size_t
push rax
mov rbx, 24
mov r10, QWORD[rbp-24]
add r10, rbx
mov QWORD[rbp-24], r10
jmp .L0x20
.L0x1f:
.L0x20:
mov rax, QWORD[rbp-24]
jmp ___void._mlc_psize_t__return
___void._mlc_psize_t__return:
leave
ret
_void_fr_pvoid.:
push rbp
mov rbp, rsp
sub rsp, 16
mov [rbp-8], rdi
mov rbx, 24
mov r10, QWORD[rbp-8]
sub r10, rbx
mov QWORD[rbp-8], r10
mov rdi, QWORD[rbp-8]
xor rax, rax
call _void_add_page_pblock_t.
push rax
___void_fr_pvoid.__return:
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
mov rbx, QWORD[rbp-16]
mov rsi, rbx
mov rbx, QWORD[rbp-8]
mov rdi, rbx
xor rax, rax
call _long_pow_plonglong
push rax
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
cvttsd2si rax, xmm0
  inc rax
___long_ceil_pdouble__return:
leave
ret
_long_floor_pdouble:
push rbp
mov rbp, rsp
sub rsp, 16
movsd [rbp-8], xmm0
cvttsd2si rax, xmm0
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
movsd xmm1, xmm0
  mov rax, 1
  movq xmm2, rax
  xorpd xmm1, xmm2
  andpd xmm0, xmm1
___double_abs_pdouble__return:
leave
ret
_long_log_plong:
push rbp
mov rbp, rsp
sub rsp, 16
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
_long_toStr_plongchar.bool:
push rbp
mov rbp, rsp
sub rsp, 56
mov [rbp-8], rdi
mov [rbp-16], rsi
mov [rbp-24], rdx
mov QWORD[rbp-32], 0
mov rbx, QWORD[rbp-8]
xor r10, r10
mov r11, r10
cmp rbx, r11
setl bl
mov r10, QWORD[rbp-24]
and bl, r10b
mov rax, rbx
and al, 1
jz .L0x23
mov rbx, QWORD[rbp-16]
mov r10, rbx
mov rbx, QWORD[rbp-16]
mov r10, rbx
mov rbx, 45
mov byte[r10], bl
mov rbx, 1
mov r10, QWORD[rbp-16]
add r10, rbx
mov QWORD[rbp-16], r10
mov r10, QWORD[rbp-8]
xor r11, r11
mov r12, r11
sub r12, r10
mov QWORD[rbp-8], r12
mov rbx, 1
mov QWORD[rbp-32], rbx
jmp .L0x24
.L0x23:
.L0x24:
mov rbx, QWORD[rbp-8]
mov rdi, rbx
xor rax, rax
call _long_log_plong
mov rbx, rax
inc rbx
mov QWORD[rbp-40], rbx
mov rbx, QWORD[rbp-40]
mov r10, QWORD[rbp-16]
add r10, rbx
mov QWORD[rbp-16], r10
mov QWORD[rbp-48], 0
jmp .L0x26
.L0x25:
mov rbx, 1
mov r10, QWORD[rbp-16]
sub r10, rbx
mov QWORD[rbp-16], r10
mov rbx, QWORD[rbp-16]
mov r10, rbx
mov rbx, QWORD[rbp-16]
mov r10, rbx
mov r11, QWORD[rbp-8]
mov r12, 10
mov r13, r12
xor rdx, rdx
mov rax, r11
idiv r13
mov r11, rdx
mov r12, r11
mov r13, r12
add r13b, 48
mov rbx, r13
mov byte[r10], bl
mov rbx, 10
mov r10, QWORD[rbp-8]
xor rdx, rdx
mov rax,r10
idiv rbx
mov QWORD[rbp-8], rax
.L0x27:
mov rbx, 1
mov r11, QWORD[rbp-48]
add r11d, ebx
mov QWORD[rbp-48], r11
.L0x26:
mov rbx, QWORD[rbp-40]
mov r10, QWORD[rbp-48]
mov r11, r10
cmp r11, rbx
setl r11b
mov rax, r11
and al, 1
jnz .L0x25
.L0x28:
mov rbx, QWORD[rbp-40]
mov r10, QWORD[rbp-32]
mov r11, r10
add rbx, r11
mov rax, rbx
jmp ___long_toStr_plongchar.bool__return
___long_toStr_plongchar.bool__return:
leave
ret
_long_toStr_pdoublechar.long:
push rbp
mov rbp, rsp
sub rsp, 48
movsd [rbp-8], xmm0
mov [rbp-16], rdi
mov [rbp-24], rsi
cvttsd2si rbx, QWORD[rbp-8]
mov QWORD[rbp-32], rbx
mov rbx, 1
mov dl, bl
mov rbx, QWORD[rbp-16]
mov rsi, rbx
mov rbx, QWORD[rbp-32]
mov rdi, rbx
xor rax, rax
call _long_toStr_plongchar.bool
mov QWORD[rbp-40], rax
mov rbx, QWORD[rbp-40]
mov r10, QWORD[rbp-16]
add r10, rbx
mov QWORD[rbp-16], r10
movsd xmm8, QWORD[rbp-8]
movsd xmm0, xmm8
mov rax, 1
call _double_abs_pdouble
movq rax, xmm0
movq xmm7, rax
movsd QWORD[rbp-8], xmm7
cvtsi2sd xmm7, QWORD[rbp-32]
movsd xmm8, QWORD[rbp-8]
subsd xmm8, xmm7
movsd QWORD[rbp-8], xmm8
cvtsi2sd xmm7, QWORD[rbp-24]
movsd xmm8, QWORD[rbp-8]
mulsd xmm8, xmm7
movsd QWORD[rbp-8], xmm8
mov rbx, QWORD[rbp-16]
mov r10, rbx
mov rbx, QWORD[rbp-16]
mov r10, rbx
mov rbx, 46
mov byte[r10], bl
inc qword[rbp-16]
mov r10, 0
mov dl, r10b
mov r10, QWORD[rbp-16]
mov rsi, r10
movsd xmm7, QWORD[rbp-8]
movsd xmm0, xmm7
mov rax, 1
call _long_round_pdouble
mov rdi, rax
xor rax, rax
call _long_toStr_plongchar.bool
mov rbx, rax
mov r11, QWORD[rbp-40]
add r11, rbx
mov QWORD[rbp-40], r11
mov rbx, QWORD[rbp-40]
dec rbx
mov rax, rbx
jmp ___long_toStr_pdoublechar.long__return
___long_toStr_pdoublechar.long__return:
leave
ret
_int___sprintf_pchar.char.void.:
push rbp
mov rbp, rsp
sub rsp, 160
mov [rbp-8], rdi
mov [rbp-16], rsi
mov [rbp-24], rdx
mov QWORD[rbp-32], 0
mov rbx, QWORD[rbp-8]
mov QWORD[rbp-40], rbx
mov rbx, QWORD[rbp-8]
test rbx, rbx
setz bl
mov r10, QWORD[rbp-16]
test r10, r10
setz r10b
or bl, r10b
mov rax, rbx
and al, 1
jz .L0x29
mov rax, 0
jmp ___int___sprintf_pchar.char.void.__return
jmp .L0x2a
.L0x29:
.L0x2a:
jmp .L0x2c
.L0x2b:
mov rbx, QWORD[rbp-16]
and r10, 0xff
mov r10b, byte[rbx]
mov rbx, 37
cmp r10b, bl
setne r10b
mov rax, r10
and al, 1
jz .L0x2e
mov rbx, QWORD[rbp-8]
mov r10, rbx
mov rbx, QWORD[rbp-8]
mov r10, rbx
mov r11, QWORD[rbp-16]
and r12, 0xff
mov r12b, byte[r11]
mov rbx, r12
mov byte[r10], bl
jmp .L0x2f
.L0x2e:
mov rbx, 1
mov r10, QWORD[rbp-16]
add r10, rbx
mov QWORD[rbp-16], r10
mov rbx, QWORD[rbp-16]
and r10, 0xff
mov r10b, byte[rbx]
mov QWORD[rbp-48], r10
mov r10, 105
mov rbx, QWORD[rbp-48]
cmp bl, r10b
sete bl
mov rax, rbx
and al, 1
jz .L0x30
mov r10, QWORD[rbp-32]
mov rbx, QWORD[rbp-24]
lea rbx, [rbx+r10*8]
mov rbx, qword[rbx]
mov QWORD[rbp-56], rbx
mov rbx, 1
mov dl, bl
mov rbx, QWORD[rbp-8]
mov rsi, rbx
mov rbx, QWORD[rbp-56]
mov rdi, rbx
xor rax, rax
call _long_toStr_plongchar.bool
mov QWORD[rbp-64], rax
mov r10, QWORD[rbp-64]
dec r10
mov rbx, r10
mov r10, QWORD[rbp-8]
add r10, rbx
mov QWORD[rbp-8], r10
jmp .L0x31
.L0x30:
mov r10, 99
mov rbx, QWORD[rbp-48]
cmp bl, r10b
sete bl
mov rax, rbx
and al, 1
jz .L0x32
mov r10, QWORD[rbp-32]
mov rbx, QWORD[rbp-24]
lea rbx, [rbx+r10*8]
mov rbx, qword[rbx]
mov QWORD[rbp-72], rbx
mov rbx, QWORD[rbp-8]
mov r10, rbx
mov rbx, QWORD[rbp-8]
mov r10, rbx
mov r11, QWORD[rbp-72]
mov rbx, r11
mov byte[r10], bl
jmp .L0x33
.L0x32:
mov r10, 117
mov rbx, QWORD[rbp-48]
cmp bl, r10b
sete bl
mov rax, rbx
and al, 1
jz .L0x34
mov r10, QWORD[rbp-32]
mov rbx, QWORD[rbp-24]
lea rbx, [rbx+r10*8]
mov rbx, qword[rbx]
mov QWORD[rbp-80], rbx
mov rbx, 0
mov dl, bl
mov rbx, QWORD[rbp-8]
mov rsi, rbx
mov rbx, QWORD[rbp-80]
mov rdi, rbx
xor rax, rax
call _long_toStr_plongchar.bool
mov QWORD[rbp-88], rax
mov r10, QWORD[rbp-88]
dec r10d
mov rbx, r10
mov r10, QWORD[rbp-8]
add r10, rbx
mov QWORD[rbp-8], r10
jmp .L0x35
.L0x34:
mov r10, 115
mov rbx, QWORD[rbp-48]
cmp bl, r10b
sete bl
mov rax, rbx
and al, 1
jz .L0x36
mov r10, QWORD[rbp-32]
mov rbx, QWORD[rbp-24]
lea rbx, [rbx+r10*8]
mov rbx, qword[rbx]
mov rsi, rbx
mov rbx, QWORD[rbp-8]
mov rdi, rbx
xor rax, rax
call _int_strcpy_pchar.char.
mov QWORD[rbp-96], rax
mov r10, QWORD[rbp-96]
dec r10d
mov rbx, r10
mov r10, QWORD[rbp-8]
add r10, rbx
mov QWORD[rbp-8], r10
jmp .L0x37
.L0x36:
mov r10, 98
mov rbx, QWORD[rbp-48]
cmp bl, r10b
sete bl
mov rax, rbx
and al, 1
jz .L0x38
mov r10, QWORD[rbp-32]
mov rbx, QWORD[rbp-24]
lea rbx, [rbx+r10*8]
mov rbx, qword[rbx]
mov QWORD[rbp-104], rbx
mov QWORD[rbp-112], STRING_CONSTANT_3
mov rbx, QWORD[rbp-104]
mov rax, rbx
and al, 1
jz .L0x3a
mov QWORD[rbp-112], STRING_CONSTANT_4
jmp .L0x3b
.L0x3a:
.L0x3b:
mov rbx, QWORD[rbp-112]
mov rsi, rbx
mov rbx, QWORD[rbp-8]
mov rdi, rbx
xor rax, rax
call _int_strcpy_pchar.char.
mov QWORD[rbp-120], rax
mov rbx, QWORD[rbp-120]
mov r10, QWORD[rbp-8]
add r10, rbx
mov QWORD[rbp-8], r10
jmp .L0x39
.L0x38:
mov r10, 100
mov rbx, QWORD[rbp-48]
cmp bl, r10b
sete bl
mov rax, rbx
and al, 1
jz .L0x3c
mov r10, QWORD[rbp-32]
mov rbx, QWORD[rbp-24]
lea rbx, [rbx+r10*8]
mov rbx, qword[rbx]
movq xmm7, rbx
movsd QWORD[rbp-128], xmm7
mov rsi, 100000000000000
mov rbx, QWORD[rbp-8]
mov rdi, rbx
movsd xmm7, QWORD[rbp-128]
movsd xmm0, xmm7
mov rax, 1
call _long_toStr_pdoublechar.long
mov QWORD[rbp-136], rax
mov r10, QWORD[rbp-136]
dec r10d
mov rbx, r10
mov r10, QWORD[rbp-8]
add r10, rbx
mov QWORD[rbp-8], r10
jmp .L0x3d
.L0x3c:
mov r10, 102
mov rbx, QWORD[rbp-48]
cmp bl, r10b
sete bl
mov rax, rbx
and al, 1
jz .L0x3e
mov r10, QWORD[rbp-32]
mov rbx, QWORD[rbp-24]
lea rbx, [rbx+r10*8]
mov rbx, qword[rbx]
movq xmm7, rbx
movsd QWORD[rbp-144], xmm7
mov rsi, 10000000
mov rbx, QWORD[rbp-8]
mov rdi, rbx
movsd xmm7, QWORD[rbp-144]
movsd xmm0, xmm7
mov rax, 1
call _long_toStr_pdoublechar.long
mov QWORD[rbp-152], rax
mov r10, QWORD[rbp-152]
dec r10d
mov rbx, r10
mov r10, QWORD[rbp-8]
add r10, rbx
mov QWORD[rbp-8], r10
jmp .L0x3f
.L0x3e:
.L0x3f:
.L0x3d:
.L0x39:
.L0x37:
.L0x35:
.L0x33:
.L0x31:
mov rbx, 1
mov r11, QWORD[rbp-32]
add r11d, ebx
mov QWORD[rbp-32], r11
.L0x2f:
mov rbx, 1
mov r10, QWORD[rbp-16]
add r10, rbx
mov QWORD[rbp-16], r10
mov rbx, 1
mov r10, QWORD[rbp-8]
add r10, rbx
mov QWORD[rbp-8], r10
.L0x2c:
mov rbx, QWORD[rbp-16]
and r10, 0xff
mov r10b, byte[rbx]
test r10b, r10b
setnz r10b
mov rax, r10
and al, 1
jnz .L0x2b
.L0x2d:
mov rbx, QWORD[rbp-40]
mov r10, QWORD[rbp-8]
sub r10, rbx
mov rax, r10
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
mov QWORD[rbp-56], rax
mov rbx, QWORD[rbp-56]
mov rbx, QWORD[rbp-56]
mov r11, QWORD[rbp-24]
mov qword[rbx], r11
mov r10, 1
mov rbx, QWORD[rbp-56]
lea rbx, [rbx+r10*8]
mov r10, 1
mov rbx, QWORD[rbp-56]
lea rbx, [rbx+r10*8]
mov r11, QWORD[rbp-32]
mov qword[rbx], r11
mov r10, 2
mov rbx, QWORD[rbp-56]
lea rbx, [rbx+r10*8]
mov r10, 2
mov rbx, QWORD[rbp-56]
lea rbx, [rbx+r10*8]
mov r11, QWORD[rbp-40]
mov qword[rbx], r11
mov r10, 3
mov rbx, QWORD[rbp-56]
lea rbx, [rbx+r10*8]
mov r10, 3
mov rbx, QWORD[rbp-56]
lea rbx, [rbx+r10*8]
mov r11, QWORD[rbp-48]
mov qword[rbx], r11
mov rbx, QWORD[rbp-56]
mov rdx, rbx
mov rbx, QWORD[rbp-16]
mov rsi, rbx
mov rbx, QWORD[rbp-8]
mov rdi, rbx
xor rax, rax
call _int___sprintf_pchar.char.void.
mov QWORD[rbp-64], rax
mov rbx, QWORD[rbp-56]
mov rdi, rbx
xor rax, rax
call _void_free_pvoid.
push rax
mov rbx, QWORD[rbp-64]
mov rax, rbx
jmp ___int_sprintf_pchar.char.voidvoidvoidvoid__return
___int_sprintf_pchar.char.voidvoidvoidvoid__return:
leave
ret
_void___printf_pchar.void.:
push rbp
mov rbp, rsp
sub rsp, 100040
mov [rbp-8], rdi
mov [rbp-16], rsi
mov r10, 100000
lea rbx, [rbp-25]
lea rbx, [rbx+r10*1]
mov r10, 100000
lea rbx, [rbp-25]
lea rbx, [rbx+r10*1]
xor r10, r10
mov byte[rbx], r10b
mov rbx, QWORD[rbp-16]
mov rdx, rbx
mov rbx, QWORD[rbp-8]
mov rsi, rbx
lea rbx, [rbp-25]
mov rdi, rbx
xor rax, rax
call _int___sprintf_pchar.char.void.
mov QWORD[rbp-100032], rax
mov rdx, QWORD[rbp-100032]
lea rbx, [rbp-25]
mov rsi, rbx
mov rbx, 1
mov edi, ebx
xor rax, rax
call _ssize_t_write_pfd_tchar.size_t
push rax
___void___printf_pchar.void.__return:
leave
ret
printf:
push rbp
mov rbp, rsp
sub rsp, 64
mov [rbp-8], rdi
mov [rbp-16], rsi
mov [rbp-24], rdx
mov [rbp-32], rcx
mov [rbp-40], r8
mov [rbp-48], r9
mov rdi, 48
xor rax, rax
call _void._malloc_psize_t
mov QWORD[rbp-56], rax
mov rbx, QWORD[rbp-56]
mov rbx, QWORD[rbp-56]
mov r11, QWORD[rbp-16]
mov qword[rbx], r11
mov r10, 1
mov rbx, QWORD[rbp-56]
lea rbx, [rbx+r10*8]
mov r10, 1
mov rbx, QWORD[rbp-56]
lea rbx, [rbx+r10*8]
mov r11, QWORD[rbp-24]
mov qword[rbx], r11
mov r10, 2
mov rbx, QWORD[rbp-56]
lea rbx, [rbx+r10*8]
mov r10, 2
mov rbx, QWORD[rbp-56]
lea rbx, [rbx+r10*8]
mov r11, QWORD[rbp-32]
mov qword[rbx], r11
mov r10, 3
mov rbx, QWORD[rbp-56]
lea rbx, [rbx+r10*8]
mov r10, 3
mov rbx, QWORD[rbp-56]
lea rbx, [rbx+r10*8]
mov r11, QWORD[rbp-40]
mov qword[rbx], r11
mov r10, 4
mov rbx, QWORD[rbp-56]
lea rbx, [rbx+r10*8]
mov r10, 4
mov rbx, QWORD[rbp-56]
lea rbx, [rbx+r10*8]
mov r11, QWORD[rbp-48]
mov qword[rbx], r11
mov rbx, QWORD[rbp-56]
mov rsi, rbx
mov rbx, QWORD[rbp-8]
mov rdi, rbx
xor rax, rax
call _void___printf_pchar.void.
push rax
mov rbx, QWORD[rbp-56]
mov rdi, rbx
xor rax, rax
call _void_free_pvoid.
push rax
__printf__return:
leave
ret

_void_printf_pchar.:
push rbp
mov rbp, rsp
sub rsp, 16
mov [rbp-8], rdi
mov rbx, QWORD[rbp-8]
mov rsi, rbx
mov rbx, 1
mov edi, ebx
xor rax, rax
call _int_fputs_pfd_tchar.
push rax
___void_printf_pchar.__return:
leave
ret
_int_rdrand_p:
push rbp
mov rbp, rsp
sub rsp, 8
rdrand rax
___int_rdrand_p__return:
leave
ret
_int_rand_p:
push rbp
mov rbp, rsp
sub rsp, 8
mov r10, [rand_next]
sal r10d, 13
mov r11, [rand_next]
xor r11d, r10d
mov [rand_next], r11
mov r10, [rand_next]
sar r10d, 17
mov r11, [rand_next]
xor r11d, r10d
mov [rand_next], r11
mov r10, [rand_next]
sal r10d, 5
mov r11, [rand_next]
xor r11d, r10d
mov [rand_next], r11
mov rbx, [rand_next]
mov rax, rbx
jmp ___int_rand_p__return
___int_rand_p__return:
leave
ret
_void_srand_p:
push rbp
mov rbp, rsp
sub rsp, 8
mov rax, 0
call _int_rdrand_p
mov [rand_next], rax
___void_srand_p__return:
leave
ret
_int_getitimer_pintitimerval_t.:
push rbp
mov rbp, rsp
sub rsp, 24
mov [rbp-8], rdi
mov [rbp-16], rsi
mov rax, 36
        syscall
___int_getitimer_pintitimerval_t.__return:
leave
ret
_int_gettimeofday_ptimeval_t.timezone_t.:
push rbp
mov rbp, rsp
sub rsp, 24
mov [rbp-8], rdi
mov [rbp-16], rsi
mov rax, 96
    syscall
___int_gettimeofday_ptimeval_t.timezone_t.__return:
leave
ret
_int_setitimer_pintitimerval_t.itimerval_t.:
push rbp
mov rbp, rsp
sub rsp, 32
mov [rbp-8], rdi
mov [rbp-16], rsi
mov [rbp-24], rdx
mov rax, 38
    syscall
___int_setitimer_pintitimerval_t.itimerval_t.__return:
leave
ret
_int_settimeofday_ptimeval_t.timezone_t.:
push rbp
mov rbp, rsp
sub rsp, 24
mov [rbp-8], rdi
mov [rbp-16], rsi
mov rax, 164
    syscall
___int_settimeofday_ptimeval_t.timezone_t.__return:
leave
ret
_int_utimes_pchar.timeval_t.:
push rbp
mov rbp, rsp
sub rsp, 24
mov [rbp-8], rdi
mov [rbp-16], rsi
mov rax, 235
    syscall
___int_utimes_pchar.timeval_t.__return:
leave
ret
_time_t_time_ptime_t.:
push rbp
mov rbp, rsp
sub rsp, 16
mov [rbp-8], rdi
mov rax, 201
    syscall
___time_t_time_ptime_t.__return:
leave
ret
_bool_isdigit_pchar:
push rbp
mov rbp, rsp
sub rsp, 16
mov [rbp-8], rdi
mov r10, 48
mov rbx, QWORD[rbp-8]
cmp bl, r10b
setge bl
mov r11, 57
mov r10, QWORD[rbp-8]
cmp r10b, r11b
setle r10b
and bl, r10b
mov rax, rbx
jmp ___bool_isdigit_pchar__return
___bool_isdigit_pchar__return:
leave
ret
_int_inet_aton_pchar.in_addr.:
push rbp
mov rbp, rsp
sub rsp, 88
mov [rbp-8], rdi
mov [rbp-16], rsi
mov QWORD[rbp-32], 10
mov rdx, 4
xor rbx, rbx
mov sil, bl
lea rbx, [rbp-60]
mov rdi, rbx
xor rax, rax
call _void_memset_pvoid.ucharsize_t
push rax
lea rbx, [rbp-60]
mov QWORD[rbp-80], rbx
mov r10, QWORD[rbp-8]
and r11, 0xff
mov r11b, byte[r10]
mov QWORD[rbp-48], r11
jmp .L0x41
.L0x40:
mov rbx, 0
mov QWORD[rbp-24], rbx
jmp .L0x44
.L0x43:
mov r10, QWORD[rbp-48]
mov rbx, r10
mov dil, bl
xor rax, rax
call _bool_isdigit_pchar
and al, 1
jz .L0x46
mov r10, QWORD[rbp-32]
mov r11, QWORD[rbp-24]
mov r12, r11
imul r12d, r10d
mov r10, QWORD[rbp-48]
sub r10b, 48
mov r11, r10
add r12d, r11d
mov QWORD[rbp-24], r12
mov rbx, 1
mov r10, QWORD[rbp-8]
add r10, rbx
mov QWORD[rbp-8], r10
mov r10, QWORD[rbp-8]
and r11, 0xff
mov r11b, byte[r10]
mov QWORD[rbp-48], r11
jmp .L0x47
.L0x46:
jmp .L0x45
.L0x47:
.L0x44:
mov rbx, 1
mov r10, rbx
mov rax, r10
and al, 1
jnz .L0x43
.L0x45:
mov r10, 46
mov rbx, QWORD[rbp-48]
cmp bl, r10b
sete bl
mov rax, rbx
and al, 1
jz .L0x48
lea rbx, [rbp-60]
add ebx, 16
mov r10, QWORD[rbp-80]
mov r11, r10
cmp r11d, ebx
seta r11b
mov rax, r11
and al, 1
jz .L0x4a
mov rax, 0
jmp ___int_inet_aton_pchar.in_addr.__return
jmp .L0x4b
.L0x4a:
.L0x4b:
mov rbx, QWORD[rbp-80]
mov r10, rbx
mov rbx, QWORD[rbp-80]
mov r10, rbx
mov rbx, QWORD[rbp-24]
mov dword[r10], ebx
mov rbx, 4
mov r10, QWORD[rbp-80]
add r10, rbx
mov QWORD[rbp-80], r10
mov rbx, 1
mov r10, QWORD[rbp-8]
add r10, rbx
mov QWORD[rbp-8], r10
mov r10, QWORD[rbp-8]
and r11, 0xff
mov r11b, byte[r10]
mov QWORD[rbp-48], r11
jmp .L0x49
.L0x48:
jmp .L0x42
.L0x49:
.L0x41:
mov rbx, 1
mov r10, rbx
mov rax, r10
and al, 1
jnz .L0x40
.L0x42:
mov rbx, QWORD[rbp-80]
mov r10, rbx
mov rbx, QWORD[rbp-80]
mov r10, rbx
mov rbx, QWORD[rbp-24]
mov dword[r10], ebx
mov rbx, QWORD[rbp-48]
test bl, bl
setnz bl
mov r11, 32
mov r10, QWORD[rbp-48]
cmp r10b, r11b
setne r10b
and bl, r10b
mov rax, rbx
and al, 1
jz .L0x4c
mov rax, 0
jmp ___int_inet_aton_pchar.in_addr.__return
jmp .L0x4d
.L0x4c:
.L0x4d:
lea r10, [rbp-60]
mov r10d, dword[r10]
and r10, 0xffffffff
shl r10d, 24
mov r11, QWORD[rbp-24]
mov r12, r11
or r12d, r10d
mov r11, 1
lea r10, [rbp-60]
lea r10, [r10+r11*4]
mov r10d, dword[r10]
and r10, 0xffffffff
shl r10d, 16
or r12d, r10d
mov r11, 2
lea r10, [rbp-60]
lea r10, [r10+r11*4]
mov r10d, dword[r10]
and r10, 0xffffffff
shl r10d, 8
or r12d, r10d
mov QWORD[rbp-24], r12
mov rbx, QWORD[rbp-16]
mov r10, rbx
mov rbx, QWORD[rbp-16]
mov r10, rbx
mov r11, QWORD[rbp-24]
mov rbx, r11
mov word[r10], bx
mov rax, 1
jmp ___int_inet_aton_pchar.in_addr.__return
___int_inet_aton_pchar.in_addr.__return:
leave
ret
_fd_t_socket_pintintint:
push rbp
mov rbp, rsp
sub rsp, 32
mov [rbp-8], rdi
mov [rbp-16], rsi
mov [rbp-24], rdx
mov rax, 41
    syscall
___fd_t_socket_pintintint__return:
leave
ret
_int_connect_pfd_tsockaddr_in.int:
push rbp
mov rbp, rsp
sub rsp, 32
mov [rbp-8], rdi
mov [rbp-16], rsi
mov [rbp-24], rdx
mov rax, 42
    syscall
___int_connect_pfd_tsockaddr_in.int__return:
leave
ret
_int_accept_pfd_tsockaddr_in.int:
push rbp
mov rbp, rsp
sub rsp, 32
mov [rbp-8], rdi
mov [rbp-16], rsi
mov [rbp-24], rdx
mov rax, 43
    syscall
___int_accept_pfd_tsockaddr_in.int__return:
leave
ret
_int_bind_pfd_tsockaddr_in.int:
push rbp
mov rbp, rsp
sub rsp, 32
mov [rbp-8], rdi
mov [rbp-16], rsi
mov [rbp-24], rdx
mov rax, 49
    syscall
___int_bind_pfd_tsockaddr_in.int__return:
leave
ret
_int_listen_pfd_tint:
push rbp
mov rbp, rsp
sub rsp, 24
mov [rbp-8], rdi
mov [rbp-16], rsi
mov rax, 50
    syscall
___int_listen_pfd_tint__return:
leave
ret
_int_shutdown_pfd_tint:
push rbp
mov rbp, rsp
sub rsp, 24
mov [rbp-8], rdi
mov [rbp-16], rsi
mov rax, 48
    syscall
___int_shutdown_pfd_tint__return:
leave
ret
_int_scanint_pchar.long.bool:
push rbp
mov rbp, rsp
sub rsp, 64
mov [rbp-8], rdi
mov [rbp-16], rsi
mov [rbp-24], rdx
mov QWORD[rbp-32], 0
mov rbx, QWORD[rbp-8]
and r10, 0xff
mov r10b, byte[rbx]
mov QWORD[rbp-40], r10
mov rbx, 0
mov QWORD[rbp-48], rbx
mov rbx, QWORD[rbp-8]
mov QWORD[rbp-56], rbx
mov r10, 45
mov rbx, QWORD[rbp-40]
cmp bl, r10b
sete bl
mov r10, QWORD[rbp-24]
and bl, r10b
mov rax, rbx
and al, 1
jz .L0x4e
mov r10, 1
mov QWORD[rbp-48], r10
mov rbx, 1
mov r10, QWORD[rbp-8]
add r10, rbx
mov QWORD[rbp-8], r10
mov r10, QWORD[rbp-8]
and r11, 0xff
mov r11b, byte[r10]
mov QWORD[rbp-40], r11
jmp .L0x4f
.L0x4e:
.L0x4f:
jmp .L0x51
.L0x50:
mov r10, QWORD[rbp-32]
mov r11, 10
mov r12, r11
imul r10, r12
mov r11, QWORD[rbp-40]
sub r11b, 48
mov r12, r11
add r10, r12
mov QWORD[rbp-32], r10
mov rbx, 1
mov r10, QWORD[rbp-8]
add r10, rbx
mov QWORD[rbp-8], r10
mov r10, QWORD[rbp-8]
and r11, 0xff
mov r11b, byte[r10]
mov QWORD[rbp-40], r11
.L0x51:
mov r10, 57
mov rbx, QWORD[rbp-40]
cmp bl, r10b
setle bl
mov r11, 48
mov r10, QWORD[rbp-40]
cmp r10b, r11b
setge r10b
and bl, r10b
mov rax, rbx
and al, 1
jnz .L0x50
.L0x52:
mov rbx, QWORD[rbp-48]
cmp rbx, 0
sete bl
mov rax, rbx
and al, 1
jz .L0x53
mov rbx, QWORD[rbp-16]
mov r10, rbx
mov rbx, QWORD[rbp-16]
mov r10, rbx
mov r11, QWORD[rbp-32]
mov qword[r10], r11
jmp .L0x54
.L0x53:
mov rbx, QWORD[rbp-16]
mov r10, rbx
mov rbx, QWORD[rbp-16]
mov r10, rbx
mov r11, QWORD[rbp-32]
xor r12, r12
mov r13, r12
sub r13, r11
mov qword[r10], r13
.L0x54:
mov r10, QWORD[rbp-56]
mov rbx, QWORD[rbp-8]
sub rbx, r10
mov rax, rbx
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
mov rbx, QWORD[rbp-8]
mov QWORD[rbp-32], rbx
jmp .L0x56
.L0x55:
mov rbx, QWORD[rbp-24]
mov r10, rbx
mov rbx, QWORD[rbp-24]
mov r10, rbx
mov r11, QWORD[rbp-8]
and r12, 0xff
mov r12b, byte[r11]
mov rbx, r12
mov byte[r10], bl
inc qword[rbp-8]
inc qword[rbp-24]
.L0x56:
mov rbx, QWORD[rbp-8]
and r10, 0xff
mov r10b, byte[rbx]
mov rbx, QWORD[rbp-16]
cmp r10b, bl
setne r10b
mov rax, r10
and al, 1
jnz .L0x55
.L0x57:
mov r10, QWORD[rbp-32]
mov rbx, QWORD[rbp-8]
sub rbx, r10
mov rax, rbx
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
mov r10, 1
mov r11, r10
mov rbx, r11
mov dl, bl
lea rbx, [rbp-32]
mov rsi, rbx
mov rbx, QWORD[rbp-8]
mov rdi, rbx
xor rax, rax
call _int_scanint_pchar.long.bool
mov QWORD[rbp-48], rax
mov rbx, QWORD[rbp-48]
mov r10, QWORD[rbp-8]
add r10, rbx
mov QWORD[rbp-8], r10
mov rbx, QWORD[rbp-8]
and r10, 0xff
mov r10b, byte[rbx]
mov rbx, 46
cmp r10b, bl
setne r10b
mov rax, r10
and al, 1
jz .L0x58
mov rbx, QWORD[rbp-24]
mov r10, rbx
mov rbx, QWORD[rbp-24]
mov r10, rbx
cvtsi2sd xmm7, QWORD[rbp-32]
movq qword[r10], xmm7
mov rax, QWORD[rbp-48]
jmp ___int_scansd_pchar.booldouble.__return
jmp .L0x59
.L0x58:
.L0x59:
inc qword[rbp-8]
mov r10, 0
mov r11, r10
mov rbx, r11
mov dl, bl
lea rbx, [rbp-40]
mov rsi, rbx
mov rbx, QWORD[rbp-8]
mov rdi, rbx
xor rax, rax
call _int_scanint_pchar.long.bool
mov QWORD[rbp-56], rax
mov rbx, QWORD[rbp-56]
mov rsi, rbx
mov rdi, 10
xor rax, rax
call _long_pow_plonglong
mov QWORD[rbp-64], rax
mov rbx, QWORD[rbp-64]
mov r10, QWORD[rbp-32]
imul r10, rbx
mov QWORD[rbp-32], r10
mov r10, QWORD[rbp-40]
mov rbx, QWORD[rbp-32]
add rbx, r10
cvtsi2sd xmm7, rbx
movsd QWORD[rbp-72], xmm7
mov rbx, QWORD[rbp-24]
mov r10, rbx
mov rbx, QWORD[rbp-24]
mov r10, rbx
movsd xmm8, QWORD[rbp-72]
mov rbx, QWORD[rbp-64]
cvtsi2sd xmm9, rbx
divsd xmm8, xmm9
movsd xmm7, xmm8
movq qword[r10], xmm7
mov r10, QWORD[rbp-56]
mov rbx, QWORD[rbp-48]
add rbx, r10
mov rax, rbx
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
mov QWORD[rbp-32], 0
mov rbx, QWORD[rbp-16]
test rbx, rbx
setz bl
mov r10, QWORD[rbp-8]
test r10, r10
setz r10b
or bl, r10b
mov rax, rbx
and al, 1
jz .L0x5a
mov rax, 0
jmp ___int___SSCANF_pchar.char.void..__return
jmp .L0x5b
.L0x5a:
.L0x5b:
jmp .L0x5d
.L0x5c:
mov rbx, QWORD[rbp-8]
and r10, 0xff
mov r10b, byte[rbx]
mov rbx, 37
cmp r10b, bl
setne r10b
mov rax, r10
and al, 1
jz .L0x5f
inc qword[rbp-8]
inc qword[rbp-16]
jmp .L0x60
.L0x5f:
inc qword[rbp-8]
mov rbx, QWORD[rbp-8]
and r10, 0xff
mov r10b, byte[rbx]
mov QWORD[rbp-40], r10
mov r10, 105
mov rbx, QWORD[rbp-40]
cmp bl, r10b
sete bl
mov rax, rbx
and al, 1
jz .L0x61
mov r11, 1
mov r12, r11
mov r10, r12
mov dl, r10b
mov r11, QWORD[rbp-32]
mov r10, QWORD[rbp-24]
lea r10, [r10+r11*8]
mov r10, qword[r10]
mov rsi, r10
mov r10, QWORD[rbp-16]
mov rdi, r10
xor rax, rax
call _int_scanint_pchar.long.bool
mov QWORD[rbp-48], rax
mov rbx, QWORD[rbp-48]
mov r10, QWORD[rbp-16]
add r10, rbx
mov QWORD[rbp-16], r10
inc qword[rbp-8]
jmp .L0x62
.L0x61:
mov r10, 117
mov rbx, QWORD[rbp-40]
cmp bl, r10b
sete bl
mov rax, rbx
and al, 1
jz .L0x63
mov r11, 0
mov r12, r11
mov r10, r12
mov dl, r10b
mov r11, QWORD[rbp-32]
mov r10, QWORD[rbp-24]
lea r10, [r10+r11*8]
mov r10, qword[r10]
mov rsi, r10
mov r10, QWORD[rbp-16]
mov rdi, r10
xor rax, rax
call _int_scanint_pchar.long.bool
mov QWORD[rbp-48], rax
mov rbx, QWORD[rbp-48]
mov r10, QWORD[rbp-16]
add r10, rbx
mov QWORD[rbp-16], r10
inc qword[rbp-8]
jmp .L0x64
.L0x63:
mov r10, 99
mov rbx, QWORD[rbp-40]
cmp bl, r10b
sete bl
mov rax, rbx
and al, 1
jz .L0x65
mov r10, QWORD[rbp-32]
mov rbx, QWORD[rbp-24]
lea rbx, [rbx+r10*8]
mov rbx, qword[rbx]
mov QWORD[rbp-56], rbx
mov rbx, QWORD[rbp-56]
mov r10, rbx
mov rbx, QWORD[rbp-56]
mov r10, rbx
mov r11, QWORD[rbp-16]
and r12, 0xff
mov r12b, byte[r11]
mov rbx, r12
mov byte[r10], bl
inc qword[rbp-16]
inc qword[rbp-8]
jmp .L0x66
.L0x65:
mov r10, 115
mov rbx, QWORD[rbp-40]
cmp bl, r10b
sete bl
mov rax, rbx
and al, 1
jz .L0x67
inc qword[rbp-8]
mov r11, QWORD[rbp-32]
mov r10, QWORD[rbp-24]
lea r10, [r10+r11*8]
mov r10, qword[r10]
mov rdx, r10
mov r11, QWORD[rbp-8]
and r12, 0xff
mov r12b, byte[r11]
mov r10, r12
mov sil, r10b
mov r10, QWORD[rbp-16]
mov rdi, r10
xor rax, rax
call _int_scanstr_pchar.charchar.
mov QWORD[rbp-48], rax
mov rbx, QWORD[rbp-48]
mov r10, QWORD[rbp-16]
add r10, rbx
mov QWORD[rbp-16], r10
jmp .L0x68
.L0x67:
mov r10, 102
mov rbx, QWORD[rbp-40]
cmp bl, r10b
sete bl
mov r11, 100
mov r10, QWORD[rbp-40]
cmp r10b, r11b
sete r10b
or bl, r10b
mov rax, rbx
and al, 1
jz .L0x69
mov r11, QWORD[rbp-32]
mov r10, QWORD[rbp-24]
lea r10, [r10+r11*8]
mov r10, qword[r10]
mov rdx, r10
xor r11, r11
mov r12, r11
mov r10, r12
mov sil, r10b
mov r10, QWORD[rbp-16]
mov rdi, r10
xor rax, rax
call _int_scansd_pchar.booldouble.
mov QWORD[rbp-48], rax
mov rbx, QWORD[rbp-48]
mov r10, QWORD[rbp-16]
add r10, rbx
mov QWORD[rbp-16], r10
inc qword[rbp-8]
jmp .L0x6a
.L0x69:
.L0x6a:
.L0x68:
.L0x66:
.L0x64:
.L0x62:
inc dword[rbp-32]
.L0x60:
.L0x5d:
mov rbx, QWORD[rbp-8]
and r10, 0xff
mov r10b, byte[rbx]
test r10b, r10b
setnz r10b
mov rax, r10
and al, 1
jnz .L0x5c
.L0x5e:
mov rbx, QWORD[rbp-32]
mov rax, rbx
jmp ___int___SSCANF_pchar.char.void..__return
___int___SSCANF_pchar.char.void..__return:
leave
ret
_int_getInt_pchar.:
push rbp
mov rbp, rsp
sub rsp, 64
mov [rbp-8], rdi
mov rbx, QWORD[rbp-8]
mov rdi, rbx
xor rax, rax
call _void_printf_pchar.
push rax
mov rdx, 40
xor rbx, rbx
mov sil, bl
lea rbx, [rbp-17]
mov rdi, rbx
xor rax, rax
call _void_memset_pvoid.ucharsize_t
push rax
mov rdx, 40
lea rbx, [rbp-17]
mov rsi, rbx
xor rbx, rbx
mov edi, ebx
xor rax, rax
call _bool_fgets_pfd_tchar.size_t
push rax
mov r10, 1
mov r11, r10
mov rbx, r11
mov sil, bl
lea rbx, [rbp-17]
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
mov rbx, QWORD[rbp-8]
mov rdi, rbx
xor rax, rax
call _void_printf_pchar.
push rax
mov rdx, 40
xor rbx, rbx
mov sil, bl
lea rbx, [rbp-17]
mov rdi, rbx
xor rax, rax
call _void_memset_pvoid.ucharsize_t
push rax
mov rdx, 40
lea rbx, [rbp-17]
mov rsi, rbx
xor rbx, rbx
mov edi, ebx
xor rax, rax
call _bool_fgets_pfd_tchar.size_t
push rax
mov r10, 1
mov r11, r10
mov rbx, r11
mov sil, bl
lea rbx, [rbp-17]
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
xor rbx, rbx
mov edi, ebx
xor rax, rax
call _bool_fgets_pfd_tchar.size_t
push rax
mov rax, QWORD[rbp-8]
jmp ___char_getchar_p__return
___char_getchar_p__return:
leave
ret
_int_getHex_pchar.:
push rbp
mov rbp, rsp
sub rsp, 16
mov [rbp-8], rdi
mov rax, 0
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
mov rbx, QWORD[rbp-24]
mov rdi, rbx
xor rax, rax
call _void_printf_pchar.
push rax
mov rdx, QWORD[rbp-16]
mov rbx, QWORD[rbp-8]
mov rsi, rbx
xor rbx, rbx
mov edi, ebx
xor rax, rax
call _bool_fgets_pfd_tchar.size_t
push rax
___void_getString_pchar.intchar.__return:
leave
ret
_char._getString_pchar.:
push rbp
mov rbp, rsp
sub rsp, 48
mov [rbp-8], rdi
mov QWORD[rbp-16], 80
mov rbx, QWORD[rbp-16]
mov rdi, rbx
xor rax, rax
call _void._malloc_psize_t
mov QWORD[rbp-24], rax
mov QWORD[rbp-40], 0
mov rsi, QWORD[rbp-8]
mov rbx, STRING_CONSTANT_5
mov rdi, rbx
xor rax, rax
call printf
push rax
mov rdx, 1
lea rbx, [rbp-32]
mov rsi, rbx
xor rbx, rbx
mov edi, ebx
xor rax, rax
call _bool_fgets_pfd_tchar.size_t
push rax
jmp .L0x6c
.L0x6b:
mov r10, QWORD[rbp-16]
mov rbx, QWORD[rbp-40]
cmp rbx, r10
sete bl
mov rax, rbx
and al, 1
jz .L0x6e
mov r10, QWORD[rbp-16]
sal r10, 1
mov QWORD[rbp-16], r10
mov r10, QWORD[rbp-16]
mov rsi, r10
mov rdi, QWORD[rbp-24]
xor rax, rax
call _void._realloc_pvoid.size_t
mov QWORD[rbp-24], rax
jmp .L0x6f
.L0x6e:
.L0x6f:
mov r10, QWORD[rbp-40]
mov rbx, QWORD[rbp-24]
lea rbx, [rbx+r10*1]
mov r10, QWORD[rbp-40]
mov rbx, QWORD[rbp-24]
lea rbx, [rbx+r10*1]
mov r10, QWORD[rbp-32]
mov byte[rbx], r10b
mov rdx, 1
lea rbx, [rbp-32]
mov rsi, rbx
xor rbx, rbx
mov edi, ebx
xor rax, rax
call _bool_fgets_pfd_tchar.size_t
push rax
mov r10, QWORD[rbp-40]
inc r10
mov QWORD[rbp-40], r10
.L0x6c:
mov r10, 10
mov rbx, QWORD[rbp-32]
cmp ebx, r10d
setne bl
mov rax, rbx
and al, 1
jnz .L0x6b
.L0x6d:
mov rbx, QWORD[rbp-40]
inc rbx
mov r10, QWORD[rbp-24]
lea r10, [r10+rbx*1]
mov rbx, QWORD[rbp-40]
inc rbx
mov r10, QWORD[rbp-24]
lea r10, [r10+rbx*1]
xor rbx, rbx
mov byte[r10], bl
mov rbx, QWORD[rbp-40]
mov rsi, rbx
mov rdi, QWORD[rbp-24]
xor rax, rax
call _void._realloc_pvoid.size_t
jmp ___char._getString_pchar.__return
___char._getString_pchar.__return:
leave
ret
_int_toInteger_pchar.bool:
push rbp
mov rbp, rsp
sub rsp, 48
mov [rbp-8], rdi
mov [rbp-16], rsi
jmp .L0x71
.L0x70:
mov rbx, 1
mov r10, QWORD[rbp-8]
add r10, rbx
mov QWORD[rbp-8], r10
.L0x71:
mov rbx, QWORD[rbp-8]
and r10, 0xff
mov r10b, byte[rbx]
mov rbx, 32
cmp r10b, bl
sete r10b
mov rax, r10
and al, 1
jnz .L0x70
.L0x72:
mov rbx, QWORD[rbp-8]
and r10, 0xff
mov r10b, byte[rbx]
mov QWORD[rbp-24], r10
mov QWORD[rbp-32], 0
mov rbx, 0
mov QWORD[rbp-40], rbx
mov r10, 45
mov rbx, QWORD[rbp-24]
cmp bl, r10b
sete bl
mov r10, QWORD[rbp-16]
and bl, r10b
mov rax, rbx
and al, 1
jz .L0x73
mov r10, 1
mov QWORD[rbp-40], r10
mov rbx, 1
mov r10, QWORD[rbp-8]
add r10, rbx
mov QWORD[rbp-8], r10
mov r10, QWORD[rbp-8]
and r11, 0xff
mov r11b, byte[r10]
mov QWORD[rbp-24], r11
jmp .L0x74
.L0x73:
.L0x74:
jmp .L0x76
.L0x75:
mov r11, 10
mov r10, QWORD[rbp-32]
imul r10d, r11d
mov r11, QWORD[rbp-24]
sub r11b, 48
mov r12, r11
add r10d, r12d
mov QWORD[rbp-32], r10
mov rbx, 1
mov r10, QWORD[rbp-8]
add r10, rbx
mov QWORD[rbp-8], r10
mov r10, QWORD[rbp-8]
and r11, 0xff
mov r11b, byte[r10]
mov QWORD[rbp-24], r11
.L0x76:
mov rbx, QWORD[rbp-24]
test bl, bl
setnz bl
mov r10, 10
mov r11, QWORD[rbp-24]
mov r12, r11
cmp r12d, r10d
setne r12b
and bl, r12b
mov r11, 32
mov r10, QWORD[rbp-24]
cmp r10b, r11b
setne r10b
and bl, r10b
mov rax, rbx
and al, 1
jnz .L0x75
.L0x77:
mov rbx, QWORD[rbp-40]
mov rax, rbx
and al, 1
jz .L0x78
mov r10, QWORD[rbp-32]
xor rbx, rbx
sub ebx, r10d
mov rax, rbx
jmp ___int_toInteger_pchar.bool__return
jmp .L0x79
.L0x78:
.L0x79:
mov rbx, QWORD[rbp-32]
mov rax, rbx
jmp ___int_toInteger_pchar.bool__return
___int_toInteger_pchar.bool__return:
leave
ret
_void_iVec3d_pVec3d.doubledoubledouble:
push rbp
mov rbp, rsp
sub rsp, 40
mov [rbp-8], rdi
movsd [rbp-16], xmm0
movsd [rbp-24], xmm1
movsd [rbp-32], xmm2
mov rbx, QWORD[rbp-8]
mov rbx, QWORD[rbp-8]
movsd xmm8, QWORD[rbp-16]
movsd xmm7, xmm8
movq qword[rbx], xmm7
mov rbx, QWORD[rbp-8]
lea rbx, [rbx+8]
mov rbx, QWORD[rbp-8]
lea rbx, [rbx+8]
movsd xmm8, QWORD[rbp-24]
movsd xmm7, xmm8
movq qword[rbx], xmm7
mov rbx, QWORD[rbp-8]
lea rbx, [rbx+16]
mov rbx, QWORD[rbp-8]
lea rbx, [rbx+16]
movsd xmm8, QWORD[rbp-32]
movsd xmm7, xmm8
movq qword[rbx], xmm7
___void_iVec3d_pVec3d.doubledoubledouble__return:
leave
ret
_void_v3dadd_pVec3d.Vec3d.:
push rbp
mov rbp, rsp
sub rsp, 24
mov [rbp-8], rdi
mov [rbp-16], rsi
mov rbx, 0
shl rbx, 3
add rbx, [rbp-8]
vmovdqu ymm0, [rbx]
mov r10, 0
shl r10, 3
add r10, [rbp-16]
vmovdqu ymm1, [r10]
vaddpd ymm0, ymm1, ymm0
mov rbx, 0
shl rbx, 3
add rbx, [rbp-8]
vmovdqu [rbx], ymm0
___void_v3dadd_pVec3d.Vec3d.__return:
leave
ret
_void_v3dsub_pVec3d.Vec3d.:
push rbp
mov rbp, rsp
sub rsp, 24
mov [rbp-8], rdi
mov [rbp-16], rsi
mov rbx, 0
shl rbx, 3
add rbx, [rbp-8]
vmovdqu ymm0, [rbx]
mov r10, 0
shl r10, 3
add r10, [rbp-16]
vmovdqu ymm1, [r10]
vsubpd ymm0, ymm1, ymm0
mov rbx, 0
shl rbx, 3
add rbx, [rbp-8]
vmovdqu [rbx], ymm0
___void_v3dsub_pVec3d.Vec3d.__return:
leave
ret
_void_v3dcross_pVec3d.Vec3d.:
push rbp
mov rbp, rsp
sub rsp, 24
mov [rbp-8], rdi
mov [rbp-16], rsi
mov rbx, 0
shl rbx, 3
add rbx, [rbp-8]
vmovdqu ymm0, [rbx]
mov r10, 0
shl r10, 3
add r10, [rbp-16]
vmovdqu ymm1, [r10]
vmulpd ymm0, ymm1, ymm0
mov rbx, 0
shl rbx, 3
add rbx, [rbp-8]
vmovdqu [rbx], ymm0
___void_v3dcross_pVec3d.Vec3d.__return:
leave
ret
main:
push rbp
mov rbp, rsp
sub rsp, 40
mov [rbp-8], rdi
mov [rbp-16], rsi
mov rdi, 100
xor rax, rax
call _void._mlc_psize_t
mov QWORD[rbp-24], rax
mov rbx, STRING_CONSTANT_6
mov rsi, rbx
mov rbx, QWORD[rbp-24]
mov rdi, rbx
xor rax, rax
call _int_strcpy_pchar.char.
push rax
mov rbx, QWORD[rbp-24]
mov rdi, rbx
xor rax, rax
call _void_printf_pchar.
push rax
mov rdi, QWORD[rbp-24]
xor rax, rax
call _void_fr_pvoid.
push rax
mov rdi, 100
xor rax, rax
call _void._mlc_psize_t
mov QWORD[rbp-32], rax
mov rbx, QWORD[rbp-32]
mov rdi, rbx
xor rax, rax
call _void_printf_pchar.
push rax
mov rax, 5
jmp __main__return
__main__return:
leave
ret
