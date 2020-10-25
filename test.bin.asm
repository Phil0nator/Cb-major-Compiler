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
STRING_CONSTANT_3: db `This is a string %i\n`, 0
nullptr: DQ 0
null: DQ 0
nullterm: DQ 0
M_MINZERO_MEM: DQ 0
rand_next: DQ 1
section .bss
align 16
__heap_padding__: resz 1
section .text
align 8
global CMAIN

;[ function int bitswap64( [[int x @ 8]] ) ]

_int_bitswap64_pint:
push rbp
mov rbp, rsp
sub rsp, 16
;Load Parameter: [int x @ 8]
mov [rbp-8], rdi
;[[ ( : (], [ ( : (], [ ( : (], [ ( : (], [ id : x], [ ) : )], [ && : &&], [ $ : uint], [ int : 18374686479671623680], [ ) : )], [ >> : >>], [ int : 56], [ ) : )], [ || : ||], [ ( : (], [ ( : (], [ ( : (], [ id : x], [ ) : )], [ && : &&], [ $ : uint], [ int : 71776119061217280], [ ) : )], [ >> : >>], [ int : 40], [ ) : )], [ || : ||], [ ( : (], [ ( : (], [ ( : (], [ id : x], [ ) : )], [ && : &&], [ $ : uint], [ int : 280375465082880], [ ) : )], [ >> : >>], [ int : 24], [ ) : )], [ || : ||], [ ( : (], [ ( : (], [ ( : (], [ id : x], [ ) : )], [ && : &&], [ $ : uint], [ int : 1095216660480], [ ) : )], [ >> : >>], [ int : 8], [ ) : )], [ || : ||], [ ( : (], [ ( : (], [ ( : (], [ id : x], [ ) : )], [ && : &&], [ $ : uint], [ int : 4278190080], [ ) : )], [ << : <<], [ int : 8], [ ) : )], [ || : ||], [ ( : (], [ ( : (], [ ( : (], [ id : x], [ ) : )], [ && : &&], [ $ : uint], [ int : 16711680], [ ) : )], [ << : <<], [ int : 24], [ ) : )], [ || : ||], [ ( : (], [ ( : (], [ ( : (], [ id : x], [ ) : )], [ && : &&], [ $ : uint], [ int : 65280], [ ) : )], [ << : <<], [ int : 40], [ ) : )], [ || : ||], [ ( : (], [ ( : (], [ ( : (], [ id : x], [ ) : )], [ && : &&], [ $ : uint], [ int : 255], [ ) : )], [ << : <<], [ int : 56], [ ) : )], [ ) : )]]
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
;[ function uint32 bitswap32( [[uint32 x @ 8]] ) ]

_uint32_bitswap32_puint32:
push rbp
mov rbp, rsp
sub rsp, 16
;Load Parameter: [uint32 x @ 8]
mov [rbp-8], rdi
;[[ ( : (], [ ( : (], [ ( : (], [ ( : (], [ id : x], [ ) : )], [ && : &&], [ $ : uint32], [ int : 4278190080], [ ) : )], [ >> : >>], [ int : 24], [ ) : )], [ || : ||], [ ( : (], [ ( : (], [ ( : (], [ id : x], [ ) : )], [ && : &&], [ $ : uint32], [ int : 16711680], [ ) : )], [ >> : >>], [ int : 8], [ ) : )], [ || : ||], [ ( : (], [ ( : (], [ ( : (], [ id : x], [ ) : )], [ && : &&], [ $ : uint32], [ int : 65280], [ ) : )], [ << : <<], [ int : 8], [ ) : )], [ || : ||], [ ( : (], [ ( : (], [ ( : (], [ id : x], [ ) : )], [ && : &&], [ $ : uint32], [ int : 255], [ ) : )], [ << : <<], [ int : 24], [ ) : )], [ ) : )]]
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
mov r10, 32
mov rbx, QWORD[rbp-24]
xor rdx, rdx
mov rax, rbx
idiv r10d
mov QWORD[rbp-32], rdx
;[[ ( : (], [ id : bytes], [ - : -], [ id : offset], [ ) : )], [ / : /], [ int : 4]]
mov r10, QWORD[rbp-32]
mov rbx, QWORD[rbp-24]
sub ebx, r10d
sar ebx, 2
mov QWORD[rbp-40], rbx
;[[ int : 0]]
mov QWORD[rbp-48], 0
jmp _LFORCMP_0x1
_LFORTOP_0x0:
;[[ id : i]]
mov r10, QWORD[rbp-48]
mov rbx, r10
shl rbx, 3
add rbx, [rbp-16]
vmovdqu ymm0, [rbx]
;[[ id : i]]
mov r10, QWORD[rbp-48]
mov rbx, r10
shl rbx, 3
add rbx, [rbp-8]
vmovdqu [rbx], ymm0
_LFORUPDATE_0x2:
;[[ id : i]]
;[[ id : i]]
;[[ id : i], [ + : +], [ int : 4]]
mov r10, QWORD[rbp-48]
add r10d, 4
mov QWORD[rbp-48], r10
_LFORCMP_0x1:
;[[ id : i], [ < : <], [ id : avxcount]]
mov r10, QWORD[rbp-40]
mov rbx, QWORD[rbp-48]
cmp ebx, r10d
setl bl
mov rax, rbx
and al, 1
jnz _LFORTOP_0x0
_LFOREND_0x3:
;[[ id : offset], [ != : !=], [ int : 0]]
mov rbx, QWORD[rbp-32]
test ebx, ebx
setnz bl
mov rax, rbx
and al, 1
jz _LIFPOST_0x4
;[[ id : offset]]
mov r10, QWORD[rbp-32]
mov rbx, r10
mov edx, ebx
;[[ id : source], [ + : +], [ id : avxcount]]
mov rbx, QWORD[rbp-40]
mov r10, QWORD[rbp-16]
mov r11, r10
add r11d, ebx
mov rsi, r11
;[[ id : dest], [ + : +], [ id : avxcount]]
mov rbx, QWORD[rbp-40]
mov r10, QWORD[rbp-8]
mov r11, r10
add r11d, ebx
mov rdi, r11
xor rax, rax
call _void_memcpy_pvoid.void.size_t
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
;[ function int sqrt( [[int a @ 8]] ) ]

_int_sqrt_pint:
push rbp
mov rbp, rsp
sub rsp, 16
;Load Parameter: [int a @ 8]
mov [rbp-8], rdi
cvtsi2sd xmm0, rdi
  sqrtsd xmm0, xmm0
  cvttsd2si rax, xmm0
___int_sqrt_pint__return:
leave
ret
;[ function int pow( [[int base @ 8], [int exp @ 16]] ) ]

_int_pow_pintint:
push rbp
mov rbp, rsp
sub rsp, 24
;Load Parameter: [int base @ 8]
mov [rbp-8], rdi
;Load Parameter: [int exp @ 16]
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
;[ function double pow( [[int base @ 8], [int exp @ 16]] ) ]

_double_pow_pintint:
push rbp
mov rbp, rsp
sub rsp, 24
;Load Parameter: [int base @ 8]
mov [rbp-8], rdi
;Load Parameter: [int exp @ 16]
mov [rbp-16], rsi
;[[ id : exp]]
mov r10, QWORD[rbp-16]
mov rbx, r10
mov esi, ebx
;[[ id : base]]
mov r10, QWORD[rbp-8]
mov rbx, r10
mov edi, ebx
xor rax, rax
call _int_pow_pintint
cvtsi2sd xmm0, rax
___double_pow_pintint__return:
leave
ret
;[ function double pow( [[double base @ 8], [int exp @ 16]] ) ]

_double_pow_pdoubleint:
push rbp
mov rbp, rsp
sub rsp, 24
;Load Parameter: [double base @ 8]
movsd [rbp-8], xmm0
;Load Parameter: [int exp @ 16]
mov [rbp-16], rdi
dec rdi
    _double_pow_pdoubleint_flp:
    mulsd xmm0, xmm0
    dec rdi
    jnz _int_pow_pintint_flp
___double_pow_pdoubleint__return:
leave
ret
;[ function int round( [[double x @ 8]] ) ]

_int_round_pdouble:
push rbp
mov rbp, rsp
sub rsp, 16
;Load Parameter: [double x @ 8]
movsd [rbp-8], xmm0
cvtsd2si rax, xmm0
___int_round_pdouble__return:
leave
ret
;[ function int ceil( [[double x @ 8]] ) ]

_int_ceil_pdouble:
push rbp
mov rbp, rsp
sub rsp, 16
;Load Parameter: [double x @ 8]
movsd [rbp-8], xmm0
cvttsd2si rax, xmm0
  inc rax
___int_ceil_pdouble__return:
leave
ret
;[ function int floor( [[double x @ 8]] ) ]

_int_floor_pdouble:
push rbp
mov rbp, rsp
sub rsp, 16
;Load Parameter: [double x @ 8]
movsd [rbp-8], xmm0
cvttsd2si rax, xmm0
___int_floor_pdouble__return:
leave
ret
;[ function int abs( [[int x @ 8]] ) ]

