// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.4.2;

contract Rubixi {
    address public owner;

    function DynamicPyramid() {
        owner = msg.sender;
    }

    function Rubixi() {
        owner = msg.sender;
    }
}