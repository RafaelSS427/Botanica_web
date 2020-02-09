const passport = require('passport');
const LocalStrategy = require('passport-local').Strategy;

const pool = require('../database');
const helpers = require('../lib/helpers');
//login
passport.use('local.loginAdmin', new LocalStrategy({
    usernameField: 'username_admin',
    passwordField: 'pass_admin',
    passReqToCallback: true
}, async (req, username_admin, pass_admin, done) => {
    const rows = await pool.query('SELECT * FROM administradores WHERE username_admin = ?', [username_admin]);

    if(rows.length > 0){
        const admin = rows[0];
        console.log('OBJETO DEL ADMINISTRASOR ', admin);
        console.log('PASS POST: ', pass_admin);
        console.log('PASS HASH: ', admin.pass_admin);
        const validacion = await helpers.comparaContrasena(pass_admin, admin.pass_admin);
        console.log('VALIDACION', validacion);

        if(validacion){
            req.session.admin = true;
            done(null, admin, req.flash('message', '¡Welcome ' + admin.username_admin + '!'));
        } else {
            done(null, false, req.flash('message', '¡Contraseña invalida!'));
        }
    } else {
        return done(null, false, req.flash('message', '¡Username no existe!'));
    }
}));


//registro
passport.use('local.registroAdmin', new LocalStrategy({
    usernameField: 'username_admin',
    passwordField: 'pass_admin',
    passReqToCallback: true
}, async (req, username_admin, pass_admin, done) =>{

    const newAdmin = {
        username_admin, 
        pass_admin
    };

    newAdmin.pass_admin = await helpers.encriptarContrasena(pass_admin);

    const result = await pool.query('INSERT INTO administradores SET ?', [newAdmin]);
    newAdmin.id_admin = result.insertId;
    //codigo
    console.log(result);

    console.log('ONJETO DESDE PASSPOTR', newAdmin);

    return done(null, newAdmin);
}));

passport.serializeUser((admin, done) => { //guarda el usuario en una session
    done(null, admin.id_admin);
});

passport.deserializeUser(async (id_admin, done) => {
    const filas = await pool.query('SELECT * FROM administradores WHERE id_admin = ?', [id_admin]);
    done(null, filas[0]);
});

