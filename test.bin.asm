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
global _double_sqrt_pdouble
global _double_sqrt_pint
global _int_sqrt_pint
global _int_pow_pintint
global _double_pow_pintint
global _double_pow_pdoubleint
global _int_round_pdouble
global _int_ceil_pdouble
global _int_floor_pdouble
global _int_abs_pint
global _double_abs_pdouble
global _int_log_pint
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
STRING_CONSTANT_0: db `False`, 0
STRING_CONSTANT_1: db `True`, 0
STRING_CONSTANT_2: db `%s`, 0
STRING_CONSTANT_3: db `%i, %i, %i     \r`, 0
nullptr: DQ 0
null: DQ 0
nullterm: DQ 0
M_MINZERO_MEM: DQ 0
rand_next: DQ 1
section .bss
align 16
__heap_padding__: resz 1
section .text
global CMAIN
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
mov r10, 32
mov rbx, QWORD[rbp-24]
xor rdx, rdx
mov rax, rbx
idiv r10d
mov rbx, rdx
mov QWORD[rbp-32], rbx
mov r10, QWORD[rbp-32]
mov rbx, QWORD[rbp-24]
sub ebx, r10d
sar ebx, 2
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
mov rbx, r10
mov QWORD[rbp-48], rbx
.L0x1:
mov r10, QWORD[rbp-40]
mov rbx, QWORD[rbp-48]
cmp ebx, r10d
setl bl
mov rax, rbx
and al, 1
jnz .L0x0
.L0x3:
mov rbx, QWORD[rbp-32]
test ebx, ebx
setnz bl
mov rax, rbx
and al, 1
jz .L0x4
mov rbx, QWORD[rbp-8]
mov r10, QWORD[rbp-40]
mov r11, r10
add rbx, r11
mov rdi, rbx
mov rbx, QWORD[rbp-16]
mov r10, QWORD[rbp-40]
mov r11, r10
add rbx, r11
mov rsi, rbx
mov r10, QWORD[rbp-32]
mov rbx, r10
mov edx, ebx
and rdx, 0xffffffff
mov rax, 0
call _void_memcpy_pvoid.void.size_t
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
_int_sqrt_pint:
push rbp
mov rbp, rsp
sub rsp, 16
mov [rbp-8], rdi
cvtsi2sd xmm0, rdi
  sqrtsd xmm0, xmm0
  cvttsd2si rax, xmm0
___int_sqrt_pint__return:
leave
ret
_int_pow_pintint:
push rbp
mov rbp, rsp
sub rsp, 24
mov [rbp-8], rdi
mov [rbp-16], rsi
mov rax, rdi
  dec rsi
  _int_pow_pintint_flp:
  mul rdi
  dec rsi
  jnz _int_pow_pintint_flp
___int_pow_pintint__return:
leave
ret
_double_pow_pintint:
push rbp
mov rbp, rsp
sub rsp, 24
mov [rbp-8], rdi
mov [rbp-16], rsi
mov r10, QWORD[rbp-8]
mov rbx, r10
mov edi, ebx
and rdi, 0xffffffff
mov r10, QWORD[rbp-16]
mov rbx, r10
mov esi, ebx
and rsi, 0xffffffff
mov rax, 0
call _int_pow_pintint
cvtsi2sd xmm0, rax
___double_pow_pintint__return:
leave
ret
_double_pow_pdoubleint:
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
___double_pow_pdoubleint__return:
leave
ret
_int_round_pdouble:
push rbp
mov rbp, rsp
sub rsp, 16
movsd [rbp-8], xmm0
cvtsd2si rax, xmm0
___int_round_pdouble__return:
leave
ret
_int_ceil_pdouble:
push rbp
mov rbp, rsp
sub rsp, 16
movsd [rbp-8], xmm0
cvttsd2si rax, xmm0
  inc rax
___int_ceil_pdouble__return:
leave
ret
_int_floor_pdouble:
push rbp
mov rbp, rsp
sub rsp, 16
movsd [rbp-8], xmm0
cvttsd2si rax, xmm0
___int_floor_pdouble__return:
leave
ret
_int_abs_pint:
push rbp
mov rbp, rsp
sub rsp, 16
mov [rbp-8], rdi
mov rax, rdi
  sar rdi, 63
  xor rax, rdi
  sub rax, rdi
