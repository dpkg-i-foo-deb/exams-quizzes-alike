const connection = require('pg')
const USER = 'institucion'
const DATABASE = 'institucion'
const PASSWORD = 'institucion'
const HOST = 'localhost'
const PORT = '5432'

let config = 
{
    host: HOST,
    user: USER,
    password: PASSWORD,
    database: DATABASE,
    port: PORT,
}

let connectionPool = new connection.Pool(config);

module.exports = connectionPool;