x = 3
pr = lambda s : s
namenum = lambda x : (x == 1 and pr('one')) \
          or (x == 2 and pr('two')) \
          or (pr('other'))


test_list = [1, 2, 3, 4]

do_it = lambda f: f()


