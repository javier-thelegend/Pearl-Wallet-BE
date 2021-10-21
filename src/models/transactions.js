const pgdb = require('../util/database');

const Transaction = {};

Transaction.create = (args) => {
    // console.log(args);
    const bindings = [...args]; //Avoid SQL Injections
    const SQL_CREATE_TRANSACTION = `insert into transactions(transaction_type, category, account, amount, 
                                                                created_at, reason, balance, transfer_account)
                                    values($1, $2, $3, $4, $7, $5, $6, $8)`;
    return pgdb.query(SQL_CREATE_TRANSACTION, bindings);
}

module.exports = Transaction;