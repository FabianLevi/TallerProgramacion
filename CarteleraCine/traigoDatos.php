<?php
session_start();
require_once("conexionBD/class.Conexion.BD.php");
require_once("tmp/configs/configuracion.php");

$correo = $_POST["txtCorreo"];
$contra = $_POST["txtContra"];

$conn = new ConexionBD(MOTOR, SERVIDOR, BASE, USUARIO, CLAVE);

if($conn->conectar()){
     $sql = "SELECT * FROM usuarios";
     $sql .= " WHERE usuario";

     $parametros = array();
     $parametros[0] = array("id",3,"int","50");
     $parametros[1] = array("em",$correo,"string","50");
     $parametros[2] = array("contra",$destino,"string","255");
     $parametros[3] = array("em",$nombre,"string","50");

     if($conn->consulta($sql, $parametros)){
        
     }
     else{
         $_SESSION["mensaje"]="Error de Consulta";
    header('location:errores.php');
    }
}else{
    $_SESSION["mensaje"]="Error de Conexión";
    header('location:errores.php');
}


