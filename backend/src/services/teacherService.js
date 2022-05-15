const connectionPool = require ('../database/databaseConnect');

const getTeachers = async (req, res) =>
{
    const response = await connectionPool.query('SELECT login_persona FROM docente');
    res.status(200).json(response.rows);
}

const isTeacher = async (req,res) =>
{
    const { login } = req.body;
    
    const response = await connectionPool.query('SELECT login_persona FROM docente WHERE login_persona = $1',[login]);

    if(response.rows.length < 1)
    {
        res.status(204)
        return res.send('No such teacher found');
    }

    res.json(response.rows).status(200);
}

module.exports=
{
    getTeachers,
    isTeacher
}