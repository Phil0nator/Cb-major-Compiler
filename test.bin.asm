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
section .data
    FLT_CONSTANT_0: dq 0x0.0p+0
STRING_CONSTANT_0: db `True`, 0
STRING_CONSTANT_1: db `False`, 0
STRING_CONSTANT_2: db `%li\n`, 0
STRING_CONSTANT_3: db `%lu\n`, 0
STRING_CONSTANT_4: db `%lf\n`, 0
STRING_CONSTANT_5: db `True`, 0
STRING_CONSTANT_6: db `False`, 0
STRING_CONSTANT_7: db `[]`, 0
STRING_CONSTANT_8: db `[`, 0
STRING_CONSTANT_9: db ` %i ,`, 0
STRING_CONSTANT_10: db ` %i ]\n`, 0
STRING_CONSTANT_11: db `The int: %i, the double: %f, a string: %s, and a bool %b.`, 0
FLT_CONSTANT_1: dq 0x1.399999999999ap+1
STRING_CONSTANT_12: db `abc`, 0
nullptr: DQ 0
null: DQ 0
nullterm: DQ 0
M_MINZERO_MEM: DQ 0
section .bss
align 16
    
    __heap_padding__: resz 1
section .text
global CMAIN

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
mov rcx, 32
mov rbx, QWORD[rbp-24]
xor rdx, rdx
mov rax, rbx
idiv rcx
 mov rbx, rdx
mov QWORD[rbp-32], rbx
;[[ ( : (], [ id : bytes], [ - : -], [ id : offset], [ ) : )], [ / : /], [ int : 4]]
mov rcx, QWORD[rbp-32]
mov rbx, QWORD[rbp-24]
sub rbx, rcx
sar rbx, 2
mov QWORD[rbp-40], rbx
;[[ int : 0]]
mov QWORD[rbp-48], 0
jmp _LFORCMP_0x1
_LFORTOP_0x0:
;[[ id : i]]
mov rcx, QWORD[rbp-48]
mov rbx, rcx
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
mov r10, 4
mov rcx, QWORD[rbp-48]
add rcx, r10
mov rbx, rcx
mov QWORD[rbp-48], rbx
_LFORCMP_0x1:
;[[ id : i], [ < : <], [ id : avxcount]]
mov rcx, QWORD[rbp-40]
mov rbx, QWORD[rbp-48]
cmp rbx, rcx
setl bl
mov rax, rbx
and al, 1
jnz _LFORTOP_0x0
_LFOREND_0x3:
;[[ id : offset], [ != : !=], [ int : 0]]
mov rcx, 0
mov rbx, QWORD[rbp-32]
cmp rbx, rcx
setne bl
mov rax, rbx
and al, 1
jz _LIFPOST_0x4
;[[ id : dest], [ + : +], [ id : avxcount]]
mov rbx, QWORD[rbp-8]
mov rcx, QWORD[rbp-40]
add rbx, rcx
mov rdi, rbx
;[[ id : source], [ + : +], [ id : avxcount]]
mov rbx, QWORD[rbp-16]
mov rcx, QWORD[rbp-40]
add rbx, rcx
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
  movsd xmm2, [M_MINZERO_MEM]
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
mov rcx, 0
mov rbx, QWORD[rbp-8]
cmp rbx, rcx
setl bl
mov rcx, QWORD[rbp-24]
and rbx, rcx
mov rax, rbx
and al, 1
jz _LIFPOST_0x6
;[[ @ : @], [ id : buffer]]
mov rbx, QWORD[rbp-16]
mov rcx, rbx
;[[ char : 45]]
mov rbx, 45
mov byte[rcx], bl
;[[ id : buffer]]
;[[ int : 1]]
mov rbx, 1
mov rcx, QWORD[rbp-16]
add rcx, rbx
mov QWORD[rbp-16], rcx
;[[ id : val]]
;[[ int : 0], [ - : -], [ id : val]]
mov r10, QWORD[rbp-8]
mov rcx, 0
sub rcx, r10
mov rbx, rcx
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
mov rcx, QWORD[rbp-16]
add rcx, rbx
mov QWORD[rbp-16], rcx
;[[ int : 0]]
mov QWORD[rbp-48], 0
jmp _LFORCMP_0x9
_LFORTOP_0x8:
;[[ id : buffer]]
;[[ int : 1]]
mov rbx, 1
mov rcx, QWORD[rbp-16]
sub rcx, rbx
mov QWORD[rbp-16], rcx
;[[ @ : @], [ id : buffer]]
mov rbx, QWORD[rbp-16]
mov rcx, rbx
;[[ $ : char], [ ( : (], [ id : val], [ % : %], [ int : 10], [ ) : )], [ + : +], [ char : 48]]
mov r11, 10
mov r10, QWORD[rbp-8]
xor rdx, rdx
mov rax, r10
idiv r11
 mov r10, rdx
