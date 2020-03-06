<?php

require_once("conexionBD/class.Conexion.BD.php");
require_once("tmp/configs/configuracion.php");


define('TEMPLATE_DIR', $_SERVER['DOCUMENT_ROOT'] . './CarteleraCine/templates/');
define('COMPILER_DIR', $_SERVER['DOCUMENT_ROOT'] . './CarteleraCine/tmp/templates_c/');
define('CONFIG_DIR', $_SERVER['DOCUMENT_ROOT'] . './CarteleraCine/tmp/config/');
define('CACHE_DIR', $_SERVER['DOCUMENT_ROOT'] . './CarteleraCine/tmp/cache/');
$id = $_POST["id"];
$pagina = (int)$_POST["pagina"];
if($pagina <= 0){
    $pagina = 1;
}
$conn = new ConexionBD(MOTOR, SERVIDOR, BASE, USUARIO, CLAVE);

$respuesta = array("status"=>"OK",
                   "data"=>array(),
                   "ultima" => 0);
$conn->conectar();
if($conn){
    $sql = "SELECT COUNT(*) as cantidad FROM comentarios";
    $parametros = array(); 
    
    //Ejecuto la consulta con los parámetros
    $conn->consulta($sql, $parametros);   
    $fila = $conn->siguienteRegistro();

    $ultima = ceil($fila['cantidad']/CANTXPAG);
}

if($conn->conectar()){
    
    $sql2 = "SELECT comentarios.mensaje,comentarios.fecha FROM comentarios WHERE comentarios.id_pelicula = :id AND comentarios.estado='APROBADO' ORDER BY fecha desc LIMIT :inicio,6";
    
    $parametros = array();
    $parametros[0]=array("id", $id, "int");
    $parametros[1] = array("inicio",($pagina-1)*6,"int",0);
    $conn->consulta($sql2,$parametros);
    $listado = $conn->restantesRegistros();
    $respuesta["status"]="OK";
    $respuesta["data"]= $listado;
    $respuesta["ultima"]= $ultima;
}
   
echo json_encode($respuesta);
