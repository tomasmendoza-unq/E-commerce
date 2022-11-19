function productosEnElCarrito(){
    return localStorage.carrito ? JSON.parse(localStorage.carrito).length:0;
  
  }
  
  
  
  
  botonesComprar = document.querySelectorAll(".addToCart");
  botonesComprar = document.querySelectorAll(".addToCart");
  let numeroCarrito = document.querySelector(".carrito-numero")
  let valor = document.querySelector(".valor")
  let cantidad = Number(valor.value)
  let decrementar = document.querySelector(".decrementar")
  let aumentar = document.querySelector(".aumento")


  
  numeroCarrito.innerText = productosEnElCarrito()
  
  botonesComprar.forEach(boton => {
    
    boton.addEventListener("click", (e)=>{
  
  
  
      if(localStorage.carrito){
        //Que hacer si ya existe el carrito
        let carrito = JSON.parse(localStorage.carrito)
  
        let index = (carrito.findIndex(prod=>prod.id == e.target.dataset.id));
  
        //si el producto esta en el carrito le sumo uno
        if(index != -1){
          carrito[index].cantidad += cantidad;
        } else {
          carrito.push({id: e.target.dataset.id,cantidad: cantidad})
        }
        localStorage.setItem('carrito',JSON.stringify(carrito))
  
        console.log(index)
      } else {
        localStorage.setItem(
          "carrito",
          JSON.stringify([{id: e.target.dataset.id,cantidad: cantidad}])
        );
      }
      toastr["success"]('Se agrego este producto al carrito')
      numeroCarrito.innerText = productosEnElCarrito()
    });
  });
  
  decrementar.addEventListener ("click", (e) => {
    if ( cantidad > 0){
      cantidad -= 1
      valor.value = cantidad
    }
  })

  aumentar.addEventListener ("click", () => {
      cantidad += 1
      valor.value = cantidad
  })
