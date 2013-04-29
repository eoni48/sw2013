//Es gratuito
jQuery(".derecha :input:radio[name=es_gratis]").click(function() {
	jQuery(".derecha .precio").css("display","none");
	$(this).prop('checked',true);
	jQuery(".derecha :input:radio[name=es_pago]").prop('checked',false);
});
jQuery(".derecha :input:radio[name=es_pago]").click(function() {
	jQuery(".derecha .precio").css("display","block");
	$(this).prop('checked',true);
	jQuery(".derecha :input:radio[name=es_gratis]").prop('checked',false);
});

//Es federado
jQuery(".izquierda #tipo option[value=federado]").click(function() {
	jQuery(".izquierda .federado").css("display","block");
});
jQuery(".izquierda #tipo option[value=popular]").click(function() {
	jQuery(".izquierda .federado").css("display","none");
});	

//fecha
$(function() {
	var date = new Date();
	var m = date.getMonth(), d = date.getDate(), y = date.getFullYear();
	$(".derecha :input[id=fecha]").datepicker({
		minDate : new Date(y,m,d) 
	});
});
/*$(window).load(function(){
	// Example #1 - Basic calendar
	$('.derecha :input[id=fecha]').glDatePicker(
	{
		cssName : 'flatwhite',
		showAlways: false,
		dowOffset: 1
	});
});*/