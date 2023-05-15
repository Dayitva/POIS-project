// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.2;

import "./SetProvider.sol";

contract Bob {
    SetProvider public provider;

    constructor (address addr) {
        provider = SetProvider(addr);
    }

    function getSetVersion() public returns (uint) {
        address setAddr = provider.getSet();
        (bool success, bytes memory data) = setAddr.delegatecall(abi.encodeWithSignature("version()"));
        return bytesToUint(data);
    }

    function bytesToUint(bytes memory b) internal pure returns (uint256){
        uint256 number;

        for(uint i=0;i<b.length;i++){
            number = number + uint(uint8(b[i]))*(2**(8*(b.length-(i+1))));
        }

        return number;
    }

    fallback () external payable {}
}