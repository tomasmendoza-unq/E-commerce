const { Model, DataTypes} = require('sequelize');
const sequelize = require('../db/Connection.js');

const {usuarios} = require('../models/Usuario')

const {productos} = require('../models/Productos')


async function login(req, res) {
    if(req.session.user){
        let producto = await productos.findAll();

        let loggedin= true
        let log= {
            loggedin,
            productos: producto
        }
        res.render('login',log)
    }else{
        let producto = await productos.findAll();

        let log= {
            productos: producto
        }
        res.render('login',log )
    }
}

async function logeo(req, res){
    const datos = req.body;
    let user = await usuarios.findOne({ where: { email: datos.email} });

    if (!user) {
        let loggedin= true
        let log= {
            loggedin
        }
        res.render("login", log)
    }else if (datos.contraseña !== user.contraseña){
        let loggedin= true
        let log= {
            loggedin
        }
        res.render("login", log)
    }else{
        req.session.user= user.id_usuario;
        let loggedin= true
        let log= {
            loggedin
        }
        console.log(req.session.user);
        res.render("index", log)
    }
}


module.exports = {
    login : login,
    logeo : logeo

}