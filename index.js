/**
 * Entry Script
 */
require('dotenv').config()

if (process.env.NODE_ENV == 'production' || process.env.NODE_ENV == 'test') {
  require('./dist/')
  return
}

require('./server')
