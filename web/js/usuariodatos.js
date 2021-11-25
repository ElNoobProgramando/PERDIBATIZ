function mensaje(){
        var correos = document.getElementById('correo');
    var pas = document.getElementById('contra');
    var pas1 = document.getElementById('comfirmar');

    var no = document.getElementById('name');
     let nu= /[0-9]+$/;
    let le= /[a-zA-Z]*$/;
    let to= /^[A-Za-z0-9]+$/g; 
    let re=/^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
        
        if (correos.value!= ""||pas.value!= ""||pas1.value!=""||no.value!=""){
              
        if (!re.test(correos.value)){
                        Swal.fire({
                   icon: 'error',
                   title: 'Oops...',
                   text: 'Correo invalido',
                   
                 })   
                  return false;
             }
              
        if (!le.test(no.value)){
                        Swal.fire({
                   icon: 'error',
                   title: 'Oops...',
                   text: 'Nombre invalido',
                   
                 })   
                  return false;
             } 
              if(pas.value !=pas1.value){
                Swal.fire({
                   icon: 'error',
                   title: 'Oops...',
                   text: 'Tu contraseña no es la misma',
                   
                 })   
                  return false;
              }
              if(!to.test(pas.value)){
                Swal.fire({
                   icon: 'error',
                   title: 'Oops...',
                   text: 'Solo numeros y letras',
                   
                 })   
                  return false;
              }
       
               
        
             }if (correos.value== ""||pas.value== ""||pas1.value==""||no.value==""){
                  Swal.fire({
                   icon: 'error',
                   title: 'Oops...',
                   text: 'Llena los campos Faltantes',
                   
                 })
                 return false;
             }
      
     }   
