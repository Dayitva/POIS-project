// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7.0 <0.9.0;

import "hardhat/console.sol";

// Solution: Checksum
// https://github.com/ethereum/EIPs/blob/master/EIPS/eip-55.md
// https://ethereum.stackexchange.com/questions/2045/is-ethereum-wallet-address-case-sensitive

// Changes in new solidity versions
// 1. contract name as function -> constructor
// 2. no name in function -> fallback
// 3. throw -> revert

contract ELIT {
    // address payable public recepient = payable(0x12ae66cdc592e10b60f9097a7b0d3c59fce29876);
    address payable public recepient = payable(0x12AE66CDc592e10B60f9097a7b0D3C59fce29876);

    function transfer() payable public {
        recepient.transfer(msg.value);
    }
}