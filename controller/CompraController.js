const { Model, DataTypes,} = require('sequelize');
const sequelize = require('../db/Connection.js');

const {productos} = require('../models/Productos')

async function compra(req, res) {
    if(req.session.user){
        let producto = await productos.findAll();

        let loggedin= true
        let log= {
            loggedin,
            productos: producto
        }
        res.render('compra',log)
    }else{
        let producto = await productos.findAll();

        let log= {
            productos: producto
        }
        res.render('compra',log )
    }
}

module.exports = {
    compra : compra
}