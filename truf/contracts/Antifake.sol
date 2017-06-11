pragma solidity ^0.4.4;

contract Antifake {

	address manAddress;

	struct Token {
		string handle;
		bytes32 city;
	}

	mapping (address => Token) Tokens;
	address[] tokensByAddress;

	function () payable {
		manAddress = msg.sender;
	}

	modifier onlyAdmin() {
		if (msg.sender != manAddress)
		throw;
		// Do not forget the "_;"! It will be replaced by the actual function body when the modifier is used.
		_;
	}

	function registerNewToken(string handle, bytes32 city) onlyAdmin returns (bool success) {
		address thisNewAddress = msg.sender;
		if (bytes(Tokens[msg.sender].handle).length == 0 && bytes(handle).length != 0) {
			Tokens[thisNewAddress].handle = handle;
			Tokens[thisNewAddress].city = city;
			tokensByAddress.push(thisNewAddress);
			return true;
		} else {
			return false;
		}
	}
}