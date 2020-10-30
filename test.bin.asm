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
global _long_divmod_plonglonglong.
global _int___sprintf_pchar.char.void.
global _int_sprintf_pchar.char.voidvoidvoidvoid
extern _ssize_t_read_pfd_tchar.size_t
extern _ssize_t_write_pfd_tchar.size_t
extern _fd_t_open_pchar.intmode_t
extern _int_close_pfd_t
extern _int_mkdir_pchar.mode_t
extern _int_rmdir_pchar.
extern _int_creat_pchar.mode_t
extern _int_chdir_pchar.
extern _int_lseek_pfd_tintint
global _void___printf_pchar.void.
global _void_printf_pchar.voidvoidvoidvoidvoid
extern print
extern print
extern print
extern print
global _void_printf_pchar.

section .data
FLT_CONSTANT_0: dq 0x0.0p+0
STRING_CONSTANT_0: db `0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ`, 0
STRING_CONSTANT_1: db `False`, 0
STRING_CONSTANT_2: db `True`, 0
STRING_CONSTANT_3: db `%s`, 0
STRING_CONSTANT_4: db `EMPTY`, 0
STRING_CONSTANT_5: db `%i\n`, 0
nullterm: DQ 0
INLINE_SYSCALL: DQ __inline__syscall
M_MINZERO_MEM: DQ 0
__format_numchars: DQ STRING_CONSTANT_0
rand_next: DQ 1
section .bss
align 16
__heap_padding__: resz 1
section .text
align 8
global CMAIN

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
;[ function void. malloc( [[size_t size @ 8]] ) ]

_void._malloc_psize_t:
push rbp
mov rbp, rsp
sub rsp, 16
;Load Parameter: [size_t size @ 8]
mov [rbp-8], rdi
ALIGN_STACK
    call malloc
    UNALIGN_STACK
___void._malloc_psize_t__return:
leave
ret
;[ function void. calloc( [[size_t size @ 8]] ) ]

_void._calloc_psize_t:
push rbp
mov rbp, rsp
sub rsp, 16
;Load Parameter: [size_t size @ 8]
mov [rbp-8], rdi
ALIGN_STACK
    call calloc
    UNALIGN_STACK
___void._calloc_psize_t__return:
leave
ret
;[ function void. realloc( [[void. og @ 8], [size_t newsize @ 16]] ) ]

_void._realloc_pvoid.size_t:
push rbp
mov rbp, rsp
sub rsp, 24
;Load Parameter: [void. og @ 8]
mov [rbp-8], rdi
;Load Parameter: [size_t newsize @ 16]
mov [rbp-16], rsi
ALIGN_STACK
    call realloc
    UNALIGN_STACK
___void._realloc_pvoid.size_t__return:
leave
ret
;[ function void free( [[void. ptr @ 8]] ) ]

_void_free_pvoid.:
push rbp
mov rbp, rsp
sub rsp, 16
;Load Parameter: [void. ptr @ 8]
mov [rbp-8], rdi
ALIGN_STACK
    call free
    UNALIGN_STACK
___void_free_pvoid.__return:
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
jmp _LFORCMP_0x1
_LFORTOP_0x0:
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
_LFORUPDATE_0x2:
;[[ id : i]]
;[[ id : i]]
;[[ id : i], [ + : +], [ int : 4]]
mov r10d, dword[rbp-48]
add r10d, 4
mov dword[rbp-48], r10d
_LFORCMP_0x1:
;[[ id : i], [ < : <], [ id : avxcount]]
mov r10d, dword[rbp-48]
mov rbx, qword[rbp-40]
mov r11, r10
cmp r11, rbx
setl r11b
mov al, r11b
and al, 1
jnz _LFORTOP_0x0
_LFOREND_0x3:
;[[ id : offset], [ != : !=], [ int : 0]]
mov ebx, dword[rbp-32]
test ebx, ebx
setnz bl
mov al, bl
and al, 1
jz _LIFPOST_0x4
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
jmp _LIFELSE_0x5
_LIFPOST_0x4:
_LIFELSE_0x5:
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
jz _LIFPOST_0x6
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
jmp _LIFELSE_0x7
_LIFPOST_0x6:
_LIFELSE_0x7:
;[[ int : 64]]
mov edx, 64
;[[ int : 0]]
xor esi, esi
;[[ & : &], [ id : tmpbuf]]
lea rbx, [rbp-112]
mov rdi, rbx
xor rax, rax
call _void_memset_pvoid.ucharsize_t
push rax
;[[ fn(x) : [ function void memset( [[void. dest @ 8], [uchar value @ 16], [size_t bytes @ 24]] ) ] ]]
;[[ int : 1]]
mov dword[rbp-120], 1
jmp _LWHILECMP_0x9
_LWHILESTART_0x8:
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
;[[ id : __format_numchars], [ [ : [], [ id : mod], [ ] : ]]]
mov r12b, byte[rbp-128]
mov r11, [__format_numchars]
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
_LWHILECMP_0x9:
;[[ id : val], [ != : !=], [ int : 0]]
mov rbx, qword[rbp-8]
test rbx, rbx
setnz bl
mov al, bl
and al, 1
jnz _LWHILESTART_0x8
_LWHILEEND_0xa:
;[[ id : len]]
mov ebx, dword[rbp-120]
mov dword[rbp-136], ebx
jmp _LFORCMP_0xc
_LFORTOP_0xb:
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
_LFORUPDATE_0xd:
;[[ id : i], [ -- : --]]
dec dword[rbp-136]
_LFORCMP_0xc:
;[[ id : i], [ >= : >=], [ int : 0]]
xor r10d, r10d
mov ebx, dword[rbp-136]
cmp ebx, r10d
setge bl
mov al, bl
and al, 1
jnz _LFORTOP_0xb
_LFOREND_0xe:
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
;[[ int : 1]]
mov edx, 1
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
;[[ int : 0]]
xor edx, edx
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
;[[ id : l], [ - : -], [ int : 1]]
mov rbx, qword[rbp-40]
dec rbx
mov rax, rbx
jmp ___long_toStr_pdoublechar.long__return
___long_toStr_pdoublechar.long__return:
leave
ret
;[ function int __sprintf( [[char. str @ 8], [char. fmt @ 16], [void. args @ 24]] ) ]

