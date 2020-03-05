<?php

require_once("conexionBD/class.Conexion.BD.php");
require_once("tmp/configs/configuracion.php");
$pagina = (int)$_POST["pagina"];
if($pagina == 0){
    $pagina = 1;
}

$conn = new ConexionBD(MOTOR, SERVIDOR, BASE, USUARIO, CLAVE);

if($conn->conectar()){
    $sql = "SELECT peliculas.fecha_lanzamiento,peliculas.fotos,peliculas.titulo,peliculas.id_genero,generos.id,generos.nombre FROM peliculas,generos  WHERE peliculas.id_genero = generos.id ORDER BY fecha_lanzamiento desc LIMIT :inicio,6";
    
    
    $parametros = array();
    $parametros[0] = array("inicio",($pagina-1)*6,"int",0);
    
   
    if($conn->consulta($sql,$parametros)){
        $listado = $conn->restantesRegistros();
        //$sql2 = "SELECT generos WHERE id_genero = $listado";
        
        $respuesta =  array("status"=>"OK", "data"=>$listado);
    }
    else{
        $respuesta = array("status"=>"ERROR");
    }
}
else{
    $respuesta = array("status"=>"ERROR");
}

echo json_encode($respuesta);
