$(document).ready(inicializo);

var pagina = 1;

function inicializo(){
	//mostrar("container");
        //mostrar ("container2");
        //mostrar("container3");
	//ocultar("inicio");
	//ocultar("registro");
        $("#txtAliasReg").blur(validoNoVacio);
        $("#txtCorreoReg").blur(validoCorreo);
        $("#txtContraReg").blur(validoContra);
        $("#txtCorreo").blur(validoCorreo);//tengo que validar que existan cuando inicio sesion y que el correo sea unico cuando se registra
        $("#txtContra").blur(validoContra);
        $("#btnInicio").click(validoInicio);
        $("#btnRegistro").click(validoRegistro);
        $("#txtTítulo").blur(validoNoVacio);
        $("#txtGénero").blur(validoNoVacio);
        $("#txtFecha").blur(validoNoVacio);
        $("#txtResumen").blur(validoNoVacio);
        $("#txtDirector").blur(validoNoVacio);
        $("#txtElenco").blur(validoNoVacio);
        $("#imgPoster").blur(validoNoVacio);
        $("#txtAlias").blur(validoNoVacio);
        $("#txtComentario").blur(validoNoVacio);
        $("#txtPuntuacion").blur(validoPuntuacion);
        $("#btnAgregar").click(validoPelicula);
        $("#btnAgregarCom").click(validoComentario);
        $("#btnAnterior").click(paginaAnterior);
        $("#btnSiguiente").click(paginaSiguiente);
}

function paginaAnterior(){
    pagina--;
    cargoPagina(pagina);
}

function paginaSiguiente(){
    pagina++;
    cargoPagina(pagina);
}

function cargoPagina(numeroPag){
    $.ajax({
       url : "traigoPagina.php",
       type : "POST",
       data : "pagina=" + numeroPag,
       dataType : "JSON",
       success : procesoResultado,
       error : procesoError
    });
}

function procesoError(){
    alert("Error de comunicación");
}

function procesoResultado(datos){
    let filas, fila, tmp;
    if(datos["status"]=="OK"){
        filas = datos["data"];
        $("#cuerpoTabla").empty();
        for(pos=0; pos <= filas.length-1; pos++){
            fila = filas[pos];
            tmp = "<tr><td>" + fila["titulo"] + "</td>";
            tmp = tmp + "<td>" + fila["fecha_lanzamiento"] + "</td></tr>";
            $("#cuerpoTabla").append(tmp)
        }
    }
    else{
        alert("ERROR!!!");
    }
    
}
/*function mostrar(clase){
	var x = document.getElementsByClassName(clase);
	var i;
	for (i=0; i<x.length; i++){
		x[i].style.display="block";
	}
}
function ocultar(clase){
	var x = document.getElementsByClassName(clase);
	var i;
	for (i=0; i<x.length; i++){
		x[i].style.display="none";
	}
}

function verPrincipal(){
	mostrar("container");
	ocultar("inicio");
	ocultar("registro");
        mostrar("container3")
        mostrar("container2")
}
function verInicio(){
	mostrar("container");
	mostrar("inicio");
	ocultar("registro");
        ocultar("container3")
        ocultar("container2")
}
function verRegistro(){
	mostrar("container");
	ocultar("inicio");
        ocultar("container3");
        ocultar("container2");
	mostrar("registro");

}*/

function validoComentario(){
    let alias = $("#txtAlias").val();
    let puntuacion = $("#txtPuntuacion").val();
    let comentario = $("#txtComentario").val();
     if(!esVacio(alias) && !esVacio(comentario) && esPuntuacion(puntuacion)){
        $("#err_btnAgregarCom").html("");
        $("#formulariocomentario").submit();
    }else{
        $("#err_btnAgregarCom").html("Faltan datos obligatorios");
    }
}

