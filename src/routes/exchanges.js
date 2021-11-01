const express = require("express");

const router = express.Router();

const { createExchange, getExchange, getExchangeByCurrency } = require('../controllers/exchanges');

router.post('/exchange', createExchange);

router.get('/exchange/:currency', getExchangeByCurrency);

router.get('/exchange/:source_currency/:target_currency', getExchange);

module.exports = router;