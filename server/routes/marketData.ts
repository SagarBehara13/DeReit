import { Router } from 'express'
import * as marketData from '../controller/marketData'
import asyncJsonController from '../utils/asyncJsonController'

const router = Router()

router.post('/marketData', asyncJsonController(req => marketData.addData(req.body)))
router.delete('/marketData', asyncJsonController(req => marketData.deleteData(req.body)))
router.put('/marketData', asyncJsonController(req => marketData.editData(req.body)))
router.post('/search/marketData', asyncJsonController(req => marketData.getData(req.query)))
router.get('/marketData', asyncJsonController(req => marketData.getEntireProperty()))
router.post('/location', asyncJsonController(req => marketData.addLocation(req.body)))
router.get('/location', asyncJsonController(req => marketData.getLocation()))

export default router
