const express = require("express");

const router = express.Router();

const { 
    createTransaction, 
    getTransactions 
} = require('../controllers/transactions');

router.post('/transaction', createTransaction);

router.get('/transaction', getTransactions);

module.exports = router;