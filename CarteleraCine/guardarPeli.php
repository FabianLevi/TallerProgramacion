<?php

require_once("conexionBD/class.Conexion.BD.php");
require_once("tmp/configs/configuracion.php");


define('TEMPLATE_DIR', $_SERVER['DOCUMENT_ROOT'].'./CarteleraCine/templates/');
define('COMPILER_DIR', $_SERVER['DOCUMENT_ROOT'].'./CarteleraCine/tmp/templates_c/');
define('CONFIG_DIR', $_SERVER['DOCUMENT_ROOT'].'./CarteleraCine/tmp/config/');
define('CACHE_DIR', $_SERVER['DOCUMENT_ROOT'].'./CarteleraCine/tmp/cache/');


guardarPelicula($_POST["txtTitulo"], $_POST["txtGenero"], $_POST["txtFecha"], $_POST["txtResumen"], $_POST["txtDirector"], $_POST["imgPoster"], $_POST["txtVideo"]);


function guardarPelicula($titulo, $genero, $fecha, $resumen, $director, $imagen, $video) {
    $conn = new ConexionBD(MOTOR, SERVIDOR, BASE, USUARIO, CLAVE);
   if  ($conn->conectar()){
    $conn->consulta('INSERT INTO peliculas(titulo, id_genero, fecha_lanzamiento, resumen, director, youtube_trailer) '
            . 'VALUES (:titulo, :genero, :fecha, :resumen, :director, :trailer)', array(
        array("titulo", $titulo, 'string'),
        array("genero", $genero, 'string'),
        array("fecha", $fecha, 'string'),
        array("resumen", $resumen, 'string'),
        array("director", $director, 'string'),
        array("imagen", $imagen, 'string'),
        array("trailer", $video, 'string')
    ));
    header('location:index.php');  
   }else{
       echo $conn->ultimoError();
   }
}


?>