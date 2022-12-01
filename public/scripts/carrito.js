function setcarritoVacio() {
  tbody.innerHTML = `
          <div class="alert alert-warning my-2 text-center">No tienes productos en el carrito</div>        
  `;
}

function vaciarCarrito() {
  localStorage.removeItem("carrito");
}

function calcularTotal(products) {
  return products.reduce(
    (acum, products) => (acum += products.precio * products.cantidad),
    0
  );
}

let cartRows = document.querySelector(".cart");
let tbody = document.querySelector(".tbody");

let productos = [];

if (localStorage.carrito) {
  let carrito = JSON.parse(localStorage.carrito);

  carrito.forEach((item, index) => {
    fetch(`/product/${item.id}`)
      .then((res) => res.json())
      .then((product) => {
        if (product) {
          cartRows.innerHTML += `        
                  <div class="d-block d-md-flex mt-5">
                    <img
                      class="imagen-carrito m-2"
                      src="${product.imagen}"
                      alt=""
                    />
                    <div class="row">
                      <div
                        class="descripcion col-lg-5 col-md-9 col-9 order-lg-1 order-1 mt-2 mx-3"
                      >
                        <h4 class="fs-md-3 fs-5 mb-3">Nombre</h4>
                        <p class="fs-6">
                          ${product.nombre}
                        </p>
                      </div>
                      <div
                        class="cantidad valor col-lg-1 col-md-4 col-3 order-lg-2 order-3 mx-5"
                      >
                        <p class="ms-3" >Cantidad</p>
                        <center>
                        <div class="aumentar d-flex content-justify-center ms-5">
                          <input type="text" value="${item.cantidad}" disabled/>
                        </div>
                        </center>
                      </div>
                      <div
                        class="precio col-lg-1 col-md-4 col-3 order-lg-3 order-4 mt-5 mx-4 fs-md-2 fs-4"
                      >
                        $${parseFloat(
                          product.precio * item.cantidad,
                          2
                        ).toFixed(2)}
                      </div>
                    </div>
                  </div>`;
          productos.push({
            productId: item.id,
            nombre: product.nombre,
            precio: product.precio,
            cantidad: item.cantidad,
          });
        } else {
          //si no esta el producto lo borra del local storage
          carrito.splice(index, 1);
          localStorage.setItem("carrito");
        }
      })
      .then(() => {
        document.querySelector(".total").innerText = `$ ${calcularTotal(
          productos
        )}`;
      });
  });
} else {
  setcarritoVacio();
}

//compra

let checkoutCart = document.querySelector("#cheackoutCart");
if (localStorage.carrito) {
  checkoutCart.onsubmit = (e) => {
    e.preventDefault();
    const formData = {
      ordenItems: productos,
      metodoDePago: checkoutCart.paymentMethod.value,
      puntoDeEncuentro: checkoutCart.punto.value,
      total: calcularTotal(productos),
    };
    console.log(JSON.stringify(formData));
    fetch("/checkout", {
      method: "POST",
      body: JSON.stringify(formData),
      headers: {
        "Content-Type": "application/json",
      },
    })
      .then((r) => r.json())
      .then((res) => {
        if (res.ok) {
          vaciarCarrito();
          toastr["success"]("Su orden fue recibida ");
        }
      });
  };
}

let vaciar = document.querySelector(".vaciar");

if (localStorage.carrito) {
  vaciar.addEventListener("click", () => {
    vaciarCarrito();
    window.location.reload();
  });
}
