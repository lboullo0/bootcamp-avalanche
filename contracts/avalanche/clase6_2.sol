// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract ReceiveEther {
    receive() external payable {}
    fallback() external payable {}

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}

contract SendAvax {
    function sendViaTransfer(address payable _to) public payable {
        _to.transfer(msg.value); //  Ya no se recomienda
    }

    function sendViaSend(address payable _to) public payable {
        bool sent = _to.send(msg.value);
        require(sent, "Failed to send Avax"); // Requiere validacion
    }

    function sendViaCall(address payable _to) public payable {
        (bool sent, ) = _to.call{value: msg.value}("");
        require(sent, "Failed to send Avax"); // Metodo actual recomendado
    }
}