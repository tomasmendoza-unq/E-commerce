const { Model, DataTypes} = require('sequelize');
const sequelize = require('../db/Connection');

class productos extends Model {}

productos.init({
    id_producto:{
        type:DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    nombre: DataTypes.STRING,
    imagen: DataTypes.STRING,
    precio: DataTypes.INTEGER,
    detalles: DataTypes.INTEGER,
    categoria: DataTypes.STRING,
    destacado: DataTypes.TINYINT
},{
  sequelize, 
  modelName: 'productos' 
});




module.exports = {
  productos
};