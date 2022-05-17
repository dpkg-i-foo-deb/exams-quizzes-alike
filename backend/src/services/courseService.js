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

module.exports=
{
    getCoursesByTeacher,
}