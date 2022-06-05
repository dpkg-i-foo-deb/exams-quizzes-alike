const { Router } = require('express');
const router = Router();

const {getQuestionOptions} = require('../services/optionService');

router.post('/get-options',getQuestionOptions);


module.exports = router;