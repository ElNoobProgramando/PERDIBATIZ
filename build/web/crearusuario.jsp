<%-- 
    Document   : crearusuario
    Created on : 30/09/2021, 01:07:57 AM
    Author     : yayah
--%>
<%@page import="java.math.BigInteger"%>
<%@page import="java.security.MessageDigest"%>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*, java.util.*, java.text.*, encapsulamiento.Crear,encapsulamiento.ConexionDB" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PERDIBATIZ</title>
       
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
            ResultSet rss = null;
            
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
                    String correo, contrase, numboleta, nombre,terminos,q,w,o;
                    correo = request.getParameter("correo");
                    contrase = request.getParameter("contrase");
                    numboleta= request.getParameter("numboleta");
                    nombre = request.getParameter("nombre");
                    terminos = request.getParameter("terminos");
                    Crear c1 = new Crear(correo, contrase, numboleta,nombre); 
                    set = con.createStatement();
                   
                    q = "insert into pruebadenulo(correol, contraseña,numboleta,nombre,avisopriva) "+ "values ('"+getMD5(c1.getCorreo())+"', '"+getMD5(c1.getContrasena())+"', '"+getMD5(c1.getNumboleta())+"', '"+c1.getNombre()+"', '"+terminos+"')";
                    
                   
                    o = "select * from pruebadenulo where correol='"+getMD5(c1.getCorreo())+"'";
                    
                    w = "select * from pruebadenulo where numboleta='"+getMD5(c1.getNumboleta())+"'";
                    rs = set.executeQuery(w);
                    rs = set.executeQuery(o);
                    %>
        
        <% 
         if (rs.next()){   //insert id en cliente.codecliente
        %>
         <script>
                   
        Swal.fire({
  backdrop:true,
  allowOutsideClick: false,          
  title: 'Tu numero de boleta o El correo ya fue registrado por otro usuario ',
  confirmButtonText: 'Save',
  icon:'error'
  
}).then((result) => {
  if (result.isConfirmed) {
      console.log("hola");
      window.location.replace("crearsesionl.html");
  } 
})
                            
                        
        </script>
        
                    <%
                        
                        }
                    else{

                    int registro = set.executeUpdate(q);
%>
                    <script>
                   
        Swal.fire({
  backdrop:true,
  allowOutsideClick: false,          
  title: 'Tu registro fue exitoso',
  confirmButtonText: 'Save',
  icon:'success'
  
}).then((result) => {
  if (result.isConfirmed) {
      console.log("hola");
      window.location.replace("logueo.jsp");
  } 
})
                            
                        
        </script>
        
        <%




                    } 
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
