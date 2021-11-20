let MyLang = require('./calculater.js')

let lang = new MyLang()

let tests = [{
    input: '1 + 2',
    expect: 3
},
{
    input: '1 + 2 + 3',
    expect: 6
},
{
    input: '1 + 2 - 3',
    expect: 0
},
{
    input: '- 1 + 2 - 3',
    expect: -2

},
{
    input: '- 1 - 2 - 3',
    expect: -6

},
{
    input: '1+2',
    expect: 3
},
{
    input: '-1+2-3',
    expect: -2
},
{
    input: '1 + 2 * 3',
    expect: 7
},
{
    input: '1+2*3',
    expect: 7
},
{
    input: '1 + 2 * 3 / 3',
    expect: 3
},
{
    input: '1 + 2 * ( 3 - 4 )',
    expect: -1
},
{
    input: '(1+2)*(3-4)',
    expect: -3
},
{
    input: '(-1*3-(-3-3))',
    expect: 3
}
]

for (let test of tests) {
    let result = lang.exec(test.input)
    console.log(
        result === test.expect ? '[OK]' : '[NG]',
        test.input, '=', result
    )
}