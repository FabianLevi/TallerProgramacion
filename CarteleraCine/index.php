<?php
session_start();

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
//    $sql = "SELECT * FROM peliculas";
//    $sql .=" ORDER BY fecha_lanzamiento desc";
//    $sql .= " LIMIT 0,6";
      $sql = "SELECT peliculas.fecha_lanzamiento,peliculas.fotos,peliculas.titulo,peliculas.id_genero,generos.id,generos.nombre FROM peliculas,generos  WHERE peliculas.id_genero = generos.id ORDER BY fecha_lanzamiento desc LIMIT 0,6";
    
    //$sql .= " WHERE help_category_id >= :codigo";
    
    
    if($conn->consulta($sql)){
        $listado = $conn->restantesRegistros();
       
        $miSmarty->assign("datos", $listado);
        
    }
    $miSmarty->assign("admin", $_SESSION["usuarioLogueado"]["es_administrador"]);
    $miSmarty->display("prueba.tpl");

    
}
else{
    echo $conn->ultimoError();
}


//$miSmarty->display("prueba.tpl");



?>