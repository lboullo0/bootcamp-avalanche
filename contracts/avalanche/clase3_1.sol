// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract ExampleContract {
    uint private counter;

    // Modifica el estado del contrato
    function incrementCounter() public {
        counter++;
    }

    // Solo lectura del estado
    function getCounter() public view returns (uint) {
        return counter;
    }

    // Recibe Ether
    function deposit() public payable {}
}