module.exports = {
    isLoggedIn(req, res, next){
        if(req.isAuthenticated()){//si existe usuario
            return next();
        } else {
            return res.redirect('/loginUser');
        }
    },
    isNotLoggedIn(req, res, next){
        if(!req.isAuthenticated()){//si existe usuario
            return next();
        } else {
            return res.redirect('/profile');
        }
    },
    isLoggedInAdmin(req, res, next){
        if(req.session.admin){
            return next()
        } else {
            return res.redirect('/loginAdmin');
        }
    },

    isLoggedNotInAdmin(req, res, next){
        if(!req.session.admin){
            return next()
        } else {
            return res.redirect('/profileAdmin');
        }
    }
}