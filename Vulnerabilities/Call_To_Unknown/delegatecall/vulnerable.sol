pragma solidity ^0.8.0;
import "hardhat/console.sol";

contract VulnerableContract {
    function execute(address _to, uint256 _value) public payable {
        require(_to != address(0), "Invalid address");
        require(_value > 0, "Invalid value");
        (bool success, bytes memory data) = _to.delegatecall(abi.encodeWithSignature("ping(address,uint256)", _to, _value));
        require(success, "Transaction failed");
    }
}