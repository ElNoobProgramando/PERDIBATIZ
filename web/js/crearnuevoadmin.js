function mensaje(){
        var correos = document.getElementById('correo');
    var pas = document.getElementById('contrase');
    var pas1 = document.getElementById('comfirmar');
    var bo = document.getElementById('numboleta');
    var no = document.getElementById('nombre');
    var vale = document.getElementById('pri');
    const accesorios = document.querySelectorAll('input[type=checkbox]:checked'); 
     let nu= /[0-9]+$/;
    let le= /[a-zA-Z]*$/;
    let to= /^[A-Za-z0-9]+$/g;
    let nombre= /^[A-Za-z0-9]+$/g;
    let re=/^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;

        
        if (correos.value!= ""||pas.value!= ""||pas1.value!=""||bo.value!=""||no.value!=""){
              
        if (!re.test(correos.value)){
                        Swal.fire({
                   icon: 'error',
                   title: 'Oops...',
                   text: 'Correo invalido',
                   
                 })   
                  return false;
             }
              if(!to.test(pas.value)||pas.value.length<10){
                Swal.fire({
                   icon: 'error',
                   title: 'Oops...',
                   text: 'La Contraseña debe ser de 10 caracteres y  solo puede tener numeros y letras o esta vacio tu campo',
                   
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
             
       
              if (!nu.test(bo.value)||bo.value.length<10){
                        Swal.fire({
                   icon: 'error',
                   title: 'Oops...',
                   text: 'El Numero de boleta solo pueden ser  numeros o esta vacio',
                   
                 })   
                  return false;
             }
             
             if(bo.value.length>10){
                       Swal.fire({
                   icon: 'error',
                   title: 'Oops...',
                   text: 'Verifica tu numero de boleta',
                   
                 })   
                  return false; 
                 
                 
                 
             }
               if (!nombre.test(no.value)){
                        Swal.fire({
                   icon: 'error',
                   title: 'Oops...',
                   text: 'Nombre solo puede tener letras y numeros o Campo Vacio',
                   
                 })   
                  return false;
             } 
                
      
        
             }if (correos.value== ""||pas.value== ""||pas1.value==""||bo.value==""||no.value==""){
                  Swal.fire({
                   icon: 'error',
                   title: 'Oops...',
                   text: 'Llena los campos Faltantes',
                   
                 })
                 return false;
             }
      
     }   

       