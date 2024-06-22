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





