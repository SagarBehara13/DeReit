pragma solidity >0.6.0 <=0.7.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract RealestateToken is ERC20, Ownable {
  using SafeMath for uint;

  event AddShareholder (address indexed owner, address indexed shareholder);
  event RemoveShareholder (address indexed owner, address indexed shareholder);
  event TransferRevenue (address indexed sender, address indexed receipent, uint amount);


  mapping(address => bool) internal shareholders;
  mapping (address => uint) internal share;
  uint collected;

  constructor(address _owner, uint _supply) public ERC20("RealEstateToken", "RET"){
    _mint(_owner, _supply);
  }

  function accumulate() external payable {
    collected = collected.add(msg.value);
  }

  function isShareHolder(address _address) public view returns (bool){
    return shareholders[_address];
  }

/**
 * @dev function to add a shareholder
 * only allows EOAs to be a shareholder
 */

  function addShareHolder(address _address) public onlyOwner {
    require(!_address.isContract(), "Only EOA are allowed as shareholders");
    require(!isShareHolder(_address), "Already a shareholder");
    shareholders[_address] = true;
    emit AddShareholder(owner(), _address);
  }

  function removeShareHolder(address _address) public onlyOwner {
    require(isShareHolder(_address), "Not a shareholder");
    shareholders[_address] = false;
    emit RemoveShareholder(owner(), _address);

  }

  //need to figure out, is it to be transfer or distribute
  function returnRevenue(address receipent, uint amount) public returns (bool) {
    require(isShareHolder(receipent), "Recepient not a shareholder");
    _transfer(_msgSender(), receipent, amount);
    emit TransferRevenue(_msgSender(), receipent, amount);
    return true;
  }


  // function distribute(){
  //  check balance of shareholders then distribute profit accordingly
  // }

}
