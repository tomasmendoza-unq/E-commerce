const express = require("express");
const app = express();
const path = require("path");
const port = 8000;
const session = require("express-session");
const exphbs = require("express-handlebars");
const _handlebars = require("handlebars");

const {
  allowInsecurePrototypeAccess,
} = require("@handlebars/allow-prototype-access");

const homeController = require("./controller/HomeController");

const loginController = require("./controller/LoginController");
const registerController = require("./controller/RegisterController");

const ayudaController = require("./controller/Ayudacontroller");
const perfilController = require("./controller/PerfilController");
const compraController = require("./controller/CompraController");
const productosController = require("./controller/ProductosController");
const carritoController = require("./controller/CarritoController");
const creadorController = require("./controller/CreadorController");

const listaController = require("./controller/listaController");

const ordenController = require("./controller/ordenController");

const MiddlewareController = require("./controller/authMiddleware");

const apireset = require("./controller/apireset");

//configuracion

// Archivos estaticos
app.use(express.static(path.join(__dirname, "public")));

app.set("view engine", "hbs");

// Sesiones
app.use(
  session({
    secret: "pato",
    resave: false,
    saveUninitialized: true,
  })
);

app.use(express.urlencoded({ extended: false }));

app.engine(
  "hbs",
  exphbs.engine({
    defaultLayout: "main",
    layoutDir: path.join(__dirname, "views/layouts"),
    partialsDir: path.join(__dirname, "views/partials"),
    handlebars: allowInsecurePrototypeAccess(_handlebars),
    // helpers
    helpers: {
      foreach: function (ary, max, options) {
        if (!Array.isArray(arr)) {
          return [];
        }
        return arr.slice(0, limit);
      },
    },
  })
);

app.set("view engine", "hbs");

app.use(express.json());

app.use(MiddlewareController.sessionMiddleware);

//redirecciones

app.get("/", homeController.home);

app.get("/login", loginController.login);

app.post("/login", loginController.logeo, homeController.home);

app.get("/register", registerController.register);

app.post("/register", registerController.registrado);

//perfil

app.get(
  "/perfil",
  MiddlewareController.authMiddleware,
  perfilController.getAll
);

app.get(
  "/editar-perfil",
  MiddlewareController.authMiddleware,
  perfilController.editar
);

app.post("/editar", perfilController.update);

app.post("/delete/:id", perfilController.borrar, perfilController.getAll);

app.get("/logout", loginController.logout, homeController.home);

app.get("/ayuda", ayudaController.ayuda);

app.get("/lista", listaController.getAll);

// Productos

app.get("/compra/:id", compraController.compra);

app.get("/delete/:id", compraController.borrar);

app.get("/productos", productosController.getAll);

app.get("/categoria/:categoria", productosController.categoria);

app.get("/productos/:offset&:limit", productosController.paginacion);

app.get(
  "/carrito",
  MiddlewareController.authMiddleware,
  carritoController.carrito
);

app.get("/orden/:id", apireset.ordenItems);

//traer producto al carrito

app.post("/estado/:id", perfilController.proceso, perfilController.getAll);

app.get("/product/:id", apireset.product);

app.post("/checkout", apireset.checkout);

app.get("/creador", creadorController.creador);

app.post(
  "/files",
  creadorController.upload,
  creadorController.create,
  homeController.home
);

app.get("*", homeController.notfound);

app.listen(port);
console.log("Esta ejecutando el server: " + "http://localhost:" + port);
