pragma solidity >=0.6.0 <0.7.0;

import "https://github.com/smartcontractkit/chainlink/evm-contracts/src/v0.6/ChainlinkClient.sol";


contract RealEstateAPIConsumer is ChainlinkClient {

    uint256 public price;
    uint public surfaceArea;
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
        Chainlink.Request memory request = buildChainlinkRequest(jobId, address(this), this.fulfill.selector);
        request.add("name", _name);
        request.add("copyPath", "surfaceArea");
        sendChainlinkRequestTo(oracle, request, fee);
    }

    function fulfill(bytes32 _requestId, uint256 _surfaceArea) public recordChainlinkFulfillment(_requestId){
        surfaceArea = _surfaceArea;
    }
}
