<?php

require_once("conexionBD/class.Conexion.BD.php");
require_once("tmp/configs/configuracion.php");


define('TEMPLATE_DIR', $_SERVER['DOCUMENT_ROOT'] . './CarteleraCine/templates/');
define('COMPILER_DIR', $_SERVER['DOCUMENT_ROOT'] . './CarteleraCine/tmp/templates_c/');
define('CONFIG_DIR', $_SERVER['DOCUMENT_ROOT'] . './CarteleraCine/tmp/config/');
define('CACHE_DIR', $_SERVER['DOCUMENT_ROOT'] . './CarteleraCine/tmp/cache/');

$correo = $_POST["txtCorreo"];
$contra = $_POST["txtContra"];

$usuarioLogueado = login($correo, $contra);

if (isset($usuarioLogueado)) {
    session_start();
    $_SESSION["usuarioLogueado"] = $usuarioLogueado;
    header('location:index.php');
} else {
    header('location:inicio.php?err=1');
}

function login($correo, $contra) {
    $conn = new ConexionBD(MOTOR, SERVIDOR, BASE, USUARIO, CLAVE);
    if ($conn->conectar()) {
        $sql = "SELECT * FROM usuarios";
        $sql .= " WHERE email=:email AND password=md5(:password)";
        $conn->consulta($sql,array(
        array("email", $correo, 'string'),
        array("password", $contra, 'string')
    ));
        if ($conn->cantidadRegistros() > 0) {
            return $conn->siguienteRegistro();
        }
    }
    return NULL;
}

?>
