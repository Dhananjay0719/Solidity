// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./interfaces.sol";

contract SodaPrice is ISodaPrice {
    uint private price;
    address public owner;
    constructor(uint _initialprice){
        owner=msg.sender;
        price=_initialprice;
    }

    function getPrice() external view returns(uint){
        return price;
    }

    function setPrice(uint _price) public {
        require(owner==msg.sender,"Only Owner Can Set Price");
        price=_price;
    }
}
