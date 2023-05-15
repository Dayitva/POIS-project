pragma solidity ^0.4.21;

contract GuessTheNewNumberChallenge {
    constructor() payable {
        require(msg.value == 1 ether);
    }

    function isComplete() public view returns (bool) {
        return address(this).balance == 0;
    }

    function guess(uint8 n) public payable {
        require(msg.value == 1 ether);
        uint8 answer = uint8(keccak256(blockhash(block.number - 1), block.timestamp));

        if (n == answer) {
            msg.sender.transfer(2 ether);
        }
    }
}