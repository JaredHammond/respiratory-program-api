import express from 'express';
const router = express.Router();
import * as apiController from '../controllers/apiController';

/* GET users listing. */
router.get('/respirators', apiController.getRespirators);

export default router;