_int_abs_pint:
push rbp
mov rbp, rsp
sub rsp, 16
;Load Parameter: [int x @ 8]
mov [rbp-8], rdi
mov rax, rdi
  sar rdi, 63
  xor rax, rdi
  sub rax, rdi
___int_abs_pint__return:
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
;[ function int log( [[int x @ 8]] ) ]

_int_log_pint:
push rbp
mov rbp, rsp
sub rsp, 16
;Load Parameter: [int x @ 8]
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
;[ function int toStr( [[int val @ 8], [char. buffer @ 16], [bool signed @ 24]] ) ]

_int_toStr_pintchar.bool:
push rbp
mov rbp, rsp
sub rsp, 56
;Load Parameter: [int val @ 8]
mov [rbp-8], rdi
;Load Parameter: [char. buffer @ 16]
mov [rbp-16], rsi
;Load Parameter: [bool signed @ 24]
mov [rbp-24], rdx
;[[ int : 0]]
mov QWORD[rbp-32], 0
;[[ id : val], [ < : <], [ int : 0], [ && : &&], [ id : signed]]
xor r10, r10
mov rbx, QWORD[rbp-8]
cmp ebx, r10d
setl bl
mov r10, QWORD[rbp-24]
and bl, r10b
mov rax, rbx
and al, 1
jz _LIFPOST_0x6
;[[ @ : @], [ id : buffer]]
mov rbx, QWORD[rbp-16]
mov r10, rbx
;[[ @ : @], [ id : buffer]]
mov rbx, QWORD[rbp-16]
mov r10, rbx
;[[ char : 45]]
mov rbx, 45
mov byte[r10], bl
;[[ id : buffer]]
;[[ id : buffer]]
;[[ int : 1]]
mov rbx, 1
mov r10, QWORD[rbp-16]
add r10, rbx
mov QWORD[rbp-16], r10
;[[ id : val]]
;[[ id : val]]
;[[ int : 0], [ - : -], [ id : val]]
mov r11, QWORD[rbp-8]
xor r10, r10
sub r10d, r11d
mov QWORD[rbp-8], r10
;[[ id : signspace]]
;[[ id : signspace]]
;[[ int : 1]]
mov rbx, 1
mov QWORD[rbp-32], rbx
jmp _LIFELSE_0x7
_LIFPOST_0x6:
_LIFELSE_0x7:
;[[ id : val]]
mov r10, QWORD[rbp-8]
mov rbx, r10
mov edi, ebx
xor rax, rax
call _int_log_pint
mov rbx, rax
;[[ fn(x) : [ function int log( [[int x @ 8]] ) ] ], [ + : +], [ int : 1]]
inc ebx
mov QWORD[rbp-40], rbx
;[[ id : buffer]]
;[[ id : buffer]]
;[[ id : l]]
mov rbx, QWORD[rbp-40]
mov r10, QWORD[rbp-16]
add r10, rbx
mov QWORD[rbp-16], r10
;[[ int : 0]]
mov QWORD[rbp-48], 0
jmp _LFORCMP_0x9
_LFORTOP_0x8:
;[[ id : buffer]]
;[[ id : buffer]]
;[[ int : 1]]
mov rbx, 1
mov r10, QWORD[rbp-16]
sub r10, rbx
mov QWORD[rbp-16], r10
;[[ @ : @], [ id : buffer]]
mov rbx, QWORD[rbp-16]
mov r10, rbx
;[[ @ : @], [ id : buffer]]
mov rbx, QWORD[rbp-16]
mov r10, rbx
;[[ $ : char], [ ( : (], [ id : val], [ % : %], [ int : 10], [ ) : )], [ + : +], [ char : 48]]
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
;[[ id : val]]
;[[ id : val]]
;[[ int : 10]]
mov rbx, 10
mov r11, QWORD[rbp-8]
xor rdx, rdx
mov rax,r11
idiv ebx
mov QWORD[rbp-8], rax
_LFORUPDATE_0xa:
;[[ id : i]]
;[[ id : i]]
;[[ int : 1]]
mov rbx, 1
mov r11, QWORD[rbp-48]
add r11d, ebx
mov QWORD[rbp-48], r11
_LFORCMP_0x9:
;[[ id : i], [ < : <], [ id : l]]
mov r10, QWORD[rbp-40]
mov rbx, QWORD[rbp-48]
cmp ebx, r10d
setl bl
mov rax, rbx
and al, 1
jnz _LFORTOP_0x8
_LFOREND_0xb:
;[[ id : l], [ + : +], [ id : signspace]]
mov r10, QWORD[rbp-32]
mov rbx, QWORD[rbp-40]
add ebx, r10d
mov rax, rbx
jmp ___int_toStr_pintchar.bool__return
___int_toStr_pintchar.bool__return:
leave
ret
;[ function int toStr( [[double val @ 8], [char. buffer @ 16], [int multiplier @ 24]] ) ]

_int_toStr_pdoublechar.int:
push rbp
mov rbp, rsp
sub rsp, 48
;Load Parameter: [double val @ 8]
movsd [rbp-8], xmm0
;Load Parameter: [char. buffer @ 16]
mov [rbp-16], rdi
;Load Parameter: [int multiplier @ 24]
mov [rbp-24], rsi
;[[ id : val]]
cvttsd2si rbx, QWORD[rbp-8]
mov QWORD[rbp-32], rbx
;[[ int : 1]]
mov rbx, 1
mov dl, bl
;[[ id : buffer]]
mov rbx, QWORD[rbp-16]
mov rsi, rbx
;[[ id : integral]]
mov r10, QWORD[rbp-32]
mov rbx, r10
mov edi, ebx
xor rax, rax
call _int_toStr_pintchar.bool
;[[ fn(x) : [ function int toStr( [[int val @ 8], [char. buffer @ 16], [bool signed @ 24]] ) ] ]]
mov QWORD[rbp-40], rax
;[[ id : buffer]]
;[[ id : buffer]]
;[[ id : l]]
mov rbx, QWORD[rbp-40]
mov r10, QWORD[rbp-16]
add r10, rbx
mov QWORD[rbp-16], r10
;[[ id : val]]
;[[ id : val]]
;[[ id : val]]
movsd xmm8, QWORD[rbp-8]
movsd xmm0, xmm8
mov rax, 1
call _double_abs_pdouble
movq rax, xmm0
;[[ fn(x) : [ function double abs( [[double x @ 8]] ) ] ]]
movq xmm7, rax
movsd QWORD[rbp-8], xmm7
;[[ id : val]]
;[[ id : val]]
;[[ id : integral]]
cvtsi2sd xmm7, QWORD[rbp-32]
movsd xmm8, QWORD[rbp-8]
subsd xmm8, xmm7
movsd QWORD[rbp-8], xmm8
;[[ id : val]]
;[[ id : val]]
;[[ id : multiplier]]
cvtsi2sd xmm7, QWORD[rbp-24]
movsd xmm8, QWORD[rbp-8]
mulsd xmm8, xmm7
movsd QWORD[rbp-8], xmm8
;[[ @ : @], [ id : buffer]]
mov rbx, QWORD[rbp-16]
mov r10, rbx
;[[ @ : @], [ id : buffer]]
mov rbx, QWORD[rbp-16]
mov r10, rbx
;[[ char : 46]]
mov rbx, 46
mov byte[r10], bl
;[[ id : buffer]]
;[[ id : buffer]]
;[[ int : 1]]
mov rbx, 1
mov r10, QWORD[rbp-16]
add r10, rbx
mov QWORD[rbp-16], r10
;[[ id : l]]
;[[ id : l]]
;[[ int : 0]]
xor r10, r10
mov dl, r10b
;[[ id : buffer]]
mov r10, QWORD[rbp-16]
mov rsi, r10
;[[ id : val]]
movsd xmm7, QWORD[rbp-8]
movsd xmm0, xmm7
mov rax, 1
call _int_round_pdouble
mov r10, rax
;[[ fn(x) : [ function int round( [[double x @ 8]] ) ] ]]
mov edi, r10d
xor rax, rax
call _int_toStr_pintchar.bool
mov rbx, rax
;[[ fn(x) : [ function int toStr( [[int val @ 8], [char. buffer @ 16], [bool signed @ 24]] ) ] ]]
mov r11, QWORD[rbp-40]
add r11d, ebx
mov QWORD[rbp-40], r11
;[[ id : l], [ - : -], [ int : 1]]
mov rbx, QWORD[rbp-40]
dec ebx
mov rax, rbx
jmp ___int_toStr_pdoublechar.int__return
___int_toStr_pdoublechar.int__return:
leave
ret
;[ function int __sprintf( [[char. str @ 8], [char. fmt @ 16], [void. args @ 24]] ) ]

