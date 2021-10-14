const pgdb = require('../util/database');

const User = {};

User.create = (args) => {
    const bindings = [...args]; //Avoid SQL Injections
    const SQL_CREATE_USER = `insert into users(id, user_name, created_at) values($1, $2, CURRENT_TIMESTAMP)`;
    return pgdb.query(SQL_CREATE_USER, bindings);
}

module.exports = User;