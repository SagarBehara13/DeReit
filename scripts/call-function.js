var RealEstateAPIConsumer = artifacts.require('RealEstateAPIConsumer')

module.exports = async callback => {
  const re = await RealEstateAPIConsumer.deployed()
  const tx = await re.DID_resolver()
  callback(tx.tx)
}
