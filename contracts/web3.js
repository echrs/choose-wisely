import Web3 from 'web3';

var web3 = new Web3('ws://localhost:8545')

let currentWeb3;

if (window.ethereum) {
    let instance = new Web3(window.ethereum);
    try {
        window.ethereum.enable();
        currentWeb3 = instance;
    } catch (error) {
        alert('Please allow access for the app to work');
    }
} else if (window.web3) {
    currentWeb3 = new Web3(web3.currentProvider);
}
else {
    console.log('Non-Ethereum browser detected. You should consider trying MetaMask!');
}

export default currentWeb3;