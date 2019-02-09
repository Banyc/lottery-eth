let solc = require('solc')
let fs = require('fs')

let sourceCode = fs.readFileSync('./contracts/Lottery.sol', 'utf-8')
let output = solc.compile(sourceCode, 1)
// console.log('output: ', output)
module.exports = output['contracts'][':Lottery']