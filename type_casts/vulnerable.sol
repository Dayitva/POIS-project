pragma solidity ^0.8.0;
import "hardhat/console.sol";

contract Alice { 
    function ping(uint) public returns (uint) {
        console.log("Inside Alice's ping()!");
    }
}

contract Bob {
    function ping(uint) public returns (uint) {
        console.log("Inside Bob's ping()!");
    }
}

contract Mallory {
    fallback() external payable {
        console.log("Inside Mallory's fallback!");
    }
}

contract VulnerableContract { 
    function pong(Alice c) public { 
        (bool success, ) = address(c).call(abi.encodeWithSignature("ping()"));
    } 
}