

signed_comparisons = {

    "==": "e",
    "!=": "ne",
    "<": "l",
    ">": "g",
    "<=": "le",
    ">=": "ge"

}

unsigned_comparisons = {

    "==": "e",
    "!=": "ne",
    "<": "b",
    ">": "a",
    "<=": "be",
    ">=": "ae"

}


def getComparater(signed, op):
    if(signed):
        return signed_comparisons[op]
    else:
        return unsigned_comparisons[op]


def Instruction(op, operands=[]):
    out = f"{op} "
    for operand in operands:
        out = f"{out}{operand},"
    out = f"{out[:-1]}\n"
    return out
