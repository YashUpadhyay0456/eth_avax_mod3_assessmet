// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract MyToken {
    string public name;
    string public symbol;
    uint public totalSupply;
    address public owner;

    mapping(address => uint256) public balances;

    modifier forOwner() {
        require(msg.sender == owner, "for only the owner of the contract");
        _;
    }

    constructor (string memory _name,string memory _symbol,uint _initialSupply) 
    {
        name = _name;
        symbol = _symbol;
        totalSupply = _initialSupply ;
        owner = msg.sender;
        balances[owner] = totalSupply;
    }

    function burn(uint _value) public 
    {
    
        require(balances[msg.sender] >= _value, "low balance cant burn");

        balances[msg.sender] -= _value;
        totalSupply -= _value;

    }

    function mint(address _to, uint _value) public forOwner 
    {
        balances[_to] += _value;
        totalSupply += _value;

        
    }
}
