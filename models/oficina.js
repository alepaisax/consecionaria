const bd = require('../config/bd');

class Oficina {
    static async crearOficina(datos) {
        const { nombre, idReclamoTipo } = datos;
        const [result] = await bd.query(
            'INSERT INTO oficinas (nombre, idReclamoTipo) VALUES (?, ?)', 
            [nombre, idReclamoTipo]
        );
        return result.insertId;
    }

    static async obtenerOficinaPorId(idOficina) {
        const [rows] = await bd.query('SELECT * FROM oficinas WHERE idOficina = ?', [idOficina]);
        return rows[0];
    }

    static async obtenerUsuariosPorOficina(idOficina) {
        const [rows] = await bd.query('SELECT * FROM usuarios_oficinas WHERE idOficina = ?', [idOficina]);
        return rows;
    }
}


module.exports = Oficina;
