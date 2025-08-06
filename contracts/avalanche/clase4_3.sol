// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract MyContract {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    // Modificador que restringe el acceso solo al owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Solo el propietario puede ejecutar esta funcion.");
        _;      //  indica donde va el codigo de la función que se está modificando
    }

    // Funcion restringida
    function myRestrictedFunction() public onlyOwner {
        // Logica aquí
    }
}