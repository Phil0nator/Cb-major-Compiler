import config
# raw linking commands


def link(i, o):
    if(config.__linkables__):
        links = config.__linkables__
        linktext = f"\"{links[0]}\""

        for l in links[1:]:
            linktext = f"{linktext} \"{l}\" "
        linktext += f" {i}.o"

    else:
        linktext = f"\"{i}.o\""
    return f"gcc \"{config.includepath}/macro.c\" {linktext} -g  -no-pie -lm -o \"{o}\""


def linkonly(i, o):
    # return f"ld {i} -E --dynamic-linker -felf64 -r -o {o}"
    return ""


def assemble(o):
    return f"nasm -felf64 -g {o}.asm -w-number-overflow"
