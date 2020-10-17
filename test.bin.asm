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
section .data
    FLT_CONSTANT_0: dq 0x1.4cccccccccccdp+1
nullterm: DB 0
true: DB 1
false: DB 0
STRING_CONSTANT_0: db `%li\n`, 0
STRING_CONSTANT_1: db `%lu\n`, 0
STRING_CONSTANT_2: db `%lf\n`, 0
STRING_CONSTANT_3: db `True`, 0
STRING_CONSTANT_4: db `False`, 0
STRING_CONSTANT_5: db `[]`, 0
STRING_CONSTANT_6: db `[`, 0
STRING_CONSTANT_7: db ` %i ,`, 0
STRING_CONSTANT_8: db ` %i ]\n`, 0
FLT_CONSTANT_1: dq 0x1.ef2d0f6115f51p-107
FLT_CONSTANT_2: dq 0x1.921fb54442d18p+1
FLT_CONSTANT_3: dq 0x1.5bf0a8b145769p+1
FLT_CONSTANT_4: dq 0x1.71547652b82fep+0
FLT_CONSTANT_5: dq 0x1.bcb7b1526e50ep-2
FLT_CONSTANT_6: dq 0x1.62e42fefa39efp-1
FLT_CONSTANT_7: dq 0x1.921fb54442d18p+0
FLT_CONSTANT_8: dq 0x1.921fb54442d18p-1
FLT_CONSTANT_9: dq 0x1.45f306dc9c883p-2
FLT_CONSTANT_10: dq 0x1.45f306dc9c883p-1
FLT_CONSTANT_11: dq 0x1.20dd750429b6dp+0
FLT_CONSTANT_12: dq 0x1.6a09e667f3bcdp+0
FLT_CONSTANT_13: dq 0x1.6a09e667f3bcdp-1
FLT_CONSTANT_14: dq -0x0.0p+0
EPSILON: dq 0x1.ef2d0f6115f51p-107
M_PI: dq 0x1.921fb54442d18p+1
M_E: dq 0x1.5bf0a8b145769p+1
M_LOG2E: dq 0x1.71547652b82fep+0
M_LOG10E: dq 0x1.bcb7b1526e50ep-2
M_LN2: dq 0x1.62e42fefa39efp-1
M_PI_2: dq 0x1.921fb54442d18p+0
M_PI_4: dq 0x1.921fb54442d18p-1
M_1_PI: dq 0x1.45f306dc9c883p-2
M_2_PI: dq 0x1.45f306dc9c883p-1
M_2_SQRTPI: dq 0x1.20dd750429b6dp+0
M_SQRT2: dq 0x1.6a09e667f3bcdp+0
M_SQRT1_2: dq 0x1.6a09e667f3bcdp-1
M_MINZERO: dq -0x0.0p+0
DST_NONE: DQ 0
DST_USA: DQ 1
DST_AUST: DQ 2
DST_WET: DQ 3
DST_MET: DQ 4
DST_EET: DQ 5
DST_CAN: DQ 6
ITIMER_REAL: DQ 0
ITIMER_VIRTUAL: DQ 1
ITIMER_PROF: DQ 2
O_RDONLY: DQ 0
O_WRONLY: DQ 1
O_RDWR: DQ 2
O_ACCMODE: DQ 3
FREAD: DQ 1
FWRITE: DQ 2
O_NONBLOCK: DQ 4
O_APPEND: DQ 8
O_SHLOCK: DQ 16
O_EXLOCK: DQ 32
O_ASYNC: DQ 64
O_FSYNC: DQ 128
O_CREAT: DQ 64
O_TRUNC: DQ 512
O_EXCL: DQ 2048
O_USRPERM: DQ 1792
WMODE_WRITE: DQ 0
WMODE_APPEND: DQ 1024
WMODE_WPLUS: DQ 65
WMODE_WPLUSA: DQ 1089
SEEK_END: DQ 2
SEEK_CUR: DQ 1
SEEK_SET: DQ 0
SOCK_STREAM: DQ 1
SOCK_DGRAM: DQ 2
SOCK_RAW: DQ 3
SOCK_SEQPACKET: DQ 5
SO_DEBUG: DQ 1
SO_ACCEPTCONN: DQ 2
SO_REUSEADDR: DQ 4
SO_KEEPALIVE: DQ 8
SO_DONTROUTE: DQ 16
SO_BROADCAST: DQ 32
SO_USELOOPBACK: DQ 64
SO_LINGER: DQ 128
SO_OOBINLINE: DQ 256
SO_SNDBUF: DQ 4097
SO_RCVBUF: DQ 4098
SO_SNDLOWAT: DQ 4099
SO_RCVLOWAT: DQ 4100
SO_SNDTIMEO: DQ 4101
SO_RECVTIMEO: DQ 4102
SO_ERROR: DQ 4103
SO_TYPE: DQ 4104
SOL_SOCKET: DQ 65535
AF_UNSPEC: DB 0
AF_UNIX: DB 1
AF_INET: DB 2
AF_AX25: DB 3
AF_IPX: DB 4
AF_APPLETALK: DB 5
AF_NETROM: DB 6
AF_BRIDGE: DB 7
AF_AAL5: DB 8
AF_X25: DB 9
AF_INET6: DB 10
AF_MAX: DB 12
STRING_CONSTANT_9: db `Bad realloc`, 0
STRING_CONSTANT_10: db `%s`, 0
_fopen_readonly: DQ 114
_fopen_writeonly: DQ 119
_fopen_append: DQ 97
_fopen_rw: DQ 157
_fopen_wc: DQ 162
_fopen_ac: DQ 140
section .bss
align 16
    HvptrDest_0: RESQ 1
nullptr: RESQ 1
null: RESQ 1
MAXUINT: RESQ 1
rand_next: RESQ 1
    __heap_padding__: resz 1
section .text
global CMAIN

;[ function void. floads( [[ Variable: fd_t fd @ 8]] ) ]

