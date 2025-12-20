// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract TipJar {

    address public owner;

    constructor() {
        owner = msg.sender;
    }

    // Anyone can send ETH as a tip
    function tip() external payable {
        require(msg.value > 0, "Tip must be greater than 0");
    }

    // Allows direct ETH transfer (no function call)
    receive() external payable {
        // Accept ETH sent directly
    }

    // Returns the contract balance in wei
    function getBalance() external view returns (uint) {
        return address(this).balance;
    }
}
