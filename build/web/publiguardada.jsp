<%@page import="java.nio.charset.StandardCharsets"%>
<%@page import="java.nio.charset.StandardCharsets"%>
<%@page import="java.math.BigInteger"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*, java.util.*, java.text.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FOUNDAPP</title>
          <link rel="stylesheet" href="CSSd/csspreguntallave.css">
                 <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
            <script src="sweetalert2.all.min.js" type="text/javascript"></script>
            <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
            <script src="~/JS/Alertas.js" type="text/javascript"></script>
            <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet">
  <SCRIPT type="text/javascript">
      window.onhashchange = function() {
 
}
	window.history.forward();
	function noBack() { window.history.forward(); }
</SCRIPT>
    </head>
    <body onload="noBack();" onpageshow="if (event.persisted) noBack();" onunload="" >
       <div class="barraroja">
         <p class="per" >FOUNDAPP</p> 
       </div>
      <%
            Connection con = null;
            Statement set = null;
            ResultSet rs = null;
            
            String url, userName, password, driver;
            
            url = "jdbc:mysql://localhost/rainsoft";
            userName = "root";
            password = "343122";
            driver = "com.mysql.jdbc.Connection";
               String idS = String.valueOf(session.getAttribute("id"));
                String co = (String)request.getAttribute("idperdido");
                  String id = request.getParameter("id"); 
                 if(String.valueOf(session.getAttribute("id")) == null || String.valueOf(session.getAttribute("id")) == "null")
                        {
                            response.sendRedirect("logueo.jsp"); 
                            System.out.println("Si entra");
                        }
                Class.forName("com.mysql.jdbc.Driver");
                con = (Connection)DriverManager.getConnection(url, userName, password);
                          String key = request.getParameter("log");
                            byte[] iddecoded = Base64.getDecoder().decode(id);
                            byte[] logdecoded = Base64.getDecoder().decode(key);
                            String idOriginal = new String(iddecoded, StandardCharsets.UTF_8);
                            String keyOriginal = new String(logdecoded, StandardCharsets.UTF_8);
                            Double valor = Double.parseDouble(idOriginal);
                            Double llave = Double.parseDouble(keyOriginal);
                            Double res =new Double( valor * llave); 
                            int original = (int) Math.round(res);
               
                      String  q = "insert into publiguardada(id_publi, id_usuario) "+ "values ('"+original+"', '"+idS+"')";
                    
                   
                     set = con.createStatement();
                   int registro = set.executeUpdate(q);
                      
                      

                         
                     
                       %>
                 <script>
                   
        Swal.fire({
  backdrop:true,
  allowOutsideClick: false,          
  title: 'Publicacion guardada con exito',
  confirmButtonText: 'Ok',
  icon:'success'
  
}).then((result) => {
  if (result.isConfirmed) {
      console.log("hola");
      window.location.replace("index.jsp");
  } 
})
                            
                        
        </script>
<script>
        
        time(); 
        async function time()
        {
         const ejet = setTimeout(() => {  window.location.replace("index.jsp"); },35000);
        console.log(ejet);
        }
        
    </script>
    </body>
</html>
