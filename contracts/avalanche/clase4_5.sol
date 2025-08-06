// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract FirsArray {
    string[] private storedInfos;

    /// Agrega un nuevo string al array y devuelve el índice
    function addInfo(string memory myInfo) external returns (uint index) {
        storedInfos.push(myInfo);
        index = storedInfos.length - 1;
    }

    /// Actualiza el string en una posicion específica del array
    function updateInfo(uint index, string memory newInfo) external {
        require(index < storedInfos.length, "invalid index");
        storedInfos[index] = newInfo;
    }

    /// Devuelve el string en una posicion específica del array
    function getOneInfo(uint index) external view returns (string memory) {
        require(index < storedInfos.length, "invalid index");
        return storedInfos[index];
    }

    /// Devuelve todos los valores almacenados en el array
    function listAllInfo() external view returns (string[] memory) {
        return storedInfos;
    }
}