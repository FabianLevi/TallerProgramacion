<?php

require_once("conexionBD/class.Conexion.BD.php");
require_once("tmp/configs/configuracion.php");


define('TEMPLATE_DIR', $_SERVER['DOCUMENT_ROOT'] . './CarteleraCine/templates/');
define('COMPILER_DIR', $_SERVER['DOCUMENT_ROOT'] . './CarteleraCine/tmp/templates_c/');
define('CONFIG_DIR', $_SERVER['DOCUMENT_ROOT'] . './CarteleraCine/tmp/config/');
define('CACHE_DIR', $_SERVER['DOCUMENT_ROOT'] . './CarteleraCine/tmp/cache/');
$nombre = $_POST["nombre"];
$conn = new ConexionBD(MOTOR, SERVIDOR, BASE, USUARIO, CLAVE);
if($conn->conectar()){
    $sql = "SELECT * FROM peliculas WHERE titulo=:nombre";
    if($conn->consulta($sql,array(
            array("nombre", $nombre, 'string') ))){
            $listado = $conn->restantesRegistros();
            $respuesta =  array("status"=>"OK", "data"=>$listado);

    }else{
        $respuesta = array("status"=>"ERROR");
    }
}else{
    $respuesta = array("status"=>"ERROR");
}

echo json_encode($respuesta);
