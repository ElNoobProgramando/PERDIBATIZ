<%-- 
    Document   : quejas
    Created on : 21/05/2022, 12:25:39 PM
    Author     : yayah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link rel="stylesheet" href="CSSd/cssusuario.css">
          <script src="js/quejas.js" ></script>
                   <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
            <script src="sweetalert2.all.min.js" type="text/javascript"></script>
            <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
            <script src="~/JS/Alertas.js" type="text/javascript"></script>
            <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet">
    </head>
    <body>
             <%
    response.addHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setDateHeader("Expires", 0);
        
    %>
  
      <header class="barraroja">
        </header>
     <form  method="post" action="guardarqueja.jsp" > 
            <div id="cuadro" class="cuadro">
                  <p class="titulo">Te es util nuestra aplicacion?</p>
                     <select class="lugare" name="luc" id="luc" >
                      <option >Mucho</option>
                      <option >Poco</option>
                      <option >Nada</option>
                        </select>
                    </div>
                  <p class="queper">¿Tuviste buena experiencia utilizando nuestra aplicacion?</p>
                    <div class="queperd">
                  <select class="lugare" name="luc1" id="nada" >
                      <option >Si</option>
                      <option >No</option>
                        </select>
                    </div>
                   <label for="correo">
                    Cuentanos que podriamos mejorar: <input type="text"  class="introtitu" name="des" id="des"   >
                  </label>
                  <button  class="crear" type="submit"  style="color: white "   id="langu" onclick="return mensaje()" >Enviar
            </button>
            </div>
     </form>
    </body>
</html>
