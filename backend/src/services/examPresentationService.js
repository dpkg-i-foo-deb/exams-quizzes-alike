const connectionPool = require ('../database/databaseConnect');

const createPresentation = async (req,res)=>
{
    var{course_student_code, code, grade, date,time, ip} = req.body;

    //INSERT INTO public.presentacion_examen (codigo_matricula,codigo_examen,nota_examen,fecha_presentacion,tiempo_presentacion,ip)
	//VALUES (1,1,0,'2022-02-23','00:00:00','192.168.1.1');

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

module.exports=
{
    getPresentation,
}