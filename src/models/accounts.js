const pgdb = require('../util/database');

const Account = {};

Account.create = (args) => {
    const bindings = [...args]; //Avoid SQL Injections
    const SQL_CREATE_ACCOUNT = `insert into accounts(id, "user", account_type, balance, currency, bank, created_at)
                                values($1, $2, $3, $4, $5, $6, current_date)`;
    return pgdb.query(SQL_CREATE_ACCOUNT, bindings);
    //resolve active .then in controller
    //reject active .catch in controller
    // return new Promise((resolve, reject) => resolve(true));
}

Account.findById = (args) => {
    const bindings = [...args]; //Avoid SQL Injections
    const SQL_SELECT_ACCOUNT = `select a.id as account,
                                    a_t.description as account_type,
                                    c.abbreviation as currency,
                                    a.balance,
                                    b.description as bank,
                                    to_char(created_at, 'DD/MM/YYYY') as creation_date
                                from accounts a 
                                inner join catalog_details a_t on a_t.id = a.account_type and a_t."catalog" = 1
                                inner join currencies c on c.id = a.currency
                                inner join catalog_details b on b.id = a.bank and b."catalog" = 2
                                where a.id = $1`;
    return pgdb.query(SQL_SELECT_ACCOUNT, bindings);
    // return new Promise((resolve, reject) => resolve({rows:[]}));
}

Account.fetchAll = () => {
    const SQL_SELECT_ACCOUNTS = `select a.id as account,
                                    a_t.description as account_type,
                                    c.abbreviation as currency,
                                    a.balance,
                                    b.description as bank,
                                    to_char(created_at, 'DD/MM/YYYY') as creation_date
                                from accounts a 
                                inner join catalog_details a_t on a_t.id = a.account_type and a_t."catalog" = 1
                                inner join currencies c on c.id = a.currency
                                inner join catalog_details b on b.id = a.bank and b."catalog" = 2`;
    return pgdb.query(SQL_SELECT_ACCOUNTS);
    // return new Promise((resolve, reject) => resolve({rows:[]}));
}

module.exports = Account;