import MarketData from '../database/models/marketData'
import AddressData from '../database/models/location'

export const addData = async (data) => {
  const newRealEstate = new MarketData({
    name: data.name,
    address: data.address,
    location: data.location,
    owner: data.owner,
    type: data.type,
    surfaceArea: data.surfaceArea,
    closePrice: data.closePrice,
    images: data.images,
    details: data.details,
    expectedRent: data.expectedRent
  })

  await newRealEstate.save()
  return { sucess: true }
}

export const editData = async (data) => {
  const marketData = await MarketData.findOne({ name: data.name, owner: data.owner })
  if(marketData){
    marketData.set('name', data.name || marketData.name)
    marketData.set('location.lat', data.location.lat || marketData.location.lat)
    marketData.set('location.lng', data.location.lng || marketData.location.lng)
    marketData.set('owner.name', data.owner.name || marketData.owner.name)
    marketData.set('owner.contact', data.owner.contact || marketData.owner.contact)
    marketData.set('type', data.type || marketData.type)
    marketData.set('address.country', data.address.country || marketData.address.country)
    marketData.set('address.city', data.address.city || marketData.address.city)
    marketData.set('address.street', data.address.street || marketData.address.street)
    marketData.set('address.zipcode', data.address.zipcode || marketData.address.zipcode)
    marketData.set('surfaceArea', data.surfaceArea)
    marketData.set('closePrice', data.closePrice)
    marketData.set('images', data.images)
    marketData.set('details', data.details)
    marketData.set('zipcode', data.zipcode)
    marketData.set('expectedRent', data.expectedRent)

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

export const addLocation = async (data) =>{
  const addLocation = new AddressData({
    city: data.city,
    country: data.country
  })

  await addLocation.save()
  return { sucess: true }
}

export const getLocation = async () =>{
  const locations = await AddressData.find({})
  return locations
}
