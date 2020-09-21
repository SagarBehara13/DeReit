pragma solidity >=0.6.0 <0.7.0;

import "https://github.com/smartcontractkit/chainlink/evm-contracts/src/v0.6/ChainlinkClient.sol";


contract RealEstateAPIConsumer is ChainlinkClient {

    uint256 public price;
    uint public surfaceArea;
    address private oracle;
    bytes32 private jobId;
    uint256 private fee;
    uint public rent;

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

    function realestateArea(string memory _name) private {
        Chainlink.Request memory request = buildChainlinkRequest(jobId, address(this), this.fulfill.selector);
        request.add("name", _name);
        request.add("copyPath", "surfaceArea");
        sendChainlinkRequestTo(oracle, request, fee);
    }

    function fulfill(bytes32 _requestId, uint256 _surfaceArea) public recordChainlinkFulfillment(_requestId){
        surfaceArea = _surfaceArea;
    }

    function realestatePrice(string memory _name) private {
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
}
