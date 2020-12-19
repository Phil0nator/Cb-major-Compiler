from Classes.Token import *


class Macro:
    def __init__(self, name, params, body):
        self.name = name
        self.params = [p.value for p in params]  # format : (name)
        self.body = body

    def get(self, inputs, start):
        outbody = self.body.copy()
        i = 0

        while(i < len(outbody)):
            if(outbody[i] is None):
                i += 1
                continue

            outbody[i] = outbody[i].copy(start.start, start.end)
            val = outbody[i].value
            if outbody[i].tok == T_ID and val in self.params:

                outbody[i] = None
                outbody[i:i] = inputs[self.params.index(val)]
            i += 1
        return list(filter(None, outbody))

    def __repr__(self):
        return f"{self.name}({self.params}) : {self.body}\n"
