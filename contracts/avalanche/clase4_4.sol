// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Evento {
    // Definicion del evento
    event MyEvent(address indexed sender, uint256 value);

    function triggerEvent() public {
        // Emite el evento
        emit MyEvent(msg.sender, 100);
    }
}