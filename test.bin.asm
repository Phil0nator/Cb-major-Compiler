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
extern _ssize_t_read_pfd_tchar.size_t
extern _ssize_t_write_pfd_tchar.size_t
extern _fd_t_open_pchar.intmode_t
extern _int_close_pfd_t
extern _int_mkdir_pchar.mode_t
extern _int_rmdir_pchar.
extern _int_creat_pchar.mode_t
extern _int_chdir_pchar.
extern _int_lseek_pfd_tintint
section .data
    STRING_CONSTANT_0: db `%li\n`, 0
STRING_CONSTANT_1: db `%lu\n`, 0
STRING_CONSTANT_2: db `%lf\n`, 0
STRING_CONSTANT_3: db `True`, 0
STRING_CONSTANT_4: db `False`, 0
STRING_CONSTANT_5: db `[]`, 0
STRING_CONSTANT_6: db `[`, 0
STRING_CONSTANT_7: db ` %i ,`, 0
STRING_CONSTANT_8: db ` %i ]\n`, 0
FLT_CONSTANT_0: dq 0x0.0p+0
STRING_CONSTANT_9: db `Bad realloc`, 0
STRING_CONSTANT_10: db `%s`, 0
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
mov rcx, QWORD[rbp-8]
and rbx, rcx
shr rbx, 56
mov rcx, 71776119061217280
mov r10, QWORD[rbp-8]
and rcx, r10
shr rcx, 40
or rbx, rcx
mov rcx, 280375465082880
mov r10, QWORD[rbp-8]
and rcx, r10
shr rcx, 24
or rbx, rcx
mov rcx, 1095216660480
mov r10, QWORD[rbp-8]
and rcx, r10
shr rcx, 8
or rbx, rcx
mov rcx, 4278190080
mov r10, QWORD[rbp-8]
and rcx, r10
shl rcx, 8
or rbx, rcx
mov rcx, 16711680
mov r10, QWORD[rbp-8]
and rcx, r10
shl rcx, 24
or rbx, rcx
mov rcx, 65280
mov r10, QWORD[rbp-8]
and rcx, r10
shl rcx, 40
or rbx, rcx
mov rcx, 255
mov r10, QWORD[rbp-8]
and rcx, r10
shl rcx, 56
or rbx, rcx
mov rax, rbx
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
and rcx, 0xffffffff
mov rcx, rbx
mov rbx, QWORD[rbp-8]
and rcx, rbx
shr rcx, 24
mov rbx, 16711680
and r10, 0xffffffff
mov r10, rbx
mov rbx, QWORD[rbp-8]
and r10, rbx
shr r10, 8
or rcx, r10
mov rbx, 65280
and r10, 0xffffffff
mov r10, rbx
mov rbx, QWORD[rbp-8]
and r10, rbx
shl r10, 8
or rcx, r10
mov rbx, 255
and r10, 0xffffffff
mov r10, rbx
mov rbx, QWORD[rbp-8]
and r10, rbx
shl r10, 24
or rcx, r10
mov rax, rcx
jmp ___uint32_bitswap32_puint32__return
___uint32_bitswap32_puint32__return:
leave
ret
_int_htonl_pint:
push rbp
mov rbp, rsp
sub rsp, 16
mov [rbp-8], rdi
ALIGN_STACK
    call htonl
    UNALIGN_STACK
___int_htonl_pint__return:
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
mov rcx, 32
mov rbx, QWORD[rbp-24]
xor rdx, rdx
mov rax, rbx
idiv rcx
 mov rbx, rdx
mov QWORD[rbp-32], rbx
mov rcx, QWORD[rbp-32]
mov rbx, QWORD[rbp-24]
sub rbx, rcx
sar rbx, 2
mov QWORD[rbp-40], rbx
mov QWORD[rbp-48], 0
jmp _LFORCMP_0x1
_LFORTOP_0x0:
mov rcx, QWORD[rbp-48]
mov rbx, rcx
shl rbx, 3
add rbx, [rbp-16]
vmovdqu ymm0, [rbx]
mov rcx, QWORD[rbp-48]
mov rbx, rcx
shl rbx, 3
add rbx, [rbp-8]
vmovdqu [rbx], ymm0
_LFORUPDATE_0x2:
mov r10, 4
mov rcx, QWORD[rbp-48]
add rcx, r10
mov QWORD[rbp-48], rcx
_LFORCMP_0x1:
mov rcx, QWORD[rbp-40]
mov rbx, QWORD[rbp-48]
cmp rbx, rcx
setl bl
mov rax, rbx
and al, 1
jnz _LFORTOP_0x0
_LFOREND_0x3:
mov rcx, 0
mov rbx, QWORD[rbp-32]
cmp rbx, rcx
setne bl
mov rax, rbx
and al, 1
jz _LIFPOST_0x4
mov rbx, QWORD[rbp-8]
mov rcx, QWORD[rbp-40]
add rbx, rcx
mov rdi, rbx
mov rbx, QWORD[rbp-16]
mov rcx, QWORD[rbp-40]
add rbx, rcx
mov rsi, rbx
mov rbx, QWORD[rbp-32]
mov rdx, rbx
xor rax, rax
call _void_memcpy_pvoid.void.size_t
jmp _LIFELSE_0x5
_LIFPOST_0x4:
_LIFELSE_0x5:
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
_void_strcpy_pchar.char.:
push rbp
mov rbp, rsp
sub rsp, 24
mov [rbp-8], rdi
mov [rbp-16], rsi
_void_strcpy_pchar.char._flp:
    mov bl, [rsi]
    cmp bl, 0
    mov [rdi], bl
    jnz _void_strcpy_pchar.char._flp
___void_strcpy_pchar.char.__return:
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
    cmp bl, 0
    jnz _size_t_strlen_pchar._flp
