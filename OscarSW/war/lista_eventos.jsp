<?xml version="1.0" encoding="UTF-8" ?>
<%@page import="oscarsw.data.Event"%>
<%@page import="oscarsw.dao.DAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<link type="text/css" rel="stylesheet" href="css/lista_eventos.css"></link>
	<link type="text/css" rel="stylesheet" href="css/common.css"></link>
	<title>Insert title here</title>
</head>
<body>
<%
session = request.getSession();
String type = (String)session.getAttribute("type");
%>
	<div id="contenedor">
		<div id="cabezera">
			<div id="logo">
				<h1>Eventos</h1>
			</div>
			<div id="navegacion">
				<div id="menuNavegacion">
					<ul>
						<li class="inicio"><a href="index.html">Inicio </a></li>
						<li class="ultimo"><a href="lista_eventos.jsp">Eventos</a></li>
						<%
						if(type != null && type.equals("organizer")){
						%>
						<li class="ultimo"><a href="formulario_evento.html">Crear evento</a></li>
						<% 
						}
						
						String nick = (String)session.getAttribute("nick");
						if(nick == null){
						%>
							<li class="log"><a href="log.html">Log in </a></li>
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
					<form id="form-buscador" action="URL" enctype="text/plain">
					    <fieldset id="inputs_buscador">			
					    	<label>Buscar:</label>  	  
					        <input id="nombre" type="text"/>	
					        <label> en </label>  	  
					        <select id="categoria" name="categoria">  
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
			        		<label > de  </label>  	      
			        		<select id="deporte" name="categoria">  
					        	<option value="todo">(Cualquier deporte)</option>  
					            <option value="atletismo">Atletismo</option>  
					            <option value="baloncesto">Baloncesto</option>  
					            <option value="futbol">Fútbol</option>  
					            <option value="varios">Varios</option>  
			        		</select> 	          		
			        		<input id="boton-buscar" type="submit" title="Buscar eventos" value="¡Buscar!"/>
					    </fieldset>	        	
					</form>	
				</div>
				<div class="contenido_eventos">
					<div class="filtro">
						<p>Filtros:</p>
						<ul  class="filtro_seccion">
							<li>
								<p>Comunidades:</p>
								<ul>
									<li>
										Andalucia
									</li>
									<li>
										Aragon
									</li>
									<li>
										Asturias
									</li>
									<li>
										Baleares
									</li>
									<li>
										Más...
									</li>
								</ul>
							</li>
							<li>
								<p>Deportes:</p>
								<ul>
									<li>
										Atletismo
									</li>
									<li>
										Baloncesto
									</li>
									<li>
										Fútbol
									</li>
									<li>
										Varios
									</li>
								</ul>
							</li>
							<li>
								<p>Tipo:</p>
								<ul>
									<li>
										Popular
									</li>
									<li>
										Federados
									</li>
								</ul>
							</li>
						</ul>
					</div>
					
					<div class="eventos">
							<%
							//response.sendRedirect("evento.jsp?id"+e.getKey());
								List<Event> events = (DAO.getInstance()).getEvents();
								if(events != null){
									for(Event e : events){
									%>
									<div class="evento" >
										<div class="evento_izquierda">
											<a href="evento.jsp?id=<%out.println(e.getKey());%>"><img src="res/dsa.jpg" alt="logo del evento"/></a>
										</div>
										<div class="evento_centro">
											<div class="titulo">
												<a href="evento.jsp?id=<%out.println(e.getKey());%>"><span><%out.println(e.getName()); %></span></a>
											</div>
											<div class="descripcion">
												<p><%out.println(e.getDescription()); %></p>
											</div>
											
										</div>
										<div class="evento_derecha">
											<div class="fecha">
												<span><%  out.println(e.dateToString()); %></span>
											</div>	
											<%
											if(type != null ){
												if(!type.equals("organizer")){
												%>
												<a href="/apuntar_evento?id=<%out.println(e.getKey());%>">¡Apúntate!</a>
												<%
												}
								
											}
											else{
											%>
												<a href="/apuntar_evento?id=<%out.println(e.getKey());%>">¡Apúntate!</a>
											<%} %>
					
											<!--  <form method="get" action="/apuntar_evento">
												<fieldset class="inputs_evento">	
													<input  type="text" name="id" value="<%out.println(e.getKey());%>"/>
													<input class="boton_inscribiSe" type="submit" title="Inscribirse" value="¡Apúntate!"/>
												</fieldset>
											</form>
											-->
										</div>
									</div>
									<%	
									}
								}
							%>
					
					
					</div>			
				</div>
			</div><!--contenido  -->
			<div class="mapa_web"><a href="MapaWeb.html">Mapa web</a> </div>
		</div><!--cuerpo  -->
		
	</div>
	<div class="licencias">
			<p>
				<a href="http://validator.w3.org/check?uri=referer"><img src="http://www.w3.org/Icons/valid-xhtml10" alt="Valid XHTML 1.0 Strict" height="31" width="88" /></a>
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