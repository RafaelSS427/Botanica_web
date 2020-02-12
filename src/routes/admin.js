const express = require('express');
const routes = express.Router();
const passport = require('passport');
const multer = require('multer');

const pool = require('../database');

// storage almacena la ruta donde se guardará la foto del paciente
var storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, './src/public/img/productos/');
    },
    filename: function (req, file, cb) {
        //al nombre original de la foto se le antepone la fecha actual
        cb(null, Date.now() + file.originalname);
    }
});

var storageC = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, './src/public/img/categorias/');
    },
    filename: function (req, file, cb) {
        //al nombre original de la foto se le antepone la fecha actual
        cb(null, Date.now() + file.originalname);
    }
});

// la variable upload almacena la ruta con la imagen precargada.
var uploadP = multer({ storage: storage });
var uploadC = multer({ storage: storageC });
// upload.single recibe como parametro el nombre de la foto

const { isNotLoggedIn, isLoggedInAdmin } = require('../lib/keyRoutes');

routes.get('/loginAdmin', isNotLoggedIn, (req, res) => {//Lleva al usuaio al login del administrador
    res.render('logs/loginAdmin');
});

routes.post('/loginAdmin', (req, res, next) => {
    passport.authenticate('local.loginAdmin', {
        successRedirect: '/profileAdmin',
        failureRedirect: '/loginAdmin',
        failureFlash: true
    })(req, res, next);
});


routes.get('/registroAdmin', /*isLoggedInAdmin,*/(req, res) => {//Agregar nuevo administrador
    res.render('logs/registroAdmin');
});

routes.post('/registroAdmin', passport.authenticate('local.registroAdmin', {
    successRedirect: '/profileAdmin',
    failureRedirect: '/registroAdmin',
    failureFlash: true
}));

routes.get('/cerrarSessionAdmin', (req, res) => {
    req.session.destroy();
    //req.logOut();
    res.redirect('loginAdmin');
});

routes.get('/profileAdmin', isLoggedInAdmin, (req, res) => {
    res.render('profileAdmin');
});

/*RUTAS DEL CRUD DE ACCESO DE ADMINISTRADOR*/

/*Productos*/
routes.get('/agregarProducto', isLoggedInAdmin, async (req, res) => {
    const categorias = await pool.query('SELECT id_cp, nombre_cp FROM categoria_producto');
    res.render('vistasAdmin/agregarProducto', { categorias });
});

/*PRODUCTOS*/
routes.post('/agregarProducto', uploadP.single('imagen_producto'), async (req, res) => {
    console.log(req.file);
    if (req.file === undefined) {
        req.body.imagen_producto = req.body.temp;
    } else {
        req.body.imagen_producto = req.file.filename;
    }

    console.log(req.body);
    const { nombre_producto, caracteristica_producto, precio, imagen_producto, id_cp2 } = req.body;

    const newProducto = {
        nombre_producto,
        caracteristica_producto,
        precio,
        imagen_producto,
        id_cp2
    }

    await pool.query('INSERT INTO producto SET ?', [newProducto]);
    //res.send('recibido');
    
    req.flash('message', '¡Producto agregado!');
    res.redirect('/listaProductos');//Aun no existe
});

routes.get('/listaProductos', isLoggedInAdmin, async (req, res) => {
    const producto = await pool.query('SELECT * FROM producto');
    const categorias = await pool.query('SELECT id_cp, nombre_cp FROM categoria_producto');
    console.log(producto);
    res.render('vistasAdmin/listaProductos', { producto, categorias });
});

routes.get('/eliminarProducto/:id', isLoggedInAdmin, async (req, res) => {
    const id_producto = req.params.id;
    await pool.query('DELETE FROM producto WHERE id_producto = ?', [id_producto]);
    
    req.flash('message', '¡Producto eliminado!');
    res.redirect('/listaProductos');
});

routes.get('/editarProducto/:id', isLoggedInAdmin, async (req, res) => {
    const id_producto = req.params.id;
    const producto = await pool.query('SELECT * FROM get_producto WHERE id_producto = ?', [id_producto]);
    const categorias = await pool.query('SELECT id_cp, nombre_cp FROM categoria_producto');

    console.log(producto);

    res.render('vistasAdmin/editarProducto', { producto: producto[0], categorias });
});

