####################################################
#   The Constexpr file is used by the compiler to evaluate
#       specifically constant expressions ( expressions containing
#       only constant / macro values. )
#
#   Constexpr evaluation is done through a slight modification
#       to the ExpressionEvaluators, in that it will only call the
#       "calculateConstant" function of globals.py for the evaluation.
#####################################################
from globals import LONG, operatorISO, DOUBLE, LITERAL
import Classes.ExpressionComponent as EC
from Postfixer import Postfixer
from Classes.Variable import Variable
from Assembly.Registers import rfree


ternarystack = []  # ternary operator -- extra storage


def calculateConstant(a, b, op, c=None):
    if(op == "*"):
        return EC.ExpressionComponent(
            int(a.accessor * b.accessor), LITERAL.copy(), constint=True)
    elif(op == "/"):
        return EC.ExpressionComponent(
            int(a.accessor / b.accessor), LITERAL.copy(), constint=True)
    elif(op == "+"):
        return EC.ExpressionComponent(
            int(a.accessor + b.accessor), LITERAL.copy(), constint=True)
    elif(op == "-"):
        return EC.ExpressionComponent(
            int(a.accessor - b.accessor), LITERAL.copy(), constint=True)
    elif(op == "=="):
        return EC.ExpressionComponent(
            int(a.accessor == b.accessor), LITERAL.copy(), constint=True)
    elif(op == "!="):
        return EC.ExpressionComponent(
            int(a.accessor != b.accessor), LITERAL.copy(), constint=True)
    elif(op == "<="):
        return EC.ExpressionComponent(
            int(a.accessor <= b.accessor), LITERAL.copy(), constint=True)
    elif(op == ">="):
        return EC.ExpressionComponent(
            int(a.accessor >= b.accessor), LITERAL.copy(), constint=True)
    elif(op == ">"):
        return EC.ExpressionComponent(
            int(a.accessor > b.accessor), LITERAL.copy(), constint=True)
    elif(op == "<"):
        return EC.ExpressionComponent(
            int(a.accessor < b.accessor), LITERAL.copy(), constint=True)
    elif(op == "%"):
        return EC.ExpressionComponent(
            int(a.accessor % b.accessor), LITERAL.copy(), constint=True)
    elif(op == ">>"):
        return EC.ExpressionComponent(
            int(a.accessor >> b.accessor), LITERAL.copy(), constint=True)
    elif(op == "<<"):
        return EC.ExpressionComponent(
            int(a.accessor << b.accessor), LITERAL.copy(), constint=True)
    elif(op == "||"):
        return EC.ExpressionComponent(
            int(a.accessor or b.accessor), LITERAL.copy(), constint=True)
    elif(op == "&&"):
        return EC.ExpressionComponent(
            int(a.accessor and b.accessor), LITERAL.copy(), constint=True)
    elif(op == "&"):
        return EC.ExpressionComponent(
            int(a.accessor & b.accessor), LITERAL.copy(), constint=True)
    elif(op == "|"):
        return EC.ExpressionComponent(
            int(a.accessor | b.accessor), LITERAL.copy(), constint=True)
    elif(op == "^"):
        return EC.ExpressionComponent(
            int(a.accessor ^ b.accessor), LITERAL.copy(), constint=True)
    elif (op == ":"):
        ternarystack.append(("", a, b))
        if (c is not None):
            return a if c else b

    elif (op == "?"):
        _, opa, opb = ternarystack.pop()

        rfree(opa.accessor)  # just in case registers are being passed in here
        rfree(opb.accessor)
        rfree(b.accessor)

        return opa if a.accessor == True else opb


def calculateCfloat(a, b, op):
    if(op == "*"):
        return EC.ExpressionComponent(
            float(a.accessor * b.accessor), DOUBLE.copy(), constint=True)
    elif(op == "/"):
        return EC.ExpressionComponent(
            float(a.accessor / b.accessor), DOUBLE.copy(), constint=True)
    elif(op == "+"):
        return EC.ExpressionComponent(
            float(a.accessor + b.accessor), DOUBLE.copy(), constint=True)
    elif(op == "-"):
        return EC.ExpressionComponent(
            float(a.accessor - b.accessor), DOUBLE.copy(), constint=True)
    elif(op == "=="):
        return EC.ExpressionComponent(
            float(a.accessor == b.accessor), DOUBLE.copy(), constint=True)
    elif(op == "!="):
        return EC.ExpressionComponent(
            float(a.accessor != b.accessor), DOUBLE.copy(), constint=True)
    elif(op == "<="):
        return EC.ExpressionComponent(
            float(a.accessor <= b.accessor), DOUBLE.copy(), constint=True)
    elif(op == ">="):
        return EC.ExpressionComponent(
            float(a.accessor >= b.accessor), DOUBLE.copy(), constint=True)
    elif(op == ">"):
        return EC.ExpressionComponent(
            float(a.accessor > b.accessor), DOUBLE.copy(), constint=True)
    elif(op == "<"):
        return EC.ExpressionComponent(
            float(a.accessor < b.accessor), DOUBLE.copy(), constint=True)
    elif(op == "%"):
        return EC.ExpressionComponent(
            float(a.accessor % b.accessor), DOUBLE.copy(), constint=True)
    elif(op == ">>"):
        return EC.ExpressionComponent(
            float(a.accessor >> b.accessor), DOUBLE.copy(), constint=True)
    elif(op == "<<"):
        return EC.ExpressionComponent(
            float(a.accessor << b.accessor), DOUBLE.copy(), constint=True)
    elif(op == "||"):
        return EC.ExpressionComponent(
            float(a.accessor or b.accessor), DOUBLE.copy(), constint=True)
    elif(op == "&&"):
        return EC.ExpressionComponent(
            float(a.accessor & b.accessor), DOUBLE.copy(), constint=True)
    elif(op == "&"):
        return EC.ExpressionComponent(
            float(a.accessor & b.accessor), DOUBLE.copy(), constint=True)
    elif(op == "|"):
        return EC.ExpressionComponent(
            float(a.accessor | b.accessor), DOUBLE.copy(), constint=True)
    elif(op == "^"):
        return EC.ExpressionComponent(
            float(a.accessor ^ b.accessor), DOUBLE.copy(), constint=True)


# get result of a op b while taking initializer value for a and b if they
# are vars.
def evaluate(a, b, op):

    if(a is None):
        return evaluate(b, None, None)
    if(isinstance(a.accessor, Variable)):
        a.accessor = a.accessor.initializer
    if(b is not None and isinstance(b.accessor, Variable)):
        b.accessor = b.accessor.initializer
    
    if(b is not None):
        return calculateConstant(a, b, op) if a.isconstint() and b.isconstint() else calculateCfloat(a, b, op)
    return a


def buildConstantSet(flt, tokens, fn):

    values = []
    subeq = []
    for token in tokens:
        if(token.tok == "{" or token.tok == "," or token.tok == "}"):
            values.append(
                determineConstexpr(
                    flt,
                    subeq,
                    fn)) if len(subeq) > 0 else None
            subeq = []
            continue
        else:
            subeq.append(token)

    return EC.ExpressionComponent(values, set, token=tokens[0])


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
                            evaluate(EC.ExpressionComponent(0, LITERAL.copy()), a, op))
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
