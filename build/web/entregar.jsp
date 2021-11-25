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
        <title>PERDIBATIZ</title>
          <link rel="stylesheet" href="CSSd/csspreguntallave.css">
  <SCRIPT type="text/javascript">
      window.onhashchange = function() {
 
}
	window.history.forward();
	function noBack() { window.history.forward(); }
</SCRIPT>

    </head>
    <body onload="noBack();" onpageshow="if (event.persisted) noBack();" onunload="" >
   
       <div class="barraroja">
           <p class="per" >PERDIBATIZ</p> 
        
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
                            
                            System.out.println(original);
                            System.out.println(original+"holapyuedeesto");
               
                  String q = "select idperdido,lugarentrega,horario from perdido where idperdido = "+original;
                 
                     set = con.createStatement();
                     rs = set.executeQuery(q);
                      
                      
                     while(rs.next())
                      
                     {
                         
                     
                       %>
                       <form method="POST" action="POST">
   <div class="cuadro">
        <p class="texto"><%=rs.getString("lugarentrega")%></p>
          <p class="texto"><%=rs.getString("horario")%></p>
       
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
    </body>
</html>
  <script>
               
                 function valor(val, val1){
                     

                    window.open("mostrarentrega.jsp?id="+val+"&o="+val1);
                    console.log(val);
                     return false;
                    }
                   
                 
</script>