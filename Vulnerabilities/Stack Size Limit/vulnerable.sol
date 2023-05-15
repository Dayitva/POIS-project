pragma solidity ^0.8.0;
import "hardhat/console.sol";

interface Token {
    function balance(address account)  external view returns (uint256);
    function make_transfer(address recipient, uint256 amount) external returns (bool);
}

contract StackSizeLimit {
    Token private _token;

    constructor(address tokenAddress) payable  {
        _token = Token(tokenAddress);
    }

    function transferTokens(address recipient, uint256 amount) public {
        // Get the sender's balance
        uint256 balance = _token.balance(msg.sender);

        // Check if the sender has enough tokens to transfer
        require(balance >= amount, "Not enough tokens");

        // Transfer the tokens
        for(uint i = 0; i < amount; i++)
        {
            bool success = _token.make_transfer(recipient, 1);
            require(success, "Token transfer failed");
        }
    }

    event Transfer(address indexed from, address indexed to, uint256 value);
}