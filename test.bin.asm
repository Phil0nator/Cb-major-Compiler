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
CEXTERN inet_aton
CEXTERN htonl
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
global _double_sqrt_pdouble
global _double_sqrt_pint
global _int_sqrt_pint
global _int_pow_pintint
global _double_pow_pintint
global _double_pow_pdoubleint
global _double_pow_pdoubledouble
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
extern print
section .data
    FLT_CONSTANT_0: dq 0x0.0p+0
STRING_CONSTANT_0: db `True`, 0
STRING_CONSTANT_1: db `False`, 0
STRING_CONSTANT_2: db `%s`, 0
STRING_CONSTANT_3: db `The int: %i , the double: %f, a string: %s, and a bool %b.`, 0
STRING_CONSTANT_4: db `Hello World!`, 0
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

;[ function int bitswap64( [[ Variable: int x @ 8]] ) ]

_int_bitswap64_pint:
push rbp
mov rbp, rsp
sub rsp, 16
;Load Parameter: [ Variable: int x @ 8]
mov [rbp-8], rdi
;[[ ( : (], [ ( : (], [ ( : (], [ ( : (], [ id : x], [ ) : )], [ && : &&], [ $ : uint], [ int : 18374686479671623680], [ ) : )], [ >> : >>], [ int : 56], [ ) : )], [ || : ||], [ ( : (], [ ( : (], [ ( : (], [ id : x], [ ) : )], [ && : &&], [ $ : uint], [ int : 71776119061217280], [ ) : )], [ >> : >>], [ int : 40], [ ) : )], [ || : ||], [ ( : (], [ ( : (], [ ( : (], [ id : x], [ ) : )], [ && : &&], [ $ : uint], [ int : 280375465082880], [ ) : )], [ >> : >>], [ int : 24], [ ) : )], [ || : ||], [ ( : (], [ ( : (], [ ( : (], [ id : x], [ ) : )], [ && : &&], [ $ : uint], [ int : 1095216660480], [ ) : )], [ >> : >>], [ int : 8], [ ) : )], [ || : ||], [ ( : (], [ ( : (], [ ( : (], [ id : x], [ ) : )], [ && : &&], [ $ : uint], [ int : 4278190080], [ ) : )], [ << : <<], [ int : 8], [ ) : )], [ || : ||], [ ( : (], [ ( : (], [ ( : (], [ id : x], [ ) : )], [ && : &&], [ $ : uint], [ int : 16711680], [ ) : )], [ << : <<], [ int : 24], [ ) : )], [ || : ||], [ ( : (], [ ( : (], [ ( : (], [ id : x], [ ) : )], [ && : &&], [ $ : uint], [ int : 65280], [ ) : )], [ << : <<], [ int : 40], [ ) : )], [ || : ||], [ ( : (], [ ( : (], [ ( : (], [ id : x], [ ) : )], [ && : &&], [ $ : uint], [ int : 255], [ ) : )], [ << : <<], [ int : 56], [ ) : )], [ ) : )]]
mov rbx, 18374686479671623680
mov r10, QWORD[rbp-8]
and rbx, r10
shr rbx, 56
mov r10, 71776119061217280
mov r11, QWORD[rbp-8]
and r10, r11
shr r10, 40
or rbx, r10
mov r10, 280375465082880
mov r11, QWORD[rbp-8]
and r10, r11
shr r10, 24
or rbx, r10
mov r10, 1095216660480
mov r11, QWORD[rbp-8]
and r10, r11
shr r10, 8
or rbx, r10
mov r10, 4278190080
mov r11, QWORD[rbp-8]
and r10, r11
shl r10, 8
or rbx, r10
mov r10, 16711680
mov r11, QWORD[rbp-8]
and r10, r11
shl r10, 24
or rbx, r10
mov r10, 65280
mov r11, QWORD[rbp-8]
and r10, r11
shl r10, 40
or rbx, r10
mov r10, 255
mov r11, QWORD[rbp-8]
and r10, r11
shl r10, 56
or rbx, r10
mov rax, rbx
jmp ___int_bitswap64_pint__return
___int_bitswap64_pint__return:
leave
ret

;[ function uint32 bitswap32( [[ Variable: uint32 x @ 8]] ) ]

_uint32_bitswap32_puint32:
push rbp
mov rbp, rsp
sub rsp, 16
;Load Parameter: [ Variable: uint32 x @ 8]
mov [rbp-8], rdi
;[[ ( : (], [ ( : (], [ ( : (], [ ( : (], [ id : x], [ ) : )], [ && : &&], [ $ : uint32], [ int : 4278190080], [ ) : )], [ >> : >>], [ int : 24], [ ) : )], [ || : ||], [ ( : (], [ ( : (], [ ( : (], [ id : x], [ ) : )], [ && : &&], [ $ : uint32], [ int : 16711680], [ ) : )], [ >> : >>], [ int : 8], [ ) : )], [ || : ||], [ ( : (], [ ( : (], [ ( : (], [ id : x], [ ) : )], [ && : &&], [ $ : uint32], [ int : 65280], [ ) : )], [ << : <<], [ int : 8], [ ) : )], [ || : ||], [ ( : (], [ ( : (], [ ( : (], [ id : x], [ ) : )], [ && : &&], [ $ : uint32], [ int : 255], [ ) : )], [ << : <<], [ int : 24], [ ) : )], [ ) : )]]
mov rbx, 4278190080
and r10, 0xffffffff
mov r10, rbx
mov rbx, QWORD[rbp-8]
and r10, rbx
shr r10, 24
mov rbx, 16711680
and r11, 0xffffffff
mov r11, rbx
mov rbx, QWORD[rbp-8]
and r11, rbx
shr r11, 8
or r10, r11
mov rbx, 65280
and r11, 0xffffffff
mov r11, rbx
mov rbx, QWORD[rbp-8]
and r11, rbx
shl r11, 8
or r10, r11
mov rbx, 255
and r11, 0xffffffff
mov r11, rbx
mov rbx, QWORD[rbp-8]
and r11, rbx
shl r11, 24
or r10, r11
mov rax, r10
jmp ___uint32_bitswap32_puint32__return
___uint32_bitswap32_puint32__return:
leave
ret

;[ function int htonl( [[ Variable: int x @ 8]] ) ]

_int_htonl_pint:
push rbp
mov rbp, rsp
sub rsp, 16
;Load Parameter: [ Variable: int x @ 8]
mov [rbp-8], rdi
ALIGN_STACK
    call htonl
    UNALIGN_STACK
___int_htonl_pint__return:
leave
ret

;[ function void. malloc( [[ Variable: size_t size @ 8]] ) ]

_void._malloc_psize_t:
push rbp
mov rbp, rsp
sub rsp, 16
;Load Parameter: [ Variable: size_t size @ 8]
mov [rbp-8], rdi
ALIGN_STACK
    call malloc
    UNALIGN_STACK
___void._malloc_psize_t__return:
leave
ret

;[ function void. calloc( [[ Variable: size_t size @ 8]] ) ]

_void._calloc_psize_t:
push rbp
mov rbp, rsp
sub rsp, 16
;Load Parameter: [ Variable: size_t size @ 8]
mov [rbp-8], rdi
ALIGN_STACK
    call calloc
    UNALIGN_STACK
___void._calloc_psize_t__return:
leave
ret

;[ function void. realloc( [[ Variable: void. og @ 8], [ Variable: size_t newsize @ 16]] ) ]

_void._realloc_pvoid.size_t:
push rbp
mov rbp, rsp
sub rsp, 24
;Load Parameter: [ Variable: void. og @ 8]
mov [rbp-8], rdi
;Load Parameter: [ Variable: size_t newsize @ 16]
mov [rbp-16], rsi
ALIGN_STACK
    call realloc
    UNALIGN_STACK
___void._realloc_pvoid.size_t__return:
leave
ret

;[ function void free( [[ Variable: void. ptr @ 8]] ) ]

_void_free_pvoid.:
push rbp
mov rbp, rsp
sub rsp, 16
;Load Parameter: [ Variable: void. ptr @ 8]
mov [rbp-8], rdi
ALIGN_STACK
    call free
    UNALIGN_STACK
___void_free_pvoid.__return:
leave
ret

;[ function void memcpy( [[ Variable: void. dest @ 8], [ Variable: void. source @ 16], [ Variable: size_t bytes @ 24]] ) ]

_void_memcpy_pvoid.void.size_t:
push rbp
mov rbp, rsp
sub rsp, 32
;Load Parameter: [ Variable: void. dest @ 8]
mov [rbp-8], rdi
;Load Parameter: [ Variable: void. source @ 16]
mov [rbp-16], rsi
;Load Parameter: [ Variable: size_t bytes @ 24]
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

;[ function void avx_memcpy( [[ Variable: void. dest @ 8], [ Variable: void. source @ 16], [ Variable: size_t bytes @ 24]] ) ]

_void_avx_memcpy_pvoid.void.size_t:
push rbp
mov rbp, rsp
sub rsp, 56
;Load Parameter: [ Variable: void. dest @ 8]
mov [rbp-8], rdi
;Load Parameter: [ Variable: void. source @ 16]
mov [rbp-16], rsi
;Load Parameter: [ Variable: size_t bytes @ 24]
mov [rbp-24], rdx
;[[ id : bytes], [ % : %], [ int : 32]]
mov r10, 32
mov rbx, QWORD[rbp-24]
xor rdx, rdx
mov rax, rbx
idiv r10
 mov rbx, rdx
mov QWORD[rbp-32], rbx
;[[ ( : (], [ id : bytes], [ - : -], [ id : offset], [ ) : )], [ / : /], [ int : 4]]
mov r10, QWORD[rbp-32]
mov rbx, QWORD[rbp-24]
sub rbx, r10
sar rbx, 2
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
mov rbx, QWORD[rbp-48]
shl rbx, 3
add rbx, [rbp-8]
vmovdqu [rbx], ymm0
_LFORUPDATE_0x2:
;[[ id : i]]
;[[ id : i], [ + : +], [ int : 4]]
mov r11, 4
mov r10, QWORD[rbp-48]
add r10, r11
mov rbx, r10
mov QWORD[rbp-48], rbx
_LFORCMP_0x1:
;[[ id : i], [ < : <], [ id : avxcount]]
mov r10, QWORD[rbp-40]
mov rbx, QWORD[rbp-48]
cmp rbx, r10
setl bl
mov rax, rbx
and al, 1
jnz _LFORTOP_0x0
_LFOREND_0x3:
;[[ id : offset], [ != : !=], [ int : 0]]
mov r10, 0
mov rbx, QWORD[rbp-32]
cmp rbx, r10
setne bl
mov rax, rbx
and al, 1
jz _LIFPOST_0x4
;[[ id : dest], [ + : +], [ id : avxcount]]
mov rbx, QWORD[rbp-8]
mov r10, QWORD[rbp-40]
add rbx, r10
mov rdi, rbx
;[[ id : source], [ + : +], [ id : avxcount]]
mov rbx, QWORD[rbp-16]
mov r10, QWORD[rbp-40]
add rbx, r10
mov rsi, rbx
;[[ id : offset]]
mov rbx, QWORD[rbp-32]
mov rdx, rbx
mov rax, 0
call _void_memcpy_pvoid.void.size_t
jmp _LIFELSE_0x5
_LIFPOST_0x4:
_LIFELSE_0x5:
___void_avx_memcpy_pvoid.void.size_t__return:
leave
ret

