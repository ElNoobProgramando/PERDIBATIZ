<%-- 
    Document   : actualizardatos
    Created on : 26/05/2021, 01:17:01 AM
    Author     : yayah
--%>

<%@page import="java.math.BigInteger"%>
<%@page import="java.security.MessageDigest"%>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*, java.util.*, java.text.*" %>

<!DOCTYPE html>
<link rel="stylesheet" href="./css/actualizar.css">
<link rel="stylesheet" href="./css/hola.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Assistant:wght@300&display=swap" rel="stylesheet">
 <link rel="stylesheet" href="CSSd/cssdeeditarpubli.css">

        
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consulta de Cuentas</title>
         <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
            <script src="sweetalert2.all.min.js" type="text/javascript"></script>
            <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
            <script src="~/JS/Alertas.js" type="text/javascript"></script>
            <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
            <script src="js/usuariodatos.js" ></script>
    </head>
    <body>
     <div class="barraroja">
           <p class="per" >PERDIBATIZ</p> 
           <a href="usuario.jsp"> <button class="regresar" style="color: white">Regresar</button></a>
       </div>
                
                <% 
           Connection con = null;
            Statement set = null;
            ResultSet rs = null;
            ResultSet rss = null;
            
            String url, userName, password, driver;
            
            url = "jdbc:mysql://localhost/rainsoft";
            userName = "root";
            password = "343122";
            driver = "com.mysql.jdbc.Connection";
           
           
                Class.forName("com.mysql.jdbc.Driver");
                con = (Connection)DriverManager.getConnection(url, userName, password);
                 if(String.valueOf(session.getAttribute("id")) == null || String.valueOf(session.getAttribute("id")) == "null")
                        {
                            response.sendRedirect("paginadeerror.html"); 
                            System.out.println("Si entra");
                        }        
                        try{
                            String id = request.getParameter("id"); 
                            System.out.println(id+"holapyuedeesto");
                            
                            String q = "select numusua,correol,contraseña,nombre from pruebadenulo where numusua ='"+session.getAttribute("id")+"'";;
                             
                            
                            
                            
                            set = con.createStatement();
                            rs = set.executeQuery(q);
                            
                            while(rs.next()){
                            
                %>
               <form  method="post" action="actuadatosusua" > 
            <div id="cuadro" class="cuadro">
                  <p class="titulo">Correo</p>
                    <div class="introtitu">
                    <input type="text"  class="introtitu" name="correo" id="correo"   >
                    </div>
                  <p class="queper">Contraseña</p>
                    <div class="queperd">
                    <input type="text"  class="queperd" name="contra" id="contra"  >
                    </div>
                     <p class="comfi"> Confirmar Contraseña</p>
                    <div class="contrases">
                        <input type="text" class="cont1" name="contrase" id="comfirmar" >
                    </div>
                  
                  
                  <p class="pl">Nombre</p>
                    <div class="pgllave">
                    <input type="text"  class="pgllave" name="name" id="name"  >
                    </div>
                  <div class="publicar1">
                            <button class="publicar" style="color: white" onclick="return mensaje()">EDITAR</button>
                        </div>

            </div>
                 </form>
                    
                <%     
                                
                            }
                            rs.close();
                            set.close();
                        String idS = String.valueOf(session.getAttribute("id")); 
                        
                        }catch(SQLException ed){
                            System.out.println("Error al consultar la tabla");
                            System.out.println(ed.getMessage());
                            %>
          
            <h1>Recurso no disponible solo juguito contigo UwU</h1>
                            <%
                        
                        }
                        con.close();
                    
                  %>
      
      
    </body>
</html>
 <script>
                 
                 function valore(val)
                 {
                    window.location.replace("guardaredicion.jsp?id="+val);
                    return false;
                      console.log(descifrado);
                 }
                 
               
       </script>
       
<%!
   public String getMD5(String input){
try{

   
    MessageDigest md=MessageDigest.getInstance("MD5");
    byte[] encBytes=md.digest(input.getBytes());
    BigInteger numero=new BigInteger(1,encBytes);
    String encString=numero.toString(16);
    while(encString.length()<32){
        encString="0"+encString;
    }
    return encString;
    }catch(Exception e){
        throw new RuntimeException(e);
    }
} 





%>                            
       