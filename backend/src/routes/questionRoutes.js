const { Router } = require('express');
const router = Router();

const {getCompatibleQuestions} = require('../services/questionService');

router.post('/compatible-questions',getCompatibleQuestions);

module.exports = router;