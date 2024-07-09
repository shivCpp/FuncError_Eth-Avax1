// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

error insufficientFunds (uint _amountiHave, uint _amountNeeded);
event minted (uint _DepositAmount, address _forAddress);

contract error
{
    address owner;
    mapping (address => uint) balance;
    uint Count = 0;
    modifier allowOnlyOwner ()
    {
        require (msg.sender == owner, "Only owner can perform this operation.");
        _;
    }

    constructor()
    {
        owner = msg.sender;
    }

    function mintFor (address _receivingAddress, uint _creditingAmount) allowOnlyOwner public 
    {
        balance[_receivingAddress] += _creditingAmount;
        emit minted (_creditingAmount, _receivingAddress);
    }

    function sendMyCoins (address _senderAddress, address _receiverAddress, uint value) public
    {
        Count += 1;
        if (balance[_senderAddress] < value)
        {
            revert insufficientFunds(balance[_senderAddress], value);
        }
        assert (Count >= 1);
        balance[_receiverAddress] += value;
        balance[_senderAddress] -= value;
    }
}
