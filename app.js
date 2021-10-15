const express = require('express');
const app = express();
const cors = require('cors')({origin: true});
const { server } = require('./src/config/config');
const guard = require('./src/guard/guard');

const accountsRoutes = require('./src/routes/accounts');
const currenciesRoutes = require('./src/routes/currencies');
const usersRoutes = require('./src/routes/users');
const exchangesRoutes = require('./src/routes/exchanges');
const catalogsRoutes = require('./src/routes/catalogs');
const badRequestRoutes = require('./src/routes/invalid');

//Allow requests from another servers
app.use(cors);

//Validate request is using token
app.use(guard);

//Middleware parse json to set it in body of req 
//example alias: req.body.<key> => alias: req.body.alias
app.use(express.json());
app.use(express.urlencoded({extended: false}));

//Routes
app.use(usersRoutes);
app.use(accountsRoutes);
app.use(currenciesRoutes);
app.use(exchangesRoutes);
app.use(catalogsRoutes);
app.use(badRequestRoutes);

app.listen(server.port, () => {
    console.log('Server Running in port : ' + server.port);
})