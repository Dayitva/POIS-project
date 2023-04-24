pragma solidity ^0.8.0;
import "hardhat/console.sol";

contract D1 {
    uint public count = 0;
    fallback() external payable { count++; }
}

contract D2 { 
    fallback() external payable {}
}

contract C {
    function pay(address payable d, uint n) public payable {
        d.call{value: n, gas: 1000}("");
    }
}
