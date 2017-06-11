

function testWeb3() {
    if (typeof web3.eth == 'undefined') {
        alert('web3 is not ready');
        return false;
    }
    if (typeof web3.eth.accounts === 'undefined') {
        alert('eth accounts is not ready');
        return false;
    }
    if (typeof web3.eth.accounts[0] === 'undefined') {
        console.log('eth accounts[0] is not ready');
        console.log(web3.eth.accounts);
        return false;
    }
    console.log(url);
    console.log(web3.eth.accounts);
    return false;
    var AntifakeContract = web3.eth.contract(AntifakeContractJson.abi).at(accountAddress);

    var defaultAccount = web3.eth.accounts[0];
    var defaultCity = 'sdgfsgfgfs';

    alert('eth default found ' + defaultAccount);


    AntifakeContract.registerNewToken.estimateGas(
        defaultAccount,
        defaultCity,
        {from: defaultAccount},
        function (err, result) {
            if (err) {
                throw err;
            } else {
                var myGasNum = result;

                AntifakeContract.registerNewToken.sendTransaction(
                    defaultAccount,
                    defaultCity,
                    {from:defaultAccount, gas: myGasNum},
                    function(err, result){
                        if(err) {
                            throw err;
                        } else {
                            alert("GuestBook signed! TXID : " + result);
                        }
                    });
            }
        });

    return false;
}