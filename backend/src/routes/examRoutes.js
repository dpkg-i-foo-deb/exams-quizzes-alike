const { Router } = require('express');
const router = Router();

const {createExam, setExamTopic} = require('../services/examService');

router.post('/create-exam',createExam);
router.post('/set-topic',setExamTopic);

module.exports = router;