_void._floads_pfd_t:
push rbp
mov rbp, rsp
sub rsp, 40
;Load Parameter: [ Variable: fd_t fd @ 8]
mov [rbp-8], rdi
;[[ id : fd]]
;------------
mov rbx, QWORD[rbp-8]
mov rdi, rbx
;[[ int : 0]]
;------------
mov rsi, 0
;[[ id : SEEK_END]]
;------------
mov rbx, [SEEK_END]
mov rdx, rbx
mov rax, 0
call _int_lseek_pfd_tintint
push rax
;[[ fn(x) : [ function int lseek( [[ Variable: fd_t fd @ 8], [ Variable: int offset @ 16], [ Variable: int whence @ 24]] ) ] ]]
;------------
pop rax
mov QWORD[rbp-16], rax
;[[ id : fd]]
;------------
mov rbx, QWORD[rbp-8]
mov rdi, rbx
;[[ int : 0], [ - : -], [ id : fsize]]
mov rcx, QWORD[rbp-16]
mov rbx, 0
sub rbx, rcx
;------------
mov rsi, rbx
;[[ id : SEEK_END]]
;------------
mov rbx, [SEEK_END]
mov rdx, rbx
mov rax, 0
call _int_lseek_pfd_tintint
;[[ id : fsize]]
;------------
mov rbx, QWORD[rbp-16]
mov rdi, rbx
mov rax, 0
call _void._malloc_psize_t
push rax
;[[ fn(x) : [ function void. malloc( [[ Variable: size_t size @ 8]] ) ] ]]
;------------
pop rax
mov QWORD[rbp-24], rax
;[[ id : fd]]
;------------
mov rbx, QWORD[rbp-8]
mov rdi, rbx
;[[ id : buffer]]
;------------
mov rbx, QWORD[rbp-24]
mov rsi, rbx
;[[ id : fsize]]
;------------
mov rbx, QWORD[rbp-16]
mov rdx, rbx
mov rax, 0
call _ssize_t_read_pfd_tchar.size_t
push rax
;[[ fn(x) : [ function ssize_t read( [[ Variable: fd_t fd @ 8], [ Variable: char. buf @ 16], [ Variable: size_t count @ 24]] ) ] ], [ < : <], [ int : 0]]
mov rcx, 0
pop rbx
cmp rbx, rcx
setl bl
;------------
mov QWORD[rbp-32], rbx
;[[ id : out]]
;------------
mov rbx, QWORD[rbp-32]
mov rax, rbx
and al, 00000001b
cmp al, 1
jne _LIFPOST_0x36
;[[ int : 0]]
;------------
mov rax, 0
jmp ___void._floads_pfd_t__return
jmp _LIFELSE_0x37
_LIFPOST_0x36:
_LIFELSE_0x37:
;[[ id : buffer]]
;------------
mov rax, QWORD[rbp-24]
jmp ___void._floads_pfd_t__return
___void._floads_pfd_t__return:
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
;------------
mov rbx, QWORD[rbp-8]
mov rdi, rbx
;[[ id : buffer]]
;------------
mov rbx, QWORD[rbp-16]
mov rsi, rbx
;[[ id : amt]]
;------------
mov rbx, QWORD[rbp-24]
mov rdx, rbx
mov rax, 0
call _ssize_t_read_pfd_tchar.size_t
push rax
;[[ fn(x) : [ function ssize_t read( [[ Variable: fd_t fd @ 8], [ Variable: char. buf @ 16], [ Variable: size_t count @ 24]] ) ] ], [ > : >], [ int : 0]]
mov rcx, 0
pop rbx
cmp rbx, rcx
setg bl
;------------
mov QWORD[rbp-32], rbx
;[[ id : fd]]
;------------
mov rbx, QWORD[rbp-8]
mov rdi, rbx
;[[ id : amt]]
;------------
mov rbx, QWORD[rbp-24]
mov rsi, rbx
;[[ id : SEEK_CUR]]
;------------
mov rbx, [SEEK_CUR]
mov rdx, rbx
mov rax, 0
call _int_lseek_pfd_tintint
;[[ id : out]]
;------------
mov rax, QWORD[rbp-32]
jmp ___bool_fgets_pfd_tchar.size_t__return
___bool_fgets_pfd_tchar.size_t__return:
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
;------------
mov rbx, QWORD[rbp-16]
mov rdi, rbx
mov rax, 0
call _size_t_strlen_pchar.
push rax
;[[ fn(x) : [ function size_t strlen( [[ Variable: char. str @ 8]] ) ] ]]
;------------
pop rax
mov QWORD[rbp-24], rax
;[[ id : fd]]
;------------
mov rbx, QWORD[rbp-8]
mov rdi, rbx
;[[ id : text]]
;------------
mov rbx, QWORD[rbp-16]
mov rsi, rbx
;[[ id : l]]
;------------
mov rbx, QWORD[rbp-24]
mov rdx, rbx
mov rax, 0
call _ssize_t_write_pfd_tchar.size_t
push rax
;[[ fn(x) : [ function ssize_t write( [[ Variable: fd_t fd @ 8], [ Variable: char. buf @ 16], [ Variable: size_t count @ 24]] ) ] ]]
;------------
pop rax
mov QWORD[rbp-32], rax
;[[ id : fd]]
;------------
mov rbx, QWORD[rbp-8]
mov rdi, rbx
;[[ id : l]]
;------------
mov rbx, QWORD[rbp-24]
mov rsi, rbx
;[[ id : SEEK_CUR]]
;------------
mov rbx, [SEEK_CUR]
mov rdx, rbx
mov rax, 0
call _int_lseek_pfd_tintint
;[[ id : out]]
;------------
mov rbx, QWORD[rbp-32]
mov rax, rbx
jmp ___int_fputs_pfd_tchar.__return
___int_fputs_pfd_tchar.__return:
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
;------------
mov QWORD[rbp-24], rbx
;[[ int : 0]]
;------------
mov QWORD[rbp-32], 0
;[[ int : 0]]
;------------
mov QWORD[rbp-40], 0
;[[ id : modehash], [ == : ==], [ id : _fopen_readonly]]
mov rcx, [_fopen_readonly]
mov rbx, QWORD[rbp-24]
cmp rbx, rcx
sete bl
;------------
mov rax, rbx
and al, 00000001b
cmp al, 1
jne _LIFPOST_0x2a
;[[ id : f]]
;[[ id : O_RDONLY]]
;------------
mov rcx, [O_RDONLY]
mov rbx, rcx
mov QWORD[rbp-40], rbx
jmp _LIFELSE_0x2b
_LIFPOST_0x2a:
;[[ id : modehash], [ == : ==], [ id : _fopen_writeonly]]
mov rcx, [_fopen_writeonly]
mov rbx, QWORD[rbp-24]
cmp rbx, rcx
sete bl
;------------
mov rax, rbx
and al, 00000001b
cmp al, 1
jne _LIFPOST_0x2c
;[[ id : f]]
;[[ id : O_WRONLY]]
;------------
mov rcx, [O_WRONLY]
mov rbx, rcx
mov QWORD[rbp-40], rbx
jmp _LIFELSE_0x2d
_LIFPOST_0x2c:
;[[ id : modehash], [ == : ==], [ id : _fopen_append]]
mov rcx, [_fopen_append]
mov rbx, QWORD[rbp-24]
cmp rbx, rcx
sete bl
;------------
mov rax, rbx
and al, 00000001b
cmp al, 1
jne _LIFPOST_0x2e
;[[ id : f]]
;[[ id : O_WRONLY], [ || : ||], [ id : O_APPEND]]
mov r10, [O_APPEND]
mov rcx, [O_WRONLY]
or rcx, r10
;------------
mov rbx, rcx
mov QWORD[rbp-40], rbx
jmp _LIFELSE_0x2f
_LIFPOST_0x2e:
;[[ id : modehash], [ == : ==], [ id : _fopen_rw]]
mov rcx, [_fopen_rw]
mov rbx, QWORD[rbp-24]
cmp rbx, rcx
sete bl
;------------
mov rax, rbx
and al, 00000001b
cmp al, 1
jne _LIFPOST_0x30
;[[ id : f]]
;[[ id : O_RDWR]]
;------------
mov rcx, [O_RDWR]
mov rbx, rcx
mov QWORD[rbp-40], rbx
jmp _LIFELSE_0x31
_LIFPOST_0x30:
;[[ id : modehash], [ == : ==], [ id : _fopen_wc]]
mov rcx, [_fopen_wc]
mov rbx, QWORD[rbp-24]
cmp rbx, rcx
sete bl
;------------
mov rax, rbx
and al, 00000001b
cmp al, 1
jne _LIFPOST_0x32
;[[ id : m]]
;[[ id : O_USRPERM]]
;------------
mov rcx, [O_USRPERM]
mov rbx, rcx
mov QWORD[rbp-32], rbx
;[[ id : f]]
;[[ id : O_RDWR], [ || : ||], [ id : O_CREAT]]
mov r10, [O_CREAT]
mov rcx, [O_RDWR]
or rcx, r10
;------------
mov rbx, rcx
mov QWORD[rbp-40], rbx
jmp _LIFELSE_0x33
_LIFPOST_0x32:
;[[ id : m]]
;[[ id : O_USRPERM]]
;------------
mov rcx, [O_USRPERM]
mov rbx, rcx
mov QWORD[rbp-32], rbx
;[[ id : f]]
;[[ id : O_RDWR], [ || : ||], [ id : O_APPEND], [ || : ||], [ id : O_CREAT]]
mov r10, [O_APPEND]
mov rcx, [O_RDWR]
or rcx, r10
mov r10, [O_CREAT]
or rcx, r10
;------------
mov rbx, rcx
mov QWORD[rbp-40], rbx
_LIFELSE_0x33:
_LIFELSE_0x31:
_LIFELSE_0x2f:
_LIFELSE_0x2d:
_LIFELSE_0x2b:
;[[ id : fname]]
;------------
mov rbx, QWORD[rbp-8]
mov rdi, rbx
;[[ id : f]]
;------------
mov rbx, QWORD[rbp-40]
mov rsi, rbx
;[[ id : m]]
;------------
mov rbx, QWORD[rbp-32]
mov rdx, rbx
mov rax, 0
call _fd_t_open_pchar.intmode_t
push rax
;[[ fn(x) : [ function fd_t open( [[ Variable: char. fname @ 8], [ Variable: int flags @ 16], [ Variable: mode_t mode @ 24]] ) ] ]]
;------------
pop rax
mov QWORD[rbp-48], rax
;[[ id : modehash], [ == : ==], [ int : 140], [ || : ||], [ id : modehash], [ == : ==], [ int : 87]]
mov rcx, 140
mov rbx, QWORD[rbp-24]
cmp rbx, rcx
sete bl
mov r10, 87
mov rcx, QWORD[rbp-24]
cmp rcx, r10
sete cl
or rbx, rcx
;------------
mov rax, rbx
and al, 00000001b
cmp al, 1
jne _LIFPOST_0x34
;[[ id : out]]
;------------
mov rbx, QWORD[rbp-48]
mov rdi, rbx
;[[ int : 0]]
;------------
mov rsi, 0
;[[ id : SEEK_END]]
;------------
mov rbx, [SEEK_END]
mov rdx, rbx
mov rax, 0
call _int_lseek_pfd_tintint
jmp _LIFELSE_0x35
_LIFPOST_0x34:
_LIFELSE_0x35:
;[[ id : out]]
;------------
mov rax, QWORD[rbp-48]
jmp ___FILE_fopen_pchar.char.__return
___FILE_fopen_pchar.char.__return:
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
;------------
mov rbx, 0
shl rbx, 3
add rbx, [rbp-8]
vmovdqu ymm0, [rbx]
;[[ int : 0]]
;------------
mov rcx, 0
shl rcx, 3
add rcx, [rbp-16]
vmovdqu ymm1, [rcx]
vmulpd ymm0, ymm1, ymm0
;[[ int : 0]]
;------------
mov rbx, 0
shl rbx, 3
add rbx, [rbp-8]
vmovdqu [rbx], ymm0
___void_v3dcross_pVec3d.Vec3d.__return:
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
;------------
mov rbx, 0
shl rbx, 3
add rbx, [rbp-8]
vmovdqu ymm0, [rbx]
;[[ int : 0]]
;------------
mov rcx, 0
shl rcx, 3
add rcx, [rbp-16]
vmovdqu ymm1, [rcx]
vsubpd ymm0, ymm1, ymm0
;[[ int : 0]]
;------------
mov rbx, 0
shl rbx, 3
add rbx, [rbp-8]
vmovdqu [rbx], ymm0
___void_v3dsub_pVec3d.Vec3d.__return:
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
;------------
mov rbx, 0
shl rbx, 3
add rbx, [rbp-8]
vmovdqu ymm0, [rbx]
;[[ int : 0]]
;------------
mov rcx, 0
shl rcx, 3
add rcx, [rbp-16]
vmovdqu ymm1, [rcx]
vaddpd ymm0, ymm1, ymm0
;[[ int : 0]]
;------------
mov rbx, 0
shl rbx, 3
add rbx, [rbp-8]
vmovdqu [rbx], ymm0
___void_v3dadd_pVec3d.Vec3d.__return:
leave
ret

