// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract AvaxReceiver {
    event Received(address sender, uint amount);

    // Recibe Avax sin datos
    receive() external payable {
        emit Received(msg.sender, msg.value);
    }

    // Llamadas sin coincidencia de funcion
    fallback() external payable {
        emit Received(msg.sender, msg.value);
    }

    // Funcion directa para deposito con logica
    function deposit() external payable {
        emit Received(msg.sender, msg.value);
    }

    function getBalance() external view returns (uint) {
        return address(this).balance;
    }
}