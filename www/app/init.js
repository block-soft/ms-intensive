
var accountAddress = '0x87b3f6def4d451c41be733b8924da66dea0caed4';

var web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:8545"));

var AntifakeContractJson = {};

$.getJSON('./app/contracts/Antifake.json', function(json) {
    AntifakeContractJson = json;
    testWeb3();
});