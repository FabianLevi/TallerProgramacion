<?php

require_once('smarty/libs/Smarty.class.php');
require_once("conexionBD/class.Conexion.BD.php");
require_once("tmp/configs/configuracion.php");


$miSmarty = new Smarty();

$conn = new ConexionBD(MOTOR, SERVIDOR, BASE, USUARIO, CLAVE);


define('TEMPLATE_DIR', $_SERVER['DOCUMENT_ROOT'].'./CarteleraCine/templates/');
define('COMPILER_DIR', $_SERVER['DOCUMENT_ROOT'].'./CarteleraCine/tmp/templates_c/');
define('CONFIG_DIR', $_SERVER['DOCUMENT_ROOT'].'./CarteleraCine/tmp/config/');
define('CACHE_DIR', $_SERVER['DOCUMENT_ROOT'].'./CarteleraCine/tmp/cache/');


$miSmarty->template_dir = TEMPLATE_DIR;
$miSmarty->compile_dir = COMPILER_DIR;
$miSmarty->config_dir = CONFIG_DIR;
$miSmarty->cache_dir =CACHE_DIR;

if($conn->conectar()){
    
    if ($conn->consulta('SELECT * FROM comentarios WHERE comentarios.estado=:estado', array(
          array("estado", "PENDIENTE", 'string')
          ))){
        $listado = $conn->restantesRegistros();
       
        $miSmarty->assign("datos", $listado);
    }
    
    $miSmarty->assign("error", !existeComentario());
    
    $miSmarty->display("aprobarComen.tpl");
} else {
    echo $conn->ultimoError();
}

function existeComentario() {
    $conn = new ConexionBD(MOTOR, SERVIDOR, BASE, USUARIO, CLAVE);
     if ($conn->conectar()) {
        $sql = "SELECT estado FROM comentarios";
        $sql .= " WHERE estado=:estado";
        $conn->consulta($sql,array(
        array("estado", "PENDIENTE", 'string')
    ));
        return $conn->cantidadRegistros() > 0;
     }
}
?>