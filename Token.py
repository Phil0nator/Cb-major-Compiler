


class Token:
    def __init__(self, tok, value=None, start=None, end=None):
        self.tok=tok
        self.value=value
        self.start = start
        self.end = end

        


    def __repr__(self):
        if self.value:
            return f'{self.tok} : {self.value}'
        return f'{self.tok}'

