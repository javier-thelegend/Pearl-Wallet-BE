const Transaction = require('../models/transactions');

module.exports.createTransaction = (req, res, next) => {
    // console.log(req.user);
    const args = [req.body.transaction_type, 
                    req.body.category,
                    req.body.account,
                    req.body.amount,
                    req.body.reason,
                    req.body.balance,
                    req.body.created_at,
                    req.body.transfer_account];
    // console.log(args);
    Transaction.create(args)
        .then(() => res.status(200).json({valid: true, message: 'Transaction Created!'}))
        .catch((e) => res.status(400).json({valid: false, message: e}));
}