_int___sprintf_pchar.char.void.:
push rbp
mov rbp, rsp
sub rsp, 160
;Load Parameter: [char. str @ 8]
mov [rbp-8], rdi
;Load Parameter: [char. fmt @ 16]
mov [rbp-16], rsi
;Load Parameter: [void. args @ 24]
mov [rbp-24], rdx
;[[ int : 0]]
mov QWORD[rbp-32], 0
;[[ $ : int], [ id : str]]
mov rbx, QWORD[rbp-8]
mov QWORD[rbp-40], rbx
;[[ id : str], [ == : ==], [ int : 0], [ || : ||], [ id : fmt], [ == : ==], [ int : 0]]
mov rbx, QWORD[rbp-8]
test rbx, rbx
setz bl
mov r10, QWORD[rbp-16]
test r10, r10
setz r10b
or bl, r10b
mov rax, rbx
and al, 1
jz _LIFPOST_0xc
;[[ int : 0]]
xor rax, rax
jmp ___int___sprintf_pchar.char.void.__return
jmp _LIFELSE_0xd
_LIFPOST_0xc:
_LIFELSE_0xd:
jmp _LWHILECMP_0xf
_LWHILESTART_0xe:
;[[ @ : @], [ id : fmt], [ != : !=], [ char : 37]]
mov rbx, QWORD[rbp-16]
and r10, 0xff
mov r10b, byte[rbx]
mov rbx, 37
cmp r10b, bl
setne r10b
mov rax, r10
and al, 1
jz _LIFPOST_0x11
;[[ @ : @], [ id : str]]
mov rbx, QWORD[rbp-8]
mov r10, rbx
;[[ @ : @], [ id : str]]
mov rbx, QWORD[rbp-8]
mov r10, rbx
;[[ @ : @], [ id : fmt]]
mov r11, QWORD[rbp-16]
and r12, 0xff
mov r12b, byte[r11]
mov rbx, r12
mov byte[r10], bl
jmp _LIFELSE_0x12
_LIFPOST_0x11:
;[[ id : fmt]]
;[[ id : fmt]]
;[[ int : 1]]
mov rbx, 1
mov r10, QWORD[rbp-16]
add r10, rbx
mov QWORD[rbp-16], r10
;[[ @ : @], [ id : fmt]]
mov rbx, QWORD[rbp-16]
and r10, 0xff
mov r10b, byte[rbx]
mov QWORD[rbp-48], r10
;[[ id : c], [ == : ==], [ char : 105]]
mov r10, 105
mov rbx, QWORD[rbp-48]
cmp bl, r10b
sete bl
mov rax, rbx
and al, 1
jz _LIFPOST_0x13
;[[ ( : (], [ id : args], [ [ : [], [ id : argc], [ ] : ]], [ ) : )]]
mov r10, QWORD[rbp-32]
mov rbx, QWORD[rbp-24]
lea rbx, [rbx+r10*8]
mov rbx, qword[rbx]
mov QWORD[rbp-56], rbx
;[[ int : 1]]
mov rbx, 1
mov dl, bl
;[[ id : str]]
mov rbx, QWORD[rbp-8]
mov rsi, rbx
;[[ id : num]]
mov r10, QWORD[rbp-56]
mov rbx, r10
mov edi, ebx
xor rax, rax
call _int_toStr_pintchar.bool
;[[ fn(x) : [ function int toStr( [[int val @ 8], [char. buffer @ 16], [bool signed @ 24]] ) ] ]]
mov QWORD[rbp-64], rax
;[[ id : str]]
;[[ id : str]]
;[[ id : size], [ - : -], [ int : 1]]
mov r10, QWORD[rbp-64]
dec r10d
mov rbx, r10
mov r10, QWORD[rbp-8]
add r10, rbx
mov QWORD[rbp-8], r10
jmp _LIFELSE_0x14
_LIFPOST_0x13:
;[[ id : c], [ == : ==], [ char : 99]]
mov r10, 99
mov rbx, QWORD[rbp-48]
cmp bl, r10b
sete bl
mov rax, rbx
and al, 1
jz _LIFPOST_0x15
;[[ $ : char], [ id : args], [ [ : [], [ id : argc], [ ] : ]]]
mov r10, QWORD[rbp-32]
mov rbx, QWORD[rbp-24]
lea rbx, [rbx+r10*8]
mov rbx, qword[rbx]
mov QWORD[rbp-72], rbx
;[[ @ : @], [ id : str]]
mov rbx, QWORD[rbp-8]
mov r10, rbx
;[[ @ : @], [ id : str]]
mov rbx, QWORD[rbp-8]
mov r10, rbx
;[[ id : cf]]
mov r11, QWORD[rbp-72]
mov rbx, r11
mov byte[r10], bl
jmp _LIFELSE_0x16
_LIFPOST_0x15:
;[[ id : c], [ == : ==], [ char : 117]]
mov r10, 117
mov rbx, QWORD[rbp-48]
cmp bl, r10b
sete bl
mov rax, rbx
and al, 1
jz _LIFPOST_0x17
;[[ ( : (], [ id : args], [ [ : [], [ id : argc], [ ] : ]], [ ) : )]]
mov r10, QWORD[rbp-32]
mov rbx, QWORD[rbp-24]
lea rbx, [rbx+r10*8]
mov rbx, qword[rbx]
mov QWORD[rbp-80], rbx
;[[ int : 0]]
xor rbx, rbx
mov dl, bl
;[[ id : str]]
mov rbx, QWORD[rbp-8]
mov rsi, rbx
;[[ id : unum]]
mov r10, QWORD[rbp-80]
mov rbx, r10
mov edi, ebx
xor rax, rax
call _int_toStr_pintchar.bool
;[[ fn(x) : [ function int toStr( [[int val @ 8], [char. buffer @ 16], [bool signed @ 24]] ) ] ]]
mov QWORD[rbp-88], rax
;[[ id : str]]
;[[ id : str]]
;[[ id : usize], [ - : -], [ int : 1]]
mov r10, QWORD[rbp-88]
dec r10d
mov rbx, r10
mov r10, QWORD[rbp-8]
add r10, rbx
mov QWORD[rbp-8], r10
jmp _LIFELSE_0x18
_LIFPOST_0x17:
;[[ id : c], [ == : ==], [ char : 115]]
mov r10, 115
mov rbx, QWORD[rbp-48]
cmp bl, r10b
sete bl
mov rax, rbx
and al, 1
jz _LIFPOST_0x19
;[[ id : args], [ [ : [], [ id : argc], [ ] : ]]]
mov r10, QWORD[rbp-32]
mov rbx, QWORD[rbp-24]
lea rbx, [rbx+r10*8]
mov rbx, qword[rbx]
mov rsi, rbx
;[[ id : str]]
mov rbx, QWORD[rbp-8]
mov rdi, rbx
xor rax, rax
call _int_strcpy_pchar.char.
;[[ fn(x) : [ function int strcpy( [[char. dest @ 8], [char. source @ 16]] ) ] ]]
mov QWORD[rbp-96], rax
;[[ id : str]]
;[[ id : str]]
;[[ id : ssize], [ - : -], [ int : 1]]
mov r10, QWORD[rbp-96]
dec r10d
mov rbx, r10
mov r10, QWORD[rbp-8]
add r10, rbx
mov QWORD[rbp-8], r10
jmp _LIFELSE_0x1a
_LIFPOST_0x19:
;[[ id : c], [ == : ==], [ char : 98]]
mov r10, 98
mov rbx, QWORD[rbp-48]
cmp bl, r10b
sete bl
mov rax, rbx
and al, 1
jz _LIFPOST_0x1b
;[[ id : args], [ [ : [], [ id : argc], [ ] : ]]]
mov r10, QWORD[rbp-32]
mov rbx, QWORD[rbp-24]
lea rbx, [rbx+r10*8]
mov rbx, qword[rbx]
mov QWORD[rbp-104], rbx
;[[ id : STRING_CONSTANT_0]]
mov QWORD[rbp-112], STRING_CONSTANT_0
;[[ id : b]]
mov rbx, QWORD[rbp-104]
mov rax, rbx
and al, 1
jz _LIFPOST_0x1d
;[[ id : boolean_string]]
;[[ id : boolean_string]]
;[[ id : STRING_CONSTANT_1]]
mov QWORD[rbp-112], STRING_CONSTANT_1
jmp _LIFELSE_0x1e
_LIFPOST_0x1d:
_LIFELSE_0x1e:
;[[ id : boolean_string]]
mov rbx, QWORD[rbp-112]
mov rsi, rbx
;[[ id : str]]
mov rbx, QWORD[rbp-8]
mov rdi, rbx
xor rax, rax
call _int_strcpy_pchar.char.
;[[ fn(x) : [ function int strcpy( [[char. dest @ 8], [char. source @ 16]] ) ] ]]
mov QWORD[rbp-120], rax
;[[ id : str]]
;[[ id : str]]
;[[ id : bsize]]
mov rbx, QWORD[rbp-120]
mov r10, QWORD[rbp-8]
add r10, rbx
mov QWORD[rbp-8], r10
jmp _LIFELSE_0x1c
_LIFPOST_0x1b:
;[[ id : c], [ == : ==], [ char : 100]]
mov r10, 100
mov rbx, QWORD[rbp-48]
cmp bl, r10b
sete bl
mov rax, rbx
and al, 1
jz _LIFPOST_0x1f
;[[ id : args], [ [ : [], [ id : argc], [ ] : ]]]
mov r10, QWORD[rbp-32]
mov rbx, QWORD[rbp-24]
lea rbx, [rbx+r10*8]
mov rbx, qword[rbx]
movq xmm7, rbx
movsd QWORD[rbp-128], xmm7
;[[ int : 100000000000000]]
mov rbx, 100000000000000
mov esi, ebx
;[[ id : str]]
mov rbx, QWORD[rbp-8]
mov rdi, rbx
;[[ id : d]]
movsd xmm7, QWORD[rbp-128]
movsd xmm0, xmm7
mov rax, 1
call _int_toStr_pdoublechar.int
;[[ fn(x) : [ function int toStr( [[double val @ 8], [char. buffer @ 16], [int multiplier @ 24]] ) ] ]]
mov QWORD[rbp-136], rax
;[[ id : str]]
;[[ id : str]]
;[[ id : dsize], [ - : -], [ int : 1]]
mov r10, QWORD[rbp-136]
dec r10d
mov rbx, r10
mov r10, QWORD[rbp-8]
add r10, rbx
mov QWORD[rbp-8], r10
jmp _LIFELSE_0x20
_LIFPOST_0x1f:
;[[ id : c], [ == : ==], [ char : 102]]
mov r10, 102
mov rbx, QWORD[rbp-48]
cmp bl, r10b
sete bl
mov rax, rbx
and al, 1
jz _LIFPOST_0x21
;[[ id : args], [ [ : [], [ id : argc], [ ] : ]]]
mov r10, QWORD[rbp-32]
mov rbx, QWORD[rbp-24]
lea rbx, [rbx+r10*8]
mov rbx, qword[rbx]
movq xmm7, rbx
movsd QWORD[rbp-144], xmm7
;[[ int : 10000000]]
mov rbx, 10000000
mov esi, ebx
;[[ id : str]]
mov rbx, QWORD[rbp-8]
mov rdi, rbx
;[[ id : f]]
movsd xmm7, QWORD[rbp-144]
movsd xmm0, xmm7
mov rax, 1
call _int_toStr_pdoublechar.int
;[[ fn(x) : [ function int toStr( [[double val @ 8], [char. buffer @ 16], [int multiplier @ 24]] ) ] ]]
mov QWORD[rbp-152], rax
;[[ id : str]]
;[[ id : str]]
;[[ id : fsize], [ - : -], [ int : 1]]
mov r10, QWORD[rbp-152]
dec r10d
mov rbx, r10
mov r10, QWORD[rbp-8]
add r10, rbx
mov QWORD[rbp-8], r10
jmp _LIFELSE_0x22
_LIFPOST_0x21:
_LIFELSE_0x22:
_LIFELSE_0x20:
_LIFELSE_0x1c:
_LIFELSE_0x1a:
_LIFELSE_0x18:
_LIFELSE_0x16:
_LIFELSE_0x14:
;[[ id : argc]]
;[[ id : argc]]
;[[ int : 1]]
mov rbx, 1
mov r11, QWORD[rbp-32]
add r11d, ebx
mov QWORD[rbp-32], r11
_LIFELSE_0x12:
;[[ id : fmt]]
;[[ id : fmt]]
;[[ int : 1]]
mov rbx, 1
mov r10, QWORD[rbp-16]
add r10, rbx
mov QWORD[rbp-16], r10
;[[ id : str]]
;[[ id : str]]
;[[ int : 1]]
mov rbx, 1
mov r10, QWORD[rbp-8]
add r10, rbx
mov QWORD[rbp-8], r10
_LWHILECMP_0xf:
;[[ @ : @], [ id : fmt], [ != : !=], [ int : 0]]
mov rbx, QWORD[rbp-16]
and r10, 0xff
mov r10b, byte[rbx]
test r10b, r10b
setnz r10b
mov rax, r10
and al, 1
jnz _LWHILESTART_0xe
_LWHILEEND_0x10:
;[[ ( : (], [ $ : int], [ id : str], [ ) : )], [ - : -], [ id : og]]
mov rbx, QWORD[rbp-8]
mov r10, rbx
mov rbx, QWORD[rbp-40]
sub r10d, ebx
mov rax, r10
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
mov rbx, 32
mov edi, ebx
xor rax, rax
call _void._malloc_psize_t
;[[ fn(x) : [ function void. malloc( [[size_t size @ 8]] ) ] ]]
mov QWORD[rbp-56], rax
;[[ id : args], [ [ : [], [ int : 0], [ ] : ]]]
mov rbx, QWORD[rbp-56]
;[[ id : args], [ [ : [], [ int : 0], [ ] : ]]]
mov rbx, QWORD[rbp-56]
;[[ id : arg1]]
mov r11, QWORD[rbp-24]
mov qword[rbx], r11
;[[ id : args], [ [ : [], [ int : 1], [ ] : ]]]
mov r10, 1
mov rbx, QWORD[rbp-56]
lea rbx, [rbx+r10*8]
;[[ id : args], [ [ : [], [ int : 1], [ ] : ]]]
mov r10, 1
mov rbx, QWORD[rbp-56]
lea rbx, [rbx+r10*8]
;[[ id : arg2]]
mov r11, QWORD[rbp-32]
mov qword[rbx], r11
;[[ id : args], [ [ : [], [ int : 2], [ ] : ]]]
mov r10, 2
mov rbx, QWORD[rbp-56]
lea rbx, [rbx+r10*8]
;[[ id : args], [ [ : [], [ int : 2], [ ] : ]]]
mov r10, 2
mov rbx, QWORD[rbp-56]
lea rbx, [rbx+r10*8]
;[[ id : arg3]]
mov r11, QWORD[rbp-40]
mov qword[rbx], r11
;[[ id : args], [ [ : [], [ int : 3], [ ] : ]]]
mov r10, 3
mov rbx, QWORD[rbp-56]
lea rbx, [rbx+r10*8]
;[[ id : args], [ [ : [], [ int : 3], [ ] : ]]]
mov r10, 3
mov rbx, QWORD[rbp-56]
lea rbx, [rbx+r10*8]
;[[ id : arg4]]
mov r11, QWORD[rbp-48]
mov qword[rbx], r11
;[[ id : args]]
mov rbx, QWORD[rbp-56]
mov rdx, rbx
;[[ id : fmt]]
mov rbx, QWORD[rbp-16]
mov rsi, rbx
;[[ id : dest]]
mov rbx, QWORD[rbp-8]
mov rdi, rbx
xor rax, rax
call _int___sprintf_pchar.char.void.
;[[ fn(x) : [ function int __sprintf( [[char. str @ 8], [char. fmt @ 16], [void. args @ 24]] ) ] ]]
mov QWORD[rbp-64], rax
;[[ id : args]]
mov rbx, QWORD[rbp-56]
mov rdi, rbx
xor rax, rax
call _void_free_pvoid.
;[[ id : l]]
mov rbx, QWORD[rbp-64]
mov rax, rbx
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
mov r10, 100000
lea rbx, [rbp-100024]
lea rbx, [rbx+r10*1]
;[[ id : normform], [ [ : [], [ int : 100000], [ ] : ]]]
mov r10, 100000
lea rbx, [rbp-100024]
lea rbx, [rbx+r10*1]
;[[ int : 0]]
xor r10, r10
mov byte[rbx], r10b
;[[ id : args]]
mov rbx, QWORD[rbp-16]
mov rdx, rbx
;[[ id : fmt]]
mov rbx, QWORD[rbp-8]
mov rsi, rbx
;[[ & : &], [ id : normform]]
lea rbx, [rbp-100024]
mov rdi, rbx
xor rax, rax
call _int___sprintf_pchar.char.void.
;[[ fn(x) : [ function int __sprintf( [[char. str @ 8], [char. fmt @ 16], [void. args @ 24]] ) ] ]]
mov QWORD[rbp-100032], rax
;[[ id : l]]
mov r10, QWORD[rbp-100032]
mov rbx, r10
mov edx, ebx
;[[ & : &], [ id : normform]]
lea rbx, [rbp-100024]
mov rsi, rbx
;[[ int : 1]]
mov rbx, 1
mov edi, ebx
xor rax, rax
call _ssize_t_write_pfd_tchar.size_t
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
mov rbx, 48
mov edi, ebx
xor rax, rax
call _void._malloc_psize_t
;[[ fn(x) : [ function void. malloc( [[size_t size @ 8]] ) ] ]]
mov QWORD[rbp-56], rax
;[[ id : args], [ [ : [], [ int : 0], [ ] : ]]]
mov rbx, QWORD[rbp-56]
;[[ id : args], [ [ : [], [ int : 0], [ ] : ]]]
mov rbx, QWORD[rbp-56]
;[[ id : arg1]]
mov r11, QWORD[rbp-16]
mov qword[rbx], r11
;[[ id : args], [ [ : [], [ int : 1], [ ] : ]]]
mov r10, 1
mov rbx, QWORD[rbp-56]
lea rbx, [rbx+r10*8]
;[[ id : args], [ [ : [], [ int : 1], [ ] : ]]]
mov r10, 1
mov rbx, QWORD[rbp-56]
lea rbx, [rbx+r10*8]
;[[ id : arg2]]
mov r11, QWORD[rbp-24]
mov qword[rbx], r11
;[[ id : args], [ [ : [], [ int : 2], [ ] : ]]]
mov r10, 2
mov rbx, QWORD[rbp-56]
lea rbx, [rbx+r10*8]
;[[ id : args], [ [ : [], [ int : 2], [ ] : ]]]
mov r10, 2
mov rbx, QWORD[rbp-56]
lea rbx, [rbx+r10*8]
;[[ id : arg3]]
mov r11, QWORD[rbp-32]
mov qword[rbx], r11
;[[ id : args], [ [ : [], [ int : 3], [ ] : ]]]
mov r10, 3
mov rbx, QWORD[rbp-56]
lea rbx, [rbx+r10*8]
;[[ id : args], [ [ : [], [ int : 3], [ ] : ]]]
mov r10, 3
mov rbx, QWORD[rbp-56]
lea rbx, [rbx+r10*8]
;[[ id : arg4]]
mov r11, QWORD[rbp-40]
mov qword[rbx], r11
;[[ id : args], [ [ : [], [ int : 4], [ ] : ]]]
mov r10, 4
mov rbx, QWORD[rbp-56]
lea rbx, [rbx+r10*8]
;[[ id : args], [ [ : [], [ int : 4], [ ] : ]]]
mov r10, 4
mov rbx, QWORD[rbp-56]
lea rbx, [rbx+r10*8]
;[[ id : arg5]]
mov r11, QWORD[rbp-48]
mov qword[rbx], r11
;[[ id : args]]
mov rbx, QWORD[rbp-56]
mov rsi, rbx
;[[ id : fmt]]
mov rbx, QWORD[rbp-8]
mov rdi, rbx
xor rax, rax
call _void___printf_pchar.void.
;[[ id : args]]
mov rbx, QWORD[rbp-56]
mov rdi, rbx
xor rax, rax
call _void_free_pvoid.
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
mov rbx, QWORD[rbp-8]
mov rsi, rbx
;[[ int : 1]]
mov rbx, 1
mov edi, ebx
xor rax, rax
call _int_fputs_pfd_tchar.
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
mov r10, [rand_next]
sal r10d, 13
mov r11, [rand_next]
xor r11d, r10d
mov [rand_next], r11
;[[ id : rand_next]]
;[[ id : rand_next]]
;[[ id : rand_next], [ ^ : ^], [ ( : (], [ id : rand_next], [ >> : >>], [ int : 17], [ ) : )]]
mov r10, [rand_next]
sar r10d, 17
mov r11, [rand_next]
xor r11d, r10d
mov [rand_next], r11
;[[ id : rand_next]]
;[[ id : rand_next]]
;[[ id : rand_next], [ ^ : ^], [ ( : (], [ id : rand_next], [ << : <<], [ int : 5], [ ) : )]]
mov r10, [rand_next]
sal r10d, 5
mov r11, [rand_next]
xor r11d, r10d
mov [rand_next], r11
;[[ id : rand_next]]
mov rbx, [rand_next]
mov rax, rbx
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
mov [rand_next], rax
;[[ fn(x) : [ function int rdrand( [] ) ] ]]
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
;[ function int inet_aton( [[char. cp @ 8], [in_addr. addr @ 16]] ) ]

