const express = require("express");

const router = express.Router();

const { 
    createTransaction,
    getTransactionsByFilters
} = require('../controllers/transactions');

router.post('/transaction', createTransaction);

router.get('/transaction', getTransactionsByFilters);

module.exports = router;