_int___sprintf_pchar.char.void.:
push rbp
mov rbp, rsp
sub rsp, 176
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
jz _LIFPOST_0xf
;[[ int : 0]]
xor eax, eax
jmp ___int___sprintf_pchar.char.void.__return
jmp _LIFELSE_0x10
_LIFPOST_0xf:
_LIFELSE_0x10:
jmp _LWHILECMP_0x12
_LWHILESTART_0x11:
;[[ @ : @], [ id : fmt], [ != : !=], [ char : 37]]
mov rbx, qword[rbp-16]
and r10, 0xff
mov r10b, byte[rbx]
mov bl, 37
cmp r10b, bl
setne r10b
mov al, r10b
and al, 1
jz _LIFPOST_0x14
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
jmp _LIFELSE_0x15
_LIFPOST_0x14:
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
;[[ id : c], [ == : ==], [ char : 105]]
mov r10b, 105
mov bl, byte[rbp-48]
cmp bl, r10b
sete bl
mov al, bl
and al, 1
jz _LIFPOST_0x16
;[[ ( : (], [ id : args], [ [ : [], [ id : argc], [ ] : ]], [ ) : )]]
mov r10d, dword[rbp-32]
mov rbx, qword[rbp-24]
and r10, 0xffffffff
lea rbx, [rbx+r10*8]
mov rbx, qword[rbx]
mov qword[rbp-56], rbx
;[[ int : 10]]
mov ecx, 10
;[[ int : 1]]
mov edx, 1
;[[ id : str]]
mov rbx, qword[rbp-8]
mov rsi, rbx
;[[ id : num]]
mov rbx, qword[rbp-56]
mov rdi, rbx
xor rax, rax
call _long_toStr_plongchar.boolshort
;[[ fn(x) : [ function long toStr( [[long val @ 8], [char. buffer @ 16], [bool signed @ 24], [short base @ 32]] ) ] ]]
mov qword[rbp-64], rax
;[[ id : str]]
;[[ id : str]]
;[[ id : size], [ - : -], [ int : 1]]
mov r10, qword[rbp-64]
dec r10
mov rbx, r10
mov r10, qword[rbp-8]
add r10, rbx
mov qword[rbp-8], r10
jmp _LIFELSE_0x17
_LIFPOST_0x16:
;[[ id : c], [ == : ==], [ char : 99]]
mov r10b, 99
mov bl, byte[rbp-48]
cmp bl, r10b
sete bl
mov al, bl
and al, 1
jz _LIFPOST_0x18
;[[ $ : char], [ id : args], [ [ : [], [ id : argc], [ ] : ]]]
mov r10d, dword[rbp-32]
mov rbx, qword[rbp-24]
and r10, 0xffffffff
lea rbx, [rbx+r10*8]
mov rbx, qword[rbx]
mov r10, rbx
and r11b, 0xff
mov byte[rbp-72], r10b
;[[ @ : @], [ id : str]]
mov rbx, qword[rbp-8]
mov r10, rbx
;[[ @ : @], [ id : str]]
mov rbx, qword[rbp-8]
mov r10, rbx
;[[ id : cf]]
mov r11b, byte[rbp-72]
mov byte[r10], r11b
jmp _LIFELSE_0x19
_LIFPOST_0x18:
;[[ id : c], [ == : ==], [ char : 120]]
mov r10b, 120
mov bl, byte[rbp-48]
cmp bl, r10b
sete bl
mov al, bl
and al, 1
jz _LIFPOST_0x1a
;[[ ( : (], [ id : args], [ [ : [], [ id : argc], [ ] : ]], [ ) : )]]
mov r10d, dword[rbp-32]
mov rbx, qword[rbp-24]
and r10, 0xffffffff
lea rbx, [rbx+r10*8]
mov rbx, qword[rbx]
mov qword[rbp-80], rbx
;[[ int : 16]]
mov ecx, 16
;[[ int : 0]]
xor edx, edx
;[[ id : str]]
mov rbx, qword[rbp-8]
mov rsi, rbx
;[[ id : numx]]
mov rbx, qword[rbp-80]
mov rdi, rbx
xor rax, rax
call _long_toStr_plongchar.boolshort
;[[ fn(x) : [ function long toStr( [[long val @ 8], [char. buffer @ 16], [bool signed @ 24], [short base @ 32]] ) ] ]]
mov qword[rbp-88], rax
;[[ id : str]]
;[[ id : str]]
;[[ id : sx], [ - : -], [ int : 1]]
mov r10, qword[rbp-88]
dec r10
mov rbx, r10
mov r10, qword[rbp-8]
add r10, rbx
mov qword[rbp-8], r10
jmp _LIFELSE_0x1b
_LIFPOST_0x1a:
;[[ id : c], [ == : ==], [ char : 117]]
mov r10b, 117
mov bl, byte[rbp-48]
cmp bl, r10b
sete bl
mov al, bl
and al, 1
jz _LIFPOST_0x1c
;[[ ( : (], [ id : args], [ [ : [], [ id : argc], [ ] : ]], [ ) : )]]
mov r10d, dword[rbp-32]
mov rbx, qword[rbp-24]
and r10, 0xffffffff
lea rbx, [rbx+r10*8]
mov rbx, qword[rbx]
mov qword[rbp-96], rbx
;[[ int : 10]]
mov ecx, 10
;[[ int : 0]]
xor edx, edx
;[[ id : str]]
mov rbx, qword[rbp-8]
mov rsi, rbx
;[[ id : unum]]
mov rbx, qword[rbp-96]
mov rdi, rbx
xor rax, rax
call _long_toStr_plongchar.boolshort
;[[ fn(x) : [ function long toStr( [[long val @ 8], [char. buffer @ 16], [bool signed @ 24], [short base @ 32]] ) ] ]]
mov dword[rbp-104], eax
;[[ id : str]]
;[[ id : str]]
;[[ id : usize], [ - : -], [ int : 1]]
mov r10d, dword[rbp-104]
dec r10d
mov rbx, r10
mov r10, qword[rbp-8]
add r10, rbx
mov qword[rbp-8], r10
jmp _LIFELSE_0x1d
_LIFPOST_0x1c:
;[[ id : c], [ == : ==], [ char : 115]]
mov r10b, 115
mov bl, byte[rbp-48]
cmp bl, r10b
sete bl
mov al, bl
and al, 1
jz _LIFPOST_0x1e
;[[ id : args], [ [ : [], [ id : argc], [ ] : ]]]
mov r10d, dword[rbp-32]
mov rbx, qword[rbp-24]
and r10, 0xffffffff
lea rbx, [rbx+r10*8]
mov rbx, qword[rbx]
mov rsi, rbx
;[[ id : str]]
mov rbx, qword[rbp-8]
mov rdi, rbx
xor rax, rax
call _int_strcpy_pchar.char.
;[[ fn(x) : [ function int strcpy( [[char. dest @ 8], [char. source @ 16]] ) ] ]]
mov dword[rbp-112], eax
;[[ id : str]]
;[[ id : str]]
;[[ id : ssize], [ - : -], [ int : 1]]
mov r10d, dword[rbp-112]
dec r10d
mov rbx, r10
mov r10, qword[rbp-8]
add r10, rbx
mov qword[rbp-8], r10
jmp _LIFELSE_0x1f
_LIFPOST_0x1e:
;[[ id : c], [ == : ==], [ char : 98]]
mov r10b, 98
mov bl, byte[rbp-48]
cmp bl, r10b
sete bl
mov al, bl
and al, 1
jz _LIFPOST_0x20
;[[ id : args], [ [ : [], [ id : argc], [ ] : ]]]
mov r10d, dword[rbp-32]
mov rbx, qword[rbp-24]
and r10, 0xffffffff
lea rbx, [rbx+r10*8]
mov rbx, qword[rbx]
mov byte[rbp-120], bl
;[[ id : STRING_CONSTANT_1]]
mov qword[rbp-128], STRING_CONSTANT_1
;[[ id : b]]
mov bl, byte[rbp-120]
mov al, bl
and al, 1
jz _LIFPOST_0x22
;[[ id : boolean_string]]
;[[ id : boolean_string]]
;[[ id : STRING_CONSTANT_2]]
mov qword[rbp-128], STRING_CONSTANT_2
jmp _LIFELSE_0x23
_LIFPOST_0x22:
_LIFELSE_0x23:
;[[ id : boolean_string]]
mov rbx, qword[rbp-128]
mov rsi, rbx
;[[ id : str]]
mov rbx, qword[rbp-8]
mov rdi, rbx
xor rax, rax
call _int_strcpy_pchar.char.
;[[ fn(x) : [ function int strcpy( [[char. dest @ 8], [char. source @ 16]] ) ] ]]
mov dword[rbp-136], eax
;[[ id : str]]
;[[ id : str]]
;[[ id : bsize]]
mov ebx, dword[rbp-136]
mov r10, qword[rbp-8]
add r10, rbx
mov qword[rbp-8], r10
jmp _LIFELSE_0x21
_LIFPOST_0x20:
;[[ id : c], [ == : ==], [ char : 100]]
mov r10b, 100
mov bl, byte[rbp-48]
cmp bl, r10b
sete bl
mov al, bl
and al, 1
jz _LIFPOST_0x24
;[[ id : args], [ [ : [], [ id : argc], [ ] : ]]]
mov r10d, dword[rbp-32]
mov rbx, qword[rbp-24]
and r10, 0xffffffff
lea rbx, [rbx+r10*8]
mov rbx, qword[rbx]
movq xmm7, rbx
movsd qword[rbp-144], xmm7
;[[ int : 100000000000000]]
mov esi, 100000000000000
;[[ id : str]]
mov rbx, qword[rbp-8]
mov rdi, rbx
;[[ id : d]]
movsd xmm7, qword[rbp-144]
movsd xmm0, xmm7
mov rax, 1
call _long_toStr_pdoublechar.long
;[[ fn(x) : [ function long toStr( [[double val @ 8], [char. buffer @ 16], [long multiplier @ 24]] ) ] ]]
mov dword[rbp-152], eax
;[[ id : str]]
;[[ id : str]]
;[[ id : dsize], [ - : -], [ int : 1]]
mov r10d, dword[rbp-152]
dec r10d
mov rbx, r10
mov r10, qword[rbp-8]
add r10, rbx
mov qword[rbp-8], r10
jmp _LIFELSE_0x25
_LIFPOST_0x24:
;[[ id : c], [ == : ==], [ char : 102]]
mov r10b, 102
mov bl, byte[rbp-48]
cmp bl, r10b
sete bl
mov al, bl
and al, 1
jz _LIFPOST_0x26
;[[ id : args], [ [ : [], [ id : argc], [ ] : ]]]
mov r10d, dword[rbp-32]
mov rbx, qword[rbp-24]
and r10, 0xffffffff
lea rbx, [rbx+r10*8]
mov rbx, qword[rbx]
movq xmm7, rbx
movsd qword[rbp-160], xmm7
;[[ int : 10000000]]
mov esi, 10000000
;[[ id : str]]
mov rbx, qword[rbp-8]
mov rdi, rbx
;[[ id : f]]
movsd xmm7, qword[rbp-160]
movsd xmm0, xmm7
mov rax, 1
call _long_toStr_pdoublechar.long
;[[ fn(x) : [ function long toStr( [[double val @ 8], [char. buffer @ 16], [long multiplier @ 24]] ) ] ]]
mov dword[rbp-168], eax
;[[ id : str]]
;[[ id : str]]
;[[ id : fsize], [ - : -], [ int : 1]]
mov r10d, dword[rbp-168]
dec r10d
mov rbx, r10
mov r10, qword[rbp-8]
add r10, rbx
mov qword[rbp-8], r10
jmp _LIFELSE_0x27
_LIFPOST_0x26:
_LIFELSE_0x27:
_LIFELSE_0x25:
_LIFELSE_0x21:
_LIFELSE_0x1f:
_LIFELSE_0x1d:
_LIFELSE_0x1b:
_LIFELSE_0x19:
_LIFELSE_0x17:
;[[ id : argc]]
;[[ id : argc]]
;[[ int : 1]]
mov ebx, 1
mov r11d, dword[rbp-32]
add r11d, ebx
mov dword[rbp-32], r11d
_LIFELSE_0x15:
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
_LWHILECMP_0x12:
;[[ @ : @], [ id : fmt], [ != : !=], [ int : 0]]
mov rbx, qword[rbp-16]
and r10, 0xff
mov r10b, byte[rbx]
test r10b, r10b
setnz r10b
mov al, r10b
and al, 1
jnz _LWHILESTART_0x11
_LWHILEEND_0x13:
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
call _void._malloc_psize_t
;[[ fn(x) : [ function void. malloc( [[size_t size @ 8]] ) ] ]]
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
call _void_free_pvoid.
push rax
;[[ fn(x) : [ function void free( [[void. ptr @ 8]] ) ] ]]
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
sub rsp, 100040
;Load Parameter: [char. fmt @ 8]
mov [rbp-8], rdi
;Load Parameter: [void. args @ 16]
mov [rbp-16], rsi
;[[ id : normform], [ [ : [], [ int : 100000], [ ] : ]]]
mov r10d, 100000
lea rbx, [rbp-100024] 
and r10, 0xffffffff
lea rbx, [rbx+r10*1]
;[[ id : normform], [ [ : [], [ int : 100000], [ ] : ]]]
mov r10d, 100000
lea rbx, [rbp-100024] 
and r10, 0xffffffff
lea rbx, [rbx+r10*1]
;[[ int : 0]]
xor r10d, r10d
mov byte[rbx], r10b
;[[ id : args]]
mov rbx, qword[rbp-16]
mov rdx, rbx
;[[ id : fmt]]
mov rbx, qword[rbp-8]
mov rsi, rbx
;[[ & : &], [ id : normform]]
lea rbx, [rbp-100024]
mov rdi, rbx
xor rax, rax
call _int___sprintf_pchar.char.void.
;[[ fn(x) : [ function int __sprintf( [[char. str @ 8], [char. fmt @ 16], [void. args @ 24]] ) ] ]]
mov dword[rbp-100032], eax
;[[ id : l]]
mov edx, dword[rbp-100032]
;[[ & : &], [ id : normform]]
lea rbx, [rbp-100024]
mov rsi, rbx
;[[ int : 1]]
mov edi, 1
xor rax, rax
call _ssize_t_write_pfd_tchar.size_t
push rax
;[[ fn(x) : [ function ssize_t write( [[fd_t fd @ 0], [char. buf @ 0], [size_t count @ 0]] ) ] ]]
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
call _void._malloc_psize_t
;[[ fn(x) : [ function void. malloc( [[size_t size @ 8]] ) ] ]]
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
push rax
;[[ fn(x) : [ function void __printf( [[char. fmt @ 8], [void. args @ 16]] ) ] ]]
;[[ id : args]]
mov rbx, qword[rbp-56]
mov rdi, rbx
xor rax, rax
call _void_free_pvoid.
push rax
;[[ fn(x) : [ function void free( [[void. ptr @ 8]] ) ] ]]
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
xor rax, rax
call _int_fputs_pfd_tchar.
push rax
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
sub rsp, 80
;Load Parameter: [char. cp @ 8]
mov [rbp-8], rdi
;Load Parameter: [in_addr. addr @ 16]
mov [rbp-16], rsi
;[[ int : 10]]
mov dword[rbp-32], 10
;[[ int : 4]]
mov edx, 4
;[[ int : 0]]
xor esi, esi
;[[ & : &], [ id : parts]]
lea rbx, [rbp-64]
mov rdi, rbx
xor rax, rax
call _void_memset_pvoid.ucharsize_t
push rax
;[[ fn(x) : [ function void memset( [[void. dest @ 8], [uchar value @ 16], [size_t bytes @ 24]] ) ] ]]
;[[ & : &], [ id : parts]]
lea rbx, [rbp-64]
mov qword[rbp-72], rbx
;[[ id : c]]
;[[ id : c]]
;[[ @ : @], [ id : cp]]
mov r10, qword[rbp-8]
and r11, 0xff
mov r11b, byte[r10]
mov byte[rbp-40], r11b
jmp _LWHILECMP_0x29
_LWHILESTART_0x28:
;[[ id : val]]
;[[ id : val]]
;[[ int : 0]]
xor ebx, ebx
mov word[rbp-24], bx
jmp _LWHILECMP_0x2c
_LWHILESTART_0x2b:
;[[ id : c]]
mov bl, byte[rbp-40]
mov dil, bl
xor rax, rax
call _bool_isdigit_pchar
;[[ fn(x) : [ function bool isdigit( [[char c @ 8]] ) ] ]]
and al, 1
jz _LIFPOST_0x2e
;[[ id : val]]
;[[ id : val]]
;[[ ( : (], [ id : val], [ * : *], [ id : base], [ ) : )], [ + : +], [ ( : (], [ id : c], [ - : -], [ char : 48], [ ) : )]]
mov r11w, word[rbp-24]
mov r10d, dword[rbp-32]
and r12d, 0xffffffff
mov r12d, r11d
imul r12d, r10d
mov r10b, byte[rbp-40]
sub r10b, 48
and r11d, 0xffffffff
mov r11d, r10d
add r12d, r11d
mov word[rbp-24], r12w
;[[ id : cp]]
;[[ id : cp]]
;[[ int : 1]]
mov ebx, 1
mov r10, qword[rbp-8]
add r10, rbx
mov qword[rbp-8], r10
;[[ id : c]]
;[[ id : c]]
;[[ @ : @], [ id : cp]]
mov r10, qword[rbp-8]
and r11, 0xff
mov r11b, byte[r10]
mov byte[rbp-40], r11b
jmp _LIFELSE_0x2f
_LIFPOST_0x2e:
jmp _LWHILEEND_0x2d
_LIFELSE_0x2f:
_LWHILECMP_0x2c:
;[[ $ : bool], [ int : 1]]
mov ebx, 1
and r10b, 0xff
mov r10b, bl
mov al, r10b
and al, 1
jnz _LWHILESTART_0x2b
_LWHILEEND_0x2d:
;[[ id : c], [ == : ==], [ char : 46]]
mov r10b, 46
mov bl, byte[rbp-40]
cmp bl, r10b
sete bl
mov al, bl
and al, 1
jz _LIFPOST_0x30
;[[ id : pp], [ > : >], [ ( : (], [ id : parts], [ + : +], [ int : 4], [ * : *], [ id : int], [ ) : )]]
lea rbx, [rbp-64] 
add ebx, 16
mov r10, qword[rbp-72]
and r11d, 0xffffffff
mov r11d, r10d
cmp r11d, ebx
seta r11b
mov al, r11b
and al, 1
jz _LIFPOST_0x32
;[[ int : 0]]
xor eax, eax
jmp ___int_inet_aton_pchar.in_addr.__return
jmp _LIFELSE_0x33
_LIFPOST_0x32:
_LIFELSE_0x33:
;[[ @ : @], [ id : pp]]
mov rbx, qword[rbp-72]
mov r10, rbx
;[[ @ : @], [ id : pp]]
mov rbx, qword[rbp-72]
mov r10, rbx
;[[ id : val]]
mov bx, word[rbp-24]
mov dword[r10], ebx
;[[ id : pp]]
;[[ id : pp]]
;[[ id : int]]
mov ebx, 4
mov r10, qword[rbp-72]
add r10, rbx
mov qword[rbp-72], r10
;[[ id : cp]]
;[[ id : cp]]
;[[ int : 1]]
mov ebx, 1
mov r10, qword[rbp-8]
add r10, rbx
mov qword[rbp-8], r10
;[[ id : c]]
;[[ id : c]]
;[[ @ : @], [ id : cp]]
mov r10, qword[rbp-8]
and r11, 0xff
mov r11b, byte[r10]
mov byte[rbp-40], r11b
jmp _LIFELSE_0x31
_LIFPOST_0x30:
jmp _LWHILEEND_0x2a
_LIFELSE_0x31:
_LWHILECMP_0x29:
;[[ $ : bool], [ int : 1]]
mov ebx, 1
and r10b, 0xff
mov r10b, bl
mov al, r10b
and al, 1
jnz _LWHILESTART_0x28
_LWHILEEND_0x2a:
;[[ @ : @], [ id : pp]]
mov rbx, qword[rbp-72]
mov r10, rbx
;[[ @ : @], [ id : pp]]
mov rbx, qword[rbp-72]
mov r10, rbx
;[[ id : val]]
mov bx, word[rbp-24]
mov dword[r10], ebx
;[[ id : c], [ != : !=], [ int : 0], [ && : &&], [ id : c], [ != : !=], [ char : 32]]
mov bl, byte[rbp-40]
test bl, bl
setnz bl
mov r11b, 32
mov r10b, byte[rbp-40]
cmp r10b, r11b
setne r10b
and bl, r10b
mov al, bl
and al, 1
jz _LIFPOST_0x34
;[[ int : 0]]
xor eax, eax
jmp ___int_inet_aton_pchar.in_addr.__return
jmp _LIFELSE_0x35
_LIFPOST_0x34:
_LIFELSE_0x35:
;[[ id : val]]
;[[ id : val]]
;[[ id : val], [ || : ||], [ ( : (], [ ( : (], [ id : parts], [ [ : [], [ int : 0], [ ] : ]], [ << : <<], [ int : 24], [ ) : )], [ || : ||], [ ( : (], [ id : parts], [ [ : [], [ int : 1], [ ] : ]], [ << : <<], [ int : 16], [ ) : )], [ || : ||], [ ( : (], [ id : parts], [ [ : [], [ int : 2], [ ] : ]], [ << : <<], [ int : 8], [ ) : )], [ ) : )]]
lea r10, [rbp-64] 
mov r10d, dword[r10d]
and r10d, 0xffffffff
shl r10d, 24
mov r11w, word[rbp-24]
and r12d, 0xffffffff
mov r12d, r11d
or r12d, r10d
mov r11d, 1
lea r10, [rbp-64] 
and r11, 0xffffffff
lea r10, [r10+r11*4]
mov r10d, dword[r10]
and r10, 0xffffffff
shl r10d, 16
or r12d, r10d
mov r11d, 2
lea r10, [rbp-64] 
and r11, 0xffffffff
lea r10, [r10+r11*4]
mov r10d, dword[r10]
and r10, 0xffffffff
shl r10d, 8
or r12d, r10d
mov word[rbp-24], r12w
;[[ @ : @], [ id : addr]]
mov rbx, qword[rbp-16]
mov r10, rbx
;[[ @ : @], [ id : addr]]
mov rbx, qword[rbp-16]
mov r10, rbx
;[[ id : val]]
mov r11w, word[rbp-24]
mov word[r10], r11w
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
jz _LIFPOST_0x36
;[[ id : f]]
;[[ id : f]]
;[[ int : 0]]
xor ebx, ebx
mov dword[rbp-40], ebx
jmp _LIFELSE_0x37
_LIFPOST_0x36:
;[[ id : modehash], [ == : ==], [ int : 119]]
mov r10d, 119
mov ebx, dword[rbp-24]
cmp ebx, r10d
sete bl
mov al, bl
and al, 1
jz _LIFPOST_0x38
;[[ id : f]]
;[[ id : f]]
;[[ int : 1]]
mov ebx, 1
mov dword[rbp-40], ebx
jmp _LIFELSE_0x39
_LIFPOST_0x38:
;[[ id : modehash], [ == : ==], [ int : 97]]
mov r10d, 97
mov ebx, dword[rbp-24]
cmp ebx, r10d
sete bl
mov al, bl
and al, 1
jz _LIFPOST_0x3a
;[[ id : f]]
;[[ id : f]]
;[[ int : 1], [ || : ||], [ int : 8]]
mov ebx, 1
mov dword[rbp-40], ebx
jmp _LIFELSE_0x3b
_LIFPOST_0x3a:
;[[ id : modehash], [ == : ==], [ int : 157]]
mov r10d, 157
mov ebx, dword[rbp-24]
cmp ebx, r10d
sete bl
mov al, bl
and al, 1
jz _LIFPOST_0x3c
;[[ id : f]]
;[[ id : f]]
;[[ int : 2]]
mov ebx, 2
mov dword[rbp-40], ebx
jmp _LIFELSE_0x3d
_LIFPOST_0x3c:
;[[ id : modehash], [ == : ==], [ int : 162]]
mov r10d, 162
mov ebx, dword[rbp-24]
cmp ebx, r10d
sete bl
mov al, bl
and al, 1
jz _LIFPOST_0x3e
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
jmp _LIFELSE_0x3f
_LIFPOST_0x3e:
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
_LIFELSE_0x3f:
_LIFELSE_0x3d:
_LIFELSE_0x3b:
_LIFELSE_0x39:
_LIFELSE_0x37:
;[[ id : m]]
mov ebx, dword[rbp-32]
mov edx, ebx
;[[ id : f]]
mov ebx, dword[rbp-40]
mov esi, ebx
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
jz _LIFPOST_0x40
;[[ int : 2]]
mov edx, 2
;[[ int : 0]]
xor esi, esi
;[[ id : out]]
mov ebx, dword[rbp-48]
mov edi, ebx
xor rax, rax
call _int_lseek_pfd_tintint
push rax
;[[ fn(x) : [ function int lseek( [[fd_t fd @ 0], [int offset @ 0], [int whence @ 0]] ) ] ]]
jmp _LIFELSE_0x41
_LIFPOST_0x40:
_LIFELSE_0x41:
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
xor rax, rax
call _ssize_t_write_pfd_tchar.size_t
;[[ fn(x) : [ function ssize_t write( [[fd_t fd @ 0], [char. buf @ 0], [size_t count @ 0]] ) ] ]]
mov dword[rbp-32], eax
;[[ int : 1]]
mov edx, 1
;[[ id : l]]
mov ebx, dword[rbp-24]
mov esi, ebx
;[[ id : fd]]
mov ebx, dword[rbp-8]
mov edi, ebx
xor rax, rax
call _int_lseek_pfd_tintint
push rax
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
;[[ id : amt]]
mov rsi, qword[rbp-24]
;[[ id : fd]]
mov ebx, dword[rbp-8]
mov edi, ebx
xor rax, rax
call _int_lseek_pfd_tintint
push rax
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
;[[ int : 0]]
xor esi, esi
;[[ id : fd]]
mov ebx, dword[rbp-8]
mov edi, ebx
xor rax, rax
call _int_lseek_pfd_tintint
;[[ fn(x) : [ function int lseek( [[fd_t fd @ 0], [int offset @ 0], [int whence @ 0]] ) ] ]]
mov dword[rbp-16], eax
;[[ int : 2]]
mov edx, 2
;[[ int : 0], [ - : -], [ id : fsize]]
mov r10d, dword[rbp-16]
xor ebx, ebx
sub ebx, r10d
mov esi, ebx
;[[ id : fd]]
mov ebx, dword[rbp-8]
mov edi, ebx
xor rax, rax
call _int_lseek_pfd_tintint
push rax
;[[ fn(x) : [ function int lseek( [[fd_t fd @ 0], [int offset @ 0], [int whence @ 0]] ) ] ]]
;[[ id : fsize]]
mov edi, dword[rbp-16]
xor rax, rax
call _void._malloc_psize_t
;[[ fn(x) : [ function void. malloc( [[size_t size @ 8]] ) ] ]]
mov qword[rbp-24], rax
;[[ id : fsize]]
mov edx, dword[rbp-16]
;[[ id : buffer]]
mov rbx, qword[rbp-24]
mov rsi, rbx
;[[ id : fd]]
mov ebx, dword[rbp-8]
mov edi, ebx
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
jz _LIFPOST_0x42
;[[ int : 0]]
xor eax, eax
jmp ___void._floads_pfd_t__return
jmp _LIFELSE_0x43
_LIFPOST_0x42:
_LIFELSE_0x43:
;[[ id : buffer]]
mov rax, qword[rbp-24]
jmp ___void._floads_pfd_t__return
___void._floads_pfd_t__return:
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
jz _LIFPOST_0x44
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
jmp _LIFELSE_0x45
_LIFPOST_0x44:
_LIFELSE_0x45:
jmp _LWHILECMP_0x47
_LWHILESTART_0x46:
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
_LWHILECMP_0x47:
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
jnz _LWHILESTART_0x46
_LWHILEEND_0x48:
;[[ ! : !], [ id : negative]]
mov bl, byte[rbp-48]
cmp bl, 0
sete bl
mov al, bl
and al, 1
jz _LIFPOST_0x49
;[[ @ : @], [ id : dest]]
mov rbx, qword[rbp-16]
mov r10, rbx
;[[ @ : @], [ id : dest]]
mov rbx, qword[rbp-16]
mov r10, rbx
;[[ id : val]]
mov r11, qword[rbp-32]
mov qword[r10], r11
jmp _LIFELSE_0x4a
_LIFPOST_0x49:
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
_LIFELSE_0x4a:
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
jmp _LWHILECMP_0x4c
_LWHILESTART_0x4b:
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
_LWHILECMP_0x4c:
;[[ @ : @], [ id : str], [ != : !=], [ id : delim]]
mov rbx, qword[rbp-8]
and r10, 0xff
mov r10b, byte[rbx]
mov bl, byte[rbp-16]
cmp r10b, bl
setne r10b
mov al, r10b
and al, 1
jnz _LWHILESTART_0x4b
_LWHILEEND_0x4d:
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
jz _LIFPOST_0x4e
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
jmp _LIFELSE_0x4f
_LIFPOST_0x4e:
_LIFELSE_0x4f:
;[[ id : str], [ ++ : ++]]
inc qword[rbp-8]
;[[ $ : bool], [ int : 0]]
xor ebx, ebx
and r10b, 0xff
mov r10b, bl
mov dl, r10b
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
jz _LIFPOST_0x50
;[[ int : 0]]
xor eax, eax
jmp ___int___SSCANF_pchar.char.void..__return
jmp _LIFELSE_0x51
_LIFPOST_0x50:
_LIFELSE_0x51:
jmp _LWHILECMP_0x53
_LWHILESTART_0x52:
;[[ @ : @], [ id : format], [ != : !=], [ char : 37]]
mov rbx, qword[rbp-8]
and r10, 0xff
mov r10b, byte[rbx]
mov bl, 37
cmp r10b, bl
setne r10b
mov al, r10b
and al, 1
jz _LIFPOST_0x55
;[[ id : format], [ ++ : ++]]
inc qword[rbp-8]
;[[ id : input], [ ++ : ++]]
inc qword[rbp-16]
jmp _LIFELSE_0x56
_LIFPOST_0x55:
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
jz _LIFPOST_0x57
;[[ id : diff]]
;[[ id : diff]]
;[[ $ : bool], [ int : 1]]
mov r10d, 1
and r11b, 0xff
mov r11b, r10b
mov dl, r11b
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
jmp _LIFELSE_0x58
_LIFPOST_0x57:
;[[ id : c], [ == : ==], [ char : 117]]
mov r10b, 117
mov bl, byte[rbp-40]
cmp bl, r10b
sete bl
mov al, bl
and al, 1
jz _LIFPOST_0x59
;[[ id : diff]]
;[[ id : diff]]
;[[ $ : bool], [ int : 0]]
xor r10d, r10d
and r11b, 0xff
mov r11b, r10b
mov dl, r11b
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
jmp _LIFELSE_0x5a
_LIFPOST_0x59:
;[[ id : c], [ == : ==], [ char : 99]]
mov r10b, 99
mov bl, byte[rbp-40]
cmp bl, r10b
sete bl
mov al, bl
and al, 1
jz _LIFPOST_0x5b
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
jmp _LIFELSE_0x5c
_LIFPOST_0x5b:
;[[ id : c], [ == : ==], [ char : 115]]
mov r10b, 115
mov bl, byte[rbp-40]
cmp bl, r10b
sete bl
mov al, bl
and al, 1
jz _LIFPOST_0x5d
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
jmp _LIFELSE_0x5e
_LIFPOST_0x5d:
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
jz _LIFPOST_0x5f
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
jmp _LIFELSE_0x60
_LIFPOST_0x5f:
_LIFELSE_0x60:
_LIFELSE_0x5e:
_LIFELSE_0x5c:
_LIFELSE_0x5a:
_LIFELSE_0x58:
;[[ id : argc], [ ++ : ++]]
inc dword[rbp-32]
_LIFELSE_0x56:
_LWHILECMP_0x53:
;[[ @ : @], [ id : format], [ != : !=], [ int : 0]]
mov rbx, qword[rbp-8]
and r10, 0xff
mov r10b, byte[rbx]
test r10b, r10b
setnz r10b
mov al, r10b
and al, 1
jnz _LWHILESTART_0x52
_LWHILEEND_0x54:
;[[ id : argc]]
mov ebx, dword[rbp-32]
mov eax, ebx
jmp ___int___SSCANF_pchar.char.void..__return
___int___SSCANF_pchar.char.void..__return:
leave
ret
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
push rax
;[[ fn(x) : [ function void printf( [[char. fmt @ 8]] ) ] ]]
;[[ int : 40]]
mov edx, 40
;[[ int : 0]]
xor esi, esi
;[[ & : &], [ id : buff]]
lea rbx, [rbp-56]
mov rdi, rbx
xor rax, rax
call _void_memset_pvoid.ucharsize_t
push rax
;[[ fn(x) : [ function void memset( [[void. dest @ 8], [uchar value @ 16], [size_t bytes @ 24]] ) ] ]]
;[[ int : 40]]
mov edx, 40
;[[ & : &], [ id : buff]]
lea rbx, [rbp-56]
mov rsi, rbx
;[[ int : 0]]
xor edi, edi
xor rax, rax
call _bool_fgets_pfd_tchar.size_t
push rax
;[[ fn(x) : [ function bool fgets( [[fd_t fd @ 8], [char. buffer @ 16], [size_t amt @ 24]] ) ] ]]
;[[ $ : bool], [ int : 1]]
mov ebx, 1
and r10b, 0xff
mov r10b, bl
mov sil, r10b
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
push rax
;[[ fn(x) : [ function void printf( [[char. fmt @ 8]] ) ] ]]
;[[ int : 40]]
mov edx, 40
;[[ int : 0]]
xor esi, esi
;[[ & : &], [ id : buff]]
lea rbx, [rbp-56]
mov rdi, rbx
xor rax, rax
call _void_memset_pvoid.ucharsize_t
push rax
;[[ fn(x) : [ function void memset( [[void. dest @ 8], [uchar value @ 16], [size_t bytes @ 24]] ) ] ]]
;[[ int : 40]]
mov edx, 40
;[[ & : &], [ id : buff]]
lea rbx, [rbp-56]
mov rsi, rbx
;[[ int : 0]]
xor edi, edi
xor rax, rax
call _bool_fgets_pfd_tchar.size_t
push rax
;[[ fn(x) : [ function bool fgets( [[fd_t fd @ 8], [char. buffer @ 16], [size_t amt @ 24]] ) ] ]]
;[[ $ : bool], [ int : 1]]
mov ebx, 1
and r10b, 0xff
mov r10b, bl
mov sil, r10b
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
xor rax, rax
call _bool_fgets_pfd_tchar.size_t
push rax
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
push rax
;[[ fn(x) : [ function void printf( [[char. fmt @ 8]] ) ] ]]
;[[ id : maxlen]]
mov edx, dword[rbp-16]
;[[ id : buffer]]
mov rbx, qword[rbp-8]
mov rsi, rbx
;[[ int : 0]]
xor edi, edi
xor rax, rax
call _bool_fgets_pfd_tchar.size_t
push rax
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
call _void._malloc_psize_t
;[[ fn(x) : [ function void. malloc( [[size_t size @ 8]] ) ] ]]
mov qword[rbp-24], rax
;[[ int : 0]]
mov qword[rbp-40], 0
;[[ id : msg]]
mov rsi, qword[rbp-8]
;[[ id : STRING_CONSTANT_3]]
mov rbx, STRING_CONSTANT_3
mov rdi, rbx
xor rax, rax
call printf
push rax
;[[ fn(x) : [ function void printf( [[char. fmt @ 0], [void arg1 @ 0]] ) ] ]]
;[[ int : 1]]
mov edx, 1
;[[ & : &], [ id : c]]
lea rbx, [rbp-32]
mov rsi, rbx
;[[ int : 0]]
xor edi, edi
xor rax, rax
call _bool_fgets_pfd_tchar.size_t
push rax
;[[ fn(x) : [ function bool fgets( [[fd_t fd @ 8], [char. buffer @ 16], [size_t amt @ 24]] ) ] ]]
jmp _LWHILECMP_0x62
_LWHILESTART_0x61:
;[[ id : len], [ == : ==], [ id : size]]
mov r10, qword[rbp-16]
mov rbx, qword[rbp-40]
cmp rbx, r10
sete bl
mov al, bl
and al, 1
jz _LIFPOST_0x64
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
call _void._realloc_pvoid.size_t
mov qword[rbp-24], rax
;[[ fn(x) : [ function void. realloc( [[void. og @ 8], [size_t newsize @ 16]] ) ] ]]
jmp _LIFELSE_0x65
_LIFPOST_0x64:
_LIFELSE_0x65:
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
xor rax, rax
call _bool_fgets_pfd_tchar.size_t
push rax
;[[ fn(x) : [ function bool fgets( [[fd_t fd @ 8], [char. buffer @ 16], [size_t amt @ 24]] ) ] ]]
;[[ id : len]]
;[[ id : len]]
;[[ id : len], [ + : +], [ int : 1]]
mov r10, qword[rbp-40]
inc r10
mov qword[rbp-40], r10
_LWHILECMP_0x62:
;[[ id : c], [ != : !=], [ int : 10]]
mov r10d, 10
mov ebx, dword[rbp-32]
cmp ebx, r10d
setne bl
mov al, bl
and al, 1
jnz _LWHILESTART_0x61
_LWHILEEND_0x63:
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
call _void._realloc_pvoid.size_t
;[[ fn(x) : [ function void. realloc( [[void. og @ 8], [size_t newsize @ 16]] ) ] ]]
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
jmp _LWHILECMP_0x67
_LWHILESTART_0x66:
;[[ id : str]]
;[[ id : str]]
;[[ int : 1]]
mov ebx, 1
mov r10, qword[rbp-8]
add r10, rbx
mov qword[rbp-8], r10
_LWHILECMP_0x67:
;[[ @ : @], [ id : str], [ == : ==], [ char : 32]]
mov rbx, qword[rbp-8]
and r10, 0xff
mov r10b, byte[rbx]
mov bl, 32
cmp r10b, bl
sete r10b
mov al, r10b
and al, 1
jnz _LWHILESTART_0x66
_LWHILEEND_0x68:
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
jz _LIFPOST_0x69
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
jmp _LIFELSE_0x6a
_LIFPOST_0x69:
_LIFELSE_0x6a:
jmp _LWHILECMP_0x6c
_LWHILESTART_0x6b:
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
_LWHILECMP_0x6c:
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
jnz _LWHILESTART_0x6b
_LWHILEEND_0x6d:
;[[ id : negative]]
mov bl, byte[rbp-40]
mov al, bl
and al, 1
jz _LIFPOST_0x6e
;[[ int : 0], [ - : -], [ id : val]]
mov r10d, dword[rbp-32]
xor ebx, ebx
sub ebx, r10d
mov eax, ebx
jmp ___int_toInteger_pchar.bool__return
jmp _LIFELSE_0x6f
_LIFPOST_0x6e:
_LIFELSE_0x6f:
;[[ id : val]]
mov ebx, dword[rbp-32]
mov eax, ebx
jmp ___int_toInteger_pchar.bool__return
___int_toInteger_pchar.bool__return:
leave
ret
;[ function int main( [[int argc @ 8], [char.. argv @ 16]] ) ]

main:
push rbp
mov rbp, rsp
sub rsp, 56
;Load Parameter: [int argc @ 8]
mov [rbp-8], rdi
;Load Parameter: [char.. argv @ 16]
mov [rbp-16], rsi
mov dword[rbp-48], 65416
mov qword[rbp-44], STRING_CONSTANT_4
mov qword[rbp-36], 0
;[[ id : test.a]]
mov esi, dword[rbp-48]
;[[ id : STRING_CONSTANT_5]]
mov rbx, STRING_CONSTANT_5
mov rdi, rbx
xor rax, rax
call printf
push rax
;[[ fn(x) : [ function void printf( [[char. fmt @ 0], [void arg1 @ 0]] ) ] ]]
;[[ @ : @], [ ( : (], [ & : &], [ id : test.name], [ ) : )]]
lea rbx, [rbp-44]
mov r10, qword[rbx]
mov rdi, r10
xor rax, rax
call _void_printf_pchar.
push rax
;[[ fn(x) : [ function void printf( [[char. fmt @ 8]] ) ] ]]
;[[ int : 5]]
mov eax, 5
jmp __main__return
__main__return:
leave
ret
