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

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*, java.util.*, java.text.*, java.text.*,  encapsulamiento.PubliPerdido,  encapsulamiento.ConexionDB" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FOUNDAPP</title>
       
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
                String titu, queperd, donde, pgllave,respu,horae ,luc,currentDate,tipo,q;
                     
                   Date objDate = new Date();
                  SimpleDateFormat ft = 
                  new SimpleDateFormat ("dd/MM/yyyy HH:mm:ss");
                  currentDate  = ft.format(objDate);
                   try {
                    
                    titu = request.getParameter("titu");
                    queperd = request.getParameter("queperd");
                    donde= request.getParameter("donde"); 
                    pgllave = request.getParameter("pgllave");
                    System.out.println(pgllave);
                    respu = request.getParameter("respu");
                    luc=request.getParameter("luc");
                    horae = request.getParameter("horae");
                    tipo = request.getParameter("colors");
                   
                    System.out.println(tipo);
                    set = con.createStatement();
                    String idS = String.valueOf(session.getAttribute("id"));
                     PubliPerdido p1 = new PubliPerdido(titu, queperd,donde,pgllave,respu,luc,horae,tipo);
                    
                    q = "insert into encontrado(titulo, queperdio,dondeloen,pglla,respuesta,lugar,horario,fechadepubli,tipo,id_usuario) "
                            + "values ('"+p1.getTitulo()+"', '"+p1.getQueperdio()+"', '"+p1.getDonde()+"', '"+p1.getPgllave()+"','"+p1.getRespu()+"','"+p1.getLuc()+"','"+p1.getHorae()+"','"+currentDate+"','"+p1.getColors()+"','"+idS+"')";
                    int registro = set.executeUpdate(q);
                    System.out.println(q);
                    System.out.println(idS);
                    System.out.println(tipo);
                    
                    
                    
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
