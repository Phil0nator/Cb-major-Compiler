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
CEXTERN scanf
CEXTERN putchar
CEXTERN puts
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
global _char._get_errstr_pint:
global _long___inline__syscall_plong:
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
STRING_CONSTANT_0: db `Operation not permitted`, 0
STRING_CONSTANT_1: db `No such file or directory`, 0
STRING_CONSTANT_2: db `No such process`, 0
STRING_CONSTANT_3: db `Interrupted system call`, 0
STRING_CONSTANT_4: db `I/O error`, 0
STRING_CONSTANT_5: db `No such device or address`, 0
STRING_CONSTANT_6: db `Argument list too long`, 0
STRING_CONSTANT_7: db `Exec format error`, 0
STRING_CONSTANT_8: db `Bad file number`, 0
STRING_CONSTANT_9: db `No child processes`, 0
STRING_CONSTANT_10: db `Try again`, 0
STRING_CONSTANT_11: db `Out of memory`, 0
STRING_CONSTANT_12: db `Permission denied`, 0
STRING_CONSTANT_13: db `Bad address`, 0
STRING_CONSTANT_14: db `Block device required`, 0
STRING_CONSTANT_15: db `Device or resource busy`, 0
STRING_CONSTANT_16: db `File exists`, 0
STRING_CONSTANT_17: db `Cross-device link`, 0
STRING_CONSTANT_18: db `No such device`, 0
STRING_CONSTANT_19: db `Not a directory`, 0
STRING_CONSTANT_20: db `Is a directory`, 0
STRING_CONSTANT_21: db `Invalid argument`, 0
STRING_CONSTANT_22: db `File table overflow`, 0
STRING_CONSTANT_23: db `Too many open files`, 0
STRING_CONSTANT_24: db `Not a typewriter`, 0
STRING_CONSTANT_25: db `Text file busy`, 0
STRING_CONSTANT_26: db `File too large`, 0
STRING_CONSTANT_27: db `No space left on device`, 0
STRING_CONSTANT_28: db `Illegal seek`, 0
STRING_CONSTANT_29: db `Read-only file system`, 0
STRING_CONSTANT_30: db `Too many links`, 0
STRING_CONSTANT_31: db `Broken pipe`, 0
STRING_CONSTANT_32: db `Math argument out of domain of func`, 0
STRING_CONSTANT_33: db `Math result not representable`, 0
STRING_CONSTANT_34: db `Resource deadlock would occur`, 0
STRING_CONSTANT_35: db `File name too long`, 0
STRING_CONSTANT_36: db `No record locks available`, 0
STRING_CONSTANT_37: db `Function not implemented`, 0
STRING_CONSTANT_38: db `Directory not empty`, 0
STRING_CONSTANT_39: db `Too many symbolic links encountered`, 0
STRING_CONSTANT_40: db `No message of desired type`, 0
STRING_CONSTANT_41: db `Identifier removed`, 0
STRING_CONSTANT_42: db `Channel number out of range`, 0
STRING_CONSTANT_43: db `Level 2 not synchronized`, 0
STRING_CONSTANT_44: db `Level 3 halted`, 0
STRING_CONSTANT_45: db `Level 3 reset`, 0
STRING_CONSTANT_46: db `Link number out of range`, 0
STRING_CONSTANT_47: db `Protocol driver not attached`, 0
STRING_CONSTANT_48: db `No CSI structure available`, 0
STRING_CONSTANT_49: db `Level 2 halted`, 0
STRING_CONSTANT_50: db `Invalid exchange`, 0
STRING_CONSTANT_51: db `Invalid request descriptor`, 0
STRING_CONSTANT_52: db `Exchange full`, 0
STRING_CONSTANT_53: db `No anode`, 0
STRING_CONSTANT_54: db `Invalid request code`, 0
STRING_CONSTANT_55: db `Invalid slot`, 0
STRING_CONSTANT_56: db `Bad font file format`, 0
STRING_CONSTANT_57: db `Device not a stream`, 0
STRING_CONSTANT_58: db `No data available`, 0
STRING_CONSTANT_59: db `Timer expired`, 0
STRING_CONSTANT_60: db `Out of streams resources`, 0
STRING_CONSTANT_61: db `Machine is not on the network`, 0
STRING_CONSTANT_62: db `Package not installed`, 0
STRING_CONSTANT_63: db `Object is remote`, 0
STRING_CONSTANT_64: db `Link has been severed`, 0
STRING_CONSTANT_65: db `Advertise error`, 0
STRING_CONSTANT_66: db `Srmount error`, 0
STRING_CONSTANT_67: db `Communication error on send`, 0
STRING_CONSTANT_68: db `Protocol error`, 0
STRING_CONSTANT_69: db `Multihop attempted`, 0
STRING_CONSTANT_70: db `RFS specific error`, 0
STRING_CONSTANT_71: db `Not a data message`, 0
STRING_CONSTANT_72: db `Value too large for defined data type`, 0
STRING_CONSTANT_73: db `Name not unique on network`, 0
STRING_CONSTANT_74: db `File descriptor in bad state`, 0
STRING_CONSTANT_75: db `Remote address changed`, 0
STRING_CONSTANT_76: db `Can not access a needed shared library`, 0
STRING_CONSTANT_77: db `Accessing a corrupted shared library`, 0
STRING_CONSTANT_78: db `.lib section in a.out corrupted`, 0
STRING_CONSTANT_79: db `Attempting to link in too many shared libraries`, 0
STRING_CONSTANT_80: db `Cannot exec a shared library directly`, 0
STRING_CONSTANT_81: db `Illegal byte sequence`, 0
STRING_CONSTANT_82: db `Interrupted system call should be restarted`, 0
STRING_CONSTANT_83: db `Streams pipe error`, 0
STRING_CONSTANT_84: db `Too many users`, 0
STRING_CONSTANT_85: db `Socket operation on non-socket`, 0
STRING_CONSTANT_86: db `Destination address required`, 0
STRING_CONSTANT_87: db `Message too long`, 0
STRING_CONSTANT_88: db `Protocol wrong type for socket`, 0
STRING_CONSTANT_89: db `Protocol not available`, 0
STRING_CONSTANT_90: db `Protocol not supported`, 0
STRING_CONSTANT_91: db `Socket type not supported`, 0
STRING_CONSTANT_92: db `Operation not supported on transport endpoint`, 0
STRING_CONSTANT_93: db `Protocol family not supported`, 0
STRING_CONSTANT_94: db `Address family not supported by protocol`, 0
STRING_CONSTANT_95: db `Address already in use`, 0
STRING_CONSTANT_96: db `Cannot assign requested address`, 0
STRING_CONSTANT_97: db `Network is down`, 0
STRING_CONSTANT_98: db `Network is unreachable`, 0
STRING_CONSTANT_99: db `Network dropped connection because of reset`, 0
STRING_CONSTANT_100: db `Software caused connection abort`, 0
STRING_CONSTANT_101: db `Connection reset by peer`, 0
STRING_CONSTANT_102: db `No buffer space available`, 0
STRING_CONSTANT_103: db `Transport endpoint is already connected`, 0
STRING_CONSTANT_104: db `Transport endpoint is not connected`, 0
STRING_CONSTANT_105: db `Cannot send after transport endpoint shutdown`, 0
STRING_CONSTANT_106: db `Too many references: cannot splice`, 0
STRING_CONSTANT_107: db `Connection timed out`, 0
STRING_CONSTANT_108: db `Connection refused`, 0
STRING_CONSTANT_109: db `Host is down`, 0
STRING_CONSTANT_110: db `No route to host`, 0
STRING_CONSTANT_111: db `Operation already in progress`, 0
STRING_CONSTANT_112: db `Operation now in progress`, 0
STRING_CONSTANT_113: db `Stale NFS file handle`, 0
STRING_CONSTANT_114: db `Structure needs cleaning`, 0
STRING_CONSTANT_115: db `Not a XENIX named type file`, 0
STRING_CONSTANT_116: db `No XENIX semaphores available`, 0
STRING_CONSTANT_117: db `Is a named type file`, 0
STRING_CONSTANT_118: db `Remote I/O error`, 0
STRING_CONSTANT_119: db `Quota exceeded`, 0
STRING_CONSTANT_120: db `No medium found`, 0
STRING_CONSTANT_121: db `Wrong medium type`, 0
STRING_CONSTANT_122: db `Operation Canceled`, 0
STRING_CONSTANT_123: db `Required key not available`, 0
STRING_CONSTANT_124: db `Key has expired`, 0
STRING_CONSTANT_125: db `Key has been revoked`, 0
STRING_CONSTANT_126: db `Key was rejected by service`, 0
STRING_CONSTANT_127: db `Owner died`, 0
STRING_CONSTANT_128: db `State not recoverable`, 0
STRING_CONSTANT_129: db `Unkown Error Code.`, 0
FLT_CONSTANT_0: dq 0x0.0p+0
STRING_CONSTANT_130: db `0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ`, 0
STRING_CONSTANT_131: db `False`, 0
STRING_CONSTANT_132: db `True`, 0
STRING_CONSTANT_133: db `%s`, 0
__linux_errstrlist: DQ STRING_CONSTANT_0, STRING_CONSTANT_1, STRING_CONSTANT_2, STRING_CONSTANT_3, STRING_CONSTANT_4, STRING_CONSTANT_5, STRING_CONSTANT_6, STRING_CONSTANT_7, STRING_CONSTANT_8, STRING_CONSTANT_9, STRING_CONSTANT_10, STRING_CONSTANT_11, STRING_CONSTANT_12, STRING_CONSTANT_13, STRING_CONSTANT_14, STRING_CONSTANT_15, STRING_CONSTANT_16, STRING_CONSTANT_17, STRING_CONSTANT_18, STRING_CONSTANT_19, STRING_CONSTANT_20, STRING_CONSTANT_21, STRING_CONSTANT_22, STRING_CONSTANT_23, STRING_CONSTANT_24, STRING_CONSTANT_25, STRING_CONSTANT_26, STRING_CONSTANT_27, STRING_CONSTANT_28, STRING_CONSTANT_29, STRING_CONSTANT_30, STRING_CONSTANT_31, STRING_CONSTANT_32, STRING_CONSTANT_33, STRING_CONSTANT_34, STRING_CONSTANT_35, STRING_CONSTANT_36, STRING_CONSTANT_37, STRING_CONSTANT_38, STRING_CONSTANT_39, STRING_CONSTANT_40, STRING_CONSTANT_41, STRING_CONSTANT_42, STRING_CONSTANT_43, STRING_CONSTANT_44, STRING_CONSTANT_45, STRING_CONSTANT_46, STRING_CONSTANT_47, STRING_CONSTANT_48, STRING_CONSTANT_49, STRING_CONSTANT_50, STRING_CONSTANT_51, STRING_CONSTANT_52, STRING_CONSTANT_53, STRING_CONSTANT_54, STRING_CONSTANT_55, STRING_CONSTANT_56, STRING_CONSTANT_57, STRING_CONSTANT_58, STRING_CONSTANT_59, STRING_CONSTANT_60, STRING_CONSTANT_61, STRING_CONSTANT_62, STRING_CONSTANT_63, STRING_CONSTANT_64, STRING_CONSTANT_65, STRING_CONSTANT_66, STRING_CONSTANT_67, STRING_CONSTANT_68, STRING_CONSTANT_69, STRING_CONSTANT_70, STRING_CONSTANT_71, STRING_CONSTANT_72, STRING_CONSTANT_73, STRING_CONSTANT_74, STRING_CONSTANT_75, STRING_CONSTANT_76, STRING_CONSTANT_77, STRING_CONSTANT_78, STRING_CONSTANT_79, STRING_CONSTANT_80, STRING_CONSTANT_81, STRING_CONSTANT_82, STRING_CONSTANT_83, STRING_CONSTANT_84, STRING_CONSTANT_85, STRING_CONSTANT_86, STRING_CONSTANT_87, STRING_CONSTANT_88, STRING_CONSTANT_89, STRING_CONSTANT_90, STRING_CONSTANT_91, STRING_CONSTANT_92, STRING_CONSTANT_93, STRING_CONSTANT_94, STRING_CONSTANT_95, STRING_CONSTANT_96, STRING_CONSTANT_97, STRING_CONSTANT_98, STRING_CONSTANT_99, STRING_CONSTANT_100, STRING_CONSTANT_101, STRING_CONSTANT_102, STRING_CONSTANT_103, STRING_CONSTANT_104, STRING_CONSTANT_105, STRING_CONSTANT_106, STRING_CONSTANT_107, STRING_CONSTANT_108, STRING_CONSTANT_109, STRING_CONSTANT_110, STRING_CONSTANT_111, STRING_CONSTANT_112, STRING_CONSTANT_113, STRING_CONSTANT_114, STRING_CONSTANT_115, STRING_CONSTANT_116, STRING_CONSTANT_117, STRING_CONSTANT_118, STRING_CONSTANT_119, STRING_CONSTANT_120, STRING_CONSTANT_121, STRING_CONSTANT_122, STRING_CONSTANT_123, STRING_CONSTANT_124, STRING_CONSTANT_125, STRING_CONSTANT_126, STRING_CONSTANT_127, STRING_CONSTANT_128
nullterm: DB 0
INLINE_SYSCALL: DQ __inline__syscall
M_MINZERO_MEM: dq 0x0.0p+0
__format_numchars: DQ STRING_CONSTANT_130
rand_next: DQ 1
section .bss
align 16
__heap_padding__: resz 1
section .text
align 8
global CMAIN
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
setg r10b
and bl, r10b
mov al, bl
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
mov rbx, STRING_CONSTANT_129
mov rax, rbx
jmp ___char._get_errstr_pint__return
___char._get_errstr_pint__return:
leave
ret
__inline__syscall:
push rbp
mov rbp, rsp
sub rsp, 16
mov [rbp-8], rdi
syscall
____inline__syscall__return:
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
mov r10d, 32
mov rbx, qword[rbp-24]
mov r11, r10
xor rdx, rdx
mov rax, rbx
idiv r11
mov rbx, rdx
mov dword[rbp-32], ebx
mov r10d, dword[rbp-32]
mov rbx, qword[rbp-24]
mov r11, r10
sub rbx, r11
sar rbx, 2
mov qword[rbp-40], rbx
mov dword[rbp-48], 0
jmp .L0x3
.L0x2:
mov ebx, dword[rbp-48]
shl rbx, 3
add rbx, [rbp-16]
vmovdqu ymm0, [rbx]
mov ebx, dword[rbp-48]
shl rbx, 3
add rbx, [rbp-8]
vmovdqu [rbx], ymm0
.L0x4:
mov r10d, dword[rbp-48]
add r10d, 4
mov dword[rbp-48], r10d
.L0x3:
mov r10d, dword[rbp-48]
mov rbx, qword[rbp-40]
mov r11, r10
cmp r11, rbx
setl r11b
mov al, r11b
and al, 1
jnz .L0x2
.L0x5:
mov ebx, dword[rbp-32]
test ebx, ebx
setnz bl
mov al, bl
and al, 1
jz .L0x6
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
jmp .L0x7
.L0x6:
.L0x7:
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
_long_log_plonglong:
push rbp
mov rbp, rsp
sub rsp, 24
mov [rbp-8], rdi
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
_long_divmod_plonglonglong.:
push rbp
mov rbp, rsp
sub rsp, 32
mov [rbp-8], rdi
mov [rbp-16], rsi
mov [rbp-24], rdx
mov rbx, rdx
  xor rdx, rdx
  mov rax, rdi
  div rsi
  mov [rbx], rdx
