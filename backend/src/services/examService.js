const connectionPool = require ('../database/databaseConnect');

const createExam = async (req,res) =>
{
    var { maxGrade, minGrade, weight, numbQuestions, name, description, limitTime, categoryCode, teacherEmail} = req.body; 
    
    maxGrade = parseInt(maxGrade);
    minGrade=parseInt(minGrade);
    weight=parseInt(weight);
    numbQuestions=parseInt(numbQuestions);
    categoryCode=parseInt(categoryCode);

    const response = await connectionPool.query('INSERT INTO examen (nota_maxima, nota_minima, peso_examen, cantidad_preguntas, nombre, descripcion, tiempo_limite, codigo_categoria, codigo_docente) VALUES ($1,$2,$3,$4,$5,$6,$7,$8,$9)',[maxGrade, minGrade,weight, numbQuestions, name, description, limitTime, categoryCode, teacherEmail]);

    res.status(200);
    res.send('the exam was created successfully');
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

module.exports=
{
    createExam,
    setExamTopic,
}