___size_t_strlen_pchar.__return:
leave
ret
_void_sscanf_pchar.char.void:
push rbp
mov rbp, rsp
sub rsp, 32
mov [rbp-8], rdi
mov [rbp-16], rsi
mov [rbp-24], rdx
ALIGN_STACK
    call sscanf
    UNALIGN_STACK
___void_sscanf_pchar.char.void__return:
leave
ret
_void_sscanf_pchar.char.voidvoid:
push rbp
mov rbp, rsp
sub rsp, 40
mov [rbp-8], rdi
mov [rbp-16], rsi
mov [rbp-24], rdx
mov [rbp-32], rcx
ALIGN_STACK
    call sscanf
    UNALIGN_STACK
___void_sscanf_pchar.char.voidvoid__return:
leave
ret
_void_sscanf_pchar.char.voidvoidvoid:
push rbp
mov rbp, rsp
sub rsp, 48
mov [rbp-8], rdi
mov [rbp-16], rsi
mov [rbp-24], rdx
mov [rbp-32], rcx
mov [rbp-40], r8
ALIGN_STACK
    call sscanf
    UNALIGN_STACK
___void_sscanf_pchar.char.voidvoidvoid__return:
leave
ret
_void_sscanf_pchar.char.voidvoidvoidvoid:
push rbp
mov rbp, rsp
sub rsp, 56
mov [rbp-8], rdi
mov [rbp-16], rsi
mov [rbp-24], rdx
mov [rbp-32], rcx
mov [rbp-40], r8
mov [rbp-48], r9
ALIGN_STACK
    call sscanf
    UNALIGN_STACK
___void_sscanf_pchar.char.voidvoidvoidvoid__return:
leave
ret
_void_printf_pchar.:
push rbp
mov rbp, rsp
sub rsp, 16
mov [rbp-8], rdi
ALIGN_STACK
    call printf
    FFLUSH_STDOUT
    UNALIGN_STACK
___void_printf_pchar.__return:
leave
ret
_void_printf_pchar.int:
push rbp
mov rbp, rsp
sub rsp, 24
mov [rbp-8], rdi
mov [rbp-16], rsi
ALIGN_STACK
call printf
FFLUSH_STDOUT
UNALIGN_STACK
___void_printf_pchar.int__return:
leave
ret
_void_printf_pchar.voidvoidvoid:
push rbp
mov rbp, rsp
sub rsp, 40
mov [rbp-8], rdi
mov [rbp-16], rsi
mov [rbp-24], rdx
mov [rbp-32], rcx
ALIGN_STACK
call printf
FFLUSH_STDOUT
UNALIGN_STACK
___void_printf_pchar.voidvoidvoid__return:
leave
ret
_void_printf_pchar.uint:
push rbp
mov rbp, rsp
sub rsp, 24
mov [rbp-8], rdi
mov [rbp-16], rsi
ALIGN_STACK
call printf
FFLUSH_STDOUT
UNALIGN_STACK
___void_printf_pchar.uint__return:
leave
ret
_void_printf_pchar.double:
push rbp
mov rbp, rsp
sub rsp, 24
mov [rbp-8], rdi
movsd [rbp-16], xmm0
ALIGN_STACK
mov rax, 1
call printf
FFLUSH_STDOUT
UNALIGN_STACK
___void_printf_pchar.double__return:
leave
ret
_void_printf_pchar.char.:
push rbp
mov rbp, rsp
sub rsp, 24
mov [rbp-8], rdi
mov [rbp-16], rsi
ALIGN_STACK
call printf
FFLUSH_STDOUT
UNALIGN_STACK
___void_printf_pchar.char.__return:
leave
ret
_void_printf_pchar.intint:
push rbp
mov rbp, rsp
sub rsp, 32
mov [rbp-8], rdi
mov [rbp-16], rsi
mov [rbp-24], rdx
ALIGN_STACK
call printf
FFLUSH_STDOUT
UNALIGN_STACK
___void_printf_pchar.intint__return:
leave
ret
_void_printf_pchar.doubledouble:
push rbp
mov rbp, rsp
sub rsp, 32
mov [rbp-8], rdi
movsd [rbp-16], xmm0
movsd [rbp-24], xmm1
ALIGN_STACK
call printf
FFLUSH_STDOUT
UNALIGN_STACK
___void_printf_pchar.doubledouble__return:
leave
ret
_void_print_pint:
push rbp
mov rbp, rsp
sub rsp, 16
mov [rbp-8], rdi
mov rdi, STRING_CONSTANT_0
mov rbx, QWORD[rbp-8]
mov rsi, rbx
xor rax, rax
call _void_printf_pchar.int
___void_print_pint__return:
leave
ret
_void_print_pshort:
push rbp
mov rbp, rsp
sub rsp, 16
mov [rbp-8], rdi
PRINT_DEC 4, rdi
        NEWLINE
