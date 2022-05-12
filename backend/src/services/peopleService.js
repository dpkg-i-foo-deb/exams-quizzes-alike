const connectionPool = require ('../database/databaseConnect');

const getUsers = async (req, res) =>
{
    const response = await connectionPool.query('SELECT nombre FROM persona');
    res.status(200).json(response.rows);
}

const login = async (req, res) =>
{
    const { username,password } = req.body;

    const response = await connectionPool.query('SELECT nombre, login FROM persona WHERE login = $1 AND password = $2', [username,password]);
    res.status(200).json(response.rows);
}

module.exports=
{
    getUsers,
    login
}