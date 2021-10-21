const express = require("express");

const router = express.Router();

const { 
    createAccount,
    getAccount,
    getAccountTransactions,
    updateAccount,
    updateBalanceAccount,
    deleteAccount
} = require('../controllers/accounts');

router.post('/account', createAccount);

router.get('/account/:id/transactions', getAccountTransactions);

router.get('/account/:id', getAccount);

router.patch('/account/:id/balance', updateBalanceAccount);

router.patch('/account/:id', updateAccount);

router.delete('/account/:id', deleteAccount);

module.exports = router;