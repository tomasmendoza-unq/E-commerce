const { Model, DataTypes } = require("sequelize");
const sequelize = require("../db/Connection.js");

const { usuarios } = require("../models/Usuario.js");

const { productos } = require("../models/Productos");

authMiddleware = (req, res, next) => {
  if (!req.session.user) {
    return res.render("login", { res });
  } else {
    next();
  }
};

sessionMiddleware = async (req, res, next) => {
  let producto = await productos.findAll({ offset: 0, limit: 9 });
  res.locals.producto = producto;

  res.locals.userFound = false;
  let user;
  if (req.session && req.session.user) {
    res.locals.userFound = true;
    res.locals.userLogged = req.session.user;
    if (req.session.user === 1) {
      res.locals.userAdmin = true;
    }
  } else {
    if (req.session.user) {
      user = await usuarios.findOne({
        where: { id_usuario: req.session.user },
      });
    }

    if (user) {
      res.locals.userFound = true;
      res.locals.userLogged = user;
    }
  }
  next();
};

module.exports = {
  authMiddleware,
  sessionMiddleware,
};
