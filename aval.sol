contract Owned() {
	address public owner;

	function Owned() {
		this.owner = msg.sender;
	}

	modifier onlyOwner {
		if (msg.sender != owner) {
			throw;
		}

		_
	}
}

contract Mortal is Owned () {
	function close() onlyOwner {
        selfdestruct(owner);
    }

    function kill() onlyOwner {
		close();
	}
}

contract Bank() is Mortal {

}

contract Client() is Mortal {

}

contract EBRR() is Mortal {
	
}