mov r11, r10
and r12, 0xff
mov r12, r11
mov r11, 48
add r12, r11
mov rbx, r12
mov byte[rcx], bl
;[[ id : val]]
;[[ int : 10]]
mov rbx, 10
mov rcx, QWORD[rbp-8]
xor rdx, rdx
mov rax,rcx
idiv rbx
mov rcx, rax
mov QWORD[rbp-8], rcx
_LFORUPDATE_0xa:
;[[ id : i]]
;[[ int : 1]]
mov rbx, 1
mov rcx, QWORD[rbp-48]
add rcx, rbx
mov QWORD[rbp-48], rcx
_LFORCMP_0x9:
;[[ id : i], [ < : <], [ id : l]]
mov rcx, QWORD[rbp-40]
mov rbx, QWORD[rbp-48]
cmp rbx, rcx
setl bl
mov rax, rbx
and al, 1
jnz _LFORTOP_0x8
_LFOREND_0xb:
;[[ id : l], [ + : +], [ id : signspace]]
mov rcx, QWORD[rbp-32]
mov rbx, QWORD[rbp-40]
add rbx, rcx
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
mov rcx, QWORD[rbp-16]
add rcx, rbx
mov QWORD[rbp-16], rcx
;[[ id : val]]
;[[ id : integral]]
cvtsi2sd xmm7, QWORD[rbp-32]
movsd xmm8, QWORD[rbp-8]
subsd xmm8, xmm7
movsd QWORD[rbp-8], xmm8
;[[ id : val]]
;[[ id : val], [ * : *], [ id : multiplier]]
movsd xmm8, QWORD[rbp-8]
mov rbx, QWORD[rbp-24]
cvtsi2sd xmm9, rbx
mulsd xmm8, xmm9
movsd xmm7, xmm8
movsd QWORD[rbp-8], xmm7
;[[ @ : @], [ id : buffer]]
mov rbx, QWORD[rbp-16]
mov rcx, rbx
;[[ char : 46]]
mov rbx, 46
mov byte[rcx], bl
;[[ id : buffer]]
;[[ int : 1]]
mov rbx, 1
mov rcx, QWORD[rbp-16]
add rcx, rbx
mov QWORD[rbp-16], rcx
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
mov rcx, QWORD[rbp-40]
add rcx, rbx
mov QWORD[rbp-40], rcx
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
mov rcx, 0
cmp rbx, rcx
sete bl
mov rcx, QWORD[rbp-16]
mov r10, 0
cmp rcx, r10
sete cl
or rbx, rcx
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
and rcx, 0xff
mov cl, byte[rbx]
mov rbx, 37
cmp rcx, rbx
setne cl
mov rax, rcx
and al, 1
jz _LIFPOST_0x11
;[[ @ : @], [ id : str]]
mov rbx, QWORD[rbp-8]
mov rcx, rbx
;[[ @ : @], [ id : fmt]]
mov r10, QWORD[rbp-16]
  ; here
and r11, 0xff
mov r11b, byte[r10]
mov rbx, r11
mov byte[rcx], bl
jmp _LIFELSE_0x12
_LIFPOST_0x11:
;[[ id : fmt]]
;[[ int : 1]]
mov rbx, 1
mov rcx, QWORD[rbp-16]
add rcx, rbx
mov QWORD[rbp-16], rcx
;[[ @ : @], [ id : fmt]]
mov rbx, QWORD[rbp-16]
  ; here
