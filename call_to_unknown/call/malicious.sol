pragma solidity ^0.8.0;
import "hardhat/console.sol";

contract MaliciousContract {
    fallback () external payable {
      console.log("In the attacker's fallback function!");
      }
}