const express = require("express");

const router = express.Router();

const { 
    createAccount,
    getAccount,
    getAccountTransactions,
    updateAccount,
    updateBalanceAccount
} = require('../controllers/accounts');

router.post('/account', createAccount);

router.get('/account/:id/transactions', getAccountTransactions);

router.get('/account/:id', getAccount);

router.patch('/account/:id/balance', updateBalanceAccount);

router.patch('/account/:id', updateAccount);

module.exports = router;