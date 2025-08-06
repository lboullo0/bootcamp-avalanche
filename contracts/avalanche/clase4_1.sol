// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract MyContract {
    uint256 public myNumber;
    address public owner;

    // Constructor que se ejecuta al desplegar el contrato
    constructor(uint256 _myNumber) {
        myNumber = _myNumber;
        owner = msg.sender;
    }

}
//  0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
//  0x5B38Da6a701c568545dCfcB03FcB875f56beddC4