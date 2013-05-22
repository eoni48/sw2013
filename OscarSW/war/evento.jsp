<?xml version="1.0" encoding="UTF-8" ?>
<%@page import="oscarsw.data.Competitor"%>
<%@page import="java.util.ArrayList"%>
<%@page import="oscarsw.data.Event"%>
<%@page import="oscarsw.dao.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<link type="text/css" rel="stylesheet" href="css/evento.css"></link>
	<link type="text/css" rel="stylesheet" href="css/common.css"></link>
		
	<title>Evento</title>
</head>
<body>
<%

session = request.getSession();
String type = (String)session.getAttribute("type");
String nick = (String)session.getAttribute("nick");

String id = request.getParameter("id");

Event event = (DAO.getInstance()).getEvent(Long.valueOf(id));


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
				<div class="sign">
				</div>
			</div>
		</div>
		<div class="cuerpo">
			<div class="contenido_evento">
				<div class="superior">
					<div class="titulo">
						<p><%out.println(event.getName());%></p>
					</div>
					<div class="fecha">
						<p><%out.println(event.dateToString());%></p>
					</div>
				</div>
				<div class="izquierda">
					<div class="subtitulo">
						<h5>Organización</h5>
						<p><%out.println(event.getOrganizer());%></p>
						
					</div>
					<div class="subtitulo">
						<h5>Descripción</h5>
						<p><%out.println(event.getDescription());%></p> 
					</div>
					<div class="subtitulo">
						<h5>Requisitos</h5>
						<p><%out.println(event.getPlus());%></p> 
					</div>
					<div class="subtitulo">
						<h5>Localización</h5>
						<p>Ciudad: <%out.println(event.getCity());%></p> 
						<p>Comunidad: <%out.println(event.provinceToString());%></p> 
						<p>Lugar: <%out.println(event.getPlace());%></p> 
					</div>
					
				</div>
				<div class="derecha">
					<div class="imagen">
						<img src="res/dsa.jpg" alt="logo" />
					</div>
					
					<div>
						<%if(nick != null && event.getOrganizer().equals(nick)){%>
							<!--  <a href="formulario_evento.jsp?id=<%out.println(id);%>">Modificar</a>-->	
							<form method="get" action="/formulario_evento.jsp">
								<fieldset class="inputs_evento">	
									<input class="info" type="text" name="id" value="<%out.println(id);%>"/>
									<input class="boton_editar" type="submit" title="Modificar" value="Editar"/>
								</fieldset>
							</form>
						<% }%>
					</div>
					
				</div>
				<div class="inferior">
					<%if(nick != null && event.getOrganizer().equals(nick)){%>
						<div class="subtitulo">
						<h5>Participantes</h5>
						<%
						ArrayList<String> comps = event.getCompetitors();
						for(String comp : comps){
						%>
						<p><%out.println(comp);%></p>
						<%	
						}
						%>
						</div>
					<% }%>
					<div>
						<p>Participantes:<%out.println(event.getNumCompetitor());%></p>
					</div>
					<%
					int sign = 1;							
					if(type != null ){
						if(!type.equals("organizer")){
							if(event.isSign(nick)){
								sign = 2;
							}
							
						}
						else{
							sign = 3;
						}
						
		
					}
				
					
					if(sign == 1){
						%>
						<form method="post" action="/apuntar_evento">
							<fieldset class="inputs_evento">	
								<input class="info" type="text" name="id" value="<%out.println(event.getKey());%>"/>
								<input class="boton_inscribiSe" type="submit" title="Inscribirse" value="¡Apúntate!"/>
							</fieldset>
						</form>
						<%
					}
					
					else if(sign == 2){
						%>
						<form method="post" action="/desapuntar_evento">
							<fieldset class="inputs_evento">	
								<input class="info" type="text" name="id" value="<%out.println(event.getKey());%>"/>
								<input class="boton_inscribiSe" type="submit" title="Inscribirse" value="Desapuntarse"/>
							</fieldset>
						</form>
						<%
					}
					
					%>
				</div>
			</div>
		</div><!-- cuerpo -->
		
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