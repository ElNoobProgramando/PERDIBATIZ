<%-- 
    Document   : actualizardatos
    Created on : 26/05/2021, 01:17:01 AM
    Author     : yayah
--%>

<%@page import="java.nio.charset.StandardCharsets"%>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*, java.util.*, java.text.*" %>

<!DOCTYPE html>

<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Assistant:wght@300&display=swap" rel="stylesheet">
 <link rel="stylesheet" href="CSSd/cssdeeditarpubli.css">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consulta de Cuentas</title>
         <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
         <script src="js/editarpubli.js" ></script>  
         <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet">
            
         <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
            <script src="sweetalert2.all.min.js" type="text/javascript"></script>
            <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
            <script src="~/JS/Alertas.js" type="text/javascript"></script>
        <%
        response.addHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setDateHeader("Expires", 0);
    
    %>
    </head>
    <body>
     <div class="barraroja">
           <p class="per" >FOUNDAPP</p> 
           <a href="usuario.jsp"> <button class="regresar" style="color: white ">Regresar</button></a>
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
                            response.sendRedirect("logueo.jsp"); 
                            System.out.println("Si entra");
                        }
                        try{ 
                            
                            String id = request.getParameter("id");
                            String key = request.getParameter("log");
                            byte[] iddecoded = Base64.getDecoder().decode(id);
                            byte[] logdecoded = Base64.getDecoder().decode(key);
                            String idOriginal = new String(iddecoded, StandardCharsets.UTF_8);
                            String keyOriginal = new String(logdecoded, StandardCharsets.UTF_8);
                            Double valor = Double.parseDouble(idOriginal);
                            Double llave = Double.parseDouble(keyOriginal);
                            Double res =new Double( valor * llave); 
                            int original = (int) Math.round(res);
                            
                            System.out.println(original);
                            System.out.println(original+"holapyuedeesto");
                           
                            String q = "select id_publi,titulo,queperdio,dondeloen ,pglla,respuesta,lugar,horario from encontrado where id_publi = "+original;
                             
                            
                            
                            
                            set = con.createStatement();
                            rs = set.executeQuery(q);
                            
                            while(rs.next()){
                            
                %>
               
                <form action="guardaredicion.jsp">
            <div id="cuadro" class="cuadro">
                  <p class="titulo">Titulo</p>
                    <div class="introtitu">
                    <input type="text"  class="introtitu" name="titu" id="titu" value="<%=rs.getString("titulo") %>"  >
                    </div>
                  <p class="queper">¿Qué encontraste?</p>
                    <div class="queperd">
                    <input type="text"  class="queperd" name="queperd" id="queperd" value="<%=rs.getString("queperdio") %>" >
                    </div>
                 <div>
                   <p class="lela">Donde lo encontraste?</p>
                      <select class="dondess" name="donde" id="donde" >
                      <option >Loby principal</option>
                      <option >Cafeteria</option>
                      <option >Canchas</option>
                      <option >Laboratorios</option>
                      <option >Aulas</option>
                        </select>
                  </div>
                  <p class="pl">Pregunta Llave</p>
                    <div class="pgllave">
                    <input type="text"  class="pgllave" name="pgllave" id="pgllave"  value="<%=rs.getString("pglla")%> " >
                    </div>
                  <p class="res">Respuesta</p>
                    <div class="respu">
                        <input type="text"  class="respu" name="respu"  id="respu" value="<%=rs.getString("respuesta")%> ">
                    </div>
                  <p class="le">Lugar de Entrega</p>

                  <select class="lugare" name="luc" id="luc" value="<%=rs.getString("lugar")%> " >
                      <option >Loby principal</option>
                      <option >Cafeteria</option>
                      <option >Canchas</option>
                        </select>
      <p class="hde">Horario de Entrega</p>
                    <div class="horae">
                        <input type="datetime-local"  class="horae" name="horae" id="fecha"  >
            <script>
            $(document).ready(function(){
                $("#fecha").focus(function(){
                    $('#msg').html('');
                });
                $("#fecha").blur(function(){
                    var hoy = new Date();
                    var fecha = $('#fecha').val();
                    var fechaFormulario = Date.parse(fecha);
                    
                    if (hoy <= fechaFormulario) {
                        
                    } else {
                          document.getElementById("fecha").value = "";
                       Swal.fire({
                    backdrop:true,
                    allowOutsideClick: false,          
                    title: 'Eliger una fecha valida ',
                    confirmButtonText: 'Ok',
                    icon:'error'


                  })
                    }
                });
            });
            </script>
                    </div>
                  <p class="ele" id="tipo">Seleccione el tipo de categoria de su objeto:</p>
                  <label  >
                      <input type="radio" id="color" name="colors" value="images/tecnolo.png" class="tecnologico" >
                      <a class="si">Tecnologico</a>
                      <img src="images/tecnolo.png"  id="imagen2" class="us1" /> 
                    </label>
                  <label  >
                    <input type="radio" id="color1" name="colors" value="images/ropa.png" class="ropa1"  >
                    <a class="r">Ropa</a>
                     <img src="images/ropa.png" id="imagen2" class="us2" /> 
                  </label>
                  <label >
                    <input type="radio" id="color2" name="colors" value="images/escolar.png" class="escolar"  > 
                    <a class="d">Escolar</a>
                     <img src="images/escolar.png" id="imagen2" class="us3" /> 
                  </label>
                  <label >
                    <input type="radio" id="color3"  name="colors" value="images/personal.png" class="personal" > 
                   <a class="o">Personal</a>
                    <img src="images/personal.png" id="imagen2" class="us4" /> 
                 </label>
                 <label >
                   <a class="y"> 
                   <input type="radio" id="color4" name="colors" value="images/otro.png" class="otro"  >Otro
                   </a>   
                   <img src="images/otro.png" id="imagen2" class="us5" /> 
                  </label>
                  
                  </div> 
                        <input value="<%=rs.getString("id_publi")%>"  name="e" style="color: white" hidden="true" />
                        <div class="publicar1">
                           <button class="publicar" style="color: white" onclick='return mensaje();' >EDITAR</button>
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