and rcx, 0xff
mov cl, byte[rbx]
mov QWORD[rbp-48], rcx
;[[ id : c], [ == : ==], [ char : 105]]
mov rcx, 105
mov rbx, QWORD[rbp-48]
cmp rbx, rcx
sete bl
mov rax, rbx
and al, 1
jz _LIFPOST_0x13
;[[ ( : (], [ id : args], [ [ : [], [ id : argc], [ ] : ]], [ ) : )]]
mov rcx, QWORD[rbp-32]
mov rbx, QWORD[rbp-24]
lea rbx, [rbx+rcx*8]
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
mov rcx, QWORD[rbp-64]
dec rcx
mov rbx, rcx
mov rcx, QWORD[rbp-8]
add rcx, rbx
mov QWORD[rbp-8], rcx
jmp _LIFELSE_0x14
_LIFPOST_0x13:
;[[ id : c], [ == : ==], [ char : 99]]
mov rcx, 99
mov rbx, QWORD[rbp-48]
cmp rbx, rcx
sete bl
mov rax, rbx
and al, 1
jz _LIFPOST_0x15
;[[ $ : char], [ id : args], [ [ : [], [ id : argc], [ ] : ]]]
mov rcx, QWORD[rbp-32]
mov rbx, QWORD[rbp-24]
lea rbx, [rbx+rcx*8]
mov rbx, qword[rbx]
mov rcx, rbx
and r10, 0xff
mov r10, rcx
mov QWORD[rbp-72], r10
;[[ @ : @], [ id : str]]
mov rbx, QWORD[rbp-8]
mov rcx, rbx
;[[ id : cf]]
mov r10, QWORD[rbp-72]
mov rbx, r10
mov byte[rcx], bl
jmp _LIFELSE_0x16
_LIFPOST_0x15:
;[[ id : c], [ == : ==], [ char : 117]]
mov rcx, 117
mov rbx, QWORD[rbp-48]
cmp rbx, rcx
sete bl
mov rax, rbx
and al, 1
jz _LIFPOST_0x17
;[[ ( : (], [ id : args], [ [ : [], [ id : argc], [ ] : ]], [ ) : )]]
mov rcx, QWORD[rbp-32]
mov rbx, QWORD[rbp-24]
lea rbx, [rbx+rcx*8]
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
mov rcx, QWORD[rbp-88]
dec rcx
mov rbx, rcx
mov rcx, QWORD[rbp-8]
add rcx, rbx
mov QWORD[rbp-8], rcx
jmp _LIFELSE_0x18
_LIFPOST_0x17:
;[[ id : c], [ == : ==], [ char : 115]]
mov rcx, 115
mov rbx, QWORD[rbp-48]
cmp rbx, rcx
sete bl
mov rax, rbx
and al, 1
jz _LIFPOST_0x19
;[[ id : str]]
mov rbx, QWORD[rbp-8]
mov rdi, rbx
;[[ id : args], [ [ : [], [ id : argc], [ ] : ]]]
mov rcx, QWORD[rbp-32]
mov rbx, QWORD[rbp-24]
lea rbx, [rbx+rcx*8]
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
mov rcx, QWORD[rbp-96]
dec rcx
mov rbx, rcx
mov rcx, QWORD[rbp-8]
add rcx, rbx
mov QWORD[rbp-8], rcx
jmp _LIFELSE_0x1a
_LIFPOST_0x19:
;[[ id : c], [ == : ==], [ char : 98]]
mov rcx, 98
mov rbx, QWORD[rbp-48]
cmp rbx, rcx
sete bl
mov rax, rbx
and al, 1
jz _LIFPOST_0x1b
;[[ id : args], [ [ : [], [ id : argc], [ ] : ]]]
mov rcx, QWORD[rbp-32]
mov rbx, QWORD[rbp-24]
lea rbx, [rbx+rcx*8]
mov rbx, qword[rbx]
mov QWORD[rbp-104], rbx
;[[ id : b]]
mov rbx, QWORD[rbp-104]
mov rax, rbx
and al, 1
jz _LIFPOST_0x1d
;[[ id : boolean_string]]
;[[ id : STRING_CONSTANT_0]]
mov rcx, STRING_CONSTANT_0
mov rbx, rcx
mov QWORD[rbp-112], rbx
jmp _LIFELSE_0x1e
_LIFPOST_0x1d:
;[[ id : boolean_string]]
;[[ id : STRING_CONSTANT_1]]
mov rcx, STRING_CONSTANT_1
mov rbx, rcx
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
mov rcx, QWORD[rbp-8]
add rcx, rbx
mov QWORD[rbp-8], rcx
jmp _LIFELSE_0x1c
_LIFPOST_0x1b:
;[[ id : c], [ == : ==], [ char : 100]]
mov rcx, 100
mov rbx, QWORD[rbp-48]
cmp rbx, rcx
sete bl
mov rax, rbx
and al, 1
jz _LIFPOST_0x1f
;[[ id : args], [ [ : [], [ id : argc], [ ] : ]]]
mov rcx, QWORD[rbp-32]
mov rbx, QWORD[rbp-24]
lea rbx, [rbx+rcx*8]
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
mov rcx, QWORD[rbp-136]
dec rcx
mov rbx, rcx
mov rcx, QWORD[rbp-8]
add rcx, rbx
mov QWORD[rbp-8], rcx
jmp _LIFELSE_0x20
_LIFPOST_0x1f:
;[[ id : c], [ == : ==], [ char : 102]]
mov rcx, 102
mov rbx, QWORD[rbp-48]
cmp rbx, rcx
sete bl
mov rax, rbx
and al, 1
jz _LIFPOST_0x21
;[[ id : args], [ [ : [], [ id : argc], [ ] : ]]]
mov rcx, QWORD[rbp-32]
mov rbx, QWORD[rbp-24]
lea rbx, [rbx+rcx*8]
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
mov rcx, QWORD[rbp-152]
dec rcx
mov rbx, rcx
mov rcx, QWORD[rbp-8]
add rcx, rbx
mov QWORD[rbp-8], rcx
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
mov rcx, QWORD[rbp-32]
add rcx, rbx
mov QWORD[rbp-32], rcx
_LIFELSE_0x12:
;[[ id : fmt]]
;[[ int : 1]]
mov rbx, 1
mov rcx, QWORD[rbp-16]
add rcx, rbx
mov QWORD[rbp-16], rcx
;[[ id : str]]
;[[ int : 1]]
mov rbx, 1
mov rcx, QWORD[rbp-8]
add rcx, rbx
mov QWORD[rbp-8], rcx
_LWHILECMP_0xf:
;[[ @ : @], [ id : fmt], [ != : !=], [ int : 0]]
mov rbx, QWORD[rbp-16]
  ; here
