const { Sequelize } = require('sequelize');


const db = new Sequelize('e-commerce', 'root', '', {
  host: 'localhost',
  dialect: 'mysql',
  loggin: true
});

module.exports= db;