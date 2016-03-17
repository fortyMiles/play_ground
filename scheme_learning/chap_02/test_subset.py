def subsets(s):
    if s is None or not s:  # test s == []:
        return [[]]          # return []
    else:
        rest = subsets(s[1:])
        return rest + map(lambda e: [s[0]] + e, rest)
