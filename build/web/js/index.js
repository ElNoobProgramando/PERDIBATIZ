 function mensaje(){
 
    var correos = document.getElementById('coreo');
    var pas = document.getElementById('pas');
    let re=/^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
    let to= /^[A-Za-z0-9]+$/g;
        
        if (correos.value!= ""||pas.value!= ""){
              
        if (!re.test(correos.value)){
                        Swal.fire({
                   icon: 'error',
                   title: 'Oops...',
                   text: 'Correo invalido',
                   
                 })   
                  return false;
             }
     
              if(!to.test(pas.value)){
                Swal.fire({
                   icon: 'error',
                   title: 'Oops...',
                    text: 'Tu contraseña solo pueden ser numeros y letras',
                   
                 })   
                  return false;
              }
    
        
             }if (correos.value== ""||pas.value== ""){
                  Swal.fire({
                   icon: 'error',
                   title: 'Oops...',
                   text: 'Llena los campos Faltantes',
                   
                 })
                 return false;
             }
      
     }   

    
	window.onload = function() {
      const contenedor = document.getElementById('contenedor_carga')
      setTimeout(function() {
        contenedor.style.visibility = 'hidden'
        contenedor.style.opacity = 0
      }, 3000)
    }
  



    