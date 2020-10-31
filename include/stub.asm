%%CEXTERNS%%


%%MACROTEXT%%

section .data
%%CONSTANTS%%

section .bss
align 16
%%HEAP%%
__heap_padding__: resz 1



section .text
align 8
global CMAIN


%%TEXT%%
