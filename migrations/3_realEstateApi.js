var RealEstateAPIConsumer = artifacts.require('../contracts/RealEstateAPIConsumer')

module.exports = function(deployer){
  deployer.deploy(RealEstateAPIConsumer)
}
