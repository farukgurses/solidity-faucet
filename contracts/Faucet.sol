// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;


contract Owned {
    address payable owner;

    constructor() public {
        owner = payable(msg.sender);
    }

    modifier onlyOwner{
        require(msg.sender == owner, "Only the contract owner can call this function");
        _;
    }
}

contract Mortal is Owned {
    function destroy() public onlyOwner {
        selfdestruct(owner);
    }
}

contract Faucet is Mortal{
    event Withdrawal(address indexed to, uint amount);
    event Deposit(address indexed from, uint amount);
    // accept any incoming amount
    receive() external payable {
        emit Deposit(msg.sender, msg.value);
    }  
    
    function withdraw(uint withdraw_amount) public {
        // limit withdrawal amount
        require(withdraw_amount <= 0.1 ether);
        require(
            address(this).balance >= withdraw_amount,
            "Insufficient balance in faucet for withdrawal request"
        );
        // send the amount to the address that requested it
        payable(msg.sender).transfer(withdraw_amount);

        emit Withdrawal(msg.sender, withdraw_amount);
    }
}