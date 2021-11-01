const pgdb = require('../util/database');

const Currency = {};

Currency.create = (args) => {
    const bindings = [...args]; //Avoid SQL Injections
    const SQL_CREATE_CURRENCY = `insert into currencies(description, iso_code, created_at) values($1, $2, CURRENT_TIMESTAMP)`;
    return pgdb.query(SQL_CREATE_CURRENCY, bindings);
}

Currency.findById = (args) => {
    const bindings = [...args]; //Avoid SQL Injections
    const SQL_SELECT_CURRENCY = `select id, description, iso_code, to_char(created_at, 'DD/MM/YYYY') created_at 
                                from currencies
                                where id = $1`;
    return pgdb.query(SQL_SELECT_CURRENCY, bindings);
}

Currency.fetchAll = () => {
    const SQL_SELECT_CURRENCIES = `select id, description, iso_code from currencies order by id asc`;
    return pgdb.query(SQL_SELECT_CURRENCIES);
}

module.exports = Currency;