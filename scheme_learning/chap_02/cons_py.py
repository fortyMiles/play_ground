def cons(x, y):
    return lambda m: m(x, y)


def car(z):
    return z(lambda x, y: x)


def cdr(z):
    return z(lambda x, y: y)




