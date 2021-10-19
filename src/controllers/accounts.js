const Account = require('../models/accounts');

module.exports.createAccount = (req, res, next) => {
    const args = [req.body.account, 
                    req.user.uid, 
                    req.body.accountType, 
                    req.body.balance,
                    req.body.currency,
                    req.body.bank];
    Account.create(args)
        .then(() => res.status(200).json({valid: true, message: 'Account Created!'}))
        .catch((e) => res.status(400).json({valid: false, message: e}));
}

module.exports.getAccount = (req, res, next) => {
    const args = [req.params.id];
    Account.findById(args)
        .then((result) => {
            res.status(200).json({valid: true, data: result.rows})
        })
        .catch((e) => res.status(400).json({valid: false, message: e}));
}

module.exports.getAccountTransactions = (req, res, next) => {
    const args = [req.params.id];
    Account.findTransactions(args)
        .then((result) => {
            res.status(200).json({valid: true, data: result.rows})
        })
        .catch((e) => res.status(400).json({valid: false, message: e}));
}

module.exports.getAccountsByUser = (req, res, next) => {
    const args = [req.user.uid];
    Account.findByUser(args)
        .then((result) => {
            res.status(200).json({valid: true, data: result.rows})
        })
        .catch((e) => res.status(400).json({valid: false, message: e}));
}

module.exports.updateBalanceAccount = (req, res, next) => {
    const args = [req.params.id, req.body.balance];
    Account.updateBalance(args)
        .then(() => res.status(200).json({valid: true, message: 'Account Balance Updated!'}))
        .catch((e) => res.status(400).json({valid: false, message: e}));
}

module.exports.updateAccount = (req, res, next) => {
    const args = [req.params.id,
                    req.body.accountType,
                    req.body.currency,
                    req.body.bank];
    Account.update(args)
        .then(() => res.status(200).json({valid: true, message: 'Account Updated!'}))
        .catch((e) => res.status(400).json({valid: false, message: e}));
}