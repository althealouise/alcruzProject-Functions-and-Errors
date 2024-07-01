// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleContract {
    address public owner;
    uint256 public balance;

    constructor() {
        owner = msg.sender;
        balance = 2400;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the contract owner");
        _;
    }

    function deposit(uint256 amount) public payable {
        require(msg.value == amount, "Deposit amount does not match the value sent");
        balance += amount;
    }

    function withdraw(uint256 amount) public onlyOwner {
        require(amount <= balance, "Insufficient balance");
        balance -= amount;
        payable(owner).transfer(amount);
    }

    function checkInvariant() public view {
        assert(balance >= 0);
    }

    function emergencyWithdraw() public view onlyOwner {
        revert("You are not allowed to make an emergency withdrawal");
    }

    function getBalance() public view returns (uint256) {
        return balance;
    }
}
