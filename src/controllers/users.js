const User = require('../models/users');

module.exports.createCurrency = (req, res, next) => {
    const args = [req.body.uid, req.body.user_name];
    User.create(args)
        .then(() => res.status(200).json({valid: true, message: 'User Created!'}))
        .catch((e) => res.status(400).json({valid: false, message: e}));
}