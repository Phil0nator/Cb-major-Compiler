import config
# raw linking commands


def link(i, o):
    return f"gcc \"{config.includepath}/macro.c\" -Wimplicit-function-declaration \"{i}\".o -no-pie -lm -o \"{o}\""


def assemble(o):
    return f"nasm -felf64 {o}.asm -w-number-overflow"
