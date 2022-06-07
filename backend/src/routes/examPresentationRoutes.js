const { Router } = require('express');
const router = Router();

const {getPresentation, createPresentation, setPresentationQuestion, getPresentationQuestion, getExamQuestionCode} = require('../services/examPresentationService');

router.post('/get-presentation',getPresentation);
router.post('/create-presentation',createPresentation);
router.post('/set-presentation-question',setPresentationQuestion);
router.post('/get-presentation-question',getPresentationQuestion);
router.post('/get-exam-question-code',getExamQuestionCode);

module.exports = router;