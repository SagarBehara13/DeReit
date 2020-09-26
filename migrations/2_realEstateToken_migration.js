const RealestateToken = artifacts.require('RealestateToken');
const RealEstateAPIConsumer = artifacts.require('RealEstateAPIConsumer')
const LinkTokenInterface = artifacts.require('LinkTokenInterface')

const payment = process.env.TRUFFLE_CL_BOX_PAYMENT || '1000000000000000000'

module.exports = async (deployer, callback) => {
  try {
    await deployer.deploy(RealEstateAPIConsumer)
    const mc = await RealEstateAPIConsumer.deployed()
    const tokenAddress = await mc.getChainlinkToken()
    const token = await LinkTokenInterface.at(tokenAddress)
    console.log('Funding contract:', mc.address)
    const tx = await token.transfer(mc.address, payment)
    callback(tx.tx)

    const consumerAPIAddress = await mc.address();
    deployer.deploy(RealestateToken,consumerAPIAdress, "Mannat" ) //add any name
  } catch (err) {
    callback(err)
  }
}
