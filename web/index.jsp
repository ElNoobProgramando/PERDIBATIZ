 <%@page import="java.math.BigInteger"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%-- 
    Document   : menu.jsp
    Created on : 6/10/2021, 07:39:46 PM
    Author     : yayah
--%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*, java.util.*, java.text.*"%>

<!DOCTYPE html>
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
            <script src="sweetalert2.all.min.js" type="text/javascript"></script>
            <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
            <script src="~/JS/Alertas.js" type="text/javascript"></script>
             <link href="http://ksylvest.github.io/jquery-growl/stylesheets/jquery.growl.css" rel="stylesheet" type="text/css">

<html>
    <head>
        <title>PERDIBATIZ</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="CSSd/CSSmenu.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/jquery-jgrowl/1.4.1/jquery.jgrowl.min.css" />
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery-jgrowl/1.4.1/jquery.jgrowl.min.js"></script>
         <script src="//cdnjs.cloudflare.com/ajax/libs/jquery-jgrowl/1.4.1/jquery.jgrowl.min.js"></script>
         <script src="js/jquery-3.5.1.min.js"></script>
         <script src="js/menu1.js" ></script>  
    </head>
    <%
    response.addHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setDateHeader("Expires", 0);
        
    %>
    

    <body>
            
        <header class="barraroja">
            <p class="per">PERDIBATIZ</p>
        </header>
       
     	<tr class="buscador">
	<td class="buscador"><input type="text" id="tfBuscar" class="Buscador" placeholder="Buscar..." /></td>
	
        
        <section class="imagenempredos">
        </section>          
        <img src="images/nose.png" class="imagenusuario" onclick="ir()"/></div>    
          <div class="obenco"> 
            <h2 style="color: black" class="f">FILTROS</h2>
            <a name="obenco" style="color: black">Encontrado</a>
            </div>
            <div class="linea"></div>
            <h2 class="est" style="color: black">ESTADO</h2>
            <div class="obexco">
                 <label  for="color">
                      <input type="radio" name="color" id="EX" value="Tecnologico" class="tecnologico" >
                      <label for="EX" class="SI">EXTRAVIADO</labe>
                      <br>
                    </label>
                    <br>
                  <label>
                    <input type="radio" name="color" value="Ropa" id="en" class="ropa1" value="ENCONTRADO"  >
                    <label for="en">ENCONTRADO</label>
                </label>
                   <br>
                     <label >
                      <input type="radio" name="color1" id="tec" value="Escolar" class="escolar"  > 
                      <label for="tec">TECNOLOGICO</label>
                     
                </label>
                  <br>
                   <label>
                      <input type="radio" name="color1" id="esc" value="Escolar" class="escolar"  > 
                      <label for="esc">ESCOLAR</label>
                </label>
                <br>
                <label >
                      <input type="radio" name="color1" id="perso" value="Escolar" class="escolar"  > 
                      <label for="perso">PERSONAL</label>
                     
                </label>
                <br>
                    <label >
                      <input type="radio" name="color1" id="ropa" value="Escolar" class="escolar"  > 
                      <label for="ropa">ROPA</label>
                     
                </label>
                    <br>
                    <label>
                      <input type="radio" name="color1" id="otros" value="Escolar" class="escolar"  > 
                      <label for="OTROS">OTROS</label>
                </label>
                  <br>
        </div>
     
        </div>
            <div class="box box-two">
                <% 
            //aqui va codigo java
            
            
            Connection con = null;
            Statement set = null;
            ResultSet rs = null;
             ResultSet rss = null;
            ResultSet rsd = null;
            ResultSet rsds = null;
            ResultSet o = null;
            
            String url, userName, password, driver;
            
            url = "jdbc:mysql://localhost/rainsoft";
            userName = "root";
            password = "343122";
            driver = "com.mysql.jdbc.Connection";
             String buscar = request.getParameter("bu");
           
                Class.forName("com.mysql.jdbc.Driver");
                con = (Connection)DriverManager.getConnection(url, userName, password);
                
                        if(String.valueOf(session.getAttribute("id")) == null || String.valueOf(session.getAttribute("id")) == "null")
                        {
                           response.sendRedirect("logueo.jsp");
                        }
                         System.out.println("Session: "+String.valueOf(session.getAttribute("id")));
                     System.out.println("Esta es la sesion "+String.valueOf(session.getAttribute("id")));
                     
                  String q = "select idperdido,titulo,queperdio,foto,horapubli,tipo,id_usuario, pruebadenulo.nombre from perdido INNER JOIN pruebadenulo ON perdido.id_usuario = pruebadenulo.numusua";
                    
                  String w = "select id_publi,titulo,queperdio,pglla,respuesta,tipo,fechadepubli,id_usuario,pruebadenulo.nombre from encontrado INNER JOIN pruebadenulo ON encontrado.id_usuario =pruebadenulo.numusua";
                  
                  String ruti = "select nombre from pruebadenulo where numusua='"+session.getAttribute("id")+"'";;
                  
                     set = con.createStatement();
                     rs = set.executeQuery(q);
                     
                    
                     while(rs.next())
                     {
                   %>
                 <div class="rectangulo" id="resultado">  
                     <h3> <p class="encontrado">---------------------PERDIDO--------------------</p></h3> 
                   <img src="<%=rs.getString("tipo")%>" class="ventes"> 
                    <h1><p class="titupubli"><%=rs.getString("titulo")%></p></h1>
                   <br>
                   <br>
                   <span style="right: 5px; font-size: large; font:bold; position: relative; top: -99px;">&nbsp;&nbsp;&nbsp;Descripcion:<%=rs.getString("queperdio")%></span>
                    <br>
                    <img src="<%=rs.getString("foto")%>" value="<%=rs.getString("foto")%>" class="publicaciones"  id="img" onclick="return imagen(this.src)">
                    <br>
                    <span class="fecha">&nbsp;&nbsp;&nbsp;Publicado: <%=rs.getString("horapubli")%></span>
                    <p class="titupublis">&nbsp;&nbsp;&nbsp;Creado por:<%=rs.getString("nombre")%></p>
                    <button method ="post" class="preguntallave" id="boton" style="color: white" value="<%=rs.getString("idperdido")%>" onclick="valor(this.value)">Entregar
                    </button>
              
                   </div>
                    <br>
                    <br>
                    <%
                        }
                        rss = set.executeQuery(w);
                        while(rss.next()){
                        
                    %>
                     <div class="rectangulo" id="resultado"> 
                     <h3><p class="encontrado">---------------------ENCONTRADO--------------------</p></h3> 
                    <img src="<%=rss.getString("tipo")%>" class="ventes">          
                    <h1><p class="titupubli"><%=rss.getString("titulo")%></p></h1>
                    <br>
                    <span style="right: 5px; font-size: large; font:bold;">&nbsp;&nbsp;&nbsp;<%=rss.getString("queperdio")%></span>
                    <br>
                    <span class="fecha">&nbsp;&nbsp;&nbsp;Publicado: <%=rss.getString("fechadepubli")%></span>
                    <p class="titupublis1">&nbsp;&nbsp;&nbsp;Creado por:<%=rss.getString("nombre")%></p>
                    <button method ="post" class="preguntallaves" id="boton" style="color: white" value="<%=rss.getString("id_publi")%>" onclick="valore(this.value)">Pregunta Llave
                      </button>
                 
                             </div>
                      <br>
                      <br>
                      
                      <%
                      
                      
                      }o=set.executeQuery(ruti);
                       while(o.next()){
                      
                      %>
                      </div>
                    
                   
                      <span id="txtsaludo" class="g" ><%=o.getString("nombre")%></span>
                      
                    <%
                    
                        }set.close();

                        con.close();
                    %>
           
 <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script type="text/javascript">
