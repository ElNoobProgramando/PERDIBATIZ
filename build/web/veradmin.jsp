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
            <a href="menuadmin.jsp" ><p class="per">PERDIBATIZ</p></a>
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
                   <p>---------------------ADMINISTRADOR--------------------</p> 
                   <div class="rectangulo" id="resultado">
                       <table id="dAtos">  
                   <span class="titupubli"><%=rs.getString("nombre")%></span>
                   <span class="tit">Ultima Inicio de Sesion:<%=rs.getString("ultimaconexion")%></span>
                   
                    </button>
                       </table>
                   </div>
                    <%
                        }set.close();
                        con.close();

                        
                    %>

            </div>
    </body>

</html>