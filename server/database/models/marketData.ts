import { Document, Schema, model } from 'mongoose'

export interface IMarketData {
  name: string,
  location: string,
  owner: string,
  type: string,
  country: string,
  surfaceArea: number,
  closePrice: number,
  imageUrl: string,
  Details: string,
  zipcode: string,
  contact: string,
  expectedRent: number
}

const MarketDataSchema = new Schema({
  name: String,
  location: String,
  owner: String,
  type: String,
  country: String,
  surfaceArea: Number,
  closePrice: Number,
  imageUrl: String,
  Details: String,
  zipcode: String,
  contact: String,
  expectedRent: Number
})

export type MarketData = Document & IMarketData
export default model<MarketData>('MarketData', MarketDataSchema)
