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

contract FixedContract {
    function pong(Alice c) public {
        // Call the contract and check the return value
        (bool success, bytes memory result) = address(c).call(abi.encodeWithSignature("ping()"));

        // Check if the call was successful and the result is not empty
        require(success, "Function call failed");

        // Check the function signature in the result
        bytes4 signature;
        assembly {
            signature := mload(add(result, 32))
        }

        require(signature == bytes4(keccak256("ping()")), "Wrong function signature");
    }
}