;[ function void memset( [[ Variable: void. dest @ 8], [ Variable: uchar value @ 16], [ Variable: size_t bytes @ 24]] ) ]

_void_memset_pvoid.ucharsize_t:
push rbp
mov rbp, rsp
sub rsp, 32
;Load Parameter: [ Variable: void. dest @ 8]
mov [rbp-8], rdi
;Load Parameter: [ Variable: uchar value @ 16]
mov [rbp-16], rsi
;Load Parameter: [ Variable: size_t bytes @ 24]
mov [rbp-24], rdx
_void_memset_pvoid.ucharsize_t_flp:
    dec rdx
    mov [rdi+rdx], sil
    jnz _void_memset_pvoid.ucharsize_t_flp
___void_memset_pvoid.ucharsize_t__return:
leave
ret

;[ function double sqrt( [[ Variable: double a @ 8]] ) ]

_double_sqrt_pdouble:
push rbp
mov rbp, rsp
sub rsp, 16
;Load Parameter: [ Variable: double a @ 8]
movsd [rbp-8], xmm0
sqrtsd xmm0, xmm0
___double_sqrt_pdouble__return:
leave
ret

;[ function double sqrt( [[ Variable: int a @ 8]] ) ]

_double_sqrt_pint:
push rbp
mov rbp, rsp
sub rsp, 16
;Load Parameter: [ Variable: int a @ 8]
mov [rbp-8], rdi
cvtsi2sd xmm0, rdi
    sqrtsd xmm0, xmm0
___double_sqrt_pint__return:
leave
ret

;[ function int sqrt( [[ Variable: int a @ 8]] ) ]

_int_sqrt_pint:
push rbp
mov rbp, rsp
sub rsp, 16
;Load Parameter: [ Variable: int a @ 8]
mov [rbp-8], rdi
cvtsi2sd xmm0, rdi
  sqrtsd xmm0, xmm0
  cvttsd2si rax, xmm0
___int_sqrt_pint__return:
leave
ret

;[ function int pow( [[ Variable: int base @ 8], [ Variable: int exp @ 16]] ) ]

_int_pow_pintint:
push rbp
mov rbp, rsp
sub rsp, 24
;Load Parameter: [ Variable: int base @ 8]
mov [rbp-8], rdi
;Load Parameter: [ Variable: int exp @ 16]
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

;[ function double pow( [[ Variable: int base @ 8], [ Variable: int exp @ 16]] ) ]

_double_pow_pintint:
push rbp
mov rbp, rsp
sub rsp, 24
;Load Parameter: [ Variable: int base @ 8]
mov [rbp-8], rdi
;Load Parameter: [ Variable: int exp @ 16]
mov [rbp-16], rsi
;[[ id : base]]
mov rbx, QWORD[rbp-8]
mov rdi, rbx
;[[ id : exp]]
mov rbx, QWORD[rbp-16]
mov rsi, rbx
mov rax, 0
call _int_pow_pintint
cvtsi2sd xmm0, rax
___double_pow_pintint__return:
leave
ret

;[ function double pow( [[ Variable: double base @ 8], [ Variable: int exp @ 16]] ) ]

_double_pow_pdoubleint:
push rbp
mov rbp, rsp
sub rsp, 24
;Load Parameter: [ Variable: double base @ 8]
movsd [rbp-8], xmm0
;Load Parameter: [ Variable: int exp @ 16]
mov [rbp-16], rdi
dec rdi
    _double_pow_pdoubleint_flp:
    mulsd xmm0, xmm0
    dec rdi
    jnz _int_pow_pintint_flp
___double_pow_pdoubleint__return:
leave
ret

;[ function double pow( [[ Variable: double base @ 8], [ Variable: double exponent @ 16]] ) ]

_double_pow_pdoubledouble:
push rbp
mov rbp, rsp
sub rsp, 24
;Load Parameter: [ Variable: double base @ 8]
movsd [rbp-8], xmm0
;Load Parameter: [ Variable: double exponent @ 16]
movsd [rbp-16], xmm1
___double_pow_pdoubledouble__return:
leave
ret

;[ function int round( [[ Variable: double x @ 8]] ) ]

_int_round_pdouble:
push rbp
mov rbp, rsp
sub rsp, 16
;Load Parameter: [ Variable: double x @ 8]
movsd [rbp-8], xmm0
cvtsd2si rax, xmm0
___int_round_pdouble__return:
leave
ret

;[ function int ceil( [[ Variable: double x @ 8]] ) ]

_int_ceil_pdouble:
push rbp
mov rbp, rsp
sub rsp, 16
;Load Parameter: [ Variable: double x @ 8]
movsd [rbp-8], xmm0
cvttsd2si rax, xmm0
  inc rax
___int_ceil_pdouble__return:
leave
ret

;[ function int floor( [[ Variable: double x @ 8]] ) ]

_int_floor_pdouble:
push rbp
mov rbp, rsp
sub rsp, 16
;Load Parameter: [ Variable: double x @ 8]
movsd [rbp-8], xmm0
cvttsd2si rax, xmm0
___int_floor_pdouble__return:
leave
ret

;[ function int abs( [[ Variable: int x @ 8]] ) ]

_int_abs_pint:
push rbp
mov rbp, rsp
sub rsp, 16
;Load Parameter: [ Variable: int x @ 8]
mov [rbp-8], rdi
mov rax, rdi
  sar rdi, 63
  xor rax, rdi
  sub rax, rdi
___int_abs_pint__return:
leave
ret

;[ function double abs( [[ Variable: double x @ 8]] ) ]

_double_abs_pdouble:
push rbp
mov rbp, rsp
sub rsp, 16
;Load Parameter: [ Variable: double x @ 8]
movsd [rbp-8], xmm0
movsd xmm1, xmm0
  mov rax, -1
  cvtsi2sd xmm2, rax
  xorpd xmm1, xmm2
  andpd xmm0, xmm1
___double_abs_pdouble__return:
leave
ret

;[ function int log( [[ Variable: int x @ 8]] ) ]

_int_log_pint:
push rbp
mov rbp, rsp
sub rsp, 16
;Load Parameter: [ Variable: int x @ 8]
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

;[ function int strcpy( [[ Variable: char. dest @ 8], [ Variable: char. source @ 16]] ) ]

_int_strcpy_pchar.char.:
push rbp
mov rbp, rsp
sub rsp, 24
;Load Parameter: [ Variable: char. dest @ 8]
mov [rbp-8], rdi
;Load Parameter: [ Variable: char. source @ 16]
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

;[ function size_t strlen( [[ Variable: char. str @ 8]] ) ]

_size_t_strlen_pchar.:
push rbp
mov rbp, rsp
sub rsp, 16
;Load Parameter: [ Variable: char. str @ 8]
mov [rbp-8], rdi
mov rax, -1
    _size_t_strlen_pchar._flp:
    mov bl, [rdi]
    inc rax
    inc rdi
    cmp bl, 0
    jnz _size_t_strlen_pchar._flp
___size_t_strlen_pchar.__return:
leave
ret

;[ function int toStr( [[ Variable: int val @ 8], [ Variable: char. buffer @ 16], [ Variable: bool signed @ 24]] ) ]

_int_toStr_pintchar.bool:
push rbp
mov rbp, rsp
sub rsp, 56
;Load Parameter: [ Variable: int val @ 8]
mov [rbp-8], rdi
;Load Parameter: [ Variable: char. buffer @ 16]
mov [rbp-16], rsi
;Load Parameter: [ Variable: bool signed @ 24]
mov [rbp-24], rdx
;[[ int : 0]]
mov QWORD[rbp-32], 0
;[[ id : val], [ < : <], [ int : 0], [ && : &&], [ id : signed]]
mov r10, 0
mov rbx, QWORD[rbp-8]
cmp rbx, r10
setl bl
mov r10, QWORD[rbp-24]
and rbx, r10
mov rax, rbx
and al, 1
jz _LIFPOST_0x6
;[[ @ : @], [ id : buffer]]
mov rbx, QWORD[rbp-16]
mov r10, rbx
;[[ char : 45]]
mov rbx, 45
mov byte[r10], bl
;[[ id : buffer]]
;[[ int : 1]]
mov rbx, 1
mov r10, QWORD[rbp-16]
add r10, rbx
mov QWORD[rbp-16], r10
;[[ id : val]]
;[[ int : 0], [ - : -], [ id : val]]
mov r11, QWORD[rbp-8]
mov r10, 0
sub r10, r11
mov rbx, r10
mov QWORD[rbp-8], rbx
;[[ id : signspace]]
;[[ int : 1]]
mov rbx, 1
mov QWORD[rbp-32], rbx
jmp _LIFELSE_0x7
_LIFPOST_0x6:
_LIFELSE_0x7:
;[[ id : val]]
mov rbx, QWORD[rbp-8]
mov rdi, rbx
mov rax, 0
call _int_log_pint
push rax
;[[ fn(x) : [ function int log( [[ Variable: int x @ 8]] ) ] ], [ + : +], [ int : 1]]
pop rbx
inc rbx
mov QWORD[rbp-40], rbx
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
;[[ int : 1]]
mov rbx, 1
mov r10, QWORD[rbp-16]
sub r10, rbx
mov QWORD[rbp-16], r10
;[[ @ : @], [ id : buffer]]
mov rbx, QWORD[rbp-16]
mov r10, rbx
;[[ $ : char], [ ( : (], [ id : val], [ % : %], [ int : 10], [ ) : )], [ + : +], [ char : 48]]
mov r12, 10
mov r11, QWORD[rbp-8]
xor rdx, rdx
mov rax, r11
idiv r12
 mov r11, rdx
mov r12, r11
and r13, 0xff
mov r13, r12
mov r12, 48
add r13, r12
mov rbx, r13
mov byte[r10], bl
;[[ id : val]]
;[[ int : 10]]
mov rbx, 10
mov r10, QWORD[rbp-8]
xor rdx, rdx
mov rax,r10
idiv rbx
mov r10, rax
mov QWORD[rbp-8], r10
_LFORUPDATE_0xa:
;[[ id : i]]
;[[ int : 1]]
mov rbx, 1
mov r10, QWORD[rbp-48]
add r10, rbx
mov QWORD[rbp-48], r10
_LFORCMP_0x9:
;[[ id : i], [ < : <], [ id : l]]
mov r10, QWORD[rbp-40]
mov rbx, QWORD[rbp-48]
cmp rbx, r10
setl bl
mov rax, rbx
and al, 1
jnz _LFORTOP_0x8
_LFOREND_0xb:
;[[ id : l], [ + : +], [ id : signspace]]
mov r10, QWORD[rbp-32]
mov rbx, QWORD[rbp-40]
add rbx, r10
mov rax, rbx
jmp ___int_toStr_pintchar.bool__return
___int_toStr_pintchar.bool__return:
leave
ret

;[ function int toStr( [[ Variable: double val @ 8], [ Variable: char. buffer @ 16], [ Variable: int multiplier @ 24]] ) ]

