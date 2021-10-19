const express = require("express");

const router = express.Router();

const { createUser } = require('../controllers/users');
const { getAccountsByUser } = require('../controllers/accounts');

router.post('/user', createUser);

router.get('/user/:id/accounts', getAccountsByUser);

module.exports = router;