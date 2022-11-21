const { Model, DataTypes } = require("sequelize");
const sequelize = require("../db/Connection.js");
const { ordenes } = require("../models/Orden.js");

module.exports = {
  order: async function (req, res) {
    let order = await ordenes.findByPk(req.params.id, {
      include: ordenes.ordenesItem,
    });
    return res.render("orden", { order, res });
  },
};
