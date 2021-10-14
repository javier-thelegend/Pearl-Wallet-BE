const express = require("express");

const router = express.Router();

const { 
    createCurrency, 
    getCurrency,
    getCurrencies 
} = require('../controllers/currencies');

router.post('/currency', createCurrency);

router.get('/currency/:id', getCurrency);

router.get('/currency', getCurrencies);

module.exports = router;