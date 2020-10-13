
# raw linking commands
def link(i, o):
    return f"gcc \"include/macro.c\" -Wimplicit-function-declaration \"{i}\".o -no-pie -lm -o \"{o}\""

def assemble(o):
    return f"nasm -felf64  -w+number-overflow {o}.asm"