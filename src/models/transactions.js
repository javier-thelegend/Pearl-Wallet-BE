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

Transaction.findByFilters = (args) => {
    let SQL_GET_TRANSACTIONS = `select t.account, 
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
                                where t.account = '$1'`;    
    SQL_GET_TRANSACTIONS = SQL_GET_TRANSACTIONS.replace("$1", args[0]);
    if(args[1] != "") SQL_GET_TRANSACTIONS += " and t.created_at >= to_date('" + args[1] + "', 'YYYY-MM-DD')";
    if(args[2] != "") SQL_GET_TRANSACTIONS += " and t.created_at <= to_date('" + args[2] + "', 'YYYY-MM-DD')";    
    if(args[3] != "") SQL_GET_TRANSACTIONS += " and t.transaction_type = " + args[3];    
    return pgdb.query(SQL_GET_TRANSACTIONS);
}

module.exports = Transaction;