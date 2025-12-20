// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract VendingMachine{
    uint no_of_drink=100;
    uint constant drinkprice=1 ether;

    address public owner;

    constructor(){
        owner=msg.sender;
    }

    modifier onlyOwner(){
        require(msg.sender==owner,"You are not the owner of the contract");
        _;
    }

    function buy() public payable{
        require(msg.value==drinkprice,"Drink costs 1 ETH");
        require(no_of_drink>0,"Drinks are out of Stock Right Now");

        no_of_drink=no_of_drink-1;
    } 

    function getMachineBalance() public view returns(uint){
        return address(this).balance;
    }

    function withdrawMoney() public onlyOwner {
        (bool success,)=owner.call{value:address(this).balance}("");
        require(success,"Withdrawal Failed");
    }

    function restock(uint amount) public onlyOwner {
    no_of_drink += amount;
        }
}
