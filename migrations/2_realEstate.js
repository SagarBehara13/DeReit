var RealestateToken = artifacts.require('../contracts/RealEstate')

module.exports = function(deployer){
  deployer.deploy(RealestateToken)
}
