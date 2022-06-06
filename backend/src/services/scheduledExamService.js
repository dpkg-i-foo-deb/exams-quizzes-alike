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

    const response = await connectionPool.query(`select  e.codigo_examen, ce.codigo_curso, fm.tiempo_limite  from curso_examen ce 
	join (select e.codigo_examen codigo_examen ,e.tiempo_limite tiempo_limite  from examen e) e on e.codigo_examen = ce.codigo_examen
	join fechas_maximas fm on fm.codigo_curso_examen = ce.codigo_curso_examen 
	where now() > ce.fecha_presentacion  
	group by e.codigo_examen ,ce.codigo_curso, fm.tiempo_limite `);

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