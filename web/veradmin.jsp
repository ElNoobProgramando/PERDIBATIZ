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
        <title>FoundApp</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="CSSd/CSSveradmin.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/jquery-jgrowl/1.4.1/jquery.jgrowl.min.css" />
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery-jgrowl/1.4.1/jquery.jgrowl.min.js"></script>
        <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet">
    </head>
                                    <%
    response.addHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setDateHeader("Expires", 0);
        
    %>
    <body>
        <header class="barraroja">
                <div class="wrapper1">
                    <div class="logo">
                        <img src="./imagenes/logo.png" alt="Logotipo" id="logo">
                        <p class="per">FoundApp</p>
                    </div>
                    <nav>
                        <a href="publiadmin.jsp">Regresar</button</a>
                        <a href="logout.jsp">Cerrar Sesion</a>
                    </nav>
                </div>
            </header>
            <div class="title">
                <h2><span class="pel">Administradores</span></h2>
            </div>
            <div class="main-content wrapper2">
                    <table border="2" class="tabla">
                        <thead>
                            <tr>
                                <th scope="col">Nombre</th>
                                <th scope="col">Ultimo Inicio de Sesion</th>
                            </tr>
                        </thead>
                        <tbody>
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
             int valor = 1;
                Class.forName("com.mysql.jdbc.Driver");
                con = (Connection)DriverManager.getConnection(url, userName, password);
                 if(String.valueOf(session.getAttribute("id")) == null || String.valueOf(session.getAttribute("id")) == "null")
                        {
                            response.sendRedirect("paginadeerror.html"); 
                            System.out.println("Si entra");
                        }
                     System.out.println("Esta es la sesion "+String.valueOf(session.getAttribute("id")));
                     
                  String q = "SELECT id_admi,nombre,ultimaconexion FROM pruebadenulo WHERE id_admi ="+valor;
               
                     set = con.createStatement();
                     rs = set.executeQuery(q);
                     
                    
                     while(rs.next())
                     {
                   %>
                            <tr>
                                <td><input type="text" readonly value="<%=rs.getString("nombre")%>" name="name"></td>
                                <td><input type="text" readonly value="<%=rs.getString("ultimaconexion")%>" name="sesion"></td>
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