pragma solidity ^0.8.0;
import "hardhat/console.sol";

contract Alice { 
    function ping() public returns (uint) {
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

interface IAlice {
    function ping() external returns (uint);
}


contract FixedContract {
    function pong(address c) public {
        // Call the contract and check the return value
        uint result = IAlice(c).ping();

        // Check the return value
        require(result == 1, "Alice's ping() should return 1");
    }
}