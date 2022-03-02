<%-- 
    Document   : preguntascontestadas.jsp
    Created on : 22/02/2022, 06:46:27 PM
    Author     : yayah
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link rel="stylesheet" href="CSSd/csspre-contestadas.css">
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
            ResultSet rssa = null;
            
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
                   System.out.println("Session: "+String.valueOf(session.getAttribute("id")));
                     System.out.println("Esta es la sesion "+String.valueOf(session.getAttribute("id")));
                        try{
                            int valos=1;
                            
                            String q = "select id_usuario,intentos,buenas from oportunidades  where buenas='"+valos+"' and id_usuario='"+session.getAttribute("id")+"'";
                               String xd ="SELECT B.* FROM oportunidades A , encontrado B WHERE A.buenas >=1 AND A.id_publicacion = B.id_publi";
                           
                            
                            set = con.createStatement();
                            rs = set.executeQuery(q);
                            
                            while(rs.next()){
                            
                %>
  
                    
                <%     
                                
                            }
                             rss = set.executeQuery(xd);
                        while(rss.next()){
                
                
                %>
                     <div class="rectangulo" id="resultado">  
                     <h3> <p class="encontrado">---------------------PERDIDO--------------------</p></h3> 
                    <h1><p class="titupubli">Titulo:<%=rss.getString("titulo")%></p></h1>
                   <br>
                   <br>
                   <span style="right: 5px; font-size: large; font:bold; position: relative; top: -99px;">&nbsp;&nbsp;&nbsp;Descripcion:<%=rss.getString("queperdio")%></span>
                    <br>
                    <span class="fecha">&nbsp;&nbsp;&nbsp;Horario de Entrega: <%=rss.getString("horario")%></span>
                    <p class="titupublis">&nbsp;&nbsp;&nbsp;Lugar de Entrega:<%=rss.getString("lugar")%></p>
                    <button method ="post" class="marcarentrega" id="boton" style="color: white" value="<%=rss.getString("id_publi")%>" onclick="valor(this.value)">ENTREGADO
                    <button method ="post" class="marcarnoentrega" id="boton" style="color: white" value="<%=rss.getString("id_publi")%>" onclick="valoras(this.value)">NO ENTREGADO
                   </div>
                    
              
                    <br>
                    <br>
                    
                    <%     }
                            set.close();
                            rs.close();
                            
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
    <script>  
        function valor(val)
                 {
                   const now = Date.now();
                   var resultado = (parseInt(val) / now);
                   var key = btoa(now.toString());
                   var mensaje =btoa(resultado.toString());
                   console.log(mensaje + key + " epoc " + now);
                   window.location.replace("entregado.jsp?id="+mensaje+"&log="+key);
                   return false;
                 }
        </script>
           <script>  
        function valoras(val)
                 {
                   const now = Date.now();
                   var resultado = (parseInt(val) / now);
                   var key = btoa(now.toString());
                   var mensaje =btoa(resultado.toString());
                   console.log(mensaje + key + " epoc " + now);
                   window.location.replace("entregado.jsp?id="+mensaje+"&log="+key);
                   return false;
                 }
        </script>
</html>
