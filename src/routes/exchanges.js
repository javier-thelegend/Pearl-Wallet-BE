const express = require("express");

const router = express.Router();

const { createExchange, getExchange } = require('../controllers/exchanges');

router.post('/exchange', createExchange);

router.get('/exchange', getExchange);

module.exports = router;