and rcx, 0xff
mov cl, byte[rbx]
mov rbx, 0
mov r10, rcx
cmp rbx, r10
setne bl
mov rax, rbx
and al, 1
jnz _LWHILESTART_0xe
_LWHILEEND_0x10:
;[[ ( : (], [ $ : int], [ id : str], [ ) : )], [ - : -], [ id : og]]
mov rcx, QWORD[rbp-40]
mov rbx, QWORD[rbp-8]
sub rbx, rcx
mov rax, rbx
jmp ___int___sprintf_pchar.char.void.__return
___int___sprintf_pchar.char.void.__return:
leave
ret

;[ function void sscanf( [[ Variable: char. template @ 8], [ Variable: char. format @ 16], [ Variable: void a @ 24]] ) ]

_void_sscanf_pchar.char.void:
push rbp
mov rbp, rsp
sub rsp, 32
;Load Parameter: [ Variable: char. template @ 8]
mov [rbp-8], rdi
;Load Parameter: [ Variable: char. format @ 16]
mov [rbp-16], rsi
;Load Parameter: [ Variable: void a @ 24]
mov [rbp-24], rdx
ALIGN_STACK
    call sscanf
    UNALIGN_STACK
___void_sscanf_pchar.char.void__return:
leave
ret

;[ function void sscanf( [[ Variable: char. template @ 8], [ Variable: char. format @ 16], [ Variable: void a @ 24], [ Variable: void b @ 32]] ) ]

_void_sscanf_pchar.char.voidvoid:
push rbp
mov rbp, rsp
sub rsp, 40
;Load Parameter: [ Variable: char. template @ 8]
mov [rbp-8], rdi
;Load Parameter: [ Variable: char. format @ 16]
mov [rbp-16], rsi
;Load Parameter: [ Variable: void a @ 24]
mov [rbp-24], rdx
;Load Parameter: [ Variable: void b @ 32]
mov [rbp-32], rcx
ALIGN_STACK
    call sscanf
    UNALIGN_STACK
