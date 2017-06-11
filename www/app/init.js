
var ownerAddress = '0xef60340ca6cd3f383180b7e6c165a80e8da215a9';

var web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:8545"));

/*
 var AntifakeContractJson = {};

 $.getJSON('./app/contracts/Antifake.json', function(json) {
 AntifakeContractJson = json;
 testWeb3();
 });
*/

var CreateAgreementsContractJson = {};

$.getJSON('./app/contracts/CreateAgreements.json', function(json) {
    CreateAgreementsContractJson = json;

    var CreateAgreementsContract = web3.eth.contract(CreateAgreementsContractJson.abi).at(ownerAddress);
    var depositAccount = 'dfgsgsfg';
    var creditAccount = 'adfgsfgsg';
    CreateAgreementsContract.createPledgeAgreement.estimateGas(
        depositAccount,
        creditAccount,
        {from: ownerAddress},
        function (err, result) {
            if (err) {
                throw err;
            } else {
                var myGasNum = result;

                CreateAgreementsContract.createPledgeAgreement.sendTransaction(
                    depositAccount,
                    creditAccount,
                    {from: ownerAddress, gas: myGasNum},
                    function(err, result){
                        if(err) {
                            throw err;
                        } else {
                            alert("GuestBook signed! TXID : " + result);
                        }
                    });
            }
        });
});