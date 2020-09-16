import { Router } from 'express'
import * as marketData from '../controller/marketData'

const router = Router()

router.post('/marketData', async (req, res) => marketData.addData(req.body, res))
router.delete('/marketData', async (req, res) => marketData.deleteData(req.body, res))
router.put('/marketData', async (req, res) => marketData.editData(req.body, res))
router.post('/marketData', async (req, res) => marketData.getData(req.body, res))
router.get('/marketData', async (req, res) => marketData.getEntireProperty(res))

export default router