___void_print_pshort__return:
leave
ret
_void_print_puint:
push rbp
mov rbp, rsp
sub rsp, 16
mov [rbp-8], rdi
mov rdi, STRING_CONSTANT_1
mov rbx, QWORD[rbp-8]
mov rsi, rbx
xor rax, rax
call _void_printf_pchar.uint
___void_print_puint__return:
leave
ret
_void_print_pdouble:
push rbp
mov rbp, rsp
sub rsp, 16
movsd [rbp-8], xmm0
mov rdi, STRING_CONSTANT_2
movsd xmm7, QWORD[rbp-8]
movsd xmm0, xmm7
mov rax, 1
call _void_printf_pchar.double
___void_print_pdouble__return:
leave
ret
_void_print_pchar.:
push rbp
mov rbp, rsp
sub rsp, 16
mov [rbp-8], rdi
PRINT_STRING [rdi]
NEWLINE
___void_print_pchar.__return:
leave
ret
_void_print_pchar:
push rbp
mov rbp, rsp
sub rsp, 16
mov [rbp-8], rdi
PRINT_CHAR rdi
NEWLINE
___void_print_pchar__return:
leave
ret
_void_print_pbool:
push rbp
mov rbp, rsp
sub rsp, 16
mov [rbp-8], rdi
mov rbx, QWORD[rbp-8]
mov rax, rbx
and al, 1
jz _LIFPOST_0x6
mov rdi, STRING_CONSTANT_3
xor rax, rax
call _void_print_pchar.
mov rax, 0
jmp ___void_print_pbool__return
jmp _LIFELSE_0x7
_LIFPOST_0x6:
_LIFELSE_0x7:
mov rdi, STRING_CONSTANT_4
xor rax, rax
call _void_print_pchar.
mov rax, 0
jmp ___void_print_pbool__return
___void_print_pbool__return:
leave
ret
_void_print_pvoid.:
push rbp
mov rbp, rsp
sub rsp, 24
mov [rbp-8], rdi
mov rbx, QWORD[rbp-8]
mov QWORD[rbp-16], rbx
mov rbx, QWORD[rbp-16]
mov rdi, rbx
xor rax, rax
call _void_print_pint
___void_print_pvoid.__return:
leave
ret
_void_print_pint.int:
push rbp
mov rbp, rsp
sub rsp, 32
mov [rbp-8], rdi
mov [rbp-16], rsi
mov rcx, 0
mov rbx, QWORD[rbp-16]
cmp rbx, rcx
sete bl
mov rax, rbx
and al, 1
jz _LIFPOST_0x8
mov rdi, STRING_CONSTANT_5
xor rax, rax
call _void_print_pchar.
mov rax, 0
jmp ___void_print_pint.int__return
jmp _LIFELSE_0x9
_LIFPOST_0x8:
_LIFELSE_0x9:
mov rdi, STRING_CONSTANT_6
xor rsi, rsi
xor rax, rax
call _void_printf_pchar.int
mov QWORD[rbp-24], 0
jmp _LFORCMP_0xb
_LFORTOP_0xa:
mov rdi, STRING_CONSTANT_7
mov rcx, QWORD[rbp-24]
mov rbx, QWORD[rbp-8]
lea rbx, [rbx+rcx*8]
mov rbx, qword[rbx]
mov rsi, rbx
xor rax, rax
call _void_printf_pchar.int
_LFORUPDATE_0xc:
mov rbx, 1
mov rcx, QWORD[rbp-24]
add rcx, rbx
mov QWORD[rbp-24], rcx
_LFORCMP_0xb:
mov rbx, QWORD[rbp-16]
dec rbx
mov rcx, QWORD[rbp-24]
cmp rcx, rbx
setl cl
mov rax, rcx
and al, 1
jnz _LFORTOP_0xa
_LFOREND_0xd:
mov rdi, STRING_CONSTANT_8
mov rbx, QWORD[rbp-16]
dec rbx
mov rcx, QWORD[rbp-8]
lea rcx, [rcx+rbx*8]
mov rcx, qword[rcx]
mov rsi, rcx
xor rax, rax
call _void_printf_pchar.int
___void_print_pint.int__return:
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
mov rbx, QWORD[rbp-8]
mov rdi, rbx
mov rbx, QWORD[rbp-16]
mov rsi, rbx
xor rax, rax
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
_double_pow_pdoubledouble:
push rbp
mov rbp, rsp
sub rsp, 24
movsd [rbp-8], xmm0
movsd [rbp-16], xmm1
___double_pow_pdoubledouble__return:
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
  movsd xmm2, [M_MINZERO_MEM]
  xorpd xmm1, xmm2
  andpd xmm0, xmm1
