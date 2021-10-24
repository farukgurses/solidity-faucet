// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Faucet{
    // accept any incoming amount
    receive() external payable {}  
    
    function withdraw(uint withdraw_amount) public {
        // limit withdrawal amount
        require(withdraw_amount <= 100000000000000000);
        // send the amount to the address that requested it
        payable(msg.sender).transfer(withdraw_amount);
    }
}