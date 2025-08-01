// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

/**
*   Acceso a variables globales
*/

contract Global_info {
    function getTimeStamp() external view returns (uint256) {
        return block.timestamp;
    }
    function getBlockNumber() external view returns (uint256) {
        return block.number;
    }
    function getChainId() external view returns (uint256) {
        return block.chainid;
    }
    function getAmount() external payable returns (uint256) {
        return msg.value;
    }
    function getCaller() external view returns (address) {
        return msg.sender;
    }

    //  en este caso la dirección de nuestra wallet
    function getTrxOrigin() external view returns (address) {
        return tx.origin;
    }

    
}