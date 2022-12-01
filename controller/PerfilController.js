const { Model, DataTypes } = require("sequelize");
const sequelize = require("../db/Connection.js");

const { usuarios } = require("../models/Usuario.js");
const { ordenes } = require("../models/Orden.js");
const { ordenesitems } = require("../models/Ordenesitem.js");

async function getAll(req, res, next) {
  let Usuarios = await usuarios.findOne({
    where: { id_usuario: req.session.user },
  });

  let order;

  if (res.locals.userAdmin) {
    order = await ordenes.findAll({
      model: usuarios,
      as: "usuarios",
      where: {
        estado: "En proceso",
      },
    });
  } else {
    order = await ordenes.findAll({
      model: usuarios,
      as: "usuarios",
      where: {
        id_usuario: req.session.user,
        estado: "En proceso",
      },
    });
  }

  res.render("perfil", { Usuarios, res, order });
}

async function editar(req, res) {
  let Usuarios = await usuarios.findOne({
    where: { id_usuario: req.session.user },
  });

  res.render("perfil-editar", { res, Usuarios });
}

async function ordenitems(req, res) {
  let orderitems = await ordenesitems.findAll({
    where: {
      id_orden: req.params.id,
    },
  });
  console.log(orderitems);
}

async function update(req, res) {
  const datos = req.body;
  let Usuarios = await usuarios.findOne({
    where: { id_usuario: req.session.user },
  });
  if (datos.contra !== Usuarios.contraseña) {
    let logge = true;

    res.render("perfil-editar", { logge, Usuarios, res });
  } else {
    const use = await Usuarios.update(
      {
        nombre: datos.nombre,
        apellido: datos.apellido,
        contraseña: datos.contrasena,
        email: datos.correo,
        telefono: datos.telefono,
      },
      {
        where: { id_usuario: req.session.user },
      }
    );
    let log = true;

    res.render("perfil-editar", { log, Usuarios, res });
  }
}

async function proceso(req, res, next) {
  const datos = req.body;

  let order = await ordenes.update(
    {
      estado: datos.estado,
    },
    {
      where: { id_orden: req.params.id },
    }
  );

  next();
}

async function borrar(req, res, next) {
  await ordenes.destroy({
    where: {
      id_orden: req.params.id,
    },
  });
  next();
}

module.exports = {
  getAll,
  editar,
  update,
  ordenitems,
  proceso,
  borrar,
};
