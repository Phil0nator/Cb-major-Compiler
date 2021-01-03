import config
# raw linking commands


def link(i, o):
    
    
    
    if(config.__linkables__):
        links = config.__linkables__

        linktext = f"\"{i}.o\"" +\
                    "".join((f" -l\"{linkable}\"" if '.' not in linkable else f" \"{linkable}\"" for linkable in links))
    else:
        linktext = f"\"{i}.o\""

    if (config.__linkdirs__):
        linktext = f"{' '.join(['-L'+dir for dir in config.__linkdirs__])} {linktext}"

    debug = "-g" if config.__dbg__ else ""

    
    #print(linktext)
    return f"gcc \"{config.includepath}/macro.c\" {linktext} {debug} -m64 -fno-pie -no-pie -lm -o \"{o}\""


def linkonly(i, o):
    # return f"ld {i} -E --dynamic-linker -felf64 -r -o {o}"
    return ""


def assemble(o):
    debug = "-g" if config.__dbg__ else ""
    return f"nasm -felf64 {debug} -Fdwarf {o}.asm "
