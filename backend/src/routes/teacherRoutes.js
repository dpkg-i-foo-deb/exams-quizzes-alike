const { Router } = require('express');
const router = Router();

const { getTeachers, isTeacher } = require ('../services/teacherService');

router.get('/teachers' ,getTeachers);
router.post('/is-teacher' ,isTeacher);


module.exports = router;