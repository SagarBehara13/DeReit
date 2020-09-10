pragma solidity ^0.6.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/math/SafeMath.sol";

contract RealestateToken is ERC20, Ownable {
  using SafeMath for uint;

  address[] internal shareholders;
  mapping (address => uint) internal share;
  uint collected;

  constructor(address _owner, uint _supply) public ERC20("RealEstateToken", "RET"){
    _mint(_owner, _supply);
  }

  function accumulate() external payable {
    collected += msg.value;
  }

  function checkShareHolder(address _address) public view returns (bool, uint){
    for(uint i = 0; i < shareholders.length; i += 1){
      if(_address == shareholders[i]) return (true, i);
    }
    return (false, 0);
  }

  function addShareHolder(address _address) public onlyOwner {
    (bool ifExistingHolder,) = checkShareHolder(_address);
    if(!ifExistingHolder) shareholders.push(_address);
  }

  function removeShareHOlder(address _address) public onlyOwner {
    (bool ifExisitingHolder, uint256 s) = checkShareHolder(_address);
    if(ifExisitingHolder){
      shareholders[s] = shareholders[shareholders.length - 1];
      shareholders.pop();
    }
  }

  //need to figure out, is it to be transfer or distribute
  function returnRevenue(address receipent, uint amount) public returns (bool) {
    (bool ifExistingHolder,) = checkShareHolder(receipent);
    require(ifExistingHolder);
    _transfer(msg.sender, receipent, amount);
    return true;
  }

  // function distribute(){
  //  check balance of shareholders then distribute profit accordingly
  // }

}