___long_divmod_plonglonglong.__return:
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
sub rsp, 40
mov [rbp-8], rdi
mov [rbp-16], rsi
mov [rbp-24], rdx
mov r11, qword[rbp-8]
mov r10, qword[rbp-24]
add r11, r10
mov rbx, r11
jmp .L0x9
.L0x8:
mov r10, qword[rbp-8]
and r11, 0xff
mov r11b, byte[r10]
mov r10b, byte[rbp-16]
cmp r11b, r10b
sete r11b
mov al, r11b
and al, 1
jz .L0xb
mov r10, qword[rbp-8]
mov rax, r10
jmp ___char._memchr_pchar.charsize_t__return
jmp .L0xc
.L0xb:
.L0xc:
inc qword[rbp-8]
.L0x9:
mov r11, qword[rbp-8]
mov r10, rbx
cmp r11, r10
setl r11b
mov al, r11b
and al, 1
jnz .L0x8
.L0xa:
mov eax, 0
jmp ___char._memchr_pchar.charsize_t__return
___char._memchr_pchar.charsize_t__return:
leave
ret
_int_memcmp_pchar.char.size_t:
push rbp
mov rbp, rsp
sub rsp, 48
mov [rbp-8], rdi
mov [rbp-16], rsi
mov [rbp-24], rdx
mov ebx, 0
mov r12, qword[rbp-8]
mov r11, qword[rbp-24]
add r12, r11
mov r10, r12
jmp .L0xe
.L0xd:
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
jz .L0x10
dec ebx
jmp .L0x11
.L0x10:
inc ebx
.L0x11:
inc qword[rbp-8]
inc qword[rbp-16]
.L0xe:
mov r12, qword[rbp-8]
mov r11, r10
cmp r12, r11
setl r12b
mov al, r12b
and al, 1
jnz .L0xd
.L0xf:
mov r11d, ebx
mov eax, r11d
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
jmp .L0x13
.L0x12:
mov rbx, qword[rbp-8]
and r10, 0xff
mov r10b, byte[rbx]
mov bl, byte[rbp-16]
cmp r10b, bl
sete r10b
mov al, r10b
and al, 1
jz .L0x15
mov rbx, qword[rbp-8]
mov rax, rbx
jmp ___char._strchr_pchar.char__return
jmp .L0x16
.L0x15:
.L0x16:
inc qword[rbp-8]
.L0x13:
mov rbx, qword[rbp-8]
and r10, 0xff
mov r10b, byte[rbx]
test r10b, r10b
setnz r10b
mov al, r10b
and al, 1
jnz .L0x12
.L0x14:
mov eax, 0
jmp ___char._strchr_pchar.char__return
___char._strchr_pchar.char__return:
leave
ret
_char._strerror_pint:
push rbp
mov rbp, rsp
sub rsp, 16
mov [rbp-8], rdi
mov ebx, dword[rbp-8]
mov edi, ebx
xor rax, rax
call _char._get_errstr_pint
jmp ___char._strerror_pint__return
___char._strerror_pint__return:
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
mov byte[rbp-40], 0
mov r10d, 0
mov rbx, qword[rbp-8]
mov r11, r10
cmp rbx, r11
setl bl
mov r10b, byte[rbp-24]
and bl, r10b
mov al, bl
and al, 1
jz .L0x17
mov rbx, qword[rbp-16]
mov r10, rbx
mov rbx, qword[rbp-16]
mov r10, rbx
mov bl, 45
mov byte[r10], bl
mov ebx, 1
mov r10, qword[rbp-16]
add r10, rbx
mov qword[rbp-16], r10
mov r11d, 0
mov r10, qword[rbp-8]
mov r12, r11
sub r12, r10
mov qword[rbp-8], r12
mov ebx, 1
mov byte[rbp-40], bl
jmp .L0x18
.L0x17:
.L0x18:
mov edx, 64
xor esi, esi
lea rbx, [rbp-112]
mov rdi, rbx
xor rax, rax
call _void_memset_pvoid.ucharsize_t
mov dword[rbp-120], 1
jmp .L0x1a
.L0x19:
lea r10, [rbp-128]
mov rdx, r10
mov si, word[rbp-32]
mov r10, qword[rbp-8]
mov rdi, r10
xor rax, rax
call _long_divmod_plonglonglong.
mov qword[rbp-8], rax
mov ebx, dword[rbp-120]
dec ebx
lea r10, [rbp-112] 
and rbx, 0xffffffff
lea r10, [r10+rbx*1]
mov ebx, dword[rbp-120]
dec ebx
lea r10, [rbp-112] 
and rbx, 0xffffffff
lea r10, [r10+rbx*1]
mov r12b, byte[rbp-128]
mov r11, __format_numchars
and r12, 0xff
lea r11, [r11+r12*1]
mov r11b, byte[r11]
and r11, 0xff
mov byte[r10], r11b
mov ebx, 1
mov r11d, dword[rbp-120]
add r11d, ebx
mov dword[rbp-120], r11d
.L0x1a:
mov rbx, qword[rbp-8]
test rbx, rbx
setnz bl
mov al, bl
and al, 1
jnz .L0x19
.L0x1b:
mov ebx, dword[rbp-120]
mov dword[rbp-136], ebx
jmp .L0x1d
.L0x1c:
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
mov byte[rbx], r12b
.L0x1e:
dec dword[rbp-136]
.L0x1d:
mov r10d, 0
mov ebx, dword[rbp-136]
cmp ebx, r10d
setge bl
mov al, bl
and al, 1
jnz .L0x1c
.L0x1f:
mov ebx, dword[rbp-120]
inc ebx
mov r10b, byte[rbp-40]
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
mov ecx, 10
mov edx, 1
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
call _double_abs_pdouble
movq rax, xmm0
movq xmm7, rax
movsd qword[rbp-8], xmm7
cvtsi2sd xmm7, qword[rbp-32]
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
mov byte[r10], bl
inc qword[rbp-16]
mov ecx, 10
xor edx, edx
mov r10, qword[rbp-16]
mov rsi, r10
movsd xmm7, qword[rbp-8]
movsd xmm0, xmm7
mov rax, 1
call _long_round_pdouble
mov rdi, rax
xor rax, rax
call _long_toStr_plongchar.boolshort
mov rbx, rax
mov r11, qword[rbp-40]
add r11, rbx
mov qword[rbp-40], r11
mov rbx, qword[rbp-40]
dec rbx
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
jz .L0x20
mov eax, 0
jmp ___int___sprintf_pchar.char.void.__return
jmp .L0x21
.L0x20:
.L0x21:
jmp .L0x23
.L0x22:
mov rbx, qword[rbp-16]
and r10, 0xff
mov r10b, byte[rbx]
mov bl, 37
cmp r10b, bl
setne r10b
mov al, r10b
and al, 1
jz .L0x25
mov rbx, qword[rbp-8]
mov r10, rbx
mov rbx, qword[rbp-8]
mov r10, rbx
mov r11, qword[rbp-16]
and r12, 0xff
mov r12b, byte[r11]
mov byte[r10], r12b
jmp .L0x26
.L0x25:
mov ebx, 1
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
je .L0x28
cmp bl, 99
je .L0x29
cmp bl, 120
je .L0x2a
cmp bl, 111
je .L0x2b
cmp bl, 117
je .L0x2c
cmp bl, 115
je .L0x2d
cmp bl, 98
je .L0x2e
cmp bl, 100
je .L0x31
cmp bl, 102
je .L0x32
jmp .L0x27
.L0x28:
mov r11d, dword[rbp-32]
mov r10, qword[rbp-24]
and r11, 0xffffffff
lea r10, [r10+r11*8]
mov r10, qword[r10]
mov qword[rbp-56], r10
mov ecx, 10
mov edx, 1
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
jmp .L0x27
.L0x29:
mov r11d, dword[rbp-32]
mov r10, qword[rbp-24]
and r11, 0xffffffff
lea r10, [r10+r11*8]
mov r10, qword[r10]
mov r11, r10
mov byte[rbp-72], r11b
mov r10, qword[rbp-8]
mov r11, r10
mov r10, qword[rbp-8]
mov r11, r10
mov r12b, byte[rbp-72]
mov byte[r11], r12b
jmp .L0x27
.L0x2a:
mov r11d, dword[rbp-32]
mov r10, qword[rbp-24]
and r11, 0xffffffff
lea r10, [r10+r11*8]
mov r10, qword[r10]
mov qword[rbp-80], r10
mov ecx, 16
xor edx, edx
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
jmp .L0x27
.L0x2b:
mov r11d, dword[rbp-32]
mov r10, qword[rbp-24]
and r11, 0xffffffff
lea r10, [r10+r11*8]
mov r10, qword[r10]
mov qword[rbp-96], r10
mov ecx, 8
xor edx, edx
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
jmp .L0x27
.L0x2c:
mov r11d, dword[rbp-32]
mov r10, qword[rbp-24]
and r11, 0xffffffff
lea r10, [r10+r11*8]
mov r10, qword[r10]
mov qword[rbp-112], r10
mov ecx, 10
xor edx, edx
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
jmp .L0x27
.L0x2d:
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
jmp .L0x27
.L0x2e:
mov r11d, dword[rbp-32]
mov r10, qword[rbp-24]
and r11, 0xffffffff
lea r10, [r10+r11*8]
mov r10, qword[r10]
mov byte[rbp-136], r10b
mov qword[rbp-144], STRING_CONSTANT_131
mov r10b, byte[rbp-136]
mov al, r10b
and al, 1
jz .L0x2f
mov qword[rbp-144], STRING_CONSTANT_132
jmp .L0x30
.L0x2f:
.L0x30:
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
jmp .L0x27
.L0x31:
mov r11d, dword[rbp-32]
mov r10, qword[rbp-24]
and r11, 0xffffffff
lea r10, [r10+r11*8]
mov r10, qword[r10]
movq xmm7, r10
movsd qword[rbp-160], xmm7
mov esi, 100000000000000
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
jmp .L0x27
.L0x32:
mov r11d, dword[rbp-32]
mov r10, qword[rbp-24]
and r11, 0xffffffff
lea r10, [r10+r11*8]
mov r10, qword[r10]
movq xmm7, r10
movsd qword[rbp-176], xmm7
mov esi, 10000000
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
jmp .L0x27
.L0x27:
mov ebx, 1
mov r11d, dword[rbp-32]
add r11d, ebx
mov dword[rbp-32], r11d
.L0x26:
mov ebx, 1
mov r10, qword[rbp-16]
add r10, rbx
mov qword[rbp-16], r10
mov ebx, 1
mov r10, qword[rbp-8]
add r10, rbx
mov qword[rbp-8], r10
.L0x23:
mov rbx, qword[rbp-16]
and r10, 0xff
mov r10b, byte[rbx]
test r10b, r10b
setnz r10b
mov al, r10b
and al, 1
jnz .L0x22
.L0x24:
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
mov edi, 32
xor rax, rax
call _void._malloc_psize_t
mov qword[rbp-56], rax
mov rbx, qword[rbp-56]
mov rbx, qword[rbp-56]
mov r11, qword[rbp-24]
mov qword[rbx], r11
mov r10d, 1
mov rbx, qword[rbp-56]
and r10, 0xffffffff
lea rbx, [rbx+r10*8]
mov r10d, 1
mov rbx, qword[rbp-56]
and r10, 0xffffffff
lea rbx, [rbx+r10*8]
mov r11, qword[rbp-32]
mov qword[rbx], r11
mov r10d, 2
mov rbx, qword[rbp-56]
and r10, 0xffffffff
lea rbx, [rbx+r10*8]
mov r10d, 2
mov rbx, qword[rbp-56]
and r10, 0xffffffff
lea rbx, [rbx+r10*8]
mov r11, qword[rbp-40]
mov qword[rbx], r11
mov r10d, 3
mov rbx, qword[rbp-56]
and r10, 0xffffffff
lea rbx, [rbx+r10*8]
mov r10d, 3
mov rbx, qword[rbp-56]
and r10, 0xffffffff
lea rbx, [rbx+r10*8]
mov r11, qword[rbp-48]
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


