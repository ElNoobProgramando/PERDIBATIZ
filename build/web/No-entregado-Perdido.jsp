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
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
            <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
                 <script src="js/editarperdido.js" ></script>
        <title>PERDIBATIZ</title>
        <%
        response.addHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setDateHeader("Expires", 0);
    
    %>
      <div class="barraroja">
         <p class="per" >PERDIBATIZ</p> 
       </div>
    </head>
    <body>  
                <% 
           Connection con = null;
            Statement set = null;
            ResultSet rsad = null;
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
                            
                            System.out.println(original);
                            System.out.println(original+"holapyuedeesto");
                           
                            set = con.createStatement();
                             String  q = "INSERT INTO entregado_perdido (titulo,queperdio,foto,lugardeentrega,horario,horapubli,tipo,id_usuario,ene,id_perdido) SELECT  titulo,queperdio,foto,lugarentrega,horario,horapubli,tipo,id_usuario,'No',idperdido FROM perdido WHERE idperdido = "+original;  
                             String w = "DELETE FROM perdido WHERE idperdido="+original;
                             String as = "select titulo,queperdio,id_usuario,id_entregado_perdido from entregado_perdido where id_perdido='"+original+"'";
                             int registro = set.executeUpdate(q);
                              int eliminar = set.executeUpdate(w);
                              rsad = set.executeQuery(as);
                        
                           
                              if(rsad.next()){

           
        
                %>
                <div class="cuadro">
                        <select class="lugare" name="o" id="o" >
                      <option >No es el mismo objeto de la publicación</option>
                      <option >La persona no se presento</option>
                      <option >No se entrego por causa de Fenómenos naturales</option>
                      <option >La escuela está cerrada</option>
                      <option >Otro</option>
                        </select>
        <button  value="<%=rsad.getString("id_entregado_perdido")%>" onclick="valor(this.value, document.getElementById('o').value)" >ENVIAR</button>
                </div>
                <% String srsaes = request.getParameter("o"); 
                                System.out.println(srsaes+"yo soy o");
                         }   
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
      <script>
        function valor(val,val1)
                 {
                    var xd =document.getElementById('o').value;
                    console.log(xd);
                   const now = Date.now();
                   var resultado = (parseInt(val) / now);
                   var key = btoa(now.toString());
                   var mensaje =btoa(resultado.toString());
                   console.log(mensaje + key + " epoc " + now);
                   window.location.replace("no_entregado_per_experiencias.jsp?id="+mensaje+"&o="+val1+"&log="+key);
                    
                 
                   return false;
                 }
        </script>           
</html>
