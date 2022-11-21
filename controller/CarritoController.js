async function carrito(req, res) {
  res.render("carrito", { res });
}

module.exports = {
  carrito: carrito,
};
