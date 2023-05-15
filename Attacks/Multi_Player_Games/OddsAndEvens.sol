// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.0 <0.9.0;

import "hardhat/console.sol";

contract OddAndEvens {
    struct Player {
        address payable addr;
        uint number;
    }

    Player[2] private players;

    uint tot = 0;
    address owner;

    constructor () {
        owner = msg.sender;
    }

    function play(uint256 number) public payable {
        if(msg.value != 1 ether) {
            revert();
        }

        players[tot] = Player(payable(msg.sender), number);
        tot++;

        if (tot == 2) {
            andTheWinnerIs();
        }
    }

    function andTheWinnerIs() private {
        uint n = players[0].number + players[1].number;
        require(players[n%2].addr.send(1.8 ether));

        delete players;
        tot = 0;
    }

    function getProfit() public {
        require(payable(owner).send(address(this).balance));
    }
}
