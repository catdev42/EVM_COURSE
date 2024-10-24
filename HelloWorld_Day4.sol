// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

interface IHelloWorld {
    function helloWorld() external view returns (string memory);

    function setText(string calldata newText) external;

    function initialText() external pure returns (string memory);

    function potato() external;

    function rainbow() external;
}

contract HelloWorld {
    string private text;

    constructor() {
        text = initialText();
    }

    function helloWorld() external view returns (string memory) {
        return text;
    }

    function setText(string calldata newText) public {
        text = newText;
    }

    function initialText() public pure virtual returns (string memory) {
        return "Hello World";
    }

    fallback() external {
        text = "Oops, wrong function name called";
    }

    receive() external payable {
        text = "I'm Rich!";
    }
}

contract Greeter {
    function invokeGreeting(
        address target
    ) external view returns (string memory) {
        return IHelloWorld(target).helloWorld();
    }

    function setGreeter(address target, string calldata newText) public {
        IHelloWorld(target).setText(newText);
    }
}

// contract HelloWorld {
//     string private text;
//     address public owner;

//     modifier onlyOwner()
//     {
//         require (msg.sender == owner, "Caller is not the owner");
//         _;
//     }

//     constructor() {
//         text = "Hello World";
//         owner = msg.sender;
//     }

//     function helloWorld() public view returns (string memory) {
//         return text;
//     }

//     //
//     function setText(string calldata newText) public onlyOwner {
//         // if (block.number % 2 == 0){
//         //     newText = "Even";
//         // }
//         ///not possible with calldata - it needs to be a mutex in memory
//         // call data does not use memory
//         text = newText;
//     }

//     function transferOwnership(address newOwner) public onlyOwner {
//         owner = newOwner;
//     }

// }