;[ function uvoid iVec3d( [[ Variable: Vec3d. this @ 8], [ Variable: double a @ 16], [ Variable: double b @ 24], [ Variable: double c @ 32]] ) ]

_uvoid_iVec3d_pVec3d.doubledoubledouble:
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
;------------
movq xmm8, QWORD[rbp-16] ;<-
movq xmm7, xmm8 ;<-
movq [rbx], xmm7
;[[ id : this], [ -> : ->], [ id : y]]
mov rbx, QWORD[rbp-8]
lea rbx, [rbx+8]
;[[ id : b]]
;------------
movq xmm8, QWORD[rbp-24] ;<-
movq xmm7, xmm8 ;<-
movq [rbx], xmm7
;[[ id : this], [ -> : ->], [ id : z]]
mov rbx, QWORD[rbp-8]
lea rbx, [rbx+16]
;[[ id : c]]
;------------
movq xmm8, QWORD[rbp-32] ;<-
movq xmm7, xmm8 ;<-
movq [rbx], xmm7
___uvoid_iVec3d_pVec3d.doubledoubledouble__return:
leave
ret

;[ function int toInteger( [[ Variable: char. str @ 8]] ) ]

_int_toInteger_pchar.:
push rbp
mov rbp, rsp
sub rsp, 16
;Load Parameter: [ Variable: char. str @ 8]
mov [rbp-8], rdi
mov r8, rdi
xor rax, rax
xor rbx, rbx
mov rcx, -1
mov rdx, 1
_int_toint_lp1:
inc rcx
mov bl, [r8+rcx]
cmp bl, '0'
jl __int_toint_end
cmp bl, '9'
jg __int_toint_end
cmp bl, 0
jne _int_toint_lp1
dec r8
_int_toint_lp2:
xor rbx, rbx
mov bl, [ r8+rcx ]
sub rbx, 48 ; offset
imul rbx, rdx
add rax, rbx
imul rdx, 10
loop _int_toint_lp2
__int_toint_end:
___int_toInteger_pchar.__return:
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
;------------
mov QWORD[rbp-16], 80
;[[ id : size]]
;------------
mov rbx, QWORD[rbp-16]
mov rdi, rbx
mov rax, 0
call _void._malloc_psize_t
push rax
;[[ fn(x) : [ function void. malloc( [[ Variable: size_t size @ 8]] ) ] ]]
;------------
pop rax
mov QWORD[rbp-24], rax
;[[ int : 0]]
;------------
mov QWORD[rbp-40], 0
;[[ id : STRING_CONSTANT_10]]
;------------
mov rbx, STRING_CONSTANT_10
mov rdi, rbx
;[[ id : msg]]
;------------
mov rbx, QWORD[rbp-8]
mov rsi, rbx
mov rax, 0
call _void_printf_pchar.char.
;[[ id : c]]
mov rax, 0
call _char_getchar_p
push rax
;[[ fn(x) : [ function char getchar( [] ) ] ]]
;------------
pop rbx
mov QWORD[rbp-32], rbx
jmp _LWHILECMP_0x26
_LWHILESTART_0x25:
;[[ id : len], [ == : ==], [ id : size]]
mov rcx, QWORD[rbp-16]
mov rbx, QWORD[rbp-40]
cmp rbx, rcx
sete bl
;------------
mov rax, rbx
and al, 00000001b
cmp al, 1
jne _LIFPOST_0x28
;[[ id : size]]
;[[ id : size], [ * : *], [ int : 2]]
mov rcx, QWORD[rbp-16]
shl rcx, 1
;------------
mov rbx, rcx
mov QWORD[rbp-16], rbx
;[[ id : str]]
;[[ id : str]]
;------------
mov rdi, QWORD[rbp-24]
;[[ id : size]]
;------------
mov rcx, QWORD[rbp-16]
mov rsi, rcx
mov rax, 0
call _void._realloc_pvoid.size_t
push rax
;[[ fn(x) : [ function void. realloc( [[ Variable: void. og @ 8], [ Variable: size_t newsize @ 16]] ) ] ]]
;------------
pop rbx
mov QWORD[rbp-24], rbx
jmp _LIFELSE_0x29
_LIFPOST_0x28:
_LIFELSE_0x29:
;[[ id : c]]
mov rax, 0
call _char_getchar_p
push rax
;[[ fn(x) : [ function char getchar( [] ) ] ]]
;------------
pop rbx
mov QWORD[rbp-32], rbx
;[[ id : len]]
;[[ id : len], [ + : +], [ int : 1]]
mov r10, 1
mov rcx, QWORD[rbp-40]
add rcx, r10
;------------
mov rbx, rcx
mov QWORD[rbp-40], rbx
_LWHILECMP_0x26:
;[[ id : c], [ != : !=], [ int : 10]]
mov rcx, 10
mov rbx, QWORD[rbp-32]
cmp rbx, rcx
setne bl
;------------
mov rax, rbx
and al, 00000001b
cmp al, 1
je _LWHILESTART_0x25
_LWHILEEND_0x27:
;[[ id : str], [ [ : [], [ id : len], [ + : +], [ int : 1], [ ] : ]]]
mov rcx, 1
mov rbx, QWORD[rbp-40]
add rbx, rcx
mov rcx, QWORD[rbp-24]
lea rcx, [rcx+rbx*1]
;[[ int : 0]]
;------------
mov rbx, 0
mov [rcx], rbx
;[[ id : str]]
;------------
mov rdi, QWORD[rbp-24]
;[[ id : len]]
;------------
mov rbx, QWORD[rbp-40]
mov rsi, rbx
mov rax, 0
call _void._realloc_pvoid.size_t
push rax
;[[ fn(x) : [ function void. realloc( [[ Variable: void. og @ 8], [ Variable: size_t newsize @ 16]] ) ] ]]
;------------
pop rax
jmp ___char._getString_pchar.__return
___char._getString_pchar.__return:
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

