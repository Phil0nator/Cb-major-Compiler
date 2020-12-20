import config
from Assembly.Instructions import Instruction
from Optimizers.Peephole import Peephole


class IntraproceduralOptimizer:

    def __init__(self, fn):
        self.fn = fn

    def optimize(self):

        # functions that are found to be simple enough, can be optimized:

        # implicit parameter register declaration...
        needs_recompile = False
        newfunc = self.fn.reset()
        newfunc.unreferenced = self.fn.unreferenced
        newfunc.stackCounter = 8
        newfunc.hasReturned = False
        newfunc.compileCount += 1
        newfunc.returnsConstexpr = self.fn.returnsConstexpr
        if(self.fn.fncalls == 0 and self.fn.extra_params <= 0 and self.fn.variardic == False):
            newfunc.implicit_paramregdecl = True
            needs_recompile = True
            pass
        else:
            for p in self.fn.parameters:
                if not p.referenced:
                    needs_recompile = True
                    newfunc.unreferenced.append(p.name)

        if len(self.fn.unreferenced) > 0:
            needs_recompile = True

        # TODO:
        # if self.returnsConstexpr and self.fncalls == 0 and not self.inline and not self.contains_rawasm and self.max_depth == 0:
        #    needs_recompile = False
        #    self.asm = f"{self.getCallingLabel()}:\nmov rax, {self.constexpr_returnvalue}\nret\n"
        if needs_recompile:
            self.fn.GC()
            og = config.__nowarn__
            config.__nowarn__ = True
            newfunc.compile()
            config.__nowarn__ = og
            self.fn.asm = newfunc.asm

        if not self.fn.contains_rawasm:
            pfinal = Peephole()
            pfinal.addline(self.fn.asm)
            self.fn.asm = pfinal.get()
