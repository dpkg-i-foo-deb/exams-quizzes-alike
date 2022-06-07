const connectionPool = require ('../database/databaseConnect');

const createPresentation = async (req,res)=>
{
    var{course_student_code, exam_code, grade, date,time} = req.body;

    var ip = req.ip;
    ip = ip.toString();

    const response = await connectionPool.query(`INSERT INTO presentacion_examen (
        codigo_matricula,codigo_examen,nota_examen,fecha_presentacion,tiempo_presentacion,ip) VALUES ($1,$2,$3,$4,$5,$6)
         RETURNING codigo_matricula, codigo_examen, nota_examen, codigo_presentacion, fecha_presentacion, tiempo_presentacion, ip`,[course_student_code,exam_code,grade,date,time,ip])

    res.status(200).send(response.rows);
}

const getPresentation = async (req,res)=>
{
    var {code} = req.body;

    code = parseInt(code);

    const response = await connectionPool.query('SELECT codigo_matricula, codigo_examen, nota_examen, codigo_presentacion, fecha_presentacion, tiempo_presentacion, ip FROM presentacion_examen WHERE codigo_presentacion = $1',[code]);

    if(response.rows.length<1)
    {
        res.status(204);
        return res.send();
    }

    res.status(200).json(response.rows);
}


const setPresentationQuestion=async(req,res)=>
{
    var {presentation_code, exam_question_code,option_code,answer,option_description } = req.body;

    presentation_code = parseInt(presentation_code);

    const response = await connectionPool.query(`INSERT INTO pregunta_presentacion
    (codigo_presentacion, codigo_pregunta_examen, codigo_opcion, respuesta, descripcion_opcion)
    VALUES($1,$2,$3,$4,$5) RETURNING codigo_pregunta_presentacion,codigo_pregunta_examen, codigo_opcion, respuesta, descripcion_opcion`,[presentation_code,exam_question_code,option_code,answer,option_description]);

    if(response.rows.length<1){
        res.status(204);
        return res.send();
    }

    res.status(200).json(response.rows);
}

const getPresentationQuestion = async (req,res)=>
{
    var{code} = req.body;

    const response = await connectionPool.query(`SELECT 
    codigo_presentacion, codigo_pregunta_examen, codigo_pregunta_presentacion, codigo_opcion, respuesta, descripcion_opcion 
    FROM pregunta_presentacion p WHERE p.codigo_pregunta_presentacion = $1`,[code]);

    if(response.rows.length<1){
        res.status(204);
        return res.send();
    }

    res.status(200).json(response.rows);
}


const getExamQuestionCode = async (req,res)=>
{
    var{exam_code, question_code} = req.body;

    const response = await connectionPool.query(`SELECT codigo_pregunta_examen, codigo_pregunta, codigo_examen FROM pregunta_examen
    WHERE codigo_examen = $1 AND codigo_pregunta = $2`,[exam_code,question_code]);

    if(response.rows.length<1){
        res.status(204);
        return res.send();
    }

    res.status(200).json(response.rows);
}

module.exports=
{
    getPresentation,
    createPresentation,
    setPresentationQuestion,
    getPresentationQuestion,
    getExamQuestionCode,
}