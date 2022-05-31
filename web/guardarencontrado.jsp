<%-- 
    Document   : guardarencontrado
    Created on : 6/10/2021, 03:23:05 AM
    Author     : yayah
--%>


<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@page import="java.math.BigInteger"%>
<%@page import="java.security.MessageDigest"%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*, java.util.*, java.text.*, java.text.*,  encapsulamiento.PubliEncontrado, encapsulamiento.ConexionDB " %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FOUNDAPP</title>
       
         <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
            <script src="sweetalert2.all.min.js" type="text/javascript"></script>
            <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
            <script src="~/JS/Alertas.js" type="text/javascript"></script>
            <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet">
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
            //voy a lanzar una vista para cuando hace la insercion, cuando 
            //hay error en la lectura de la tabla
            //hay error por parte de bd
            
            try{
                Class.forName(driver);
                con = DriverManager.getConnection(url, userName, password);
                 if(String.valueOf(session.getAttribute("id")) == null || String.valueOf(session.getAttribute("id")) == "null")
                        {
                            response.sendRedirect("paginadeerror.html"); 
                            System.out.println("Si entra");
                        }
                 String currentDate,tipo,q;
                     
                  Date objDate = new Date();
                  SimpleDateFormat ft = 
                  new SimpleDateFormat ("dd/MM/yyyy HH:mm:ss");
                  currentDate  = ft.format(objDate);
                   try {
                    
          
                    tipo = request.getParameter("colors");
                   
                    String msg = (String)request.getAttribute("servletMsg");
                     String titulos = (String)request.getAttribute("titu");
                      String queperdio = (String)request.getAttribute("queperd");
                       String luka = (String)request.getAttribute("luc");
                        String fechas = (String)request.getAttribute("fecha");
                  
                  
                    set = con.createStatement();
                    String idS = String.valueOf(session.getAttribute("id"));
                    PubliEncontrado p2 = new PubliEncontrado(tipo);
                    set = con.createStatement();
                   
                    
                    
                    q = "insert into perdido(titulo, queperdio,foto,lugarentrega,horario,horapubli,tipo,id_usuario) "
                            + "values ('"+titulos+"', '"+queperdio+"', '"+msg+"','"+luka+"','"+fechas+"','"+currentDate+"','"+p2.getColors()+"','"+idS+"')";
                    int registro = set.executeUpdate(q);
                    System.out.println(q +"ESTO ES Q");
                    System.out.println(idS+"ESTO ES IDS");
                    System.out.println(tipo+"ESTO ES IDS");
                    
                    
                 %>
                 
                   <script>
                   
        Swal.fire({
  backdrop:true,
  allowOutsideClick: false,    
  title: 'Tu Publicacion se registro exitosamente',
  confirmButtonText: 'Ok',
  icon:'success'
  
}).then((result) => {
  if (result.isConfirmed) {
      console.log("hola");
      window.location.replace("index.jsp");
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