_int_inet_aton_pchar.in_addr.:
push rbp
mov rbp, rsp
sub rsp, 88
;Load Parameter: [char. cp @ 8]
mov [rbp-8], rdi
;Load Parameter: [in_addr. addr @ 16]
mov [rbp-16], rsi
;[[ int : 10]]
mov QWORD[rbp-32], 10
;[[ int : 4]]
mov rbx, 4
mov edx, ebx
;[[ int : 0]]
xor rbx, rbx
mov sil, bl
;[[ & : &], [ id : parts]]
lea rbx, [rbp-72]
mov rdi, rbx
xor rax, rax
call _void_memset_pvoid.ucharsize_t
;[[ & : &], [ id : parts]]
lea rbx, [rbp-72]
mov QWORD[rbp-80], rbx
;[[ id : c]]
;[[ id : c]]
;[[ @ : @], [ id : cp]]
mov r10, QWORD[rbp-8]
and r11, 0xff
mov r11b, byte[r10]
mov QWORD[rbp-48], r11
jmp _LWHILECMP_0x24
_LWHILESTART_0x23:
;[[ id : val]]
;[[ id : val]]
;[[ int : 0]]
xor rbx, rbx
mov QWORD[rbp-24], rbx
jmp _LWHILECMP_0x27
_LWHILESTART_0x26:
;[[ id : c]]
mov r10, QWORD[rbp-48]
mov rbx, r10
mov dil, bl
xor rax, rax
call _bool_isdigit_pchar
;[[ fn(x) : [ function bool isdigit( [[char c @ 8]] ) ] ]]
and al, 1
jz _LIFPOST_0x29
;[[ id : val]]
;[[ id : val]]
;[[ ( : (], [ id : val], [ * : *], [ id : base], [ ) : )], [ + : +], [ ( : (], [ id : c], [ - : -], [ char : 48], [ ) : )]]
mov r10, QWORD[rbp-32]
mov r11, QWORD[rbp-24]
mov r12, r11
imul r12d, r10d
mov r10, QWORD[rbp-48]
sub r10b, 48
mov r11, r10
add r12d, r11d
mov QWORD[rbp-24], r12
;[[ id : cp]]
;[[ id : cp]]
;[[ int : 1]]
mov rbx, 1
mov r10, QWORD[rbp-8]
add r10, rbx
mov QWORD[rbp-8], r10
;[[ id : c]]
;[[ id : c]]
;[[ @ : @], [ id : cp]]
mov r10, QWORD[rbp-8]
and r11, 0xff
mov r11b, byte[r10]
mov QWORD[rbp-48], r11
jmp _LIFELSE_0x2a
_LIFPOST_0x29:
jmp _LWHILEEND_0x28
_LIFELSE_0x2a:
_LWHILECMP_0x27:
;[[ $ : bool], [ int : 1]]
mov rbx, 1
mov r10, rbx
mov rax, r10
and al, 1
jnz _LWHILESTART_0x26
_LWHILEEND_0x28:
;[[ id : c], [ == : ==], [ char : 46]]
mov r10, 46
mov rbx, QWORD[rbp-48]
cmp bl, r10b
sete bl
mov rax, rbx
and al, 1
jz _LIFPOST_0x2b
;[[ id : pp], [ > : >], [ ( : (], [ id : parts], [ + : +], [ int : 4], [ * : *], [ id : int], [ ) : )]]
lea rbx, [rbp-72]
add ebx, 16
mov r10, QWORD[rbp-80]
mov r11, r10
cmp r11d, ebx
seta r11b
mov rax, r11
and al, 1
jz _LIFPOST_0x2d
;[[ int : 0]]
xor rax, rax
jmp ___int_inet_aton_pchar.in_addr.__return
jmp _LIFELSE_0x2e
_LIFPOST_0x2d:
_LIFELSE_0x2e:
;[[ @ : @], [ id : pp]]
mov rbx, QWORD[rbp-80]
mov r10, rbx
;[[ @ : @], [ id : pp]]
mov rbx, QWORD[rbp-80]
mov r10, rbx
;[[ id : val]]
mov rbx, QWORD[rbp-24]
mov dword[r10], ebx
;[[ id : pp]]
;[[ id : pp]]
;[[ id : int]]
mov rbx, 4
mov r10, QWORD[rbp-80]
add r10, rbx
mov QWORD[rbp-80], r10
;[[ id : cp]]
;[[ id : cp]]
;[[ int : 1]]
mov rbx, 1
mov r10, QWORD[rbp-8]
add r10, rbx
mov QWORD[rbp-8], r10
;[[ id : c]]
;[[ id : c]]
;[[ @ : @], [ id : cp]]
mov r10, QWORD[rbp-8]
and r11, 0xff
mov r11b, byte[r10]
mov QWORD[rbp-48], r11
jmp _LIFELSE_0x2c
_LIFPOST_0x2b:
jmp _LWHILEEND_0x25
_LIFELSE_0x2c:
_LWHILECMP_0x24:
;[[ $ : bool], [ int : 1]]
mov rbx, 1
mov r10, rbx
mov rax, r10
and al, 1
jnz _LWHILESTART_0x23
_LWHILEEND_0x25:
;[[ @ : @], [ id : pp]]
mov rbx, QWORD[rbp-80]
mov r10, rbx
;[[ @ : @], [ id : pp]]
mov rbx, QWORD[rbp-80]
mov r10, rbx
;[[ id : val]]
mov rbx, QWORD[rbp-24]
mov dword[r10], ebx
;[[ id : c], [ != : !=], [ int : 0], [ && : &&], [ id : c], [ != : !=], [ char : 32]]
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
jz _LIFPOST_0x2f
;[[ int : 0]]
xor rax, rax
jmp ___int_inet_aton_pchar.in_addr.__return
jmp _LIFELSE_0x30
_LIFPOST_0x2f:
_LIFELSE_0x30:
;[[ id : val]]
;[[ id : val]]
;[[ id : val], [ || : ||], [ ( : (], [ ( : (], [ id : parts], [ [ : [], [ int : 0], [ ] : ]], [ << : <<], [ int : 24], [ ) : )], [ || : ||], [ ( : (], [ id : parts], [ [ : [], [ int : 1], [ ] : ]], [ << : <<], [ int : 16], [ ) : )], [ || : ||], [ ( : (], [ id : parts], [ [ : [], [ int : 2], [ ] : ]], [ << : <<], [ int : 8], [ ) : )], [ ) : )]]
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
mov QWORD[rbp-24], r12
;[[ @ : @], [ id : addr]]
mov rbx, QWORD[rbp-16]
mov r10, rbx
;[[ @ : @], [ id : addr]]
mov rbx, QWORD[rbp-16]
mov r10, rbx
;[[ id : val]]
mov r11, QWORD[rbp-24]
mov rbx, r11
mov word[r10], bx
;[[ int : 1]]
mov rax, 1
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
;[[ int : 0]]
mov QWORD[rbp-32], 0
;[[ int : 0]]
mov QWORD[rbp-40], 0
;[[ id : modehash], [ == : ==], [ int : 114]]
mov r10, 114
mov rbx, QWORD[rbp-24]
cmp ebx, r10d
sete bl
mov rax, rbx
and al, 1
jz _LIFPOST_0x31
;[[ id : f]]
;[[ id : f]]
;[[ int : 0]]
xor rbx, rbx
mov QWORD[rbp-40], rbx
jmp _LIFELSE_0x32
_LIFPOST_0x31:
;[[ id : modehash], [ == : ==], [ int : 119]]
mov r10, 119
mov rbx, QWORD[rbp-24]
cmp ebx, r10d
sete bl
mov rax, rbx
and al, 1
jz _LIFPOST_0x33
;[[ id : f]]
;[[ id : f]]
;[[ int : 1]]
mov rbx, 1
mov QWORD[rbp-40], rbx
jmp _LIFELSE_0x34
_LIFPOST_0x33:
;[[ id : modehash], [ == : ==], [ int : 97]]
mov r10, 97
mov rbx, QWORD[rbp-24]
cmp ebx, r10d
sete bl
mov rax, rbx
and al, 1
jz _LIFPOST_0x35
;[[ id : f]]
;[[ id : f]]
;[[ int : 1], [ || : ||], [ int : 8]]
mov rbx, 1
mov QWORD[rbp-40], rbx
jmp _LIFELSE_0x36
_LIFPOST_0x35:
;[[ id : modehash], [ == : ==], [ int : 157]]
mov r10, 157
mov rbx, QWORD[rbp-24]
cmp ebx, r10d
sete bl
mov rax, rbx
and al, 1
jz _LIFPOST_0x37
;[[ id : f]]
;[[ id : f]]
;[[ int : 2]]
mov rbx, 2
mov QWORD[rbp-40], rbx
jmp _LIFELSE_0x38
_LIFPOST_0x37:
;[[ id : modehash], [ == : ==], [ int : 162]]
mov r10, 162
mov rbx, QWORD[rbp-24]
cmp ebx, r10d
sete bl
mov rax, rbx
and al, 1
jz _LIFPOST_0x39
;[[ id : m]]
;[[ id : m]]
;[[ int : 1792]]
mov rbx, 1792
mov QWORD[rbp-32], rbx
;[[ id : f]]
;[[ id : f]]
;[[ int : 2], [ || : ||], [ int : 64]]
mov rbx, 2
mov QWORD[rbp-40], rbx
jmp _LIFELSE_0x3a
_LIFPOST_0x39:
;[[ id : m]]
;[[ id : m]]
;[[ int : 1792]]
mov rbx, 1792
mov QWORD[rbp-32], rbx
;[[ id : f]]
;[[ id : f]]
;[[ int : 2], [ || : ||], [ int : 8], [ || : ||], [ int : 64]]
mov rbx, 2
mov QWORD[rbp-40], rbx
_LIFELSE_0x3a:
_LIFELSE_0x38:
_LIFELSE_0x36:
_LIFELSE_0x34:
_LIFELSE_0x32:
;[[ id : m]]
mov r10, QWORD[rbp-32]
mov rbx, r10
mov edx, ebx
;[[ id : f]]
mov r10, QWORD[rbp-40]
mov rbx, r10
mov esi, ebx
;[[ id : fname]]
mov rbx, QWORD[rbp-8]
mov rdi, rbx
xor rax, rax
call _fd_t_open_pchar.intmode_t
;[[ fn(x) : [ function fd_t open( [[char. fname @ 0], [int flags @ 0], [mode_t mode @ 0]] ) ] ]]
mov QWORD[rbp-48], rax
;[[ id : modehash], [ == : ==], [ int : 140], [ || : ||], [ id : modehash], [ == : ==], [ int : 87]]
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
jz _LIFPOST_0x3b
;[[ int : 2]]
mov rbx, 2
mov edx, ebx
;[[ int : 0]]
xor rbx, rbx
mov esi, ebx
;[[ id : out]]
mov r10, QWORD[rbp-48]
mov rbx, r10
mov edi, ebx
xor rax, rax
call _int_lseek_pfd_tintint
jmp _LIFELSE_0x3c
_LIFPOST_0x3b:
_LIFELSE_0x3c:
;[[ id : out]]
mov rax, QWORD[rbp-48]
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
mov rbx, QWORD[rbp-16]
mov rdi, rbx
xor rax, rax
call _size_t_strlen_pchar.
;[[ fn(x) : [ function size_t strlen( [[char. str @ 8]] ) ] ]]
mov QWORD[rbp-24], rax
;[[ id : l]]
mov r10, QWORD[rbp-24]
mov rbx, r10
mov edx, ebx
;[[ id : text]]
mov rbx, QWORD[rbp-16]
mov rsi, rbx
;[[ id : fd]]
mov r10, QWORD[rbp-8]
mov rbx, r10
mov edi, ebx
xor rax, rax
call _ssize_t_write_pfd_tchar.size_t
;[[ fn(x) : [ function ssize_t write( [[fd_t fd @ 0], [char. buf @ 0], [size_t count @ 0]] ) ] ]]
mov QWORD[rbp-32], rax
;[[ int : 1]]
mov rbx, 1
mov edx, ebx
;[[ id : l]]
mov r10, QWORD[rbp-24]
mov rbx, r10
mov esi, ebx
;[[ id : fd]]
mov r10, QWORD[rbp-8]
mov rbx, r10
mov edi, ebx
xor rax, rax
call _int_lseek_pfd_tintint
;[[ id : out]]
mov rbx, QWORD[rbp-32]
mov rax, rbx
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
mov r10, QWORD[rbp-24]
mov rbx, r10
mov edx, ebx
;[[ id : buffer]]
mov rbx, QWORD[rbp-16]
mov rsi, rbx
;[[ id : fd]]
mov r10, QWORD[rbp-8]
mov rbx, r10
mov edi, ebx
xor rax, rax
call _ssize_t_read_pfd_tchar.size_t
push rax
;[[ fn(x) : [ function ssize_t read( [[fd_t fd @ 0], [char. buf @ 0], [size_t count @ 0]] ) ] ], [ > : >], [ int : 0]]
xor r10, r10
pop rbx
cmp ebx, r10d
setg bl
mov QWORD[rbp-32], rbx
;[[ int : 1]]
mov rbx, 1
mov edx, ebx
;[[ id : amt]]
mov r10, QWORD[rbp-24]
mov rbx, r10
mov esi, ebx
;[[ id : fd]]
mov r10, QWORD[rbp-8]
mov rbx, r10
mov edi, ebx
xor rax, rax
call _int_lseek_pfd_tintint
;[[ id : out]]
mov rax, QWORD[rbp-32]
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
mov rbx, 2
mov edx, ebx
;[[ int : 0]]
xor rbx, rbx
mov esi, ebx
;[[ id : fd]]
mov r10, QWORD[rbp-8]
mov rbx, r10
mov edi, ebx
xor rax, rax
call _int_lseek_pfd_tintint
;[[ fn(x) : [ function int lseek( [[fd_t fd @ 0], [int offset @ 0], [int whence @ 0]] ) ] ]]
mov QWORD[rbp-16], rax
;[[ int : 2]]
mov rbx, 2
mov edx, ebx
;[[ int : 0], [ - : -], [ id : fsize]]
mov r11, QWORD[rbp-16]
xor r10, r10
sub r10d, r11d
mov rbx, r10
mov esi, ebx
;[[ id : fd]]
mov r10, QWORD[rbp-8]
mov rbx, r10
mov edi, ebx
xor rax, rax
call _int_lseek_pfd_tintint
;[[ id : fsize]]
mov r10, QWORD[rbp-16]
mov rbx, r10
mov edi, ebx
xor rax, rax
call _void._malloc_psize_t
;[[ fn(x) : [ function void. malloc( [[size_t size @ 8]] ) ] ]]
mov QWORD[rbp-24], rax
;[[ id : fsize]]
mov r10, QWORD[rbp-16]
mov rbx, r10
mov edx, ebx
;[[ id : buffer]]
mov rbx, QWORD[rbp-24]
mov rsi, rbx
;[[ id : fd]]
mov r10, QWORD[rbp-8]
mov rbx, r10
mov edi, ebx
xor rax, rax
call _ssize_t_read_pfd_tchar.size_t
push rax
;[[ fn(x) : [ function ssize_t read( [[fd_t fd @ 0], [char. buf @ 0], [size_t count @ 0]] ) ] ], [ < : <], [ int : 0]]
xor r10, r10
pop rbx
cmp ebx, r10d
setl bl
mov QWORD[rbp-32], rbx
;[[ id : out]]
mov rbx, QWORD[rbp-32]
mov rax, rbx
and al, 1
jz _LIFPOST_0x3d
;[[ int : 0]]
xor rax, rax
jmp ___void._floads_pfd_t__return
jmp _LIFELSE_0x3e
_LIFPOST_0x3d:
_LIFELSE_0x3e:
;[[ id : buffer]]
mov rax, QWORD[rbp-24]
jmp ___void._floads_pfd_t__return
___void._floads_pfd_t__return:
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
mov rbx, QWORD[rbp-8]
mov rdi, rbx
xor rax, rax
call _void_printf_pchar.
;[[ int : 40]]
mov rbx, 40
mov edx, ebx
;[[ int : 0]]
xor rbx, rbx
mov sil, bl
;[[ & : &], [ id : buff]]
lea rbx, [rbp-56]
mov rdi, rbx
xor rax, rax
call _void_memset_pvoid.ucharsize_t
;[[ int : 40]]
mov rbx, 40
mov edx, ebx
;[[ & : &], [ id : buff]]
lea rbx, [rbp-56]
mov rsi, rbx
;[[ int : 0]]
xor rbx, rbx
mov edi, ebx
xor rax, rax
call _bool_fgets_pfd_tchar.size_t
;[[ $ : bool], [ int : 1]]
mov r10, 1
mov r11, r10
mov rbx, r11
mov sil, bl
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
mov rbx, QWORD[rbp-8]
mov rdi, rbx
xor rax, rax
call _void_printf_pchar.
;[[ int : 40]]
mov rbx, 40
mov edx, ebx
;[[ int : 0]]
xor rbx, rbx
mov sil, bl
;[[ & : &], [ id : buff]]
lea rbx, [rbp-56]
mov rdi, rbx
xor rax, rax
call _void_memset_pvoid.ucharsize_t
;[[ int : 40]]
mov rbx, 40
mov edx, ebx
;[[ & : &], [ id : buff]]
lea rbx, [rbp-56]
mov rsi, rbx
;[[ int : 0]]
xor rbx, rbx
mov edi, ebx
xor rax, rax
call _bool_fgets_pfd_tchar.size_t
;[[ $ : bool], [ int : 1]]
mov r10, 1
mov r11, r10
mov rbx, r11
mov sil, bl
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
mov rbx, 1
mov edx, ebx
;[[ & : &], [ id : c]]
lea rbx, [rbp-8]
mov rsi, rbx
;[[ int : 0]]
xor rbx, rbx
mov edi, ebx
xor rax, rax
call _bool_fgets_pfd_tchar.size_t
;[[ id : c]]
mov rax, QWORD[rbp-8]
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
mov rbx, QWORD[rbp-24]
mov rdi, rbx
xor rax, rax
call _void_printf_pchar.
;[[ id : maxlen]]
mov r10, QWORD[rbp-16]
mov rbx, r10
mov edx, ebx
;[[ id : buffer]]
mov rbx, QWORD[rbp-8]
mov rsi, rbx
;[[ int : 0]]
xor rbx, rbx
mov edi, ebx
xor rax, rax
call _bool_fgets_pfd_tchar.size_t
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
mov QWORD[rbp-16], 80
;[[ id : size]]
mov r10, QWORD[rbp-16]
mov rbx, r10
mov edi, ebx
xor rax, rax
call _void._malloc_psize_t
;[[ fn(x) : [ function void. malloc( [[size_t size @ 8]] ) ] ]]
mov QWORD[rbp-24], rax
;[[ int : 0]]
mov QWORD[rbp-40], 0
;[[ id : msg]]
mov rsi, QWORD[rbp-8]
;[[ id : STRING_CONSTANT_2]]
mov rbx, STRING_CONSTANT_2
mov rdi, rbx
xor rax, rax
call printf
;[[ int : 1]]
mov rbx, 1
mov edx, ebx
;[[ & : &], [ id : c]]
lea rbx, [rbp-32]
mov rsi, rbx
;[[ int : 0]]
xor rbx, rbx
mov edi, ebx
xor rax, rax
call _bool_fgets_pfd_tchar.size_t
jmp _LWHILECMP_0x40
_LWHILESTART_0x3f:
;[[ id : len], [ == : ==], [ id : size]]
mov r10, QWORD[rbp-16]
mov rbx, QWORD[rbp-40]
cmp ebx, r10d
sete bl
mov rax, rbx
and al, 1
jz _LIFPOST_0x42
;[[ id : size]]
;[[ id : size]]
;[[ id : size], [ * : *], [ int : 2]]
mov r10, QWORD[rbp-16]
sal r10d, 1
mov QWORD[rbp-16], r10
;[[ id : str]]
;[[ id : str]]
;[[ id : size]]
mov r11, QWORD[rbp-16]
mov r10, r11
mov esi, r10d
;[[ id : str]]
mov rdi, QWORD[rbp-24]
xor rax, rax
call _void._realloc_pvoid.size_t
mov QWORD[rbp-24], rax
;[[ fn(x) : [ function void. realloc( [[void. og @ 8], [size_t newsize @ 16]] ) ] ]]
jmp _LIFELSE_0x43
_LIFPOST_0x42:
_LIFELSE_0x43:
;[[ id : str], [ [ : [], [ id : len], [ ] : ]]]
mov r10, QWORD[rbp-40]
mov rbx, QWORD[rbp-24]
lea rbx, [rbx+r10*1]
;[[ id : str], [ [ : [], [ id : len], [ ] : ]]]
mov r10, QWORD[rbp-40]
mov rbx, QWORD[rbp-24]
lea rbx, [rbx+r10*1]
;[[ id : c]]
mov r10, QWORD[rbp-32]
mov byte[rbx], r10b
;[[ int : 1]]
mov rbx, 1
mov edx, ebx
;[[ & : &], [ id : c]]
lea rbx, [rbp-32]
mov rsi, rbx
;[[ int : 0]]
xor rbx, rbx
mov edi, ebx
xor rax, rax
call _bool_fgets_pfd_tchar.size_t
;[[ id : len]]
;[[ id : len]]
;[[ id : len], [ + : +], [ int : 1]]
mov r10, QWORD[rbp-40]
inc r10d
mov QWORD[rbp-40], r10
_LWHILECMP_0x40:
;[[ id : c], [ != : !=], [ int : 10]]
mov r10, 10
mov rbx, QWORD[rbp-32]
cmp ebx, r10d
setne bl
mov rax, rbx
and al, 1
jnz _LWHILESTART_0x3f
_LWHILEEND_0x41:
;[[ id : str], [ [ : [], [ id : len], [ + : +], [ int : 1], [ ] : ]]]
mov rbx, QWORD[rbp-40]
inc ebx
mov r10, QWORD[rbp-24]
lea r10, [r10+rbx*1]
;[[ id : str], [ [ : [], [ id : len], [ + : +], [ int : 1], [ ] : ]]]
mov rbx, QWORD[rbp-40]
inc ebx
mov r10, QWORD[rbp-24]
lea r10, [r10+rbx*1]
;[[ int : 0]]
xor rbx, rbx
mov byte[r10], bl
;[[ id : len]]
mov r10, QWORD[rbp-40]
mov rbx, r10
mov esi, ebx
;[[ id : str]]
mov rdi, QWORD[rbp-24]
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
jmp _LWHILECMP_0x45
_LWHILESTART_0x44:
;[[ id : str]]
;[[ id : str]]
;[[ int : 1]]
mov rbx, 1
mov r10, QWORD[rbp-8]
add r10, rbx
mov QWORD[rbp-8], r10
_LWHILECMP_0x45:
;[[ @ : @], [ id : str], [ == : ==], [ char : 32]]
mov rbx, QWORD[rbp-8]
and r10, 0xff
mov r10b, byte[rbx]
mov rbx, 32
cmp r10b, bl
sete r10b
mov rax, r10
and al, 1
jnz _LWHILESTART_0x44
_LWHILEEND_0x46:
;[[ $ : char], [ ( : (], [ @ : @], [ id : str], [ ) : )]]
mov rbx, QWORD[rbp-8]
and r10, 0xff
mov r10b, byte[rbx]
mov QWORD[rbp-24], r10
;[[ int : 0]]
mov QWORD[rbp-32], 0
;[[ $ : bool], [ int : 0]]
xor rbx, rbx
mov QWORD[rbp-40], rbx
;[[ id : c], [ == : ==], [ char : 45], [ && : &&], [ id : signed]]
mov r10, 45
mov rbx, QWORD[rbp-24]
cmp bl, r10b
sete bl
mov r10, QWORD[rbp-16]
and bl, r10b
mov rax, rbx
and al, 1
jz _LIFPOST_0x47
;[[ id : negative]]
;[[ id : negative]]
;[[ $ : bool], [ int : 1]]
mov r10, 1
mov QWORD[rbp-40], r10
;[[ id : str]]
;[[ id : str]]
;[[ int : 1]]
mov rbx, 1
mov r10, QWORD[rbp-8]
add r10, rbx
mov QWORD[rbp-8], r10
;[[ id : c]]
;[[ id : c]]
;[[ $ : char], [ ( : (], [ @ : @], [ id : str], [ ) : )]]
mov r10, QWORD[rbp-8]
and r11, 0xff
mov r11b, byte[r10]
mov QWORD[rbp-24], r11
jmp _LIFELSE_0x48
_LIFPOST_0x47:
_LIFELSE_0x48:
jmp _LWHILECMP_0x4a
_LWHILESTART_0x49:
;[[ id : val]]
;[[ id : val]]
;[[ ( : (], [ id : val], [ * : *], [ int : 10], [ ) : )], [ + : +], [ ( : (], [ id : c], [ - : -], [ char : 48], [ ) : )]]
mov r11, 10
mov r10, QWORD[rbp-32]
imul r10d, r11d
mov r11, QWORD[rbp-24]
sub r11b, 48
mov r12, r11
add r10d, r12d
mov QWORD[rbp-32], r10
;[[ id : str]]
;[[ id : str]]
;[[ int : 1]]
mov rbx, 1
mov r10, QWORD[rbp-8]
add r10, rbx
mov QWORD[rbp-8], r10
;[[ id : c]]
;[[ id : c]]
;[[ $ : char], [ ( : (], [ @ : @], [ id : str], [ ) : )]]
mov r10, QWORD[rbp-8]
and r11, 0xff
mov r11b, byte[r10]
mov QWORD[rbp-24], r11
_LWHILECMP_0x4a:
;[[ id : c], [ != : !=], [ int : 0], [ && : &&], [ id : c], [ != : !=], [ int : 10], [ && : &&], [ id : c], [ != : !=], [ char : 32]]
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
jnz _LWHILESTART_0x49
_LWHILEEND_0x4b:
;[[ id : negative]]
mov rbx, QWORD[rbp-40]
mov rax, rbx
and al, 1
jz _LIFPOST_0x4c
;[[ int : 0], [ - : -], [ id : val]]
mov r10, QWORD[rbp-32]
xor rbx, rbx
sub ebx, r10d
mov rax, rbx
jmp ___int_toInteger_pchar.bool__return
jmp _LIFELSE_0x4d
_LIFPOST_0x4c:
_LIFELSE_0x4d:
;[[ id : val]]
mov rbx, QWORD[rbp-32]
mov rax, rbx
jmp ___int_toInteger_pchar.bool__return
___int_toInteger_pchar.bool__return:
leave
ret
;[ function void iVec3d( [[Vec3d. this @ 8], [double a @ 16], [double b @ 24], [double c @ 32]] ) ]