___double_abs_pdouble__return:
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
mov rcx, [rand_next]
sal rcx, 13
mov r10, [rand_next]
xor r10, rcx
mov [rand_next], r10
mov rcx, [rand_next]
sar rcx, 17
mov r10, [rand_next]
xor r10, rcx
mov [rand_next], r10
mov rcx, [rand_next]
sal rcx, 5
mov r10, [rand_next]
xor r10, rcx
mov [rand_next], r10
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
mov rbx, rax
mov [rand_next], rbx
___void_srand_p__return:
leave
ret
_int_adjtime_ptimeval_t.timeval_t:
push rbp
mov rbp, rsp
sub rsp, 40
mov [rbp-8], rdi
mov [rbp-16], rsi
___int_adjtime_ptimeval_t.timeval_t__return:
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
mov rcx, 48
mov rbx, QWORD[rbp-8]
cmp rbx, rcx
setge bl
mov r10, 57
mov rcx, QWORD[rbp-8]
cmp rcx, r10
setle cl
and rbx, rcx
mov rax, rbx
jmp ___bool_isdigit_pchar__return
___bool_isdigit_pchar__return:
leave
ret
_int_inet_aton_pchar.in_addr.:
push rbp
mov rbp, rsp
sub rsp, 104
mov [rbp-8], rdi
mov [rbp-16], rsi
mov QWORD[rbp-32], 10
lea rbx, [rbp-88]
mov rdi, rbx
xor rbx, rbx
mov SIL, bl
and rsi, 0xff
mov rdx, 4
xor rax, rax
call _void_memset_pvoid.ucharsize_t
lea rbx, [rbp-88]
mov QWORD[rbp-96], rbx
mov rcx, QWORD[rbp-8]
and r10, 0xff
mov r10b, byte[rcx]
mov QWORD[rbp-48], r10
jmp _LWHILECMP_0xf
_LWHILESTART_0xe:
mov rbx, 0
mov QWORD[rbp-24], rbx
jmp _LWHILECMP_0x12
_LWHILESTART_0x11:
mov rcx, QWORD[rbp-48]
mov rbx, rcx
mov DIL, bl
and rdi, 0xff
xor rax, rax
call _bool_isdigit_pchar
push rax
pop rax
and al, 1
jz _LIFPOST_0x14
mov rcx, QWORD[rbp-32]
mov r10, QWORD[rbp-24]
mov r11, r10
imul rcx, r11
mov r11, 48
mov r10, QWORD[rbp-48]
sub r10, r11
mov r11, r10
add rcx, r11
mov QWORD[rbp-24], rcx
mov rbx, 1
mov rbx, QWORD[rbp-8]
add rbx, rbx
mov QWORD[rbp-8], rbx
mov rcx, QWORD[rbp-8]
and r10, 0xff
mov r10b, byte[rcx]
mov QWORD[rbp-48], r10
jmp _LIFELSE_0x15
_LIFPOST_0x14:
jmp _LWHILEEND_0x13
_LIFELSE_0x15:
_LWHILECMP_0x12:
mov rbx, 1
and rcx, 0xff
mov rcx, rbx
mov rax, rcx
and al, 1
jnz _LWHILESTART_0x11
_LWHILEEND_0x13:
mov rcx, 46
mov rbx, QWORD[rbp-48]
cmp rbx, rcx
sete bl
mov rax, rbx
and al, 1
jz _LIFPOST_0x16
mov rbx, 32
lea rcx, [rbp-88]
add rbx, rcx
mov rcx, QWORD[rbp-96]
cmp rcx, rbx
seta cl
mov rax, rcx
and al, 1
jz _LIFPOST_0x18
mov rax, 0
jmp ___int_inet_aton_pchar.in_addr.__return
jmp _LIFELSE_0x19
_LIFPOST_0x18:
_LIFELSE_0x19:
mov rbx, QWORD[rbp-96]
mov rcx, rbx
mov rbx, QWORD[rbp-24]
mov [rcx], rbx
mov rbx, 8
mov rbx, QWORD[rbp-96]
add rbx, rbx
mov QWORD[rbp-96], rbx
mov rbx, 1
mov rbx, QWORD[rbp-8]
add rbx, rbx
mov QWORD[rbp-8], rbx
mov rcx, QWORD[rbp-8]
and r10, 0xff
mov r10b, byte[rcx]
mov QWORD[rbp-48], r10
jmp _LIFELSE_0x17
_LIFPOST_0x16:
jmp _LWHILEEND_0x10
_LIFELSE_0x17:
_LWHILECMP_0xf:
mov rbx, 1
and rcx, 0xff
mov rcx, rbx
mov rax, rcx
and al, 1
jnz _LWHILESTART_0xe
_LWHILEEND_0x10:
mov rbx, QWORD[rbp-96]
mov rcx, rbx
mov rbx, QWORD[rbp-24]
mov [rcx], rbx
mov rbx, 0
mov rcx, QWORD[rbp-48]
mov r10, rcx
cmp rbx, r10
setne bl
mov r10, 32
mov rcx, QWORD[rbp-48]
cmp rcx, r10
setne cl
and rbx, rcx
mov rax, rbx
and al, 1
jz _LIFPOST_0x1a
mov rax, 0
jmp ___int_inet_aton_pchar.in_addr.__return
jmp _LIFELSE_0x1b
_LIFPOST_0x1a:
_LIFELSE_0x1b:
mov r10, 0
lea rcx, [rbp-88]
lea rcx, [rcx+r10*8]
mov rcx, qword[rcx]
shl rcx, 24
mov r10, QWORD[rbp-24]
mov r11, r10
or rcx, r11
mov r11, 1
lea r10, [rbp-88]
lea r10, [r10+r11*8]
mov r10, qword[r10]
shl r10, 16
or rcx, r10
mov r11, 2
lea r10, [rbp-88]
lea r10, [r10+r11*8]
mov r10, qword[r10]
shl r10, 8
or rcx, r10
mov QWORD[rbp-24], rcx
mov rbx, QWORD[rbp-16]
mov rcx, rbx
mov r10, QWORD[rbp-24]
mov [rcx], r10
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
_void_xString_pString.:
push rbp
mov rbp, rsp
sub rsp, 16
mov [rbp-8], rdi
mov rbx, QWORD[rbp-8]
lea rbx, [rbx+0]
mov rbx, qword[rbx]
mov rdi, rbx
xor rax, rax
call _void_free_pvoid.
___void_xString_pString.__return:
leave
ret
_void_iString_pString.char.:
push rbp
mov rbp, rsp
sub rsp, 32
mov [rbp-8], rdi
mov [rbp-16], rsi
mov rbx, QWORD[rbp-16]
mov rdi, rbx
xor rax, rax
call _size_t_strlen_pchar.
push rax
pop rax
mov QWORD[rbp-24], rax
mov rbx, QWORD[rbp-8]
lea rbx, [rbx+8]
mov r10, QWORD[rbp-24]
mov [rbx], r10
mov rbx, QWORD[rbp-8]
mov r10, QWORD[rbp-24]
mov rdi, r10
xor rax, rax
call _void._malloc_psize_t
mov rcx, rax
mov [rbx], rcx
mov rbx, QWORD[rbp-8]
lea rbx, [rbx+0]
mov rbx, qword[rbx]
mov rdi, rbx
mov rsi, QWORD[rbp-16]
mov rbx, QWORD[rbp-24]
mov rdx, rbx
xor rax, rax
call _void_memcpy_pvoid.void.size_t
___void_iString_pString.char.__return:
leave
ret
_void_appendString_pString.char.:
push rbp
mov rbp, rsp
sub rsp, 48
mov [rbp-8], rdi
mov [rbp-16], rsi
mov rbx, QWORD[rbp-16]
mov rdi, rbx
xor rax, rax
call _size_t_strlen_pchar.
push rax
pop rax
mov QWORD[rbp-24], rax
mov rbx, QWORD[rbp-8]
lea rbx, [rbx+0]
mov rbx, qword[rbx]
mov rdi, rbx
mov rbx, QWORD[rbp-8]
lea rbx, [rbx+8]
mov rbx, qword[rbx]
mov rcx, QWORD[rbp-24]
add rbx, rcx
mov rsi, rbx
xor rax, rax
call _void._realloc_pvoid.size_t
push rax
pop rax
mov QWORD[rbp-32], rax
mov rbx, QWORD[rbp-32]
mov rcx, [nullptr]
cmp rbx, rcx
sete bl
mov rax, rbx
and al, 1
jz _LIFPOST_0x1c
mov rdi, STRING_CONSTANT_9
xor rax, rax
call _void_print_pchar.
jmp _LIFELSE_0x1d
_LIFPOST_0x1c:
_LIFELSE_0x1d:
mov rbx, QWORD[rbp-8]
lea rbx, [rbx+8]
mov rbx, qword[rbx]
mov rcx, QWORD[rbp-32]
add rcx, rbx
mov QWORD[rbp-40], rcx
mov rdi, QWORD[rbp-40]
mov rsi, QWORD[rbp-16]
mov rbx, QWORD[rbp-24]
mov rdx, rbx
xor rax, rax
call _void_memcpy_pvoid.void.size_t
mov rbx, QWORD[rbp-8]
mov r10, QWORD[rbp-32]
mov [rbx], r10
mov rbx, QWORD[rbp-8]
lea rbx, [rbx+8]
mov r10, QWORD[rbp-8]
lea r10, [r10+8]
mov r10, qword[r10]
mov r11, QWORD[rbp-24]
add r10, r11
mov [rbx], r10
___void_appendString_pString.char.__return:
leave
ret
_bool_substrequ_pchar.char.size_t:
push rbp
mov rbp, rsp
sub rsp, 40
mov [rbp-8], rdi
mov [rbp-16], rsi
mov [rbp-24], rdx
mov QWORD[rbp-32], 0
jmp _LFORCMP_0x1f
_LFORTOP_0x1e:
mov rcx, QWORD[rbp-32]
mov rbx, QWORD[rbp-8]
lea rbx, [rbx+rcx*1]
mov r10, QWORD[rbp-32]
mov rcx, QWORD[rbp-16]
lea rcx, [rcx+r10*1]
mov bl, byte[rbx]
and rbx, 0xff
mov cl, byte[rcx]
and rcx, 0xff
cmp rbx, rcx
setne bl
mov rax, rbx
and al, 1
jz _LIFPOST_0x22
mov rbx, 0
and rcx, 0xff
mov rcx, rbx
mov rax, rcx
jmp ___bool_substrequ_pchar.char.size_t__return
jmp _LIFELSE_0x23
_LIFPOST_0x22:
_LIFELSE_0x23:
_LFORUPDATE_0x20:
mov rbx, 1
mov rcx, QWORD[rbp-32]
add rcx, rbx
mov QWORD[rbp-32], rcx
_LFORCMP_0x1f:
mov rcx, QWORD[rbp-24]
mov rbx, QWORD[rbp-32]
cmp rbx, rcx
setl bl
mov rax, rbx
and al, 1
jnz _LFORTOP_0x1e
_LFOREND_0x21:
mov rbx, 1
and rcx, 0xff
mov rcx, rbx
mov rax, rcx
jmp ___bool_substrequ_pchar.char.size_t__return
___bool_substrequ_pchar.char.size_t__return:
leave
ret
_bool_strequ_pchar.char.:
push rbp
mov rbp, rsp
sub rsp, 32
mov [rbp-8], rdi
mov [rbp-16], rsi
mov QWORD[rbp-24], 0
jmp _LWHILECMP_0x25
_LWHILESTART_0x24:
mov rcx, QWORD[rbp-24]
mov rbx, QWORD[rbp-8]
lea rbx, [rbx+rcx*1]
mov r10, QWORD[rbp-24]
mov rcx, QWORD[rbp-16]
lea rcx, [rcx+r10*1]
mov bl, byte[rbx]
and rbx, 0xff
mov cl, byte[rcx]
and rcx, 0xff
cmp rbx, rcx
setne bl
mov rax, rbx
and al, 1
jz _LIFPOST_0x27
mov rbx, 0
and rcx, 0xff
mov rcx, rbx
mov rax, rcx
jmp ___bool_strequ_pchar.char.__return
jmp _LIFELSE_0x28
_LIFPOST_0x27:
_LIFELSE_0x28:
mov rcx, QWORD[rbp-24]
mov rbx, QWORD[rbp-8]
lea rbx, [rbx+rcx*1]
mov bl, byte[rbx]
and rbx, 0xff
mov rcx, 0
mov r10, rbx
cmp rcx, r10
sete cl
mov rax, rcx
and al, 1
jz _LIFPOST_0x29
jmp _LWHILEEND_0x26
jmp _LIFELSE_0x2a
_LIFPOST_0x29:
_LIFELSE_0x2a:
mov rbx, 1
mov rcx, QWORD[rbp-24]
add rcx, rbx
mov QWORD[rbp-24], rcx
_LWHILECMP_0x25:
mov rbx, 1
and rcx, 0xff
mov rcx, rbx
mov rax, rcx
and al, 1
jnz _LWHILESTART_0x24
_LWHILEEND_0x26:
mov rbx, 1
and rcx, 0xff
mov rcx, rbx
mov rax, rcx
jmp ___bool_strequ_pchar.char.__return
___bool_strequ_pchar.char.__return:
leave
ret
_void_substring_pString.String.intint:
push rbp
mov rbp, rsp
sub rsp, 48
mov [rbp-8], rdi
mov [rbp-16], rsi
mov [rbp-24], rdx
mov [rbp-32], rcx
mov rcx, QWORD[rbp-24]
mov rbx, QWORD[rbp-32]
sub rbx, rcx
mov QWORD[rbp-40], rbx
mov rbx, QWORD[rbp-16]
lea rbx, [rbx+0]
mov rbx, qword[rbx]
mov rdi, rbx
xor rax, rax
call _void_free_pvoid.
mov rbx, QWORD[rbp-16]
mov r10, QWORD[rbp-40]
mov rdi, r10
xor rax, rax
call _void._malloc_psize_t
mov rcx, rax
mov [rbx], rcx
mov rbx, QWORD[rbp-16]
lea rbx, [rbx+0]
mov rbx, qword[rbx]
mov rdi, rbx
mov rbx, QWORD[rbp-8]
lea rbx, [rbx+0]
mov rbx, qword[rbx]
mov rcx, QWORD[rbp-24]
add rbx, rcx
mov rsi, rbx
mov rbx, QWORD[rbp-40]
mov rdx, rbx
xor rax, rax
call _void_memcpy_pvoid.void.size_t
mov rbx, QWORD[rbp-16]
lea rbx, [rbx+8]
mov r10, QWORD[rbp-40]
mov [rbx], r10
___void_substring_pString.String.intint__return:
leave
ret
_int_strfind_pString.char.:
push rbp
mov rbp, rsp
sub rsp, 48
mov [rbp-8], rdi
mov [rbp-16], rsi
mov rbx, QWORD[rbp-16]
mov rdi, rbx
xor rax, rax
call _size_t_strlen_pchar.
push rax
pop rax
mov QWORD[rbp-24], rax
mov rbx, QWORD[rbp-8]
lea rbx, [rbx+8]
mov rbx, qword[rbx]
mov rcx, QWORD[rbp-24]
cmp rcx, rbx
setg cl
mov rax, rcx
and al, 1
jz _LIFPOST_0x2b
mov rax, -1
jmp ___int_strfind_pString.char.__return
jmp _LIFELSE_0x2c
_LIFPOST_0x2b:
_LIFELSE_0x2c:
mov rbx, QWORD[rbp-8]
lea rbx, [rbx+8]
mov rbx, qword[rbx]
mov rcx, QWORD[rbp-24]
sub rbx, rcx
mov QWORD[rbp-32], rbx
mov QWORD[rbp-40], 0
jmp _LFORCMP_0x2e
_LFORTOP_0x2d:
mov rbx, QWORD[rbp-8]
lea rbx, [rbx+0]
mov rbx, qword[rbx]
mov rcx, QWORD[rbp-40]
add rbx, rcx
mov rdi, rbx
mov rbx, QWORD[rbp-16]
mov rsi, rbx
mov rbx, QWORD[rbp-24]
mov rdx, rbx
xor rax, rax
call _bool_substrequ_pchar.char.size_t
push rax
pop rax
and al, 1
jz _LIFPOST_0x31
mov rbx, QWORD[rbp-40]
mov rax, rbx
jmp ___int_strfind_pString.char.__return
jmp _LIFELSE_0x32
_LIFPOST_0x31:
_LIFELSE_0x32:
_LFORUPDATE_0x2f:
mov rbx, 1
mov rcx, QWORD[rbp-40]
add rcx, rbx
mov QWORD[rbp-40], rcx
_LFORCMP_0x2e:
mov rcx, QWORD[rbp-32]
mov rbx, QWORD[rbp-40]
cmp rbx, rcx
setl bl
mov rax, rbx
and al, 1
jnz _LFORTOP_0x2d
_LFOREND_0x30:
mov rax, -1
jmp ___int_strfind_pString.char.__return
___int_strfind_pString.char.__return:
leave
ret
_void_print_pString.:
push rbp
mov rbp, rsp
sub rsp, 16
mov [rbp-8], rdi
mov rbx, QWORD[rbp-8]
lea rbx, [rbx+0]
mov rbx, qword[rbx]
mov rdi, rbx
xor rax, rax
call _void_print_pchar.
___void_print_pString.__return:
leave
ret
_FILE_fopen_pchar.char.:
push rbp
mov rbp, rsp
sub rsp, 56
mov [rbp-8], rdi
mov [rbp-16], rsi
mov rcx, 0
mov rbx, QWORD[rbp-16]
lea rbx, [rbx+rcx*1]
mov r10, 1
mov rcx, QWORD[rbp-16]
lea rcx, [rcx+r10*1]
mov bl, byte[rbx]
and rbx, 0xff
mov cl, byte[rcx]
and rcx, 0xff
add rbx, rcx
mov QWORD[rbp-24], rbx
mov QWORD[rbp-32], 0
mov QWORD[rbp-40], 0
mov rcx, 114
mov rbx, QWORD[rbp-24]
cmp rbx, rcx
sete bl
mov rax, rbx
and al, 1
jz _LIFPOST_0x33
mov rbx, 0
mov QWORD[rbp-40], rbx
jmp _LIFELSE_0x34
_LIFPOST_0x33:
mov rcx, 119
mov rbx, QWORD[rbp-24]
cmp rbx, rcx
sete bl
mov rax, rbx
and al, 1
jz _LIFPOST_0x35
mov rbx, 1
mov QWORD[rbp-40], rbx
jmp _LIFELSE_0x36
_LIFPOST_0x35:
mov rcx, 97
mov rbx, QWORD[rbp-24]
cmp rbx, rcx
sete bl
mov rax, rbx
and al, 1
jz _LIFPOST_0x37
mov rbx, 1
mov QWORD[rbp-40], rbx
jmp _LIFELSE_0x38
_LIFPOST_0x37:
mov rcx, 157
mov rbx, QWORD[rbp-24]
cmp rbx, rcx
sete bl
mov rax, rbx
and al, 1
jz _LIFPOST_0x39
mov rbx, 2
mov QWORD[rbp-40], rbx
jmp _LIFELSE_0x3a
_LIFPOST_0x39:
mov rcx, 162
mov rbx, QWORD[rbp-24]
cmp rbx, rcx
sete bl
mov rax, rbx
and al, 1
jz _LIFPOST_0x3b
mov rbx, 1792
mov QWORD[rbp-32], rbx
mov rbx, 2
mov QWORD[rbp-40], rbx
jmp _LIFELSE_0x3c
_LIFPOST_0x3b:
mov rbx, 1792
mov QWORD[rbp-32], rbx
mov rbx, 2
mov QWORD[rbp-40], rbx
_LIFELSE_0x3c:
_LIFELSE_0x3a:
_LIFELSE_0x38:
_LIFELSE_0x36:
_LIFELSE_0x34:
mov rbx, QWORD[rbp-8]
mov rdi, rbx
mov rbx, QWORD[rbp-40]
mov rsi, rbx
mov rbx, QWORD[rbp-32]
mov rdx, rbx
xor rax, rax
call _fd_t_open_pchar.intmode_t
push rax
pop rax
mov QWORD[rbp-48], rax
mov rcx, 140
mov rbx, QWORD[rbp-24]
cmp rbx, rcx
sete bl
mov r10, 87
mov rcx, QWORD[rbp-24]
cmp rcx, r10
sete cl
or rbx, rcx
mov rax, rbx
and al, 1
jz _LIFPOST_0x3d
mov rbx, QWORD[rbp-48]
mov rdi, rbx
xor rsi, rsi
mov rdx, 2
xor rax, rax
call _int_lseek_pfd_tintint
jmp _LIFELSE_0x3e
_LIFPOST_0x3d:
_LIFELSE_0x3e:
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
push rax
pop rax
mov QWORD[rbp-24], rax
mov rbx, QWORD[rbp-8]
mov rdi, rbx
mov rbx, QWORD[rbp-16]
mov rsi, rbx
mov rbx, QWORD[rbp-24]
mov rdx, rbx
xor rax, rax
call _ssize_t_write_pfd_tchar.size_t
push rax
pop rax
mov QWORD[rbp-32], rax
mov rbx, QWORD[rbp-8]
mov rdi, rbx
mov rbx, QWORD[rbp-24]
mov rsi, rbx
mov rdx, 1
xor rax, rax
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
mov rbx, QWORD[rbp-8]
mov rdi, rbx
mov rbx, QWORD[rbp-16]
mov rsi, rbx
mov rbx, QWORD[rbp-24]
mov rdx, rbx
xor rax, rax
call _ssize_t_read_pfd_tchar.size_t
push rax
mov rcx, 0
pop rbx
cmp rbx, rcx
setg bl
mov QWORD[rbp-32], rbx
mov rbx, QWORD[rbp-8]
mov rdi, rbx
mov rbx, QWORD[rbp-24]
mov rsi, rbx
mov rdx, 1
xor rax, rax
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
mov rbx, QWORD[rbp-8]
mov rdi, rbx
xor rsi, rsi
mov rdx, 2
xor rax, rax
call _int_lseek_pfd_tintint
push rax
pop rax
mov QWORD[rbp-16], rax
mov rbx, QWORD[rbp-8]
mov rdi, rbx
mov rcx, QWORD[rbp-16]
xor rbx, rbx
sub rbx, rcx
mov rsi, rbx
mov rdx, 2
xor rax, rax
call _int_lseek_pfd_tintint
mov rbx, QWORD[rbp-16]
mov rdi, rbx
xor rax, rax
call _void._malloc_psize_t
push rax
pop rax
mov QWORD[rbp-24], rax
mov rbx, QWORD[rbp-8]
mov rdi, rbx
mov rbx, QWORD[rbp-24]
mov rsi, rbx
mov rbx, QWORD[rbp-16]
mov rdx, rbx
xor rax, rax
call _ssize_t_read_pfd_tchar.size_t
push rax
mov rcx, 0
pop rbx
cmp rbx, rcx
setl bl
mov QWORD[rbp-32], rbx
mov rbx, QWORD[rbp-32]
mov rax, rbx
and al, 1
jz _LIFPOST_0x3f
mov rax, 0
jmp ___void._floads_pfd_t__return
jmp _LIFELSE_0x40
_LIFPOST_0x3f:
_LIFELSE_0x40:
mov rax, QWORD[rbp-24]
jmp ___void._floads_pfd_t__return
___void._floads_pfd_t__return:
leave
ret
_int_getInt_pchar.:
push rbp
mov rbp, rsp
sub rsp, 16
mov [rbp-8], rdi
PRINT_STRING [rdi]
    GET_DEC 8, rax
