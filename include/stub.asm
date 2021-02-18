bits 64
%%CEXTERNS%%


%%MACROTEXT%%

section .data align=8
%%CONSTANTS%%

section .bss align=8
%%HEAP%%

section .init align=%%ALIGN%%
__cbbuiltin_initheader:
%%INIT%%

section .fini align=%%ALIGN%%
__cbbuiltin_finifooter:
%%FINI%%

section .text align=%%ALIGN%%
global main


%%TEXT%%
