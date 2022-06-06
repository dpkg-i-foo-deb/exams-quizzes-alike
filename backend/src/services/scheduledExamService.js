const connectionPool = require ('../database/databaseConnect');

const getScheduledExams = async (req,res) =>
{
    var{course_code} = req.body;

    const response = await connectionPool.query('SELECT codigo_curso_examen, codigo_examen, codigo_curso, TO_CHAR(fecha_presentacion , \'YYYY/MM/DD HH24:MM:SS\') as fecha_presentacion FROM curso_examen c WHERE c.codigo_curso=$1',[course_code]);
    res.status(200).json(response.rows);
}

const getAvailableExams = async (req,res) =>
{
    var {course_code} = req.body;

    course_code = parseInt(course_code);

    const response = await connectionPool.query(`	SELECT  e.codigo_examen, ce.codigo_curso, to_char((ce.fecha_presentacion + e.tiempo_limite),'YYYY-MM-DD HH24:MM:SS') fecha_maxima FROM curso_examen ce 
    JOIN (select e.codigo_examen codigo_examen ,e.tiempo_limite tiempo_limite  from examen e) e ON e.codigo_examen = ce.codigo_examen
                         WHERE NOW() > ce.fecha_presentacion and NOW() < (ce.fecha_presentacion + e.tiempo_limite)at TIME zone 'America/Bogota' AND ce.codigo_curso = $1
    GROUP BY e.codigo_examen ,ce.codigo_curso, ce.fecha_presentacion, e.tiempo_limite`,[course_code]);

    if(response.rows.length<1)
    {
        res.status(204);
        return res.send('No exams found');
    }
    res.status(200).json(response.rows);
   
}

module.exports=
{
    getScheduledExams,
    getAvailableExams,
}