const express = require('express');
const routes = express.Router();

const pool = require('../database');

const {isLoggedInAdmin} = require('../lib/keyRoutes');

routes.get('/reporteGeneral', isLoggedInAdmin, async (req, res) => {
    let precioTotal = 0;

    const compras = await pool.query('SELECT id_compra, username_user, targeta_user, cedula_user, nombre_producto, precio, fecha_compra, nombre_cp FROM compras_estaticasdos ORDER BY id_cp2 ASC');

    for (const key in compras) {
        if (compras.hasOwnProperty(key)) {
            precioTotal += compras[key].precio;
        }
    }

    res.render('consultas/reporteGeneral', {compras, precioTotal});
});

routes.get('/productosMasVendidos', isLoggedInAdmin, async (req, res) => {
    const titulo = 'Productos Más Vendidos'
    const desc = 'Producto más vendido: '
    const compras = await pool.query('SELECT COUNT(nombre_producto) AS numero, nombre_producto FROM compras_estaticasdos GROUP BY nombre_producto ORDER BY COUNT(nombre_producto) DESC');

    const limit = await pool.query('SELECT COUNT(nombre_producto) AS numero, nombre_producto FROM compras_estaticasdos GROUP BY nombre_producto ORDER BY COUNT(nombre_producto) DESC LIMIT 1');

    console.log(limit[0]);

    console.log(compras);

    //res.send('Recibido');
    res.render('consultas/productosVendidos', {compras, limit: limit[0], desc, titulo});
});

routes.get('/productosMenosVendidos', isLoggedInAdmin, async (req, res) => {
    const titulo = 'Productos Menos Vendidos'
    const desc = 'Producto menos vendido: '
    const compras = await pool.query('SELECT COUNT(nombre_producto) AS numero, nombre_producto FROM compras_estaticasdos GROUP BY nombre_producto ORDER BY COUNT(nombre_producto) ASC');

    const limit = await pool.query('SELECT COUNT(nombre_producto) AS numero, nombre_producto FROM compras_estaticasdos GROUP BY nombre_producto ORDER BY COUNT(nombre_producto) ASC LIMIT 1');

    console.log(limit[0]);

    console.log(compras);

    //res.send('Recibido');
    res.render('consultas/productosVendidos', {compras, limit: limit[0], desc, titulo});

});


module.exports = routes;