// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract myContract{

     address public owner;
        constructor(){
            owner=msg.sender;
        }
        modifier myOnwer(){
            require(msg.sender==owner);
            _;
        }

        function hello() public pure returns (string memory) {
            return "Hello World";
        }

        function modify() public myOnwer{
            //only owner can access this
        }
}
