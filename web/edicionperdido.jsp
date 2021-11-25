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

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*, java.util.*, java.text.* ,  encapsulamiento.EditarPubli2,  encapsulamiento.ConexionDB" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PERDIBATIZ</title>
       
         <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
            <script src="sweetalert2.all.min.js" type="text/javascript"></script>
            <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
            <script src="~/JS/Alertas.js" type="text/javascript"></script>
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
                            response.sendRedirect("logueo.html"); 
                            System.out.println("Si entra");
                        }
                
                   try {
                       String titu, queperd, agfoto , pgllave,respu,horae ,luc,currentDate,tipo,id,q;
                     
                   Date objDate = new Date();
                  SimpleDateFormat ft = 
                  new SimpleDateFormat ("dd/MM/yyyy HH:mm:ss");
                  currentDate  = ft.format(objDate);
                    titu = request.getParameter("titu");
                    queperd = request.getParameter("queperd");
                    agfoto= request.getParameter("imgb64");
                    System.out.println(agfoto);
                    luc=request.getParameter("luc");
                    horae = request.getParameter("horae");
                    tipo = request.getParameter("colors");
                    id = request.getParameter("e");
                    System.out.println(id+"esto es el id");
                    set = con.createStatement();
                    String idS = String.valueOf(session.getAttribute("id"));
                     EditarPubli2 e2 = new EditarPubli2(titu, queperd,agfoto,luc,horae,tipo);
                    q = "UPDATE perdido SET titulo='"+e2.getTitulo()+"', queperdio='"+e2.getQueperdio()+"',foto='"+e2.getImgb64()+"',lugarentrega='"+e2.getLuc()+"',horario='"+e2.getHorae()+"',horapubli='"+currentDate+"',tipo='"+e2.getColors()+"',id_usuario='"+idS+"' "
                            + "WHERE idperdido ='"+id+"'";
                    
                    System.out.println(q);
                    int registro = set.executeUpdate(q);
                  
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
        <
               
             
  
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
