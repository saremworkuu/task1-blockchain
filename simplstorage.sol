// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleStorage {

    // State variable to store a number
    uint256 private storedNumber;

    // Function to store a number
    function store(uint256 _number) public {
        storedNumber = _number;
    }

    // Function to retrieve the stored number
    function retrieve() public view returns (uint256) {
        return storedNumber;
    }

    // Bonus: Function to increment the stored number by 1
    function increment() public {
        storedNumber += 1;
    }
}