___void_sscanf_pchar.char.voidvoid__return:
leave
ret

;[ function void sscanf( [[ Variable: char. template @ 8], [ Variable: char. format @ 16], [ Variable: void a @ 24], [ Variable: void b @ 32], [ Variable: void c @ 40]] ) ]

_void_sscanf_pchar.char.voidvoidvoid:
push rbp
mov rbp, rsp
sub rsp, 48
;Load Parameter: [ Variable: char. template @ 8]
mov [rbp-8], rdi
;Load Parameter: [ Variable: char. format @ 16]
mov [rbp-16], rsi
;Load Parameter: [ Variable: void a @ 24]
mov [rbp-24], rdx
;Load Parameter: [ Variable: void b @ 32]
mov [rbp-32], rcx
;Load Parameter: [ Variable: void c @ 40]
mov [rbp-40], r8
ALIGN_STACK
    call sscanf
    UNALIGN_STACK
___void_sscanf_pchar.char.voidvoidvoid__return:
leave
ret

;[ function void sscanf( [[ Variable: char. template @ 8], [ Variable: char. format @ 16], [ Variable: void a @ 24], [ Variable: void b @ 32], [ Variable: void c @ 40], [ Variable: void d @ 48]] ) ]

_void_sscanf_pchar.char.voidvoidvoidvoid:
push rbp
mov rbp, rsp
sub rsp, 56
;Load Parameter: [ Variable: char. template @ 8]
mov [rbp-8], rdi
;Load Parameter: [ Variable: char. format @ 16]
mov [rbp-16], rsi
;Load Parameter: [ Variable: void a @ 24]
mov [rbp-24], rdx
;Load Parameter: [ Variable: void b @ 32]
mov [rbp-32], rcx
;Load Parameter: [ Variable: void c @ 40]
mov [rbp-40], r8
;Load Parameter: [ Variable: void d @ 48]
mov [rbp-48], r9
ALIGN_STACK
    call sscanf
    UNALIGN_STACK
___void_sscanf_pchar.char.voidvoidvoidvoid__return:
leave
ret

;[ function void printf( [[ Variable: char. single @ 8]] ) ]

_void_printf_pchar.:
push rbp
mov rbp, rsp
sub rsp, 16
;Load Parameter: [ Variable: char. single @ 8]
mov [rbp-8], rdi
ALIGN_STACK
    call printf
    FFLUSH_STDOUT
    UNALIGN_STACK
___void_printf_pchar.__return:
leave
ret

;[ function void printf( [[ Variable: char. template @ 8], [ Variable: int format @ 16]] ) ]

_void_printf_pchar.int:
push rbp
mov rbp, rsp
sub rsp, 24
;Load Parameter: [ Variable: char. template @ 8]
mov [rbp-8], rdi
;Load Parameter: [ Variable: int format @ 16]
mov [rbp-16], rsi
ALIGN_STACK
call printf
FFLUSH_STDOUT
UNALIGN_STACK
___void_printf_pchar.int__return:
leave
ret

;[ function void printf( [[ Variable: char. template @ 8], [ Variable: void a @ 16], [ Variable: void b @ 24], [ Variable: void c @ 32]] ) ]

_void_printf_pchar.voidvoidvoid:
push rbp
mov rbp, rsp
sub rsp, 40
;Load Parameter: [ Variable: char. template @ 8]
mov [rbp-8], rdi
;Load Parameter: [ Variable: void a @ 16]
mov [rbp-16], rsi
;Load Parameter: [ Variable: void b @ 24]
mov [rbp-24], rdx
;Load Parameter: [ Variable: void c @ 32]
mov [rbp-32], rcx
ALIGN_STACK
call printf
FFLUSH_STDOUT
UNALIGN_STACK
___void_printf_pchar.voidvoidvoid__return:
leave
ret

;[ function void printf( [[ Variable: char. template @ 8], [ Variable: uint format @ 16]] ) ]

_void_printf_pchar.uint:
push rbp
mov rbp, rsp
sub rsp, 24
;Load Parameter: [ Variable: char. template @ 8]
mov [rbp-8], rdi
;Load Parameter: [ Variable: uint format @ 16]
mov [rbp-16], rsi
ALIGN_STACK
call printf
FFLUSH_STDOUT
UNALIGN_STACK
___void_printf_pchar.uint__return:
leave
ret

