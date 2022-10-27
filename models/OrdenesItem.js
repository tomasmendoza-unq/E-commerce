const { Model, DataTypes} = require('sequelize');
const sequelize = require('../db/Connection');

const { ordenes } = require('../models/Orden.js');
const { productos } = require('../models/Productos.js');



class ordenesitems extends Model {}

ordenesitems.init({
    id: {
        type: DataTypes.INTEGER(),
        primaryKey: true,
        autoIncrement: true,
      },
    // id_orden: DataTypes.INTEGER(),
    // id_productos: DataTypes.INTEGER(),
    nombre: DataTypes.STRING(),
    precio: DataTypes.INTEGER(),
    cantidad: DataTypes.INTEGER(),
},{
  sequelize, 
  modelName: 'ordenesitems' 
});

ordenesitems.associations = (models) =>{
  ordenesitems.ordenes = ordenesitems.belongsTo(ordenes, {as: "ordenes", foreignKey: 'id_orden'} );

  ordenesitems.productos = ordenesitems.belongsTo(productos, {as: 'productos', foreignKey: 'id_productos'});
  
}

module.exports = {
  ordenesitems
}