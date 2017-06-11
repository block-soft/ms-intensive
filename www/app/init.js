if (false) {
    var url = "http://46.101.224.77:8545";
    var ownerAddress = '0x115cdec6f35899d153f4f128877ed3ba41f13d27';
} else {
    var url = "http://aaammyvag.westeurope.cloudapp.azure.com:8545";
    var ownerAddress = '0x2A511ffd046759b34b89A41381b782676367Ad39';
}
var web3 = new Web3(new Web3.providers.HttpProvider(url));

window.addEventListener("load", function (){


    /*
    var AntifakeContractJson = {};
    $.getJSON('./app/contracts/Antifake.json', function (json) {
        AntifakeContractJson = json;
        testWeb3();
    });
    */

    var CreateAgreementsContractJson = {};
    $.getJSON('./app/contracts/CreateAgreements.json', function (json) {
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
                    console.log(myGasNum);

                    CreateAgreementsContract.createPledgeAgreement.sendTransaction(
                        depositAccount,
                        creditAccount,
                        {from: ownerAddress, gas: myGasNum},
                        function (err, result) {
                            if (err) {
                                console.log('call');
                                console.log(url);
                                console.log(ownerAddress);
                                throw err;
                            } else {
                                alert("transaction done!!!!!!!! TXID : " + result);
                            }
                        });
                }
            });
    });
});