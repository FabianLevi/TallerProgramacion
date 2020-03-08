<?php

session_start();
echo "<h1>" . $_SESSION['mensaje'] . "</h1>";

echo "<a href='index.php'>Volver al Inicio</a>";

?>