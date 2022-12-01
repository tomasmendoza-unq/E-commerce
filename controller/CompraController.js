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

  res.render("compra", { product, res, relacionado, req });
}

async function borrar(req, res, next) {
  if (res.locals.userAdmin) {
    await productos.destroy({
      where: {
        id_producto: req.params.id,
      },
    });

    next();
  } else {
    next();
  }
}

module.exports = {
  compra: compra,
  borrar: borrar,
};
