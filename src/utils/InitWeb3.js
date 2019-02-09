let Web3 = require('web3')//1.0版本

console.log(window.web3.version)//0.20版本
let web3 = new Web3(window.web3.currentProvider)
console.log(web3.version)
module.exports = web3