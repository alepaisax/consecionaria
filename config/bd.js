const mysql = require('mysql2/promise');

const pool = mysql.createPool({
    host: 'localhost',
    user: 'root',
    password: 'root1234',
    database: 'concesionaria',
});

module.exports = pool;
