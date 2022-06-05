const connectionPool = require ('../database/databaseConnect');

const getScheduledExams = async (req,res) =>
{
    var{course_code} = req.body;

    const response = await connectionPool.query('SELECT codigo_curso_examen, codigo_examen, codigo_curso, TO_CHAR(fecha_presentacion , \'YYYY/MM/DD HH24:MM:SS\') as fecha_presentacion FROM curso_examen c WHERE c.codigo_curso=$1',[course_code]);
    res.status(200).json(response.rows);
}

module.exports=
{
    getScheduledExams,
}