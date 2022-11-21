const { Model, DataTypes } = require("sequelize");
const sequelize = require("../db/Connection.js");

const { usuarios } = require("../models/Usuario");

async function register(req, res) {
  if (req.session.user) {
    res.redirect("index");
  } else {
    res.render("register", { res });
  }
}

async function registrado(req, res) {
  const datos = req.body;

  const user = await usuarios.create({
    nombre: datos.nombre,
    apellido: datos.apellido,
    contraseña: datos.contraseña,
    email: datos.email,
  });
  let logg = true;

  res.render("register", { logg, res });
}

module.exports = {
  register: register,
  registrado: registrado,
};
