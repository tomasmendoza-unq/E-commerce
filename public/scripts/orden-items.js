let detalle = document.querySelectorAll("#detalles");
let container = document.querySelector(".modal-body");
let pre = document.querySelector(".pre");

detalle.forEach((element) => {
  element.addEventListener("click", (e) => {
    fetch(`/orden/${e.target.dataset.id}`)
      .then((res) => res.json())
      .then((orden) => {
        orden.forEach((element) => {
          fetch(`/product/${element.id_productos}`)
            .then((res) => res.json())
            .then((product) => {
              console.log(orden);
              container.innerHTML += `                
              <div class="d-flex align-items-center mb-2">
              <div class="flex-shrink-0">
                <img src="${product.imagen}" width="150" alt="">
              </div>
              <div class="flex-grow-1 ms-3">
                <h2 class="fs-5" id="titulo">${product.nombre}</h2>
                <div class="d-flex">
                  <span class="fw-bold">Cantidad adquirida:</span>
                  <p class="cantidad-comprada"> ${element.cantidad}</p>
                </div>
                <div class="d-flex">
                  <span class="fw-bold">Precio: ${product.precio}</span>
                </div>
              </div>
              </div>
              <hr>
                <div class="d-flex justify-content-between">
                  <h2 class="fs-5">Subtotal: </h2>
                  <h2 class="fs-5">$${element.precio * element.cantidad}</h2>
                </div>

                <div class="d-flex justify-content-between">
                  <h2 class="fs-5">Costo de envío</h2>
                  <h2 class="fs-5">$3000</h2>
                </div>

                <div class="d-flex justify-content-between">
                  <h4 class="fs-4 fw-bold">Total:</h4>
                  <p class="fs-5 fw-bold">$${
                    element.precio * element.cantidad + 3000
                  }</p>
                </div>
                <hr>
              `;
            });
        });
      });
  });
});

function limpiar() {
  container.innerHTML = "";
}
