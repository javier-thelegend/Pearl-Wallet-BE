const Currency = require('../models/currencies');

module.exports.createCurrency = (req, res, next) => {
    const args = [req.body.description, req.body.iso_code];
    Currency.create(args)
        .then(() => res.status(200).json({valid: true, message: 'Currency Created!'}))
        .catch((e) => res.status(400).json({valid: false, message: e}));
}

module.exports.getCurrency = (req, res, next) => {
    const args = [req.params.id];
    Currency.findById(args)
        .then((result) => {
            res.status(200).json({valid: true, data: result.rows})
        })
        .catch((e) => res.status(400).json({valid: false, message: e}));
}

module.exports.getCurrencies = (req, res, next) => {
    Currency.fetchAll()
        .then((result) => {
            res.status(200).json({valid: true, data: result.rows})
        })
        .catch((e) => res.status(400).json({valid: false, message: e}));
}