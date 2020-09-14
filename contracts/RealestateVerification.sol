//SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.7.0 ;

import "./github/OpenZeppelin/openzeppelin-contracts/contracts/access/Ownable.sol";

/**
 * @dev Contract for verification of a real estate property
 * before it gets tokenized
 **/
contract RealestateVerification is Ownable {

    mapping (address => bool) internal verified;

    function isVerified(address _propOwner) public view returns(bool) {
        return verified[_propOwner];
    }

    function verificationProcess(address _propOwner) public onlyOwner{
        //Some verification process to be done here
        //If verified mark the property owner address as verified
        verified[_propOwner] = true;
    }
}
