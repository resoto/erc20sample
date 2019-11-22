contract ERC20 {
   
    string public name = "Bitcoin";
    string public  symbol = "BTC";
    uint8 public decimals = 18;
    uint256 public totalSupply = 1000;
    mapping (address => uint256) public  balances;
    mapping (address => mapping (address => uint256)) public  _allowed;
    
    constructor() public {
        balances[msg.sender] = totalSupply;
    }
    function name() public view returns(string) {
        return name;
    }
    function symbol() public view returns(string) {
        return symbol;
    }
    function decimals() public view returns(uint8) {
        return decimals;
    }
    function balanceOf(address userAddress) constant returns(uint256){
        return balances[userAddress];
    }
    function transfer(address _to, uint256 _amount) returns (bool success) {
        if (balances[msg.sender] >= _amount 
            && _amount > 0
            && balances[_to] + _amount > balances[_to]) {
            balances[msg.sender] -= _amount;
            balances[_to] += _amount;
            //Transfer(msg.sender, _to, _amount);
            return true;
        } else {
            return false;
        }
    }
}