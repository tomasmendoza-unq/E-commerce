const { Model, DataTypes } = require("sequelize");
const sequelize = require("../db/Connection.js");

const { productos } = require("../models/Productos");

const multer = require("multer");
const path = require("path");

async function creador(req, res) {
  if (req.session.user === 1) {
    res.render("creador", { res });
  } else {
    res.render("index", { res });
  }
}

var destino = "";

const storage = multer.diskStorage({
  destination: "public/img/productos/",
  filename: (req, file, cb) => {
    destino = "img/productos/" + file.originalname;
    console.log(file);
    cb("", file.originalname);
  },
});

var upload = multer({
  storage: storage,
  fileFilter: (req, file, cb) => {
    const filetypes = /jpeg|jpg|png|gif/;
    const extname = filetypes.test(
      path.extname(file.originalname).toLowerCase()
    );
    // Check mime
    const mimetype = filetypes.test(file.mimetype);
    if (mimetype && extname) {
      return cb(null, true);
    } else {
      cb("Error: Images Only!");
    }
  },
}).single("avatar");

async function create(req, res, next) {
  const datos = req.body;

  const product = await productos.create({
    nombre: datos.producto,
    imagen: destino,
    precio: datos.precio,
    detalles: datos.detalles,
    categoria: datos.categoria,
    destacado: datos.destacado ? true : false,
  });
  next();
}

module.exports = {
  creador,
  create,
  upload,
};