_int_toStr_pdoublechar.int:
push rbp
mov rbp, rsp
sub rsp, 48
;Load Parameter: [ Variable: double val @ 8]
movsd [rbp-8], xmm0
;Load Parameter: [ Variable: char. buffer @ 16]
mov [rbp-16], rdi
;Load Parameter: [ Variable: int multiplier @ 24]
mov [rbp-24], rsi
;[[ id : val]]
cvttsd2si rbx, QWORD[rbp-8]
mov QWORD[rbp-32], rbx
;[[ id : integral]]
mov rbx, QWORD[rbp-32]
mov rdi, rbx
;[[ id : buffer]]
mov rbx, QWORD[rbp-16]
mov rsi, rbx
;[[ int : 1]]
mov rbx, 1
mov dl, bl
and rdx, 0xff
mov rax, 0
call _int_toStr_pintchar.bool
push rax
;[[ fn(x) : [ function int toStr( [[ Variable: int val @ 8], [ Variable: char. buffer @ 16], [ Variable: bool signed @ 24]] ) ] ]]
pop rax
mov QWORD[rbp-40], rax
;[[ id : buffer]]
;[[ id : l]]
mov rbx, QWORD[rbp-40]
mov r10, QWORD[rbp-16]
add r10, rbx
mov QWORD[rbp-16], r10
;[[ id : val]]
;[[ id : val]]
movsd xmm7, QWORD[rbp-8]
movsd xmm0, xmm7
mov rax, 1
call _double_abs_pdouble
movq rax, xmm0
push rax
;[[ ( : (], [ fn(x) : [ function double abs( [[ Variable: double x @ 8]] ) ] ], [ - : -], [ id : integral], [ ) : )], [ * : *], [ id : multiplier]]
pop rax
movq xmm7, rax
mov rbx, QWORD[rbp-32]
cvtsi2sd xmm8, rbx
subsd xmm7, xmm8
mov rbx, QWORD[rbp-24]
cvtsi2sd xmm8, rbx
mulsd xmm7, xmm8
movsd QWORD[rbp-8], xmm7
;[[ @ : @], [ id : buffer]]
mov rbx, QWORD[rbp-16]
mov r10, rbx
;[[ char : 46]]
mov rbx, 46
mov byte[r10], bl
;[[ id : buffer]]
;[[ int : 1]]
mov rbx, 1
mov r10, QWORD[rbp-16]
add r10, rbx
mov QWORD[rbp-16], r10
;[[ id : l]]
;[[ id : val]]
movsd xmm7, QWORD[rbp-8]
movsd xmm0, xmm7
mov rax, 1
call _int_round_pdouble
push rax
;[[ fn(x) : [ function int round( [[ Variable: double x @ 8]] ) ] ]]
pop rdi
;[[ id : buffer]]
mov rbx, QWORD[rbp-16]
mov rsi, rbx
;[[ int : 0]]
mov rbx, 0
mov dl, bl
and rdx, 0xff
mov rax, 0
call _int_toStr_pintchar.bool
push rax
;[[ fn(x) : [ function int toStr( [[ Variable: int val @ 8], [ Variable: char. buffer @ 16], [ Variable: bool signed @ 24]] ) ] ]]
pop rbx
mov r10, QWORD[rbp-40]
add r10, rbx
mov QWORD[rbp-40], r10
;[[ id : l], [ - : -], [ int : 1]]
mov rbx, QWORD[rbp-40]
dec rbx
mov rax, rbx
jmp ___int_toStr_pdoublechar.int__return
___int_toStr_pdoublechar.int__return:
leave
ret

;[ function int __sprintf( [[ Variable: char. str @ 8], [ Variable: char. fmt @ 16], [ Variable: void. args @ 24]] ) ]

_int___sprintf_pchar.char.void.:
push rbp
mov rbp, rsp
sub rsp, 160
;Load Parameter: [ Variable: char. str @ 8]
mov [rbp-8], rdi
;Load Parameter: [ Variable: char. fmt @ 16]
mov [rbp-16], rsi
;Load Parameter: [ Variable: void. args @ 24]
mov [rbp-24], rdx
;[[ int : 0]]
mov QWORD[rbp-32], 0
;[[ $ : int], [ id : str]]
mov rbx, QWORD[rbp-8]
mov QWORD[rbp-40], rbx
;[[ id : str], [ == : ==], [ int : 0], [ || : ||], [ id : fmt], [ == : ==], [ int : 0]]
mov rbx, QWORD[rbp-8]
mov r10, 0
cmp rbx, r10
sete bl
mov r10, QWORD[rbp-16]
mov r11, 0
cmp r10, r11
sete r10b
or rbx, r10
mov rax, rbx
and al, 1
jz _LIFPOST_0xc
;[[ int : 0]]
mov rax, 0
jmp ___int___sprintf_pchar.char.void.__return
jmp _LIFELSE_0xd
_LIFPOST_0xc:
_LIFELSE_0xd:
jmp _LWHILECMP_0xf
_LWHILESTART_0xe:
;[[ @ : @], [ id : fmt], [ != : !=], [ char : 37]]
mov rbx, QWORD[rbp-16]
  ; here
and r10, 0xff
mov r10b, byte[rbx]
mov rbx, 37
cmp r10, rbx
setne r10b
mov rax, r10
and al, 1
jz _LIFPOST_0x11
;[[ @ : @], [ id : str]]
mov rbx, QWORD[rbp-8]
mov r10, rbx
;[[ @ : @], [ id : fmt]]
mov r11, QWORD[rbp-16]
  ; here
and r12, 0xff
mov r12b, byte[r11]
mov rbx, r12
mov byte[r10], bl
jmp _LIFELSE_0x12
_LIFPOST_0x11:
;[[ id : fmt]]
;[[ int : 1]]
mov rbx, 1
mov r10, QWORD[rbp-16]
add r10, rbx
mov QWORD[rbp-16], r10
;[[ @ : @], [ id : fmt]]
mov rbx, QWORD[rbp-16]
  ; here
and r10, 0xff
mov r10b, byte[rbx]
mov QWORD[rbp-48], r10
;[[ id : c], [ == : ==], [ char : 105]]
mov r10, 105
mov rbx, QWORD[rbp-48]
cmp rbx, r10
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
;[[ id : num]]
mov rbx, QWORD[rbp-56]
mov rdi, rbx
;[[ id : str]]
mov rbx, QWORD[rbp-8]
mov rsi, rbx
;[[ int : 1]]
mov rbx, 1
mov dl, bl
and rdx, 0xff
mov rax, 0
call _int_toStr_pintchar.bool
push rax
;[[ fn(x) : [ function int toStr( [[ Variable: int val @ 8], [ Variable: char. buffer @ 16], [ Variable: bool signed @ 24]] ) ] ]]
pop rax
mov QWORD[rbp-64], rax
;[[ id : str]]
;[[ id : size], [ - : -], [ int : 1]]
mov r10, QWORD[rbp-64]
dec r10
mov rbx, r10
mov r10, QWORD[rbp-8]
add r10, rbx
mov QWORD[rbp-8], r10
jmp _LIFELSE_0x14
_LIFPOST_0x13:
;[[ id : c], [ == : ==], [ char : 99]]
mov r10, 99
mov rbx, QWORD[rbp-48]
cmp rbx, r10
sete bl
mov rax, rbx
and al, 1
jz _LIFPOST_0x15
;[[ $ : char], [ id : args], [ [ : [], [ id : argc], [ ] : ]]]
mov r10, QWORD[rbp-32]
mov rbx, QWORD[rbp-24]
lea rbx, [rbx+r10*8]
mov rbx, qword[rbx]
mov r10, rbx
and r11, 0xff
mov r11, r10
mov QWORD[rbp-72], r11
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
cmp rbx, r10
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
;[[ id : unum]]
mov rbx, QWORD[rbp-80]
mov rdi, rbx
;[[ id : str]]
mov rbx, QWORD[rbp-8]
mov rsi, rbx
;[[ int : 0]]
mov rbx, 0
mov dl, bl
and rdx, 0xff
mov rax, 0
call _int_toStr_pintchar.bool
push rax
;[[ fn(x) : [ function int toStr( [[ Variable: int val @ 8], [ Variable: char. buffer @ 16], [ Variable: bool signed @ 24]] ) ] ]]
pop rax
mov QWORD[rbp-88], rax
;[[ id : str]]
;[[ id : usize], [ - : -], [ int : 1]]
mov r10, QWORD[rbp-88]
dec r10
mov rbx, r10
mov r10, QWORD[rbp-8]
add r10, rbx
mov QWORD[rbp-8], r10
jmp _LIFELSE_0x18
_LIFPOST_0x17:
;[[ id : c], [ == : ==], [ char : 115]]
mov r10, 115
mov rbx, QWORD[rbp-48]
cmp rbx, r10
sete bl
mov rax, rbx
and al, 1
jz _LIFPOST_0x19
;[[ id : str]]
mov rbx, QWORD[rbp-8]
mov rdi, rbx
;[[ id : args], [ [ : [], [ id : argc], [ ] : ]]]
mov r10, QWORD[rbp-32]
mov rbx, QWORD[rbp-24]
lea rbx, [rbx+r10*8]
mov rbx, qword[rbx]
mov rsi, rbx
mov rax, 0
call _int_strcpy_pchar.char.
push rax
;[[ fn(x) : [ function int strcpy( [[ Variable: char. dest @ 8], [ Variable: char. source @ 16]] ) ] ]]
pop rax
mov QWORD[rbp-96], rax
;[[ id : str]]
;[[ id : ssize], [ - : -], [ int : 1]]
mov r10, QWORD[rbp-96]
dec r10
mov rbx, r10
mov r10, QWORD[rbp-8]
add r10, rbx
mov QWORD[rbp-8], r10
jmp _LIFELSE_0x1a
_LIFPOST_0x19:
;[[ id : c], [ == : ==], [ char : 98]]
mov r10, 98
mov rbx, QWORD[rbp-48]
cmp rbx, r10
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
;[[ id : b]]
mov rbx, QWORD[rbp-104]
mov rax, rbx
and al, 1
jz _LIFPOST_0x1d
;[[ id : boolean_string]]
;[[ id : STRING_CONSTANT_0]]
mov r10, STRING_CONSTANT_0
mov rbx, r10
mov QWORD[rbp-112], rbx
jmp _LIFELSE_0x1e
_LIFPOST_0x1d:
;[[ id : boolean_string]]
;[[ id : STRING_CONSTANT_1]]
mov r10, STRING_CONSTANT_1
mov rbx, r10
mov QWORD[rbp-112], rbx
_LIFELSE_0x1e:
;[[ id : str]]
mov rbx, QWORD[rbp-8]
mov rdi, rbx
;[[ id : boolean_string]]
mov rbx, QWORD[rbp-112]
mov rsi, rbx
mov rax, 0
call _int_strcpy_pchar.char.
push rax
;[[ fn(x) : [ function int strcpy( [[ Variable: char. dest @ 8], [ Variable: char. source @ 16]] ) ] ]]
pop rax
mov QWORD[rbp-120], rax
;[[ id : str]]
;[[ id : ssize]]
mov rbx, QWORD[rbp-96]
mov r10, QWORD[rbp-8]
add r10, rbx
mov QWORD[rbp-8], r10
jmp _LIFELSE_0x1c
_LIFPOST_0x1b:
;[[ id : c], [ == : ==], [ char : 100]]
mov r10, 100
mov rbx, QWORD[rbp-48]
cmp rbx, r10
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
;[[ id : d]]
movsd xmm7, QWORD[rbp-128]
movsd xmm0, xmm7
;[[ id : str]]
mov rbx, QWORD[rbp-8]
mov rdi, rbx
;[[ int : 100000000000000]]
mov rsi, 100000000000000
mov rax, 1
call _int_toStr_pdoublechar.int
push rax
;[[ fn(x) : [ function int toStr( [[ Variable: double val @ 8], [ Variable: char. buffer @ 16], [ Variable: int multiplier @ 24]] ) ] ]]
pop rax
mov QWORD[rbp-136], rax
;[[ id : str]]
;[[ id : dsize], [ - : -], [ int : 1]]
mov r10, QWORD[rbp-136]
dec r10
mov rbx, r10
mov r10, QWORD[rbp-8]
add r10, rbx
mov QWORD[rbp-8], r10
jmp _LIFELSE_0x20
_LIFPOST_0x1f:
;[[ id : c], [ == : ==], [ char : 102]]
mov r10, 102
mov rbx, QWORD[rbp-48]
cmp rbx, r10
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
;[[ id : f]]
movsd xmm7, QWORD[rbp-144]
movsd xmm0, xmm7
;[[ id : str]]
mov rbx, QWORD[rbp-8]
mov rdi, rbx
;[[ int : 10000000]]
mov rsi, 10000000
mov rax, 1
call _int_toStr_pdoublechar.int
push rax
;[[ fn(x) : [ function int toStr( [[ Variable: double val @ 8], [ Variable: char. buffer @ 16], [ Variable: int multiplier @ 24]] ) ] ]]
pop rax
mov QWORD[rbp-152], rax
;[[ id : str]]
;[[ id : fsize], [ - : -], [ int : 1]]
mov r10, QWORD[rbp-152]
dec r10
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
;[[ int : 1]]
mov rbx, 1
mov r10, QWORD[rbp-32]
add r10, rbx
mov QWORD[rbp-32], r10
_LIFELSE_0x12:
;[[ id : fmt]]
;[[ int : 1]]
mov rbx, 1
mov r10, QWORD[rbp-16]
add r10, rbx
mov QWORD[rbp-16], r10
;[[ id : str]]
;[[ int : 1]]
mov rbx, 1
mov r10, QWORD[rbp-8]
add r10, rbx
mov QWORD[rbp-8], r10
_LWHILECMP_0xf:
;[[ @ : @], [ id : fmt], [ != : !=], [ int : 0]]
mov rbx, QWORD[rbp-16]
  ; here
