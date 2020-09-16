require('dotenv').config()

import * as express from 'express'
import * as bodyParser from 'body-parser'
import * as mongoose from 'mongoose'

import { open } from './database'
import routes from './routes'

const app = express()
console.log("Server is starting")

const port = 8080

app.use(bodyParser.json({ limit: '100mb' }))
app.use(bodyParser.urlencoded({ extended: true, limit: '100mb' }))
app.use(routes)

//establishing database connection
open()

app.listen(port, () => {
  console.log("Server started at :- " + port)
})
