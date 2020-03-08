<?php

session_start();

require_once("conexionBD/class.Conexion.BD.php");
require_once("tmp/configs/configuracion.php");


define('TEMPLATE_DIR', $_SERVER['DOCUMENT_ROOT'] . './CarteleraCine/templates/');
define('COMPILER_DIR', $_SERVER['DOCUMENT_ROOT'] . './CarteleraCine/tmp/templates_c/');
define('CONFIG_DIR', $_SERVER['DOCUMENT_ROOT'] . './CarteleraCine/tmp/config/');
define('CACHE_DIR', $_SERVER['DOCUMENT_ROOT'] . './CarteleraCine/tmp/cache/');

$alias =  $_SESSION["usuarioLogueado"]["alias"];

guardarComentario($_POST["txtPuntuacion"], $_POST["txtComentario"], "PENDIENTE", $_SESSION["usuarioLogueado"]["id"], $_POST["idPelicula"], $_POST["fechaComen"], $alias);

function guardarComentario($puntuacion, $comentario, $estado, $idUsuario, $idPelicula, $fecha, $alias) {
    if (!usuarioNoComento($idUsuario, $idPelicula)) {
        $conn = new ConexionBD(MOTOR, SERVIDOR, BASE, USUARIO, CLAVE);
        if ($conn->conectar()) {
            if ($conn->consulta('INSERT INTO comentarios(id_pelicula, mensaje, puntuacion, id_usuario, estado, fecha, alias) '
                            . 'VALUES (:id_pelicula, :mensaje, :puntuacion, :id_usuario, :estado, :fecha, :alias)', array(
                        array("id_pelicula", $idPelicula, 'int'),
                        array("mensaje", $comentario, 'string'),
                        array("puntuacion", $puntuacion, 'int'),
                        array("id_usuario", $idUsuario, 'int'),
                        array("estado", $estado, 'string'),
                        array("fecha", $fecha, 'string'),
                        array("alias", $alias, 'string')
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
        header('location:ingresarComen.php?err=1');
    }
}

function usuarioNoComento($idUsuario, $idPelicula) {
    $conn = new ConexionBD(MOTOR, SERVIDOR, BASE, USUARIO, CLAVE);
    if ($conn->conectar()) {
        $sql = "SELECT id_pelicula, id_usuario FROM comentarios";
        $sql .= " WHERE id_pelicula=:pelicula AND id_usuario=:usuario";
        if ($conn->consulta($sql, array(
            array("pelicula", $idPelicula, 'int'),
            array("usuario", $idUsuario, 'int')
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