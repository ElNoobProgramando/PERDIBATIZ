  function mensaje(){
        var correos = document.getElementById('des');
 
    let to= /^[A-Za-z0-9]+$/g;

        
   
              
        if (!to.test(correos.value)){
                        Swal.fire({
                   icon: 'error',
                   title: 'Oops...',
                   text: 'Porfavor Ingresa solo letras o esta vacio tu campo',
                   
                 })   
                  return false;
             }


      
     }   

    
