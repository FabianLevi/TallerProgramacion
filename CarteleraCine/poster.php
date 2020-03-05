<?php

require_once('smarty/libs/Smarty.class.php');
require_once("conexionBD/class.Conexion.BD.php");
require_once("tmp/configs/configuracion.php");

$id = $_GET["id"];
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


$conn = new ConexionBD(MOTOR, SERVIDOR, BASE, USUARIO, CLAVE);
if ($conn->conectar()) {

$sql = "SELECT peliculas.id,peliculas.youtube_trailer,peliculas.director,peliculas.resumen,peliculas.fecha_lanzamiento,peliculas.fotos,peliculas.titulo,peliculas.id_genero,generos.id,generos.nombre FROM peliculas,generos WHERE peliculas.id = :id AND generos.id=:id";
$conn->consulta($sql,array(
        array("id", $id, "string"),
    ));
}
$listado = $conn->siguienteRegistro();
$miSmarty->assign("pelicula", $listado);
//$miSmarty->assign("idPelicula",$id);
//if ($conn->conectar()) {
//
//$sql2 = "SELECT comentarios.mensaje FROM comentarios WHERE comentarios.id_pelicula = :id AND comentarios.estado='APROBADO'";
//$conn->consulta($sql2,array(
//        array("id", $id, "string"),
//    ));
//}
//$listado2 = $conn->restantesRegistros();
//$miSmarty->assign("comentarios", $listado2);

if ($conn->conectar()) {

$sql3 = "SELECT elencos.nombre FROM elencos WHERE elencos.id_pelicula = :id";
$conn->consulta($sql3,array(
        array("id", $id, "string"),
    ));
}
$listado3 = $conn->restantesRegistros();
$miSmarty->assign("elenco", $listado3);

$miSmarty->display("poster.tpl");

?>