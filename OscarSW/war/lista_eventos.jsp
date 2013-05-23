<?xml version="1.0" encoding="UTF-8" ?>
<%@page import="oscarsw.data.Competitor"%>
<%@page import="oscarsw.data.User"%>
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
	<title>Eventos</title>
</head>
<body>
<%
	//session = request.getSession();
String type = (String)session.getAttribute("type");
String nick = (String)session.getAttribute("nick");

String name = request.getParameter("nombre");
if(name != null && name.trim().equals("")){
	name = null;
}

String province = request.getParameter("comunidad");
if(province != null &&  province.equals("todo")){
	province = null;
}
String sport = request.getParameter("deporte");
if(sport !=null && sport.equals("todo")){
	sport = null;
}

List<Event> events = (DAO.getInstance()).getEvents(name,province,sport);

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
				<div id="buscador">
					<form id="form-buscador" method="get" action="/lista_eventos.jsp" enctype="text/plain">
					    <fieldset id="inputs_buscador">			
					    	<label>Buscar:</label>  	  
					        <input id="nombre" type="text" name="nombre"/>	
					        <label> en </label>  	  
					        <select id=comunidad name="comunidad">  
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
				<div class="contenido_eventos">
					<div class="filtro">
						<p>Filtros:</p>
						<ul  class="filtro_seccion">
							<li>
								<p>Comunidades:</p>
								<ul>
									<li>
										<a href="lista_eventos.jsp?
										<%
											if(sport!= null){
												out.println("&deporte="+sport);
											}
										%>">Todas</a>
										
									</li>
									<li>
										<a href="lista_eventos.jsp?comunidad=
											<%
											out.println("andalucia");
											if(sport!= null){
												out.println("&deporte="+sport);
											}
											%>">Andalucia</a>
									</li>
									<li>
										<a href="lista_eventos.jsp?comunidad=
										<%
											out.println("aragon");
											if(sport!= null){
												out.println("&deporte="+sport);
											}
										%>">Aragon</a>
										
									</li>
									<li>
										<a href="lista_eventos.jsp?comunidad=
										<%
											out.println("asturias");
											if(sport!= null){
												out.println("&deporte="+sport);
											}
										%>">Asturias</a>
										
									</li>
									<li>
										<a href="lista_eventos.jsp?comunidad=
										<%
											out.println("baleares");
											if(sport!= null){
												out.println("&deporte="+sport);
											}
										%>">Baleares</a>
										
									</li>
									<li>
										<a href="lista_eventos.jsp?comunidad=
										<%
											out.println("rioja");
											if(sport!= null){
												out.println("&deporte="+sport);
											}
										%>">La Rioja</a>
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
										<a href="lista_eventos.jsp?
										<%
											if(province!= null){
												out.println("&comunidad="+province);
											}
										%>">Todos</a>
										
									</li>
									<li>
										<a href="lista_eventos.jsp?deporte=
										<%
											out.println("athletics");
											if(province!= null){
												out.println("&comunidad="+province);
											}
										%>">Atletismo</a>
										
									</li>
									
									<li>
										<a href="lista_eventos.jsp?deporte=
										<%
											out.println("basket");
											if(province!= null){
												out.println("&comunidad="+province);
											}
										%>">Baloncesto</a>
										
									</li>
									<li>
										<a href="lista_eventos.jsp?deporte=
										<%
											out.println("footbal");
											if(province!= null){
												out.println("&comunidad="+province);
											}
										%>">Fútbol</a>
										
									</li>
									<li>
										<a href="lista_eventos.jsp?deporte=
										<%
											out.println("other");
											if(sport!= null){
												out.println("&deporte="+province);
											}
										%>">Otros</a>	
									</li>
								</ul>
							</li>
						</ul>
					</div>
					
					<div class="eventos">
							<%
							//response.sendRedirect("evento.jsp?id"+e.getKey());
								
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
											int sign = 1;							
											if(type != null ){
												if(!type.equals("organizer")){
													if(e.isSign(nick)){
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
														<input class="info" type="text" name="id" value="<%out.println(e.getKey());%>"/>
														<input class="boton_inscribiSe" type="submit" title="Inscribirse" value="¡Apúntate!"/>
													</fieldset>
												</form>
												<%
											}
											
											else if(sign == 2){
												%>
												<form method="post" action="/desapuntar_evento">
													<fieldset class="inputs_evento">	
														<input class="info" type="text" name="id" value="<%out.println(e.getKey());%>"/>
														<input class="boton_inscribiSe" type="submit" title="Inscribirse" value="Desapuntarse"/>
													</fieldset>
												</form>
												<%
											}
											
											%>
											
					
											<!--
												<a href="/desapuntar_evento?id=<%out.println(e.getKey());%>">Desapuntar</a>  
											<form method="get" action="/apuntar_evento">
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