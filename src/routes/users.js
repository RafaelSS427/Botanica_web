const express = require('express');
const routes = express.Router();
const passport = require('passport');

const pool = require('../database');

const {isLoggedIn, isNotLoggedIn, isLoggedNotInAdmin} = require('../lib/keyRoutes');

routes.get('/registroUsuario', isLoggedNotInAdmin, isNotLoggedIn, (req, res) => {
    res.render('logs/registroUsuario');
});

routes.post('/registroUsuario', passport.authenticate('local.newUser', {
    successRedirect: '/',  //vista a la que irá al usuario si todo va bien
    failureRedirect: '/registroUsuario',
    failureFlash: true
}));

routes.get('/loginUser',  isLoggedNotInAdmin, isNotLoggedIn, (req, res) => {
    res.render('logs/loginUsuario');
});

routes.post('/loginUser', (req, res, next) => {
    passport.authenticate('local.loginUser', {
        successRedirect: '/',
        failureRedirect: '/loginUser',
        failureFlash: true
    })(req, res, next);
});

routes.get('/profile', isLoggedNotInAdmin , isLoggedIn, (req, res) => {
    const estado = false;
    res.render('profile', {estado});
});

routes.get('/cerrarSession',  isLoggedNotInAdmin, isLoggedIn, (req, res) => {
    req.session.destroy();
    //req.logOut();
    res.redirect('loginUser');
});

routes.get('/editarUser',  isLoggedNotInAdmin,  isLoggedIn, async (req, res) => {
    res.render('vistasCliente/editarUsuario');
});

routes.post('/editarUser/:id', async (req, res) => {
    const id_user = req.params.id;
    const {nombre_user, apellido_user, targeta_user, dir_user, tel_user, cedula_user} = req.body;
    const newUpdateUser = {
        nombre_user, 
        apellido_user,
        targeta_user, 
        dir_user,
        tel_user,
        cedula_user
    }
    await pool.query('UPDATE users SET ? WHERE id_user = ?', [newUpdateUser, id_user]);
    console.log(req.body);
    req.flash('message', '¡Información actualizada!');
    res.redirect('/profile');
});

routes.get('/comprasCliente',  isLoggedNotInAdmin,  isLoggedIn, async (req, res) => {
    const id_user = req.user.id_user;
    var precioTotal = 0;
    const compras = await pool.query('SELECT username_user, targeta_user, cedula_user, nombre_producto, precio, fecha_compra FROM compras_estaticasdos WHERE id_user = ?', [id_user]);
    console.log(compras);

    for (const key in compras) {
        if (compras.hasOwnProperty(key)) {
            precioTotal += compras[key].precio;
        }
    }

    console.log(precioTotal);

    res.render('vistasCliente/viewCompras', {compras, precioTotal});
});

module.exports = routes;