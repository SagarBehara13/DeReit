import { Router } from 'express'
import * as marketData from '../controller/marketData'

const router = Router()

router.post('/marketData', async (req, res) => marketData.addData(req.body))
router.delete('/marketData', async (req, res) => marketData.deleteData(req.body))
router.put('/marketData', async (req, res) => marketData.editData(req.body))
router.post('/marketData', async (req, res) => marketData.getData(req.body))
router.get('/marketData', async (req, res) => marketData.getEntireProperty())

export default router
