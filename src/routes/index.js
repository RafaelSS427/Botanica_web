const express = require('express');
const routes = express.Router();

const {isLoggedNotInAdmin} = require('../lib/keyRoutes');

routes.get('/', isLoggedNotInAdmin, (req, res) => {
    const estado = false;
    res.render('links/bienvenida', {estado});
});

module.exports = routes;