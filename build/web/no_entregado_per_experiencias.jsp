<%-- 
    Document   : entregado
    Created on : 1/03/2022, 12:57:02 AM
    Author     : yayah
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.nio.charset.StandardCharsets"%>
<%@page import="java.util.Base64"%>
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
            <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
            <script src="sweetalert2.all.min.js" type="text/javascript"></script>
            <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
            <script src="~/JS/Alertas.js" type="text/javascript"></script>
            <link rel="stylesheet" href="CSSd/csspreguntallave.css">
            <link rel="stylesheet" href="CSSd/csspreguntallave.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet">
        <title>JSP Page</title>
                 <script src="js/editarperdido.js" ></script>
        <title>FOUNDAPP</title>
        <%
        response.addHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setDateHeader("Expires", 0);
    
    %>
      <div class="barraroja">
         <p class="per" >FOUNDAPP</p> 
       </div>
    </head>
    <body>  
                <% 
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
                            response.sendRedirect("logueo.jsp"); 
                            System.out.println("Si entra");
                        }
                        try{
                            String id = request.getParameter("id"); 
                            System.out.println(id+"holapyuedeesto");
                            String key = request.getParameter("log");
                            byte[] iddecoded = Base64.getDecoder().decode(id);
                            byte[] logdecoded = Base64.getDecoder().decode(key);
                            String idOriginal = new String(iddecoded, StandardCharsets.UTF_8);
                            String keyOriginal = new String(logdecoded, StandardCharsets.UTF_8);
                            Double valor = Double.parseDouble(idOriginal);
                            Double llave = Double.parseDouble(keyOriginal);
                            Double res =new Double( valor * llave); 
                            int original = (int) Math.round(res);
                            String sres = request.getParameter("o"); 
                           
                            System.out.println(original);
                            System.out.println(original+"holapyuedeesto");
                           
                            set = con.createStatement();
                        
                             String  per = "INSERT INTO no_entregado_per_experiencias (titulo,queperdio,foto,lugardeentrega,horario,horapubli,tipo,id_usuario,ene,experiencia) SELECT  titulo,queperdio,foto,lugardeentrega,horario,horapubli,tipo,id_usuario,'No','"+sres+"'  FROM entregado_perdido WHERE id_entregado_perdido = "+original; 
                 
                                  int experi = set.executeUpdate(per);
                      
                            
                %>
 <script>
                     
        Swal.fire({
  backdrop:true,
  allowOutsideClick: false,          
  title: 'Tu mala experiencia nos servira y trataremos de mejorar',
  confirmButtonText: 'Aceptat',
  icon:'success'
  
}).then((result) => {
  if (result.isConfirmed) {
      console.log("hola");
      window.location.replace("preguntascontestadas.jsp");
  } 
})
                            
                
     </script>
                <% 
                            set.close();
                    
                        }catch(SQLException ed){
                            System.out.println("Error al consultar la tabla");
                            System.out.println(ed.getMessage());
                            %>
            <h1>Recurso no disponible solo juguito contigo UwU</h1>
                            <%
                        
                        }
                        con.close();
                    
                  %>
    </head>
    </body>
  
</html>
