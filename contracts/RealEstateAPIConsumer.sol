pragma solidity >=0.6.0 <0.7.0;

import "@chainlink/contracts/src/v0.6/ChainlinkClient.sol";

contract RealEstateAPIConsumer is ChainlinkClient {

  uint public surfaceArea;
  uint public closePrice;
  address private oracle;
  bytes32 private jobId;
  uint256 private fee;

  constructor() public {
    setPublicChainlinkToken();
    oracle = 0xAA1DC356dc4B18f30C347798FD5379F3D77ABC5b;
    jobId = "c76fb336346f4a5591c90ca8242091d5";
    fee = 0.1 * 10 ** 18; // 0.1 LINK
  }

  function realestaeArea(string memory _name) public {
    Chainlink.Request memory request = buildChainlinkRequest(jobId, address(this), this.fulfillArea.selector);
    request.add("name", _name);
    request.add("copyPath", "surfaceArea");
    sendChainlinkRequestTo(oracle, request, fee);
  }

  function realestatePrice(string memory _name) public {
    Chainlink.Request memory request = buildChainlinkRequest(jobId, address(this), this.fulfillPrice.selector);
    request.add("name", _name);
    request.add("copyPath", "closePrice");
    sendChainlinkRequestTo(oracle, request, fee);
  }

  function fulfillArea(bytes32 _requestId, uint256 _surfaceArea) public recordChainlinkFulfillment(_requestId){
    surfaceArea = _surfaceArea;
  }

  function fulfillPrice(bytes32 _requestId, uint256 _closePrice) public recordChainlinkFulfillment(_requestId) {
    closePrice =  _closePrice;
  }
}
