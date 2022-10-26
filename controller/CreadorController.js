const { Model, DataTypes,} = require('sequelize');
const sequelize = require('../db/Connection.js');

const multer  = require('multer')
const {productos} = require('../models/Productos')
const path = require('path')

function creador(req, res){
    res.render('creador')
}

var destino = ""

const storage = multer.diskStorage({
    destination : 'public/img/productos/',
    filename: (req, file, cb) => {
        destino = 'img/productos/'+file.originalname
        console.log(file)
        cb("",file.originalname);
    },
});

var upload = multer({storage: storage, 
    fileFilter : (req, file, cb) => {    
        const filetypes = /jpeg|jpg|png|gif/
        const extname =  filetypes.test(path.extname(file.originalname).toLowerCase());
        // Check mime
        const mimetype = filetypes.test(file.mimetype);
        if(mimetype && extname){
            return cb(null,true);
        } else {
            cb('Error: Images Only!');
        }
    }}).single("avatar");

async function create(req,res, file){
        const datos = req.body 
        console.log(destino)
        const product = await productos.create(
            { 
                nombre: datos.producto, 
                imagen: destino,
                precio: datos.precio
            });
        res.send("se subio correctamente el producto")
    }

module.exports={
    creador,
    create,
    upload
}