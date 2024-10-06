require('dotenv').config();
const jwt = require('jsonwebtoken');
const secretKey = process.env.JWT_SECRET; // Ahora usando la variable de entorno

const verifyToken = (roles) => {
    return (req, res, next) => {
        const token = req.headers['authorization']?.split(' ')[1]; 

        if (!token) return res.status(403).send('Token requerido');

        jwt.verify(token, secretKey, (err, decoded) => {
            if (err) return res.status(403).send('Token inválido');

            if (roles && !roles.includes(decoded.idTipoUsuario)) {
                return res.status(403).send('Acceso denegado');
            }

            req.user = decoded; 
            next();
        });
    };
};

module.exports = { verifyToken };
