<%-- 
    Document   : menuadmin.jsp
    Created on : 3/11/2021, 07:10:56 PM
    Author     : yayah
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*, java.util.*, java.text.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" href="CSSd/CSSmenuadmin.css">
        <title>Menu Administrador</title>
            <%
    response.addHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setDateHeader("Expires", 0);
        
    %>
  
    </head>
    <body>
<header class="barraroja">
            <p class="per">PERDIBATIZ</p>
   
<div>
    <form action="publiadmin.jsp">
        <button class="verpublicaciones" style="color: white" > Ver Publicaciones</button>
    </form>
    <h2><span class="pel">Publicaciones Eliminadas</span></h2>
    <div >
    <a href="logout.jsp"><button class="cerrarsesion" type="submit" style="color:white"  >Cerrar Sesion</button></a>
    </div>
</div>
           
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
           
           
                Class.forName("com.mysql.jdbc.Driver");
                con = (Connection)DriverManager.getConnection(url, userName, password);
                 if(String.valueOf(session.getAttribute("id")) == null || String.valueOf(session.getAttribute("id")) == "null")
                        {
                            response.sendRedirect("paginadeerror.html"); 
                            System.out.println("Si entra");
                        }
                
                  String q = "select idpublieliminadas,titulo,quefue,foto,lugarentrega,horario,horariopubli,tipo,id_usuario from publieliminadas ";
                  String w = "select id_eliminado,titulo,queperdio,tipo,fechadepubli,id_usuario from elimiencontrado ";
                    
                  
                     set = con.createStatement();
                     rs = set.executeQuery(q);
                     
                     while(rs.next())
                     {
                     
                   %>
                    
                   <div >
                     <table border="2" class="tabla">
                         <thead>
                            <tr>
                                <th>Id_Publicacion _Eliminada</th>
                                <th>Titulo</th>
                                <th>Que fue?</th>
                                <th>foto</th>
                                <th>Lugar de Entrega</th>
                                <th>Horario</th>
                                <th>Hora de realizacion de la publi</th>
                                <th>tipo</th>
                                <th>Id_Usuario</th>
                              
                            </tr>
                        </thead>
                        <tbody>
                              
                            <tr>
                                <b>
                                <p>----------------------PERDIDO-----------------------</p>
                                </b>
                        <br>
                        <br>
                                <td><input type="text" value="<%=rs.getString("idpublieliminadas") %>" name="name"></td>
                                <td><input type="text" value="<%=rs.getString("titulo") %>" name="con"></td>
                                <td><input type="text" value="<%=rs.getString("quefue")%> " name="naci"></td>
                                <td><input type="text" value="<%=rs.getString("foto")%> " name="sexo"></td>
                                <td><input type="text" value="<%=rs.getString("lugarentrega")%> " name="edad"></td>
                                <td><input type="text" value="<%=rs.getString("horario")%> " name="edad"></td>
                                <td><input type="text" value="<%=rs.getString("horariopubli")%> " name="edad"></td>
                                <td><input type="text" value="<%=rs.getString("tipo")%> " name="edad"></td>
                                <td><input type="text" value="<%=rs.getString("id_usuario")%> " name="edad"></td>
                            </tr>
                             </div>
                        </tbody>
                        
                     </table>
                       </div>
                            
                    
                
                            <%
                        }
                    rss =set.executeQuery(w);
                    while(rss.next()){

                    %>
                    
                    <div >
                    <table border="2" class="tabla">
                         <thead>
                            <tr>
                                <th>id_Eliminado</th>
                                <th>Titulo</th>
                                <th>Que Perdio?</th>
                                <th>Tipo</th>
                                <th>Fecha de publicacion</th>
                                <th>Id_Usuario</th>
                                
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                        <b><p>----------------------ENCONTRADO-----------------------</p></b>
                        <br>
                        <br>
                                <td><input type="text" value="<%=rss.getString("id_eliminado") %>" name="name"></td>
                                <td><input type="text" value="<%=rss.getString("titulo") %>" name="con"></td>
                                <td><input type="text" value="<%=rss.getString("queperdio")%> " name="naci"></td>
                                   <td><input type="text" value="<%=rss.getString("tipo")%> " name="edad"></td>
                                    <td><input type="text" value="<%=rss.getString("fechadepubli")%> " name="edad"></td>
                                     <td><input type="text" value="<%=rss.getString("id_usuario")%> " name="edad"></td>
                            </tr>    
                        </tbody>
                     </table>
                    </div>
                            
            
                   <%
                       }set.close();
                        con.close();
                    %>
        
         </body>
</html>
