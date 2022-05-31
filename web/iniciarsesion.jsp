<%-- 
    Document   : iniciarsesion.jsp
    Created on : 28/09/2021, 07:30:45 PM
    Author     : yayah
--%>
<%@page import="java.math.BigInteger"%>
<%@page import="java.security.MessageDigest"%>

<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@page import="java.math.BigInteger"%>
<%@page import="java.security.MessageDigest"%>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*, java.util.*, java.text.*,  encapsulamiento.Logueo,  encapsulamiento.ConexionDB"  %>
 <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
            <script src="sweetalert2.all.min.js" type="text/javascript"></script>
            <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
            <script src="~/JS/Alertas.js" type="text/javascript"></script>
            <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
            <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet">
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FOUNDAPP</title>
        
              <script>
    document.addEventListener('onhaschange', function(){}, false);
    if("onhaschange" in window){
   // sí lo soporta
}
	</script>

    </head>
    <body>
        <% 
            //aqui va codigo java
            Connection con = null;
            Statement set = null;
            ResultSet rs = null;
             ResultSet raza = null;
           
            
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
                        
                
                try{
                    String q,currentDate ;
                    Date objDate = new Date();
                    SimpleDateFormat ft = 
                    new SimpleDateFormat ("dd/MM/yyyy HH:mm:ss");
                    currentDate  = ft.format(objDate);
                       String co = (String)request.getAttribute("co");
                       String pas = (String)request.getAttribute("pas");
                       System.out.println(co);
                       int valor = 1;
                       System.out.println(pas);
                    q = "select numusua, id_admi from pruebadenulo where correol='"+getMD5(co)+"' and contraseña='"+getMD5(pas)+"'";
                    String hola = "UPDATE pruebadenulo SET ultimaconexion='"+currentDate+"'"
                            + "WHERE id_admi ='"+valor+"'";;
                       
                    
                  set = con.createStatement();
                            rs = set.executeQuery(q);
                           
                            System.out.println(q);
                            
                            if(rs.isBeforeFirst())
                            {
                                while(rs.next()){
                             Boolean usr = rs.getBoolean("id_admi");
                             if(usr){
                                 session.setAttribute("id", rs.getString("numusua"));
                             
                            
                            String idS = String.valueOf(session.getAttribute("id")); 
                           
                            set = con.createStatement();
                            rs = set.executeQuery(q);
                            
                                if(rs.isBeforeFirst() && idS!=null)
                                {
                                    int registro = set.executeUpdate(hola);
                                    response.sendRedirect("menuadmin.jsp"); 
                                    
                                }
                                else   
                                {  
                                    
                                 %> 
                                 
                                 <script>
                                   Swal.fire({
                                  backdrop:true,
                                  allowOutsideClick: false, 
                                  icon: 'error',
                                  title: 'Inicio de sesion',
                                  text: 'Datos incorrectos',
                                  
                                   })
                                 </script> <%  
                                     
                                 response.sendRedirect("crearsesionl.html"); 
                                     
                                }
                             }
                                else{
                                session.setAttribute("id", rs.getString("numusua"));
                             
                            
                            String idS = String.valueOf(session.getAttribute("id")); 
                            Cookie miCookie = new Cookie ("ingresacorreo", request.getParameter("ingresacorreo"));
                            Cookie pass = new Cookie ("contra", request.getParameter("contra"));
                            miCookie.setMaxAge(60*60*10);
                            pass.setMaxAge(60*60*10);
                            response.addCookie(miCookie);
                            response.addCookie(pass);
                            System.out.println("si sirve mi cookie"+miCookie);
                            
                            set = con.createStatement();
                            rs = set.executeQuery(q);
                        
                                if(rs.isBeforeFirst() && idS!=null)
                                {
                                    response.sendRedirect("index.jsp");
                                    System.out.println(miCookie +"paso?");

                                }
                                else   
                                {  
                                    
                                 %> <script>
                                   Swal.fire({
                                  backdrop:true,
                                  allowOutsideClick: false, 
                                  icon: 'error',
                                  title: 'Inicio de sesion',
                                  text: 'Datos incorrectos',
                                  
                                   })
                                 </script> <%  
                                     
                                 response.sendRedirect("crearsesionl.html"); 
                                     
                                }
                                }
                             
                            }
                            
                                    
                      
                            rs.close();
                            set.close();
                            rs.close();
                            set.close();
                                
                            }
                            
                            
                            
                            else
                            {
                                 %> <script>
                             Swal.fire({
                            backdrop:true,
                            allowOutsideClick: false,      
                            title: 'Datos incorrectos',
                            text: '${loginError}',
                            icon: 'error',
                            showCancelButton: false,
                            confirmButtonColor: '#3085d6',
                            cancelButtonColor: '#d33',
                            confirmButtonText: 'Aceptar'
                          }).then((result) => {
                            if (result.isConfirmed) {
                              window.location.replace("logueo.jsp");
                            }
                          })
                                 
                                 </script> <%
                              
                            }
                        }catch(SQLException ed){
                            System.out.println("Error al consultar la tabla");
                            System.out.println(ed.getMessage());
                            %>
            </body>
            <h1>Recurso no disponible solo juguito contigo UwU</h1>
                            <%
                        
                        }
                        con.close();
                    
                    }catch(Exception e){
                        System.out.println("Error al conectar con la bd");
                        System.out.println(e.getMessage());
                        System.out.println(e.getStackTrace());
                        %>
        <h1>Sitio en Construcción</h1>            
                    <%
                    
                    }
                    
                    %>
           
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
                    