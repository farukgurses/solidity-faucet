// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;


contract Owned {
    address payable owner;

    constructor() public {
        owner = payable(msg.sender);
    }

    modifier onlyOwner{
        require(msg.sender == owner);
        _;
    }
}

contract Mortal is Owned {
    function destroy() public onlyOwner {
        selfdestruct(owner);
    }
}

contract Faucet is Mortal{
    // accept any incoming amount
    receive() external payable {}  
    
    function withdraw(uint withdraw_amount) public {
        // limit withdrawal amount
        require(withdraw_amount <= 0.1 ether);
        // send the amount to the address that requested it
        payable(msg.sender).transfer(withdraw_amount);
    }
}