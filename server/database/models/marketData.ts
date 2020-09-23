import { Document, Schema, model } from 'mongoose'

export interface IMarketData {
  name: string,
  owner: {
    name: string,
    contact: string
  },
  images: [],
  details: string,
  address: {
    street: string,
    city: string,
    country: string,
    zipcode: string
  },
  location:{
    lat: number,
    lng: number
  },
  surfaceArea: number,
  closePrice: number,
  expectedRent: number,
  type: string
}

const MarketDataSchema = new Schema({
  name: String,
  owner: {
    name: String,
    contact: String
  },
  images: [],
  details: String,
  address: {
    street: String,
    city: String,
    country: String,
    zipcode: String
  },
  location:{
    lat: Number,
    lng: Number
  },
  surfaceArea: Number,
  closePrice: Number,
  expectedRent: Number,
  type: String
})

export type MarketData = Document & IMarketData
export default model<MarketData>('MarketData', MarketDataSchema)
