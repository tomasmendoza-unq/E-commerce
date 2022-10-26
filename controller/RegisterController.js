const { Model, DataTypes,} = require('sequelize');
const sequelize = require('../db/Connection.js');


const {usuarios} = require('../models/Usuario')
const {productos} = require('../models/Productos')

async function register(req, res) {
    if(req.session.user){
        let producto = await productos.findAll();

        let loggedin= true
        let log= {
            loggedin,
            productos: producto
        }
        res.render('register',log)
    }else{
        let producto = await productos.findAll();

        let log= {
            productos: producto
        }
        res.render('register',log )
    }
}

async function registrado(req, res) {
    const datos = req.body
    console.log(datos)
    const user = await usuarios.create(
        { 
            nombre: datos.nombre, 
            apellido: datos.apellido,
            contraseña: datos.contraseña,
            email: datos.email
        });
        let logg= true
        let log= {
            logg
        }
    res.render("register", log)
}


module.exports = {
    register: register,
    registrado: registrado
}
