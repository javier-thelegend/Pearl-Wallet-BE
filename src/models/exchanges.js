const pgdb = require('../util/database');

const Exchange = {};

Exchange.create = (args) => {
    const bindings = [...args]; //Avoid SQL Injections
    const SQL_CREATE_EXCHANGE = `insert into exchanges (id_source_currency, id_destin_currency, equivalence, creation_date)
                                values($1, $2, $3, CURRENT_TIMESTAMP)`;
    return pgdb.query(SQL_CREATE_EXCHANGE, bindings);
}

Exchange.find = (args) => {
    const bindings = [...args]; //Avoid SQL Injections
    const SQL_SELECT_EXCHANGE = `select s.description source_currency, e.equivalence, t.description target_currency
                                from exchanges e, 
                                    currencies s, 
                                    currencies t
                                where e.id_source_currency = s.id
                                and e.id_destin_currency = t.id
                                and s.id = $1 and t.id = $2`;
    return pgdb.query(SQL_SELECT_EXCHANGE, bindings);
}

Exchange.findBySourceCurrency = (args) => {
    const bindings = [...args]; //Avoid SQL Injections
    const SQL_SELECT_EXCHANGE = `select e.equivalence, t.description currency
                                from exchanges e, 
                                    currencies s, 
                                    currencies t
                                where e.id_source_currency = s.id
                                and e.id_destin_currency = t.id
                                and s.id = $1`;
    return pgdb.query(SQL_SELECT_EXCHANGE, bindings);
}

module.exports = Exchange;