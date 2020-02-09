//Métodos de autenticación
const passport = require('passport');
const LocalStrategy = require('passport-local').Strategy;

const pool = require('../database');
const helpers = require('../lib/helpers');

/*CLIENTE LOG*/
passport.use('local.loginUser', new LocalStrategy({
    usernameField: 'username_user',
    passwordField: 'pass_user',
    passReqToCallback: true
}, async (req, username_user, pass_user, done) => {
    const filas = await pool.query('SELECT * FROM users WHERE username_user = ?', [username_user]);

    if(filas.length > 0){
        const user = filas[0];
        const validacion = await helpers.comparaContrasena(pass_user, user.pass_user);//retorna un true
        if(validacion){
            req.session.admin = false;
            done(null, user, req.flash('message', '¡Welcome ' + user.nombre_user + '!'));
        } else {
            done(null, false, req.flash('message', '¡Contraseña invalida!'));
        }
    } else {
        return done(null, false, req.flash('message', '¡Nombre de usuario no existe!'));
    }

}));

passport.use('local.newUser', new LocalStrategy({
    usernameField: 'username_user',
    passwordField: 'pass_user',
    passReqToCallback: true//permite el ingreso de otros datos
}, async (req, username_user, pass_user, done) => {

    const {nombre_user, apellido_user, targeta_user, dir_user, tel_user, cedula_user} = req.body;

    const newUser = {
        nombre_user,
        apellido_user,
        targeta_user,
        dir_user,
        tel_user,
        cedula_user,
        username_user,
        pass_user
    };

    newUser.pass_user = await helpers.encriptarContrasena(pass_user);

    const result = await pool.query('INSERT INTO users SET ?', [newUser]);
    newUser.id_user = result.insertId;

    return done(null, newUser);
    
}));

passport.serializeUser((user, done) => { //guarda el usuario en una session
    done(null, user.id_user);
});

passport.deserializeUser(async (id, done) => {
    const filas = await pool.query('SELECT * FROM users WHERE id_user = ?', [id]);
    done(null, filas[0]);
});