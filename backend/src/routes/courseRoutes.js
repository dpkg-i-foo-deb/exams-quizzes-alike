const { Router } = require('express');
const router = Router();

const { getCoursesByTeacher } = require('../services/courseService')

router.post('/courses-by-teacher',getCoursesByTeacher);

module.exports = router;