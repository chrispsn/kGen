/ ngn/k specific
exec: {`[,"/home/chris/k/k";x]}

/ Generate program strings
elem: "!@#$%^&*()-_=+[]{};:'\",.<>/\\?|"
len: 2
progs: elem @ + ! len # #elem

/ Test data
/ TODO make the input not a string
tests: +(("1 2 3";6); ("1 2 3 4";10))
input: tests[0]
expect: {($x),"\n"}'tests[1]

/ Run tests
testprog: {
    1 x,"\n" / debug
    expect ~ exec' x {x,y,"\n"}/: input}
results: testprog'progs

/ Show working programs
"Worked:"
progs @ & results

/ TODO
/ progs of size *up to* len
/ need something iterative beyond len ~6; perm counts are too big to generate eagerly
