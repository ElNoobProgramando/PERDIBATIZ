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

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*, java.util.*, java.text.* ,  encapsulamiento.EditarPubli,  encapsulamiento.ConexionDB" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FOUNDAPP</title>
       
         <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
            <script src="sweetalert2.all.min.js" type="text/javascript"></script>
            <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
            <script src="~/JS/Alertas.js" type="text/javascript"></script>
            <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
            <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet">
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
                       String titu, queperd, donde, pgllave,respu,horae ,luc,currentDate,tipo,id,q;
                     
                   Date objDate = new Date();
                  SimpleDateFormat ft = 
                  new SimpleDateFormat ("dd/MM/yyyy HH:mm:ss");
                  currentDate  = ft.format(objDate);
                   
                    
                    titu = request.getParameter("titu");
                    queperd = request.getParameter("queperd");
                    donde= request.getParameter("donde"); 
                    pgllave= request.getParameter("pgllave"); 
                    respu=request.getParameter("respu"); 
                    luc=request.getParameter("luc");
                    horae = request.getParameter("horae");
                    tipo = request.getParameter("colors");
                    id = request.getParameter("e");
                    System.out.println(id+"esto es el id");
                    set = con.createStatement();
                    String idS = String.valueOf(session.getAttribute("id"));
                    EditarPubli e1 = new EditarPubli(titu, queperd,donde,pgllave,respu,luc,horae,tipo);
                    
                    
                    
                    
                    
                    q = "UPDATE encontrado SET titulo='"+e1.getTitulo()+"', queperdio='"+e1.getQueperdio()+"',dondeloen='"+e1.getDonde()+"',pglla= '"+e1.getPgllave()+"',respuesta='"+e1.getRespu()+"',lugar='"+e1.getLuc()+"',horario='"+e1.getHorae()+"',fechadepubli='"+currentDate+"',tipo='"+e1.getColors()+"',id_usuario='"+idS+"' "
                            + "WHERE id_publi ='"+id+"'";
                    
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
