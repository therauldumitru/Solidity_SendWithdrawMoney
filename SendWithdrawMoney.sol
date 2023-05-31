//SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract SendWithdrawMoney {

    uint public balanceReceived;

// payable function which receives a currency and counts it
    function deposit () public payable {
        balanceReceived += msg.value;
    }

// returns the current balance of the smart contract
    function contractBalance() public view returns(uint){
        return address(this).balance;
    }

// withdraws the currency stored in the contract to the msg.sender address
    function withdrawAll () public {
        address payable to = payable(msg.sender);
       to.transfer(contractBalance());
        
    }

// withdraws the currency stored in the contract to another address
    function withdrawToAddress (address payable to) public {
        to.transfer(contractBalance());
    }

}
