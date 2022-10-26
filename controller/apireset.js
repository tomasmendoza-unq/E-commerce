const { Model, DataTypes,} = require('sequelize');
const sequelize = require('../db/Connection.js');

const {productos} = require('../models/Productos')
const {ordenes} = require('../models/Orden')
const {ordenesItem} = require('../models/OrdenesItem')

module.exports= {
    product: async function (req,res){
        let product = await productos.findByPk(req.params.id);
        return res.json(product);
    },
    checkout: async function (req, res) {
        // return res.send({ ...req.body, userId: req.session.userLogged.id });
        let orden = await ordenes.create(
          { ...req.body, id_usuario: req.session.user },
          {
            include: ordenes.ordenesItem,
          }
        );
        res.json({ ok: true, status: 200, order: orden });
      },
}