pragma solidity >=0.7.0 <0.9.0;

import "hardhat/console.sol";

contract EtherStore {
    uint256 public withdrawalLimit = 1 ether;
    mapping(address => uint256) public lastWithdrawTime;
    mapping(address => uint256) public balances;
    
    function depositFunds() public payable {
        balances[msg.sender] += msg.value;
        console.log("Printing balance");
        console.log(balances[msg.sender]);

    }
    
    function withdrawFunds (uint256 _weiToWithdraw) public {
        require(balances[msg.sender] >= _weiToWithdraw, "Insufficient balance.");
        // limit the withdrawal
        require(_weiToWithdraw <= withdrawalLimit, "Exceeded withdrawal limit.");
        // limit the time allowed to withdraw
        // require(block.timestamp >= lastWithdrawTime[msg.sender] + 1 weeks, "1 week has not passed since previous withdrawal.");
        (bool success, bytes memory data) = msg.sender.call{value: _weiToWithdraw}("");
        require(success == true, "Withdrawal failed.");
        
        balances[msg.sender] -= _weiToWithdraw;
        lastWithdrawTime[msg.sender] = block.timestamp;
    }
 }
