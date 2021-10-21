const express = require("express");

const router = express.Router();

const { createExchange, getExchange } = require('../controllers/exchanges');

router.post('/exchange', createExchange);

router.get('/exchange/:source_currency/:target_currency', getExchange);

module.exports = router;