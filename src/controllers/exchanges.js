const Exchange = require('../models/exchanges');

module.exports.createExchange = (req, res, next) => {
    const args = [req.body.source_currency, req.body.target_currency, req.body.equivalence];
    Exchange.create(args)
        .then(() => res.status(200).json({valid: true, message: 'Exchange Created!'}))
        .catch((e) => res.status(400).json({valid: false, message: e}));
}

module.exports.getExchange = (req, res, next) => {
    const args = [req.body.source_currency, req.body.target_currency];
    // console.log(args);
    Exchange.find(args)
        .then((result) => {
            res.status(200).json({valid: true, data: result.rows})
        })
        .catch((e) => res.status(400).json({valid: false, message: e}));
}