const bloque    = document.querySelectorAll('.collapse')
const auto      = document.querySelectorAll('.me-auto')
    

// Cuando CLICK en h2,
    // QUITAR la clase activo de TODOS los bloque
    // Vamos a añadir la clase activo al BLOQUE con la POSICION del h2

auto.forEach( ( cadaH2 , i )=>{
    auto[i].addEventListener('click', ()=>{
        bloque.forEach( ( cadaBloque , i )=>{
            bloque[i].classList.remove('show')
        })
        bloque[i+1].classList.add('show')
    })
})

