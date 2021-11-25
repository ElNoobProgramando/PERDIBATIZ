<%-- 
    Document   : guardarencontrado
    Created on : 6/10/2021, 03:23:05 AM
    Author     : yayah
--%>

<%@page import="sun.misc.IOUtils"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@page import="java.math.BigInteger"%>
<%@page import="java.security.MessageDigest"%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*, java.util.*, java.text.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PERDIBATIZ</title>
       
         <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
            <script src="sweetalert2.all.min.js" type="text/javascript"></script>
            <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
            <script src="~/JS/Alertas.js" type="text/javascript"></script>
            <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
                 <%
        response.addHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setDateHeader("Expires", 0);
    
    %>
    </head>
    <body>
        <% 
            //aqui va codigo java
            Connection con = null;
            Statement set = null;
            ResultSet rs = null;
            
            
            String url, userName, password, driver;
            
            url = "jdbc:mysql://localhost/rainsoft";
            userName = "root";
            password = "343122";
            driver = "com.mysql.jdbc.Driver";
            
           
            
            try{
                Class.forName(driver);
                con = DriverManager.getConnection(url, userName, password);
                  if(String.valueOf(session.getAttribute("id")) == null || String.valueOf(session.getAttribute("id")) == "null")
                        {
                            response.sendRedirect("logueo.jsp"); 
                            System.out.println("Si entra");
                        }
                
                   try {
                       String correo,contra,boleta,name,q,w;
                    set = con.createStatement();
                   String id = request.getParameter("id"); 
                            System.out.println(id+"holapyuedeesto");

                  q = "INSERT INTO elimiencontrado (titulo,queperdio,tipo,fechadepubli,id_usuario) SELECT  titulo,queperdio,tipo,fechadepubli,id_usuario FROM encontrado WHERE id_publi = "+id;  
                  w = "DELETE FROM encontrado WHERE id_publi="+id;
                    System.out.println(q);
                    int registro = set.executeUpdate(q);
                    int eliminar = set.executeUpdate(w);
                  
                 %>
                   <script>
                   
        Swal.fire({
  backdrop:true,
  allowOutsideClick: false,          
  title: 'Publicacion Eliminada',
  confirmButtonText: 'Ok',
  icon:'success'
  
  
}).then((result) => {
  if (result.isConfirmed) {
      console.log("hola");
      window.location.replace("publiadmin.jsp");
  } 
})
                            
                        
        
                   </script>
        
               
             
  
                    <%
                        set.close();
                
                }catch(SQLException ed){
                    System.out.println("Error al registrar en la tabla");
                    System.out.println(ed.getMessage());
                    %>
        <h1>Registro No Exitoso, error en la lectura de la tabla</h1>            
                    <%
                
                }
                con.close();
            
            }catch(Exception e){
                System.out.println("Error al conectar la bd");
                System.out.println(e.getMessage());
                System.out.println(e.getStackTrace());
            %>
        <h1>Sitio en Construcción</h1>            
                    <%
            }
            %>
        
        
           
        
    </body>
</html>