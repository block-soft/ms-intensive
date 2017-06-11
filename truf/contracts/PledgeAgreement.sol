pragma solidity ^0.4.7;

contract PledgeAgreement {

    // Variables
    string depositAccount; // Source
    string creditAccount;// Destination

    // Events
    event CheckOutputEvent (
        string message,
        string depositAccount,
        string creditAccount,
        address contractAddress
    );

    event Debt (
        string message,
        string depositAccount,
        string creditAccount,
        uint amount,
        address contractAddress
    );

    // Constructor
    function PledgeAgreement (string _depositAccount, string _creditAccount) {
        depositAccount = _depositAccount;
        creditAccount = _creditAccount;
        checkInput(depositAccount, creditAccount);
    }

    // Functions
    function checkInput (string depositAccount, string creditAccount) private {
        bytes memory depositAccountBytes = bytes(depositAccount);
        bytes memory creditAccountBytes = bytes(creditAccount);
        if (depositAccountBytes.length == 0 || creditAccountBytes.length == 0) {
            throw;
        }
        CheckOutputEvent (
            "Pledege Agreement created!",
            depositAccount,
            creditAccount,
            this
        );
    }

    function openDebt (uint amountDebt) {
        if (amountDebt <= 0) {
            throw;
        }

        Debt (
            "Payment not arrived - debt created!",
            depositAccount,
            creditAccount,
            amountDebt,
            this
        );
    }

    function getInformation () returns (string deposit, string credit) {
        deposit = depositAccount;
        credit = creditAccount;
    }
}