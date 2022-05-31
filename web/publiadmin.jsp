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
<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*, java.util.*, java.text.*" %>

<!DOCTYPE html>
<html>
    <head>
        <title>FoundApp</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="CSSd/CSSpubliadmin.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/jquery-jgrowl/1.4.1/jquery.jgrowl.min.css" />
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery-jgrowl/1.4.1/jquery.jgrowl.min.js"></script>
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
        <header class="barraroja">
             <STYLE>A {text-decoration: none;} </STYLE>

        </header>
        <div class="main-content wrapper2">
            <div class="box box-two">
                <% 
            //aqui va codigo java
            
            
            Connection con = null;
            Statement set = null;
            ResultSet rs = null;
             ResultSet rss = null;
            ResultSet rsd = null;
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
                            response.sendRedirect("paginadeerror.html"); 
                            System.out.println("Si entra");
                        }

                     System.out.println("Esta es la sesion "+String.valueOf(session.getAttribute("id")));
                     
                  String q = "select idperdido,titulo,queperdio,foto,horapubli,tipo,id_usuario, pruebadenulo.nombre from perdido INNER JOIN pruebadenulo ON perdido.id_usuario = pruebadenulo.numusua";
                    
                  String w = "select id_publi,titulo,queperdio,pglla,respuesta,tipo,fechadepubli,id_usuario,pruebadenulo.nombre from encontrado INNER JOIN pruebadenulo ON encontrado.id_usuario =pruebadenulo.numusua";
                  
                  
                  
                    String consulta = "select * from perdido where titulo like '%"+buscar+"%'";
                  
                     set = con.createStatement();
                     rs = set.executeQuery(q);
                     
                    
                     while(rs.next())
                     {
                         
                   %>
                <p class="titulo">PERDIDO</p> 
                  <img src="<%=rs.getString("tipo")%>" class="ventes">  
                   <div class="rectangulo" id="resultado">
                       <table id="dAtos">  
                   <p class="titupubli"><%=rs.getString("titulo")%></p>
                   <br>
                   <span class="queperdio">&nbsp;&nbsp;&nbsp;<%=rs.getString("queperdio")%></span>
                    <br>
                    <img src="<%=rs.getString("foto")%>" class="publicaciones">
                    <br>
                    <span class="fecha">&nbsp;&nbsp;&nbsp;Publicado: <%=rs.getString("horapubli")%></span>
                    <p class="titupublis">&nbsp;&nbsp;&nbsp;Creado por:<%=rs.getString("nombre")%></p>
                    <form action="eliminarperdido3" method="POST">
                    <button method ="post" class="preguntallave" id="botons" name="bt" style="color: white" value="<%=rs.getString("idperdido")%>" onclick="valores(this.value)">ELIMINAR
                    </button>
                      </form>
                       </table>
                   </div>
                    <%
                        }
                        rss = set.executeQuery(w);
                        while(rss.next()){
                        
                    %>
                    <p class="titulo">ENCONTRADO</p> 
                      <img src="<%=rss.getString("tipo")%>" class="ventes">
                   <div class="rectangulo" id="resultado">
                       <table id="dAtos">
                   <p class="titupubli"><%=rss.getString("titulo")%></p>
                   <br>
                   <span style="right: 5px; font-size: large; font:bold; position: relative; top: 47px;">&nbsp;&nbsp;&nbsp;<%=rss.getString("queperdio")%></span>
                    <br>
                     <span class="fecha">&nbsp;&nbsp;&nbsp;Publicado: <%=rss.getString("fechadepubli")%></span>
                      <p class="titupublis1">&nbsp;&nbsp;&nbsp;Creado por:<%=rss.getString("nombre")%></p>
                    <form action="eliminarperdido4" method="POST">
                     <button  class="preguntallaves" id="botons" style="color: white" name="bt1" value="<%=rss.getString("id_publi")%>" onclick="valo(this.value)">ELIMINAR
                    </button>
                     </form>
                       
                       </table>
                   </div>
                    
                    <%
                    }set.close();
                        con.close();
                     %>
            </div>
        </div>
 <header class="header">
		<div class="container">
		<div class="btn-menu">
			<label for="btn-menu">☰</label>
		</div>
			<div class="logo">
				<h1>FoudApp</h1>
			</div>
		
		</div>
	</header>
	<div class="capa"></div>
<!--	--------------->
<input type="checkbox" id="btn-menu">
<div class="container-menu">
	<div class="cont-menu">
		<nav>
			<a href="grafica.jsp">Estadistica de Perdido</a>
			<a href="grafica1.jsp">Estadistica de Encontrado</a>
			<a href="grafica2.jsp">Donde se pierden mas?</a>
			<a href="grafica3.jsp">Entregado Perdido</a>
                        <a href="grafica4.jsp">Entregado Encontrado</a>
                        <a href="grafica5.jsp">No entregado Encontrado</a>
                        <a href="grafica6.jsp">No entregado Perdido</a>
			<a href="agregaradmin.jsp">Agregar Admin</a>
			<a href="veradmin.jsp">Ver Admins</a>
                        <a href="menuadmin.jsp">Menu Admin</a>
                        <a href="quejasadmin.jsp">Ver Quejas</a>
		</nav>
		<label for="btn-menu">✖️</label>
	</div>
</div>
<style>
    
   
	*{
		margin: 0;
		padding: 0;
		box-sizing: border-box;
		font-family: 'Montserrat', sans-serif;
	}
        button{
            border:white;
            text-transform: uppercase;
            font-weight: bold;
            font-size: 10px;
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
                text-transform: uppercase;
                font-weight: bold;
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
    </body>
</html>
            <script>
                 
                 function valo(val)
                 {
                   
                   
                    window.location.replace("eliminarencontradoadmin.jsp?id="+val);
                    return false; 
                    
                      console.log(descifrado);
                   
                 }
                 
               
             </script>
               <script>
                 
                 function valores(val)
                 {
                   
                   
                    window.location.replace("eliminarpubliadmin.jsp?id="+val);
                    return false; 
                    
                      console.log(descifrado);
                   
                 }
                 
               
             </script>