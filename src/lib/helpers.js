const bcrypt = require('bcryptjs');



const helpers = {};

helpers.encriptarContrasena = async (pass) => {
    const salt = await bcrypt.genSalt(10); // genera hash, se ejecuta 10 veces, más veces más seguro el cifrado, toma tiempo(es asyncrono)
    const hash = await bcrypt.hash(pass, salt);
    return hash;
};

helpers.comparaContrasena = async (pass, savePass) => {
    try {
        return await bcrypt.compare(pass, savePass);
    } catch (e) {
        console.log(e);
    }
}

module.exports = helpers;

