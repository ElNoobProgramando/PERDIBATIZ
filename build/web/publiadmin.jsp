 <%@page import="java.math.BigInteger"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%-- 
    Document   : menu.jsp
    Created on : 6/10/2021, 07:39:46 PM
    Author     : yayah
--%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*, java.util.*, java.text.*" %>

<!DOCTYPE html>
<html>
    <head>
        <title>PERDIBATIZ</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="CSSd/CSSmenuadmin.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/jquery-jgrowl/1.4.1/jquery.jgrowl.min.css" />
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery-jgrowl/1.4.1/jquery.jgrowl.min.js"></script>
            
        
    </head>
        <%
    response.addHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setDateHeader("Expires", 0);
        
    %>
  
   
    <body>
        
        <header class="barraroja">
             <STYLE>A {text-decoration: none;} </STYLE>
            <a href="menuadmin.jsp" ><p class="per">PERDIBATIZ</p></a>>
        </header>
           <a href="menuadmin.jsp"><button class="regresar" type="submit" style="color:black"  >Regresar</button></a>
           
           
        
            <div class="box box-two">
                 
             
                <% 
            //aqui va codigo java
            
            
            Connection con = null;
            Statement set = null;
            ResultSet rs = null;
             ResultSet rss = null;
            ResultSet rsd = null;
            String url, userName, password, driver;
            
            url = "jdbc:mysql://localhost/rainsoft";
            userName = "root";
            password = "343122";
            driver = "com.mysql.jdbc.Connection";
             String buscar = request.getParameter("bu");
           
                Class.forName("com.mysql.jdbc.Driver");
                con = (Connection)DriverManager.getConnection(url, userName, password);
                 if(String.valueOf(session.getAttribute("id")) == null || String.valueOf(session.getAttribute("id")) == "null")
                        {
                            response.sendRedirect("paginadeerror.html"); 
                            System.out.println("Si entra");
                        }
                        if(String.valueOf(session.getAttribute("id")) == null || String.valueOf(session.getAttribute("id")) == "null")
                        {
                            response.sendRedirect("logueo.html"); 
                            System.out.println("Si entra");
                        }
                     System.out.println("Esta es la sesion "+String.valueOf(session.getAttribute("id")));
                     
                  String q = "select idperdido,titulo,queperdio,foto,horapubli,tipo,id_usuario, pruebadenulo.nombre from perdido INNER JOIN pruebadenulo ON perdido.id_usuario = pruebadenulo.numusua";
                    
                  String w = "select id_publi,titulo,queperdio,pglla,respuesta,tipo,fechadepubli,id_usuario,pruebadenulo.nombre from encontrado INNER JOIN pruebadenulo ON encontrado.id_usuario =pruebadenulo.numusua";
                  
                  
                  
                    String consulta = "select * from perdido where titulo like '%"+buscar+"%'";
                  
                     set = con.createStatement();
                     rs = set.executeQuery(q);
                     
                    
                     while(rs.next())
                     {
                   %>
                   <p>---------------------PERDIDO--------------------</p> 
                   <img src="<%=rs.getString("tipo")%>" class="ventes">
                    
                   <div class="rectangulo" id="resultado">
                       <table id="dAtos">  
                   <p class="titupubli"><%=rs.getString("titulo")%></p>
                   <br>
                   <span style="right: 5px; font-size: large; font:bold;">&nbsp;&nbsp;&nbsp;<%=rs.getString("queperdio")%></span>
                    <br>
                    <img src="<%=rs.getString("foto")%>" class="publicaciones">
                    <br>
                    <span class="fecha">&nbsp;&nbsp;&nbsp;Publicado: <%=rs.getString("horapubli")%></span>
                    <p class="titupublis">&nbsp;&nbsp;&nbsp;Creado por:<%=rs.getString("nombre")%></p>
                    <form action="eliminaradmin" method="POST">
                    <button method ="post" class="preguntallave" id="botons" name="bt" style="color: white" value="<%=rs.getString("idperdido")%>" onclick="valores(this.value)">ELIMINAR
                    </button>
                      </form>
                       </table>
                    
                   </div>
                   
            
               
                    <%
                        }
                        rss = set.executeQuery(w);
                        while(rss.next()){
                        
                    %>
                    <p>---------------------ENCONTRADO--------------------</p> 
                      <img src="<%=rss.getString("tipo")%>" class="ventes">
                   <div class="rectangulo" id="resultado">
                       <table id="dAtos">
                   <p class="titupubli"><%=rss.getString("titulo")%></p>
                   <br>
                   <span style="right: 5px; font-size: large; font:bold;">&nbsp;&nbsp;&nbsp;<%=rss.getString("queperdio")%></span>
                    <br>
                     <span class="fecha">&nbsp;&nbsp;&nbsp;Publicado: <%=rss.getString("fechadepubli")%></span>
                      <p class="titupublis1">&nbsp;&nbsp;&nbsp;Creado por:<%=rss.getString("nombre")%></p>
                    <form action="publiadmin2" method="POST">
                     <button  class="preguntallaves" id="botons" style="color: white" name="bt1" value="<%=rss.getString("id_publi")%>" onclick="valo(this.value)">ELIMINAR
                    </button>
                     </form>
                       
                       </table>
                   </div>
                    
                    <%
                    }set.close();
                        con.close();
                     %>
            </div>
            
            <h2><a href="grafica.jsp" class="grafica"><button >ESTADISTICA PERDIDO</button></a></h2>
            <br>
            <br>
            <br>
            <br>
            <h2> <a href="grafica1.jsp" class="grafica1"><button >ESTADISTICA ENCONTRADO</button></a></h2>
            <br>
            <br>
            <br>
            <br>
            <h2> <a href="grafica2.jsp" class="grafica2"><button >ESTADISTICA DONDE SE PIERDE</button></a></h2>
             <br>
            <br>
            <br>
            <h2> <a href="agregaradmin.jsp" class="agregarusuario"><button >Agregar Administrado</button></a></h2>
            <br>
            <br>
            <h2> <a href="veradmin.jsp" class="asu"><button >Ver Administradores</button></a></h2>

    </body>
</html>
 
             
            <script>
                 
                 function valo(val)
                 {
                   
                   
                    window.location.replace("eliminarencontradoadmin.jsp?id="+val);
                    return false; 
                    
                      console.log(descifrado);
                   
                 }
                 
               
             </script>
               <script>
                 
                 function valores(val)
                 {
                   
                   
                    window.location.replace("eliminarpubliadmin.jsp?id="+val);
                    return false; 
                    
                      console.log(descifrado);
                   
                 }
                 
               
             </script>