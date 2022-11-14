const { Model, DataTypes,} = require('sequelize');
const sequelize = require('../db/Connection.js');

const {productos} = require('../models/Productos')

async function compra(req, res) {
    let product = await productos.findByPk(req.params.id);
    res.render("compra", { product });
}

module.exports = {
    compra : compra
}