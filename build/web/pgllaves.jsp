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
           <script src="js/respuepgllaves.js" ></script>
            <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
            <script src="sweetalert2.all.min.js" type="text/javascript"></script>
            <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
            <script src="~/JS/Alertas.js" type="text/javascript"></script>
         
    <script>
    function deshabilitaRetroceso(){
    window.location.hash="no-back-button";
    window.location.hash="Again-No-back-button" //chrome
    window.onhashchange=function(){window.location.hash="no-back-button";}
}
</script>

    </head>
    <body>
     <body onload="deshabilitaRetroceso()"></body>

      
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
                
                Class.forName("com.mysql.jdbc.Driver");
                con = (Connection)DriverManager.getConnection(url, userName, password);
                if(String.valueOf(session.getAttribute("id")) == null || String.valueOf(session.getAttribute("id")) == "null")
                        {
                            response.sendRedirect("paginadeerror.html"); 
                            System.out.println("Si entra");
                        }
                 String key = request.getParameter("log");
                            byte[] iddecoded = Base64.getDecoder().decode(id);
                            byte[] logdecoded = Base64.getDecoder().decode(key);
                            String idOriginal = new String(iddecoded, StandardCharsets.UTF_8);
                            String keyOriginal = new String(logdecoded, StandardCharsets.UTF_8);
                            Double valor = Double.parseDouble(idOriginal);
                            Double llave = Double.parseDouble(keyOriginal);
                            Double res =new Double( valor * llave); 
                            int original = (int) Math.round(res);
                  String q = "select id_publi,pglla,respuesta from encontrado where id_publi = "+original;
                  
                  String s=""; 
                     set = con.createStatement();
                     rs = set.executeQuery(q);
                      
                      
                     while(rs.next())
                      
                     {
                         
                     
                       %><div class="cuadro">
        <p class="texto"><%=rs.getString("pglla")%></p>
         
           
        
        <input class="respuesta"  id="o" name="o">
        <button  method="POST"  class="boton" style="color: white"  value="<%=rs.getString("id_publi")%>" onclick="valor(this.value, document.getElementById('o').value, <%=String.valueOf(session.getAttribute("id"))%>)" >Continuar</button>
        
        
    </div>
        <div>
            <p>Tu intento acaba en :</p>
            <h1> <div class="segundos" id="segundos"></div></h1>
            
            
        </div>
        <%  
                     }


        %>
        <script>
        let segundos=0;
cargarsegundo();
    function cargarsegundo(){
    let txtsegundos;
    if(segundos<0){
        segundos=35;
        
    }
    if(segundos <1){
        txtsegundos ='0${segundos}';
        
    }else{
        txtsegundos = segundos;
    }
    document.getElementById('segundos').innerHTML=segundos;
    segundos --;
}
setInterval(cargarsegundo,1000);
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
               
                 function valor(val, val1, val2){
                                    var respuesta = document.getElementById('o');
                     const now = Date.now();
                    var resultado = (parseInt(val,val2) / now);
                    var key = btoa(now.toString());
                    var mensaje =btoa(resultado.toString());

                    window.open("mostrarentrega.jsp?id="+val+"&o="+val1+"&usr="+val2+"&log="+key);
                    window.close();
                    console.log(val);
                     return false;
                     
       
                            }
                        
                 
</script>


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

