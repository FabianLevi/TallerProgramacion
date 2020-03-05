<?php

require_once("conexionBD/class.Conexion.BD.php");
require_once("tmp/configs/configuracion.php");
$pagina = (int)$_POST["pagina"];
if($pagina == 0){
    $pagina = 1;
}

$conn = new ConexionBD(MOTOR, SERVIDOR, BASE, USUARIO, CLAVE);

$respuesta = array("status"=>"OK",
                   "data"=>array(),
                   "ultima" => 0);
$conn->conectar();
if($conn){
    $sql = "SELECT COUNT(*) as cantidad FROM peliculas";
    $parametros = array(); 
    
    //Ejecuto la consulta con los parámetros
    $conn->consulta($sql, $parametros);   
    $fila = $conn->siguienteRegistro();

    $ultima = ceil($fila['cantidad']/CANTXPAG);
}

$conn->conectar();
    $sql = "SELECT peliculas.id,peliculas.fecha_lanzamiento,peliculas.fotos,peliculas.titulo,peliculas.id_genero,generos.nombre "
            . "FROM peliculas,generos  WHERE peliculas.id_genero = generos.id ORDER BY fecha_lanzamiento desc LIMIT :inicio,6";
    
    
    $parametros = array();
    $parametros[0] = array("inicio",($pagina-1)*6,"int",0);
    
   
    if($conn->consulta($sql,$parametros)){
        $listado = $conn->restantesRegistros();
        //$sql2 = "SELECT generos WHERE id_genero = $listado";
        
        $respuesta["status"]="OK";
        $respuesta["data"]= $listado;
        $respuesta["ultima"]= $ultima;
    }
    else{
        $respuesta = array("status"=>"ERROR");
    }



echo json_encode($respuesta);
