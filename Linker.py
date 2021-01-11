import config
import platform
# raw linking commands


def link(i, o):

    if(config.__linkables__):
        links = config.__linkables__

        linktext = f"\"{i}.o\"" +\
            "".join(
                (f" -l\"{linkable}\"" if '.' not in linkable else f" \"{linkable}\"" for linkable in links))
    else:
        linktext = f"\"{i}.o\""

    if (config.__linkdirs__):
        linktext = f"{' '.join(['-L'+dir for dir in config.__linkdirs__])} {linktext}"

    debug = "-g" if config.__dbg__ else ""

    #
    #path = "gcc" if platform.system() != "Windows" else f"{config.compilepath}/windows/gcc/bin/gcc.exe"

    return f"{'gcc'} {linktext} {debug} -m64 -fno-pie {'-no-pie' if not config.__win__ else ''} -o \"{o}\""


def linkonly(i, o):
    # return f"ld {i} -E --dynamic-linker -felf64 -r -o {o}"
    return ""


def assemble(o):
    debug = "-g" if config.__dbg__ else ""

    if not config.__win__:

        # normal linux command using
        #   - elf 64 format
        #   - dwarf debug format
        if config.__platform__ == "Linux":
            return f"nasm -felf64 {debug} -Fdwarf {o}.asm "

        # Normal Mac Os command using
        #   - macho64 format
        #   - dwarf debug format
        else:
            return f"nasm {debug} -fmacho64 {o}.asm -o {o}.o"

    # Normal Windows command using
    #   - win64 format
    #   - dwarf debug format
    else:
        return f"{config.compilepath}/windows/NASM/nasm.exe -f win64 {debug} {o}.asm -o {o}.o"
