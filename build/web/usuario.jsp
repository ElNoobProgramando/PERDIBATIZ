<%-- 
    Document   : usuario.jsp
    Created on : 12/10/2021, 07:05:31 PM
    Author     : yayah
--%>

<%@page import="javax.websocket.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*, java.util.*, java.text.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="CSSd/cssusuario.css">
        <title>Cuenta Usuario</title>
         <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
            <script src="sweetalert2.all.min.js" type="text/javascript"></script>
            <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
            <script src="~/JS/Alertas.js" type="text/javascript"></script>
    
    </head>
     <%
    response.addHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setDateHeader("Expires", 0);
        
    %>
  
    
    <body>
<div> 
 
           
         <header class="barraroja">
    
        </header>
        <section class="imagenempredos">
            <a href="index.jsp" style="text-decoration: none;"><h2 class="imagenempredos"  style="color: white">PERDIBATIZ</h2> </a>
        </section>
       
        <a href="index.jsp"><button class="regresar" type="submit" style="color:white"  >Regresar</button></a>
        <div >
    <a href="logout.jsp"><button class="cerrarsesion" type="submit" style="color:white"  >Cerrar Sesion</button></a>
    </div>
        <h1><span class="tuspu">Tus Publicaciones</span></h1>
        <form action="usuariodatos.jsp">
            <button class="modificar" style="color: white">MODIFICAR MIS DATOS</button>
        </form>
     
       
    <div class="box ">
     
            
            <% 
            //aqui va codigo java
            Connection con = null;
            Statement set = null;
            ResultSet rs = null;
            ResultSet rss = null;
            
            String url, userName, password, driver;
            
            url = "jdbc:mysql://localhost/rainsoft";
            userName = "root";
            password = "343122";
            driver = "com.mysql.jdbc.Connection";
            if(String.valueOf(session.getAttribute("id")) == null || String.valueOf(session.getAttribute("id")) == "null")
                        {
                            
                            response.sendRedirect("paginadeerror.html"); 
                            System.out.println("Si entra");
                        }
            
           
                Class.forName("com.mysql.jdbc.Driver");
                con = (Connection)DriverManager.getConnection(url, userName, password);
                
                
                  String q = "select idperdido,titulo,queperdio,foto,horapubli,tipo from perdido WHERE id_usuario='"+session.getAttribute("id")+"'";;
                  String w = "select id_publi,titulo,queperdio,dondeloen,lugar,tipo,fechadepubli from encontrado WHERE id_usuario='"+session.getAttribute("id")+"'";;
                    String a = request.getParameter("idperdido");
                  
                  
                     set = con.createStatement();
                     rs = set.executeQuery(q);
                     
                     while(rs.next())
                     {
                     
                   %>
                  
                   <p>--------------------PERDIDO-------------------</p>
                   <div class="rectangulo">
                   <p class="titupubli"><%=rs.getString("titulo")%></p>
                   <br>
                   <span style="right: 5px; font-size: large; font:bold;">&nbsp;&nbsp;&nbsp;<%=rs.getString("queperdio")%></span>
                    <br>
                     <br>
                    <img src="<%=rs.getString("tipo")%>" class="publicaciones2">
                    <br>
                    <img src="<%=rs.getString("foto")%>" class="publicaciones" onclick="return imagen(this.src)">
                    <br>
                    <span class="fecha">&nbsp;&nbsp;&nbsp;Publicado: <%=rs.getString("horapubli")%></span>
                    <button method ="post" class="marcarentrega" id="boton" style="color: white" value="<%=rs.getString("idperdido")%>" onclick="valor(this.value)">Editar
                    </button>
                    <form action="eliminarperdido" method="POST">
                    <button method ="post" class="marcarentrega2" id="botons" name="bt" style="color: white" value="<%=rs.getString("idperdido")%>" onclick="valores(this.value)">ELIMINAR
                    </button>
                      </form>
                    </div>
               
                    
               
                    <%
                        }
                    rss =set.executeQuery(w);
                    while(rss.next()){

                    %>
                     <p>--------------------ENCONTRADO-------------------</p>
                  
                   <div class="rectangulo">
                   <p class="titupubli"><%=rss.getString("titulo")%></p>
                   <br>
                   <span style="right: 5px; font-size: large; font:bold;">&nbsp;&nbsp;&nbsp;<%=rss.getString("queperdio")%></span>
                    <br>
                    <img src="<%=rss.getString("tipo")%>" class="publicaciones">
                    <br>
                    <span class="fecha">&nbsp;&nbsp;&nbsp;Publicado: <%=rss.getString("fechadepubli")%></span>
                   <button class="marcarentrega1" id="boton" style="color: white" value="<%=rss.getString("id_publi")%>" onclick="valore(this.value)">Editar
                    </button>
                     <form action="eliminarperdido2" method="POST">
                     <button  class="marcarentrega2" id="botons" style="color: white" name="bt1" value="<%=rss.getString("id_publi")%>" onclick="valo(this.value)">ELIMINAR
                    </button>
                     </form>
     
                   
                    </div>
                   
                   <%
                       }set.close();
                        con.close();
                        


                    %>
              
                    <div>
                        <from action="preguntascontestadas.jsp">
                            <a href="preguntascontestadas.jsp"><button  class="marcarentrega2"  style="color: white"  >PREGUNTAS CONTESTADAS
                    </button> </a>
                        </from>
                    </div>
                   </div>

  </div>
    
    </body>
   

<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/4.1.1/crypto-js.min.js" > </script>
  <script type="text/javascript">
                 
                
                  function valor(val)
                 {
                   const now = Date.now();
                   var resultado = (parseInt(val) / now);
                   var key = btoa(now.toString());
                   var mensaje =btoa(resultado.toString());
                   console.log(mensaje + key + " epoc " + now);
                   window.location.replace("editarperdido.jsp?id="+mensaje+"&log="+key);
                   return false;
                 }
                 
                  function valore(val)
                 {
                   const now = Date.now();
                   var resultado = (parseInt(val) / now);
                   var key = btoa(now.toString());
                   var mensaje =btoa(resultado.toString());
                   console.log(mensaje + key + " epoc " + now);
                   
                    window.location.replace("editarpubli.jsp?id="+mensaje+"&log="+key);
                   return false;
                 }
                 
                 input.onchange =function vamos()
                 {
                    window.location.replace("editarpubli.jsp");
                 }
               
             </script>
              <script>
                 
                 function valores(val)
                 {
                   
                   
                    window.location.replace("eliminarpubli.jsp?id="+val);
                    return false; 
                    
                      console.log(descifrado);
                   
                 }
                 
               
             </script>
              <script>
                 
                 function valo(val)
                 {
                   
                   
                    window.location.replace("eliminarencontrado.jsp?id="+val);
                    return false; 
                    
                      console.log(descifrado);
                   
                 }
                 
               
             </script>
             </html>
<script>
function imagen(url) {


                    Swal.fire({

                        imageUrl: url,
                        backdrop: 'rgb(0 0 0 / 72%)',
                        confirmButtonColor: '#9A3324',
                        confirmButtonText: 'Aceptar',
                        allowOutsideClick: false,
                        allowEscapeKey: false
                    }).then((result) => {
                        if (result.isConfirmed) {
                            document.getElementById("tablaCursos").scrollLeft = 1000;
                        }
                    })



                }


</script>