const { response } = require('express');
const connectionPool = require ('../database/databaseConnect');

const getExamReport = async (req, res) =>
{
    const response = await connectionPool.query('SELECT codigo_curso_examen, nombre_examen, cantidad_preguntas_respondidas, cantidad_respuestas_correctas, cantidad_respuestas_incorrectas, promedio_notas_examen, nota_maxima, nota_minima FROM reporte_examenes');

    if(response.rows.length  < 1)
    {
        res.status(204);
        return res.send('No available reports');
    }

    res.status(200).json(response.rows);
}

const getStudentExamReport = async (req, res) =>
{
    const response = await connectionPool.query('SELECT login, nombre, codigo_presentacion, preguntas_respondidas, respuestas_correctas, respuestas_incorrectas, porcentaje_correctas, porcentaje_correctas FROM reporte_por_presentacion');

    if(response.rows.length<1)
    {
        res.status(204)
        return res.send('No available reports');
    }

    res.status(200).json(response.rows);
}

module.exports = 
{
    getExamReport,
    getStudentExamReport,
}