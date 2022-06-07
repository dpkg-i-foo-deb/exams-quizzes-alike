const { Router } = require('express');
const { resourceLimits } = require('worker_threads');
const router = Router();

const {getScheduledExams, getAvailableExams} = require('../services/scheduledExamService');

router.post('/scheduled-exams',getScheduledExams);
router.post('/available-exams',getAvailableExams);

module.exports = router;