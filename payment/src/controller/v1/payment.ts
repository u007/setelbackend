import { Router, Request, Response } from 'express';
import express from 'express';
import auth from '../../middleware/auth';

const router = Router();
router.use(auth);

router.post('/payment', (req: Request, res: Response) => {
  console.debug('req', req.body);
  const { orderID, amount } = req.body
  const payStatus = Math.floor(Math.random() * 2) === 1 ? 'success' : 'declined';
  console.debug('order', orderID, amount, payStatus);
  res.status(200).json({ status: payStatus, amount });
});


export default router;