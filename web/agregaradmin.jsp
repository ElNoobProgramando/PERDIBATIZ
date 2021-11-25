<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>PERDIBATIZ</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
         <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
            <script src="sweetalert2.all.min.js" type="text/javascript"></script>
            <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
            <script src="~/JS/Alertas.js" type="text/javascript"></script>
            <script src="js/crearnuevoadmin.js" ></script>
       
        <link rel="stylesheet" href="CSSd/agregaradmin.css">
    </head>
    <body>
    <header class="header">        
       <div id="barraroja1"  ></div>
    </header>
        <p class="per" style="color: white">PERDIBATIZ</p>
    <br>
    <br>
    <form  method="post" action="agregaradmin" > 
    <div id="rectangle10"  >
        <p class="ingresecor">Correo</p>
        <div class="correo">
        <input type="text" class="cor" name="correo" id="correo" >
        </div>
        <br>
        
        <br>
        <br>
        <p class="ingresecontr">Contraseña</p>
        <div class="contrase">
            <input type="text" class="cont" name="contrase" id="contrase" >
        </div>
         <p class="comfi"> Confirmar Contraseña</p>
        <div class="contrases">
            <input type="text" class="cont1" name="contrase" id="comfirmar" >
        </div>
        <br>
        <br>
        <br>
        <p class="numboleta">Numero De Boleta</p>
        <div class="numboletas">
            <input  name="numboleta" id="numboleta" name="numboleta"  class="cont" >
        </div>
        <br>
        <br>
        <br>
        <p class="urname">Nombre</p>
        <div class="nombre">
            <input type="text" name="nombre" id="nombre" class="nombres" >
            
        </div>
        <button  class="crear" type="submit"  style="color: white "   id="langu" onclick="return mensaje()">Crear
            </button>      
    </form>        
  
     </div>
    </body> 
        
</html>
       