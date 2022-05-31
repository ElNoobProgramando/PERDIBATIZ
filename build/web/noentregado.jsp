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
        <link rel="stylesheet" href="CSSd/CSSinicioSesion.css">
            <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
            <script src="sweetalert2.all.min.js" type="text/javascript"></script>
            <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
            <script src="~/JS/Alertas.js" type="text/javascript"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet">
        <title>JSP Page</title>
                 <script src="js/editarperdido.js" ></script>
        <title>PERDIBATIZ</title>
          <div class="barraroja">
         <p class="per" >FOUNDAPP</p> 
       </div>
        <%
        response.addHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setDateHeader("Expires", 0);
    
    %>
    </head>
    <body>
    
                
                <% 
           Connection con = null;
            Statement set = null;
            ResultSet rs = null;
            ResultSet rss = null;
             ResultSet rsad  = null;
            
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
                             String  q = "INSERT INTO entregado_encontrado (titulos,queperdios,dondeloens,pglla,respuestas,lugars,horarios,fechadepublis,tipos,id_usuarios,entregado,id_encontrado) SELECT  titulo,queperdio,dondeloen,pglla,respuesta,lugar,horario,fechadepubli,tipo,id_usuario,'No',id_publi FROM encontrado WHERE id_publi = "+original;  
                             String w = "DELETE FROM encontrado WHERE id_publi="+original;
                             String as = "select titulos,queperdios,id_usuarios,id_publi from entregado_encontrado where id_encontrado='"+original+"'";
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
        <button  style=" color: white;border: white; text-transform: uppercase; font-weight: bold; border-radius: 30px; width: 80px; height: 40px; background: rgba(224.19,28.96,75.77,1);" value="<%=rsad.getString("id_publi")%>" onclick="valor(this.value, document.getElementById('o').value)" >ENVIAR</button>
                </div>
                <%     
                                
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
          <script>
        function valor(val,val1)
                 {
                   const now = Date.now();
                   var resultado = (parseInt(val) / now);
                   var key = btoa(now.toString());
                   var mensaje =btoa(resultado.toString());
                   console.log(mensaje + key + " epoc " + now);
                   window.location.replace("no_entregado_encon_experiencias.jsp?id="+mensaje+"&o="+val1+"&log="+key);
                    
                 
                   return false;
                 }
        </script> 
    </body>
</html>
