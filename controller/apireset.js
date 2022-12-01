const { Model, DataTypes } = require("sequelize");
const sequelize = require("../db/Connection.js");

const { productos } = require("../models/Productos");
const { ordenes } = require("../models/Orden");
const { ordenesitems } = require("../models/OrdenesItem");

module.exports = {
  product: async function (req, res) {
    let product = await productos.findByPk(req.params.id);
    return res.json(product);
  },
  checkout: async function (req, res) {
    let data = req.body.ordenItems;
    console.log(data);
    let orden = await ordenes.create({
      ...req.body,
      id_usuario: req.session.user,
      estado: "En proceso",
    });
    for (let index = 0; index < data.length; index++) {
      let ordenitem = await ordenesitems.create({
        id_orden: orden.id_orden,
        id_productos: data[index].productId,
        nombre: data[index].nombre,
        precio: data[index].precio,
        cantidad: data[index].cantidad,
      });
    }

    res.json({ ok: true, status: 200, order: orden });
  },
  ordenItems: async function (req, res) {
    let orden = await ordenesitems.findAll({
      where: { id_orden: req.params.id },
    });
    return res.json(orden);
  },
};
