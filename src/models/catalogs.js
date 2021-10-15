const pgdb = require('../util/database');

const Catalog = {};

Catalog.create = (args) => {
    const bindings = [...args]; //Avoid SQL Injections
    const SQL_CREATE_CATALOG = `insert into catalogs(description, parent_id) values($1, $2)`;
    return pgdb.query(SQL_CREATE_CATALOG, bindings);
}

Catalog.findById = (args) => {
    const bindings = [...args]; //Avoid SQL Injections
    const SQL_SELECT_CATALOG = `select id, description, parent_id from catalogs c where c.id = $1`;
    return pgdb.query(SQL_SELECT_CATALOG, bindings);
}

Catalog.findByParentId = (args) => {
    const bindings = [...args]; //Avoid SQL Injections
    const SQL_SELECT_CATALOG_BY_PARENT_ID = `select id, description, parent_id from catalogs c where c.parent_id = $1`;
    return pgdb.query(SQL_SELECT_CATALOG_BY_PARENT_ID, bindings);
}

module.exports = Catalog;