;[ function void fgets( [[ Variable: char. buffer @ 8], [ Variable: int len @ 16], [ Variable: FILE_T file @ 24]] ) ]

_void_fgets_pchar.intFILE_T:
push rbp
mov rbp, rsp
sub rsp, 32
;Load Parameter: [ Variable: char. buffer @ 8]
mov [rbp-8], rdi
;Load Parameter: [ Variable: int len @ 16]
mov [rbp-16], rsi
;Load Parameter: [ Variable: FILE_T file @ 24]
mov [rbp-24], rdx
call fgets
___void_fgets_pchar.intFILE_T__return:
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

;[ function char getchar( [] ) ]

_char_getchar_p:
push rbp
mov rbp, rsp
sub rsp, 8
call getchar
___char_getchar_p__return:
leave
ret

;[ function char getChar( [[ Variable: char. msg @ 8]] ) ]

_char_getChar_pchar.:
push rbp
mov rbp, rsp
sub rsp, 16
;Load Parameter: [ Variable: char. msg @ 8]
mov [rbp-8], rdi
PRINT_STRING [rdi]
    GET_CHAR rax
___char_getChar_pchar.__return:
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

;[ function void print( [[ Variable: String. str @ 8]] ) ]

_void_print_pString.:
push rbp
mov rbp, rsp
sub rsp, 16
;Load Parameter: [ Variable: String. str @ 8]
mov [rbp-8], rdi
;[[ id : str], [ -> : ->], [ id : value]]
mov rbx, QWORD[rbp-8]
lea rbx, [rbx+0]
;------------
mov rbx, qword[rbx]
mov rdi, rbx
mov rax, 0
call _void_print_pchar.
___void_print_pString.__return:
leave
ret

;[ function int strfind( [[ Variable: String. this @ 8], [ Variable: char. sequence @ 16]] ) ]

_int_strfind_pString.char.:
push rbp
mov rbp, rsp
sub rsp, 48
;Load Parameter: [ Variable: String. this @ 8]
mov [rbp-8], rdi
;Load Parameter: [ Variable: char. sequence @ 16]
mov [rbp-16], rsi
;[[ id : sequence]]
;------------
mov rbx, QWORD[rbp-16]
mov rdi, rbx
mov rax, 0
call _size_t_strlen_pchar.
push rax
;[[ fn(x) : [ function size_t strlen( [[ Variable: char. str @ 8]] ) ] ]]
;------------
pop rax
mov QWORD[rbp-24], rax
;[[ id : sql], [ > : >], [ id : this], [ -> : ->], [ id : len]]
mov rbx, QWORD[rbp-8]
lea rbx, [rbx+8]
mov rbx, qword[rbx]
mov rcx, QWORD[rbp-24]
cmp rcx, rbx
setg cl
;------------
mov rax, rcx
and al, 00000001b
cmp al, 1
jne _LIFPOST_0x1d
;[[ int : 0], [ - : -], [ int : 1]]
;------------
mov rax, -1
jmp ___int_strfind_pString.char.__return
jmp _LIFELSE_0x1e
_LIFPOST_0x1d:
_LIFELSE_0x1e:
;[[ id : this], [ -> : ->], [ id : len], [ - : -], [ id : sql]]
mov rbx, QWORD[rbp-8]
lea rbx, [rbx+8]
mov rbx, qword[rbx]
mov rcx, QWORD[rbp-24]
sub rbx, rcx
;------------
mov QWORD[rbp-32], rbx
;[[ int : 0]]
;------------
mov QWORD[rbp-40], 0
jmp _LFORCMP_0x20
_LFORTOP_0x1f:
;[[ id : this], [ -> : ->], [ id : value], [ + : +], [ id : i]]
mov rbx, QWORD[rbp-8]
lea rbx, [rbx+0]
mov rbx, qword[rbx]
mov rcx, QWORD[rbp-40]
add rbx, rcx
;------------
mov rdi, rbx
;[[ id : sequence]]
;------------
mov rbx, QWORD[rbp-16]
mov rsi, rbx
;[[ id : sql]]
;------------
mov rbx, QWORD[rbp-24]
mov rdx, rbx
mov rax, 0
call _bool_substrequ_pchar.char.size_t
push rax
;[[ fn(x) : [ function bool substrequ( [[ Variable: char. a @ 8], [ Variable: char. b @ 16], [ Variable: size_t len @ 24]] ) ] ]]
;------------
pop rax
and al, 00000001b
cmp al, 1
jne _LIFPOST_0x23
;[[ id : i]]
;------------
mov rbx, QWORD[rbp-40]
mov rax, rbx
jmp ___int_strfind_pString.char.__return
jmp _LIFELSE_0x24
_LIFPOST_0x23:
_LIFELSE_0x24:
_LFORUPDATE_0x21:
;[[ id : i]]
;[[ int : 1]]
;------------
mov rbx, 1
add qword[rbp-40], rbx
_LFORCMP_0x20:
;[[ id : i], [ < : <], [ id : end]]
mov rcx, QWORD[rbp-32]
mov rbx, QWORD[rbp-40]
cmp rbx, rcx
setl bl
;------------
mov rax, rbx
and al, 00000001b
cmp al, 1
je _LFORTOP_0x1f
_LFOREND_0x22:
;[[ int : 0], [ - : -], [ int : 1]]
;------------
mov rax, -1
jmp ___int_strfind_pString.char.__return
___int_strfind_pString.char.__return:
leave
ret

;[ function void substring( [[ Variable: String. this @ 8], [ Variable: String. new @ 16], [ Variable: int start @ 24], [ Variable: int end @ 32]] ) ]

