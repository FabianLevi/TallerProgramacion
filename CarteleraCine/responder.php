<?php

session_start();
require_once("conexionBD/class.Conexion.BD.php");
require_once("tmp/configs/configuracion.php");


define('TEMPLATE_DIR', $_SERVER['DOCUMENT_ROOT'] . './CarteleraCine/templates/');
define('COMPILER_DIR', $_SERVER['DOCUMENT_ROOT'] . './CarteleraCine/tmp/templates_c/');
define('CONFIG_DIR', $_SERVER['DOCUMENT_ROOT'] . './CarteleraCine/tmp/config/');
define('CACHE_DIR', $_SERVER['DOCUMENT_ROOT'] . './CarteleraCine/tmp/cache/');

$id = $_GET["id"];
$res = $_GET["res"];
$pelicula = $_GET["idPelicula"];


$conn = new ConexionBD(MOTOR, SERVIDOR, BASE, USUARIO, CLAVE);
if ($conn->conectar()) {

    if ($conn->consulta('UPDATE comentarios SET estado =:res '
                    . 'WHERE id = :id', array(
                array("res", $res, 'string'),
                array("id", $id, 'int')
            ))) {
        
    } else {
        $_SESSION["mensaje"]="Error de Consulta";
    header('location:errores.php');
    }



    if ($conn->consulta('UPDATE peliculas SET puntuacion = ( '
                    . ' SELECT AVG(puntuacion) '
                    . ' FROM comentarios '
                    . " WHERE id_pelicula=:id AND estado='APROBADO') "
                    . ' WHERE id=:id', array(
                array("id", $pelicula, 'int')
            ))) {
        header('location:aprobarComen.php');
    } else {
        $_SESSION["mensaje"]="Error de Consulta";
    header('location:errores.php');
    }
} else {
    $_SESSION["mensaje"]="Error de Conexión";
    header('location:errores.php');
}
?>