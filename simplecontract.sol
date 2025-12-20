// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract helloWorld {
    string public greeting="Hello World !";
    uint public myNumber=7;

    uint flag=10;

    function myfunction (uint _myNumber) public{
        require(myNumber<_myNumber,"Add a greater number than original one");
        myNumber=_myNumber;
    }

    function Doubler(uint _myNumber) public{
        require(_myNumber==2*myNumber,"You should enter double of original value");
        myNumber=_myNumber;
    }

    function myview() public view returns (uint){
        return flag;
    }

    function mypure() pure public returns(uint){
        return 100;
    }

    function sumn(uint _num) public pure returns(uint){

        uint _total=0;

        for(uint i=0;i<_num;i++){
            _total=_total+i;
        }
        return _total;
    }
}
