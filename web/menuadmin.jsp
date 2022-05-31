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
            <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet">
            <title>Menu Administrador</title>
            <%
    response.addHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setDateHeader("Expires", 0);
        
    %>

        </head>

        <body>
            <header class="barraroja">
                <div class="wrapper1">
                    <div class="logo">
                        <img src="./imagenes/logo.png" alt="Logotipo" id="logo">
                        <p class="per">FoundApp</p>
                    </div>
                    <nav>
                        <a href="publiadmin.jsp">Ver Publicaciones</button</a>
                        <a href="logout.jsp">Cerrar Sesion</a>
                    </nav>
                </div>
            </header>
            <div class="title">
                <h2><span class="pel">Publicaciones Eliminadas</span></h2>
            </div>
            <div class="main-content wrapper2">
                    <table border="2" class="tabla">
                        <b><caption>PERDIDO</caption></b>
                        <thead>
                            <tr>
                                <th scope="col">ID Publicación</th>
                                <th scope="col">Titulo</th>
                                <th scope="col">¿Que fue?</th>
                                <th scope="col">Foto</th>
                                <th scope="col">Lugar de Entrega</th>
                                <th scope="col">Fecha y hora de entrega</th>
                                <th scope="col">Fecha y hora de publicación</th>
                                <th scope="col">Tipo</th>
                                <th scope="col">ID Usuario</th>
                            </tr>
                        </thead>
                        <tbody>
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

                            <tr>
                                <td><input type="text" readonly value="<%=rs.getString("idpublieliminadas")%>" name="name"></td>
                                <td><input type="text" readonly value="<%=rs.getString("titulo") %>" name="con"></td>
                                <td><input type="text" readonly value="<%=rs.getString("quefue")%>" name="naci"></td>
                                <td><input type="text" readonly value="<%=rs.getString("foto")%>" name="sexo"></td>
                                <td><input type="text" readonly value="<%=rs.getString("lugarentrega")%>" name="edad"></td>
                                <td><input type="text" readonly value="<%=rs.getString("horario")%>" name="edad"></td>
                                <td><input type="text" readonly value="<%=rs.getString("horariopubli")%>" name="edad"></td>
                                <td><input type="text" readonly value="<%=rs.getString("tipo")%>" name="edad"></td>
                                <td><input type="text" readonly value="<%=rs.getString("id_usuario")%>" name="edad"></td>
                            </tr>
                            
                <%
                        }%>
                        </tbody>
                    </table>
                </div>
                        
                <div class="main-content wrapper2">
                        <table border="2" class="tabla">
                            <b><caption>ENCONTRADO</caption></b>
                            <br>
                            <br>
                            <thead>
                                <tr>
                                    <th>ID Publicación</th>
                                    <th>Titulo</th>
                                    <th>¿Que Perdio?</th>
                                    <th>Tipo</th>
                                    <th>Fecha y hora de publicacion</th>
                                    <th>ID Usuario</th>

                                </tr>
                            </thead>
                            <tbody>
                        
                        <%
                    rss =set.executeQuery(w);
                    while(rss.next()){

                    %>
                                <tr>
                                    <td><input type="text" readonly value="<%=rss.getString("id_eliminado")%>" name="name"></td>
                                    <td><input type="text" readonly value="<%=rss.getString("titulo")%>" name="con"></td>
                                    <td><input type="text" readonly value="<%=rss.getString("queperdio")%>" name="naci"></td>
                                    <td><input type="text" readonly value="<%=rss.getString("tipo")%>" name="edad"></td>
                                    <td><input type="text" readonly value="<%=rss.getString("fechadepubli")%>" name="edad"></td>
                                    <td><input type="text" readonly value="<%=rss.getString("id_usuario")%>" name="edad"></td>
                                </tr>

                    <%
                       }set.close();
                        con.close();
                    %>
                            </tbody>
                        </table>
                    </div>
        </body>

        </html>
