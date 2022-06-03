const connectionPool = require ('../database/databaseConnect');

const getCompatibleQuestions = async (req,res) =>
{
    var {exam_code, teacher_login} = req.body;

    exam_code = parseInt(exam_code);

    const response = await connectionPool.query(`select p.codigo_pregunta , p.enunciado  from pregunta p 
    join tema t on t.codigo_tema = p.codigo_tema 
    join (select codigo_docente, codigo_examen from examen e where e.codigo_docente = $1 and e.codigo_examen=$2) e on e.codigo_docente  = p.codigo_docente
    join examen_tema et on et.codigo_examen = e.codigo_examen and et.codigo_tema = t.codigo_tema
    full join pregunta_examen pe on pe.codigo_examen = e.codigo_examen and pe.codigo_pregunta = p.codigo_pregunta
    where pe.codigo_pregunta is null and pe.codigo_examen is null
    group by p.codigo_pregunta`,[teacher_login,exam_code]);

    if(response.rows.length < 1)
    {
        res.status(204)
        return res.send('No compatible questions found');
    }
    
    res.status(200).json(response.rows);
}

module.exports=
{
    getCompatibleQuestions,
}