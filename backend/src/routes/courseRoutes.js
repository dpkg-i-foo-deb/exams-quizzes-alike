const { Router } = require('express');
const router = Router();

const { getCoursesByTeacher, getCoursesByStudent, getCourse } = require('../services/courseService')

router.post('/courses-by-teacher',getCoursesByTeacher);
router.post('/courses-by-student',getCoursesByStudent);
router.post('/get-course',getCourse);

module.exports = router;