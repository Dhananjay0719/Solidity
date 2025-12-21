// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./interfaces.sol";

contract SodaMachine {
    
    ISodaPrice public priceContract;
    address public owner;
    uint public sodaLeft=100;

    constructor(address _priceContract) {
    owner=msg.sender;
    priceContract = ISodaPrice(_priceContract);
    }

    function buySoda() public payable{
        uint price = priceContract.getPrice();
        require(msg.value==price,"Price mismatch");
        require(sodaLeft>0,"Soda is out of Stock");
        sodaLeft--;
    }
    
    function withdraw() public {
        require(msg.sender == owner, "Not owner");

        uint balance = address(this).balance;
        (bool success, ) = owner.call{value: balance}("");
        require(success, "Withdraw failed");
    }
}

