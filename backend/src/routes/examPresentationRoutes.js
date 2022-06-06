const { Router } = require('express');
const router = Router();

const {getPresentation} = require('../services/examPresentationService');

router.post('/get-presentation',getPresentation);

module.exports = router;