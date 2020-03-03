<?php

require_once("conexionBD/class.Conexion.BD.php");
require_once("tmp/configs/configuracion.php");
$pagina = (int)$_POST["pagina"];
if($pagina == 0){
    $pagina = 1;
}

$conn = new ConexionBD(MOTOR, SERVIDOR, BASE, USUARIO, CLAVE);

if($conn->conectar()){
    $sql = "SELECT * FROM peliculas";
    $sql .= " LIMIT :inicio,6";
    
    $parametros = array();
    $parametros[0] = array("inicio",($pagina-1)*6,"int",0);
    
    if($conn->consulta($sql,$parametros)){
        $listado = $conn->restantesRegistros();
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
