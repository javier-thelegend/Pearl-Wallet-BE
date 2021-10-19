const express = require("express");

const router = express.Router();

const { 
    createTransaction, 
} = require('../controllers/transactions');

router.post('/transaction', createTransaction);

module.exports = router;