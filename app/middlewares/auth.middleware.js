import jwt from 'jsonwebtoken';
import User from '../models/User.model.js';

export const emitToken = async (req, res, next) => {
	let { email, password } = req.body;
	let user = await User.findOne({
		where: {
			email,
			password,
		},
		attributes: ['id', 'firstName', 'lastName', 'email'],
	});
	if (!user) {
		return res
			.status(400)
			.json({ code: 400, message: 'Error de autenticación' });
	}
	let token = jwt.sign(
		{
			// exp: Math.floor(Date.now() / 1000 + 5 * 60),
			data: user,
		},
		process.env.PASSWORD_SECRET
	);
	req.token = token;
	next();
};

export const verifyToken = async (req, res, next) => {
	try {
		let { token } = req.query;
		if (!token) {
			token = req.headers['authorization'];
            if(!token){
                throw new Error('No se ha encontrado un token')
            }
			token = token.split(' ')[1];
			if (token.length == 0) {
				throw new Error('No se ha proporcionado un token');
			}
		}
		jwt.verify(token, process.env.PASSWORD_SECRET, async (err, decoded) => {
			if (err) {
				return res
					.status(401)
					.json({
						code: 401,
						message:
							'Debe proporcionar un token válido (puede ser que su token haya expirado)',
					});
			}
			let usuario = await User.findByPk(decoded.data.id, {
				attributes: ['id', 'firstName', 'lastName', 'email'],
			});
			if (!usuario) {
				return res
					.status(400)
					.json({ code: 400, message: 'Usuario no existe en el sistema' });
			}
			req.usuario = decoded.data;
			console.log(decoded)
			next();
		});
	} catch (error) {
		return res.status(401).json({ code: 401, message: error.message });
	}
};
