// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.0 <0.9.0;

import "hardhat/console.sol";

contract KotET {
    address public king;
    uint public claimPrice = 100;
    address owner;
    
    constructor () {
        owner = msg.sender;
        king = msg.sender;
    }

    fallback () external payable {
        if(msg.value < claimPrice) {
            revert();
        }

        uint compensation = (90 * msg.value)/100;
        payable(king).send(compensation);
        // payable(king).call{value: compensation}("");
        
        king = msg.sender;
        claimPrice = msg.value;
    }

    function sweepCommission() public {
        require(payable(owner).send(address(this).balance));
    }
}
