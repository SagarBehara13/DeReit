pragma solidity >=0.6.0 <0.7.0;

import "https://github.com/smartcontractkit/chainlink/evm-contracts/src/v0.6/ChainlinkClient.sol";


contract RealEstateAPIConsumer is ChainlinkClient {

  address private oracle;
  bytes32 private jobId;
  uint256 private fee;
  uint256 public price;
  uint public surfaceArea;
  uint public rent;
  bytes32 latestRequestId;
  bytes32 public tokenHash;
  bytes32 public tokenHash2;

  mapping(bytes32 => uint256) public currentTokensPrice;
  mapping(bytes32 => bytes32) internal receipts;

  event RequestRealEstatePrice(
    bytes32 indexed requestId,
    uint indexed price
  );

  constructor() public {
    setPublicChainlinkToken();
    oracle = 0xAA1DC356dc4B18f30C347798FD5379F3D77ABC5b;
    jobId = "c76fb336346f4a5591c90ca8242091d5";
    fee = 0.1 * 10 ** 18; // 0.1 LINK
  }

  function realEstateData(string memory _name) public {
    realestateArea(_name);
    realestatePrice(_name);
    realestateRent(_name);
  }

  function returnClosePrice(string memory _name) public {
    Chainlink.Request memory request = buildChainlinkRequest(jobId, address(this), this.myCallback.selector);
    request.add("name", _name);
    request.add("copyPath", "closePrice");
    sendChainlinkRequestTo(oracle, request, fee);
  }

  function myCallback(bytes32 _requestId, uint256 _price) public returns(uint){
    validateChainlinkCallback(_requestId);
    emit RequestRealEstatePrice(_requestId, _price);
    tokenHash = receipts[_requestId];
    delete receipts[_requestId];
    currentTokensPrice[tokenHash] = _price;
    tokenHash2 = _requestId;
    price = _price;
  }

  function getCurrentPriceByAddress(bytes32 _hash) public view returns (uint256) {
    return currentTokensPrice[_hash];
  }

  function realestateArea(string memory _name) private {
    Chainlink.Request memory request = buildChainlinkRequest(jobId, address(this), this.fulfill.selector);
    request.add("name", _name);
    request.add("copyPath", "surfaceArea");
    sendChainlinkRequestTo(oracle, request, fee);
  }

  function fulfill(bytes32 _requestId, uint256 _surfaceArea) public recordChainlinkFulfillment(_requestId){
    surfaceArea = _surfaceArea;
  }

  function realestatePrice(string memory _name) public returns (uint){
    Chainlink.Request memory request = buildChainlinkRequest(jobId, address(this), this.fulfillPrice.selector);
    request.add("name", _name);
    request.add("copyPath", "closePrice");
    sendChainlinkRequestTo(oracle, request, fee);
  }

  function fulfillPrice(bytes32 _requestId, uint256 _price) public recordChainlinkFulfillment(_requestId){
    price = _price;
  }

  function realestateRent(string memory _name) private {
    Chainlink.Request memory request = buildChainlinkRequest(jobId, address(this), this.fulfillRent.selector);
    request.add("name", _name);
    request.add("copyPath", "expectedRent");
    sendChainlinkRequestTo(oracle, request, fee);
  }

  function fulfillRent(bytes32 _requestId, uint256 _rent) public recordChainlinkFulfillment(_requestId){
    rent = _rent;
  }

  function stringToBytes32(string memory source) internal pure returns (bytes32 result) {
    bytes memory tempEmptyStringTest = bytes(source);
    if (tempEmptyStringTest.length == 0) {
      return 0x0;
    }

    assembly {
      result := mload(add(source, 32))
    }
  }

  function bytes32ToStr(bytes32 _bytes32) public pure returns (string memory) {
    bytes memory bytesArray = new bytes(32);
    for (uint256 i; i < 32; i++) {
      bytesArray[i] = _bytes32[i];
    }
    return string(bytesArray);
  }
}