and r10, 0xff
mov r10b, byte[rbx]
mov rbx, 0
mov r11, r10
cmp rbx, r11
setne bl
mov rax, rbx
and al, 1
jnz _LWHILESTART_0xe
_LWHILEEND_0x10:
;[[ ( : (], [ $ : int], [ id : str], [ ) : )], [ - : -], [ id : og]]
mov r10, QWORD[rbp-40]
mov rbx, QWORD[rbp-8]
sub rbx, r10
mov rax, rbx
jmp ___int___sprintf_pchar.char.void.__return
___int___sprintf_pchar.char.void.__return:
leave
ret

;[ function int sprintf( [[ Variable: char. dest @ 8], [ Variable: char. fmt @ 16], [ Variable: void arg1 @ 24], [ Variable: void arg2 @ 32], [ Variable: void arg3 @ 40], [ Variable: void arg4 @ 48]] ) ]

_int_sprintf_pchar.char.voidvoidvoidvoid:
push rbp
mov rbp, rsp
sub rsp, 72
;Load Parameter: [ Variable: char. dest @ 8]
mov [rbp-8], rdi
;Load Parameter: [ Variable: char. fmt @ 16]
mov [rbp-16], rsi
;Load Parameter: [ Variable: void arg1 @ 24]
mov [rbp-24], rdx
;Load Parameter: [ Variable: void arg2 @ 32]
mov [rbp-32], rcx
;Load Parameter: [ Variable: void arg3 @ 40]
mov [rbp-40], r8
;Load Parameter: [ Variable: void arg4 @ 48]
mov [rbp-48], r9
;[[ int : 4], [ * : *], [ id : void]]
mov rdi, 32
mov rax, 0
call _void._malloc_psize_t
push rax
;[[ fn(x) : [ function void. malloc( [[ Variable: size_t size @ 8]] ) ] ]]
pop rax
mov QWORD[rbp-56], rax
;[[ id : args], [ [ : [], [ int : 0], [ ] : ]]]
mov r10, 0
mov rbx, QWORD[rbp-56]
lea rbx, [rbx+r10*8]
;[[ id : arg1]]
mov r11, QWORD[rbp-24]
mov r10, r11
mov qword[rbx], r10
;[[ id : args], [ [ : [], [ int : 1], [ ] : ]]]
mov r10, 1
mov rbx, QWORD[rbp-56]
lea rbx, [rbx+r10*8]
;[[ id : arg2]]
mov r11, QWORD[rbp-32]
mov r10, r11
mov qword[rbx], r10
;[[ id : args], [ [ : [], [ int : 2], [ ] : ]]]
mov r10, 2
mov rbx, QWORD[rbp-56]
lea rbx, [rbx+r10*8]
;[[ id : arg3]]
mov r11, QWORD[rbp-40]
mov r10, r11
mov qword[rbx], r10
;[[ id : args], [ [ : [], [ int : 3], [ ] : ]]]
mov r10, 3
mov rbx, QWORD[rbp-56]
lea rbx, [rbx+r10*8]
;[[ id : arg4]]
mov r11, QWORD[rbp-48]
mov r10, r11
mov qword[rbx], r10
;[[ id : dest]]
mov rbx, QWORD[rbp-8]
mov rdi, rbx
;[[ id : fmt]]
mov rbx, QWORD[rbp-16]
mov rsi, rbx
;[[ id : args]]
mov rbx, QWORD[rbp-56]
mov rdx, rbx
mov rax, 0
call _int___sprintf_pchar.char.void.
push rax
;[[ fn(x) : [ function int __sprintf( [[ Variable: char. str @ 8], [ Variable: char. fmt @ 16], [ Variable: void. args @ 24]] ) ] ]]
pop rax
mov QWORD[rbp-64], rax
;[[ id : args]]
mov rbx, QWORD[rbp-56]
mov rdi, rbx
mov rax, 0
call _void_free_pvoid.
;[[ id : l]]
mov rbx, QWORD[rbp-64]
mov rax, rbx
jmp ___int_sprintf_pchar.char.voidvoidvoidvoid__return
___int_sprintf_pchar.char.voidvoidvoidvoid__return:
leave
ret

;[ function ssize_t read( [[ Variable: fd_t fd @ 0], [ Variable: char. buf @ 0], [ Variable: size_t count @ 0]] ) ]


;[ function ssize_t write( [[ Variable: fd_t fd @ 0], [ Variable: char. buf @ 0], [ Variable: size_t count @ 0]] ) ]


;[ function fd_t open( [[ Variable: char. fname @ 0], [ Variable: int flags @ 0], [ Variable: mode_t mode @ 0]] ) ]


;[ function int close( [[ Variable: fd_t fd @ 0]] ) ]


;[ function int mkdir( [[ Variable: char. pathname @ 0], [ Variable: mode_t mode @ 0]] ) ]


;[ function int rmdir( [[ Variable: char. pathname @ 0]] ) ]


;[ function int creat( [[ Variable: char. pathname @ 0], [ Variable: mode_t mode @ 0]] ) ]


;[ function int chdir( [[ Variable: char. pathname @ 0]] ) ]


;[ function int lseek( [[ Variable: fd_t fd @ 0], [ Variable: int offset @ 0], [ Variable: int whence @ 0]] ) ]


;[ function void __printf( [[ Variable: char. fmt @ 8], [ Variable: void. args @ 16]] ) ]

_void___printf_pchar.void.:
push rbp
mov rbp, rsp
sub rsp, 100040
;Load Parameter: [ Variable: char. fmt @ 8]
mov [rbp-8], rdi
;Load Parameter: [ Variable: void. args @ 16]
mov [rbp-16], rsi
;[[ & : &], [ id : normform]]
lea rbx, [rbp-100024]
mov rdi, rbx
;[[ id : fmt]]
mov rbx, QWORD[rbp-8]
mov rsi, rbx
;[[ id : args]]
mov rbx, QWORD[rbp-16]
mov rdx, rbx
mov rax, 0
call _int___sprintf_pchar.char.void.
push rax
;[[ fn(x) : [ function int __sprintf( [[ Variable: char. str @ 8], [ Variable: char. fmt @ 16], [ Variable: void. args @ 24]] ) ] ]]
pop rax
mov QWORD[rbp-100032], rax
;[[ int : 1]]
mov rdi, 1
;[[ & : &], [ id : normform]]
lea rbx, [rbp-100024]
mov rsi, rbx
;[[ id : l]]
mov rbx, QWORD[rbp-100032]
mov rdx, rbx
mov rax, 0
call _ssize_t_write_pfd_tchar.size_t
___void___printf_pchar.void.__return:
leave
ret

;[ function void printf( [[ Variable: char. fmt @ 8], [ Variable: void arg1 @ 16], [ Variable: void arg2 @ 24], [ Variable: void arg3 @ 32], [ Variable: void arg4 @ 40], [ Variable: void arg5 @ 48]] ) ]

printf:
push rbp
mov rbp, rsp
sub rsp, 64
;Load Parameter: [ Variable: char. fmt @ 8]
mov [rbp-8], rdi
;Load Parameter: [ Variable: void arg1 @ 16]
mov [rbp-16], rsi
;Load Parameter: [ Variable: void arg2 @ 24]
mov [rbp-24], rdx
;Load Parameter: [ Variable: void arg3 @ 32]
mov [rbp-32], rcx
;Load Parameter: [ Variable: void arg4 @ 40]
mov [rbp-40], r8
;Load Parameter: [ Variable: void arg5 @ 48]
mov [rbp-48], r9
;[[ int : 5], [ * : *], [ id : void]]
mov rdi, 40
mov rax, 0
call _void._malloc_psize_t
push rax
;[[ fn(x) : [ function void. malloc( [[ Variable: size_t size @ 8]] ) ] ]]
pop rax
mov QWORD[rbp-56], rax
;[[ id : args], [ [ : [], [ int : 0], [ ] : ]]]
mov r10, 0
mov rbx, QWORD[rbp-56]
lea rbx, [rbx+r10*8]
;[[ id : arg1]]
mov r11, QWORD[rbp-16]
mov r10, r11
mov qword[rbx], r10
;[[ id : args], [ [ : [], [ int : 1], [ ] : ]]]
mov r10, 1
mov rbx, QWORD[rbp-56]
lea rbx, [rbx+r10*8]
;[[ id : arg2]]
mov r11, QWORD[rbp-24]
mov r10, r11
mov qword[rbx], r10
;[[ id : args], [ [ : [], [ int : 2], [ ] : ]]]
mov r10, 2
mov rbx, QWORD[rbp-56]
lea rbx, [rbx+r10*8]
;[[ id : arg3]]
mov r11, QWORD[rbp-32]
mov r10, r11
mov qword[rbx], r10
;[[ id : args], [ [ : [], [ int : 3], [ ] : ]]]
mov r10, 3
mov rbx, QWORD[rbp-56]
lea rbx, [rbx+r10*8]
;[[ id : arg4]]
mov r11, QWORD[rbp-40]
mov r10, r11
mov qword[rbx], r10
;[[ id : args], [ [ : [], [ int : 4], [ ] : ]]]
mov r10, 4
mov rbx, QWORD[rbp-56]
lea rbx, [rbx+r10*8]
;[[ id : arg5]]
mov r11, QWORD[rbp-48]
mov r10, r11
mov qword[rbx], r10
;[[ id : fmt]]
mov rbx, QWORD[rbp-8]
mov rdi, rbx
;[[ id : args]]
mov rbx, QWORD[rbp-56]
mov rsi, rbx
mov rax, 0
call _void___printf_pchar.void.
;[[ id : args]]
mov rbx, QWORD[rbp-56]
mov rdi, rbx
mov rax, 0
call _void_free_pvoid.
__printf__return:
leave
ret