_void_substring_pString.String.intint:
push rbp
mov rbp, rsp
sub rsp, 48
;Load Parameter: [ Variable: String. this @ 8]
mov [rbp-8], rdi
;Load Parameter: [ Variable: String. new @ 16]
mov [rbp-16], rsi
;Load Parameter: [ Variable: int start @ 24]
mov [rbp-24], rdx
;Load Parameter: [ Variable: int end @ 32]
mov [rbp-32], rcx
;[[ id : end], [ - : -], [ id : start]]
mov rcx, QWORD[rbp-24]
mov rbx, QWORD[rbp-32]
sub rbx, rcx
;------------
mov QWORD[rbp-40], rbx
;[[ id : new], [ -> : ->], [ id : value]]
mov rbx, QWORD[rbp-16]
lea rbx, [rbx+0]
;------------
mov rbx, qword[rbx]
mov rdi, rbx
mov rax, 0
call _void_free_pvoid.
;[[ id : new], [ -> : ->], [ id : value]]
mov rbx, QWORD[rbp-16]
;[[ id : l]]
;------------
mov r10, QWORD[rbp-40]
mov rdi, r10
mov rax, 0
call _void._malloc_psize_t
push rax
;[[ fn(x) : [ function void. malloc( [[ Variable: size_t size @ 8]] ) ] ]]
;------------
pop rcx
mov [rbx], rcx
;[[ id : new], [ -> : ->], [ id : value]]
mov rbx, QWORD[rbp-16]
lea rbx, [rbx+0]
;------------
mov rbx, qword[rbx]
mov rdi, rbx
;[[ id : this], [ -> : ->], [ id : value], [ + : +], [ id : start]]
mov rbx, QWORD[rbp-8]
lea rbx, [rbx+0]
mov rbx, qword[rbx]
mov rcx, QWORD[rbp-24]
add rbx, rcx
;------------
mov rsi, rbx
;[[ id : l]]
;------------
mov rbx, QWORD[rbp-40]
mov rdx, rbx
mov rax, 0
call _void_memcpy_pvoid.void.size_t
;[[ id : new], [ -> : ->], [ id : len]]
mov rbx, QWORD[rbp-16]
lea rbx, [rbx+8]
;[[ id : l]]
;------------
mov r10, QWORD[rbp-40]
mov rcx, r10
mov [rbx], rcx
___void_substring_pString.String.intint__return:
leave
ret

;[ function bool strequ( [[ Variable: char. a @ 8], [ Variable: char. b @ 16]] ) ]

_bool_strequ_pchar.char.:
push rbp
mov rbp, rsp
sub rsp, 32
;Load Parameter: [ Variable: char. a @ 8]
mov [rbp-8], rdi
;Load Parameter: [ Variable: char. b @ 16]
mov [rbp-16], rsi
;[[ int : 0]]
;------------
mov QWORD[rbp-24], 0
jmp _LWHILECMP_0x17
_LWHILESTART_0x16:
;[[ id : a], [ [ : [], [ id : i], [ ] : ]], [ != : !=], [ id : b], [ [ : [], [ id : i], [ ] : ]]]
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
;------------
mov rax, rbx
and al, 00000001b
cmp al, 1
jne _LIFPOST_0x19
;[[ id : false]]
;------------
mov rax, [false]
jmp ___bool_strequ_pchar.char.__return
jmp _LIFELSE_0x1a
_LIFPOST_0x19:
_LIFELSE_0x1a:
;[[ id : a], [ [ : [], [ id : i], [ ] : ]], [ == : ==], [ int : 0]]
mov rcx, QWORD[rbp-24]
mov rbx, QWORD[rbp-8]
lea rbx, [rbx+rcx*1]
mov bl, byte[rbx]
and rbx, 0xff
mov rcx, 0
mov r10, rbx
cmp rcx, r10
sete cl
;------------
mov rax, rcx
and al, 00000001b
cmp al, 1
jne _LIFPOST_0x1b
jmp _LWHILEEND_0x18
jmp _LIFELSE_0x1c
_LIFPOST_0x1b:
_LIFELSE_0x1c:
;[[ id : i]]
;[[ int : 1]]
;------------
mov rbx, 1
add qword[rbp-24], rbx
_LWHILECMP_0x17:
;[[ id : true]]
;------------
mov rbx, [true]
mov rax, rbx
and al, 00000001b
cmp al, 1
je _LWHILESTART_0x16
_LWHILEEND_0x18:
;[[ id : true]]
;------------
mov rax, [true]
jmp ___bool_strequ_pchar.char.__return
___bool_strequ_pchar.char.__return:
leave
ret

;[ function bool substrequ( [[ Variable: char. a @ 8], [ Variable: char. b @ 16], [ Variable: size_t len @ 24]] ) ]

_bool_substrequ_pchar.char.size_t:
push rbp
mov rbp, rsp
sub rsp, 40
;Load Parameter: [ Variable: char. a @ 8]
mov [rbp-8], rdi
;Load Parameter: [ Variable: char. b @ 16]
mov [rbp-16], rsi
;Load Parameter: [ Variable: size_t len @ 24]
mov [rbp-24], rdx
;[[ int : 0]]
;------------
mov QWORD[rbp-32], 0
jmp _LFORCMP_0x11
_LFORTOP_0x10:
;[[ id : a], [ [ : [], [ id : i], [ ] : ]], [ != : !=], [ id : b], [ [ : [], [ id : i], [ ] : ]]]
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
;------------
mov rax, rbx
and al, 00000001b
cmp al, 1
jne _LIFPOST_0x14
;[[ id : false]]
;------------
mov rax, [false]
jmp ___bool_substrequ_pchar.char.size_t__return
jmp _LIFELSE_0x15
_LIFPOST_0x14:
_LIFELSE_0x15:
_LFORUPDATE_0x12:
;[[ id : i]]
;[[ int : 1]]
;------------
mov rbx, 1
add qword[rbp-32], rbx
_LFORCMP_0x11:
;[[ id : i], [ < : <], [ id : len]]
mov rcx, QWORD[rbp-24]
mov rbx, QWORD[rbp-32]
cmp rbx, rcx
setl bl
;------------
mov rax, rbx
and al, 00000001b
cmp al, 1
je _LFORTOP_0x10
_LFOREND_0x13:
;[[ id : true]]
;------------
mov rax, [true]
jmp ___bool_substrequ_pchar.char.size_t__return
___bool_substrequ_pchar.char.size_t__return:
leave
ret

;[ function void appendString( [[ Variable: String. this @ 8], [ Variable: char. other @ 16]] ) ]

_void_appendString_pString.char.:
push rbp
mov rbp, rsp
sub rsp, 48
;Load Parameter: [ Variable: String. this @ 8]
mov [rbp-8], rdi
;Load Parameter: [ Variable: char. other @ 16]
mov [rbp-16], rsi
;[[ id : other]]
;------------
mov rbx, QWORD[rbp-16]
mov rdi, rbx
mov rax, 0
call _size_t_strlen_pchar.
push rax
;[[ fn(x) : [ function size_t strlen( [[ Variable: char. str @ 8]] ) ] ]]
;------------
pop rax
mov QWORD[rbp-24], rax
;[[ id : this], [ -> : ->], [ id : value]]
mov rbx, QWORD[rbp-8]
lea rbx, [rbx+0]
;------------
mov rbx, qword[rbx]
mov rdi, rbx
;[[ id : this], [ -> : ->], [ id : len], [ + : +], [ id : ol]]
mov rbx, QWORD[rbp-8]
lea rbx, [rbx+8]
mov rbx, qword[rbx]
mov rcx, QWORD[rbp-24]
add rbx, rcx
;------------
mov rsi, rbx
mov rax, 0
call _void._realloc_pvoid.size_t
push rax
;[[ fn(x) : [ function void. realloc( [[ Variable: void. og @ 8], [ Variable: size_t newsize @ 16]] ) ] ]]
;------------
pop rax
mov QWORD[rbp-32], rax
;[[ id : newvalue], [ == : ==], [ id : nullptr]]
mov rbx, nullptr
mov rcx, QWORD[rbp-32]
cmp rbx, rcx
sete bl
;------------
mov rax, rbx
and al, 00000001b
cmp al, 1
jne _LIFPOST_0xe
;[[ id : STRING_CONSTANT_9]]
;------------
mov rbx, STRING_CONSTANT_9
mov rdi, rbx
mov rax, 0
call _void_print_pchar.
jmp _LIFELSE_0xf
_LIFPOST_0xe:
_LIFELSE_0xf:
;[[ id : newvalue], [ + : +], [ id : this], [ -> : ->], [ id : len]]
mov rbx, QWORD[rbp-8]
lea rbx, [rbx+8]
mov rbx, qword[rbx]
mov rcx, QWORD[rbp-32]
add rcx, rbx
;------------
mov QWORD[rbp-40], rcx
;[[ id : ostart]]
;------------
mov rdi, QWORD[rbp-40]
;[[ id : other]]
;------------
mov rsi, QWORD[rbp-16]
;[[ id : ol]]
;------------
mov rbx, QWORD[rbp-24]
mov rdx, rbx
mov rax, 0
call _void_memcpy_pvoid.void.size_t
;[[ id : this], [ -> : ->], [ id : value]]
mov rbx, QWORD[rbp-8]
;[[ id : newvalue]]
;------------
mov r10, QWORD[rbp-32]
mov rcx, r10
mov [rbx], rcx
;[[ id : this], [ -> : ->], [ id : len]]
mov rbx, QWORD[rbp-8]
lea rbx, [rbx+8]
;[[ id : this], [ -> : ->], [ id : len], [ + : +], [ id : ol]]
mov r10, QWORD[rbp-8]
lea r10, [r10+8]
mov r10, qword[r10]
mov r11, QWORD[rbp-24]
add r10, r11
;------------
mov rcx, r10
mov [rbx], rcx
___void_appendString_pString.char.__return:
leave
ret

