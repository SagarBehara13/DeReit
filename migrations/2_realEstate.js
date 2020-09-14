var RealestateToken = artifacts.require('../contracts/RealEstateToken')

module.exports = function(deployer){
  deployer.deploy(RealestateToken(_msgSender,100000000))
}
