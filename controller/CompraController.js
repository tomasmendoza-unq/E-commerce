const { Model, DataTypes } = require("sequelize");
const sequelize = require("../db/Connection.js");

const { productos } = require("../models/Productos");

async function compra(req, res) {
  let product = await productos.findByPk(req.params.id);

  let relacionado = await productos.findAll({
    where: {
      categoria: product.categoria,
    },
    offset: 0,
    limit: 4,
  });

  res.render("compra", { product, res, relacionado });
}

module.exports = {
  compra: compra,
};
