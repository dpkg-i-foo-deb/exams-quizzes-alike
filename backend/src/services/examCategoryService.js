const connectionPool = require ('../database/databaseConnect');

const getCategories = async (req,res) =>
{
    const response = await connectionPool.query('SELECT codigo_categoria, descripcion FROM categoria_examen');
    res.status(200).json(response.rows);
}

module.exports=
{
    getCategories,
}