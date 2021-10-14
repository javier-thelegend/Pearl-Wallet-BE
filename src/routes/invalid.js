const express = require("express");

const router = express.Router();

router.use('/', (req, res, next) => {
    res.status(400).json({message: 'Not Found'});
});

module.exports = router;