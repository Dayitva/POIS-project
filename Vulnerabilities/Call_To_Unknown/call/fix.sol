pragma solidity ^0.8.0;

contract FixedContract {
    function execute(address _to, uint256 _value) public {
        require(_to != address(0), "Invalid address");
        require(_value > 0, "Invalid value");
        (bool success, bytes memory data) = payable(_to).call{value: 0}(abi.encodeWithSignature("transfer(address,uint256)", _to, _value));
        require(success, "Transaction failed");
    }
}