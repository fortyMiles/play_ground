'''
Test for even-fibs in python
Author Minchiuan 2016-3-17
'''


def fib(k):
    if k == 0 or k == 1:
        return k
    else:
        return fib(k - 1) + fib(k - 2)


def yield_fibs(low, high):
    numbers = range(low, high)
    for n in numbers:
        yield fib(n)


def yield_interval(low, high):
    num = low
    while num < high:
        yield num
        num += 1
        

def even_fibs(high):
    return filter(lambda x: x % 2 == 0, yield_fibs(0, high))
