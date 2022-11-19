let aumentar = document.querySelectorAll(".aumento");
let valor = document.querySelectorAll(".cantidad");
console.log("aumentar")

aumentar.forEach(boton => {

  let carrito = JSON.parse(localStorage.carrito)

  console.log(bonton)
  boton.addEventListener("click", (e)=>{

    console.log(e)


    let index = (carrito.findIndex(prod=>prod.id == e.target.dataset.id));
    
    console.log(index)
    //si el producto esta en el carrito le sumo uno
    if(index != -1){
      console.log(carrito[index].cantidad++);
      console.log(valor.value++);
    }

  });
});



let decrementar = document.querySelectorAll(".decremento")
decrementar.forEach(boton => {

  let carrito = JSON.parse(localStorage.carrito)
  
  boton.addEventListener("click", (e)=>{
    

    let index = (carrito.findIndex(prod=>prod.id == e.target.dataset.id));
  
    //si el producto esta en el carrito le sumo uno
    if(index != -1){
      carrito[index].cantidad--;
      valor--;
    }

  });
});