import express from 'express';
import {
	findAll,
	createUser,
	findUserById,
	updateUserById,
	deleteUserById,
	login,
} from '../controllers/user.controller.js';
import { emitToken, verifyToken } from '../middlewares/auth.middleware.js';

const router = express.Router();
// router.post('/register', createUser);
// router.get('/register', async (req, res) => {
// 	res.render('subscriptionForm');
// });
router.post('/signup', createUser);
router.post('/signin', emitToken, login);

router.get('/', verifyToken,findAll);
// Usuario puede ver y modificar su propia información (nombre y apellido)
router.get('/id/:id', verifyToken, findUserById);
router.put('/id/:id', verifyToken, updateUserById);
router.delete('/id/:id', verifyToken, deleteUserById);

export default router;
