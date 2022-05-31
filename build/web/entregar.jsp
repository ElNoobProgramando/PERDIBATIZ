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
          <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet">
  <SCRIPT type="text/javascript">
      window.onhashchange = function() {
 
};
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
            String id = request.getParameter("id"); 
            System.out.println(id+"holapyuedeesto");
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
               
                  String q = "select idperdido,lugarentrega,horario from perdido where idperdido = "+original;
                  
                  String Correo = request.getParameter("idperdido");
                  System.out.println("YO SOY EL ID DE LA PUBLI"+original);
                     set = con.createStatement();
                     rs = set.executeQuery(q);
                      
                      
                     while(rs.next())
                      
                     {
                         
                     
                       %>
 <form method="POST" action="publiguardada.jsp">
   <div class="cuadro">
        <p class="texto"><%=rs.getString("lugarentrega")%></p>
        <p class="texto"><%=rs.getString("horario")%></p>
        <button method ="post" class="guardar" id="guardar" style="color: white" value="<%=rs.getString("idperdido")%>" onclick="valor(this.value)">GUARDAR PUBLICACION</button>
   </div>
      </form>
       <%
           }


        %>
<script>
            
            
            
</script>
<script>
        
        time(); 
        async function time()
        {
         const ejet = setTimeout(() => {  window.location.replace("index.jsp"); },35000);
        console.log(ejet);
        }
        
    
</script>
<script>
            function valor(val)
                 {
                   const now = Date.now();
                   var resultado = (parseInt(val) / now);
                   var key = btoa(now.toString());
                   var mensaje =btoa(resultado.toString());
                   console.log(mensaje + key + " epoc " + now);
                   window.close();
                    window.open("publiguardada.jsp?id="+mensaje+"&log="+key);
                    
                    console.log(mensaje + key + " epoc " + now+"esto es lo que aveces agarra");
                   return false;
                   
                 }
    </script>
    </body>
</html>
