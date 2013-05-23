<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="es" lang="es">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	
	<link type="text/css" rel="stylesheet" href="css/index.css"></link>
	<link type="text/css" rel="stylesheet" href="css/common.css"></link>
	
	<title>Eventos</title>
</head>
<body>
<%
String type = (String)session.getAttribute("type");
String nick = (String)session.getAttribute("nick");
%>
	<div id="contenedor-index">
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
				<div id="buscador">
					<form id="form-buscador" method="get" action="/lista_eventos.jsp" enctype="text/plain">
					    <fieldset id="inputs_buscador">			
					    	<label for="nombre">Buscar:</label>  	  
					        <input id="nombre" type="text" name="nombre" title="Introducir nombre para buscar"/>	
					        <label for="comunidad"> en </label>  	  
					        <select id="comunidad" name="comunidad">  
					        	<option value="todo">(Toda España)</option>  
					            <option value="andalucia">Andalucía</option>  
					            <option value="aragon">Aragón</option>  
					            <option value="asturias">Asturias</option>  
					            <option value="baleares">Baleares</option>  
					            <option value="canarias">Canarias</option>  
					            <option value="cantabria">Cantabria</option>  
					            <option value="castilla_mancha">Castilla la Mancha</option>  
					            <option value="castilla_leon">Castilla y León</option>  
					            <option value="catalona">Cataluña</option>
					            <option value="extremadura">Extremadura</option>  
					            <option value="galicia">Galicia</option>
					            <option value="rioja">La Rioja</option> 
					            <option value="madrid">Madrid</option>
					            <option value="murcia">Murcia</option>  
					            <option value="navarra">Navarra</option> 
					            <option value="vasco">País Vasco</option>
					            <option value="valencia">Valencia</option>        
			        		</select> 	
			        		<label for="deporte" > de  </label>  	      
			        		<select id="deporte" name="deporte">  
					        	<option value="todo">(Cualquier deporte)</option>  
					            <option value="athletics">Atletismo</option>  
					            <option value="basket">Baloncesto</option>  
					            <option value="footbal">Fútbol</option>  
					            <option value="other">Otros</option>  
			        		</select> 	          		
			        		<input id="boton-buscar" type="submit" title="Buscar eventos" value="¡Buscar!"/>
					    </fieldset>	        	
					</form>	
				</div>
				<div class="destacados">
					<div class="destacado-atletismo">
					</div>
					<div class="destacado-baloncesto">
					</div>
					<div class="destacado-futbol">
					</div>
				</div>
			</div>
			
			<div class="mapa_web"><a href="MapaWeb.html">Mapa web</a> </div>
		</div>
		
		
		
	</div>
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
</body>
</html>