// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7.0 <0.9.0

contract ELIT {
    address payable public recepient = payable(0x12AE66CDc592e10B60f9097a7b0D3C59fce29876);

    function transfer() payable public {
        recepient.transfer(msg.value);
    }
}