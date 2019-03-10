/ Using ngn/k

/ Generate programs
elem: "+*,/\\|"                  / Minimum chars that don't segfault. Others: @$%!^#&.<>?'
len: 2
idxs: + ! len # #elem
progs: .' elem @ idxs

/ Test programs
t: +((1 2 3; 6); (1 2 3 4; 10))
test: {1@x; t[1] ~ x'*t}
results: test' progs

/ Show working programs
-1@"Worked:"
progs @ & results

/ TODO
/ progs of size *up to* len
/ need something iterative beyond len ~6; perm counts are too big to generate eagerly
