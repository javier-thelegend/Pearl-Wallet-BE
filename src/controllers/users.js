const User = require('../models/users');

module.exports.createUser = (req, res, next) => {
    // console.log(req.user);
    const args = [req.user.uid, req.user.email];
    User.create(args)
        .then(() => res.status(200).json({valid: true, message: 'User Created!'}))
        .catch((e) => res.status(400).json({valid: false, message: e}));
}