const { Router } = require('express');
const { resourceLimits } = require('worker_threads');
const router = Router();

const {getScheduledExams} = require('../services/scheduledExamService');

router.post('/scheduled-exams',getScheduledExams);

module.exports = router;