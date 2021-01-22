import express from 'express';
import { Router } from 'express';
const bodyParser = require('body-parser');

export default (req : express.Request, res: express.Response, next: express.NextFunction) => {
  const token = req.headers.auth;
  if (token !== '1y2612872l21lD') {
    res.status(403).send('permission_denied');
    return;
  }
  next();
};
