pragma solidity ^0.4.7;

import "./PledgeAgreement.sol";

contract CreatePledgeAgreement {

    address private owner;

    // Modifiers
    modifier onlyIfOwner() {
        if (msg.sender != owner) {
            throw;
        }
        _;
    }

    // Constructor
    function CreatePledgeAgreement () {
        owner = msg.sender;
    }

    // Functions
    function createPledgeAgreement (string _depositAccount, string _creditAccount) onlyIfOwner {
        PledgeAgreement newAgreement = new PledgeAgreement(_depositAccount, _creditAccount);
    }
}
