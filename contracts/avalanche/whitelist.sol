// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

/// @title Concepts: mapping and access control: whiteList
contract Whitelist {
    string private storedInfo;
    address public owner;
    mapping(address => bool) public whiteList;

    constructor() {
        owner = msg.sender;
        whiteList[msg.sender] = true;
        storedInfo = "Hello world";
    }

    modifier onlyOwner {
        require(msg.sender == owner, "Only owner");
        _;
    }

    modifier onlyWhitelist {
        require(whiteList[msg.sender], "Only whitelist");
        _;
    }

    function setInfo(string memory myInfo) external onlyWhitelist {
        storedInfo = myInfo;
    }

    function addMember(address member) external onlyOwner {
        whiteList[member] = true;
    }

    function delMember(address member) external onlyOwner {
        whiteList[member] = false;
    }

    function getInfo() external view returns (string memory) {
        return storedInfo;
    }
}