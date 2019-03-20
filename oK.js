// Requires https://github.com/JohnEarnest/ok.
const ok = require("./ok/ok.js")

function test(input, output) {
    try {
        var got = ok.format(ok.run(ok.parse(input), ok.baseEnv()));
        // XXX allow programs that get *some* right or *approx* right, per STOKE?
        return output === got;
    } catch(err) {
        return false
    };
}

const ops = [
    ..."+-*%!&|<>=~,^#_$?@.'/:\\",
    // ..."1234567890",
    ..."{}xyz",
    // " sin . cos . exp . log . prm . in ".split('.')
];

function* permuter(string, len) {
    yield string; // all strings with len <= n
    // if (len === 0) yield string; // all strings with len = n
    if (0 !== len) {
        for (let op of ops) {
            yield* permuter(string + op, len-1);
        }
    }
}

function* test_results(prog, tests) {
    for (let t of tests) {
        yield test(prog + t.input, t.output);
    }
};

function* generate_correct_progs(tests, max_length) {
    for (let s of permuter("", max_length)) prog: {
        for (let result of test_results(s, tests)) {
            if (!result) break prog;
        }
        yield s;
    };
}

// Examples 

const examples = [
    {
        maxlen: 2,
        tests: [
            {input: "[1; 1]", output: "2"},
            {input: "[1; 2]", output: "3"},
            {input: "[2; 3]", output: "5"},
            {input: "[2.4; 3.1]", output: "5.5"},
        ]
    },
    // {
    //     maxlen: 3,
    //     tests: [
    //         {input: "[10; 4]", output: "7"},
    //         {input: "[2; 4]", output: "3"},
    //         {input: "[1; 1]", output: "1"},
    //     ]
    // },
    // {
    //     maxlen: 0,
    //     tests: [
    //         {input: '["aba"]', output: "1"},
    //         {input: '["ab"]', output: "0"},
    //     ]
    // },
];

for (let [i, e] of Object.entries(examples)) {
    console.log("Program: " + (1+i));
    for (let prog of generate_correct_progs(e.tests, e.maxlen)) {
        console.log("  " + prog);
    }
}

/* Sample output for first test:

+
++
+:
*+
|+
:+
x+
y+
z+

*/
