<?php
session_start();
require_once("conexionBD/class.Conexion.BD.php");
require_once("tmp/configs/configuracion.php");


define('TEMPLATE_DIR', $_SERVER['DOCUMENT_ROOT'].'./CarteleraCine/templates/');
define('COMPILER_DIR', $_SERVER['DOCUMENT_ROOT'].'./CarteleraCine/tmp/templates_c/');
define('CONFIG_DIR', $_SERVER['DOCUMENT_ROOT'].'./CarteleraCine/tmp/config/');
define('CACHE_DIR', $_SERVER['DOCUMENT_ROOT'].'./CarteleraCine/tmp/cache/');

//$elenco = $POST_["txtElenco"];
$foto = date("YmdHis") . "_" . $_FILES['imgPoster']['name'];

    $destino = "imagenes/" . $foto;
    
    if(is_uploaded_file($_FILES["imgPoster"]["tmp_name"])){
        if(move_uploaded_file($_FILES["imgPoster"]["tmp_name"], $destino)){
            guardarPelicula($_POST["txtTitulo"], $_POST["txtGenero"], $_POST["txtFecha"], $_POST["txtResumen"], $_POST["txtDirector"],$_POST["txtVideo"],$foto);
        }
    }



function guardarPelicula($titulo, $genero, $fecha, $resumen, $director,$video,$fotos) {
    
    $conn = new ConexionBD(MOTOR, SERVIDOR, BASE, USUARIO, CLAVE);
   if  ($conn->conectar()){
       $sql = "INSERT INTO peliculas (titulo, id_genero, fecha_lanzamiento, resumen, director, youtube_trailer, fotos)";
       $sql .= " VALUES (:titulo, :genero, :fecha, :resumen, :director, :trailer,:foto)";
       if ( $conn->consulta($sql, array(
        array("titulo", $titulo, 'string'),
        array("genero", $genero, 'string'),
        array("fecha", $fecha, 'string'),
        array("resumen", $resumen, 'string'),
        array("director", $director, 'string'),
        array("trailer",$video,'string'),
        array("foto", $fotos, 'string'),
    ))){
    header('location:index.php');  
    }else{
        $_SESSION["mensaje"]="Error de Consulta";
        header('location:errores.php');
    }
   }else{
       $_SESSION["mensaje"]="Error de Conexión";
        header('location:errores.php');
}
}
   
   /* $conn = new ConexionBD(MOTOR, SERVIDOR, BASE, USUARIO, CLAVE);
    if  ($conn->conectar()){
    $sql = "INSERT INTO elencos (id_pelicula, nombre)";
    $sql .= " VALUES (:idPelicula, :nombre)";
    $conn->consulta($sql,array(
        array("idPelicula", $id, "int"),
        array("nombre", $elenco, "string")
    ));
   }else{
       echo $conn->ultimoError();
    }*/



?>