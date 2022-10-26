function productosEnElCarrito(){
  return localStorage.carrito ? JSON.parse(localStorage.carrito).length:0;

}

botonesComprar = document.querySelectorAll(".addToCart");
let numeroCarrito = document.querySelector(".carrito-numero")
numeroCarrito.innerText = productosEnElCarrito()

botonesComprar.forEach(boton => {
  
  boton.addEventListener("click", (e)=>{



    if(localStorage.carrito){
      //Que hacer si ya existe el carrito
      let carrito = JSON.parse(localStorage.carrito)

      let index = (carrito.findIndex(prod=>prod.id == e.target.dataset.id));

      //si el producto esta en el carrito le sumo uno
      if(index != -1){
        carrito[index].cantidad++;
      } else {
        carrito.push({id: e.target.dataset.id,cantidad: 1})
      }
      localStorage.setItem('carrito',JSON.stringify(carrito))

      console.log(index)
    } else {
      localStorage.setItem(
        "carrito",
        JSON.stringify([{id: e.target.dataset.id,cantidad: 1}])
      );
    }
    toastr["success"]('Se agrego este producto al carrito')
    numeroCarrito.innerText = productosEnElCarrito()
  });
});