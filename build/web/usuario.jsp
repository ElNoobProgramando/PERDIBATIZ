<%-- 
    Document   : usuario.jsp
    Created on : 12/10/2021, 07:05:31 PM
    Author     : yayah
--%>


<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*, java.util.*, java.text.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="CSSd/cssusuario.css">
        <title>Cuenta Usuario</title>
         <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
            <script src="sweetalert2.all.min.js" type="text/javascript"></script>
            <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
            <script src="~/JS/Alertas.js" type="text/javascript"></script>
            <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet">
    </head>
     <%
    response.addHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setDateHeader("Expires", 0);
        
    %>
  
    
    <body>
<div> 
 
           
         <header class="barraroja">
        </header>
        <h1><span class="tuspu">Tus Publicaciones</span></h1>
       <header class="header">
		<div class="container">
		<div class="btn-menu">
                    <label for="btn-menu" style="position: relative;left: -340px;">☰</label>
		</div>
			<div class="logo">
				<h1 style="font-weight: bold;letter-spacing: 2px; font-size: 20px; position:relative; width:300px; top:-15px">FOUNDAPP</h1>
			</div>
		
		</div>
	</header>
	<div class="capa"></div>
<!--	--------------->
<input type="checkbox" id="btn-menu">
<div class="container-menu">
	<div class="cont-menu">
		<nav>
			<a href="logout.jsp" >Cerrar Sesion</a>
                        <form action="usuariodatos.jsp">
			<a href="usuariodatos.jsp">Modificar mis Datos</a>
                        </form>
                        <from action="preguntascontestadas.jsp">
			<a href="preguntascontestadas.jsp">Preguntas Contestadas</a>
                        </from>
                        <from>
                            <a href="quejas.jsp">Quejas</a>
                        </from>
                </nav>
		<label for="btn-menu">✖️</label><label for="btn-menu" style="position: relative;left: -340px;">☰</label>
	</div>
</div>
<style>
    
    
	*{
		
		box-sizing: border-box;
		font-family: 'Montserrat';
	}
	body{
                background-color: white;
		background-size: 100vw 100vh;
		background-repeat: no-repeat;
	}
	.capa{
		position: fixed;
		width: 100%;
		height: 100vh;
		background: white;
		z-index: -1;
		top: 0;left: 0;
	}
	/*Estilos para el encabezado*/
	.header{
		width: 100%;
		height: 100px;
		position: fixed;
		top: 0;left: 0;
	}
	.container{
		width: 90%;
		max-width: 1200px;
		margin: auto;
	}
	.container .btn-menu, .logo{
		float: left;
		line-height:100px;
	}
	.container .btn-menu label{
		color: #fff;
		font-size: 25px;
		cursor: pointer;
	}
	.logo h1{
		color: #fff;
		font-weight: 400;
		font-size: 22px;
		margin-left: 10px;
                left: 10px;
                text-transform: uppercase;
	}
	.container .menu{
		float: right;
		line-height: 100px;
	}
	.container .menu a{
		display: inline-block;
		padding: 15px;
		line-height: normal;
		text-decoration: none;
		color: white;
		transition: all 0.3s ease;
		border-bottom: 2px solid transparent;
		font-size: 15px;
		margin-right: 5px;
	}
	.container .menu a:hover{
		border-bottom: 2px solid #c7c7c7;
		padding-bottom: 5px;
	}
	/*Fin de Estilos para el encabezado*/

	/*Menù lateral*/
	#btn-menu{
		display: none;
                right: 300px;
                position: relative;
	}
	.container-menu{
		position: absolute;
		background: rgba(0,0,0,0.5);
		width: 100%;
		height: 100vh;
		top: 0;left: 0;
		transition: all 500ms ease;
		opacity: 0;
		visibility: hidden;
	}
	#btn-menu:checked ~ .container-menu{
		opacity: 1;
		visibility: visible;
	}
	.cont-menu{
		width: 100%;
		max-width: 250px;
		background:rgba(255,255,255,0);
                background: -webkit-linear-gradient(-90deg , rgba(224.19,28.96,75.77,1) 0%, rgba(224.19,28.96,75.77,0.68) 100%);
                background: -o-linear-gradient(-90deg , rgba(224.19,28.96,75.77,1) 0%, rgba(224.19,28.96,75.77,0.68) 100%);
                background: -moz-linear-gradient(-90deg , rgba(224.19,28.96,75.77,1) 0%, rgba(224.19,28.96,75.77,0.68) 100%);
                background: -ms-linear-gradient(-90deg , rgba(224.19,28.96,75.77,1) 0%, rgba(224.19,28.96,75.77,0.68) 100%);
                background: linear-gradient(-90deg , rgba(224.19,28.96,75.77,1) 0%, rgba(224.19,28.96,75.77,0.68) 100%);
		height: 100vh;
		position: relative;
		transition: all 500ms ease;
		transform: translateX(-100%);
	}
	#btn-menu:checked ~ .container-menu .cont-menu{
		transform: translateX(0%);
	}
	.cont-menu nav{
		transform: translateY(15%);
	}
	.cont-menu nav a{
		display: block;
		text-decoration: none;
		padding: 20px;
		color: #c7c7c7;
		border-left: 5px solid transparent;
		transition: all 400ms ease;
	}
	.cont-menu nav a:hover{
		border-left: 5px solid #c7c7c7;
		background: #1f1f1f;
	}
	.cont-menu label{
		position: absolute;
		right: 5px;
		top: 10px;
		color: #fff;
		cursor: pointer;
		font-size: 18px;
	}
	/*Fin de Menù lateral*/
