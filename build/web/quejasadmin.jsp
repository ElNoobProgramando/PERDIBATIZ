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
                     
                        <p class="per">FoundApp</p>
                    </div>
                </div>
            </header>
            <div class="title">
                <h2><span class="pel">QUEJAS</span></h2>
            </div>
            <div class="main-content wrapper2">
                    <table border="2" class="tabla">
                        <b><caption>PERDIDO</caption></b>
                        <thead>
                            <tr>
                                <th scope="col">ID Queja</th>
                                <th scope="col">Util</th>
                                <th scope="col">Ha servido?</th>
                                <th scope="col">Descripcion</th>
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
                
                  String q = "select id_queja,util,haservido,descrip from quejas";
               
                  
                     set = con.createStatement();
                     rs = set.executeQuery(q);
                     
                     while(rs.next())
                     {
                     
                   %>

                            <tr>
                                <td><input type="text" readonly value="<%=rs.getString("id_queja")%>" name="name"></td>
                                <td><input type="text" readonly value="<%=rs.getString("util") %>" name="con"></td>
                                <td><input type="text" readonly value="<%=rs.getString("haservido")%>" name="naci"></td>
                                <td><input type="text" readonly value="<%=rs.getString("descrip")%>" name="sexo"></td>
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
