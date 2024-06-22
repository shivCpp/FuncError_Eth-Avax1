# Error 

## Overview

This program is a simple contract written in Solidity, a programming language used for developing smart contracts on the Ethereum blockchain. This `error` demonstrates the use of require, assert, and revert for error handling in Solidity contracts.This contract includes a function for minting token and transferring token between addresses.

## Understanding the Statements

` error insufficientFunds (uint  amountIHave, uint amountNeeded); `

The error revert statement throws is a custom error designed to inform the user about the amount required and amount present

` require (msg.sender == owner, "Only owner can perform this operation."); `

 require ensures that only the owner of the contract can execute functions that use this modifier. If msg.sender (the address that called the function) is not the owner, the execution is reverted with the error message "Only owner can perform this operation."

` revert insufficientFunds(balance[senderAddress], amount); `

 revert is used to halt the function execution if the sender's balance is less than the amount they are trying to transfer. The custom error insufficientFunds provides details about the current balance and the required amount, which can be useful for debugging and user feedback.

 ` assert (transactionCount >= 1); `
 
  assert is used to verify that the Count variable is always greater than or equal to 1 after incrementing. Since Count starts from 0 and is incremented by 1 at the beginning of the sendMyCoins function, this condition should always be true. If it is ever false, it indicates a serious flaw in the contract logic.

## Usage
to uses this contract or exectue you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., error.sol). Copy and paste the following code into the file:

```solidity
// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

error InsufficientFunds(uint amountIHave, uint amountNeeded);
event Minted(uint depositAmount, address forAddress);

contract ErrorContract {
    address private owner;
    mapping(address => uint) private balances;
    uint private transactionCount = 0;

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can perform this operation.");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function mintFor(address receivingAddress, uint creditingAmount) public onlyOwner {
        balances[receivingAddress] += creditingAmount;
        emit Minted(creditingAmount, receivingAddress);
    }

    function sendMyCoins(address senderAddress, address receiverAddress, uint amount) public {
        transactionCount += 1;
        if (balances[senderAddress] < amount) {
            revert InsufficientFunds(balances[senderAddress], amount);
        }
        assert(transactionCount >= 1);
        balances[receiverAddress] += amount;
        balances[senderAddress] -= amount;
    }
}
```
To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.25" (or another compatible version), and then click on the "Compile error.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "error" contract from the dropdown menu, and then click on the "Deploy" button.

Once the contract is deployed, you can use the deployed contract interface to call the mint, transfer.You can enter addresses and values to test the functionality. After entering data, click on "transact" button to execute the function and mint, transfer the amount and do testing. 

## Contact
For any questions or suggestions, feel free to open an issue or contact the repository owner.

Mail - vermashiv1910@gmail.com
