import express from 'express';
import { Router } from 'express';
import PaymentRoute from './controller/v1/payment';
const bodyParser = require('body-parser');

const app = express();
const PORT = process.env.PORT || 8090;

app.use(bodyParser.urlencoded({ extended: true }));

const v1Group = Router();
v1Group.use(express.json());
v1Group.use(PaymentRoute);

app.use('/api/v1', v1Group); 
app.get('/', (req, res) => res.send('Hi!'));

app.listen(PORT, () => {
  console.log(`⚡️[server]: Server is running at https://localhost:${PORT}`);
});
