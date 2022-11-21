const { Model, DataTypes } = require("sequelize");
const sequelize = require("../db/Connection.js");

const { usuarios } = require("../models/Usuario.js");

async function getAll(req, res, next) {
  let Usuarios = await usuarios.findOne({
    where: { id_usuario: req.session.user },
  });

  res.render("perfil", { Usuarios, res });
}

function editar(req, res) {
  res.render("perfil-editar");
}

module.exports = {
  getAll,
  editar,
};