;[ function void printf( [[ Variable: char. fmt @ 0], [ Variable: void arg1 @ 0], [ Variable: void arg2 @ 0], [ Variable: void arg3 @ 0], [ Variable: void arg4 @ 0]] ) ]


;[ function void printf( [[ Variable: char. fmt @ 0], [ Variable: void arg1 @ 0], [ Variable: void arg2 @ 0], [ Variable: void arg3 @ 0]] ) ]


;[ function void printf( [[ Variable: char. fmt @ 0], [ Variable: void arg1 @ 0], [ Variable: void arg2 @ 0]] ) ]


;[ function void printf( [[ Variable: char. fmt @ 0], [ Variable: void arg1 @ 0]] ) ]


;[ function void printf( [[ Variable: char. fmt @ 0]] ) ]


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
;[[ id : rand_next], [ ^ : ^], [ ( : (], [ id : rand_next], [ << : <<], [ int : 13], [ ) : )]]
mov r10, [rand_next]
sal r10, 13
mov r11, [rand_next]
xor r11, r10
mov rbx, r11
mov [rand_next], rbx
;[[ id : rand_next]]
;[[ id : rand_next], [ ^ : ^], [ ( : (], [ id : rand_next], [ >> : >>], [ int : 17], [ ) : )]]
mov r10, [rand_next]
sar r10, 17
mov r11, [rand_next]
xor r11, r10
mov rbx, r11
mov [rand_next], rbx
;[[ id : rand_next]]
;[[ id : rand_next], [ ^ : ^], [ ( : (], [ id : rand_next], [ << : <<], [ int : 5], [ ) : )]]
mov r10, [rand_next]
sal r10, 5
mov r11, [rand_next]
xor r11, r10
mov rbx, r11
mov [rand_next], rbx
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
mov rax, 0
call _int_rdrand_p
push rax
;[[ fn(x) : [ function int rdrand( [] ) ] ]]
pop rbx
mov [rand_next], rbx
___void_srand_p__return:
leave
ret

;[ function int adjtime( [[ Variable: timeval_t. t1 @ 8], [ Variable: timeval_t t2 @ 16]] ) ]

_int_adjtime_ptimeval_t.timeval_t:
push rbp
mov rbp, rsp
sub rsp, 40
;Load Parameter: [ Variable: timeval_t. t1 @ 8]
mov [rbp-8], rdi
;Load Parameter: [ Variable: timeval_t t2 @ 16]
mov [rbp-16], rsi
___int_adjtime_ptimeval_t.timeval_t__return:
leave
ret

;[ function int getitimer( [[ Variable: int which @ 8], [ Variable: itimerval_t. value @ 16]] ) ]

_int_getitimer_pintitimerval_t.:
push rbp
mov rbp, rsp
sub rsp, 24
;Load Parameter: [ Variable: int which @ 8]
mov [rbp-8], rdi
;Load Parameter: [ Variable: itimerval_t. value @ 16]
mov [rbp-16], rsi
mov rax, 36
        syscall
___int_getitimer_pintitimerval_t.__return:
leave
ret

;[ function int gettimeofday( [[ Variable: timeval_t. tv @ 8], [ Variable: timezone_t. tz @ 16]] ) ]

_int_gettimeofday_ptimeval_t.timezone_t.:
push rbp
mov rbp, rsp
sub rsp, 24
;Load Parameter: [ Variable: timeval_t. tv @ 8]
mov [rbp-8], rdi
;Load Parameter: [ Variable: timezone_t. tz @ 16]
mov [rbp-16], rsi
mov rax, 96
    syscall
___int_gettimeofday_ptimeval_t.timezone_t.__return:
leave
ret

;[ function int setitimer( [[ Variable: int which @ 8], [ Variable: itimerval_t. value @ 16], [ Variable: itimerval_t. ovalue @ 24]] ) ]

_int_setitimer_pintitimerval_t.itimerval_t.:
push rbp
mov rbp, rsp
sub rsp, 32
;Load Parameter: [ Variable: int which @ 8]
mov [rbp-8], rdi
;Load Parameter: [ Variable: itimerval_t. value @ 16]
mov [rbp-16], rsi
;Load Parameter: [ Variable: itimerval_t. ovalue @ 24]
mov [rbp-24], rdx
mov rax, 38
    syscall
___int_setitimer_pintitimerval_t.itimerval_t.__return:
leave
ret

;[ function int settimeofday( [[ Variable: timeval_t. tv @ 8], [ Variable: timezone_t. tz @ 16]] ) ]

_int_settimeofday_ptimeval_t.timezone_t.:
push rbp
mov rbp, rsp
sub rsp, 24
;Load Parameter: [ Variable: timeval_t. tv @ 8]
mov [rbp-8], rdi
;Load Parameter: [ Variable: timezone_t. tz @ 16]
mov [rbp-16], rsi
mov rax, 164
    syscall
___int_settimeofday_ptimeval_t.timezone_t.__return:
leave
ret

;[ function int utimes( [[ Variable: char. filename @ 8], [ Variable: timeval_t. utimes @ 16]] ) ]

_int_utimes_pchar.timeval_t.:
push rbp
mov rbp, rsp
sub rsp, 24
;Load Parameter: [ Variable: char. filename @ 8]
mov [rbp-8], rdi
;Load Parameter: [ Variable: timeval_t. utimes @ 16]
mov [rbp-16], rsi
mov rax, 235
    syscall
___int_utimes_pchar.timeval_t.__return:
leave
ret

;[ function time_t time( [[ Variable: time_t. tloc @ 8]] ) ]

_time_t_time_ptime_t.:
push rbp
mov rbp, rsp
sub rsp, 16
;Load Parameter: [ Variable: time_t. tloc @ 8]
mov [rbp-8], rdi
mov rax, 201
    syscall
___time_t_time_ptime_t.__return:
leave
ret

;[ function bool isdigit( [[ Variable: char c @ 8]] ) ]

_bool_isdigit_pchar:
push rbp
mov rbp, rsp
sub rsp, 16
;Load Parameter: [ Variable: char c @ 8]
mov [rbp-8], rdi
;[[ id : c], [ >= : >=], [ char : 48], [ && : &&], [ id : c], [ <= : <=], [ char : 57]]
mov r10, 48
mov rbx, QWORD[rbp-8]
cmp rbx, r10
setge bl
mov r11, 57
mov r10, QWORD[rbp-8]
cmp r10, r11
setle r10b
and rbx, r10
mov rax, rbx
jmp ___bool_isdigit_pchar__return
___bool_isdigit_pchar__return:
leave
ret

;[ function int inet_aton( [[ Variable: char. cp @ 8], [ Variable: in_addr. addr @ 16]] ) ]

_int_inet_aton_pchar.in_addr.:
push rbp
mov rbp, rsp
sub rsp, 104
;Load Parameter: [ Variable: char. cp @ 8]
mov [rbp-8], rdi
;Load Parameter: [ Variable: in_addr. addr @ 16]
mov [rbp-16], rsi
;[[ int : 10]]
mov QWORD[rbp-32], 10
;[[ & : &], [ id : parts]]
lea rbx, [rbp-88]
mov rdi, rbx
;[[ int : 0]]
mov rbx, 0
mov SIL, bl
and rsi, 0xff
;[[ int : 4]]
mov rdx, 4
mov rax, 0
call _void_memset_pvoid.ucharsize_t
;[[ & : &], [ id : parts]]
lea rbx, [rbp-88]
mov QWORD[rbp-96], rbx
;[[ id : c]]
;[[ @ : @], [ id : cp]]
mov r10, QWORD[rbp-8]
  ; here
and r11, 0xff
mov r11b, byte[r10]
mov rbx, r11
mov QWORD[rbp-48], rbx
jmp _LWHILECMP_0x24
_LWHILESTART_0x23:
;[[ id : val]]
;[[ int : 0]]
mov rbx, 0
mov QWORD[rbp-24], rbx
jmp _LWHILECMP_0x27
_LWHILESTART_0x26:
;[[ id : c]]
mov r10, QWORD[rbp-48]
mov rbx, r10
mov DIL, bl
and rdi, 0xff
mov rax, 0
call _bool_isdigit_pchar
push rax
;[[ fn(x) : [ function bool isdigit( [[ Variable: char c @ 8]] ) ] ]]
pop rax
and al, 1
jz _LIFPOST_0x29
;[[ id : val]]
;[[ ( : (], [ id : val], [ * : *], [ id : base], [ ) : )], [ + : +], [ ( : (], [ id : c], [ - : -], [ char : 48], [ ) : )]]
mov r10, QWORD[rbp-32]
mov r11, QWORD[rbp-24]
mov r12, r11
imul r10, r12
mov r12, 48
mov r11, QWORD[rbp-48]
sub r11, r12
mov r12, r11
add r10, r12
mov rbx, r10
mov QWORD[rbp-24], rbx
;[[ id : cp]]
;[[ int : 1]]
mov rbx, 1
mov r10, QWORD[rbp-8]
add r10, rbx
mov QWORD[rbp-8], r10
;[[ id : c]]
;[[ @ : @], [ id : cp]]
mov r10, QWORD[rbp-8]
  ; here
and r11, 0xff
mov r11b, byte[r10]
mov rbx, r11
mov QWORD[rbp-48], rbx
jmp _LIFELSE_0x2a
_LIFPOST_0x29:
jmp _LWHILEEND_0x28
_LIFELSE_0x2a:
_LWHILECMP_0x27:
;[[ $ : bool], [ int : 1]]
mov rbx, 1
and r10, 0xff
mov r10, rbx
mov rax, r10
and al, 1
jnz _LWHILESTART_0x26
_LWHILEEND_0x28:
;[[ id : c], [ == : ==], [ char : 46]]
mov r10, 46
mov rbx, QWORD[rbp-48]
cmp rbx, r10
sete bl
mov rax, rbx
and al, 1
jz _LIFPOST_0x2b
;[[ id : pp], [ > : >], [ ( : (], [ id : parts], [ + : +], [ int : 4], [ * : *], [ id : int], [ ) : )]]
mov rbx, 32
lea r10, [rbp-88]
add rbx, r10
mov r10, QWORD[rbp-96]
cmp r10, rbx
seta r10b
mov rax, r10
and al, 1
jz _LIFPOST_0x2d
;[[ int : 0]]
mov rax, 0
jmp ___int_inet_aton_pchar.in_addr.__return
jmp _LIFELSE_0x2e
_LIFPOST_0x2d:
_LIFELSE_0x2e:
;[[ @ : @], [ id : pp]]
mov rbx, QWORD[rbp-96]
mov r10, rbx
;[[ id : val]]
mov rbx, QWORD[rbp-24]
mov qword[r10], rbx
;[[ id : pp]]
;[[ id : int]]
mov rbx, 8
mov r10, QWORD[rbp-96]
add r10, rbx
mov QWORD[rbp-96], r10
;[[ id : cp]]
;[[ int : 1]]
mov rbx, 1
mov r10, QWORD[rbp-8]
add r10, rbx
mov QWORD[rbp-8], r10
;[[ id : c]]
;[[ @ : @], [ id : cp]]
mov r10, QWORD[rbp-8]
  ; here
