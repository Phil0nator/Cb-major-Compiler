from globals import *
import Classes.ExpressionComponent as EC
from Postfixer import Postfixer
from Classes.Variable import Variable

def evaluate(a, b, op):
    if(isinstance(a.accessor, Variable)):
        a.accessor = a.accessor.initializer
    if(b != None and isinstance(b.accessor, Variable)):
        b.accessor = b.accessor.initializer
    return calculateConstant(a,b,op)
    


def determineConstexpr(flt, tokens, fn):
    pf = Postfixer(tokens,fn)
    expr = pf.createPostfix()
    stack = []
    for e in expr:
        if(e.isoperation):
            if(not operatorISO(e.accessor)):
                op = e.accessor
                a = stack.pop()
                if(op == "-"):
                    if(len(stack)==0):
                        stack.append(evaluate(EC.ExpressionComponent(0,INT.copy()),a,op))
                        continue
                b = stack.pop()
                stack.append(evaluate(a,b,op))
            else:
                a = stack.pop()
                op = e.accessor
                stack.append(evaluate(a,None,op))
        else:
            stack.append(e)
    

    return stack.pop()