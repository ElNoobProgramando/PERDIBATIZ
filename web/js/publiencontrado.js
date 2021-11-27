function myFunction() {
                  const fileInput = document.getElementById("foto");

                 fileInput.addEventListener("change", (e) => {
                   // get a reference to the file
                   const file = e.target.files[0];

                   const reader = new FileReader();
                   reader.onloadend = () => {
               
                     const base64String = reader.result
                       .replace("data:", "")
                       .replace(/^.+,/, "");

                
                     console.log(base64String);
                     document.getElementById("imgb64").value = "data:image/png;base64, " + base64String;
                     document.getElementById("imgprueba").src= "data:image/png;base64, "+base64String;
                   };
                   reader.readAsDataURL(file);
                   
                  
                 });
      
               
            }



function mensaje(){
        var titulos = document.getElementById('titu');
    var queperdio = document.getElementById('queperd');
     var fechas = document.getElementById('fecha');
     var foto = document.getElementById('foto');
      var filePath = foto.value;
        var allowedExtensions = /(.jpg|.jpeg|.png)$/i;
    var horaes = document.getElementById('horae');
    var color = document.getElementById('color').checked;
    var color1 = document.getElementById('color1').checked;
    var color2 = document.getElementById('color2').checked;
    var color3 = document.getElementById('color3').checked;
    var color4 = document.getElementById('color4').checked;

    let xd =/^[A-Za-z0-9]+$/g;
     let nu= /[0-9]+$/;
    let le= /[a-zA-Z]*$/;
    let to=/^[A-Z]+$/i;
    let tos= /^[A-Z]+$/i;
    let toca= /^[a-zA-Z0-9 ]+$/;
    let tosi= /^[A-Za-z0-9]+$/g;
    let re=/^([\da-z_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        
        if (titulos.value!==null||queperdio.value!== null){
            
        if (titulos.value==null||queperdio.value== null){
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
                   text: 'Titulo solo puede llevar letras asi como  menor de 10 caracteres(sin espacios) o tu Campo esta  Vacio',
                   
                 })   
                  return false;
             } 
            
                if (!tos.test(queperdio.value)||queperdio.value.length>25){
                        Swal.fire({
                   icon: 'error',
                   title: 'Oops...',
                   text: 'Tu campo "Que perdiste" solo puede tener letras (maximo 25 caracteres) o esta vacio',
                   
                 })   
                  return false;
             }
                        if(foto.value==""){ 
               Swal.fire({
                   icon: 'error',
                   title: 'Oops...',
                   text: 'Porfavor selecciona una foto con la similitud de tu objeto (esto facilitara la busqueda de tu objeto)',
                   
                 }) 
                 return false;
          
        }
                  if(!allowedExtensions.exec(filePath)){ 
               Swal.fire({
                   icon: 'error',
                   title: 'Oops...',
                   text: 'Solo se acepta formato jpeg,.jpg, .png ',
                   
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

             
             
        if(!color && !color1 && !color2 && !color3 && !color4){ 
               Swal.fire({
                   icon: 'error',
                   title: 'Oops...',
                   text: 'Selecciona la categoria del objeto',
                   
                 }) 
                 return false;
          
        }
       
        
             }
            
              
      
     }   
     
     function ValidarTamaño(obj)
{
  var uploadFile = obj.files[0];
  var sizeByte = obj.files[0].size;
  var siezekiloByte = parseInt(sizeByte / 1024);
  if(siezekiloByte > 100){
             Swal.fire({
  backdrop:true,
  allowOutsideClick: false,          
  title: 'Tu imagen pesa demasiado',
  confirmButtonText: 'Ok',
  icon:'error'
  
  
}).then((result) => {
  if (result.isConfirmed) {
      
      document.getElementById("foto").value = "";
   document.getElementById("imgprueba").src = "images/sd.png";
  } 
})
      
      return ;
      
  }
  }
  
  

       
