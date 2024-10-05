const bd = require('../config/bd');

class Reclamo {
    static async crearReclamo(datos, idUsuarioCreador) {
        const { asunto, descripcion, idReclamoTipo } = datos;
        const fechaCreado = new Date();
        const idReclamoEstado = 1; 

        await bd.query(
            'INSERT INTO reclamos (asunto, descripcion, fechaCreado, idReclamoEstado, idReclamoTipo, idUsuarioCreador) VALUES (?, ?, ?, ?, ?, ?)', 
            [asunto, descripcion, fechaCreado, idReclamoEstado, idReclamoTipo, idUsuarioCreador]
        );
    }

    static async obtenerReclamo(idReclamo, idUsuario) {
        const [rows] = await bd.query('SELECT * FROM reclamos WHERE idReclamo = ? AND idUsuarioCreador = ?', [idReclamo, idUsuario]);
        return rows[0];
    }

    static async cancelarReclamo(idReclamo, idUsuario) {
        const [result] = await bd.query(
            'UPDATE reclamos SET fechaCancelado = NOW() WHERE idReclamo = ? AND idUsuarioCreador = ? AND fechaCancelado IS NULL', 
            [idReclamo, idUsuario]
        );
        return result.affectedRows > 0; 
    }

    static async listarReclamosAtendidosPorEmpleado(idUsuario) {
        const query = `
            SELECT r.*
            FROM reclamos r
            WHERE r.idUsuarioFinalizador = ? AND r.fechaCancelado IS NULL
        `;
        const [result] = await bd.query(query, [idUsuario]);
        return result;
    }
}

module.exports = Reclamo;