;[ function void printf( [[ Variable: char. template @ 8], [ Variable: double f @ 16]] ) ]

_void_printf_pchar.double:
push rbp
mov rbp, rsp
sub rsp, 24
;Load Parameter: [ Variable: char. template @ 8]
mov [rbp-8], rdi
;Load Parameter: [ Variable: double f @ 16]
movsd [rbp-16], xmm0
ALIGN_STACK
mov rax, 1
call printf
FFLUSH_STDOUT
UNALIGN_STACK
___void_printf_pchar.double__return:
leave
ret

;[ function void printf( [[ Variable: char. template @ 8], [ Variable: char. other @ 16]] ) ]

_void_printf_pchar.char.:
push rbp
mov rbp, rsp
sub rsp, 24
;Load Parameter: [ Variable: char. template @ 8]
mov [rbp-8], rdi
;Load Parameter: [ Variable: char. other @ 16]
mov [rbp-16], rsi
ALIGN_STACK
call printf
FFLUSH_STDOUT
UNALIGN_STACK
___void_printf_pchar.char.__return:
leave
ret

;[ function void printf( [[ Variable: char. template @ 8], [ Variable: int a @ 16], [ Variable: int b @ 24]] ) ]

_void_printf_pchar.intint:
push rbp
mov rbp, rsp
sub rsp, 32
;Load Parameter: [ Variable: char. template @ 8]
mov [rbp-8], rdi
;Load Parameter: [ Variable: int a @ 16]
mov [rbp-16], rsi
;Load Parameter: [ Variable: int b @ 24]
mov [rbp-24], rdx
ALIGN_STACK
call printf
FFLUSH_STDOUT
UNALIGN_STACK
___void_printf_pchar.intint__return:
leave
ret

;[ function void printf( [[ Variable: char. template @ 8], [ Variable: double a @ 16], [ Variable: double b @ 24]] ) ]

_void_printf_pchar.doubledouble:
push rbp
mov rbp, rsp
sub rsp, 32
;Load Parameter: [ Variable: char. template @ 8]
mov [rbp-8], rdi
;Load Parameter: [ Variable: double a @ 16]
movsd [rbp-16], xmm0
;Load Parameter: [ Variable: double b @ 24]
movsd [rbp-24], xmm1
ALIGN_STACK
call printf
FFLUSH_STDOUT
UNALIGN_STACK
___void_printf_pchar.doubledouble__return:
leave
ret

;[ function void print( [[ Variable: int a @ 8]] ) ]

_void_print_pint:
push rbp
mov rbp, rsp
sub rsp, 16
;Load Parameter: [ Variable: int a @ 8]
mov [rbp-8], rdi
;[[ id : STRING_CONSTANT_2]]
mov rbx, STRING_CONSTANT_2
mov rdi, rbx
;[[ id : a]]
mov rbx, QWORD[rbp-8]
mov rsi, rbx
mov rax, 0
call _void_printf_pchar.int
___void_print_pint__return:
leave
ret

;[ function void print( [[ Variable: short a @ 8]] ) ]

_void_print_pshort:
push rbp
mov rbp, rsp
sub rsp, 16
;Load Parameter: [ Variable: short a @ 8]
mov [rbp-8], rdi
PRINT_DEC 4, rdi
        NEWLINE
___void_print_pshort__return:
leave
ret

;[ function void print( [[ Variable: uint a @ 8]] ) ]

_void_print_puint:
push rbp
mov rbp, rsp
sub rsp, 16
;Load Parameter: [ Variable: uint a @ 8]
mov [rbp-8], rdi
;[[ id : STRING_CONSTANT_3]]
mov rbx, STRING_CONSTANT_3
mov rdi, rbx
;[[ id : a]]
mov rbx, QWORD[rbp-8]
mov rsi, rbx
mov rax, 0
call _void_printf_pchar.uint
___void_print_puint__return:
leave
ret

;[ function void print( [[ Variable: double a @ 8]] ) ]

_void_print_pdouble:
push rbp
mov rbp, rsp
sub rsp, 16
;Load Parameter: [ Variable: double a @ 8]
movsd [rbp-8], xmm0
;[[ id : STRING_CONSTANT_4]]
mov rbx, STRING_CONSTANT_4
mov rdi, rbx
;[[ id : a]]
movsd xmm7, QWORD[rbp-8]
movsd xmm0, xmm7
mov rax, 1
call _void_printf_pchar.double
___void_print_pdouble__return:
leave
ret

