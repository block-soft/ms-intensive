pragma solidity ^0.4.7;

import "./PledgeAgreement.sol";

contract CreateAgreements {
    // Variables
    address private owner;
    mapping (address => bool) administrators; // true = administrative role

    // Modifiers
    modifier onlyIfOwner() {
        if (msg.sender != owner) {
            throw;
        }
        _;
    }

    modifier onlyIfAdministrator(address _addressOfAdmin) {
        if (!administrators[_addressOfAdmin] || administrators[_addressOfAdmin] == false) {
            throw;
        }
        _;
    }

    // Events
    event AdministratorsInformation (
        string message,
        address addressOfAdmin
    );

    event AgreementCreated (
        string message,
        address addressOfAgreement
    );

    // Constructor
    function CreateAgreements () {
        owner = msg.sender;
        // Add owner as admin
        setAdministrators(owner);
    }

    // Functions
    function setAdministrators (address addressOfAdmin) onlyIfOwner {
        administrators[addressOfAdmin] = true;
        AdministratorsInformation (
            "Administrator added!",
            addressOfAdmin
        );
    }

    function checkAdministrators (address addressOfAdmin) returns (bool) {
        return administrators[addressOfAdmin];
    }

    function removeAdministratorRole (address addressOfAdmin) onlyIfOwner {
        administrators[addressOfAdmin] = false;
        AdministratorsInformation (
            "Administrator role removed!",
            addressOfAdmin
        );
    }

    function createPledgeAgreement (string depositAccount, string creditAccount) onlyIfAdministrator(msg.sender) {
        PledgeAgreement newAgreement = new PledgeAgreement(depositAccount, creditAccount);
        AgreementCreated (
            "Pledge agreement created!",
            newAgreement
        );
    }
}
