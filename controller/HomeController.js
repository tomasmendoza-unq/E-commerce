const { Model, DataTypes } = require("sequelize");
const sequelize = require("../db/Connection.js");

const { productos } = require("../models/Productos");

async function Home(req, res) {
  let producto = await productos.findAll({
    offset: 0,
    limit: 6,
    where: { destacado: true },
  });

  res.render("index", { res, producto });
}

function notfound(req, res) {
  res.render("not-found-page", { res });
}

module.exports = {
  home: Home,
  notfound,
};