_void_iVec3d_pVec3d.doubledoubledouble:
push rbp
mov rbp, rsp
sub rsp, 40
;Load Parameter: [Vec3d. this @ 8]
mov [rbp-8], rdi
;Load Parameter: [double a @ 16]
movsd [rbp-16], xmm0
;Load Parameter: [double b @ 24]
movsd [rbp-24], xmm1
;Load Parameter: [double c @ 32]
movsd [rbp-32], xmm2
;[[ id : this], [ -> : ->], [ id : x]]
mov rbx, QWORD[rbp-8]
;[[ id : this], [ -> : ->], [ id : x]]
mov rbx, QWORD[rbp-8]
;[[ id : a]]
movsd xmm8, QWORD[rbp-16]
movsd xmm7, xmm8
movq qword[rbx], xmm7
;[[ id : this], [ -> : ->], [ id : y]]
mov rbx, QWORD[rbp-8]
lea rbx, [rbx+8]
;[[ id : this], [ -> : ->], [ id : y]]
mov rbx, QWORD[rbp-8]
lea rbx, [rbx+8]
;[[ id : b]]
movsd xmm8, QWORD[rbp-24]
movsd xmm7, xmm8
movq qword[rbx], xmm7
;[[ id : this], [ -> : ->], [ id : z]]
mov rbx, QWORD[rbp-8]
lea rbx, [rbx+16]
;[[ id : this], [ -> : ->], [ id : z]]
mov rbx, QWORD[rbp-8]
lea rbx, [rbx+16]
;[[ id : c]]
movsd xmm8, QWORD[rbp-32]
movsd xmm7, xmm8
movq qword[rbx], xmm7
___void_iVec3d_pVec3d.doubledoubledouble__return:
leave
ret
;[ function void v3dadd( [[Vec3d. dest @ 8], [Vec3d. other @ 16]] ) ]

