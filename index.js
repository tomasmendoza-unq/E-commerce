const express = require('express')
const homeController = require('./controller/homeController')
const loginController = require('./controller/LoginController')
const app = express()
const port = 8000



app.use( express.static('public'))


//redirecciones

app.get('/', homeController.home )

app.get('/', loginController.login)

app.get('*', homeController.notfound)


app.listen(port)
console.log("Esta ejecutando el server: " + "http://localhost:"+port)

