const { Model, DataTypes} = require('sequelize');
const sequelize = require('../db/Connection');

class usuarios extends Model {}

usuarios.init({
    id_usuario:{
        type:DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    nombre: DataTypes.STRING,
    apellido: DataTypes.STRING,
    email: DataTypes.STRING,
    contraseña: DataTypes.STRING,
},{
  sequelize, 
  modelName: 'usuarios' 
});



module.exports = {
  usuarios
};