;[ function uvoid iString( [[ Variable: String. this @ 8], [ Variable: char. starter @ 16]] ) ]

_uvoid_iString_pString.char.:
push rbp
mov rbp, rsp
sub rsp, 32
;Load Parameter: [ Variable: String. this @ 8]
mov [rbp-8], rdi
;Load Parameter: [ Variable: char. starter @ 16]
mov [rbp-16], rsi
;[[ id : starter]]
;------------
mov rbx, QWORD[rbp-16]
mov rdi, rbx
mov rax, 0
call _size_t_strlen_pchar.
push rax
;[[ fn(x) : [ function size_t strlen( [[ Variable: char. str @ 8]] ) ] ]]
;------------
pop rax
mov QWORD[rbp-24], rax
;[[ id : this], [ -> : ->], [ id : len]]
mov rbx, QWORD[rbp-8]
lea rbx, [rbx+8]
;[[ id : l]]
;------------
mov r10, QWORD[rbp-24]
mov rcx, r10
mov [rbx], rcx
;[[ id : this], [ -> : ->], [ id : value]]
mov rbx, QWORD[rbp-8]
;[[ id : l]]
;------------
mov r10, QWORD[rbp-24]
mov rdi, r10
mov rax, 0
call _void._malloc_psize_t
push rax
;[[ fn(x) : [ function void. malloc( [[ Variable: size_t size @ 8]] ) ] ]]
;------------
pop rcx
mov [rbx], rcx
;[[ id : this], [ -> : ->], [ id : value]]
mov rbx, QWORD[rbp-8]
lea rbx, [rbx+0]
;------------
mov rbx, qword[rbx]
mov rdi, rbx
;[[ id : starter]]
;------------
mov rsi, QWORD[rbp-16]
;[[ id : l]]
;------------
mov rbx, QWORD[rbp-24]
mov rdx, rbx
mov rax, 0
call _void_memcpy_pvoid.void.size_t
___uvoid_iString_pString.char.__return:
leave
ret

;[ function uvoid xString( [[ Variable: String. this @ 8]] ) ]

_uvoid_xString_pString.:
push rbp
mov rbp, rsp
sub rsp, 16
;Load Parameter: [ Variable: String. this @ 8]
mov [rbp-8], rdi
;[[ id : this], [ -> : ->], [ id : value]]
mov rbx, QWORD[rbp-8]
lea rbx, [rbx+0]
;------------
mov rbx, qword[rbx]
mov rdi, rbx
mov rax, 0
call _void_free_pvoid.
___uvoid_xString_pString.__return:
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

;[ function bool isdigit( [[ Variable: char c @ 8]] ) ]

_bool_isdigit_pchar:
push rbp
mov rbp, rsp
sub rsp, 16
;Load Parameter: [ Variable: char c @ 8]
mov [rbp-8], rdi
;[[ id : c], [ > : >], [ char : 48], [ && : &&], [ id : c], [ < : <], [ char : 57]]
mov rcx, 48
mov rbx, QWORD[rbp-8]
cmp rbx, rcx
setg bl
mov r10, 57
mov rcx, QWORD[rbp-8]
cmp rcx, r10
setl cl
and rbx, rcx
;------------
mov rax, rbx
jmp ___bool_isdigit_pchar__return
___bool_isdigit_pchar__return:
leave
ret

;[ function int lseek( [[ Variable: fd_t fd @ 8], [ Variable: int offset @ 16], [ Variable: int whence @ 24]] ) ]

_int_lseek_pfd_tintint:
push rbp
mov rbp, rsp
sub rsp, 32
;Load Parameter: [ Variable: fd_t fd @ 8]
mov [rbp-8], rdi
;Load Parameter: [ Variable: int offset @ 16]
mov [rbp-16], rsi
;Load Parameter: [ Variable: int whence @ 24]
mov [rbp-24], rdx
mov rax, 8
    syscall
___int_lseek_pfd_tintint__return:
leave
ret

;[ function int chdir( [[ Variable: char. pathname @ 8]] ) ]

_int_chdir_pchar.:
push rbp
mov rbp, rsp
sub rsp, 16
;Load Parameter: [ Variable: char. pathname @ 8]
mov [rbp-8], rdi
mov rax, 80
    syscall
___int_chdir_pchar.__return:
leave
ret

;[ function int creat( [[ Variable: char. pathname @ 8], [ Variable: mode_t mode @ 16]] ) ]

_int_creat_pchar.mode_t:
push rbp
mov rbp, rsp
sub rsp, 24
;Load Parameter: [ Variable: char. pathname @ 8]
mov [rbp-8], rdi
;Load Parameter: [ Variable: mode_t mode @ 16]
mov [rbp-16], rsi
mov rax, 85
    syscall
___int_creat_pchar.mode_t__return:
leave
ret

;[ function int rmdir( [[ Variable: char. pathname @ 8]] ) ]

_int_rmdir_pchar.:
push rbp
mov rbp, rsp
sub rsp, 16
;Load Parameter: [ Variable: char. pathname @ 8]
mov [rbp-8], rdi
mov rax, 84
    syscall
___int_rmdir_pchar.__return:
leave
ret

;[ function int mkdir( [[ Variable: char. pathname @ 8], [ Variable: mode_t mode @ 16]] ) ]

_int_mkdir_pchar.mode_t:
push rbp
mov rbp, rsp
sub rsp, 24
;Load Parameter: [ Variable: char. pathname @ 8]
mov [rbp-8], rdi
;Load Parameter: [ Variable: mode_t mode @ 16]
mov [rbp-16], rsi
mov rax, 83
    syscall
___int_mkdir_pchar.mode_t__return:
leave
ret

;[ function int close( [[ Variable: fd_t fd @ 8]] ) ]

_int_close_pfd_t:
push rbp
mov rbp, rsp
sub rsp, 16
;Load Parameter: [ Variable: fd_t fd @ 8]
mov [rbp-8], rdi
mov rax, 3
    syscall
___int_close_pfd_t__return:
leave
ret

;[ function fd_t open( [[ Variable: char. fname @ 8], [ Variable: int flags @ 16], [ Variable: mode_t mode @ 24]] ) ]

_fd_t_open_pchar.intmode_t:
push rbp
mov rbp, rsp
sub rsp, 32
;Load Parameter: [ Variable: char. fname @ 8]
mov [rbp-8], rdi
;Load Parameter: [ Variable: int flags @ 16]
mov [rbp-16], rsi
;Load Parameter: [ Variable: mode_t mode @ 24]
mov [rbp-24], rdx
mov rax, 2
        syscall
