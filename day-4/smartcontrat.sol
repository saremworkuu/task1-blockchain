// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Bank {
    mapping(address => uint256) private balances;

    // Deposit ETH into the bank
    function deposit() external payable {
        require(msg.value > 0, "Must send ETH");
        balances[msg.sender] += msg.value;
    }

    // Withdraw previously deposited ETH
    function withdraw(uint256 amount) external {
        require(amount > 0, "Amount must be > 0");

        uint256 userBalance = balances[msg.sender];
        require(userBalance >= amount, "Insufficient balance");

        // Effects
        balances[msg.sender] = userBalance - amount;

        // Interaction (fixed: using call instead of transfer)
        (bool success, ) = payable(msg.sender).call{value: amount}("");
        require(success, "Transfer failed");
    }

    // View the stored balance of any address
    function getBalance(address user) external view returns (uint256) {
        return balances[user];
    }
}