let Web3 = require('web3')
let web3 = new Web3(window.web3.currentProvider)
window.addEventListener('load', function () {
    if (typeof Web3 !== undefined) {
        web3 = new Web3(window.web3.currentProvider)
    } else {
        alert('未安装MetaMask，请先安装MetaMask')
    }
})
module.exports = web3