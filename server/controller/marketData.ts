import MarketData from '../database/models/marketData'

export const addData = async (data) => {
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
  return { sucess: true }
}

export const editData = async (data) => {
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
    return { sucess: true }
  }

  return { error: "Property Not Found" }
}

export const deleteData = async (data) => {
  const marketData = await MarketData.findOne({ name: data.name, owner: data.owner })
  if(marketData){
    await MarketData.deleteOne({ _id: marketData })
    return{ sucess: true }
  }

  return { error: "Property Not Found" }
}

export const getData = async (data) => {
  try{
    const marketData = await MarketData.findOne({
      name: { $regex: data.name, $options: "i" }
    })

    return marketData || []
  } catch(e){
    console.log(e)
  }
}

export const getEntireProperty = async () => {
  const marketData = await MarketData.find({})

  return marketData
}
