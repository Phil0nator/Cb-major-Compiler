####################################################
#   The Constexpr file is used by the compiler to evaluate
#       specifically constant expressions ( expressions containing
#       only constant / macro values. )
#
#   Constexpr evaluation is done through a slight modification
#       to the ExpressionEvaluators, in that it will only call the
#       "calculateConstant" function of globals.py for the evaluation.
#####################################################
from globals import *
import Classes.ExpressionComponent as EC
from Postfixer import Postfixer
from Classes.Variable import Variable


# get result of a op b while taking initializer value for a and b if they are vars.
def evaluate(a, b, op):
    if(isinstance(a.accessor, Variable)):
        a.accessor = a.accessor.initializer
    if(b != None and isinstance(b.accessor, Variable)):
        b.accessor = b.accessor.initializer
    return calculateConstant(a, b, op)


# standard postfix evaluation, using 'evaluate(a,b,op)'
# \see ExpressionEvaluator
def determineConstexpr(flt, tokens, fn):
    pf = Postfixer(tokens, fn)
    expr = pf.createPostfix()
    stack = []
    for e in expr:
        if(e.isoperation):
            if(not operatorISO(e.accessor)):
                op = e.accessor
                a = stack.pop()
                if(op == "-"):
                    if(len(stack) == 0):
                        stack.append(
                            evaluate(EC.ExpressionComponent(0, INT.copy()), a, op))
                        continue
                b = stack.pop()
                stack.append(evaluate(a, b, op))
            else:
                a = stack.pop()
                op = e.accessor
                stack.append(evaluate(a, None, op))
        else:
            stack.append(e)

    # return value in the form of ExpressionComponent
    return stack.pop()
