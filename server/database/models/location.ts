import { Document, Schema, model } from 'mongoose'

export interface IAddressData {
  city: string,
  country: string
}

const AddressDataSchema = new Schema({
  city: String,
  country: String
})

export type AddressData = Document & IAddressData
export default model<AddressData>('locationData', AddressDataSchema)
