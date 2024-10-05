const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const db = require('../config/bd');
const secretKey = 'clave_secreta_357'; 

// Login
const login = async (req, res) => {
    const { correoElectronico, contrasenia } = req.body;

    try {
        const [user] = await db.query('SELECT * FROM usuarios WHERE correoElectronico = ?', [correoElectronico]);

        if (!user || user.length === 0 || user[0].idTipoUsuario !== 2) { // Verifica que sea empleado
            return res.status(401).json({ message: 'Usuario o contraseña incorrectos' });
        }

        const hashedPassword = user[0].contrasenia;
        const isMatch = await bcrypt.compare(contrasenia, hashedPassword);
        
        if (!isMatch) {
            return res.status(401).json({ message: 'Usuario o contraseña incorrectos' });
        }

        const token = jwt.sign({ idUsuario: user[0].idUsuario, idTipoUsuario: user[0].idTipoUsuario }, secretKey, { expiresIn: '1h' });
        res.json({ token });
    } catch (error) {
        res.status(500).json({ message: 'Error en el inicio de sesión', error: error.message });
    }
};

// Atender Reclamo
const atenderReclamo = async (req, res) => {
    const { id } = req.params;
    const { nuevoEstado } = req.body;

    try {
        const reclamo = await db.query('SELECT * FROM reclamos WHERE idReclamo = ? AND idOficina = (SELECT idOficina FROM usuarios_oficinas WHERE idUsuario = ? AND activo = 1)', [id, req.user.idUsuario]);

        if (reclamo.length === 0) {
            return res.status(403).json({ message: 'Acceso denegado: este reclamo no pertenece a su oficina.' });
        }

        const result = await db.query('UPDATE reclamos SET idReclamoEstado = ?, idUsuarioFinalizador = ? WHERE idReclamo = ?', [nuevoEstado, req.user.idUsuario, id]);
        if (result.affectedRows === 0) {
            return res.status(404).json({ message: 'Reclamo no encontrado' });
        }

        res.status(200).json({ message: 'Reclamo atendido con éxito' });
    } catch (error) {
        res.status(500).json({ message: 'Error al atender el reclamo', error: error.message });
    }
};

// Listar Reclamos Atendidos
const listarReclamosAtendidos = async (req, res) => {
    const idEmpleado = req.user.idUsuario; 

    try {
        const [reclamos] = await db.query('SELECT * FROM reclamos WHERE idUsuarioFinalizador = ?', [idEmpleado]);

        if (reclamos.length === 0) {
            return res.status(404).json({ message: 'No hay reclamos atendidos por este empleado' });
        }

        res.status(200).json(reclamos);
    } catch (error) {
        console.error('Error al listar reclamos atendidos:', error); 
        res.status(500).json({ message: 'Error al listar reclamos atendidos', error: error.message });
    }
};

// Listar Reclamos por Oficina
const listarReclamosPorOficina = async (req, res) => {
    const idUsuario = req.user.idUsuario;

    try {
        const [oficinas] = await db.query('SELECT idOficina FROM usuarios_oficinas WHERE idUsuario = ? AND activo = 1', [idUsuario]);

        if (!oficinas || oficinas.length === 0) {
            return res.status(404).json({ message: 'Oficina no encontrada para el usuario' });
        }

        const idOficina = oficinas[0].idOficina;
        const [reclamos] = await db.query('SELECT * FROM reclamos WHERE idOficina = ?', [idOficina]);

        res.status(200).json(reclamos);
    } catch (error) {
        res.status(500).json({ message: 'Error al listar reclamos', error: error.message });
    }
};

module.exports = {
    login,
    atenderReclamo,
    listarReclamosAtendidos, 
    listarReclamosPorOficina
};
