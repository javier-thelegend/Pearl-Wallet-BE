const express = require("express");

const router = express.Router();

const { createUser } = require('../controllers/users');

router.post('/user', createUser);

module.exports = router;