and r11, 0xff
mov r11b, byte[r10]
mov rbx, r11
mov QWORD[rbp-48], rbx
jmp _LIFELSE_0x2c
_LIFPOST_0x2b:
jmp _LWHILEEND_0x25
_LIFELSE_0x2c:
_LWHILECMP_0x24:
;[[ $ : bool], [ int : 1]]
mov rbx, 1
and r10, 0xff
mov r10, rbx
mov rax, r10
and al, 1
jnz _LWHILESTART_0x23
_LWHILEEND_0x25:
;[[ @ : @], [ id : pp]]
mov rbx, QWORD[rbp-96]
mov r10, rbx
;[[ id : val]]
mov rbx, QWORD[rbp-24]
mov qword[r10], rbx
;[[ id : c], [ != : !=], [ int : 0], [ && : &&], [ id : c], [ != : !=], [ char : 32]]
mov rbx, 0
mov r10, QWORD[rbp-48]
mov r11, r10
cmp rbx, r11
setne bl
mov r11, 32
mov r10, QWORD[rbp-48]
cmp r10, r11
setne r10b
and rbx, r10
mov rax, rbx
and al, 1
jz _LIFPOST_0x2f
;[[ int : 0]]
mov rax, 0
jmp ___int_inet_aton_pchar.in_addr.__return
jmp _LIFELSE_0x30
_LIFPOST_0x2f:
_LIFELSE_0x30:
;[[ id : val]]
;[[ id : val], [ || : ||], [ ( : (], [ ( : (], [ id : parts], [ [ : [], [ int : 0], [ ] : ]], [ << : <<], [ int : 24], [ ) : )], [ || : ||], [ ( : (], [ id : parts], [ [ : [], [ int : 1], [ ] : ]], [ << : <<], [ int : 16], [ ) : )], [ || : ||], [ ( : (], [ id : parts], [ [ : [], [ int : 2], [ ] : ]], [ << : <<], [ int : 8], [ ) : )], [ ) : )]]
mov r11, 0
lea r10, [rbp-88]
lea r10, [r10+r11*8]
mov r10, qword[r10]
shl r10, 24
mov r11, QWORD[rbp-24]
mov r12, r11
or r10, r12
mov r12, 1
lea r11, [rbp-88]
lea r11, [r11+r12*8]
mov r11, qword[r11]
shl r11, 16
or r10, r11
mov r12, 2
lea r11, [rbp-88]
lea r11, [r11+r12*8]
mov r11, qword[r11]
shl r11, 8
or r10, r11
mov rbx, r10
mov QWORD[rbp-24], rbx
;[[ @ : @], [ id : addr]]
mov rbx, QWORD[rbp-16]
mov r10, rbx
;[[ id : val]]
mov r11, QWORD[rbp-24]
mov rbx, r11
mov dword[r10], ebx
;[[ int : 1]]
mov rax, 1
jmp ___int_inet_aton_pchar.in_addr.__return
___int_inet_aton_pchar.in_addr.__return:
leave
ret

;[ function fd_t socket( [[ Variable: int family @ 8], [ Variable: int type @ 16], [ Variable: int protocol @ 24]] ) ]

_fd_t_socket_pintintint:
push rbp
mov rbp, rsp
sub rsp, 32
;Load Parameter: [ Variable: int family @ 8]
mov [rbp-8], rdi
;Load Parameter: [ Variable: int type @ 16]
mov [rbp-16], rsi
;Load Parameter: [ Variable: int protocol @ 24]
mov [rbp-24], rdx
mov rax, 41
    syscall
___fd_t_socket_pintintint__return:
leave
ret

;[ function int connect( [[ Variable: fd_t fd @ 8], [ Variable: sockaddr_in. uservaddr @ 16], [ Variable: int addrlen @ 24]] ) ]

_int_connect_pfd_tsockaddr_in.int:
push rbp
mov rbp, rsp
sub rsp, 32
;Load Parameter: [ Variable: fd_t fd @ 8]
mov [rbp-8], rdi
;Load Parameter: [ Variable: sockaddr_in. uservaddr @ 16]
mov [rbp-16], rsi
;Load Parameter: [ Variable: int addrlen @ 24]
mov [rbp-24], rdx
mov rax, 42
    syscall
___int_connect_pfd_tsockaddr_in.int__return:
leave
ret

;[ function int accept( [[ Variable: fd_t fd @ 8], [ Variable: sockaddr_in. uservaddr @ 16], [ Variable: int addrlen @ 24]] ) ]

_int_accept_pfd_tsockaddr_in.int:
push rbp
mov rbp, rsp
sub rsp, 32
;Load Parameter: [ Variable: fd_t fd @ 8]
mov [rbp-8], rdi
;Load Parameter: [ Variable: sockaddr_in. uservaddr @ 16]
mov [rbp-16], rsi
;Load Parameter: [ Variable: int addrlen @ 24]
mov [rbp-24], rdx
mov rax, 43
    syscall
___int_accept_pfd_tsockaddr_in.int__return:
leave
ret

;[ function int bind( [[ Variable: fd_t fd @ 8], [ Variable: sockaddr_in. umyaddr @ 16], [ Variable: int addrlen @ 24]] ) ]

_int_bind_pfd_tsockaddr_in.int:
push rbp
mov rbp, rsp
sub rsp, 32
;Load Parameter: [ Variable: fd_t fd @ 8]
mov [rbp-8], rdi
;Load Parameter: [ Variable: sockaddr_in. umyaddr @ 16]
mov [rbp-16], rsi
;Load Parameter: [ Variable: int addrlen @ 24]
mov [rbp-24], rdx
mov rax, 49
    syscall
___int_bind_pfd_tsockaddr_in.int__return:
leave
ret

;[ function int listen( [[ Variable: fd_t fd @ 8], [ Variable: int backlog @ 16]] ) ]

_int_listen_pfd_tint:
push rbp
mov rbp, rsp
sub rsp, 24
;Load Parameter: [ Variable: fd_t fd @ 8]
mov [rbp-8], rdi
;Load Parameter: [ Variable: int backlog @ 16]
mov [rbp-16], rsi
mov rax, 50
    syscall
___int_listen_pfd_tint__return:
leave
ret

;[ function int shutdown( [[ Variable: fd_t sockfd @ 8], [ Variable: int how @ 16]] ) ]

_int_shutdown_pfd_tint:
push rbp
mov rbp, rsp
sub rsp, 24
;Load Parameter: [ Variable: fd_t sockfd @ 8]
mov [rbp-8], rdi
;Load Parameter: [ Variable: int how @ 16]
mov [rbp-16], rsi
mov rax, 48
    syscall
___int_shutdown_pfd_tint__return:
leave
ret

;[ function FILE fopen( [[ Variable: char. fname @ 8], [ Variable: char. mode @ 16]] ) ]

_FILE_fopen_pchar.char.:
push rbp
mov rbp, rsp
sub rsp, 56
;Load Parameter: [ Variable: char. fname @ 8]
mov [rbp-8], rdi
;Load Parameter: [ Variable: char. mode @ 16]
mov [rbp-16], rsi
;[[ id : mode], [ [ : [], [ int : 0], [ ] : ]], [ + : +], [ id : mode], [ [ : [], [ int : 1], [ ] : ]]]
mov r10, 0
mov rbx, QWORD[rbp-16]
lea rbx, [rbx+r10*1]
mov r11, 1
mov r10, QWORD[rbp-16]
lea r10, [r10+r11*1]
mov bl, byte[rbx]
and rbx, 0xff
mov r10b, byte[r10]
and r10, 0xff
add rbx, r10
mov QWORD[rbp-24], rbx
;[[ int : 0]]
mov QWORD[rbp-32], 0
;[[ int : 0]]
mov QWORD[rbp-40], 0
;[[ id : modehash], [ == : ==], [ int : 114]]
mov r10, 114
mov rbx, QWORD[rbp-24]
cmp rbx, r10
sete bl
mov rax, rbx
and al, 1
jz _LIFPOST_0x31
;[[ id : f]]
;[[ int : 0]]
mov rbx, 0
mov QWORD[rbp-40], rbx
jmp _LIFELSE_0x32
_LIFPOST_0x31:
;[[ id : modehash], [ == : ==], [ int : 119]]
mov r10, 119
mov rbx, QWORD[rbp-24]
cmp rbx, r10
sete bl
mov rax, rbx
and al, 1
jz _LIFPOST_0x33
;[[ id : f]]
;[[ int : 1]]
mov rbx, 1
mov QWORD[rbp-40], rbx
jmp _LIFELSE_0x34
_LIFPOST_0x33:
;[[ id : modehash], [ == : ==], [ int : 97]]
mov r10, 97
mov rbx, QWORD[rbp-24]
cmp rbx, r10
sete bl
mov rax, rbx
and al, 1
jz _LIFPOST_0x35
;[[ id : f]]
;[[ int : 1], [ || : ||], [ int : 8]]
mov rbx, 1
mov QWORD[rbp-40], rbx
jmp _LIFELSE_0x36
_LIFPOST_0x35:
;[[ id : modehash], [ == : ==], [ int : 157]]
mov r10, 157
mov rbx, QWORD[rbp-24]
cmp rbx, r10
sete bl
mov rax, rbx
and al, 1
jz _LIFPOST_0x37
;[[ id : f]]
;[[ int : 2]]
mov rbx, 2
mov QWORD[rbp-40], rbx
jmp _LIFELSE_0x38
_LIFPOST_0x37:
;[[ id : modehash], [ == : ==], [ int : 162]]
mov r10, 162
mov rbx, QWORD[rbp-24]
cmp rbx, r10
sete bl
mov rax, rbx
and al, 1
jz _LIFPOST_0x39
;[[ id : m]]
;[[ int : 1792]]
mov rbx, 1792
mov QWORD[rbp-32], rbx
;[[ id : f]]
;[[ int : 2], [ || : ||], [ int : 64]]
mov rbx, 2
mov QWORD[rbp-40], rbx
jmp _LIFELSE_0x3a
_LIFPOST_0x39:
;[[ id : m]]
;[[ int : 1792]]
mov rbx, 1792
mov QWORD[rbp-32], rbx
;[[ id : f]]
;[[ int : 2], [ || : ||], [ int : 8], [ || : ||], [ int : 64]]
mov rbx, 2
mov QWORD[rbp-40], rbx
_LIFELSE_0x3a:
_LIFELSE_0x38:
_LIFELSE_0x36:
_LIFELSE_0x34:
_LIFELSE_0x32:
;[[ id : fname]]
mov rbx, QWORD[rbp-8]
mov rdi, rbx
;[[ id : f]]
mov rbx, QWORD[rbp-40]
mov rsi, rbx
;[[ id : m]]
mov rbx, QWORD[rbp-32]
mov rdx, rbx
mov rax, 0
call _fd_t_open_pchar.intmode_t
push rax
;[[ fn(x) : [ function fd_t open( [[ Variable: char. fname @ 0], [ Variable: int flags @ 0], [ Variable: mode_t mode @ 0]] ) ] ]]
pop rax
mov QWORD[rbp-48], rax
;[[ id : modehash], [ == : ==], [ int : 140], [ || : ||], [ id : modehash], [ == : ==], [ int : 87]]
mov r10, 140
mov rbx, QWORD[rbp-24]
cmp rbx, r10
sete bl
mov r11, 87
mov r10, QWORD[rbp-24]
cmp r10, r11
sete r10b
or rbx, r10
mov rax, rbx
and al, 1
jz _LIFPOST_0x3b
;[[ id : out]]
mov rbx, QWORD[rbp-48]
mov rdi, rbx
;[[ int : 0]]
mov rsi, 0
;[[ int : 2]]
mov rdx, 2
mov rax, 0
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

