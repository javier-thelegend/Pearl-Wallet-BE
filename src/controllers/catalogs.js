const Catalog = require('../models/catalogs');

module.exports.createCatalog = (req, res, next) => {
    const args = [req.body.description, req.body.parent_id];
    Catalog.create(args)
        .then(() => res.status(200).json({valid: true, message: 'Catalog Created!'}))
        .catch((e) => res.status(400).json({valid: false, message: e}));
}

module.exports.getCatalog = (req, res, next) => {
    const args = [req.params.id];
    Catalog.findById(args)
        .then((result) => {
            res.status(200).json({valid: true, data: result.rows})
        })
        .catch((e) => res.status(400).json({valid: false, message: e}));
}

module.exports.getCatalogByParent = (req, res, next) => {
    const args = [req.params.id];
    Catalog.findByParentId(args)
        .then((result) => {
            res.status(200).json({valid: true, data: result.rows})
        })
        .catch((e) => res.status(400).json({valid: false, message: e}));
}