_void_v3dadd_pVec3d.Vec3d.:
push rbp
mov rbp, rsp
sub rsp, 24
;Load Parameter: [Vec3d. dest @ 8]
mov [rbp-8], rdi
;Load Parameter: [Vec3d. other @ 16]
mov [rbp-16], rsi
;[[ int : 0]]
xor rbx, rbx
shl rbx, 3
add rbx, [rbp-8]
vmovdqu ymm0, [rbx]
;[[ int : 0]]
xor r10, r10
shl r10, 3
add r10, [rbp-16]
vmovdqu ymm1, [r10]
vaddpd ymm0, ymm1, ymm0
;[[ int : 0]]
xor rbx, rbx
shl rbx, 3
add rbx, [rbp-8]
vmovdqu [rbx], ymm0
___void_v3dadd_pVec3d.Vec3d.__return:
leave
ret
;[ function void v3dsub( [[Vec3d. dest @ 8], [Vec3d. other @ 16]] ) ]

_void_v3dsub_pVec3d.Vec3d.:
push rbp
mov rbp, rsp
sub rsp, 24
;Load Parameter: [Vec3d. dest @ 8]
mov [rbp-8], rdi
;Load Parameter: [Vec3d. other @ 16]
mov [rbp-16], rsi
;[[ int : 0]]
xor rbx, rbx
shl rbx, 3
add rbx, [rbp-8]
vmovdqu ymm0, [rbx]
;[[ int : 0]]
xor r10, r10
shl r10, 3
add r10, [rbp-16]
vmovdqu ymm1, [r10]
vsubpd ymm0, ymm1, ymm0
;[[ int : 0]]
xor rbx, rbx
shl rbx, 3
add rbx, [rbp-8]
vmovdqu [rbx], ymm0
___void_v3dsub_pVec3d.Vec3d.__return:
leave
ret
;[ function void v3dcross( [[Vec3d. dest @ 8], [Vec3d. other @ 16]] ) ]

