const connectionPool = require ('../database/databaseConnect');

const createExam = async (req,res) =>
{
    var { maxGrade, minGrade, weight, numbQuestions, name, description, limitTime, categoryCode, teacherEmail} = req.body; 
    
    maxGrade = parseInt(maxGrade);
    minGrade=parseInt(minGrade);
    weight=parseInt(weight);
    numbQuestions=parseInt(numbQuestions);
    categoryCode=parseInt(categoryCode);

    const response = await connectionPool.query('INSERT INTO examen (nota_maxima, nota_minima, peso_examen, cantidad_preguntas, nombre, descripcion, tiempo_limite, codigo_categoria, codigo_docente) VALUES ($1,$2,$3,$4,$5,$6,$7,$8,$9) RETURNING codigo_examen',[maxGrade, minGrade,weight, numbQuestions, name, description, limitTime, categoryCode, teacherEmail]);

    res.status(200).json(response.rows);
}

const setExamTopic = async (req, res) =>
{
    var { exam_code, topic_code } = req.body;

    exam_code = parseInt(exam_code);
    topic_code = parseInt(topic_code);

    const response = await connectionPool.query('INSERT INTO examen_tema (codigo_examen, codigo_tema) VALUES ($1,$2)',[exam_code,topic_code]);

    res.status(200);
    res.send('topic set successfully');
}

const scheduleExam = async (req,res) =>
{
    var {exam_code, course_code, date} = req.body;

    exam_code = parseInt(exam_code);
    course_code = parseInt(course_code);

    const response = await connectionPool.query('INSERT INTO curso_examen (codigo_examen, codigo_curso, fecha_presentacion) VALUES ($1,$2,$3)',[exam_code,course_code,date]);

    res.status(200);
    res.send('Exam scheduled successfully');
}

const getExam = async (req,res) =>
{
    var{ exam_code } = req.body;

    exam_code = parseInt(exam_code);

    const response = await connectionPool.query('SELECT codigo_examen, nota_maxima, nota_minima, peso_examen, cantidad_preguntas, nombre, descripcion, tiempo_limite, codigo_categoria, codigo_docente FROM examen WHERE codigo_examen = $1',[exam_code]);

    res.status(200).json(response.rows);
}

const getExams = async (req,res) =>
{
    var {teacher_login} = req.body;

    const response = await connectionPool.query('SELECT codigo_examen, nota_maxima, nota_minima, peso_examen, cantidad_preguntas, nombre, descripcion, tiempo_limite, codigo_categoria, codigo_docente FROM examen WHERE codigo_docente = $1',[teacher_login]);

    res.status(200).json(response.rows);
}

module.exports=
{
    createExam,
    setExamTopic,
    getExam,
    getExams,
    scheduleExam,
}