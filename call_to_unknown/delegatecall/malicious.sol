pragma solidity ^0.8.0;
import "hardhat/console.sol";

contract MaliciousContract {
    function ping(address payable _to, uint256 _value) public payable {
      console.log("In the attacker's ping function!");
      uint Balance = address(this).balance;
      console.log("Caller contract's balance = %d", Balance);
      _to.transfer(_value);
    }

    fallback () external payable {
      console.log("In the attacker's fallback function!");
      }
}