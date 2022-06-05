const connectionPool = require ('../database/databaseConnect');

const getTopics=async (req,res)=>
{
    const response = await connectionPool.query('SELECT codigo_tema, descripcion, codigo_unidad FROM tema');
    res.status(200).json(response.rows);
}

module.exports=
{
    getTopics,
}