// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

interface IHelloWorld {


    function helloWorld() external view returns (string memory) ;

    function setText(string calldata newText) external ;

    function transferOwnership(address newOwner) public onlyOwner ;

    function potato;
}

contract HelloWorld {
    string private text;
    address public owner;

    modifier onlyOwner()
    {
        require (msg.sender == owner, "Caller is not the owner");
        _;
    }

    constructor() {
        text = "Hello World";
        owner = msg.sender;
    }

    function helloWorld() public view returns (string memory) {
        return text;
    }

    //
    function setText(string calldata newText) public onlyOwner {
        // if (block.number % 2 == 0){ 
        //     newText = "Even";
        // }
        ///not possible with calldata - it needs to be a mutex in memory
        // call data does not use memory
        text = newText;
    }

    function transferOwnership(address newOwner) public onlyOwner {
        owner = newOwner;
    }


}