// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Task 1: Inheritance
contract Animal {
    function speak() public pure virtual returns (string memory) {
        return "";
    }
}

contract Dog is Animal {
    function speak() public pure override returns (string memory) {
        return "Bark";
    }
}

contract Cat is Animal {
    function speak() public pure override returns (string memory) {
        return "Meow";
    }
}

// Task 2: Library
library MathLib {
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return a - b;
    }

    function multiply(uint256 a, uint256 b) internal pure returns (uint256) {
        return a * b;
    }
}

contract Calculator {
    using MathLib for uint256;

    function sub(uint256 a, uint256 b) external pure returns (uint256) {
        return a.sub(b);
    }

    function multiply(uint256 a, uint256 b) external pure returns (uint256) {
        return a.multiply(b);
    }
}
