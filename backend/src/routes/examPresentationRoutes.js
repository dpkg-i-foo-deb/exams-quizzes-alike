const { Router } = require('express');
const router = Router();

const {getPresentation, createPresentation} = require('../services/examPresentationService');

router.post('/get-presentation',getPresentation);
router.post('/create-presentation',createPresentation)

module.exports = router;