routes.post('/editarProducto/:id', uploadP.single('imagen_productoE'), async (req, res) => {
    const id_producto = req.params.id;

    console.log(req.file);
    if (req.file === undefined) {
        req.body.imagen_productoE = req.body.temp;
    } else {
        req.body.imagen_productoE = req.file.filename;

    }


    console.log('DESDE POST', req.body);
    const { nombre_producto, caracteristica_producto, precio, imagen_productoE, id_cp2 } = req.body;

    const valueProducto = {
        nombre_producto,
        caracteristica_producto,
        precio,
        imagen_producto: imagen_productoE,
        id_cp2
    };

    await pool.query('UPDATE producto SET ? WHERE id_producto = ?', [valueProducto, id_producto]);
    req.flash('message', '¡Producto actualizado correctamente!');

    res.redirect('/listaProductos');
});

routes.post('/consultaCategoria', async (req, res) => {
    console.log(req.body);
    const {id_cp2} = req.body;

    if(id_cp2 == 0){
        const producto = await pool.query('SELECT * FROM producto'); 
        const categorias = await pool.query('SELECT * FROM categoria_producto');
        res.render('vistasAdmin/listaProductos', {producto, categorias});
    } else {
        const producto = await pool.query('SELECT * FROM producto WHERE id_cp2 = ?', [id_cp2]);
        const categorias = await pool.query('SELECT * FROM categoria_producto');
        res.render('vistasAdmin/listaProductos', {producto, categorias});
    }
});

/*CATEGORIAS*/
routes.get('/agregarCategoria', isLoggedInAdmin, async (req, res) => {
    res.render('vistasAdmin/agregarCategoria');
});

routes.post('/agregarCategoria', uploadC.single('foto_cp'), async (req, res) => {
    console.log(req.file);
    if (req.file === undefined) {
        req.body.foto_cp = req.body.temp;
    } else {
        req.body.foto_cp = req.file.filename;
    }
    console.log(req.body);
    const { nombre_cp, desc_cp, foto_cp } = req.body;

    const newCategoria = {
        nombre_cp,
        desc_cp,
        foto_cp
    };

    await pool.query('INSERT INTO categoria_producto SET ?', [newCategoria]);

    req.flash('message', '¡Nueva Categoria agregada!');
    res.redirect('/listaCategorias');
});

routes.get('/listaCategorias', isLoggedInAdmin, async (req, res) => {
    const categorias = await pool.query('SELECT * FROM categoria_producto');
    res.render('vistasAdmin/listaCategorias', {categorias});
});

routes.get('/eliminarCategoria/:id',isLoggedInAdmin, async (req, res) => {
    const id_cp = req.params.id;
    await pool.query('DELETE FROM categoria_producto WHERE id_cp = ?', [id_cp]);
    req.flash('message', '¡Categoria eliminada!');
    res.redirect('/listaCategorias');
});

routes.get('/editarCategoria/:id', isLoggedInAdmin, async  (req, res) => {
    const id_cp = req.params.id;
    const categoria = await pool.query('SELECT * FROM categoria_producto WHERE id_cp = ?', [id_cp]); 
    console.log(categoria);
    res.render('vistasAdmin/editarCategoria',{categoria: categoria[0]});
});

routes.post('/editarCategoria/:id', uploadC.single('foto_cpE'), async (req, res) => {
    const id_cp = req.params.id;
    console.log(id_cp);

    console.log(req.file);
    if (req.file === undefined) {
        req.body.foto_cpE = req.body.tempC;
    } else {
        req.body.foto_cpE = req.file.filename;
    }

    const {nombre_cp, desc_cp, foto_cpE} = req.body;

    const valueCat = {
        nombre_cp,
        desc_cp,
        foto_cp:foto_cpE
    };

    await pool.query('UPDATE categoria_producto SET ? WHERE id_cp = ?', [valueCat, id_cp]);
    
    req.flash('message', '¡Categoria editada!');
    res.redirect('/listaCategorias');
});

module.exports = routes;