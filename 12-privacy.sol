//SPDX-License-Identifier: MIT
pragma solidity^0.8;

interface IPrivacy {
    function locked() external view returns(bool);
    function unlock(bytes16 _key) external;
}

contract Privacy{
    bool public locked = true;
    uint256 public ID = block.timestamp;
    uint8 private flattening = 10;
    uint8 private denomination = 225;
    uint16 private akwardness = uint16(block.timestamp);
    bytes32[3] private data;

    constructor(bytes32[3] memory _data){
        data = _data;
    }

    function unlock(bytes16 _key) public {
        require(_key == bytes16(data[2]));
        locked = false;
    }
}