</style>
    <div class="box ">
     
            
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
            driver = "com.mysql.jdbc.Connection";
            if(String.valueOf(session.getAttribute("id")) == null || String.valueOf(session.getAttribute("id")) == "null")
                        {
                            
                            response.sendRedirect("paginadeerror.html"); 
                            System.out.println("Si entra");
                        }
            
           
                Class.forName("com.mysql.jdbc.Driver");
                con = (Connection)DriverManager.getConnection(url, userName, password);
                
                
                  String q = "select idperdido,titulo,queperdio,foto,horapubli,tipo from perdido WHERE id_usuario='"+session.getAttribute("id")+"'";;
                  String w = "select id_publi,titulo,queperdio,dondeloen,lugar,tipo,fechadepubli from encontrado WHERE id_usuario='"+session.getAttribute("id")+"'";;
                    String a = request.getParameter("idperdido");
                  
                  
                     set = con.createStatement();
                     rs = set.executeQuery(q);
                     
                     while(rs.next())
                     {
                     
                   %>
                   <div class="rectangulo">
                          <p style="position: relative; top: 0px;    text-align: center; font-weight: bold;">--------------------PERDIDO-------------------</p>
                   <p class="titupubli"><%=rs.getString("titulo")%></p>
                   <br>
                   <span style="right: 5px; font-size: large; font:bold;">&nbsp;&nbsp;&nbsp;<%=rs.getString("queperdio")%></span>
                    <br>
                     <br>
                    <img src="<%=rs.getString("tipo")%>" class="publicaciones2">
                    <br>
                    <img src="<%=rs.getString("foto")%>" class="publicaciones" onclick="return imagen(this.src)">
                    <br>
                    <span class="fecha">&nbsp;&nbsp;&nbsp;Publicado: <%=rs.getString("horapubli")%></span>
                    <button method ="post" class="marcarentrega" id="boton" style="color: white" value="<%=rs.getString("idperdido")%>" onclick="valor(this.value)">Editar
                    </button>
                    <form action="eliminarperdido" method="POST">
                    <button method ="post" class="marcarentrega2" id="botons" name="bt" style="color: white" value="<%=rs.getString("idperdido")%>" onclick="valores(this.value)">ELIMINAR
                    </button>
                      </form>
                    </div>
               
                    
               
                    <%
                        }
                    rss =set.executeQuery(w);
                    while(rss.next()){

                    %>
                 
                   <div class="rectangulo">
                           <p style="    position: relative; top: 0px;    text-align: center; font-weight: bold;">--------------------ENCONTRADO-------------------</p>
                   <p class="titupubli"><%=rss.getString("titulo")%></p>
                   <br>
                   <span style="right: 5px; font-size: 15px; font-weight:bold;">&nbsp;&nbsp;&nbsp;<%=rss.getString("queperdio")%></span>
                    <br>
                    <img src="<%=rss.getString("tipo")%>" class="publicaciones">
                    <br>
                    <span class="fecha">&nbsp;&nbsp;&nbsp;Publicado: <%=rss.getString("fechadepubli")%></span>
                   <button class="marcarentrega1" id="boton" style="color: white" value="<%=rss.getString("id_publi")%>" onclick="valore(this.value)">Editar
                    </button>
                     <form action="eliminarperdido2" method="POST">
                     <button  class="marcarentrega2" id="botons" style="color: white" name="bt1" value="<%=rss.getString("id_publi")%>" onclick="valo(this.value)">ELIMINAR
                    </button>
                     </form>
     
                   
                    </div>
                   
                   <%
                       }set.close();
                        con.close();
                        


                    %>
              
                   
                   </div>

  </div>
    
    </body>
   

<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/4.1.1/crypto-js.min.js" > </script>
  <script type="text/javascript">
                 
                
                  function valor(val)
                 {
                   const now = Date.now();
                   var resultado = (parseInt(val) / now);
                   var key = btoa(now.toString());
                   var mensaje =btoa(resultado.toString());
                   console.log(mensaje + key + " epoc " + now);
                   window.location.replace("editarperdido.jsp?id="+mensaje+"&log="+key);
                   return false;
                 }
                 
                  function valore(val)
                 {
                   const now = Date.now();
                   var resultado = (parseInt(val) / now);
                   var key = btoa(now.toString());
                   var mensaje =btoa(resultado.toString());
                   console.log(mensaje + key + " epoc " + now);
                   
                    window.location.replace("editarpubli.jsp?id="+mensaje+"&log="+key);
                   return false;
                 }
                 
                 input.onchange =function vamos()
                 {
                    window.location.replace("editarpubli.jsp");
                 }
               
             </script>
              <script>
                 
                 function valores(val)
                 {
                   
                   
                    window.location.replace("eliminarpubli.jsp?id="+val);
                    return false; 
                    
                      console.log(descifrado);
                   
                 }
                 
               
             </script>
              <script>
                 
                 function valo(val)
                 {
                   
                   
                    window.location.replace("eliminarencontrado.jsp?id="+val);
                    return false; 
                    
                      console.log(descifrado);
                   
                 }
                 
               
             </script>
             </html>
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