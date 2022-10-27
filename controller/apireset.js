const { Model, DataTypes,} = require('sequelize');
const sequelize = require('../db/Connection.js');

const {productos} = require('../models/Productos')
const {ordenes} = require('../models/Orden')
const {ordenesitems} = require('../models/OrdenesItem')

module.exports= {
    product: async function (req,res){
        let product = await productos.findByPk(req.params.id);
        return res.json(product);
    },
    checkout: async function (req, res) {
      let data = req.body.ordenItems
      console.log(data)
        let orden = await ordenes.create(
          { ...req.body, id_usuario: req.session.user }
        );
        let ordenitem = await ordenesitems.create(
          {
            nombre: data[0].nombre,
            precio: data[0].precio,
            cantidad: data[0].cantidad
          },
        );
        res.json({ ok: true, status: 200, order: orden });
        res.send("se realizo la compra")
      },
}