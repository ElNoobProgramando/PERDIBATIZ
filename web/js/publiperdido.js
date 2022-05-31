function mensaje(){
        var titulos = document.getElementById('titu');
    var queperdio = document.getElementById('queperd');
     var donde = document.getElementById('donde');
    var pg = document.getElementById('pgllave');
    var res = document.getElementById('respu');
    var lu = document.getElementById('luc');
     var fechas = document.getElementById('fecha');
    var horaes = document.getElementById('horae');
    var color = document.getElementById('color').checked;
    var color1 = document.getElementById('color1').checked;
    var color2 = document.getElementById('color2').checked;
    var color3 = document.getElementById('color3').checked;
    var color4 = document.getElementById('color4').checked;
  
    let xd =/^([a-zA-Z0-9 _-]+)$/;
     let nu= /[0-9]+$/;
    let le= /[a-zA-Z]*$/;
    let to=/^[a-zA-Z0-9 ]+$/;
    let tos= /^([a-zA-Z0-9 _-]+)$/;
    let toca= /^[a-zA-Z0-9 ]+$/;
    let tosi=/^([a-zA-Z0-9 _-]+)$/;
    let re=/^([\da-z_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        
        if (titulos.value!==null||queperdio.value!== null||pg.value!==null||res.value!==null){
            
        if (titulos.value==null||queperdio.value== null||pg.value==null||res.value==null){
                  Swal.fire({
                   icon: 'error',
                   title: 'Oops...',
                   text: 'a',
                   
                 })
                 return false;
             }
               if (!to.test(titulos.value) || titulos.value.length >10||titulos.value.indexOf(" ") !==-1){
                        Swal.fire({
                   icon: 'error',
                   title: 'Oops...',
                   text: 'Titulo solo puede llevar letras y numeros asi como  menor de 10 caracteres(sin espacios) o tu Campo esta  Vacio',
                   
                 })   
                  return false;
             } 
                if (!tos.test(queperdio.value)||queperdio.value.length >30){
                        Swal.fire({
                   icon: 'error',
                   title: 'Oops...',
                   text: 'Tu campo "Que encontraste" solo puede tener numeros y letras(maximo 16 caracteres) o esta vacio',
                   
                 })   
                  return false;
             }
        
        
        
        if (!xd.test(pg.value) || pg.value.length >30){
                        Swal.fire({
                   icon: 'error',
                   title: 'Oops...',
                   text: 'Tu pregunta solo puede tener letras y numeros(maximo 30 caracteres) O puede estar vacio tu Campo',
                   
                 })   
                  return false;
             }
              
       
     
              if (!tosi.test(res.value) || res.value.length >18){
                        Swal.fire({
                   icon: 'error',
                   title: 'Oops...',
                   text: 'El campo "Respuesta" Solo pueden ser letras y numeros(maximo 18 caracteres) o esta Vacio',
                   
                 })   
                  return false;
             }    
        if(!color && !color1 && !color2 && !color3 && !color4){ 
               Swal.fire({
                   icon: 'error',
                   title: 'Oops...',
                   text: 'Selecciona la categoria del objeto',
                   
                 }) 
                 return false;
          
        }
         if(fechas.value==""){ 
               Swal.fire({
                   icon: 'error',
                   title: 'Oops...',
                   text: 'Especifica una fecha de Entrega',
                   
                 }) 
                 return false;
          
        }
        
             }
            
              
      
     }   