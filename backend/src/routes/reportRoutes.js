const { Router } = require('express');
const { resourceLimits } = require('worker_threads');
const router = Router();


const {getExamReport} = require('../services/reportService');

router.get('/exam-report',getExamReport);

module.exports = router;