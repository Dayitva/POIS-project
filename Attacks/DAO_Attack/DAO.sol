// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7.0 <0.9.0;

import "hardhat/console.sol";

contract SimpleDAO {
    mapping (address => uint) public credit;

    function donate() public payable{
        credit[msg.sender] += msg.value;
    }

    function withdraw(uint amount) public {
        if(credit[msg.sender] >= amount) {
            msg.sender.call{value: amount}("");
            credit[msg.sender] -= amount;
        }
    }
}
