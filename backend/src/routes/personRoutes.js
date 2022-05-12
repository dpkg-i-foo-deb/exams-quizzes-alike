const { Router } = require('express');
const router = Router();

//We add the methods we defined on the controllers
const { getUsers, login } = require('../services/peopleService');

router.get('/users', getUsers);
router.post('/login',login);


module.exports = router;