const { Router } = require('express');
const router = Router();

const {createExam} = require('../services/examService');

router.post('/create-exam',createExam);

module.exports = router;