$(document).ready(function() {
    setTimeout(function() {
        $(".content").fadeOut(1500);
    },3000);
 
    setTimeout(function() {
        $(".content2").fadeIn(1500);
    },6000);
});
</script>

            <div class="noticia">
            <p>NOTICIAS</p>
            </div>
       `<div class="twiter" class="api">
          <%  
              String nombreFichero = "C:\\TwitterTweets\\tweets.txt";
         ResultSet r = null;
        BufferedReader br = null;
        
          
           br = new BufferedReader(new FileReader(nombreFichero));
           
           String UTF8Str  = br.readLine();
           String texto = new String(UTF8Str.getBytes(),"UTF-8");
           String aux = ""; 
           String valor = ""; 
           String contenido=""; 
           Boolean flag = false; 
           for(int i = 10 ; i<texto.length(); i++)
           {
               
               aux += texto.charAt(i);
               aux = aux.replace("\"", "");
               aux = aux.replace("{", "");
               aux = aux.replace("}", "");
               System.out.println("aux: "+aux);
               
                switch(aux){
                    case "id":
                        for(int j = i+3 ; j<texto.length() ; j++)
                        {
                        if(texto.charAt(j) ==',' &&texto.charAt(j+1) =='"')
                        {   
                            valor = valor.replace("\"", ""); 
                            System.out.println("id: "+valor);
                            aux="";
                            
                            i=j; 
                            break;
                        }
                        valor += texto.charAt(j);
                        }
                        break;
                        case "text":
                        for(int j = i; j<texto.length() ; j++)
                        { 
                        if(texto.charAt(j) ==','&&texto.charAt(j+1) =='"'|| texto.charAt(j) =='}' &&texto.charAt(j+1) ==',')
                        {
                            contenido = contenido.replace("\"", ""); 
                            System.out.println("text: "+contenido);
                            aux="";
                             
                            i=j+1; 
                            break;
                        }
                        contenido += texto.charAt(j);
                        }
                        break; 
                }
                
                if(valor !="" && contenido != "" )
                {
          %>
          <br>
          <span class="text" style="color: black"><%=contenido%></span> 
          <br>
          <a class="text" id="enlace" href="https://twitter.com/_cecyt9/status/<%=valor%>">Ir al enlace</a>
          <br>
            <br>
          <%
                    valor="";
                    contenido="";
                }
                if(aux == "meta")
                {break;}
            }
          
         
               
               System.out.println(texto);
             
            
            %> 
       </div>
       <div class="v" style="background: rgba(224,19,28,96,75,77,1);"  >
       <a href="eleccionpubli.html"><button type="submit"  id="crearpublicacion"  style="
    left: 1282px;
    width: 237px;
    height: 40px;
    -ms-border-radius: 30px;
	-o-border-radius: 30px;
	-moz-border-radius: 30px;
	-webkit-border-radius: 30px;
	border-radius: 30px;
	background:rgba(224.19,28.96,75.77,1);
    font-size: 25px;
    color: white;
    top: -1182px;">
               Crear Publicacion</button></a> 
       </div>
 </body>
</html>    
<script>
$(function() {
      $.growl({
        title: "Growl",
        message: "errits already released in SU or Submitted for SU!"
      });
    });
</script>
<script>
function imagen(url) {


                    Swal.fire({

                        imageUrl: url,
                        backdrop: 'rgb(0 0 0 / 72%)',
                        confirmButtonColor: '#9A3324',
                        confirmButtonText: 'Aceptar',
                        allowOutsideClick: false,
                        allowEscapeKey: false
                    }).then((result) => {
                        if (result.isConfirmed) {
                            document.getElementById("tablaCursos").scrollLeft = 1000;
                        }
                    })



                }


</script>