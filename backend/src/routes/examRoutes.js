const { Router } = require('express');
const router = Router();

const {createExam, setExamTopic,getExam, getExams} = require('../services/examService');

router.post('/create-exam',createExam);
router.post('/set-topic',setExamTopic);
router.post('/get-exam',getExam);
router.post('/exams',getExams);

module.exports = router;