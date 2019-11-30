pragma solidity ^0.4.25;
contract ERC20 {
  //トークンの名前
  string public name;
  //トークンのシンボル
  string public  symbol;
  //トークンの総発行量
  uint256 public totalSupply;
  //トークンの桁数
  uint8 public decimals = 18;
  //各アドレスの残高
  mapping (address => uint256) public  balances;
  mapping (address => mapping (address => uint))public  allowed;
  event Transfer(address indexed _from, address indexed _to, uint256 
_value);
  event Approval(address indexed _owner, address indexed _spender, 
uint256 _value);
  //コンストラクタ
  constructor(uint256 initialSupply, string tokenName, string 
tokenSymbol) public {
      totalSupply = initialSupply * 10 ** uint256(decimals);
      balances[msg.sender] = totalSupply;
      name = tokenName;
      symbol = tokenSymbol;
  }
  //トークンの名前を返す
  function name() public view returns(string) {
      return name;
  }
  //トークンのシンボルを返す
  function symbol() public view returns(string) {
      return symbol;
  }
  //トークンの桁数を返す
  function decimals() public view returns(uint8) {
      return decimals;
  }
  //トークンの総発行量を返す
  function totalSupply() public view returns (uint256) {
      return totalSupply;
  }
  //アドレスの残高を返す
  function balanceOf(address _userAddress) public constant 
returns(uint256 balance){
      return balances[_userAddress];
  }
  //トークンの送金
  function transfer(address _to, uint256 _amount) public returns (bool 
success) {
      if (balances[msg.sender] >= _amount
      && _amount > 0
      && balances[_to] + _amount > balances[_to]) {
          balances[msg.sender] -= _amount;
          balances[_to] += _amount;
          //イベント
          emit Transfer(msg.sender, _to, _amount);
          return true;
      } else {
          return false;
      }
  }
  //権利が与えられたトークンを送金する
  function transferFrom(address _from,address _to,uint256 _amount) 
public returns (bool success) {
      if (balances[_from] >= _amount
      && allowed[_from][msg.sender] >= _amount
      && _amount > 0
      && balances[_to] + _amount > balances[_to]) {
          balances[_from] -= _amount;
          allowed[_from][msg.sender] -= _amount;
          balances[_to] += _amount;
          //イベント
          emit Transfer(_from, _to, _amount);
          return true;
      } else {
          return false;
      }
  }
  //_spenderに指定量のトークン使用権を与える
  function approve(address _spender, uint256 _amount) public returns 
(bool success) {
      allowed[msg.sender][_spender] = _amount;
      emit Approval(msg.sender, _spender, _amount);
      return true;
  }
  //_spenderが引き続き_ownerから引き出せる量を返す
  function allowance(address _owner, address _spender) public constant 
returns (uint256 remaining) {
      return allowed[_owner][_spender];
  }
}
