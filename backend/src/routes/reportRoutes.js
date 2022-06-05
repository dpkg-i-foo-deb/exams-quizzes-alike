const { Router } = require('express');
const { resourceLimits } = require('worker_threads');
const router = Router();


const {getExamReport,getStudentExamReport} = require('../services/reportService');

router.get('/exam-report',getExamReport);
router.get('/student-exam-report',getStudentExamReport);

module.exports = router;