$(document).ready(inicializo);


var pagina = 1;
var pagina2 =1;
var num = 0;
var num2= 0;
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
        $("#buscar").click(cargoPagina2);
        $("#buscarGenero").click(cargoPagina3);
        $("#2at").click(paginaAnterior2);
        $("#2si").click(paginaSiguiente2);
        cargoPagina(1);
        //cargoPaginaComentarios(1);
        $('a[href = "poster.php"]').click(cargoPaginaComentarios(1));
}



function paginaAnterior(){
    pagina--;
    cargoPagina(pagina);
}

function paginaAnterior2(){
    pagina2--;
    cargoPaginaComentarios(pagina2);
}

function paginaSiguiente2(){
    pagina2++;
    if(pagina2 > num2){
        pagina2 = 1;
    }
    cargoPaginaComentarios(pagina2);
}


function cargoPagina3(){
    let genero = $("#selGenero").val();
    $.ajax({
       url : "procesoGenero.php",
       type : "POST",
       data : "genero=" +genero,
       dataType : "JSON",
       success : procesoResultado,
       
    });
}


function cargoPaginaComentarios(pPagina){
    let id = $("#comentarioID").val();
    $.ajax({
       url : "traigoComentario.php",
       type : "POST",
       data : "pagina=" + pPagina + "&id=" + id,
       dataType : "JSON",
       success : procesoResultado2,
       
    });
}

function procesoResultado2(datos){
    let filas, fila, tmp;
    if(datos["status"]=="OK"){
        filas = datos["data"];
        $("#ajaxComentarios").empty();
        for(pos=0; pos <= filas.length-1; pos++){
            fila = filas[pos];
            tmp= "<p>"+ fila["mensaje"]+"</p>";
            tmp = tmp + "<small class='text-muted'>" + "fechaaa" + "</small>" + "<hr>";
            $("#ajaxComentarios").append(tmp)
            num2 =datos["ultima"];
        }
    }
    
    
}



function cargoPagina2(){
    let nombre = $("#nombre").val();
    $.ajax({
       url : "procesoBuscar.php",
       type : "POST",
       data : "nombre=" +nombre,
       dataType : "JSON",
       success : procesoResultado,
       
    });
}

function paginaSiguiente(){
    //alert("entree");
    pagina++;
    if(pagina > num){
        pagina = 1;
    }
    cargoPagina(pagina);
}

function cargoPagina(numeroPag){
    $.ajax({
       url : "traigoPagina.php",
       type : "POST",
       data : "pagina=" + numeroPag,
       dataType : "JSON",
       success : procesoResultado,
       
    });
}



function procesoResultado(datos){
    //alert(JSON.stringify(datos));
    //alert("volvi");
    let filas, fila, tmp;
    if(datos["status"]=="OK"){
        filas = datos["data"];
        $("#ajax").empty();
        for(pos=0; pos <= filas.length-1; pos++){
            fila = filas[pos];
            tmp= "<div class=\"col-lg-4 col-md-6 mb-4\">" + "\<div class=\"card h-100\">" + "<a href=#>";
            tmp = tmp + "<img style=\"width:355px; height:170px;\" class=\"card-img-top\" src=\""+ "imagenes/" + fila["fotos"] + "\" alt=></a>";
            tmp = tmp +  "<div class=" + "" + "card-body" +">" + "<h4 class=" + "" + "card-title>";  
            tmp = tmp + "<a href=" +"" + "poster.php?id=" + fila["id"] +" >" + fila["titulo"] + "</a>" + "</h4>";
            tmp = tmp + "<h5>" + fila["fecha_lanzamiento"] + "</h5>";
            tmp = tmp + "<p class=" +"" + "card-text" + ">" + fila["nombre"] + "</p>" + "</div>";
            tmp = tmp + "<div class=" + "" + "card-footer" + ">";
             if(fila["puntuacion"]==0.00){
                tmp = tmp + "<small class=" + "" + "text-muted" + ">&#9734; &#9734; &#9734; &#9734; &#9734; 0/5</small>" + "</div></div></div>";   
            }else{
                if(fila["puntuacion"]==1.00){
                tmp = tmp + "<small class=" + "" + "text-muted" + ">&#9733; &#9734; &#9734; &#9734; &#9734; 1/5</small>" + "</div></div></div>";
                }
                else{
                    if(fila["puntuacion"]==2.00){
                    tmp = tmp + "<small class=" + "" + "text-muted" + ">&#9733; &#9733; &#9734; &#9734; &#9734; 2/5</small>" + "</div></div></div>";
                    }else{
                        if(fila["puntuacion"]==3.00){
                            tmp = tmp + "<small class=" + "" + "text-muted" + ">&#9733; &#9733; &#9733; &#9734; &#9734; 3/5</small>" + "</div></div></div>";
                        }else{
                            if(fila["puntuacion"]==4.00){
                                tmp = tmp + "<small class=" + "" + "text-muted" + ">&#9733; &#9733; &#9733; &#9733; &#9734; 4/5</small>" + "</div></div></div>";
                            }else{
                                tmp = tmp + "<small class=" + "" + "text-muted" + ">&#9733; &#9733; &#9733; &#9733; &#9733; 5/5</small>" + "</div></div></div>";
                            }
                        }
                    }
                }
            }
            $("#ajax").append(tmp)
            num =datos["ultima"];
//            tmp = "<tr><td>" + fila["titulo"] + "</td>";
//            tmp = tmp + "<td>" + fila["fecha_lanzamiento"] + "</td></tr>";
//            $("#cuerpoTabla").append(tmp)
        }
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