___int_getInt_pchar.__return:
leave
ret
_uint_getUint_pchar.:
push rbp
mov rbp, rsp
sub rsp, 16
mov [rbp-8], rdi
PRINT_STRING [rdi]
    GET_UDEC 8, rax
___uint_getUint_pchar.__return:
leave
ret
_char_getchar_p:
push rbp
mov rbp, rsp
sub rsp, 8
call getchar
___char_getchar_p__return:
leave
ret
_int_getHex_pchar.:
push rbp
mov rbp, rsp
sub rsp, 16
mov [rbp-8], rdi
PRINT_STRING [rdi]
    GET_HEX 8, rax
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
PRINT_STRING [rdx]
    GET_STRING [rdi], rsi
___void_getString_pchar.intchar.__return:
leave
ret
_void_get_stdin_p:
push rbp
mov rbp, rsp
sub rsp, 8
call get_stdin
___void_get_stdin_p__return:
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
push rax
pop rax
mov QWORD[rbp-24], rax
mov QWORD[rbp-40], 0
mov rdi, STRING_CONSTANT_10
mov rbx, QWORD[rbp-8]
mov rsi, rbx
xor rax, rax
call _void_printf_pchar.char.
mov rdi, 0
lea rbx, [rbp-32]
mov rsi, rbx
mov rdx, 1
xor rax, rax
call _bool_fgets_pfd_tchar.size_t
jmp _LWHILECMP_0x42
_LWHILESTART_0x41:
mov rcx, QWORD[rbp-16]
mov rbx, QWORD[rbp-40]
cmp rbx, rcx
sete bl
mov rax, rbx
and al, 1
jz _LIFPOST_0x44
mov rcx, QWORD[rbp-16]
sal rcx, 1
mov QWORD[rbp-16], rcx
mov rdi, QWORD[rbp-24]
mov rcx, QWORD[rbp-16]
mov rsi, rcx
xor rax, rax
call _void._realloc_pvoid.size_t
mov rbx, rax
mov QWORD[rbp-24], rbx
jmp _LIFELSE_0x45
_LIFPOST_0x44:
_LIFELSE_0x45:
mov rcx, QWORD[rbp-40]
mov rbx, QWORD[rbp-24]
lea rbx, [rbx+rcx*1]
mov rcx, QWORD[rbp-32]
mov [rbx], rcx
mov rdi, 0
lea rbx, [rbp-32]
mov rsi, rbx
mov rdx, 1
xor rax, rax
call _bool_fgets_pfd_tchar.size_t
mov rcx, QWORD[rbp-40]
inc rcx
mov QWORD[rbp-40], rcx
_LWHILECMP_0x42:
mov rcx, 10
mov rbx, QWORD[rbp-32]
cmp rbx, rcx
setne bl
mov rax, rbx
and al, 1
jnz _LWHILESTART_0x41
_LWHILEEND_0x43:
mov rbx, QWORD[rbp-40]
inc rbx
mov rcx, QWORD[rbp-24]
lea rcx, [rcx+rbx*1]
xor rbx, rbx
mov [rcx], rbx
mov rdi, QWORD[rbp-24]
mov rbx, QWORD[rbp-40]
mov rsi, rbx
xor rax, rax
call _void._realloc_pvoid.size_t
push rax
pop rax
jmp ___char._getString_pchar.__return
___char._getString_pchar.__return:
leave
ret
_int_toInteger_pchar.:
push rbp
mov rbp, rsp
sub rsp, 48
mov [rbp-8], rdi
mov rbx, QWORD[rbp-8]
mov rdi, rbx
xor rax, rax
call _size_t_strlen_pchar.
push rax
pop rax
mov QWORD[rbp-16], rax
mov rbx, 1
and rcx, 0xff
mov rcx, rbx
mov QWORD[rbp-24], rcx
mov rcx, 0
mov rbx, QWORD[rbp-8]
lea rbx, [rbx+rcx*1]
mov bl, byte[rbx]
and rbx, 0xff
mov rcx, 45
cmp rbx, rcx
sete bl
mov rax, rbx
and al, 1
jz _LIFPOST_0x46
mov rcx, 0
and r10, 0xff
mov rbx, rcx
mov QWORD[rbp-24], r10
mov rcx, QWORD[rbp-8]
inc rcx
mov QWORD[rbp-8], rcx
mov rbx, 1
mov rcx, QWORD[rbp-16]
sub rcx, rbx
mov QWORD[rbp-16], rcx
jmp _LIFELSE_0x47
_LIFPOST_0x46:
_LIFELSE_0x47:
mov QWORD[rbp-32], 0
mov QWORD[rbp-40], 0
jmp _LFORCMP_0x49
_LFORTOP_0x48:
mov r10, 10
mov rcx, QWORD[rbp-32]
imul rcx, r10
mov r11, QWORD[rbp-40]
mov r10, QWORD[rbp-8]
lea r10, [r10+r11*1]
mov r10b, byte[r10]
and r10, 0xff
mov r11, r10
add rcx, r11
mov r10, 48
mov r11, r10
sub rcx, r11
mov QWORD[rbp-32], rcx
_LFORUPDATE_0x4a:
mov rbx, 1
mov rcx, QWORD[rbp-40]
add rcx, rbx
mov QWORD[rbp-40], rcx
_LFORCMP_0x49:
mov rcx, QWORD[rbp-16]
mov rbx, QWORD[rbp-40]
cmp rbx, rcx
setl bl
mov rax, rbx
and al, 1
jnz _LFORTOP_0x48
_LFOREND_0x4b:
mov rbx, QWORD[rbp-24]
cmp rbx, 0
sete bl
mov rax, rbx
and al, 1
jz _LIFPOST_0x4c
mov rcx, QWORD[rbp-32]
mov rbx, 0
sub rbx, rcx
mov rax, rbx
jmp ___int_toInteger_pchar.__return
jmp _LIFELSE_0x4d
_LIFPOST_0x4c:
_LIFELSE_0x4d:
mov rbx, QWORD[rbp-32]
mov rax, rbx
jmp ___int_toInteger_pchar.__return
___int_toInteger_pchar.__return:
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
movsd xmm8, QWORD[rbp-16]
movsd xmm7, xmm8
movq [rbx], xmm7
mov rbx, QWORD[rbp-8]
lea rbx, [rbx+8]
movsd xmm8, QWORD[rbp-24]
movsd xmm7, xmm8
movq [rbx], xmm7
mov rbx, QWORD[rbp-8]
lea rbx, [rbx+16]
movsd xmm8, QWORD[rbp-32]
movsd xmm7, xmm8
movq [rbx], xmm7
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
mov rcx, 0
shl rcx, 3
add rcx, [rbp-16]
vmovdqu ymm1, [rcx]
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
mov rcx, 0
shl rcx, 3
add rcx, [rbp-16]
vmovdqu ymm1, [rcx]
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
mov rcx, 0
shl rcx, 3
add rcx, [rbp-16]
vmovdqu ymm1, [rcx]
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
mov QWORD[rbp-24], 26
mov QWORD[rbp-32], 25
mov rbx, QWORD[rbp-24]
shl rbx, 5
mov rdi, rbx
xor rax, rax
call _void_print_puint
jmp __main__return
__main__return:
leave
ret
