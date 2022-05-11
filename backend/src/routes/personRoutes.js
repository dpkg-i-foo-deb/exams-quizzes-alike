const { Router } = require('express');
const router = Router();

//We add the methods we defined on the controllers
const { getUsers } = require('../services/peopleService');

router.get('/users', getUsers);


module.exports = router;