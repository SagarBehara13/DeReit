import { Request, Response, NextFunction } from 'express'
// import { User } from '../database/models/user'


// Async Middleware to catch errors and pass them on to Express's error handler
//  https://medium.com/@Abazhenov/using-async-await-in-express-with-node-8-b8af872c0016
type IAppRequest = Request & { user: any }
type asyncJsonFunction = (request: IAppRequest) => Promise<any> | any
const asyncJsonController = (fn: asyncJsonFunction) =>
  (request: IAppRequest, response: Response, next?: NextFunction) => {
    Promise.resolve(fn(request))
    .then(result => response.json(result))
    .catch(next)
}


export default asyncJsonController
