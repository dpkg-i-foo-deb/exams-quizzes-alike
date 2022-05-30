const { Router } = require('express');
const router = Router();

const {getCategories} = require('../services/examCategoryService');

router.get('/exams/categories',getCategories);

module.exports=router;