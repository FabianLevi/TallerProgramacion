<?php

require_once("conexionBD/class.Conexion.BD.php");
require_once("tmp/configs/configuracion.php");


define('TEMPLATE_DIR', $_SERVER['DOCUMENT_ROOT'] . './CarteleraCine/templates/');
define('COMPILER_DIR', $_SERVER['DOCUMENT_ROOT'] . './CarteleraCine/tmp/templates_c/');
define('CONFIG_DIR', $_SERVER['DOCUMENT_ROOT'] . './CarteleraCine/tmp/config/');
define('CACHE_DIR', $_SERVER['DOCUMENT_ROOT'] . './CarteleraCine/tmp/cache/');
$genero = $_POST["genero"];
$conn = new ConexionBD(MOTOR, SERVIDOR, BASE, USUARIO, CLAVE);
if($conn->conectar()){
    $sql = "SELECT peliculas.fecha_lanzamiento,peliculas.fotos,peliculas.titulo,peliculas.id_genero,generos.id,generos.nombre "
            . "FROM peliculas,generos  WHERE generos.nombre=:genero AND peliculas.id_genero = generos.id LIMIT 0,6";
    if($conn->consulta($sql,array(
            array("genero", $genero, 'string') ))){
            $listado = $conn->restantesRegistros();
            $respuesta =  array("status"=>"OK", "data"=>$listado);

    }else{
        $respuesta = array("status"=>"ERROR");
    }
}else{
    $respuesta = array("status"=>"ERROR");
}

echo json_encode($respuesta);