;[ function int fputs( [[ Variable: fd_t fd @ 8], [ Variable: char. text @ 16]] ) ]

_int_fputs_pfd_tchar.:
push rbp
mov rbp, rsp
sub rsp, 40
;Load Parameter: [ Variable: fd_t fd @ 8]
mov [rbp-8], rdi
;Load Parameter: [ Variable: char. text @ 16]
mov [rbp-16], rsi
;[[ id : text]]
mov rbx, QWORD[rbp-16]
mov rdi, rbx
mov rax, 0
call _size_t_strlen_pchar.
push rax
;[[ fn(x) : [ function size_t strlen( [[ Variable: char. str @ 8]] ) ] ]]
pop rax
mov QWORD[rbp-24], rax
;[[ id : fd]]
mov rbx, QWORD[rbp-8]
mov rdi, rbx
;[[ id : text]]
mov rbx, QWORD[rbp-16]
mov rsi, rbx
;[[ id : l]]
mov rbx, QWORD[rbp-24]
mov rdx, rbx
mov rax, 0
call _ssize_t_write_pfd_tchar.size_t
push rax
;[[ fn(x) : [ function ssize_t write( [[ Variable: fd_t fd @ 0], [ Variable: char. buf @ 0], [ Variable: size_t count @ 0]] ) ] ]]
pop rax
mov QWORD[rbp-32], rax
;[[ id : fd]]
mov rbx, QWORD[rbp-8]
mov rdi, rbx
;[[ id : l]]
mov rbx, QWORD[rbp-24]
mov rsi, rbx
;[[ int : 1]]
mov rdx, 1
mov rax, 0
call _int_lseek_pfd_tintint
;[[ id : out]]
mov rbx, QWORD[rbp-32]
mov rax, rbx
jmp ___int_fputs_pfd_tchar.__return
___int_fputs_pfd_tchar.__return:
leave
ret

;[ function bool fgets( [[ Variable: fd_t fd @ 8], [ Variable: char. buffer @ 16], [ Variable: size_t amt @ 24]] ) ]

_bool_fgets_pfd_tchar.size_t:
push rbp
mov rbp, rsp
sub rsp, 40
;Load Parameter: [ Variable: fd_t fd @ 8]
mov [rbp-8], rdi
;Load Parameter: [ Variable: char. buffer @ 16]
mov [rbp-16], rsi
;Load Parameter: [ Variable: size_t amt @ 24]
mov [rbp-24], rdx
;[[ id : fd]]
mov rbx, QWORD[rbp-8]
mov rdi, rbx
;[[ id : buffer]]
mov rbx, QWORD[rbp-16]
mov rsi, rbx
;[[ id : amt]]
mov rbx, QWORD[rbp-24]
mov rdx, rbx
mov rax, 0
call _ssize_t_read_pfd_tchar.size_t
push rax
;[[ fn(x) : [ function ssize_t read( [[ Variable: fd_t fd @ 0], [ Variable: char. buf @ 0], [ Variable: size_t count @ 0]] ) ] ], [ > : >], [ int : 0]]
mov r10, 0
pop rbx
cmp rbx, r10
setg bl
mov QWORD[rbp-32], rbx
;[[ id : fd]]
mov rbx, QWORD[rbp-8]
mov rdi, rbx
;[[ id : amt]]
mov rbx, QWORD[rbp-24]
mov rsi, rbx
;[[ int : 1]]
mov rdx, 1
mov rax, 0
call _int_lseek_pfd_tintint
;[[ id : out]]
mov rax, QWORD[rbp-32]
jmp ___bool_fgets_pfd_tchar.size_t__return
___bool_fgets_pfd_tchar.size_t__return:
leave
ret

;[ function void. floads( [[ Variable: fd_t fd @ 8]] ) ]

_void._floads_pfd_t:
push rbp
mov rbp, rsp
sub rsp, 40
;Load Parameter: [ Variable: fd_t fd @ 8]
mov [rbp-8], rdi
;[[ id : fd]]
mov rbx, QWORD[rbp-8]
mov rdi, rbx
;[[ int : 0]]
mov rsi, 0
;[[ int : 2]]
mov rdx, 2
mov rax, 0
call _int_lseek_pfd_tintint
push rax
;[[ fn(x) : [ function int lseek( [[ Variable: fd_t fd @ 0], [ Variable: int offset @ 0], [ Variable: int whence @ 0]] ) ] ]]
pop rax
mov QWORD[rbp-16], rax
;[[ id : fd]]
mov rbx, QWORD[rbp-8]
mov rdi, rbx
;[[ int : 0], [ - : -], [ id : fsize]]
mov r10, QWORD[rbp-16]
mov rbx, 0
sub rbx, r10
mov rsi, rbx
;[[ int : 2]]
mov rdx, 2
mov rax, 0
call _int_lseek_pfd_tintint
;[[ id : fsize]]
mov rbx, QWORD[rbp-16]
mov rdi, rbx
mov rax, 0
call _void._malloc_psize_t
push rax
;[[ fn(x) : [ function void. malloc( [[ Variable: size_t size @ 8]] ) ] ]]
pop rax
mov QWORD[rbp-24], rax
;[[ id : fd]]
mov rbx, QWORD[rbp-8]
mov rdi, rbx
;[[ id : buffer]]
mov rbx, QWORD[rbp-24]
mov rsi, rbx
;[[ id : fsize]]
mov rbx, QWORD[rbp-16]
mov rdx, rbx
mov rax, 0
call _ssize_t_read_pfd_tchar.size_t
push rax
;[[ fn(x) : [ function ssize_t read( [[ Variable: fd_t fd @ 0], [ Variable: char. buf @ 0], [ Variable: size_t count @ 0]] ) ] ], [ < : <], [ int : 0]]
mov r10, 0
pop rbx
cmp rbx, r10
setl bl
mov QWORD[rbp-32], rbx
;[[ id : out]]
mov rbx, QWORD[rbp-32]
mov rax, rbx
and al, 1
jz _LIFPOST_0x3d
;[[ int : 0]]
mov rax, 0
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

;[ function int getInt( [[ Variable: char. msg @ 8]] ) ]

_int_getInt_pchar.:
push rbp
mov rbp, rsp
sub rsp, 16
;Load Parameter: [ Variable: char. msg @ 8]
mov [rbp-8], rdi
PRINT_STRING [rdi]
    GET_DEC 8, rax
___int_getInt_pchar.__return:
leave
ret

;[ function uint getUint( [[ Variable: char. msg @ 8]] ) ]

_uint_getUint_pchar.:
push rbp
mov rbp, rsp
sub rsp, 16
;Load Parameter: [ Variable: char. msg @ 8]
mov [rbp-8], rdi
PRINT_STRING [rdi]
    GET_UDEC 8, rax
___uint_getUint_pchar.__return:
leave
ret

;[ function char getchar( [] ) ]

_char_getchar_p:
push rbp
mov rbp, rsp
sub rsp, 8
call getchar
___char_getchar_p__return:
leave
ret

;[ function int getHex( [[ Variable: char. msg @ 8]] ) ]

_int_getHex_pchar.:
push rbp
mov rbp, rsp
sub rsp, 16
;Load Parameter: [ Variable: char. msg @ 8]
mov [rbp-8], rdi
PRINT_STRING [rdi]
    GET_HEX 8, rax
___int_getHex_pchar.__return:
leave
ret

;[ function void getString( [[ Variable: char. buffer @ 8], [ Variable: int maxlen @ 16], [ Variable: char. msg @ 24]] ) ]

_void_getString_pchar.intchar.:
push rbp
mov rbp, rsp
sub rsp, 32
;Load Parameter: [ Variable: char. buffer @ 8]
mov [rbp-8], rdi
;Load Parameter: [ Variable: int maxlen @ 16]
mov [rbp-16], rsi
;Load Parameter: [ Variable: char. msg @ 24]
mov [rbp-24], rdx
PRINT_STRING [rdx]
    GET_STRING [rdi], rsi
___void_getString_pchar.intchar.__return:
leave
ret

;[ function void get_stdin( [] ) ]

_void_get_stdin_p:
push rbp
mov rbp, rsp
sub rsp, 8
call get_stdin
___void_get_stdin_p__return:
leave
ret

;[ function char. getString( [[ Variable: char. msg @ 8]] ) ]

