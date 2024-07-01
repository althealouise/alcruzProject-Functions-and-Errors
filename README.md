# alcruzProject-Functions-and-Errors
SimpleContract is a Solidity smart contract that allows the contract owner to deposit and withdraw funds, and includes functionality to ensure certain conditions are always met. This contract is designed for educational purposes to demonstrate the usage of require, assert, and revert statements in Solidity.

## Features
- Owner-only functions: Certain functions can only be called by the contract owner.
- Deposit: Anyone can deposit ether into the contract.
- Withdraw: Only the owner can withdraw ether from the contract.
- Invariant Check: A function to check that the contract balance is always non-negative.
- Emergency Withdraw: An intentionally failing function to demonstrate the revert statement.

## Preconditions
There are no downloads or installations required for this project. To deploy and interact with this contract, you only need the [Remix IDE](https://remix.ethereum.org/#lang=en&optimize=false&runs=200&evmVersion=null&version=soljson-v0.8.26+commit.8a97fa7a.js)

## Contract code
```Solidity
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
        require(msg.value == amount, "Amount mismatch with value sent");
        balance += amount;
    }

    function withdraw(uint256 amount) public onlyOwner {
        require(amount <= balance, "Insufficient balance");
        balance -= amount;
        payable(owner).transfer(amount);
    }

    function checkInvariant() public view {
        // This assert checks an invariant in the contract
        assert(balance >= 0);
    }

    function emergencyWithdraw() public view onlyOwner {
        // This revert is used to cancel the transaction and revert any changes
        revert("Emergency withdraw is not allowed");
    }

    function getBalance() public view returns (uint256) {
        return balance;
    }
}
```

## Setup Instructions
1. Create a new file and name it SimpleContract.sol.
2. Copy and paste the contract code into the newly created file.
3. Select the "Solidity Compiler" in Remix.
4. Ensure the compiler version is set to 0.8.0 or higher.
5. Click on "Compile SimpleContract.sol".

## Deployment Instructions
1. Select the "Deploy & Run Transactions" in Remix.
2. Set the environment to "JavaScript VM (Berlin)" for local testing.
3. Click on "Deploy".

## Sample Interaction
1. Deposit
- In the "Deployed Contracts" section, find the deposit function.
- Enter the amount to deposit in the amount field.
- Enter the same amount in the "Value" field (this is the ether value in wei).
- Click the deposit button.
2. Withdraw
- Ensure you are connected with the owner's address.
- Enter the amount to withdraw in the withdraw function field.
- Click the withdraw button.
3. Check Invariant
- Click the checkInvariant function to ensure the balance is non-negative.
- Emergency Withdraw
- Click the emergencyWithdraw function to see the revert message.
4. Get Balance
- Click the getBalance function to view the current balance of the contract.

## Author
Althea Louise C. Cruz
