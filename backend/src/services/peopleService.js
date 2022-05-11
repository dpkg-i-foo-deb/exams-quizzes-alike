const connectionPool = require ('../database/databaseConnect');

const getUsers = async (req, res) =>
{
    const response = await connectionPool.query('SELECT nombre FROM persona');
    res.status(200).json(response.rows);
}

module.exports=
{
    getUsers
}