_void_v3dcross_pVec3d.Vec3d.:
push rbp
mov rbp, rsp
sub rsp, 24
;Load Parameter: [Vec3d. dest @ 8]
mov [rbp-8], rdi
;Load Parameter: [Vec3d. other @ 16]
mov [rbp-16], rsi
;[[ int : 0]]
xor rbx, rbx
shl rbx, 3
add rbx, [rbp-8]
vmovdqu ymm0, [rbx]
;[[ int : 0]]
xor r10, r10
shl r10, 3
add r10, [rbp-16]
vmovdqu ymm1, [r10]
vmulpd ymm0, ymm1, ymm0
;[[ int : 0]]
xor rbx, rbx
shl rbx, 3
add rbx, [rbp-8]
vmovdqu [rbx], ymm0
___void_v3dcross_pVec3d.Vec3d.__return:
leave
ret
;[ function int bruh( [[int a @ 8]] ) ]

_int_bruh_pint:
push rbp
mov rbp, rsp
sub rsp, 16
;Load Parameter: [int a @ 8]
mov [rbp-8], rdi
;[[ id : a], [ * : *], [ int : 6]]
mov r10, 6
mov rbx, QWORD[rbp-8]
imul ebx, r10d
mov rax, rbx
jmp ___int_bruh_pint__return
___int_bruh_pint__return:
leave
ret
;[ function int main( [[int argc @ 8], [char.. argv @ 16]] ) ]

main:
push rbp
mov rbp, rsp
sub rsp, 24
;Load Parameter: [int argc @ 8]
mov [rbp-8], rdi
;Load Parameter: [char.. argv @ 16]
mov [rbp-16], rsi
;[[ id : argc]]
mov r10, QWORD[rbp-8]
mov rbx, r10
mov edi, ebx
xor rax, rax
call _int_bruh_pint
mov rsi, rax
;[[ fn(x) : [ function int bruh( [[int a @ 8]] ) ] ]]
;[[ id : STRING_CONSTANT_3]]
mov rbx, STRING_CONSTANT_3
mov rdi, rbx
xor rax, rax
call printf
;[[ int : 5]]
mov rax, 5
jmp __main__return
__main__return:
leave
ret
