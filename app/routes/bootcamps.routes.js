import express from 'express';
import {
	findAll,
	createBootcamp,
	findById,
	addUser,
	// updateBootcamps,
	// deleteBootcamps,
} from '../controllers/bootcamp.controller.js';
import { verifyToken } from '../middlewares/auth.middleware.js';

const router = express.Router();
router.get('/', findAll);
router.post('/', verifyToken,createBootcamp);
router.get('/id/:id', verifyToken, findById);
router.post('/adduser', verifyToken, addUser);
// router.put("/id/:id", updateBootcamps);
// router.delete("/id/:id", deleteBootcamps);

export default router;
