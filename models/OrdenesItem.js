const { Model, DataTypes} = require('sequelize');
const sequelize = require('../db/Connection');

const { ordenes } = require('../models/Orden.js');
const { productos } = require('../models/Productos.js');



class ordenesItem extends Model {}

ordenesItem.init({
    id: {
        type: DataTypes.INTEGER(),
        primaryKey: true,
        autoIncrement: true,
      },
    id_orden: DataTypes.STRING(),
    id_productos: DataTypes.STRING(),
    nombre: DataTypes.STRING(),
    precio: DataTypes.DECIMAL(),
    cantidad: DataTypes.INTEGER(),
},{
  sequelize, 
  modelName: 'ordenesItem' 
});

ordenesItem.associations = (models) =>{
  ordenesItem.ordenes = ordenesItem.belongsTo(ordenes, {as: "ordenes", foreignKey: 'id_orden'} );

  ordenesItem.productos = ordenesItem.belongsTo(productos, {as: 'productos', foreignKey: 'id_productos'});
  
}

module.exports = {
  ordenesItem
}