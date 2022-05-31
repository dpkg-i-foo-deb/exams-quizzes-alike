const { Router } = require('express');
const router = Router();

const { getTopics } = require('../services/topicService');

router.get('/topics',getTopics);

module.exports=router;