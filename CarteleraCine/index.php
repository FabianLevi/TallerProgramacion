
<?php
//Incluyo la clase de Smarty
require_once("smarty/libs/Smarty.class.php");

//Creo un objeto template
$miSmarty = new Smarty();

//Despliego el template
$miSmarty->display("index.tpl");

?>