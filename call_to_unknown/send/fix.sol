pragma solidity ^0.8.0;
import "hardhat/console.sol";

contract FixedContract {
    function execute(address payable _to, uint256 _value) public payable {
        uint Balance = address(this).balance;
        require(Balance > 0 wei, "Error! No Balance to withdraw");
        console.log(Balance);
        
        require(_to != address(0), "Invalid address");
        require(_value > 0, "Invalid value");
        _to.transfer(_value);
    }
}