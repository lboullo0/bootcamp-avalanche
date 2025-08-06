// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Owner {
    string private storedInfo;
    address public owner;

    constructor() {
        owner = msg.sender; // Define como owner al que despliega el contrato
    }

    function setInfo(string memory myInfo) external {
        if (msg.sender == owner) {
            storedInfo = myInfo;
        }
        require(msg.sender == owner, "Only owner");
        storedInfo = myInfo;
    }

    function getInfo() external view returns (string memory) {
        return storedInfo;
    }
}