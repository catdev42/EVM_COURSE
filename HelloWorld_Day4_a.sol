// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract HelloWorld {
    string private text;
    address public owner;

    modifier onlyOwner()
    {
        //is _; is here, we will change the owner first and ten check who the owner is hehe
        require (msg.sender == owner, "Caller is not the owner");
        _; //LEARN MORE ABOUT THIS
    /*
    this seems to be a special way 
    to modity the onlyOwner thing
    */
    }

    constructor() {
        text = "Hello World";
        owner = msg.sender;
    }

    function helloWorld() public view returns (string memory) {
        return text;
    }

    function setText(string calldata newText) public onlyOwner {
        text = newText;
    }

    function transferOwnership(address newOwner) public onlyOwner {
        owner = newOwner;
    }


}