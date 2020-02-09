const express = require('express');
const routes = express.Router();

const pool = require('../database');

const {isLoggedNotInAdmin} = require('../lib/keyRoutes');

var idCategoriaProducto = null;

routes.get('/categorias', isLoggedNotInAdmin, async (req, res) => {
    const estado = true;
    const categorias = await pool.query('SELECT * FROM categoria_producto');
    console.log(categorias);
    res.render('links/categorias', {categorias, estado}); 
});

routes.get('/productos/:id', isLoggedNotInAdmin, async (req, res) => {
    var estado = false;
    const id = req.params.id;
    idCategoriaProducto = id;
    const producto = await pool.query('SELECT * FROM producto WHERE id_cp2 = ?', [id]);

    if(producto.length > 0){
        estado = true;
    }

    res.render('links/productosCat', {producto, estado});
});

routes.get('/compraProducto/:id', isLoggedNotInAdmin, async (req, res) => {
    const id_producto = req.params.id;//obtenemos el id del producto comprado
    const id_user = req.user.id_user;//obtenemos el id del usuario
    const newCompra = {
        id_user, 
        id_producto
    }
    const result = await pool.query('INSERT INTO compras_producto SET ?', [newCompra]);

    const idCompra = result.insertId;

    const consulta = await pool.query('SELECT * FROM get_compra_productos WHERE id_compra = ?', [idCompra]);

    const newInfo = consulta[0];

    await pool.query('INSERT INTO compras_estaticasdos SET ?', [newInfo]);
    //se agrega producto a una tabla junto con el id del usuario
    //console.log('Producto comprado: ', id);
    //console.log('Por el cliente: ', idCliente);
    req.flash('message', '¡Producto comprado!');
    res.redirect('../productos/' + idCategoriaProducto); //envia al cliente a la misma ventana
});

/*Buscador de productos*/
routes.post('/buscarProductos', isLoggedNotInAdmin, async (req, res) => {
    var estado = false;
    const {nameProd} = req.body;

    const producto = await pool.query("SELECT * FROM producto WHERE nombre_producto LIKE '%"+nameProd+"%'", );

    console.log(producto);

    //const producto = await pool.query('SELECT * FROM producto WHERE nombre_producto = ?', [nameProd]);

    if(producto.length > 0){
        estado = true;
    } 
    req.flash('message', 'Prodcuto no encontrado');
    res.render('links/productosCat', {producto, estado});

});

module.exports = routes;