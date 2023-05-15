// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.2;

contract SetProvider {
    address setAddr;
    address owner;

    modifier onlyOwner() {
        require(owner == msg.sender);
        _;
    }

    constructor () {
        owner = msg.sender;
    }

    function setLibrary(address arg) onlyOwner public {
        setAddr = arg;
    }

    function getSet() public view returns (address) {
        return setAddr;
    }
}