;[ function void print( [[ Variable: char. a @ 8]] ) ]

_void_print_pchar.:
push rbp
mov rbp, rsp
sub rsp, 16
;Load Parameter: [ Variable: char. a @ 8]
mov [rbp-8], rdi
PRINT_STRING [rdi]
NEWLINE
___void_print_pchar.__return:
leave
ret

;[ function void print( [[ Variable: char a @ 8]] ) ]

_void_print_pchar:
push rbp
mov rbp, rsp
sub rsp, 16
;Load Parameter: [ Variable: char a @ 8]
mov [rbp-8], rdi
PRINT_CHAR rdi
NEWLINE
___void_print_pchar__return:
leave
ret

;[ function void print( [[ Variable: bool a @ 8]] ) ]

_void_print_pbool:
push rbp
mov rbp, rsp
sub rsp, 16
;Load Parameter: [ Variable: bool a @ 8]
mov [rbp-8], rdi
;[[ id : a]]
mov rbx, QWORD[rbp-8]
mov rax, rbx
and al, 1
jz _LIFPOST_0x23
;[[ id : STRING_CONSTANT_5]]
mov rbx, STRING_CONSTANT_5
mov rdi, rbx
mov rax, 0
call _void_print_pchar.
;[[ int : 0]]
mov rax, 0
jmp ___void_print_pbool__return
jmp _LIFELSE_0x24
_LIFPOST_0x23:
_LIFELSE_0x24:
;[[ id : STRING_CONSTANT_6]]
mov rbx, STRING_CONSTANT_6
mov rdi, rbx
mov rax, 0
call _void_print_pchar.
;[[ int : 0]]
mov rax, 0
jmp ___void_print_pbool__return
___void_print_pbool__return:
leave
ret

;[ function void print( [[ Variable: void. a @ 8]] ) ]

_void_print_pvoid.:
push rbp
mov rbp, rsp
sub rsp, 24
;Load Parameter: [ Variable: void. a @ 8]
mov [rbp-8], rdi
;[[ id : a]]
mov rbx, QWORD[rbp-8]
mov QWORD[rbp-16], rbx
;[[ id : ptr]]
mov rbx, QWORD[rbp-16]
mov rdi, rbx
mov rax, 0
call _void_print_pint
___void_print_pvoid.__return:
leave
ret

;[ function void print( [[ Variable: int. a @ 8], [ Variable: int len @ 16]] ) ]

_void_print_pint.int:
push rbp
mov rbp, rsp
sub rsp, 32
;Load Parameter: [ Variable: int. a @ 8]
mov [rbp-8], rdi
;Load Parameter: [ Variable: int len @ 16]
mov [rbp-16], rsi
;[[ id : len], [ == : ==], [ int : 0]]
mov rcx, 0
mov rbx, QWORD[rbp-16]
cmp rbx, rcx
sete bl
mov rax, rbx
and al, 1
jz _LIFPOST_0x25
;[[ id : STRING_CONSTANT_7]]
mov rbx, STRING_CONSTANT_7
mov rdi, rbx
mov rax, 0
call _void_print_pchar.
;[[ int : 0]]
mov rax, 0
jmp ___void_print_pint.int__return
jmp _LIFELSE_0x26
_LIFPOST_0x25:
_LIFELSE_0x26:
;[[ id : STRING_CONSTANT_8]]
mov rbx, STRING_CONSTANT_8
mov rdi, rbx
;[[ int : 0]]
mov rsi, 0
mov rax, 0
call _void_printf_pchar.int
;[[ int : 0]]
mov QWORD[rbp-24], 0
jmp _LFORCMP_0x28
_LFORTOP_0x27:
;[[ id : STRING_CONSTANT_9]]
mov rbx, STRING_CONSTANT_9
mov rdi, rbx
;[[ id : a], [ [ : [], [ id : i], [ ] : ]]]
mov rcx, QWORD[rbp-24]
mov rbx, QWORD[rbp-8]
lea rbx, [rbx+rcx*8]
mov rbx, qword[rbx]
mov rsi, rbx
mov rax, 0
call _void_printf_pchar.int
_LFORUPDATE_0x29:
;[[ id : i]]
;[[ int : 1]]
mov rbx, 1
mov rcx, QWORD[rbp-24]
add rcx, rbx
mov QWORD[rbp-24], rcx
_LFORCMP_0x28:
;[[ id : i], [ < : <], [ id : len], [ - : -], [ int : 1]]
mov rbx, QWORD[rbp-16]
dec rbx
mov rcx, QWORD[rbp-24]
cmp rcx, rbx
setl cl
mov rax, rcx
and al, 1
jnz _LFORTOP_0x27
_LFOREND_0x2a:
;[[ id : STRING_CONSTANT_10]]
mov rbx, STRING_CONSTANT_10
mov rdi, rbx
;[[ id : a], [ [ : [], [ id : len], [ - : -], [ int : 1], [ ] : ]]]
mov rbx, QWORD[rbp-16]
dec rbx
mov rcx, QWORD[rbp-8]
lea rcx, [rcx+rbx*8]
mov rcx, qword[rcx]
mov rsi, rcx
mov rax, 0
call _void_printf_pchar.int
___void_print_pint.int__return:
leave
ret