___int_abs_pint__return:
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
_int_log_pint:
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
___int_log_pint__return:
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
_int_toStr_pintchar.bool:
push rbp
mov rbp, rsp
sub rsp, 56
mov [rbp-8], rdi
mov [rbp-16], rsi
mov [rbp-24], rdx
mov QWORD[rbp-32], 0
mov r10, 0
mov rbx, QWORD[rbp-8]
cmp ebx, r10d
setl bl
mov r10, QWORD[rbp-24]
and bl, r10b
mov rax, rbx
and al, 1
jz .L0x6
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
mov r11, QWORD[rbp-8]
mov r10, 0
sub r10d, r11d
mov rbx, r10
mov QWORD[rbp-8], rbx
mov rbx, 1
mov QWORD[rbp-32], rbx
jmp .L0x7
.L0x6:
.L0x7:
mov r10, QWORD[rbp-8]
mov rbx, r10
mov edi, ebx
and rdi, 0xffffffff
mov rax, 0
call _int_log_pint
push rax
pop rbx
inc ebx
mov QWORD[rbp-40], rbx
mov rbx, QWORD[rbp-40]
mov r10, QWORD[rbp-16]
add r10, rbx
mov QWORD[rbp-16], r10
mov QWORD[rbp-48], 0
jmp .L0x9
.L0x8:
mov rbx, 1
mov r10, QWORD[rbp-16]
sub r10, rbx
mov QWORD[rbp-16], r10
mov rbx, QWORD[rbp-16]
mov r10, rbx
mov rbx, QWORD[rbp-16]
mov r10, rbx
mov r12, 10
mov r11, QWORD[rbp-8]
xor rdx, rdx
mov rax, r11
idiv r12d
mov r11, rdx
mov r12, r11
mov r13, r12
add r13b, 48
mov rbx, r13
mov byte[r10], bl
mov rbx, 10
mov r11, QWORD[rbp-8]
xor rdx, rdx
mov rax,r11
idiv ebx
mov r11, rax
mov QWORD[rbp-8], r11
.L0xa:
mov rbx, 1
mov r11, QWORD[rbp-48]
add r11d, ebx
mov QWORD[rbp-48], r11
.L0x9:
mov r10, QWORD[rbp-40]
mov rbx, QWORD[rbp-48]
cmp ebx, r10d
setl bl
mov rax, rbx
and al, 1
jnz .L0x8
.L0xb:
mov r10, QWORD[rbp-32]
mov rbx, QWORD[rbp-40]
add ebx, r10d
mov rax, rbx
jmp ___int_toStr_pintchar.bool__return
___int_toStr_pintchar.bool__return:
leave
ret
_int_toStr_pdoublechar.int:
push rbp
mov rbp, rsp
sub rsp, 48
movsd [rbp-8], xmm0
mov [rbp-16], rdi
mov [rbp-24], rsi
cvttsd2si rbx, QWORD[rbp-8]
mov QWORD[rbp-32], rbx
mov r10, QWORD[rbp-32]
mov rbx, r10
mov edi, ebx
and rdi, 0xffffffff
mov rbx, QWORD[rbp-16]
mov rsi, rbx
mov rbx, 1
mov dl, bl
and rdx, 0xff
mov rax, 0
call _int_toStr_pintchar.bool
push rax
pop rax
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
push rax
pop rax
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
mov rbx, 1
mov r10, QWORD[rbp-16]
add r10, rbx
mov QWORD[rbp-16], r10
movsd xmm7, QWORD[rbp-8]
movsd xmm0, xmm7
mov rax, 1
call _int_round_pdouble
push rax
pop r10
mov edi, r10d
and rdi, 0xffffffff
mov r10, QWORD[rbp-16]
mov rsi, r10
mov r10, 0
mov dl, r10b
and rdx, 0xff
mov rax, 0
call _int_toStr_pintchar.bool
push rax
pop rbx
mov r11, QWORD[rbp-40]
add r11d, ebx
mov QWORD[rbp-40], r11
mov rbx, QWORD[rbp-40]
dec ebx
mov rax, rbx
jmp ___int_toStr_pdoublechar.int__return
___int_toStr_pdoublechar.int__return:
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
mov r10, rbx
mov QWORD[rbp-40], r10
mov rbx, QWORD[rbp-8]
test rbx, rbx
setz bl
mov r10, QWORD[rbp-16]
test r10, r10
setz r10b
or bl, r10b
mov rax, rbx
and al, 1
jz .L0xc
mov rax, 0
jmp ___int___sprintf_pchar.char.void.__return
jmp .L0xd
.L0xc:
.L0xd:
jmp .L0xf
.L0xe:
mov rbx, QWORD[rbp-16]
and r10, 0xff
mov r10b, byte[rbx]
mov rbx, 37
cmp r10b, bl
setne r10b
mov rax, r10
and al, 1
jz .L0x11
mov rbx, QWORD[rbp-8]
mov r10, rbx
mov rbx, QWORD[rbp-8]
mov r10, rbx
mov r11, QWORD[rbp-16]
and r12, 0xff
mov r12b, byte[r11]
mov rbx, r12
mov byte[r10], bl
jmp .L0x12
.L0x11:
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
jz .L0x13
mov r10, QWORD[rbp-32]
mov rbx, QWORD[rbp-24]
lea rbx, [rbx+r10*8]
mov rbx, qword[rbx]
mov QWORD[rbp-56], rbx
mov r10, QWORD[rbp-56]
mov rbx, r10
mov edi, ebx
and rdi, 0xffffffff
mov rbx, QWORD[rbp-8]
mov rsi, rbx
mov rbx, 1
mov dl, bl
and rdx, 0xff
mov rax, 0
call _int_toStr_pintchar.bool
push rax
pop rax
mov QWORD[rbp-64], rax
mov r10, QWORD[rbp-64]
dec r10d
mov rbx, r10
mov r10, QWORD[rbp-8]
add r10, rbx
mov QWORD[rbp-8], r10
jmp .L0x14
.L0x13:
mov r10, 99
mov rbx, QWORD[rbp-48]
cmp bl, r10b
sete bl
mov rax, rbx
and al, 1
jz .L0x15
mov r10, QWORD[rbp-32]
mov rbx, QWORD[rbp-24]
lea rbx, [rbx+r10*8]
mov rbx, qword[rbx]
mov r10, rbx
mov r11, r10
mov QWORD[rbp-72], r11
mov rbx, QWORD[rbp-8]
mov r10, rbx
mov rbx, QWORD[rbp-8]
mov r10, rbx
mov r11, QWORD[rbp-72]
mov rbx, r11
mov byte[r10], bl
jmp .L0x16
.L0x15:
mov r10, 117
mov rbx, QWORD[rbp-48]
cmp bl, r10b
sete bl
mov rax, rbx
and al, 1
jz .L0x17
mov r10, QWORD[rbp-32]
mov rbx, QWORD[rbp-24]
lea rbx, [rbx+r10*8]
mov rbx, qword[rbx]
mov QWORD[rbp-80], rbx
mov r10, QWORD[rbp-80]
mov rbx, r10
mov edi, ebx
and rdi, 0xffffffff
mov rbx, QWORD[rbp-8]
mov rsi, rbx
mov rbx, 0
mov dl, bl
and rdx, 0xff
mov rax, 0
call _int_toStr_pintchar.bool
push rax
pop rax
mov QWORD[rbp-88], rax
mov r10, QWORD[rbp-88]
dec r10d
mov rbx, r10
mov r10, QWORD[rbp-8]
add r10, rbx
mov QWORD[rbp-8], r10
jmp .L0x18
.L0x17:
mov r10, 115
mov rbx, QWORD[rbp-48]
cmp bl, r10b
sete bl
mov rax, rbx
and al, 1
jz .L0x19
mov rbx, QWORD[rbp-8]
mov rdi, rbx
mov r10, QWORD[rbp-32]
mov rbx, QWORD[rbp-24]
lea rbx, [rbx+r10*8]
mov rbx, qword[rbx]
mov rsi, rbx
mov rax, 0
call _int_strcpy_pchar.char.
push rax
pop rax
mov QWORD[rbp-96], rax
mov r10, QWORD[rbp-96]
dec r10d
mov rbx, r10
mov r10, QWORD[rbp-8]
add r10, rbx
mov QWORD[rbp-8], r10
jmp .L0x1a
.L0x19:
mov r10, 98
mov rbx, QWORD[rbp-48]
cmp bl, r10b
sete bl
mov rax, rbx
and al, 1
jz .L0x1b
mov r10, QWORD[rbp-32]
mov rbx, QWORD[rbp-24]
lea rbx, [rbx+r10*8]
mov rbx, qword[rbx]
mov QWORD[rbp-104], rbx
mov rbx, STRING_CONSTANT_0
mov QWORD[rbp-112], rbx
mov rbx, QWORD[rbp-104]
mov rax, rbx
and al, 1
jz .L0x1d
mov r10, STRING_CONSTANT_1
mov rbx, r10
mov QWORD[rbp-112], rbx
jmp .L0x1e
.L0x1d:
.L0x1e:
mov rbx, QWORD[rbp-8]
mov rdi, rbx
mov rbx, QWORD[rbp-112]
mov rsi, rbx
mov rax, 0
call _int_strcpy_pchar.char.
push rax
pop rax
mov QWORD[rbp-120], rax
mov rbx, QWORD[rbp-120]
mov r10, QWORD[rbp-8]
add r10, rbx
mov QWORD[rbp-8], r10
jmp .L0x1c
.L0x1b:
mov r10, 100
mov rbx, QWORD[rbp-48]
cmp bl, r10b
sete bl
mov rax, rbx
and al, 1
jz .L0x1f
mov r10, QWORD[rbp-32]
mov rbx, QWORD[rbp-24]
lea rbx, [rbx+r10*8]
mov rbx, qword[rbx]
movq xmm7, rbx
movsd QWORD[rbp-128], xmm7
movsd xmm7, QWORD[rbp-128]
movsd xmm0, xmm7
mov rbx, QWORD[rbp-8]
mov rdi, rbx
mov rbx, 100000000000000
mov esi, ebx
and rsi, 0xffffffff
mov rax, 1
call _int_toStr_pdoublechar.int
push rax
pop rax
mov QWORD[rbp-136], rax
mov r10, QWORD[rbp-136]
dec r10d
mov rbx, r10
mov r10, QWORD[rbp-8]
add r10, rbx
mov QWORD[rbp-8], r10
jmp .L0x20
.L0x1f:
mov r10, 102
mov rbx, QWORD[rbp-48]
cmp bl, r10b
sete bl
mov rax, rbx
and al, 1
jz .L0x21
mov r10, QWORD[rbp-32]
mov rbx, QWORD[rbp-24]
lea rbx, [rbx+r10*8]
mov rbx, qword[rbx]
movq xmm7, rbx
movsd QWORD[rbp-144], xmm7
movsd xmm7, QWORD[rbp-144]
movsd xmm0, xmm7
mov rbx, QWORD[rbp-8]
mov rdi, rbx
mov rbx, 10000000
mov esi, ebx
and rsi, 0xffffffff
mov rax, 1
call _int_toStr_pdoublechar.int
push rax
pop rax
mov QWORD[rbp-152], rax
mov r10, QWORD[rbp-152]
dec r10d
mov rbx, r10
mov r10, QWORD[rbp-8]
add r10, rbx
mov QWORD[rbp-8], r10
jmp .L0x22
.L0x21:
.L0x22:
.L0x20:
.L0x1c:
.L0x1a:
.L0x18:
.L0x16:
.L0x14:
mov rbx, 1
mov r11, QWORD[rbp-32]
add r11d, ebx
mov QWORD[rbp-32], r11
.L0x12:
mov rbx, 1
mov r10, QWORD[rbp-16]
add r10, rbx
mov QWORD[rbp-16], r10
mov rbx, 1
mov r10, QWORD[rbp-8]
add r10, rbx
mov QWORD[rbp-8], r10
.L0xf:
mov rbx, QWORD[rbp-16]
and r10, 0xff
mov r10b, byte[rbx]
test r10b, r10b
setnz r10b
mov rax, r10
and al, 1
jnz .L0xe
.L0x10:
mov rbx, QWORD[rbp-8]
mov r10, rbx
mov rbx, QWORD[rbp-40]
sub r10d, ebx
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
mov rbx, 32
mov edi, ebx
and rdi, 0xffffffff
mov rax, 0
call _void._malloc_psize_t
push rax
pop rax
mov QWORD[rbp-56], rax
mov rbx, QWORD[rbp-56]
mov rbx, QWORD[rbp-56]
mov r11, QWORD[rbp-24]
mov r10, r11
mov qword[rbx], r10
mov r10, 1
mov rbx, QWORD[rbp-56]
lea rbx, [rbx+r10*8]
mov r10, 1
mov rbx, QWORD[rbp-56]
lea rbx, [rbx+r10*8]
mov r11, QWORD[rbp-32]
mov r10, r11
mov qword[rbx], r10
mov r10, 2
mov rbx, QWORD[rbp-56]
lea rbx, [rbx+r10*8]
mov r10, 2
mov rbx, QWORD[rbp-56]
lea rbx, [rbx+r10*8]
mov r11, QWORD[rbp-40]
mov r10, r11
mov qword[rbx], r10
mov r10, 3
mov rbx, QWORD[rbp-56]
lea rbx, [rbx+r10*8]
mov r10, 3
mov rbx, QWORD[rbp-56]
lea rbx, [rbx+r10*8]
mov r11, QWORD[rbp-48]
mov r10, r11
mov qword[rbx], r10
mov rbx, QWORD[rbp-8]
mov rdi, rbx
mov rbx, QWORD[rbp-16]
mov rsi, rbx
mov rbx, QWORD[rbp-56]
mov rdx, rbx
mov rax, 0
call _int___sprintf_pchar.char.void.
push rax
pop rax
mov QWORD[rbp-64], rax
mov rbx, QWORD[rbp-56]
mov rdi, rbx
mov rax, 0
call _void_free_pvoid.
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
lea rbx, [rbp-100024]
lea rbx, [rbx+r10*1]
mov r10, 100000
lea rbx, [rbp-100024]
lea rbx, [rbx+r10*1]
mov r10, 0
mov byte[rbx], r10b
lea rbx, [rbp-100024]
mov rdi, rbx
mov rbx, QWORD[rbp-8]
mov rsi, rbx
mov rbx, QWORD[rbp-16]
mov rdx, rbx
mov rax, 0
call _int___sprintf_pchar.char.void.
push rax
pop rax
mov QWORD[rbp-100032], rax
mov rbx, 1
mov edi, ebx
and rdi, 0xffffffff
lea rbx, [rbp-100024]
mov rsi, rbx
mov r10, QWORD[rbp-100032]
mov rbx, r10
mov edx, ebx
and rdx, 0xffffffff
mov rax, 0
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
mov rbx, 48
mov edi, ebx
and rdi, 0xffffffff
mov rax, 0
call _void._malloc_psize_t
push rax
pop rax
mov QWORD[rbp-56], rax
mov rbx, QWORD[rbp-56]
mov rbx, QWORD[rbp-56]
mov r11, QWORD[rbp-16]
mov r10, r11
mov qword[rbx], r10
mov r10, 1
mov rbx, QWORD[rbp-56]
lea rbx, [rbx+r10*8]
mov r10, 1
mov rbx, QWORD[rbp-56]
lea rbx, [rbx+r10*8]
mov r11, QWORD[rbp-24]
mov r10, r11
mov qword[rbx], r10
mov r10, 2
mov rbx, QWORD[rbp-56]
lea rbx, [rbx+r10*8]
mov r10, 2
mov rbx, QWORD[rbp-56]
lea rbx, [rbx+r10*8]
mov r11, QWORD[rbp-32]
mov r10, r11
mov qword[rbx], r10
mov r10, 3
mov rbx, QWORD[rbp-56]
lea rbx, [rbx+r10*8]
mov r10, 3
mov rbx, QWORD[rbp-56]
lea rbx, [rbx+r10*8]
mov r11, QWORD[rbp-40]
mov r10, r11
mov qword[rbx], r10
mov r10, 4
mov rbx, QWORD[rbp-56]
lea rbx, [rbx+r10*8]
mov r10, 4
mov rbx, QWORD[rbp-56]
lea rbx, [rbx+r10*8]
mov r11, QWORD[rbp-48]
mov r10, r11
mov qword[rbx], r10
mov rbx, QWORD[rbp-8]
mov rdi, rbx
mov rbx, QWORD[rbp-56]
mov rsi, rbx
mov rax, 0
call _void___printf_pchar.void.
mov rbx, QWORD[rbp-56]
mov rdi, rbx
mov rax, 0
call _void_free_pvoid.
__printf__return:
leave
ret

