const { Router } = require('express');
const router = Router();

const {getCompatibleQuestions,getQuestion} = require('../services/questionService');

router.post('/compatible-questions',getCompatibleQuestions);
router.post('/get-question',getQuestion);

module.exports = router;