;[ function int main( [[ Variable: int argc @ 8], [ Variable: char.. argv @ 16]] ) ]

main:
push rbp
mov rbp, rsp
sub rsp, 72
;Load Parameter: [ Variable: int argc @ 8]
mov [rbp-8], rdi
;Load Parameter: [ Variable: char.. argv @ 16]
mov [rbp-16], rsi
;[[ id : STRING_CONSTANT_11]]
mov rbx, STRING_CONSTANT_11
mov QWORD[rbp-24], rbx
;[[ int : 1000]]
mov rdi, 1000
mov rax, 0
call _void._malloc_psize_t
push rax
;[[ fn(x) : [ function void. malloc( [[ Variable: size_t size @ 8]] ) ] ]]
pop rax
mov QWORD[rbp-32], rax
;[[ $ : bool], [ int : 1]]
mov rbx, 1
and rcx, 0xff
mov rcx, rbx
mov QWORD[rbp-40], rcx
;[[ int : -27]]
mov QWORD[rbp-48], -27
;[[ int : 6], [ * : *], [ id : int]]
mov rdi, 48
mov rax, 0
call _void._malloc_psize_t
push rax
;[[ fn(x) : [ function void. malloc( [[ Variable: size_t size @ 8]] ) ] ]]
pop rax
mov QWORD[rbp-56], rax
;[[ id : args], [ [ : [], [ int : 0], [ ] : ]]]
mov rcx, 0
mov rbx, QWORD[rbp-56]
lea rbx, [rbx+rcx*8]
;[[ id : argc]]
mov rcx, QWORD[rbp-8]
mov qword[rbx], rcx
;[[ id : args], [ [ : [], [ int : 1], [ ] : ]]]
mov rcx, 1
mov rbx, QWORD[rbp-56]
lea rbx, [rbx+rcx*8]
;[[ id : FLT_CONSTANT_1]]
mov rcx, [FLT_CONSTANT_1]
mov qword[rbx], rcx
;[[ id : args], [ [ : [], [ int : 2], [ ] : ]]]
mov rcx, 2
mov rbx, QWORD[rbp-56]
lea rbx, [rbx+rcx*8]
;[[ id : STRING_CONSTANT_12]]
mov rcx, STRING_CONSTANT_12
mov qword[rbx], rcx
;[[ id : args], [ [ : [], [ int : 3], [ ] : ]]]
mov rcx, 3
mov rbx, QWORD[rbp-56]
lea rbx, [rbx+rcx*8]
;[[ id : val]]
mov rcx, QWORD[rbp-40]
mov qword[rbx], rcx
;[[ id : dest]]
mov rbx, QWORD[rbp-32]
mov rdi, rbx
;[[ id : fmt]]
mov rbx, QWORD[rbp-24]
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
;[[ id : len]]
mov rbx, QWORD[rbp-64]
mov rdi, rbx
mov rax, 0
call _void_print_pint
;[[ id : dest]]
mov rbx, QWORD[rbp-32]
mov rdi, rbx
mov rax, 0
call _void_print_pchar.
jmp __main__return
__main__return:
leave
ret
