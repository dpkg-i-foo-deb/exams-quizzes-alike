const { Router } = require('express');
const router = Router();

const {getCompatibleQuestions,getQuestion, getExamQuestions} = require('../services/questionService');

router.post('/compatible-questions',getCompatibleQuestions);
router.post('/get-question',getQuestion);
router.post('/get-exam-questions',getExamQuestions);

module.exports = router;