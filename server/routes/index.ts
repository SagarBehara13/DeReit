import { Router } from 'express'
import marketData from './marketData'

const router = Router()

router.use('/api/property', marketData)

export default router
