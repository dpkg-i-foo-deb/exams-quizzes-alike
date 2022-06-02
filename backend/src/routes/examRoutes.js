const { Router } = require('express');
const router = Router();

const {createExam, setExamTopic,getExam} = require('../services/examService');

router.post('/create-exam',createExam);
router.post('/set-topic',setExamTopic);
router.post('/get-exam',getExam);

module.exports = router;