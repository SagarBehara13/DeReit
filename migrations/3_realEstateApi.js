var RealEstateAPIConsumer = artifacts.require('RealEstateAPIConsumer')

module.exports = function(deployer){
  deployer.deploy(RealEstateAPIConsumer)
}
