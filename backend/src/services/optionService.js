const connectionPool = require ('../database/databaseConnect');

const getQuestionOptions = async (req,res) =>
{
    const {question_code} = req.body;

    const response = await connectionPool.query(`select codigo_opcion ,descripcion,respuesta_correcta ,
        coalesce (palabra_faltante,'ninguna') palabra_faltante
        ,coalesce(orden,'ninguno') orden ,
        coalesce (pareja,'ninguna') pareja  from opcion o where codigo_opcion = $1`,[question_code]);

    if(response.rows.length<1)
    {
        res.status(204);
        return res.send('this question has no options');
    }

    res.status(200).json(response.rows);
}

module.exports=
{
    getQuestionOptions,
}