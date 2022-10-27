const { Model, DataTypes} = require('sequelize');
const sequelize = require('../db/Connection');

const { usuarios } = require('../models/Usuario');
const { ordenesitem } = require('../models/OrdenesItem')


class ordenes extends Model {}

ordenes.init({
    id_orden:{
        type:DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    id_usuario: DataTypes.INTEGER,
    total: DataTypes.INTEGER,
    metodoDePago: DataTypes.STRING,
    puntoDeEncuentro: DataTypes.STRING
},{
  sequelize, 
  modelName: 'ordenes' 
});

ordenes.associations = (models) => {
  ordenes.usuarios = ordenes.belongsTo(usuarios, {as: 'usuarios', foreignKey: 'id_usuario'});

  ordenes.ordenesItem= ordenes.hasMany(ordenesitems, {
      as: "ordenesitems",
    });
}


module.exports = {
    ordenes
};