const express = require('express');
const morgan = require('morgan');
const flash = require('connect-flash');
const path = require('path');
const exphbs = require('express-handlebars');
const session = require('express-session');
const MySQLStorage = require('express-mysql-session');
const passport = require('passport');

const { database } = require('./keys');

const app = express();
require('./lib/passport');
require('./lib/passportAdmin');

//settings
app.set('port', process.env.PORT || 3000);
app.set('views', path.join(__dirname, 'views'));

app.engine('.hbs', exphbs({
    defaultLayout: 'main',
    layoutsDir: path.join(app.get('views'), 'layouts'),
    partialsDir: path.join(app.get('views'), 'partials'),
    extname: '.hbs',
    helpers: require('./lib/handlebars')
}));

app.set('view engine', '.hbs');


//midlewars
app.use(session({
    secret: 'plantas_caribe_sql',
    resave: false,
    saveUninitialized: false,
    store: new MySQLStorage(database)
}));
app.use(flash());
app.use(morgan('dev'));
app.use(express.urlencoded({ extended: false }));
app.use(express.json());
app.use(passport.initialize());
app.use(passport.session());


//variables globales
app.use((req, res, next) => {
    app.locals.message = req.flash('message');
    app.locals.user = req.user;
    //req.session.admin = false;
    app.locals.admin = req.session.admin;
    console.log("EXISTE ADMIN: ", app.locals.admin);
    next();
});

//routes
app.use(require('./routes'));
app.use(require('./routes/linksCategorias'));
app.use(require('./routes/users'));
app.use(require('./routes/admin'));
app.use(require('./routes/consultasAdmin'));

//public
app.use(express.static(path.join(__dirname, 'public')));

//server
app.listen(app.get('port'), () => {
    console.log('Servidor en el puerto ', app.get('port'));
});