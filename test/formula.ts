// price of one symbol
let totalSupply = 3000
let price = 35000
let expectedRent = 1500
let share = 1500

const tokenPrice = async (totalSupply, price) => {
  let p = totalSupply / price
  return p
}

//console.log(tokenPrice(totalSupply, price))

const profitByMonth = async (share, expectedRent, totalSupply) => {
  let p = (share * expectedRent) / totalSupply
}

//profitByMonth(share, expectedRent, totalSupply)