___fd_t_open_pchar.intmode_t__return:
leave
ret

;[ function ssize_t write( [[ Variable: fd_t fd @ 8], [ Variable: char. buf @ 16], [ Variable: size_t count @ 24]] ) ]

_ssize_t_write_pfd_tchar.size_t:
push rbp
mov rbp, rsp
sub rsp, 32
;Load Parameter: [ Variable: fd_t fd @ 8]
mov [rbp-8], rdi
;Load Parameter: [ Variable: char. buf @ 16]
mov [rbp-16], rsi
;Load Parameter: [ Variable: size_t count @ 24]
mov [rbp-24], rdx
mov rax, 1
        syscall
___ssize_t_write_pfd_tchar.size_t__return:
leave
ret

;[ function ssize_t read( [[ Variable: fd_t fd @ 8], [ Variable: char. buf @ 16], [ Variable: size_t count @ 24]] ) ]

_ssize_t_read_pfd_tchar.size_t:
push rbp
mov rbp, rsp
sub rsp, 32
;Load Parameter: [ Variable: fd_t fd @ 8]
mov [rbp-8], rdi
;Load Parameter: [ Variable: char. buf @ 16]
mov [rbp-16], rsi
;Load Parameter: [ Variable: size_t count @ 24]
mov [rbp-24], rdx
xor rax, rax
    syscall
___ssize_t_read_pfd_tchar.size_t__return:
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
;------------
pop rbx
mov [rand_next], rbx
___void_srand_p__return:
leave
ret

;[ function int rand( [] ) ]

_int_rand_p:
push rbp
mov rbp, rsp
sub rsp, 8
;[[ id : rand_next]]
;[[ id : rand_next], [ ^ : ^], [ ( : (], [ id : rand_next], [ << : <<], [ int : 13], [ ) : )]]
mov r10, 13
mov rcx, [rand_next]
mov r11, rcx
mov cl, r10b
sal r11, cl
mov rcx, r11
mov r10, [rand_next]
xor r10, rcx
;------------
mov rbx, r10
mov [rand_next], rbx
;[[ id : rand_next]]
;[[ id : rand_next], [ ^ : ^], [ ( : (], [ id : rand_next], [ >> : >>], [ int : 17], [ ) : )]]
mov r10, 17
mov rcx, [rand_next]
mov r11, rcx
mov cl, r10b
sar r11, cl
mov rcx, r11
mov r10, [rand_next]
xor r10, rcx
;------------
mov rbx, r10
mov [rand_next], rbx
;[[ id : rand_next]]
;[[ id : rand_next], [ ^ : ^], [ ( : (], [ id : rand_next], [ << : <<], [ int : 5], [ ) : )]]
mov r10, 5
mov rcx, [rand_next]
mov r11, rcx
mov cl, r10b
sal r11, cl
mov rcx, r11
mov r10, [rand_next]
xor r10, rcx
;------------
mov rbx, r10
mov [rand_next], rbx
;[[ id : rand_next]]
;------------
mov rbx, [rand_next]
mov rax, rbx
jmp ___int_rand_p__return
___int_rand_p__return:
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

;[ function double abs( [[ Variable: double x @ 8]] ) ]

_double_abs_pdouble:
push rbp
mov rbp, rsp
sub rsp, 16
;Load Parameter: [ Variable: double x @ 8]
movsd [rbp-8], xmm0
movsd xmm1, xmm0
  movsd xmm2, [M_MINZERO]
  xorpd xmm1, xmm2
  andpd xmm0, xmm1
___double_abs_pdouble__return:
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
;------------
mov rbx, QWORD[rbp-8]
mov rdi, rbx
;[[ id : exp]]
;------------
mov rbx, QWORD[rbp-16]
mov rsi, rbx
mov rax, 0
call _int_pow_pintint
cvtsi2sd xmm0, rax
___double_pow_pintint__return:
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
;------------
mov rax, rbx
and al, 00000001b
cmp al, 1
jne _LIFPOST_0x8
;[[ id : STRING_CONSTANT_5]]
;------------
mov rbx, STRING_CONSTANT_5
mov rdi, rbx
mov rax, 0
call _void_print_pchar.
;[[ int : 0]]
;------------
mov rax, 0
jmp ___void_print_pint.int__return
jmp _LIFELSE_0x9
_LIFPOST_0x8:
_LIFELSE_0x9:
;[[ id : STRING_CONSTANT_6]]
;------------
mov rbx, STRING_CONSTANT_6
mov rdi, rbx
;[[ int : 0]]
;------------
mov rsi, 0
mov rax, 0
call _void_printf_pchar.int
;[[ int : 0]]
;------------
mov QWORD[rbp-24], 0
jmp _LFORCMP_0xb
_LFORTOP_0xa:
;[[ id : STRING_CONSTANT_7]]
;------------
mov rbx, STRING_CONSTANT_7
mov rdi, rbx
;[[ id : a], [ [ : [], [ id : i], [ ] : ]]]
mov rcx, QWORD[rbp-24]
mov rbx, QWORD[rbp-8]
lea rbx, [rbx+rcx*8]
;------------
mov rbx, qword[rbx]
mov rsi, rbx
mov rax, 0
call _void_printf_pchar.int
_LFORUPDATE_0xc:
;[[ id : i]]
;[[ int : 1]]
;------------
mov rbx, 1
add qword[rbp-24], rbx
_LFORCMP_0xb:
;[[ id : i], [ < : <], [ id : len], [ - : -], [ int : 1]]
mov rcx, 1
mov rbx, QWORD[rbp-16]
sub rbx, rcx
mov rcx, QWORD[rbp-24]
cmp rcx, rbx
setl cl
;------------
mov rax, rcx
and al, 00000001b
cmp al, 1
je _LFORTOP_0xa
_LFOREND_0xd:
;[[ id : STRING_CONSTANT_8]]
;------------
mov rbx, STRING_CONSTANT_8
mov rdi, rbx
;[[ id : a], [ [ : [], [ id : len], [ - : -], [ int : 1], [ ] : ]]]
mov rcx, 1
mov rbx, QWORD[rbp-16]
sub rbx, rcx
mov rcx, QWORD[rbp-8]
lea rcx, [rcx+rbx*8]
;------------
mov rcx, qword[rcx]
mov rsi, rcx
mov rax, 0
call _void_printf_pchar.int
___void_print_pint.int__return:
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
;------------
mov rbx, QWORD[rbp-8]
mov QWORD[rbp-16], rbx
;[[ id : ptr]]
;------------
mov rbx, QWORD[rbp-16]
mov rdi, rbx
mov rax, 0
call _void_print_pint
___void_print_pvoid.__return:
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
;------------
mov rbx, QWORD[rbp-8]
mov rax, rbx
and al, 00000001b
cmp al, 1
jne _LIFPOST_0x6
;[[ id : STRING_CONSTANT_3]]
;------------
mov rbx, STRING_CONSTANT_3
mov rdi, rbx
mov rax, 0
call _void_print_pchar.
;[[ int : 0]]
;------------
mov rax, 0
jmp ___void_print_pbool__return
jmp _LIFELSE_0x7
_LIFPOST_0x6:
_LIFELSE_0x7:
;[[ id : STRING_CONSTANT_4]]
;------------
mov rbx, STRING_CONSTANT_4
mov rdi, rbx
mov rax, 0
call _void_print_pchar.
;[[ int : 0]]
;------------
mov rax, 0
jmp ___void_print_pbool__return
___void_print_pbool__return:
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

;[ function void print( [[ Variable: double a @ 8]] ) ]

