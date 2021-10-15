const express = require("express");

const router = express.Router();

const { createCatalog, getCatalog, getCatalogByParent } = require('../controllers/catalogs');

router.post('/catalog', createCatalog);

router.get('/catalog/:id', getCatalog);

router.get('/catalog/:id/detail', getCatalogByParent);

module.exports = router;