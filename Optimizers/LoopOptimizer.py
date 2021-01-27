import config


class LoopOptimizer:

    def __init__(self, initializer, conditional, updater, parentfn):
        self.initializer = initializer
        self.conditional = condictional
        self.updater = updater
        self.parentfn = parentfn