_void_print_pdouble:
push rbp
mov rbp, rsp
sub rsp, 16
;Load Parameter: [ Variable: double a @ 8]
movsd [rbp-8], xmm0
;[[ id : STRING_CONSTANT_2]]
;------------
mov rbx, STRING_CONSTANT_2
mov rdi, rbx
;[[ id : a]]
;------------
movq xmm7, QWORD[rbp-8] ;<-
movq xmm0, xmm7 ;<-
mov rax, 1
call _void_printf_pchar.double
___void_print_pdouble__return:
leave
ret

;[ function void print( [[ Variable: uint a @ 8]] ) ]

_void_print_puint:
push rbp
mov rbp, rsp
sub rsp, 16
;Load Parameter: [ Variable: uint a @ 8]
mov [rbp-8], rdi
;[[ id : STRING_CONSTANT_1]]
;------------
mov rbx, STRING_CONSTANT_1
mov rdi, rbx
;[[ id : a]]
;------------
mov rbx, QWORD[rbp-8]
mov rsi, rbx
mov rax, 0
call _void_printf_pchar.uint
___void_print_puint__return:
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

;[ function void print( [[ Variable: int a @ 8]] ) ]

_void_print_pint:
push rbp
mov rbp, rsp
sub rsp, 16
;Load Parameter: [ Variable: int a @ 8]
mov [rbp-8], rdi
;[[ id : STRING_CONSTANT_0]]
;------------
mov rbx, STRING_CONSTANT_0
mov rdi, rbx
;[[ id : a]]
;------------
mov rbx, QWORD[rbp-8]
mov rsi, rbx
mov rax, 0
call _void_printf_pchar.int
___void_print_pint__return:
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

;[ function void printf( [[ Variable: char. template @ 8]] ) ]

_void_printf_pchar.:
push rbp
mov rbp, rsp
sub rsp, 16
;Load Parameter: [ Variable: char. template @ 8]
mov [rbp-8], rdi
ALIGN_STACK
call printf
FFLUSH_STDOUT
UNALIGN_STACK
___void_printf_pchar.__return:
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

;[ function void strcpy( [[ Variable: char. dest @ 8], [ Variable: char. source @ 16]] ) ]

_void_strcpy_pchar.char.:
push rbp
mov rbp, rsp
sub rsp, 24
;Load Parameter: [ Variable: char. dest @ 8]
mov [rbp-8], rdi
;Load Parameter: [ Variable: char. source @ 16]
mov [rbp-16], rsi
_void_strcpy_pchar.char._flp:
    mov bl, [rsi]
    cmp bl, 0
    mov [rdi], bl
    jnz _void_strcpy_pchar.char._flp
___void_strcpy_pchar.char.__return:
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
;------------
mov QWORD[rbp-32], rbx
;[[ ( : (], [ id : bytes], [ - : -], [ id : offset], [ ) : )], [ / : /], [ int : 4]]
mov rcx, QWORD[rbp-32]
mov rbx, QWORD[rbp-24]
sub rbx, rcx
shr rbx, 2
;------------
mov QWORD[rbp-40], rbx
;[[ int : 0]]
;------------
mov QWORD[rbp-48], 0
jmp _LFORCMP_0x1
_LFORTOP_0x0:
;[[ id : i]]
;------------
mov rcx, QWORD[rbp-48]
mov rbx, rcx
shl rbx, 3
add rbx, [rbp-16]
vmovdqu ymm0, [rbx]
;[[ id : i]]
;------------
mov rcx, QWORD[rbp-48]
mov rbx, rcx
shl rbx, 3
add rbx, [rbp-8]
vmovdqu [rbx], ymm0
_LFORUPDATE_0x2:
;[[ id : i]]
;[[ id : i], [ + : +], [ int : 4]]
mov r10, 4
mov rcx, QWORD[rbp-48]
add rcx, r10
;------------
mov rbx, rcx
mov QWORD[rbp-48], rbx
_LFORCMP_0x1:
;[[ id : i], [ < : <], [ id : avxcount]]
mov rcx, QWORD[rbp-40]
mov rbx, QWORD[rbp-48]
cmp rbx, rcx
setl bl
;------------
mov rax, rbx
and al, 00000001b
cmp al, 1
je _LFORTOP_0x0
_LFOREND_0x3:
;[[ id : offset], [ != : !=], [ int : 0]]
mov rcx, 0
mov rbx, QWORD[rbp-32]
cmp rbx, rcx
setne bl
;------------
mov rax, rbx
and al, 00000001b
cmp al, 1
jne _LIFPOST_0x4
;[[ id : dest], [ + : +], [ id : avxcount]]
mov rbx, QWORD[rbp-8]
mov rcx, QWORD[rbp-40]
add rbx, rcx
;------------
mov rdi, rbx
;[[ id : source], [ + : +], [ id : avxcount]]
mov rbx, QWORD[rbp-16]
mov rcx, QWORD[rbp-40]
add rbx, rcx
;------------
mov rsi, rbx
;[[ id : offset]]
;------------
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

;[ function int main( [[ Variable: int argc @ 8], [ Variable: char.. argv @ 16]] ) ]

_int_main_pintchar..:
push rbp
mov rbp, rsp
sub rsp, 40
;Load Parameter: [ Variable: int argc @ 8]
mov [rbp-8], rdi
;Load Parameter: [ Variable: char.. argv @ 16]
mov [rbp-16], rsi
;[[ id : Test]]
;------------
mov rdi, 16
mov rax, 0
call _void._malloc_psize_t
push rax
;[[ fn(x) : [ function void. malloc( [[ Variable: size_t size @ 0]] ) ] ]]
;------------
pop rax
mov QWORD[rbp-24], rax
;[[ & : &], [ ( : (], [ id : t], [ -> : ->], [ id : b], [ ) : )]]
mov rbx, QWORD[rbp-24]
lea rbx, [rbx+8]
;------------
mov rdi, rbx
mov rax, 0
call _void_test_pdouble.
;[[ id : t], [ -> : ->], [ id : b]]
mov rbx, QWORD[rbp-24]
lea rbx, [rbx+8]
;------------
mov rbx, qword[rbx]
movq xmm0, rbx ;<-
mov rax, 1
call _void_print_pdouble
;[[ int : 6]]
;------------
mov QWORD[rbp-32], 6
;[[ id : a]]
;[[ int : 2]]
;------------
mov rbx, 2
add qword[rbp-32], rbx
;[[ id : t], [ -> : ->], [ id : b]]
mov rbx, QWORD[rbp-24]
lea rbx, [rbx+8]
;[[ int : 26]]
;------------
mov rax, 26
cvtsi2sd xmm7, rax
movsd xmm7, [rbx]
addsd xmm7, xmm7
movsd [rbx], xmm7
;[[ id : t], [ -> : ->], [ id : b]]
mov rbx, QWORD[rbp-24]
lea rbx, [rbx+8]
;------------
mov rbx, qword[rbx]
movq xmm0, rbx ;<-
mov rax, 1
call _void_print_pdouble
;[[ int : 0]]
;------------
mov rax, 0
jmp ___int_main_pintchar..__return
___int_main_pintchar..__return:
leave
ret

;[ function void test( [[ Variable: double. a @ 8]] ) ]

_void_test_pdouble.:
push rbp
mov rbp, rsp
sub rsp, 16
;Load Parameter: [ Variable: double. a @ 8]
mov [rbp-8], rdi
;[[ @ : @], [ id : a]]
mov rbx, QWORD[rbp-8]
mov rcx, rbx
;[[ id : FLT_CONSTANT_0]]
;------------
movq xmm8, [FLT_CONSTANT_0] ;<-
movq xmm7, xmm8 ;<-
movq [rcx], xmm7
___void_test_pdouble.__return:
leave
ret

CMAIN:
    mov rbp, rsp
    xor rax, rax
    ;rsi     ;commandline args
    ;rdi
    mov QWORD[HvptrDest_0], 0
mov QWORD[nullptr], HvptrDest_0
mov QWORD[null], 0
mov QWORD[MAXUINT], -1
mov QWORD[rand_next], 1
    call _int_main_pintchar..
    ret
