const express = require('express');
const { verifyToken } = require('../config/jwtMiddleware');
const empleadosController = require('../controllers/empleadosController');

const router = express.Router();

router.post('/login', empleadosController.login);
router.put('/reclamos/:id/atender', verifyToken([2]), empleadosController.atenderReclamo);
router.get('/reclamos', verifyToken([2]), empleadosController.listarReclamosPorOficina);
router.get('/reclamos/atendidos', verifyToken([2]), empleadosController.listarReclamosAtendidos);

module.exports = router;

