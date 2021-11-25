<%-- 
    Document   : mostrarentrega.jsp
    Created on : 21/10/2021, 09:01:08 PM
    Author     : yayah
--%>


<%@page import="java.nio.charset.StandardCharsets"%>
<%@page import="java.math.BigInteger"%>
<%@page import="java.security.MessageDigest"%>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*, java.util.*, java.text.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
            <script src="sweetalert2.all.min.js" type="text/javascript"></script>
            <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
            <script src="~/JS/Alertas.js" type="text/javascript"></script>
                   <link rel="stylesheet" href="CSSd/mostrarentregaspgllaves.css">
        <title>PERDIBATIZ</title>
    </head>
    <body>
               <div class="barraroja">
           <p class="per" >PERDIBATIZ</p> 
        
       </div>
      <%
            Connection con = null;
            Statement set = null;
            Statement seto = null;
            ResultSet rs = null;
            ResultSet rso = null;
            
            String url, userName, password, driver;
            
            url = "jdbc:mysql://localhost/rainsoft";
            userName = "root";
            password = "343122";
            driver = "com.mysql.jdbc.Connection";
            String id = request.getParameter("id"); 
            String term= request.getParameter("si");
            System.out.println(term);
                         
           
           
                Class.forName("com.mysql.jdbc.Driver");
                con = (Connection)DriverManager.getConnection(url, userName, password);
                   if(String.valueOf(session.getAttribute("id")) == null || String.valueOf(session.getAttribute("id")) == "null")
                        {
                            response.sendRedirect("paginadeerror.html"); 
                            System.out.println("Si entra");
                        }

                    
                     
                     String o = "select * from oportunidades where id_publicacion="+id+" AND id_usuario="+String.valueOf(session.getAttribute("id"));
                     seto = con.createStatement();
                     rso = seto.executeQuery(o);
                     
                     
                     if(rso.next())
                     {
                         
                         
                         String q = "select id_publi, horario ,lugar ,respuesta from encontrado  where id_publi="+id;
                         
                        String res="";
                        String s=""; 
                        set = con.createStatement();
                        rs = set.executeQuery(q);
                         System.out.println("aqui entra si hay algo");
                        String opor = rso.getString("intentos"); 
                        int cont = Integer.parseInt(opor);
                        if(cont < 4){
                         while(rs.next())
                         {
                         res = request.getParameter("o"); 
                         s = rs.getString("respuesta");
                          System.out.println(res+"este es res");
                          System.out.println(s+"este esta es la respuesta");
                          if (res.equals(s)){
                                            %>
                            
                                            
                <div class="cuadro">
                            <p class="texto"><%=rs.getString("horario")%></p>
                             <p class="texto"><%=rs.getString("lugar")%></p>
                             </div>

                         <%  }
                     else{
                      System.out.println("aqui no me mostrara nada");
                        q = "select intentos from oportunidades  where id_publicacion="+id+" AND id_usuario="+String.valueOf(session.getAttribute("id"));
                        set = con.createStatement();
                        rs = set.executeQuery(q);
                        while(rs.next())
                        {
                    System.out.println("aqui no me mostrara nada1");
                        String intento = rso.getString("intentos") ;
                        int i = Integer.parseInt(intento);
                        i++;
                        q = "UPDATE oportunidades SET intentos ="+i+" where id_publicacion="+id+" AND id_usuario="+String.valueOf(session.getAttribute("id"));
                        set = con.createStatement();
                        set.executeUpdate(q);
                        System.out.println(q);
                        }
                         %>
                                  <script>
                                           Swal.fire({
                        backdrop:true,
                       allowOutsideClick: false,                         
                       title: 'Respuesta Incorrecta',
                       confirmButtonText: 'Ir a Menu',
                       icon:'error'

                     }).then((result) => {
                       if (result.isConfirmed) {
                           console.log("hola");
                           window.location.replace("index.jsp");
                       } 
                     })
                                      </script>
                             <%

                     }
                         
                         } 
                        
                        }else{
                        
                        %>
                                  <script>
                                           Swal.fire({
                        backdrop:true,
                       allowOutsideClick: false,                         
                       title: 'Intentos terminados',
                       text:'Ya no puedes contestar esta pregunta',
                       confirmButtonText: 'Ir a Menu',
                       icon:'error'

                     }).then((result) => {
                       if (result.isConfirmed) {
                           console.log("hola");
                           window.location.replace("index.jsp");
                       } 
                     })
                                      </script>
                             <%
                    }
                        
                         
                     }
                     else{
                     System.out.println("aqui ya no llega");
                    String q = "select id_publi, horario ,lugar ,respuesta from encontrado  where id_publi="+id;
                    System.out.println("aqui no me mostrara nada2");
                    set = con.createStatement();
                    rs = set.executeQuery(q);
                     while(rs.next())
                     {
                    String res = request.getParameter("o"); ;
                    String s=String.valueOf(rs.getString("respuesta"));
                          System.out.println("aqui entra al while");
                          if (res.equals(s)){
                                            %>
                             <div class="cuadro"> 
                            <p class="texto"><%=rs.getString("horario")%></p>
                             <p class="texto"><%=rs.getString("lugar")%></p>
                             </div>

                         <%  }
                     else{
                        String idus= String.valueOf(session.getAttribute("id"));
                        q = "INSERT INTO oportunidades (id_publicacion, id_usuario, intentos) VALUES ('"+id+"', '"+idus+"', '1')";
                        set = con.createStatement();
                        set.executeUpdate(q);
                        System.out.println(q);
                         %>
                                  <script>
                                           Swal.fire({
                        backdrop:true,
                       allowOutsideClick: false,                         
                       title: 'Respuesta Incorrecta',
                       confirmButtonText: 'Ir a Menu',
                       icon:'error'

                     }).then((result) => {
                       if (result.isConfirmed) {
                           console.log("hola");
                           window.location.replace("index.jsp");
                       } 
                     })
                                      </script>
                             <%

                     }
                          
                         
                          
                         
                     }
                    }

                             %>

                     
                     

           
    </body>
</html>
                 
    </body>
</html>
<%!
   public String getMD5(String input){
try{

   
    MessageDigest md=MessageDigest.getInstance("MD5");
    byte[] encBytes=md.digest(input.getBytes());
    BigInteger numero=new BigInteger(1,encBytes);
    String encString=numero.toString(16);
    while(encString.length()<32){
        encString="0"+encString;
    }
    return encString;
    }catch(Exception e){
        throw new RuntimeException(e);
    }
} 





%>                            
