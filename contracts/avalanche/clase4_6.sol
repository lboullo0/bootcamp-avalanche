// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

/**
*   Ejemplo de mapping
*/
contract TestMapping {
    // Mapping: clave = address, valor = uint (balance)
    mapping(address => uint) public balances;

    // Actualiza el balance del remitente
    function updateBalance(uint newBalance) public {
        balances[msg.sender] = newBalance;
    }

    // Consulta el balance de una direccion
    function getBalance(address user) public view returns (uint) {
        return balances[user];
    }
}