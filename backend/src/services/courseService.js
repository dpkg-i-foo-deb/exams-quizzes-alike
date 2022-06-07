const connectionPool = require ('../database/databaseConnect');

const getCoursesByTeacher = async (req,res) =>
{
    const { login } = req.body;

    const response = await connectionPool.query('SELECT codigo_curso, descripcion, codigo_docente FROM curso WHERE codigo_docente = $1',[login]);

    if(response.rows.length <1)
    {
        res.status(204);
        return res.send('The teacher has no courses');
    }

    res.json(response.rows).status(200);
}

const getCoursesByStudent = async (req,res) =>
{
    const {login} = req.body;

    const response = await connectionPool.query('SELECT codigo_estudiante, codigo_curso, codigo_matricula FROM curso_estudiante WHERE codigo_estudiante=$1',[login]);

    if(response.rows.length<1)
    {
        return res.status(204).send();
    }

    res.json(response.rows).status(200);
}

const getCourse = async (req,res) =>
{
    var {course_code}=req.body;

    course_code = parseInt(course_code);

    const response = await connectionPool.query('SELECT codigo_curso, descripcion, codigo_docente FROM curso WHERE codigo_curso = $1',[course_code]);

    if(response.rows.length<1)
    {
        return res.status(204).send();
    }

    res.json(response.rows).status(200);
}

module.exports=
{
    getCoursesByTeacher,
    getCoursesByStudent,
    getCourse,
}