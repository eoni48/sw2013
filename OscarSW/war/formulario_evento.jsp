<?xml version="1.0" encoding="UTF-8" ?>
<%@page import="oscarsw.data.Event.Sport"%>
<%@page import="oscarsw.dao.DAO"%>
<%@page import="oscarsw.data.Event"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<link type="text/css" rel="stylesheet" href="css/formulario_evento.css"></link>
	<link type="text/css" rel="stylesheet" href="css/common.css"></link>
	
	
	<link type="text/css" href="libs/jQueryUI/css/custom-theme/jquery-ui-1.10.2.custom.css" rel="stylesheet" />
	
	
	<title>Evento</title>
</head>
<body>
<%

session = request.getSession();
String type = (String)session.getAttribute("type");
String nick = (String)session.getAttribute("nick");

String id = request.getParameter("id");
String name = "";
String city = "";
String province = "";
String place = "";
String date = "";
boolean free = true;
String description = "";
String plus = "";
Sport sport = Sport.athletics;
String cost = "";

if(id != null){

	Event event = (DAO.getInstance()).getEvent(Long.valueOf(id));
	
	
	if(event != null){
		name = event.getName();
		city = event.getCity();
		province = event.getProvince();
		place = event.getPlace();
		date = event.dateToString();
		free = event.isFree();
		description = event.getDescription();
		plus = event.getPlus();
		sport = event.getSport();
		cost = String.valueOf(event.getCost());
	}
	else{
		response.sendRedirect("lista_eventos.jsp");
	}
}
else{
	id = "";
}

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
						<li class="log"><a href="log.html">Log in </a></li>
					</ul>
				</div>
				<div class="sign">
				</div>
			</div>
		</div>
		<div class="cuerpo">
			<div class="contenido">
				<div class="formulario">
					<!--<div class="superior">
						
					</div>-->
					<form method="post" action="/nuevo_evento">
						
						<fieldset class="izquierda">
							<label>Nombre del evento:</label>
							<br />
							<input id="nombre" type="text" name="nombre" value="<%out.println(name);%>"/>
							
							<br />
							<br />
							
							<label>Localidad:</label>
							<br />
							<input id="localidad" type="text" name="localidad" value="<%out.println(city);%>"/>
							
							<br />
							<br />
							
							<label>Lugar:</label>
							<br />
							<input id="lugar" type="text" name="lugar" value="<%out.println(place);%>"/>
							
							<br />
							<br />
							
							
							
						</fieldset>
						<fieldset class="derecha">
							<label>Deporte:</label>
							<br />
							<select id="tipo" name="deporte">
								<option <%if(sport == Sport.athletics){%> selected="selected" <%} %> value="atletismo">Atletismo</option>
								<option <%if(sport == Sport.basket){%> selected="selected" <%} %> value="baloncesto">Baloncesto</option>
								<option <%if(sport == Sport.footbal){%> selected="selected" <%} %> value="futbol">Fútbol</option>
								<option <%if(sport == Sport.other){%> selected="selected" <%} %> value="otros">Otros</option>
							</select>
							<br />
							<br />
							
							<label>Comunidad Autonoma:</label>
							<br />
							<select id="comunidad" name="comunidad">  	   
					            <option <%if(province.equals("andalucia")){%> selected="selected" <%} %>  value="andalucia">Andalucía</option>  
					            <option <%if(province.equals("aragon")){%> selected="selected" <%} %>  value="aragon">Aragón</option>  
					            <option <%if(province.equals("asturias")){%> selected="selected" <%} %>  value="asturias">Asturias</option>  
					            <option <%if(province.equals("baleares")){%> selected="selected" <%} %>  value="baleares">Baleares</option>  
					            <option <%if(province.equals("canarias")){%> selected="selected" <%} %>  value="canarias">Canarias</option>  
					            <option <%if(province.equals("cantabria")){%> selected="selected" <%} %>  value="cantabria">Cantabria</option>  
					            <option <%if(province.equals("castilla_mancha")){%> selected="selected" <%} %>  value="castilla_mancha">Castilla la Mancha</option>  
					            <option <%if(province.equals("castilla_leon")){%> selected="selected" <%} %>  value="castilla_leon">Castilla y León</option>  
					            <option <%if(province.equals("catalona")){%> selected="selected" <%} %>  value="catalona">Cataluña</option>
					            <option <%if(province.equals("extremadura")){%> selected="selected" <%} %>  value="extremadura">Extremadura</option>  
					            <option <%if(province.equals("galicia")){%> selected="selected" <%} %>  value="galicia">Galicia</option>
					            <option <%if(province.equals("rioja")){%> selected="selected" <%} %>  value="rioja">La Rioja</option> 
					            <option <%if(province.equals("madrid")){%> selected="selected" <%} %>  value="madrid">Madrid</option>
					            <option <%if(province.equals("murcia")){%> selected="selected" <%} %>  value="murcia">Murcia</option>  
					            <option <%if(province.equals("navarra")){%> selected="selected" <%} %>  value="navarra">Navarra</option> 
					            <option <%if(province.equals("vasco")){%> selected="selected" <%} %>  value="vasco">País Vasco</option>
					            <option <%if(province.equals("valencia")){%> selected="selected" <%} %>  value="valencia">Valencia</option>        
			        		</select> 	
							<br />
							<br />
							
							<label>Fecha:</label>
							<br />
							<input id="fecha" type="text" readonly="readonly" name="fecha" value="<%out.println(date);%>"/>
							
							<br />
							<br />
							
							<label>¿Gratuito?</label>
							<br />
							<input <%if(free){%> checked="checked" <%} %> name="es_gratis" type="radio" value="si"/>Si
							<input <%if(!free){%> checked="checked" <%} %> name="es_gratis" type="radio" value="no"/>No
							<br />
							<br />
							<div class="precio">
								<label>Precio:</label>
								<br />
								<input id="precio" type="text" name="precio" value="<%out.println(cost);%>"/>€
							</div>
						</fieldset>
						<fieldset class="inferior">
							<label>Descripción:</label>
							<br />
							<textarea rows="20" cols="100" name="descripcion" > <%out.println(description);%></textarea>
							
							<br />
							<br />
							
							<label>Requisitos adicionales:</label>
							<br />
							<textarea rows="10" cols="100" name="adicional"><%out.println(plus);%></textarea>
							<br />
							<br />
							<input name="id" class="info" type="text" value="<%out.println(id);%>"/>
							<div class="botones">
								<input id="boton_aceptar" type="submit" title="aceptar" value="Aceptar" name="aceptar"/>
								<input id="boton_cancelar" type="button" onclick="window.location='lista_eventos.jsp'" title="cancelar" value="Cancelar" name="cancelar"/>
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
 	
 	<script type="text/javascript" src="libs/jQueryUI/development-bundle/jquery-1.9.1.js"></script>
	<script type="text/javascript" src="libs/jQueryUI/development-bundle/ui/jquery.ui.core.js"></script>
	<script type="text/javascript" src="libs/jQueryUI/development-bundle/ui/jquery.ui.widget.js"></script>
	<script type="text/javascript" src="libs/jQueryUI/development-bundle/ui/jquery.ui.datepicker.js"></script>
    
    
    <script type="text/javascript" src="js/formulario_eventos.js"></script>
</body>

</html>