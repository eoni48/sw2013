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
function comprobarUsuario() {
	var nombre = crear_usuario.nick.value;
	
	if($.trim(nick.value) == "" ){
		alert("El campo nick no debe estar vacio");
		return;
		
	}
	if($.trim(crear_usuario.nombre.value) == ""){
		alert("El campo nombre no debe estar vacio");
		return;
		
	}
	if($.trim(crear_usuario.pass.value) == "" ){
		alert("El campo contraseña no debe estar vacio");
		return;
		
	}
	if($.trim(crear_usuario.pass2.value) == ""){
		alert("Debes repetir la contraseña");
		return;
		
	}
	if($.trim(crear_usuario.pass.value) != $.trim(crear_usuario.pass2.value) ){
		alert("Las contraseñas deben ser iguales");
		return;
	}
	crear_usuario.submit();
}