_void___printf_pchar.void.:
push rbp
mov rbp, rsp
sub rsp, 100040
mov [rbp-8], rdi
mov [rbp-16], rsi
mov r10d, 100000
lea rbx, [rbp-100024] 
and r10, 0xffffffff
lea rbx, [rbx+r10*1]
mov r10d, 100000
lea rbx, [rbp-100024] 
and r10, 0xffffffff
lea rbx, [rbx+r10*1]
xor r10d, r10d
mov byte[rbx], r10b
mov rbx, qword[rbp-16]
mov rdx, rbx
mov rbx, qword[rbp-8]
mov rsi, rbx
lea rbx, [rbp-100024]
mov rdi, rbx
xor rax, rax
call _int___sprintf_pchar.char.void.
mov dword[rbp-100032], eax
mov edx, dword[rbp-100032]
lea rbx, [rbp-100024]
mov rsi, rbx
mov edi, 1
xor rax, rax
call _ssize_t_write_pfd_tchar.size_t
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
mov edi, 48
xor rax, rax
call _void._malloc_psize_t
mov qword[rbp-56], rax
mov rbx, qword[rbp-56]
mov rbx, qword[rbp-56]
mov r11, qword[rbp-16]
mov qword[rbx], r11
mov r10d, 1
mov rbx, qword[rbp-56]
and r10, 0xffffffff
lea rbx, [rbx+r10*8]
mov r10d, 1
mov rbx, qword[rbp-56]
and r10, 0xffffffff
lea rbx, [rbx+r10*8]
mov r11, qword[rbp-24]
mov qword[rbx], r11
mov r10d, 2
mov rbx, qword[rbp-56]
and r10, 0xffffffff
lea rbx, [rbx+r10*8]
mov r10d, 2
mov rbx, qword[rbp-56]
and r10, 0xffffffff
lea rbx, [rbx+r10*8]
mov r11, qword[rbp-32]
mov qword[rbx], r11
mov r10d, 3
mov rbx, qword[rbp-56]
and r10, 0xffffffff
lea rbx, [rbx+r10*8]
mov r10d, 3
mov rbx, qword[rbp-56]
and r10, 0xffffffff
lea rbx, [rbx+r10*8]
mov r11, qword[rbp-40]
mov qword[rbx], r11
mov r10d, 4
mov rbx, qword[rbp-56]
and r10, 0xffffffff
lea rbx, [rbx+r10*8]
mov r10d, 4
mov rbx, qword[rbp-56]
and r10, 0xffffffff
lea rbx, [rbx+r10*8]
mov r11, qword[rbp-48]
mov qword[rbx], r11
mov rbx, qword[rbp-56]
mov rsi, rbx
mov rbx, qword[rbp-8]
mov rdi, rbx
xor rax, rax
call _void___printf_pchar.void.
mov rbx, qword[rbp-56]
mov rdi, rbx
xor rax, rax
call _void_free_pvoid.
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
mov edi, 1
xor rax, rax
call _int_fputs_pfd_tchar.
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
mov r10d, [rand_next]
sal r10d, 13
mov r11d, [rand_next]
xor r11d, r10d
mov [rand_next], r11d
mov r10d, [rand_next]
sar r10d, 17
mov r11d, [rand_next]
xor r11d, r10d
mov [rand_next], r11d
mov r10d, [rand_next]
sal r10d, 5
mov r11d, [rand_next]
xor r11d, r10d
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
mov rax, 0
call _int_rdrand_p
mov rbx, rax
mov [rand_next], ebx
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
_int_inet_aton_pchar.in_addr.:
push rbp
mov rbp, rsp
sub rsp, 80
mov [rbp-8], rdi
mov [rbp-16], rsi
mov dword[rbp-32], 10
mov edx, 4
xor esi, esi
lea rbx, [rbp-64]
mov rdi, rbx
xor rax, rax
call _void_memset_pvoid.ucharsize_t
lea rbx, [rbp-64]
mov qword[rbp-72], rbx
mov r10, qword[rbp-8]
and r11, 0xff
mov r11b, byte[r10]
mov byte[rbp-40], r11b
jmp .L0x34
.L0x33:
mov ebx, 0
mov word[rbp-24], bx
jmp .L0x37
.L0x36:
mov bl, byte[rbp-40]
mov dil, bl
xor rax, rax
call _bool_isdigit_pchar
and al, 1
jz .L0x39
mov r11w, word[rbp-24]
mov r10d, dword[rbp-32]
mov r12d, r11d
imul r12d, r10d
mov r10b, byte[rbp-40]
sub r10b, 48
mov r11d, r10d
add r12d, r11d
mov word[rbp-24], r12w
mov ebx, 1
mov r10, qword[rbp-8]
add r10, rbx
mov qword[rbp-8], r10
mov r10, qword[rbp-8]
and r11, 0xff
mov r11b, byte[r10]
mov byte[rbp-40], r11b
jmp .L0x3a
.L0x39:
jmp .L0x38
.L0x3a:
.L0x37:
mov ebx, 1
mov r10b, bl
mov al, r10b
and al, 1
jnz .L0x36
.L0x38:
mov r10b, 46
mov bl, byte[rbp-40]
cmp bl, r10b
sete bl
mov al, bl
and al, 1
jz .L0x3b
lea rbx, [rbp-64] 
add ebx, 16
mov r10, qword[rbp-72]
mov r11d, r10d
cmp r11d, ebx
seta r11b
mov al, r11b
and al, 1
jz .L0x3d
mov eax, 0
jmp ___int_inet_aton_pchar.in_addr.__return
jmp .L0x3e
.L0x3d:
.L0x3e:
mov rbx, qword[rbp-72]
mov r10, rbx
mov rbx, qword[rbp-72]
mov r10, rbx
mov bx, word[rbp-24]
mov dword[r10], ebx
mov ebx, 4
mov r10, qword[rbp-72]
add r10, rbx
mov qword[rbp-72], r10
mov ebx, 1
mov r10, qword[rbp-8]
add r10, rbx
mov qword[rbp-8], r10
mov r10, qword[rbp-8]
and r11, 0xff
mov r11b, byte[r10]
mov byte[rbp-40], r11b
jmp .L0x3c
.L0x3b:
jmp .L0x35
.L0x3c:
.L0x34:
mov ebx, 1
mov r10b, bl
mov al, r10b
and al, 1
jnz .L0x33
.L0x35:
mov rbx, qword[rbp-72]
mov r10, rbx
mov rbx, qword[rbp-72]
mov r10, rbx
mov bx, word[rbp-24]
mov dword[r10], ebx
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
jz .L0x3f
mov eax, 0
jmp ___int_inet_aton_pchar.in_addr.__return
jmp .L0x40
.L0x3f:
.L0x40:
lea r10, [rbp-64] 
mov r10d, dword[r10d]
and r10d, 0xffffffff
shl r10d, 24
mov r11w, word[rbp-24]
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
mov rbx, qword[rbp-16]
mov r10, rbx
mov rbx, qword[rbp-16]
mov r10, rbx
mov r11w, word[rbp-24]
mov word[r10], r11w
mov eax, 1
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
_FILE_fopen_pchar.char.:
push rbp
mov rbp, rsp
sub rsp, 56
mov [rbp-8], rdi
mov [rbp-16], rsi
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
mov dword[rbp-32], 0
mov dword[rbp-40], 0
mov r10d, 114
mov ebx, dword[rbp-24]
cmp ebx, r10d
sete bl
mov al, bl
and al, 1
jz .L0x41
mov ebx, 0
mov dword[rbp-40], ebx
jmp .L0x42
.L0x41:
mov r10d, 119
mov ebx, dword[rbp-24]
cmp ebx, r10d
sete bl
mov al, bl
and al, 1
jz .L0x43
mov ebx, 1
mov dword[rbp-40], ebx
jmp .L0x44
.L0x43:
mov r10d, 97
mov ebx, dword[rbp-24]
cmp ebx, r10d
sete bl
mov al, bl
and al, 1
jz .L0x45
mov ebx, 1
mov dword[rbp-40], ebx
jmp .L0x46
.L0x45:
mov r10d, 157
mov ebx, dword[rbp-24]
cmp ebx, r10d
sete bl
mov al, bl
and al, 1
jz .L0x47
mov ebx, 2
mov dword[rbp-40], ebx
jmp .L0x48
.L0x47:
mov r10d, 162
mov ebx, dword[rbp-24]
cmp ebx, r10d
sete bl
mov al, bl
and al, 1
jz .L0x49
mov ebx, 1792
mov dword[rbp-32], ebx
mov ebx, 2
mov dword[rbp-40], ebx
jmp .L0x4a
.L0x49:
mov ebx, 1792
mov dword[rbp-32], ebx
mov ebx, 2
mov dword[rbp-40], ebx
.L0x4a:
.L0x48:
.L0x46:
.L0x44:
.L0x42:
mov ebx, dword[rbp-32]
mov edx, ebx
mov ebx, dword[rbp-40]
mov esi, ebx
mov rbx, qword[rbp-8]
mov rdi, rbx
xor rax, rax
call _fd_t_open_pchar.intmode_t
mov dword[rbp-48], eax
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
jz .L0x4b
mov edx, 2
xor esi, esi
mov ebx, dword[rbp-48]
mov edi, ebx
xor rax, rax
call _int_lseek_pfd_tintint
jmp .L0x4c
.L0x4b:
.L0x4c:
mov ebx, dword[rbp-48]
mov eax, ebx
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
mov dword[rbp-24], eax
mov edx, dword[rbp-24]
mov rbx, qword[rbp-16]
mov rsi, rbx
mov ebx, dword[rbp-8]
mov edi, ebx
xor rax, rax
call _ssize_t_write_pfd_tchar.size_t
mov dword[rbp-32], eax
mov edx, 1
mov ebx, dword[rbp-24]
mov esi, ebx
mov ebx, dword[rbp-8]
mov edi, ebx
xor rax, rax
call _int_lseek_pfd_tintint
mov ebx, dword[rbp-32]
mov eax, ebx
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
mov rbx, qword[rbp-24]
mov rdx, rbx
mov rbx, qword[rbp-16]
mov rsi, rbx
mov ebx, dword[rbp-8]
mov edi, ebx
xor rax, rax
call _ssize_t_read_pfd_tchar.size_t
push rax
xor r10d, r10d
pop rbx
mov r11, r10
cmp rbx, r11
setg bl
mov byte[rbp-32], bl
mov edx, 1
mov rsi, qword[rbp-24]
mov ebx, dword[rbp-8]
mov edi, ebx
xor rax, rax
call _int_lseek_pfd_tintint
mov bl, byte[rbp-32]
mov al, bl
jmp ___bool_fgets_pfd_tchar.size_t__return
___bool_fgets_pfd_tchar.size_t__return:
leave
ret
_void._floads_pfd_t:
push rbp
mov rbp, rsp
sub rsp, 40
mov [rbp-8], rdi
mov edx, 2
xor esi, esi
mov ebx, dword[rbp-8]
mov edi, ebx
xor rax, rax
call _int_lseek_pfd_tintint
mov dword[rbp-16], eax
mov edx, 2
mov r10d, dword[rbp-16]
xor ebx, ebx
sub ebx, r10d
mov esi, ebx
mov ebx, dword[rbp-8]
mov edi, ebx
xor rax, rax
call _int_lseek_pfd_tintint
mov edi, dword[rbp-16]
xor rax, rax
call _void._malloc_psize_t
mov qword[rbp-24], rax
mov edx, dword[rbp-16]
mov rbx, qword[rbp-24]
mov rsi, rbx
mov ebx, dword[rbp-8]
mov edi, ebx
xor rax, rax
call _ssize_t_read_pfd_tchar.size_t
push rax
xor r10d, r10d
pop rbx
mov r11, r10
cmp rbx, r11
setl bl
mov byte[rbp-32], bl
mov bl, byte[rbp-32]
mov al, bl
and al, 1
jz .L0x4d
mov eax, 0
jmp ___void._floads_pfd_t__return
jmp .L0x4e
.L0x4d:
.L0x4e:
mov rax, qword[rbp-24]
jmp ___void._floads_pfd_t__return
___void._floads_pfd_t__return:
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
mov ebx, 0
mov byte[rbp-48], bl
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
jz .L0x4f
mov r10d, 1
mov byte[rbp-48], r10b
mov ebx, 1
mov r10, qword[rbp-8]
add r10, rbx
mov qword[rbp-8], r10
mov r10, qword[rbp-8]
and r11, 0xff
mov r11b, byte[r10]
mov byte[rbp-40], r11b
jmp .L0x50
.L0x4f:
.L0x50:
jmp .L0x52
.L0x51:
mov r11d, 10
mov r10, qword[rbp-32]
mov r12, r11
imul r10, r12
mov r11b, byte[rbp-40]
sub r11b, 48
mov r12, r11
add r10, r12
mov qword[rbp-32], r10
mov ebx, 1
mov r10, qword[rbp-8]
add r10, rbx
mov qword[rbp-8], r10
mov r10, qword[rbp-8]
and r11, 0xff
mov r11b, byte[r10]
mov byte[rbp-40], r11b
.L0x52:
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
jnz .L0x51
.L0x53:
mov bl, byte[rbp-48]
cmp bl, 0
sete bl
mov al, bl
and al, 1
jz .L0x54
mov rbx, qword[rbp-16]
mov r10, rbx
mov rbx, qword[rbp-16]
mov r10, rbx
mov r11, qword[rbp-32]
mov qword[r10], r11
jmp .L0x55
.L0x54:
mov rbx, qword[rbp-16]
mov r10, rbx
mov rbx, qword[rbp-16]
mov r10, rbx
xor r12d, r12d
mov r11, qword[rbp-32]
mov r13, r12
sub r13, r11
mov qword[r10], r13
.L0x55:
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
jmp .L0x57
.L0x56:
mov rbx, qword[rbp-24]
mov r10, rbx
mov rbx, qword[rbp-24]
mov r10, rbx
mov r11, qword[rbp-8]
and r12, 0xff
mov r12b, byte[r11]
mov byte[r10], r12b
inc qword[rbp-8]
inc qword[rbp-24]
.L0x57:
mov rbx, qword[rbp-8]
and r10, 0xff
mov r10b, byte[rbx]
mov bl, byte[rbp-16]
cmp r10b, bl
setne r10b
mov al, r10b
and al, 1
jnz .L0x56
.L0x58:
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
mov ebx, 1
mov r10b, bl
mov dl, r10b
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
jz .L0x59
mov rbx, qword[rbp-24]
mov r10, rbx
mov rbx, qword[rbp-24]
mov r10, rbx
cvtsi2sd xmm7, qword[rbp-32]
movq qword[r10], xmm7
mov rax, qword[rbp-48]
jmp ___int_scansd_pchar.booldouble.__return
jmp .L0x5a
.L0x59:
.L0x5a:
inc qword[rbp-8]
mov ebx, 0
mov r10b, bl
mov dl, r10b
lea rbx, [rbp-40]
mov rsi, rbx
mov rbx, qword[rbp-8]
mov rdi, rbx
xor rax, rax
call _int_scanint_pchar.long.bool
mov qword[rbp-56], rax
mov rbx, qword[rbp-56]
mov rsi, rbx
mov edi, 10
xor rax, rax
call _long_pow_plonglong
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
movsd xmm8, qword[rbp-72]
cvtsi2sd xmm9, ebx
divsd xmm8, xmm9
movsd xmm7, xmm8
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
jz .L0x5b
mov eax, 0
jmp ___int___SSCANF_pchar.char.void..__return
jmp .L0x5c
.L0x5b:
.L0x5c:
jmp .L0x5e
.L0x5d:
mov rbx, qword[rbp-8]
and r10, 0xff
mov r10b, byte[rbx]
mov bl, 37
cmp r10b, bl
setne r10b
mov al, r10b
and al, 1
jz .L0x60
inc qword[rbp-8]
inc qword[rbp-16]
jmp .L0x61
.L0x60:
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
jz .L0x62
mov r10d, 1
mov r11b, r10b
mov dl, r11b
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
mov qword[rbp-48], rax
mov rbx, qword[rbp-48]
mov r10, qword[rbp-16]
add r10, rbx
mov qword[rbp-16], r10
inc qword[rbp-8]
jmp .L0x63
.L0x62:
mov r10b, 117
mov bl, byte[rbp-40]
cmp bl, r10b
sete bl
mov al, bl
and al, 1
jz .L0x64
mov r10d, 0
mov r11b, r10b
mov dl, r11b
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
mov qword[rbp-48], rax
mov rbx, qword[rbp-48]
mov r10, qword[rbp-16]
add r10, rbx
mov qword[rbp-16], r10
inc qword[rbp-8]
jmp .L0x65
.L0x64:
mov r10b, 99
mov bl, byte[rbp-40]
cmp bl, r10b
sete bl
mov al, bl
and al, 1
jz .L0x66
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
mov byte[r10], r12b
inc qword[rbp-16]
inc qword[rbp-8]
jmp .L0x67
.L0x66:
mov r10b, 115
mov bl, byte[rbp-40]
cmp bl, r10b
sete bl
mov al, bl
and al, 1
jz .L0x68
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
mov r10, qword[rbp-16]
mov rdi, r10
xor rax, rax
call _int_scanstr_pchar.charchar.
mov qword[rbp-48], rax
mov rbx, qword[rbp-48]
mov r10, qword[rbp-16]
add r10, rbx
mov qword[rbp-16], r10
jmp .L0x69
.L0x68:
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
jz .L0x6a
mov r11d, dword[rbp-32]
mov r10, qword[rbp-24]
and r11, 0xffffffff
lea r10, [r10+r11*8]
mov r10, qword[r10]
mov rdx, r10
xor r10d, r10d
mov r11b, r10b
mov sil, r11b
mov r10, qword[rbp-16]
mov rdi, r10
xor rax, rax
call _int_scansd_pchar.booldouble.
mov qword[rbp-48], rax
mov rbx, qword[rbp-48]
mov r10, qword[rbp-16]
add r10, rbx
mov qword[rbp-16], r10
inc qword[rbp-8]
jmp .L0x6b
.L0x6a:
.L0x6b:
.L0x69:
.L0x67:
.L0x65:
.L0x63:
inc dword[rbp-32]
.L0x61:
.L0x5e:
mov rbx, qword[rbp-8]
and r10, 0xff
mov r10b, byte[rbx]
test r10b, r10b
setnz r10b
mov al, r10b
and al, 1
jnz .L0x5d
.L0x5f:
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
mov r10d, 1
lea rbx, [rbp-88] 
and r10, 0xffffffff
lea rbx, [rbx+r10*8]
mov r10d, 1
lea rbx, [rbp-88] 
and r10, 0xffffffff
lea rbx, [rbx+r10*8]
mov r10, qword[rbp-32]
mov qword[rbx], r10
mov r10d, 2
lea rbx, [rbp-88] 
and r10, 0xffffffff
lea rbx, [rbx+r10*8]
mov r10d, 2
lea rbx, [rbp-88] 
and r10, 0xffffffff
lea rbx, [rbx+r10*8]
mov r10, qword[rbp-40]
mov qword[rbx], r10
mov r10d, 3
lea rbx, [rbp-88] 
and r10, 0xffffffff
lea rbx, [rbx+r10*8]
mov r10d, 3
lea rbx, [rbp-88] 
and r10, 0xffffffff
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
mov edx, 40
xor esi, esi
lea rbx, [rbp-56]
mov rdi, rbx
xor rax, rax
call _void_memset_pvoid.ucharsize_t
mov edx, 40
lea rbx, [rbp-56]
mov rsi, rbx
xor edi, edi
xor rax, rax
call _bool_fgets_pfd_tchar.size_t
mov ebx, 1
mov r10b, bl
mov sil, r10b
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
mov edx, 40
xor esi, esi
lea rbx, [rbp-56]
mov rdi, rbx
xor rax, rax
call _void_memset_pvoid.ucharsize_t
mov edx, 40
lea rbx, [rbp-56]
mov rsi, rbx
xor edi, edi
xor rax, rax
call _bool_fgets_pfd_tchar.size_t
mov ebx, 1
mov r10b, bl
mov sil, r10b
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
mov edx, 1
lea rbx, [rbp-8]
mov rsi, rbx
xor edi, edi
xor rax, rax
call _bool_fgets_pfd_tchar.size_t
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
mov eax, 0
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
xor edi, edi
xor rax, rax
call _bool_fgets_pfd_tchar.size_t
___void_getString_pchar.intchar.__return:
leave
ret
_char._getString_pchar.:
push rbp
mov rbp, rsp
sub rsp, 48
mov [rbp-8], rdi
mov qword[rbp-16], 80
mov rbx, qword[rbp-16]
mov rdi, rbx
xor rax, rax
call _void._malloc_psize_t
mov qword[rbp-24], rax
mov qword[rbp-40], 0
mov rsi, qword[rbp-8]
mov rbx, STRING_CONSTANT_133
mov rdi, rbx
xor rax, rax
call printf
mov edx, 1
lea rbx, [rbp-32]
mov rsi, rbx
xor edi, edi
xor rax, rax
call _bool_fgets_pfd_tchar.size_t
jmp .L0x6d
.L0x6c:
mov r10, qword[rbp-16]
mov rbx, qword[rbp-40]
cmp rbx, r10
sete bl
mov al, bl
and al, 1
jz .L0x6f
mov r10, qword[rbp-16]
sal r10, 1
mov qword[rbp-16], r10
mov r10, qword[rbp-16]
mov rsi, r10
mov rdi, qword[rbp-24]
xor rax, rax
call _void._realloc_pvoid.size_t
mov qword[rbp-24], rax
jmp .L0x70
.L0x6f:
.L0x70:
mov r10, qword[rbp-40]
mov rbx, qword[rbp-24]
lea rbx, [rbx+r10*1]
mov r10, qword[rbp-40]
mov rbx, qword[rbp-24]
lea rbx, [rbx+r10*1]
mov r10d, dword[rbp-32]
mov byte[rbx], r10b
mov edx, 1
lea rbx, [rbp-32]
mov rsi, rbx
xor edi, edi
xor rax, rax
call _bool_fgets_pfd_tchar.size_t
mov r10, qword[rbp-40]
inc r10
mov qword[rbp-40], r10
.L0x6d:
mov r10d, 10
mov ebx, dword[rbp-32]
cmp ebx, r10d
setne bl
mov al, bl
and al, 1
jnz .L0x6c
.L0x6e:
mov rbx, qword[rbp-40]
inc rbx
mov r10, qword[rbp-24]
lea r10, [r10+rbx*1]
mov rbx, qword[rbp-40]
inc rbx
mov r10, qword[rbp-24]
lea r10, [r10+rbx*1]
xor ebx, ebx
mov byte[r10], bl
mov rbx, qword[rbp-40]
mov rsi, rbx
mov rdi, qword[rbp-24]
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
jmp .L0x72
.L0x71:
mov ebx, 1
mov r10, qword[rbp-8]
add r10, rbx
mov qword[rbp-8], r10
.L0x72:
mov rbx, qword[rbp-8]
and r10, 0xff
mov r10b, byte[rbx]
mov bl, 32
cmp r10b, bl
sete r10b
mov al, r10b
and al, 1
jnz .L0x71
.L0x73:
mov rbx, qword[rbp-8]
and r10, 0xff
mov r10b, byte[rbx]
mov byte[rbp-24], r10b
mov dword[rbp-32], 0
mov ebx, 0
mov byte[rbp-40], bl
mov r10b, 45
mov bl, byte[rbp-24]
cmp bl, r10b
sete bl
mov r10b, byte[rbp-16]
and bl, r10b
mov al, bl
and al, 1
jz .L0x74
mov r10d, 1
mov byte[rbp-40], r10b
mov ebx, 1
mov r10, qword[rbp-8]
add r10, rbx
mov qword[rbp-8], r10
mov r10, qword[rbp-8]
and r11, 0xff
mov r11b, byte[r10]
mov byte[rbp-24], r11b
jmp .L0x75
.L0x74:
.L0x75:
jmp .L0x77
.L0x76:
mov r11d, 10
mov r10d, dword[rbp-32]
imul r10d, r11d
mov r11b, byte[rbp-24]
sub r11b, 48
mov r12d, r11d
add r10d, r12d
mov dword[rbp-32], r10d
mov ebx, 1
mov r10, qword[rbp-8]
add r10, rbx
mov qword[rbp-8], r10
mov r10, qword[rbp-8]
and r11, 0xff
mov r11b, byte[r10]
mov byte[rbp-24], r11b
.L0x77:
mov bl, byte[rbp-24]
test bl, bl
setnz bl
mov r11b, byte[rbp-24]
mov r10d, 10
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
jnz .L0x76
.L0x78:
mov bl, byte[rbp-40]
mov al, bl
and al, 1
jz .L0x79
mov r10d, dword[rbp-32]
xor ebx, ebx
sub ebx, r10d
mov eax, ebx
jmp ___int_toInteger_pchar.bool__return
jmp .L0x7a
.L0x79:
.L0x7a:
mov ebx, dword[rbp-32]
mov eax, ebx
jmp ___int_toInteger_pchar.bool__return
___int_toInteger_pchar.bool__return:
leave
ret
__scanf:
push rbp
mov rbp, rsp
sub rsp, 40
mov [rbp-8], rdi
mov [rbp-16], rsi
mov edi, 0
xor rax, rax
call _void._floads_pfd_t
mov rbx, rax
push rbx
mov r11, qword[rbp-16]
mov rdx, r11
mov r11, rbx
mov rsi, r11
mov r11, qword[rbp-8]
mov rdi, r11
xor rax, rax
call _int___SSCANF_pchar.char.void..
pop rbx
mov r10d, eax
push rbx
push r10
mov rdi, rbx
xor rax, rax
call _void_free_pvoid.
pop r10
pop rbx
mov r11d, r10d
mov eax, r11d
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
mov r10d, 1
lea rbx, [rbp-96] 
and r10, 0xffffffff
lea rbx, [rbx+r10*8]
mov r10d, 1
lea rbx, [rbp-96] 
and r10, 0xffffffff
lea rbx, [rbx+r10*8]
mov r10, qword[rbp-24]
mov qword[rbx], r10
mov r10d, 2
lea rbx, [rbp-96] 
and r10, 0xffffffff
lea rbx, [rbx+r10*8]
mov r10d, 2
lea rbx, [rbp-96] 
and r10, 0xffffffff
lea rbx, [rbx+r10*8]
mov r10, qword[rbp-32]
mov qword[rbx], r10
mov r10d, 3
lea rbx, [rbp-96] 
and r10, 0xffffffff
lea rbx, [rbx+r10*8]
mov r10d, 3
lea rbx, [rbp-96] 
and r10, 0xffffffff
lea rbx, [rbx+r10*8]
mov r10, qword[rbp-40]
mov qword[rbx], r10
mov r10d, 4
lea rbx, [rbp-96] 
and r10, 0xffffffff
lea rbx, [rbx+r10*8]
mov r10d, 4
lea rbx, [rbp-96] 
and r10, 0xffffffff
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

main:
push rbp
mov rbp, rsp
sub rsp, 24
mov [rbp-8], rdi
mov [rbp-16], rsi
mov edi, 3
xor rax, rax
call _char._strerror_pint
mov rdi, rax
xor rax, rax
call _void_printf_pchar.
mov eax, 5
jmp __main__return
__main__return:
leave
ret
