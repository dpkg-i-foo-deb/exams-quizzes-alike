const { Router } = require('express');
const router = Router();

const {getCategories} = require('../services/examCategoryService');

router.get('/exam-categories',getCategories);

module.exports=router;