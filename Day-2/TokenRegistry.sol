// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TokenRegistry {
	struct Token {
		string name;
		string symbol;
		address owner;
		bool isActive;
	}

	mapping(uint256 => Token) public tokens;
	uint256[] public tokenIds;
	uint256 private _nextTokenId = 1;

	event TokenRegistered(uint256 indexed id, string name, string symbol, address indexed owner);

	function registerToken(string calldata name, string calldata symbol) external {
		require(bytes(name).length > 0, "Name required");
		require(bytes(symbol).length > 0, "Symbol required");

		uint256 id = _nextTokenId;
		_nextTokenId += 1;

		tokens[id] = Token({
			name: name,
			symbol: symbol,
			owner: msg.sender,
			isActive: true
		});

		tokenIds.push(id);

		emit TokenRegistered(id, name, symbol, msg.sender);
	}

	function deactivateToken(uint256 id) external {
		Token storage token = tokens[id];
		require(token.owner != address(0), "Token does not exist");
		require(msg.sender == token.owner, "Not token owner");
		require(token.isActive, "Already inactive");

		token.isActive = false;
	}

	function getToken(uint256 id) external view returns (string memory, string memory, address, bool) {
		Token storage token = tokens[id];
		require(token.owner != address(0), "Token does not exist");
		return (token.name, token.symbol, token.owner, token.isActive);
	}

	function getAllTokenIds() external view returns (uint256[] memory) {
		return tokenIds;
	}
}

