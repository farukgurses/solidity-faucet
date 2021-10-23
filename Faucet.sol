pragma solidity 0.6.4;

contract Faucet{
    // accept any incoming amount
    receive() external payable {}  
    
    function withdraw(uint withdraw_amount) public {
        // limit withdrawal amount
        require(withdraw_amount <= 100000000000000000);
        // send the amount to the address that requested it
        msg.sender.transfer(withdraw_amount);
    }
}