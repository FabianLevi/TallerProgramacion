<?php

require_once("conexionBD/class.Conexion.BD.php");
require_once("tmp/configs/configuracion.php");



define('TEMPLATE_DIR', $_SERVER['DOCUMENT_ROOT'].'./CarteleraCine/templates/');
define('COMPILER_DIR', $_SERVER['DOCUMENT_ROOT'].'./CarteleraCine/tmp/templates_c/');
define('CONFIG_DIR', $_SERVER['DOCUMENT_ROOT'].'./CarteleraCine/tmp/config/');
define('CACHE_DIR', $_SERVER['DOCUMENT_ROOT'].'./CarteleraCine/tmp/cache/');


guardarUsuario($_POST["txtAlias"], $_POST["txtCorreoReg"], $_POST["txtContraReg"]);


function guardarUsuario($alias, $correo, $contra) {
    if(!existeCorreo($correo)){
    $cn = abrirConexion();
    $cn->consulta('INSERT INTO usuarios(alias, email, password) '
            . 'VALUES (:alias, :correo, md5(:contra))', array(
        array("alias", $alias, 'string'),
        array("correo", $correo, 'string'),
        array("contra", $contra, 'string')
    ));
    header('location:index.php');
    }else{
      header('location:registro.php');  
      //mostrar que ya existe el correo
    }
}

function abrirConexion() {
    $cn = new ConexionBD("mysql", "localhost", "Base", "root", "root");
    $cn->conectar();
    return $cn;
}


function existeCorreo($correo) {
    $cn = abrirConexion();
    $cn->consulta('SELECT email FROM usuarios WHERE email=:correo', array(
        array("correo", $correo, 'string')
    ));
    return $cn->cantidadRegistros() > 0;
}


?>