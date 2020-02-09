const {format} = require('timeago.js');
const helpers = {};

const nombreLocal = 'PlantasCaribe';
var valor = false;
var usuario = false;
var admin = false;

helpers.parsearFecha = (fecha) =>{
    return format(fecha);
}

helpers.title = () => {
    return nombreLocal;
}

helpers.guardarValor = (dato) =>{
    valor = dato;
    console.log(valor);
}

helpers.obtenerValor = () => {
    return valor;
}

helpers.existeUsuario = (dato) =>{
    usuario = dato;
}

helpers.obtenerValorUsuario = () => {
    return usuario;
}

helpers.getExisteAdmin = () => {
    return admin;
}

helpers.existeAdmin = (dato) => {
    admin = dato;
}


module.exports = helpers;