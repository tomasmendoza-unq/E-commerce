const { Model, DataTypes,} = require('sequelize');
const sequelize = require('../db/Connection.js');
const { usuarios } = require('../models/Usuario.js');


async function getAll(req, res,next) {
    let Usuarios = await usuarios.findOne({ where: {id_usuario: req.session.user} });

    let data = {
        Usuarios
    }
    res.render('perfil',data)
}



module.exports = {
    getAll
};