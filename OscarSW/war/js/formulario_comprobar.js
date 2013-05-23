function comprobarEvento() {
	if($.trim(crear_evento.nombre.value) == ""){
		alert("El campo nombre no debe estar vacio");
		return;
		
	}
	if($.trim(crear_evento.localidad.value) == ""){
		alert("El campo Localidad no debe estar vacio");
		return;
	}
	if($.trim(crear_evento.lugar.value) == ""){
		alert("El campo Lugar no debe estar vacio");
		return;
	}
	if(Number(crear_evento.precio.value) == 0.0){
		alert("El campo Precio no debe ser 0");
		return;
	}
	if(isNaN(crear_evento.precio.value)){
		alert("El campo Precio debe ser un numero");
		return;
	}
	
	crear_evento.submit();
	
} 