function validoPelicula(){
    let titulo = $("#txtTítulo").val();
    let genero = $("#txtGénero").val();
    let resumen = $("#txtResumen").val();
    let director = $("#txtDirector").val();
    let elenco = $("#txtElenco").val();
    let fecha = $("#txtFecha").val();
    let poster = $("#imgPoster").val();
     if(!esVacio(titulo) && !esVacio(genero) && !esVacio(resumen) && !esVacio(director) && !esVacio(elenco) && !esVacio(fecha) && !esVacio(poster)){
        $("#err_btnAgregar").html("");
        $("#formularioagregar").submit();
    }else{
        $("#err_btnAgregar").html("Faltan datos obligatorios");
    }
}

function validoRegistro(){
    let alias = $("#txtAliasReg").val();
    let correo = $("#txtCorreoReg").val();
    let contra = $("#txtContraReg").val();
    
    if(esContra(contra) && !esVacio(alias) && esCorreo(correo)){
        $("#err_btnRegistro").html("");
        $("#formularioregistro").submit();
    }else{
        $("#err_btnRegistro").html("Todos los datos son obligatorios");
    }
}

function validoInicio(){
    let correo = $("#txtCorreo").val();
    let contra = $("#txtContra").val();
    
    if(!esVacio(contra) && esCorreo(correo)){
        $("#err_btnInicio").html("");
        $("#formularioinicio").submit();
    }else{
        $("#err_btnInicio").html("Todos los datos son obligatorios");
    }
}

function validoPuntuacion(){
    let dato = $(this).val();
    if (!esPuntuacion(dato)){
        $(this).removeClass("ok");
        $(this).addClass("error");
        $("#err_" + $(this).attr("id")).addClass("error");
        $("#err_" + $(this).attr("id")).html("El puntaje debe ser un número entre 1 y 5");
    }else{
        $(this).removeClass("error");
        $(this).addClass("ok");
        $("#err_" + $(this).attr("id")).html("");
    }
}

function esPuntuacion(puntuacion){
    let retorno = true;
    if(isNaN(puntuacion)){
        retorno = false;
    }else{
        if(puntuacion < 1 || puntuacion > 5){
            retorno = false;
        }
    }
    return retorno;
}

function validoCorreo(){
    let dato = $(this).val();
    if(!esCorreo(dato)){
        $(this).removeClass("ok");
        $(this).addClass("error");
        $("#err_" + $(this).attr("id")).addClass("error");
        $("#err_" + $(this).attr("id")).html("El dato debe ser un correo");
    }else{
        $(this).removeClass("error");
        $(this).addClass("ok");
        $("#err_" + $(this).attr("id")).html("");
    }
}

function validoContra(){
    let dato = $(this).val();
    if(!esContra(dato)){
        $(this).removeClass("ok");
        $(this).addClass("error");
        $("#err_" + $(this).attr("id")).addClass("error");
        $("#err_" + $(this).attr("id")).html("La contraseña debe ser de al menos 6 caracteres");
    }else{
        $(this).removeClass("error");
        $(this).addClass("ok");
        $("#err_" + $(this).attr("id")).html("");
    }
}

function esContra(contra){
    let retorno = false;
    if(contra.length >= 6){
        retorno = true;
    }
    return retorno;
}

function esCorreo(correo){
    let arroba = correo.indexOf("@");
    let punto = correo.indexOf(".");
    let retorno = false;
    if(arroba > 0 && arroba < punto && punto < correo.length-1){
        retorno = true;
    }
    return retorno;
}

function validoNoVacio(){
    let dato = $(this).val();//Con this me refiero a quien invoco esta funcion
    if(esVacio(dato)){
        $(this).removeClass("ok");
        $(this).addClass("error");
        $("#err_" + $(this).attr("id")).addClass("error");
        $("#err_" + $(this).attr("id")).html("El dato no puede ser vacío");
    }else{
        $(this).removeClass("error");
        $(this).addClass("ok");
        $("#err_" + $(this).attr("id")).html("");
    }
}

function esVacio(cadena){
    let retorno = false;
    if($.trim(cadena) == "" || cadena.length == 0){
        retorno = true;
    }
    return retorno;
}





