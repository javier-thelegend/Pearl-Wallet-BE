const express = require("express");

const router = express.Router();

const { 
    createAccount,
    getAccount,
    getAccounts,
    getAccountTransactions,
    updateAccount
} = require('../controllers/accounts');

router.post('/account', createAccount);

router.get('/account/:id', getAccount);

router.get('/account/:id/transactions', getAccountTransactions);

router.get('/account', getAccounts);

router.patch('/account/:id', updateAccount);

module.exports = router;