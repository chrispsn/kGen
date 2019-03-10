/ Generate programs
elem: "+*,/\\|"                  / Minimum chars that don't segfault. Others: @$%!^#&.<>?'
len: 2
idxs: + ! len # #elem
progs: .' elem @ idxs

/ Test programs
input: 1 2 3
output: 6
results: {1@x; output ~ (x input)}' progs

/ Show working programs
1@"Worked:"
progs @ & results

/ TODO
/ progs of size *up to* len
/ allow for several test cases
/ need something iterative beyond len ~6; perm counts are too big to generate eagerly
