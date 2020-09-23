//SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.7.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Address.sol";
import "./RealestateVerification.sol";
import "./RealEstateAPIConsumer.sol";

contract RealestateToken is ERC20, Ownable {
  using SafeMath for uint;
  using Address  for address;

  event AddShareholder (address indexed owner, address indexed shareholder);
  event RemoveShareholder (address indexed owner, address indexed shareholder);
  event TransferRevenue (address indexed sender, address indexed receipent, uint amount);


  mapping(address => bool) internal shareholders;
  mapping (address => uint) internal share;
  uint public collected;
  uint public totalShares;

  RealestateVerification contractInstance = new RealestateVerification();

  modifier checkShareholder(address _address) {
    require(isShareHolder(_address), "Not a shareholder");
   _;
  }

  constructor(address _owner, uint _supply) public ERC20("RealEstateToken", "RET"){
    //require(contractInstance.isVerified(_owner), "property not verified");
    _mint(_owner, _supply);
  }

  function accumulate() external payable {
    //TODO find a formula to convert amount to shares
    //This is a dummy

    collected = collected.add(msg.value);
    totalShares = collected ;
    share[_msgSender()] = msg.value;
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

  function removeShareHolder(address _address) public onlyOwner checkShareholder(_address) {
    shareholders[_address] = false;
    emit RemoveShareholder(owner(), _address);

  }

  //need to figure out, is it to be transfer or distribute
  function returnRevenue(address receipent, uint amount) internal checkShareholder(receipent) returns (bool) {
    _transfer(_msgSender(), receipent, amount);
    emit TransferRevenue(_msgSender(), receipent, amount);
    return true;
  }


  function distributeRevenue(address _address, string memory _name) public checkShareholder(_address){
    //TODO Formulate appropriate method to distribute the shares. This is a dummy

    // require(share[_address] > 0 , "You don't own any shares");
    // RealEstateAPIConsumer instance = new  RealEstateAPIConsumer();
    //
    // //TODO PLEASE CHECK WHETHER THIS IS THE CORRECT WAY OF RETRIEVING THE CLOSE PRICE !
    //
    // instance.realestatePrice(_name);
    // uint256 closePrice = instance.closePrice();
    // uint individualProfit = share[_address].div(totalShares).mul(closePrice);
    // returnRevenue(_address, individualProfit);
  }
}
