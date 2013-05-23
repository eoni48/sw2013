<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<link type="text/css" rel="stylesheet" href="css/formulario_evento.css"></link>
	<link type="text/css" rel="stylesheet" href="css/common.css"></link>
	<title>Nuevo usuario</title>
</head>
<body>
<%
String type = (String)session.getAttribute("type");
String nick = (String)session.getAttribute("nick");
%>
	<div id="contenedor">
		<div id="cabezera">
			<div id="logo">
				<h1>Eventos</h1>
			</div>
			<div id="navegacion">
				<div id="menuNavegacion">
					<ul>
						<li class="inicio"><a href="index.jsp">Inicio </a></li>
						<li class="ultimo"><a href="lista_eventos.jsp">Eventos</a></li>
						<%
						if(type != null && type.equals("organizer")){
						%>
						<li class="ultimo"><a href="formulario_evento.jsp">Crear evento</a></li>
						<% 
						}
						
						
						if(nick == null){
						%>
							<li class="log"><a href="log.jsp">Log in </a></li>
						<%
						}
						else{
						%>
							<li class="log"><a><%out.println("Bienvenido, "+nick);%></a>
							 <a href="/login"> (No eres tu)</a>
							</li>
						<% 
						}
						%>
						
						
					</ul>
				
				</div>
			</div>
		</div>
		<div class="cuerpo">
			<div class="contenido">
				<div class="formulario">
					<!--<div class="superior">
						
					</div>-->
					<form  name="crear_usuario"  method="post" action="/nuevo_usuario" >
						
						<fieldset class="izquierda">
							<label>Nick:</label>
							<br />
							<input id="nick" type="text" name="nick" value=""/>
							
							<br />
							<br />
							<label>Nombre de usuario:</label>
							<br />
							<input id="nombre" type="text" name="nombre"/>
							
							<br />
							<br />
							
							<label>Tipo:</label>
							<br />
							<select id="tipo" name="tipo">
								<option value="normal">Normal</option>
								<option value="organizador">Organizador</option>
							</select>
							<br />
							<br />
						</fieldset>
						<fieldset class="derecha">
							<label>Contraseña:</label>
							<br />
							<input id="pass" type="password" name="pass"/>
							<br />
							<br />
							
							<label>Repetir Contraseña:</label>
							<br />
							<input id="pass2" type="password" name="pass2"/>
							
							<br />
							<br />
							
						</fieldset>
						<fieldset class="inferior">
							<%
							String error = request.getParameter("error");
							if(error != null){
								%>
								<p class="error"><%out.println(error); %></p>
								<%
							}
							%>
							<div class="botones">
								<input id="boton_aceptar" type="button" onclick="comprobarUsuario()" title="aceptar" value="Aceptar" name="Aceptar"/>
								<input id="boton_cancelar" type="button" onclick="window.location='lista_eventos.jsp'" title="cancelar" value="Cancelar" name="Cancelar"/>
							</div>
							
						</fieldset>
					</form>
				</div>
			</div><!-- contenido -->
			
		</div><!-- cuerpo -->
		
	
	</div><!-- contenedor -->
  	
  	<div class="licencias">
			<p>
				<a href="http://validator.w3.org/check?uri=referer">
					<img src="http://www.w3.org/Icons/valid-xhtml10" 
						alt="Valid XHTML 1.0 Strict" height="31" width="88" /></a>
 				</p>
 				<p>
			    <a href="http://jigsaw.w3.org/css-validator/check/referer">
			    	<img style="border:0;width:88px;height:31px"
			            src="http://jigsaw.w3.org/css-validator/images/vcss"
			            alt="¡CSS Válido!" />
    			</a>
			</p>
			<br />
			<p>
				Copyright (C) 2013  Óscar Crespo Salazar.
				<br />
				<a rel="license" href="http://www.gnu.org/licenses/gpl.html"><img src="res/gpl.png" alt="gplv3" /> </a>
				<br />
				código licenciado bajo <a href="http://www.gnu.org/licenses/gpl.html">GPLV3</a>.
				<br />
				<a rel="license" href="http://creativecommons.org/licenses/by-sa/3.0/deed.es_ES">
					<img alt="Licencia de Creative Commons" style="border-width:0" src="http://i.creativecommons.org/l/by-sa/3.0/88x31.png" />
				</a>
				<br />
				Las imágenes y logos de esta página estan bajo una 
				<a rel="license" href="http://creativecommons.org/licenses/by-sa/3.0/deed.es_ES">
					licencia de Creative Commons Reconocimiento-CompartirIgual 3.0 Unported
				</a>
				<br />
				La imágenes de los eventos son propiedad de sus respectivos autores. 
			</p>
			
			
     
		</div><!-- licencias -->
		<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
		<script type="text/javascript" src="js/formulario_comprobar.js"></script>
</body>
</html>