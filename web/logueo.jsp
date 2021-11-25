<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="CSSd/CSSinicioSesion.css">
    <link rel="stylesheet" href="dist/css/adminlte.min.css">
    <title>PERDIBATIZ</title>
     <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
          
            <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
            <script src="~/JS/Alertas.js" type="text/javascript"></script>
            <script src="js/index.js" ></script>
    
 
            
</head>

<body> 
      
 <header class="barraroja">        
        <div id="barraroja" ></div>
         <section class="imagenempre">
             <p class="sia">PERDIBATIZ</p>
        </section>
         <div id="contenedor_carga"><div id="carga"></div></div>
       
    </header>
    <br>
    <br>
    <br>
    <form  method="post" action="iniciodesesion" > 
   
        <section class="imagen2">
         <img src="images/usuariogod.png" id="imagen3" />   
        </section> 
           
        
            <div id="rectangle_10"  >
       
        <section class="imagen2">
         <img src="images/usuariogod.png" id="imagen2" />   
        </section>   
        <div class="ingresacorreo">
            <center><input type="text" class="ingresacorreo" name="coreo" id="coreo"  placeholder="Correo" style="color: black" ></center>
        </div>
        <section class="imagencontra">
        <img src="images/contra.png" id="imagencontra" /> 
        </section>
        <div class="contra" id="mal">
            <br><center><input type="password" id="pas" class="contra" name="pas" placeholder="Ingrese su Contraseña" style="color: black"></center>
        </div>
        <br>
            <button  class="iniciarse" type="submit" id="crearsesion"  style="color: white" onclick=" return  mensaje()">Iniciar Sesion
           </button>
    
            </div>
            
      </form>
    <form action="crearsesionl.html">
        <center>
    <a href="crearsesionl.html"><button class="iniciark" type="submit" style="color:white" id="iniciarsesion">Crear Sesion</button></a>
    </center>
    </form>    
    
      
  <div class="login">
            <div class="login-header">
            </div>
            <br>          
        </div>
        <br>     
        <br>      
</body>
</html>