_char._getString_pchar.:
push rbp
mov rbp, rsp
sub rsp, 48
;Load Parameter: [ Variable: char. msg @ 8]
mov [rbp-8], rdi
;[[ int : 80]]
mov QWORD[rbp-16], 80
;[[ id : size]]
mov rbx, QWORD[rbp-16]
mov rdi, rbx
mov rax, 0
call _void._malloc_psize_t
push rax
;[[ fn(x) : [ function void. malloc( [[ Variable: size_t size @ 8]] ) ] ]]
pop rax
mov QWORD[rbp-24], rax
;[[ int : 0]]
mov QWORD[rbp-40], 0
;[[ id : STRING_CONSTANT_2]]
mov rbx, STRING_CONSTANT_2
mov rdi, rbx
;[[ id : msg]]
mov rsi, QWORD[rbp-8]
mov rax, 0
call printf
;[[ int : 0]]
mov rdi, 0
;[[ & : &], [ id : c]]
lea rbx, [rbp-32]
mov rsi, rbx
;[[ int : 1]]
mov rdx, 1
mov rax, 0
call _bool_fgets_pfd_tchar.size_t
jmp _LWHILECMP_0x40
_LWHILESTART_0x3f:
;[[ id : len], [ == : ==], [ id : size]]
mov r10, QWORD[rbp-16]
mov rbx, QWORD[rbp-40]
cmp rbx, r10
sete bl
mov rax, rbx
and al, 1
jz _LIFPOST_0x42
;[[ id : size]]
;[[ id : size], [ * : *], [ int : 2]]
mov r10, QWORD[rbp-16]
sal r10, 1
mov rbx, r10
mov QWORD[rbp-16], rbx
;[[ id : str]]
;[[ id : str]]
mov rdi, QWORD[rbp-24]
;[[ id : size]]
mov rbx, QWORD[rbp-16]
mov rsi, rbx
mov rax, 0
call _void._realloc_pvoid.size_t
push rax
;[[ fn(x) : [ function void. realloc( [[ Variable: void. og @ 8], [ Variable: size_t newsize @ 16]] ) ] ]]
pop rbx
mov QWORD[rbp-24], rbx
jmp _LIFELSE_0x43
_LIFPOST_0x42:
_LIFELSE_0x43:
;[[ id : str], [ [ : [], [ id : len], [ ] : ]]]
mov r10, QWORD[rbp-40]
mov rbx, QWORD[rbp-24]
lea rbx, [rbx+r10*1]
;[[ id : c]]
mov r10, QWORD[rbp-32]
mov byte[rbx], r10b
;[[ int : 0]]
mov rdi, 0
;[[ & : &], [ id : c]]
lea rbx, [rbp-32]
mov rsi, rbx
;[[ int : 1]]
mov rdx, 1
mov rax, 0
call _bool_fgets_pfd_tchar.size_t
;[[ id : len]]
;[[ id : len], [ + : +], [ int : 1]]
mov r10, QWORD[rbp-40]
inc r10
mov rbx, r10
mov QWORD[rbp-40], rbx
_LWHILECMP_0x40:
;[[ id : c], [ != : !=], [ int : 10]]
mov r10, 10
mov rbx, QWORD[rbp-32]
cmp rbx, r10
setne bl
mov rax, rbx
and al, 1
jnz _LWHILESTART_0x3f
_LWHILEEND_0x41:
;[[ id : str], [ [ : [], [ id : len], [ + : +], [ int : 1], [ ] : ]]]
mov rbx, QWORD[rbp-40]
inc rbx
mov r10, QWORD[rbp-24]
lea r10, [r10+rbx*1]
;[[ int : 0]]
mov rbx, 0
mov byte[r10], bl
;[[ id : str]]
mov rdi, QWORD[rbp-24]
;[[ id : len]]
mov rbx, QWORD[rbp-40]
mov rsi, rbx
mov rax, 0
call _void._realloc_pvoid.size_t
push rax
;[[ fn(x) : [ function void. realloc( [[ Variable: void. og @ 8], [ Variable: size_t newsize @ 16]] ) ] ]]
pop rax
jmp ___char._getString_pchar.__return
___char._getString_pchar.__return:
leave
ret

;[ function int toInteger( [[ Variable: char. str @ 8]] ) ]

_int_toInteger_pchar.:
push rbp
mov rbp, rsp
sub rsp, 48
;Load Parameter: [ Variable: char. str @ 8]
mov [rbp-8], rdi
;[[ id : str]]
mov rbx, QWORD[rbp-8]
mov rdi, rbx
mov rax, 0
call _size_t_strlen_pchar.
push rax
;[[ fn(x) : [ function size_t strlen( [[ Variable: char. str @ 8]] ) ] ]]
pop rax
mov QWORD[rbp-16], rax
;[[ $ : bool], [ int : 1]]
mov rbx, 1
and r10, 0xff
mov r10, rbx
mov QWORD[rbp-24], r10
;[[ id : str], [ [ : [], [ int : 0], [ ] : ]], [ == : ==], [ char : 45]]
mov r10, 0
mov rbx, QWORD[rbp-8]
lea rbx, [rbx+r10*1]
mov bl, byte[rbx]
and rbx, 0xff
mov r10, 45
cmp rbx, r10
sete bl
mov rax, rbx
and al, 1
jz _LIFPOST_0x44
;[[ id : positive]]
;[[ $ : bool], [ int : 0]]
mov r10, 0
and r11, 0xff
mov r11, r10
mov rbx, r11
mov QWORD[rbp-24], rbx
;[[ id : str]]
;[[ id : str], [ + : +], [ int : 1]]
mov r10, QWORD[rbp-8]
inc r10
mov rbx, r10
mov QWORD[rbp-8], rbx
;[[ id : l]]
;[[ int : 1]]
mov rbx, 1
mov r10, QWORD[rbp-16]
sub r10, rbx
mov QWORD[rbp-16], r10
jmp _LIFELSE_0x45
_LIFPOST_0x44:
_LIFELSE_0x45:
;[[ int : 0]]
mov QWORD[rbp-32], 0
;[[ int : 0]]
mov QWORD[rbp-40], 0
jmp _LFORCMP_0x47
_LFORTOP_0x46:
;[[ id : total]]
;[[ ( : (], [ id : total], [ * : *], [ int : 10], [ ) : )], [ + : +], [ ( : (], [ id : str], [ [ : [], [ id : i], [ ] : ]], [ - : -], [ char : 48], [ ) : )]]
mov r11, 10
mov r10, QWORD[rbp-32]
imul r10, r11
mov r12, QWORD[rbp-40]
mov r11, QWORD[rbp-8]
lea r11, [r11+r12*1]
mov r11b, byte[r11]
and r11, 0xff
mov r12, r11
add r10, r12
mov r11, 48
mov r12, r11
sub r10, r12
mov rbx, r10
mov QWORD[rbp-32], rbx
_LFORUPDATE_0x48:
;[[ id : i]]
;[[ int : 1]]
mov rbx, 1
mov r10, QWORD[rbp-40]
add r10, rbx
mov QWORD[rbp-40], r10
_LFORCMP_0x47:
;[[ id : i], [ < : <], [ id : l]]
mov r10, QWORD[rbp-16]
mov rbx, QWORD[rbp-40]
cmp rbx, r10
setl bl
mov rax, rbx
and al, 1
jnz _LFORTOP_0x46
_LFOREND_0x49:
;[[ ! : !], [ id : positive]]
mov rbx, QWORD[rbp-24]
cmp rbx, 0
sete bl
mov rax, rbx
and al, 1
jz _LIFPOST_0x4a
;[[ int : 0], [ - : -], [ id : total]]
mov r10, QWORD[rbp-32]
mov rbx, 0
sub rbx, r10
mov rax, rbx
jmp ___int_toInteger_pchar.__return
jmp _LIFELSE_0x4b
_LIFPOST_0x4a:
_LIFELSE_0x4b:
;[[ id : total]]
mov rbx, QWORD[rbp-32]
mov rax, rbx
jmp ___int_toInteger_pchar.__return
___int_toInteger_pchar.__return:
leave
ret

;[ function void iVec3d( [[ Variable: Vec3d. this @ 8], [ Variable: double a @ 16], [ Variable: double b @ 24], [ Variable: double c @ 32]] ) ]

_void_iVec3d_pVec3d.doubledoubledouble:
push rbp
mov rbp, rsp
sub rsp, 40
;Load Parameter: [ Variable: Vec3d. this @ 8]
mov [rbp-8], rdi
;Load Parameter: [ Variable: double a @ 16]
movsd [rbp-16], xmm0
;Load Parameter: [ Variable: double b @ 24]
movsd [rbp-24], xmm1
;Load Parameter: [ Variable: double c @ 32]
movsd [rbp-32], xmm2
;[[ id : this], [ -> : ->], [ id : x]]
mov rbx, QWORD[rbp-8]
;[[ id : a]]
movsd xmm8, QWORD[rbp-16]
movsd xmm7, xmm8
movq qword[rbx], xmm7
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
;[[ id : c]]
movsd xmm8, QWORD[rbp-32]
movsd xmm7, xmm8
movq qword[rbx], xmm7
___void_iVec3d_pVec3d.doubledoubledouble__return:
leave
ret

;[ function void v3dadd( [[ Variable: Vec3d. dest @ 8], [ Variable: Vec3d. other @ 16]] ) ]

_void_v3dadd_pVec3d.Vec3d.:
push rbp
mov rbp, rsp
sub rsp, 24
;Load Parameter: [ Variable: Vec3d. dest @ 8]
mov [rbp-8], rdi
;Load Parameter: [ Variable: Vec3d. other @ 16]
mov [rbp-16], rsi
;[[ int : 0]]
mov rbx, 0
shl rbx, 3
add rbx, [rbp-8]
vmovdqu ymm0, [rbx]
;[[ int : 0]]
mov rbx, 0
shl rbx, 3
add rbx, [rbp-16]
vmovdqu ymm1, [rbx]
vaddpd ymm0, ymm1, ymm0
;[[ int : 0]]
mov rbx, 0
shl rbx, 3
add rbx, [rbp-8]
vmovdqu [rbx], ymm0
___void_v3dadd_pVec3d.Vec3d.__return:
leave
ret

;[ function void v3dsub( [[ Variable: Vec3d. dest @ 8], [ Variable: Vec3d. other @ 16]] ) ]

_void_v3dsub_pVec3d.Vec3d.:
push rbp
mov rbp, rsp
sub rsp, 24
;Load Parameter: [ Variable: Vec3d. dest @ 8]
mov [rbp-8], rdi
;Load Parameter: [ Variable: Vec3d. other @ 16]
mov [rbp-16], rsi
;[[ int : 0]]
mov rbx, 0
shl rbx, 3
add rbx, [rbp-8]
vmovdqu ymm0, [rbx]
;[[ int : 0]]
mov rbx, 0
shl rbx, 3
add rbx, [rbp-16]
vmovdqu ymm1, [rbx]
vsubpd ymm0, ymm1, ymm0
;[[ int : 0]]
mov rbx, 0
shl rbx, 3
add rbx, [rbp-8]
vmovdqu [rbx], ymm0
___void_v3dsub_pVec3d.Vec3d.__return:
leave
ret

;[ function void v3dcross( [[ Variable: Vec3d. dest @ 8], [ Variable: Vec3d. other @ 16]] ) ]

_void_v3dcross_pVec3d.Vec3d.:
push rbp
mov rbp, rsp
sub rsp, 24
;Load Parameter: [ Variable: Vec3d. dest @ 8]
mov [rbp-8], rdi
;Load Parameter: [ Variable: Vec3d. other @ 16]
mov [rbp-16], rsi
;[[ int : 0]]
mov rbx, 0
shl rbx, 3
add rbx, [rbp-8]
vmovdqu ymm0, [rbx]
;[[ int : 0]]
mov rbx, 0
shl rbx, 3
add rbx, [rbp-16]
vmovdqu ymm1, [rbx]
vmulpd ymm0, ymm1, ymm0
;[[ int : 0]]
mov rbx, 0
shl rbx, 3
add rbx, [rbp-8]
vmovdqu [rbx], ymm0
___void_v3dcross_pVec3d.Vec3d.__return:
leave
ret

;[ function int main( [[ Variable: int argc @ 8], [ Variable: char.. argv @ 16]] ) ]

main:
push rbp
mov rbp, rsp
sub rsp, 32
;Load Parameter: [ Variable: int argc @ 8]
mov [rbp-8], rdi
;Load Parameter: [ Variable: char.. argv @ 16]
mov [rbp-16], rsi
;[[ id : STRING_CONSTANT_3]]
mov rbx, STRING_CONSTANT_3
mov QWORD[rbp-24], rbx
;[[ id : STRING_CONSTANT_4]]
mov rbx, STRING_CONSTANT_4
mov rdi, rbx
mov rax, 0
call printf
jmp __main__return
__main__return:
leave
ret