_void_printf_pchar.:
push rbp
mov rbp, rsp
sub rsp, 16
mov [rbp-8], rdi
mov rbx, 1
mov edi, ebx
and rdi, 0xffffffff
mov rbx, QWORD[rbp-8]
mov rsi, rbx
mov rax, 0
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
mov r10, [rand_next]
sal r10d, 13
mov r11, [rand_next]
xor r11d, r10d
mov rbx, r11
mov [rand_next], rbx
mov r10, [rand_next]
sar r10d, 17
mov r11, [rand_next]
xor r11d, r10d
mov rbx, r11
mov [rand_next], rbx
mov r10, [rand_next]
sal r10d, 5
mov r11, [rand_next]
xor r11d, r10d
mov rbx, r11
mov [rand_next], rbx
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
push rax
pop rbx
mov [rand_next], rbx
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
lea rbx, [rbp-72]
mov rdi, rbx
mov rbx, 0
mov sil, bl
and rsi, 0xff
mov rbx, 4
mov edx, ebx
and rdx, 0xffffffff
mov rax, 0
call _void_memset_pvoid.ucharsize_t
lea rbx, [rbp-72]
mov QWORD[rbp-80], rbx
mov r10, QWORD[rbp-8]
and r11, 0xff
mov r11b, byte[r10]
mov rbx, r11
mov QWORD[rbp-48], rbx
jmp .L0x24
.L0x23:
mov rbx, 0
mov QWORD[rbp-24], rbx
jmp .L0x27
.L0x26:
mov r10, QWORD[rbp-48]
mov rbx, r10
mov dil, bl
and rdi, 0xff
mov rax, 0
call _bool_isdigit_pchar
push rax
pop rax
and al, 1
jz .L0x29
mov r10, QWORD[rbp-32]
mov r11, QWORD[rbp-24]
mov r12, r11
imul r12d, r10d
mov r10, QWORD[rbp-48]
sub r10b, 48
mov r11, r10
add r12d, r11d
mov rbx, r12
mov QWORD[rbp-24], rbx
mov rbx, 1
mov r10, QWORD[rbp-8]
add r10, rbx
mov QWORD[rbp-8], r10
mov r10, QWORD[rbp-8]
and r11, 0xff
mov r11b, byte[r10]
mov rbx, r11
mov QWORD[rbp-48], rbx
jmp .L0x2a
.L0x29:
jmp .L0x28
.L0x2a:
.L0x27:
mov rbx, 1
mov r10, rbx
mov rax, r10
and al, 1
jnz .L0x26
.L0x28:
mov r10, 46
mov rbx, QWORD[rbp-48]
cmp bl, r10b
sete bl
mov rax, rbx
and al, 1
jz .L0x2b
lea rbx, [rbp-72]
add ebx, 16
mov r10, QWORD[rbp-80]
mov r11, rbx
cmp r10, r11
seta r10b
mov rax, r10
and al, 1
jz .L0x2d
mov rax, 0
jmp ___int_inet_aton_pchar.in_addr.__return
jmp .L0x2e
.L0x2d:
.L0x2e:
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
mov rbx, r11
mov QWORD[rbp-48], rbx
jmp .L0x2c
.L0x2b:
jmp .L0x25
.L0x2c:
.L0x24:
mov rbx, 1
mov r10, rbx
mov rax, r10
and al, 1
jnz .L0x23
.L0x25:
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
jz .L0x2f
mov rax, 0
jmp ___int_inet_aton_pchar.in_addr.__return
jmp .L0x30
.L0x2f:
.L0x30:
lea r10, [rbp-72]
mov r10d, dword[r10]
and r10, 0xffffffff
shl r10d, 24
mov r11, QWORD[rbp-24]
mov r12, r11
or r12d, r10d
mov r11, 1
lea r10, [rbp-72]
lea r10, [r10+r11*4]
mov r10d, dword[r10]
and r10, 0xffffffff
shl r10d, 16
or r12d, r10d
mov r11, 2
lea r10, [rbp-72]
lea r10, [r10+r11*4]
mov r10d, dword[r10]
and r10, 0xffffffff
shl r10d, 8
or r12d, r10d
mov rbx, r12
mov QWORD[rbp-24], rbx
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
jz .L0x31
mov rbx, 0
mov QWORD[rbp-40], rbx
jmp .L0x32
.L0x31:
mov r10, 119
mov rbx, QWORD[rbp-24]
cmp ebx, r10d
sete bl
mov rax, rbx
and al, 1
jz .L0x33
mov rbx, 1
mov QWORD[rbp-40], rbx
jmp .L0x34
.L0x33:
mov r10, 97
mov rbx, QWORD[rbp-24]
cmp ebx, r10d
sete bl
mov rax, rbx
and al, 1
jz .L0x35
mov rbx, 1
mov QWORD[rbp-40], rbx
jmp .L0x36
.L0x35:
mov r10, 157
mov rbx, QWORD[rbp-24]
cmp ebx, r10d
sete bl
mov rax, rbx
and al, 1
jz .L0x37
mov rbx, 2
mov QWORD[rbp-40], rbx
jmp .L0x38
.L0x37:
mov r10, 162
mov rbx, QWORD[rbp-24]
cmp ebx, r10d
sete bl
mov rax, rbx
and al, 1
jz .L0x39
mov rbx, 1792
mov QWORD[rbp-32], rbx
mov rbx, 2
mov QWORD[rbp-40], rbx
jmp .L0x3a
.L0x39:
mov rbx, 1792
mov QWORD[rbp-32], rbx
mov rbx, 2
mov QWORD[rbp-40], rbx
.L0x3a:
.L0x38:
.L0x36:
.L0x34:
.L0x32:
mov rbx, QWORD[rbp-8]
mov rdi, rbx
mov r10, QWORD[rbp-40]
mov rbx, r10
mov esi, ebx
and rsi, 0xffffffff
mov r10, QWORD[rbp-32]
mov rbx, r10
mov edx, ebx
and rdx, 0xffffffff
mov rax, 0
call _fd_t_open_pchar.intmode_t
push rax
pop rax
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
jz .L0x3b
mov r10, QWORD[rbp-48]
mov rbx, r10
mov edi, ebx
and rdi, 0xffffffff
mov rbx, 0
mov esi, ebx
and rsi, 0xffffffff
mov rbx, 2
mov edx, ebx
and rdx, 0xffffffff
mov rax, 0
call _int_lseek_pfd_tintint
jmp .L0x3c
.L0x3b:
.L0x3c:
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
mov rax, 0
call _size_t_strlen_pchar.
push rax
pop rax
mov QWORD[rbp-24], rax
mov r10, QWORD[rbp-8]
mov rbx, r10
mov edi, ebx
and rdi, 0xffffffff
mov rbx, QWORD[rbp-16]
mov rsi, rbx
mov r10, QWORD[rbp-24]
mov rbx, r10
mov edx, ebx
and rdx, 0xffffffff
mov rax, 0
call _ssize_t_write_pfd_tchar.size_t
push rax
pop rax
mov QWORD[rbp-32], rax
mov r10, QWORD[rbp-8]
mov rbx, r10
mov edi, ebx
and rdi, 0xffffffff
mov r10, QWORD[rbp-24]
mov rbx, r10
mov esi, ebx
and rsi, 0xffffffff
mov rbx, 1
mov edx, ebx
and rdx, 0xffffffff
mov rax, 0
call _int_lseek_pfd_tintint
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
mov r10, QWORD[rbp-8]
mov rbx, r10
mov edi, ebx
and rdi, 0xffffffff
mov rbx, QWORD[rbp-16]
mov rsi, rbx
mov r10, QWORD[rbp-24]
mov rbx, r10
mov edx, ebx
and rdx, 0xffffffff
mov rax, 0
call _ssize_t_read_pfd_tchar.size_t
push rax
mov r10, 0
pop rbx
cmp ebx, r10d
setg bl
mov QWORD[rbp-32], rbx
mov r10, QWORD[rbp-8]
mov rbx, r10
mov edi, ebx
and rdi, 0xffffffff
mov r10, QWORD[rbp-24]
mov rbx, r10
mov esi, ebx
and rsi, 0xffffffff
mov rbx, 1
mov edx, ebx
and rdx, 0xffffffff
mov rax, 0
call _int_lseek_pfd_tintint
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
mov r10, QWORD[rbp-8]
mov rbx, r10
mov edi, ebx
and rdi, 0xffffffff
mov rbx, 0
mov esi, ebx
and rsi, 0xffffffff
mov rbx, 2
mov edx, ebx
and rdx, 0xffffffff
mov rax, 0
call _int_lseek_pfd_tintint
push rax
pop rax
mov QWORD[rbp-16], rax
mov r10, QWORD[rbp-8]
mov rbx, r10
mov edi, ebx
and rdi, 0xffffffff
mov r11, QWORD[rbp-16]
mov r10, 0
sub r10d, r11d
mov rbx, r10
mov esi, ebx
and rsi, 0xffffffff
mov rbx, 2
mov edx, ebx
and rdx, 0xffffffff
mov rax, 0
call _int_lseek_pfd_tintint
mov r10, QWORD[rbp-16]
mov rbx, r10
mov edi, ebx
and rdi, 0xffffffff
mov rax, 0
call _void._malloc_psize_t
push rax
pop rax
mov QWORD[rbp-24], rax
mov r10, QWORD[rbp-8]
mov rbx, r10
mov edi, ebx
and rdi, 0xffffffff
mov rbx, QWORD[rbp-24]
mov rsi, rbx
mov r10, QWORD[rbp-16]
mov rbx, r10
mov edx, ebx
and rdx, 0xffffffff
mov rax, 0
call _ssize_t_read_pfd_tchar.size_t
push rax
mov r10, 0
pop rbx
cmp ebx, r10d
setl bl
mov QWORD[rbp-32], rbx
mov rbx, QWORD[rbp-32]
mov rax, rbx
and al, 1
jz .L0x3d
mov rax, 0
jmp ___void._floads_pfd_t__return
jmp .L0x3e
.L0x3d:
.L0x3e:
mov rax, QWORD[rbp-24]
jmp ___void._floads_pfd_t__return
___void._floads_pfd_t__return:
leave
ret
_int_getInt_pchar.:
push rbp
mov rbp, rsp
sub rsp, 64
mov [rbp-8], rdi
mov rbx, QWORD[rbp-8]
mov rdi, rbx
mov rax, 0
call _void_printf_pchar.
lea rbx, [rbp-56]
mov rdi, rbx
mov rbx, 0
mov sil, bl
and rsi, 0xff
mov rbx, 40
mov edx, ebx
and rdx, 0xffffffff
mov rax, 0
call _void_memset_pvoid.ucharsize_t
mov rbx, 0
mov edi, ebx
and rdi, 0xffffffff
lea rbx, [rbp-56]
mov rsi, rbx
mov rbx, 40
mov edx, ebx
and rdx, 0xffffffff
mov rax, 0
call _bool_fgets_pfd_tchar.size_t
lea rbx, [rbp-56]
mov rdi, rbx
mov r10, 1
mov r11, r10
mov rbx, r11
mov sil, bl
and rsi, 0xff
mov rax, 0
call _int_toInteger_pchar.bool
push rax
pop rax
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
mov rax, 0
call _void_printf_pchar.
lea rbx, [rbp-56]
mov rdi, rbx
mov rbx, 0
mov sil, bl
and rsi, 0xff
mov rbx, 40
mov edx, ebx
and rdx, 0xffffffff
mov rax, 0
call _void_memset_pvoid.ucharsize_t
mov rbx, 0
mov edi, ebx
and rdi, 0xffffffff
lea rbx, [rbp-56]
mov rsi, rbx
mov rbx, 40
mov edx, ebx
and rdx, 0xffffffff
mov rax, 0
call _bool_fgets_pfd_tchar.size_t
lea rbx, [rbp-56]
mov rdi, rbx
mov r10, 1
mov r11, r10
mov rbx, r11
mov sil, bl
and rsi, 0xff
mov rax, 0
call _int_toInteger_pchar.bool
push rax
pop rax
jmp ___uint_getUint_pchar.__return
___uint_getUint_pchar.__return:
leave
ret
_char_getchar_p:
push rbp
mov rbp, rsp
sub rsp, 16
mov rbx, 0
mov edi, ebx
and rdi, 0xffffffff
lea rbx, [rbp-8]
mov rsi, rbx
mov rbx, 1
mov edx, ebx
and rdx, 0xffffffff
mov rax, 0
call _bool_fgets_pfd_tchar.size_t
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
mov rax, 0
call _void_printf_pchar.
mov rbx, 0
mov edi, ebx
and rdi, 0xffffffff
mov rbx, QWORD[rbp-8]
mov rsi, rbx
mov r10, QWORD[rbp-16]
mov rbx, r10
mov edx, ebx
and rdx, 0xffffffff
mov rax, 0
call _bool_fgets_pfd_tchar.size_t
___void_getString_pchar.intchar.__return:
leave
ret
_char._getString_pchar.:
push rbp
mov rbp, rsp
sub rsp, 48
mov [rbp-8], rdi
mov QWORD[rbp-16], 80
mov r10, QWORD[rbp-16]
mov rbx, r10
mov edi, ebx
and rdi, 0xffffffff
mov rax, 0
call _void._malloc_psize_t
push rax
pop rax
mov QWORD[rbp-24], rax
mov QWORD[rbp-40], 0
mov rbx, STRING_CONSTANT_2
mov rdi, rbx
mov rsi, QWORD[rbp-8]
mov rax, 0
call printf
mov rbx, 0
mov edi, ebx
and rdi, 0xffffffff
lea rbx, [rbp-32]
mov rsi, rbx
mov rbx, 1
mov edx, ebx
and rdx, 0xffffffff
mov rax, 0
call _bool_fgets_pfd_tchar.size_t
jmp .L0x40
.L0x3f:
mov r10, QWORD[rbp-16]
mov rbx, QWORD[rbp-40]
cmp ebx, r10d
sete bl
mov rax, rbx
and al, 1
jz .L0x42
mov r10, QWORD[rbp-16]
sal r10d, 1
mov rbx, r10
mov QWORD[rbp-16], rbx
mov rdi, QWORD[rbp-24]
mov r11, QWORD[rbp-16]
mov r10, r11
mov esi, r10d
and rsi, 0xffffffff
mov rax, 0
call _void._realloc_pvoid.size_t
push rax
pop rbx
mov QWORD[rbp-24], rbx
jmp .L0x43
.L0x42:
.L0x43:
mov r10, QWORD[rbp-40]
mov rbx, QWORD[rbp-24]
lea rbx, [rbx+r10*1]
mov r10, QWORD[rbp-40]
mov rbx, QWORD[rbp-24]
lea rbx, [rbx+r10*1]
mov r10, QWORD[rbp-32]
mov byte[rbx], r10b
mov rbx, 0
mov edi, ebx
and rdi, 0xffffffff
lea rbx, [rbp-32]
mov rsi, rbx
mov rbx, 1
mov edx, ebx
and rdx, 0xffffffff
mov rax, 0
call _bool_fgets_pfd_tchar.size_t
mov r10, QWORD[rbp-40]
inc r10d
mov rbx, r10
mov QWORD[rbp-40], rbx
.L0x40:
mov r10, 10
mov rbx, QWORD[rbp-32]
cmp ebx, r10d
setne bl
mov rax, rbx
and al, 1
jnz .L0x3f
.L0x41:
mov rbx, QWORD[rbp-40]
inc ebx
mov r10, QWORD[rbp-24]
lea r10, [r10+rbx*1]
mov rbx, QWORD[rbp-40]
inc ebx
mov r10, QWORD[rbp-24]
lea r10, [r10+rbx*1]
mov rbx, 0
mov byte[r10], bl
mov rdi, QWORD[rbp-24]
mov r10, QWORD[rbp-40]
mov rbx, r10
mov esi, ebx
and rsi, 0xffffffff
mov rax, 0
call _void._realloc_pvoid.size_t
push rax
pop rax
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
jmp .L0x45
.L0x44:
mov rbx, 1
mov r10, QWORD[rbp-8]
add r10, rbx
mov QWORD[rbp-8], r10
.L0x45:
mov rbx, QWORD[rbp-8]
and r10, 0xff
mov r10b, byte[rbx]
mov rbx, 32
cmp r10b, bl
sete r10b
mov rax, r10
and al, 1
jnz .L0x44
.L0x46:
mov rbx, QWORD[rbp-8]
and r10, 0xff
mov r10b, byte[rbx]
mov QWORD[rbp-24], r10
mov QWORD[rbp-32], 0
mov rbx, 0
mov r10, rbx
mov QWORD[rbp-40], r10
mov r10, 45
mov rbx, QWORD[rbp-24]
cmp bl, r10b
sete bl
mov r10, QWORD[rbp-16]
and bl, r10b
mov rax, rbx
and al, 1
jz .L0x47
mov r10, 1
mov r11, r10
mov rbx, r11
mov QWORD[rbp-40], rbx
mov rbx, 1
mov r10, QWORD[rbp-8]
add r10, rbx
mov QWORD[rbp-8], r10
mov r10, QWORD[rbp-8]
and r11, 0xff
mov r11b, byte[r10]
mov rbx, r11
mov QWORD[rbp-24], rbx
jmp .L0x48
.L0x47:
.L0x48:
jmp .L0x4a
.L0x49:
mov r11, 10
mov r10, QWORD[rbp-32]
imul r10d, r11d
mov r11, QWORD[rbp-24]
sub r11b, 48
mov r12, r11
add r10d, r12d
mov rbx, r10
mov QWORD[rbp-32], rbx
mov rbx, 1
mov r10, QWORD[rbp-8]
add r10, rbx
mov QWORD[rbp-8], r10
mov r10, QWORD[rbp-8]
and r11, 0xff
mov r11b, byte[r10]
mov rbx, r11
mov QWORD[rbp-24], rbx
.L0x4a:
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
jnz .L0x49
.L0x4b:
mov rbx, QWORD[rbp-40]
mov rax, rbx
and al, 1
jz .L0x4c
mov r10, QWORD[rbp-32]
mov rbx, 0
sub ebx, r10d
mov rax, rbx
jmp ___int_toInteger_pchar.bool__return
jmp .L0x4d
.L0x4c:
.L0x4d:
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
mov rbx, 0
jmp .L0x4f
.L0x4e:
mov r10, 0
jmp .L0x53
.L0x52:
push rbx
push r10
mov r11, STRING_CONSTANT_3
mov rdi, r11
mov rsi, rbx
mov rdx, r10
mov r12, r10
mov r11, rbx
imul r11w, r12w
mov rcx, r11
mov rax, 0
call printf
pop r10
pop rbx
.L0x54:
inc r10b
.L0x53:
mov r11, 255
mov r12, r10
mov r13, r12
cmp r13d, r11d
setl r13b
mov rax, r13
and al, 1
jnz .L0x52
.L0x55:
.L0x50:
inc bl
.L0x4f:
mov r10, 255
mov r11, rbx
mov r12, r11
cmp r12d, r10d
setl r12b
mov rax, r12
and al, 1
jnz .L0x4e
.L0x51:
mov rax, 5
jmp __main__return
__main__return:
leave
ret
