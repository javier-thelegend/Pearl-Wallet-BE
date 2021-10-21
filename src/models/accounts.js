const pgdb = require('../util/database');

const Account = {};

Account.create = (args) => {
    const bindings = [...args]; //Avoid SQL Injections
    const SQL_CREATE_ACCOUNT = `insert into accounts(id, "user", account_type, balance, currency, bank, created_at)
                                values($1, $2, $3, $4, $5, $6, current_timestamp)`;
    return pgdb.query(SQL_CREATE_ACCOUNT, bindings);
    //resolve active .then in controller
    //reject active .catch in controller
    // return new Promise((resolve, reject) => resolve(true));
}

Account.findById = (args) => {
    const bindings = [...args]; //Avoid SQL Injections
    const SQL_SELECT_ACCOUNT = `select a.id as account,
                                    a_t.description as account_type,
                                    c.iso_code as currency,
                                    a.balance,
                                    b.description as bank,
                                    to_char(created_at, 'DD/MM/YYYY') as creation_date
                                from accounts a 
                                inner join catalogs a_t on a_t.id = a.account_type
                                inner join currencies c on c.id = a.currency
                                inner join catalogs b on b.id = a.bank
                                where a.id = $1`;
    return pgdb.query(SQL_SELECT_ACCOUNT, bindings);
    // return new Promise((resolve, reject) => resolve({rows:[]}));
}

Account.findTransactions = (args) => {
    const bindings = [...args]; //Avoid SQL Injections
    const SQL_SELECT_TRANSACTIONS_BY_ACC = `select t.account, 
                                                to_char(t.created_at, 'DD/MM/YYYY') transaction_date, 
                                                tt.description transaction_type,
                                                case 
                                                    when c.id = 17 then c.description || ' From: ' || t.transfer_account || ' Reason: ' || t.reason 
                                                    when c.id = 21 then c.description || ' To: ' || t.transfer_account || ' Reason: ' || t.reason
                                                else c.description end category, 
                                                t.amount,
                                                t.balance
                                            from transactions t
                                            inner join catalogs tt on tt.id = t.transaction_type
                                            inner join catalogs c on c.id = t.category 
                                            where t.account = $1`;
    return pgdb.query(SQL_SELECT_TRANSACTIONS_BY_ACC, bindings);
    //return new Promise((resolve, reject) => resolve({rows:[]}));
}

Account.findByUser = (args) => {
    const bindings = [...args]; //Avoid SQL Injections
    const SQL_SELECT_ACCOUNTS_BY_USER = `select a.id as account,
                                    a_t.description as account_type,
                                    c.iso_code as currency,
                                    c.id as currency_id,
                                    a.balance,
                                    b.description as bank,
                                    to_char(a.created_at, 'DD/MM/YYYY') as creation_date
                                from accounts a 
                                inner join catalogs a_t on a_t.id = a.account_type
                                inner join currencies c on c.id = a.currency
                                inner join catalogs b on b.id = a.bank
                                where a."user" = $1`;
    return pgdb.query(SQL_SELECT_ACCOUNTS_BY_USER, bindings);
    // return new Promise((resolve, reject) => resolve({rows:[]}));
}

Account.updateBalance = (args) => {
    const bindings = [...args]; //Avoid SQL Injections
    const SQL_UPDATE_BALANCE = `update accounts
                                set balance = $2
                                where id = $1`;
    return pgdb.query(SQL_UPDATE_BALANCE, bindings);
}

Account.update = (args) => {
    const bindings = [...args]; //Avoid SQL Injections
    const SQL_UPDATE_ACCOUNT = `update accounts
                                set account_type = $2, 
                                    currency = $3, 
                                    bank = $4
                                where id = $1`;
    return pgdb.query(SQL_UPDATE_ACCOUNT, bindings);
}

Account.delete = (args) => {
    const bindings = [...args]; //Avoid SQL Injections
    const SQL_DELETE_ACCOUNT = `delete from accounts where id = $1`;
    return pgdb.query(SQL_DELETE_ACCOUNT, bindings);
}

module.exports = Account;