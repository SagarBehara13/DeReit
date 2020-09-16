require('dotenv').config()

import * as mongoose from 'mongoose'
import * as debug from 'debug'
import * as Bluebird from 'bluebird'

const logger = debug('app:db')

mongoose.Promise = Bluebird

export const open = (url?: string) => {
  return new Promise((resolve, reject) => {
    // Setup cache for mongoose
    // cachegoose(mongoose)
    logger('opening mongodb connection')
    console.log('opening mongodb connection')

    const options = {
      useCreateIndex: true,
      useNewUrlParser: true,
      useFindAndModify: false
    }

    //process.env.DATABASE_URI || 
    mongoose.connect("mongodb+srv://root:root@cluster0.jmtlv.mongodb.net/RealEstate", options, (error: any) => {
    //mongoose.connect('mongodb://127.0.0.1:55016/wallet', options, (error: any) => {
      if (error) {

        logger('please make sure mongodb is installed and running!')
        console.log('please make sure mongodb is installed and running!')

        return reject(error)
      } else {
        console.log('mongodb is connected')
        logger('mongodb is connected')
        resolve()
      }
    })
  })
}


export const close = () => mongoose.disconnect()
