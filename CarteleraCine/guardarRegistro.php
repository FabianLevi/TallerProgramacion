<?php
session_start();
require_once("conexionBD/class.Conexion.BD.php");
require_once("tmp/configs/configuracion.php");


define('TEMPLATE_DIR', $_SERVER['DOCUMENT_ROOT'] . './CarteleraCine/templates/');
define('COMPILER_DIR', $_SERVER['DOCUMENT_ROOT'] . './CarteleraCine/tmp/templates_c/');
define('CONFIG_DIR', $_SERVER['DOCUMENT_ROOT'] . './CarteleraCine/tmp/config/');
define('CACHE_DIR', $_SERVER['DOCUMENT_ROOT'] . './CarteleraCine/tmp/cache/');


guardarUsuario($_POST["txtAlias"], $_POST["txtCorreoReg"], $_POST["txtContraReg"]);

function guardarUsuario($alias, $correo, $contra) {
    if (!existeCorreo($correo)) {
        $conn = new ConexionBD(MOTOR, SERVIDOR, BASE, USUARIO, CLAVE);
        if ($conn->conectar()) {
            if ($conn->consulta('INSERT INTO usuarios(alias, email, password) '
                            . 'VALUES (:alias, :correo, md5(:contra))', array(
                        array("alias", $alias, 'string'),
                        array("correo", $correo, 'string'),
                        array("contra", $contra, 'string')
                    ))) {
                header('location:index.php');
            } else {
                $_SESSION["mensaje"]="Error de Consulta";
        header('location:errores.php');
            }
        } else {
            $_SESSION["mensaje"]="Error de Conexión";
        header('location:errores.php');
        }
    } else {
        header('location:registro.php?err=1');
    }
}

function existeCorreo($correo) {
    $conn = new ConexionBD(MOTOR, SERVIDOR, BASE, USUARIO, CLAVE);
    if ($conn->conectar()) {
        $sql = "SELECT email FROM usuarios";
        $sql .= " WHERE email=:correo";
       if ( $conn->consulta($sql, array(
            array("correo", $correo, 'string')
        ))){
        return $conn->cantidadRegistros() > 0;
        }else{
            $_SESSION["mensaje"]="Error de Consulta";
        header('location:errores.php');
        }
    }else{
        $_SESSION["mensaje"]="Error de Conexión";
        header('location:errores.php');
    }
}

?>