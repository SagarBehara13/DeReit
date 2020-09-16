import MarketData from '../database/models/marketData'

export const addData = async (data, res) => {
  const newRealEstate = new MarketData({
    name: data.name,
    location: data.location,
    owner: data.owner,
    type: data.type,
    country: data.country,
    surfaceArea: data.surfaceArea,
    closePrice: data.closePrice,
    imageUrl: data.imageUrl,
    Details: data.Details,
    zipcode: data.zipcode,
    contact: data.contact
  })

  await newRealEstate.save()
  res.send({ sucess: true })
}

export const editData = async (data, res) => {
  const marketData = await MarketData.findOne({ name: data.name, owner: data.owner })
  if(marketData){
    marketData.set('name', data.name)
    marketData.set('location', data.location)
    marketData.set('owner', data.owner)
    marketData.set('type', data.type)
    marketData.set('country', data.country)
    marketData.set('surfaceArea', data.surfaceArea)
    marketData.set('closePrice', data.closePrice)
    marketData.set('imageUrl', data.imageUrl)
    marketData.set('Details', data.Details)
    marketData.set('zipcode', data.zipcode)
    marketData.set('contact', data.contact)

    await marketData.save()
    res.send({ sucess: true })
  }

  res.send({ error: "Property Not Found" })
}

export const deleteData = async (data, res) => {
  const marketData = await MarketData.findOne({ name: data.name, owner: data.owner })
  if(marketData){
    await MarketData.deleteOne({ _id: marketData })
    res.send({ sucess: true })
  }

  res.send({ error: "Property Not Found" })
}

export const getData = async (data, res) => {
  const marketData = await MarketData.find({
    $or: [
      { name: { $regex: data.name, $options: "i" }},
      { location: { $regex: data.location, $options: "i" }}
    ]
  })
  
  res.send(marketData)
}

export const getEntireProperty = async (res) => {
  const marketData = await MarketData.find({})

  res.send(marketData)
}
