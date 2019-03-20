from shakti import k, error
from itertools import permutations

# !\'.
chars = "@#$%^&*()-_=+[]{};:\",<>?|/"
bad_substr = {}
length = 2

# TODO write input in Python and serialise to k
tests = [
    ("1 2 3", 6),
    ("1 2 3 4", 10),
]

progs = ("".join(p) + " " for p in permutations(chars, length))
valid_progs = (p for p in progs if all(x not in p for x in bad_substr))

worked = []
for p in valid_progs:
    try:
        if all(t[1] == k(p+t[0]) for t in tests):
            worked.append(p)
    except error:
        pass
    
print("Worked:", worked)
