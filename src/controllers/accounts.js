const Account = require('../models/accounts');

module.exports.createAccount = (req, res, next) => {
    const args = [req.body.alias];
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

module.exports.getAccounts = (req, res, next) => {
    Account.fetchAll()
        .then((result) => {
            res.status(200).json({valid: true, data: result.rows})
        })
        .catch((e) => res.status(400).json({valid: false, message: e}));
}